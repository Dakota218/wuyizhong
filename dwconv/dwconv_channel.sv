module dwconv_channel (
    input clk,
    input rst_n,
    input in_valid,
    input logic signed [143:0] weight,
    input  logic signed [15:0] in_data,
    input  logic signed[15:0] bias,
    input logic [1:0] state,
    input logic [7:0] col,
    input logic [6:0] row,
    input logic [7:0] in_col,
    input logic [6:0] in_row,
    input logic [8:0] in_count,
    input logic [16:0] addr_cnt,
    // input logic [6:0] in_count,
    output logic [3:0] r_count,
    output logic out_valid,
    output logic signed [20:0] sum
);

typedef enum logic [1:0] {
    IDLE,
    INIT_ZERO,
    INPUT,
    OUTPUT
} state_t;

logic signed [15:0] weight_reg[0:8], weight_reg_n[0:8], weight_0, weight_1, weight_2, weight_3, weight_4, weight_5, weight_6, weight_7, weight_8;
logic signed [15:0] /*in_data_reg[0:255][0:354], in_data_reg_n[0:255][0:354], */in_data_reg[0:8], bias_reg[0:1], bias_reg_n[0:1]/* in_data_354, in_data_353, in_data_352, in_data_178, in_data_177, in_data_176, in_data_2, in_data_1, in_data_0*/;
logic signed [31:0] mul[0:8], mul_n[0:8], mul_closed[0:8];
logic [7:0] col_reg[0:1], col_reg_n[0:1];
logic [6:0] row_reg;
logic [1:0] head_tail;
logic out_valid_n, in_valid_reg;

logic signed [31:0] bias_extended;
logic signed [28:0] sum_temp;
logic signed [20:0] sum_n;

logic [18:0] memory_ptr, memory_ptr_n, addr, addr_circle;
logic [3:0] r_count_n;

parameter GROUP_SIZE = 355;
// 訊號宣告
logic [16:0] base_addr, base_addr_n;   // 該組的起始位址
logic [8:0]  offset_cnt, offset_cnt_n, offset_cnt_reg, offset_cnt_reg_n;  // 組內的偏移量 (0~354)，9 bit 夠存 355
logic [16:0] final_addr;  // 最終送給 SRAM 的位址


assign memory_ptr_n = (in_valid_reg)? ((in_count - 1) * GROUP_SIZE) + in_col + 176 * in_row: memory_ptr;
assign addr_circle = memory_ptr_n + ((in_valid_reg)? 0 : r_count);

assign base_addr_n = (in_valid_reg)? ((in_count == 1)? 0 : ((base_addr == 90525)? 0 : base_addr + 355)) : base_addr;
// assign offset_cnt_n = (in_valid_reg)? ((176 * in_row) + in_col) % GROUP_SIZE : ((offset_cnt == GROUP_SIZE - 1)? 0 : offset_cnt + 1);
// assign offset_cnt_n = (in_valid_reg)? ((col == 1 && row == 0 && in_count == 1 && r_count == 0)? 177 : (((offset_cnt_reg + (in_count == 1)) == 356)? 0 : (offset_cnt_reg + (in_count == 1)))) : ((offset_cnt == 0)? 355 : offset_cnt - 1);
always_comb begin
    // 1. 先設定預設值，避免 latch (這行通常是 offset_cnt_reg 或保持原值)
    offset_cnt_n = offset_cnt_reg; 

    // 2. 最外層判斷：in_valid_reg
    if (in_valid_reg) begin
        
        // 特殊條件判斷：啟動初始值
        if (col == 1 && row == 0 && in_count == 1 && r_count == 0) begin
            offset_cnt_n = 177;
        end else begin
            // 一般累加邏輯
            // 這裡原本邏輯是：如果 (當前值 + 增量) == 356，則歸零
            // 增量邏輯是：如果 in_count == 1 則 +1，否則 +0
            
            logic [8:0] next_val_temp; // 宣告一個暫存變數方便理解
            // next_val_temp = offset_cnt_reg + (in_count == 256 );///////
            next_val_temp = offset_cnt_reg + (in_count == 1 && r_count == 0 );

            if (next_val_temp == 356) begin
                offset_cnt_n = 0;
            end else begin
                offset_cnt_n = next_val_temp;
            end
        end

    end else begin
        // 檢查是否倒數到 0
        if (offset_cnt == 0) begin // 注意：你原程式碼這裡是用 offset_cnt 而非 offset_cnt_reg，請確認變數是否正確
            offset_cnt_n = 355;
        end else begin
            offset_cnt_n = offset_cnt - 1;
        end
    end
end
assign offset_cnt_reg_n = (r_count == 1 && base_addr == 0)? offset_cnt : offset_cnt_reg;
always_comb begin
    case(state_t'(state))
        IDLE, INIT_ZERO: addr = addr_cnt;
        INPUT:     addr = addr_circle;
        default:   addr = 0;
    endcase
end

assign r_count_n = (in_valid)? 0 : r_count + 1;
sram_16x90880_simple #(
        .DW(16), 
        .DEPTH(90880), 
        .AW(17)
    ) u_sram (
        .clk   (clk),
        .rst_n (rst_n),
        .W     (in_valid),    // 連接控制訊號
        .A     (addr),  // 連接位址
        .D     (in_data), // 連接寫入資料
        .Q     (in_data_reg[8])  // 接收讀出資料
    );



// always_comb begin
//     in_data_0 = in_data_reg[0][0];
//     in_data_1 = in_data_reg[0][1];  
//     in_data_2 = in_data_reg[0][2];
//     in_data_176 = in_data_reg[0][176];
//     in_data_177 = in_data_reg[0][177];
//     in_data_178 = in_data_reg[0][178];
//     in_data_352 = in_data_reg[0][352];
//     in_data_353 = in_data_reg[0][353];
//     in_data_354 = in_data_reg[0][354];

//     weight_0 = weight_reg[0];
//     weight_1 = weight_reg[1];
//     weight_2 = weight_reg[2];
//     weight_3 = weight_reg[3];
//     weight_4 = weight_reg[4];
//     weight_5 = weight_reg[5];
//     weight_6 = weight_reg[6];
//     weight_7 = weight_reg[7];
//     weight_8 = weight_reg[8];
// end

assign out_valid = (r_count == 3 && state != IDLE && !(col == 1 && row == 0 && in_count == 1));
// assign out_valid_n = (col_reg == 1 && in_count == 2)? 1 : out_valid;
// assign out_valid_n = (col_reg == 1 && in_count == 2)? 1 : ((col_reg == 176 &&  row_reg == 127)? 0 : out_valid);
assign bias_extended = {{8{bias_reg[1][15]}}, bias_reg[1], 8'b0};
assign sum_temp = (mul_closed[0] + mul_closed[1] + mul_closed[2] + mul_closed[3] + mul_closed[4] + mul_closed[5] + mul_closed[6] + mul_closed[7] + mul_closed[8] + bias_extended);
always_comb begin
    sum_n = sum_temp>>>8;

    if(sum_temp[7])begin
        if(sum_temp[6:0] || sum_temp[8])begin
            sum_n = (sum_temp>>>8) + 1;
        end
    end
end
// assign sum_n = (mul_closed[0] + mul_closed[1] + mul_closed[2] + mul_closed[3] + mul_closed[4] + mul_closed[5] + mul_closed[6] + mul_closed[7] + mul_closed[8] + bias_extended) >>> 8;

always_comb begin

    for (int i = 0; i<9; i++)begin
        weight_reg_n[i] = (in_valid)? weight[16*i +: 16] : weight_reg[i];
    end

    mul_n[0] = in_data_reg[0] * weight_reg[0];
    mul_n[1] = in_data_reg[1] * weight_reg[1];
    mul_n[2] = in_data_reg[2] * weight_reg[2];
    mul_n[3] = in_data_reg[3] * weight_reg[3];
    mul_n[4] = in_data_reg[4] * weight_reg[4];
    mul_n[5] = in_data_reg[5] * weight_reg[5];
    mul_n[6] = in_data_reg[6] * weight_reg[6];
    mul_n[7] = in_data_reg[7] * weight_reg[7];
    mul_n[8] = in_data_reg[8] * weight_reg[8];
    // mul_n[0] = in_data_reg[0][0] * weight_reg[0];
    // mul_n[1] = in_data_reg[0][1] * weight_reg[1];
    // mul_n[2] = in_data_reg[0][2] * weight_reg[2];
    // mul_n[3] = in_data_reg[0][176] * weight_reg[3];
    // mul_n[4] = in_data_reg[0][177] * weight_reg[4];
    // mul_n[5] = in_data_reg[0][178] * weight_reg[5];
    // mul_n[6] = in_data_reg[0][352] * weight_reg[6];
    // mul_n[7] = in_data_reg[0][353] * weight_reg[7];
    // mul_n[8] = in_data_reg[0][354] * weight_reg[8];

    mul_closed[0] = (head_tail == 2'b10)? 0 : mul[0];
    mul_closed[1] = mul[1];
    mul_closed[2] = (head_tail == 2'b01)? 0 : mul[2];
    mul_closed[3] = (head_tail == 2'b10)? 0 : mul[3];
    mul_closed[4] = mul[4];
    mul_closed[5] = (head_tail == 2'b01)? 0 : mul[5];
    mul_closed[6] = (head_tail == 2'b10)? 0 : mul[6];
    mul_closed[7] = mul[7];
    mul_closed[8] = (head_tail == 2'b01)? 0 : mul[8];
end

always_comb begin
    col_reg_n[0] = (in_valid)? col : col_reg[0];
    col_reg_n[1] = (in_valid)? col_reg[0] : col_reg[1];

    bias_reg_n[0] = (in_valid)? bias : bias_reg[0];
    bias_reg_n[1] = (in_valid)? bias_reg[0] : bias_reg[1];
end

always_comb begin
    case (col_reg[1])
        0:   head_tail = 2'b11;
        1:   head_tail = 2'b10;
        176: head_tail = 2'b01;
        default: head_tail = 2'b00;
    endcase
end

// always_comb begin
//         in_data[0] = 
//         in_data_reg_n[0][354] = (in_valid)? in_data : 0;
//         for (int j = 0; j<354; j++)begin
//             in_data_reg_n[0][j] = in_data_reg[1][j+1];
//         end
//         for (int i = 1; i<255; i++)begin
//             for (int j = 0; j<355; j++)begin
//                 in_data_reg_n[i][j] = in_data_reg[i+1][j];
//             end
//         end
//         for (int j = 0; j<355; j++)begin
//             in_data_reg_n[255][j] = in_data_reg[0][j];
//         end
// end

always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        bias_reg[0] <= 0;
        bias_reg[1] <= 0;
        col_reg[0] <= 0; 
        col_reg[1] <= 0;  
        row_reg <= 0;
        // out_valid <= 0;

        for (int i = 0; i<9; i++)begin
            weight_reg[i] <= 0;
            mul[i] <= 0;
        end
        for (int i=0; i<8; i++) begin
            in_data_reg[i] <= 0;
        end
        // for (int i = 0; i<256; i++)begin
        //     for (int j = 0; j<355; j++)begin
        //         in_data_reg[i][j] <= 0;
        //     end
        // end
        sum <= 0;

        r_count <= 0;
        memory_ptr <= 0;
        in_valid_reg <= 0;
        base_addr <= 0;
        offset_cnt <= 0;
        offset_cnt_reg <= 0;

    end else begin
        bias_reg[0] <= bias_reg_n[0];
        bias_reg[1] <= bias_reg_n[1];

        col_reg[0] <= col_reg_n[0]; 
        col_reg[1] <= col_reg_n[1]; 

        row_reg <= row;
        // out_valid <= out_valid_n;

        for (int i = 0; i<9; i++)begin
            weight_reg[i] <=  weight_reg_n[i];
            mul[i] <= mul_n[i];
        end

        for (int i=0; i<8; i++) begin
            in_data_reg[i] <= in_data_reg[i+1];
        end
        // for (int i = 0; i<256; i++)begin
        //     for (int j = 0; j<355; j++)begin
        //         in_data_reg[i][j] <= in_data_reg_n[i][j];
        //     end
        // end

        sum <= sum_n;

        r_count <= r_count_n;
        memory_ptr <= memory_ptr_n;
        in_valid_reg <= in_valid;
        base_addr <= base_addr_n;
        offset_cnt <= offset_cnt_n;
        offset_cnt_reg <= offset_cnt_reg_n;
    end
end



endmodule