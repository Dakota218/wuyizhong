module dwconv_channel #(
    parameter CHANNELS  = 256, // 通道數
    parameter IMG_WIDTH = 176, // 影像寬度
    parameter DATA_WIDTH= 16   // 數據位寬
)(
    input  logic clk,
    input  logic rst_n,
    input  logic in_valid,
    input  logic signed [143:0] weight, // 9 * 16 bits (假設所有 Channel 共用權重，或外部切換)
    input  logic signed [15:0]  in_data,
    input  logic signed [15:0]  bias,
    input  logic [7:0] col,
    input  logic [6:0] row,
    input  logic [8:0] in_count,
    output logic out_valid,
    output logic signed [20:0] sum
);

    // --- 計算總深度 ---
    // Line Buffer 需要儲存完整的 "一行多通道" 數據
    localparam LB_DEPTH = IMG_WIDTH * CHANNELS;
    localparam LB_ADDR_WIDTH = $clog2(LB_DEPTH);

    // --- 權重與偏置 ---
    logic signed [15:0] weight_reg[0:8], weight_temp[0:8];
    logic signed [15:0] bias_reg[0:2];
    logic signed [31:0] bias_extended;

    // --- Line Buffer (SRAM) 相關 ---
    // 讀寫指針需要足夠大以涵蓋 176*256
    logic [LB_ADDR_WIDTH-1:0] rw_ptr; 
    logic signed [15:0] line0_dout, line1_dout; // SRAM 讀出的數據
    logic signed [15:0] in_data_d; // 輸入數據延遲 (對齊SRAM延遲)

    // --- 3x3 Window ---
    // w00 w01 w02 (Top)
    // w10 w11 w12 (Mid)
    // w20 w21 w22 (Bot)
    // 注意：垂直方向由 SRAM 處理，水平方向需要 Shift Register 處理
    logic signed [15:0] win_top_0, win_top_1, win_top_2; // Row 0 (Top - from LB1)
    logic signed [15:0] win_mid_0, win_mid_1, win_mid_2; // Row 1 (Mid - from LB0)
    logic signed [15:0] win_bot_0, win_bot_1, win_bot_2; // Row 2 (Bot - from Input)

    // --- 運算相關 ---
    logic signed [31:0] mul[0:8], mul_n[0:8], mul_closed[0:8];
    logic signed [28:0] sum_temp;
    logic signed [20:0] sum_n;
    
    // --- 控制信號流水線 ---
    logic [7:0] col_reg, col_d, col_reg_reg;
    logic [6:0] row_reg, row_d;
    logic [1:0] head_tail;
    logic out_valid_n;
    logic signed [15:0] lb1_wdata;
    // --------------------------------------------------------
    // 1. Large SRAM Instantiation (Line Buffers)
    // --------------------------------------------------------
    // 容量：176 * 256 = 45056 words
    // 這種大小通常會被合成器映射為 BRAM (Block RAM)
    
    sram_buffer_large #(.DATA_WIDTH(16), .DEPTH(LB_DEPTH), .ADDR_WIDTH(LB_ADDR_WIDTH)) lb0 (
        .clk(clk), .rst_n(rst_n), .we(in_valid), 
        .waddr(rw_ptr), .wdata(in_data),   
        .raddr(rw_ptr), .q(line0_dout)     // 讀出: 上一行 (Row N-1) 的 同一 Channel 像素
    );

    sram_buffer_large #(.DATA_WIDTH(16), .DEPTH(LB_DEPTH), .ADDR_WIDTH(LB_ADDR_WIDTH)) lb1 (
        .clk(clk), .rst_n(rst_n), .we(in_valid), 
        .waddr(rw_ptr), .wdata(lb1_wdata), 
        .raddr(rw_ptr), .q(line1_dout)      // 讀出: 上上行 (Row N-2) 的 同一 Channel 像素
    );
    assign lb1_wdata = (row_d == 0)?0 : line0_dout;
    // --------------------------------------------------------
    // 2. Horizontal Delay Logic (Shift Registers)
    // --------------------------------------------------------
    // 因為數據是 Channel 交錯的 (C0, C1, ... C255)，
    // 水平方向的 "前一個像素" (Left Pixel) 其實是 256 個 cycle 前的數據。
    // 我們需要為每一行 (Top, Mid, Bot) 準備 Shift Registers。
    
    // 定義一個 Shift Register 模組或使用陣列
    // 延遲深度 = CHANNELS (256)
    // 輸入是 Right (Col 2)，輸出是 Center (Col 1)，再輸出是 Left (Col 0)
    
    // Top Row Delays
    delay_line #(.WIDTH(16), .DELAY(CHANNELS)) dl_top_1 (.clk(clk), .rst_n(rst_n), .en(in_valid), .din(win_top_2), .dout(win_top_1));
    delay_line #(.WIDTH(16), .DELAY(CHANNELS)) dl_top_0 (.clk(clk), .rst_n(rst_n), .en(in_valid), .din(win_top_1), .dout(win_top_0));
    
    // Mid Row Delays
    delay_line #(.WIDTH(16), .DELAY(CHANNELS)) dl_mid_1 (.clk(clk), .rst_n(rst_n), .en(in_valid), .din(win_mid_2), .dout(win_mid_1));
    delay_line #(.WIDTH(16), .DELAY(CHANNELS)) dl_mid_0 (.clk(clk), .rst_n(rst_n), .en(in_valid), .din(win_mid_1), .dout(win_mid_0));

    // Bot Row Delays
    delay_line #(.WIDTH(16), .DELAY(CHANNELS)) dl_bot_1 (.clk(clk), .rst_n(rst_n), .en(in_valid), .din(win_bot_2), .dout(win_bot_1));
    delay_line #(.WIDTH(16), .DELAY(CHANNELS)) dl_bot_0 (.clk(clk), .rst_n(rst_n), .en(in_valid), .din(win_bot_1), .dout(win_bot_0));


    // --------------------------------------------------------
    // 3. Main Control Logic
    // --------------------------------------------------------
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rw_ptr <= 0;
            in_data_d <= 0;
            
            // Clear Window Inputs (Column 2 - Rightmost)
            win_top_2 <= 0; win_mid_2 <= 0; win_bot_2 <= 0;
            col_reg_reg <= 0;
            col_reg <= 0; row_reg <= 0;
            col_d <= 0; row_d <= 0;
            out_valid <= 0;
            
            for(int i=0; i<9; i++) begin
                weight_reg[i] <= 0;
                weight_temp[i] <= 0;
                mul[i] <= 0;
            end
            sum <= 0;
            bias_reg[0] <= 0; bias_reg[1] <= 0; bias_reg[2] <= 0;

        end else begin
            // 讀寫指針控制 (0 ~ 45055)
            if (in_valid) begin
                if (rw_ptr == LB_DEPTH - 1)
                    rw_ptr <= 0;
                else
                    rw_ptr <= rw_ptr + 1;
            end

            // 對齊 SRAM 的 Read Latency (1 cycle)
            if (in_valid) in_data_d <= in_data;

            // Window Column 2 (Rightmost) Update
            // 這裡連接 SRAM 的輸出與當前輸入
            // 當時鐘上升沿，SRAM 輸出舊數據 (valid)，in_data_d 也是舊數據 (valid)
            if (in_valid) begin
                win_top_2 <= line1_dout; // Row N-2
                win_mid_2 <= line0_dout; // Row N-1
                win_bot_2 <= in_data_d;  // Row N (Current)
            end

            // Pipeline 延遲控制信號
            col_d <= col;
            col_reg <= col_d; 
            col_reg_reg <= col_reg;
            row_d <= row;
            row_reg <= row_d;
            
            bias_reg[0] <= bias;
            bias_reg[1] <= bias_reg[0];
            bias_reg[2] <= bias_reg[1];
            // 運算 Pipeline
            for (int i = 0; i < 9; i++) begin
                weight_reg[i] <= weight_temp[i]; 
                weight_temp[i] <= weight[16*i +: 16];
                mul[i] <= mul_n[i];
            end
            sum <= sum_n;
            out_valid <= out_valid_n; 
        end
    end

    // --------------------------------------------------------
    // 4. Combinational Logic (Math & Padding)
    // --------------------------------------------------------
    
    always_comb begin
        // Top Row
        mul_n[0] = win_top_0 * weight_reg[0];
        mul_n[1] = win_top_1 * weight_reg[1];
        mul_n[2] = win_top_2 * weight_reg[2];
        // Mid Row
        mul_n[3] = win_mid_0 * weight_reg[3];
        mul_n[4] = win_mid_1 * weight_reg[4];
        mul_n[5] = win_mid_2 * weight_reg[5];
        // Bot Row
        mul_n[6] = win_bot_0 * weight_reg[6];
        mul_n[7] = win_bot_1 * weight_reg[7];
        mul_n[8] = win_bot_2 * weight_reg[8];
    end

    // Padding Logic (依賴 col_reg，需確保 col_reg 與 window 中心對齊)
    // 如果 col_reg 是輸入的 col 延遲而來，它現在對應的是 win_xx_2 (最新數據) 的位置?
    // 通常 col_reg 應該指示 win_xx_1 (中心點) 的位置。
    // 由於我們加了 CHANNELS 延遲，這裡的 Padding 邏輯可能需要針對 Channel 調整
    // 但假設 col 是針對 "當前 Channel" 的座標，則邏輯不變。
    
    always_comb begin
        case (col_reg_reg)
            0:   head_tail = 2'b11; // Left Pad
            1:   head_tail = 2'b10;
            // 注意: 這裡的 176 取決於你的圖像寬度參數
            IMG_WIDTH: head_tail = 2'b01; // Right Pad
            default: head_tail = 2'b00;
        endcase
    end

    always_comb begin
        mul_closed[0] = (head_tail == 2'b10) ? 0 : mul[0];
        mul_closed[1] = mul[1];
        mul_closed[2] = (head_tail == 2'b01) ? 0 : mul[2];
        mul_closed[3] = (head_tail == 2'b10) ? 0 : mul[3];
        mul_closed[4] = mul[4];
        mul_closed[5] = (head_tail == 2'b01) ? 0 : mul[5];
        mul_closed[6] = (head_tail == 2'b10) ? 0 : mul[6];
        mul_closed[7] = mul[7];
        mul_closed[8] = (head_tail == 2'b01) ? 0 : mul[8];
    end

    assign bias_extended = {{8{bias_reg[2][15]}}, bias_reg[2], 8'b0};
    
    always_comb begin
        sum_temp = (mul_closed[0] + mul_closed[1] + mul_closed[2] + 
                    mul_closed[3] + mul_closed[4] + mul_closed[5] + 
                    mul_closed[6] + mul_closed[7] + mul_closed[8] + bias_extended);
        sum_n = sum_temp >>> 8;
        if(sum_temp[7] && (sum_temp[6:0] != 0 || sum_temp[8]))
             sum_n = (sum_temp >>> 8) + 1;
    end

    // 需根據新的延遲鏈調整 Valid 邏輯，這裡僅為示範
    assign out_valid_n = (col_reg == 1 && in_count == 3)? 1 : ((col_reg == 176 &&  row_reg == 127)? 0 : out_valid);

endmodule

// --------------------------------------------------------
// Helper Modules
// --------------------------------------------------------

// 大型 SRAM 模型
module sram_buffer_large #(
    parameter DATA_WIDTH = 16,
    parameter DEPTH = 45056,
    parameter ADDR_WIDTH = 16
)(
    input  logic clk,
    input  logic we,
    input  logic rst_n,
    input  logic [ADDR_WIDTH-1:0] waddr,
    input  logic [DATA_WIDTH-1:0] wdata,
    input  logic [ADDR_WIDTH-1:0] raddr,
    output logic [DATA_WIDTH-1:0] q
);
    // 使用 reg 陣列，合成工具會自動映射到 Block RAM (BRAM)
    (* ram_style = "block" *) logic [DATA_WIDTH-1:0] ram [0:DEPTH-1];
    
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            /*for (int i = 0; i < DEPTH; i++) begin
                ram[i] <= 0;
            end*/
            q <= 0;
        end else if (we) begin
            ram[waddr] <= wdata;
            q <= ram[raddr];
        end
    end
endmodule

// 延遲鏈 (Shift Register) - 用於水平方向的 Channel 延遲
module delay_line #(
    parameter WIDTH = 16,
    parameter DELAY = 256
)(
    input  logic clk,
    input  logic rst_n,      // 新增 reset
    input  logic en,
    input  logic [WIDTH-1:0] din,
    output logic [WIDTH-1:0] dout
);
    logic [WIDTH-1:0] shift_reg [0:DELAY-1];

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // 重置時清空內容，避免 X 傳播
            for (int i = 0; i < DELAY; i++) begin
                shift_reg[i] <= 0;
            end
        end else if (en) begin
            shift_reg[0] <= din;
            for (int i = 1; i < DELAY; i++) begin
                shift_reg[i] <= shift_reg[i-1];
            end
        end
    end
    
    assign dout = shift_reg[DELAY-1];
endmodule