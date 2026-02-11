`timescale 1ns/1ps

module PATTERN (
    // Clock 與 Reset
    input  logic clk,
    input  logic rst_n,

    // 輸出 (送往 DUT)
    output logic             in_valid,
    output logic signed [15:0] in_data,
    output logic [15:0] bias,
    output logic signed [143:0] weight, // 16 * 9 = 144 bit

    // 輸入 (來自 DUT)
    input  logic             out_valid,
    input  logic signed [20:0] sum // 256 * 21 = 5376 bit
);

    // =================================================================
    // 參數與內部變數
    // =================================================================
    parameter CHANNELS  = 256;  // 通道數 (Depthwise: In=Out)
    parameter K_SIZE    = 3;  // Kernel Size (3x3)
    localparam TOTAL_RAM_SIZE = K_SIZE * K_SIZE * CHANNELS;
    parameter NUM_WEIGHTS_PER_CYCLE = 256;
    parameter WEIGHT_PATTERN_CYCLES = 9;

    // 權重檔案的預載入記憶體
    reg signed [15:0] tb_full_weight_ram [0:TOTAL_RAM_SIZE-1]; // 2304 = 256*9
    reg signed [15:0] tb_full_bias_ram   [0:CHANNELS-1];       // 256 個 bias

    // 檔案處理
    integer input_file;
    integer golden_file;
    integer weight_file;
    integer bias_file;

    // 檢查器變數
    static integer error_count = 0;
    static integer test_count = 0;
    logic signed [15:0] expected_sum;
    
    // 迴圈計數器
    integer j; 

    logic golden_file_is_done = 1'b0;

    // =================================================================
    // 激勵產生 (Stimulus Driver) - 單一主控制器
    // =================================================================
    initial begin
        $display("[%0t] PATTERN: 測試激勵 (Burst Mode) 已啟動...", $time);

        // (A) 初始化所有輸出
        in_valid     = 1'b0;
        in_data      = 16'h0000;
        //w_load_valid = 1'b0;
        weight       = 143'b0;
        bias         = 16'h0000;

        // (B-1) 階段 0: 預先載入權重 (Time 0)
        weight_file = $fopen("../files/dwconv_weights_hex.txt", "r");
        if (weight_file == 0) begin $display("錯誤：無法開啟 weights_hex.txt"); $finish; end
        
        $display("階段 0: 預先載入 %0d 筆權重到 TB RAM...", TOTAL_RAM_SIZE);
        begin
            static integer read_count = 0;
            while (read_count < TOTAL_RAM_SIZE&& !$feof(weight_file)) begin
                if ($fscanf(weight_file, "%h", tb_full_weight_ram[read_count]) == 1) begin
                    read_count = read_count + 1;
                end
            end
            if (read_count < TOTAL_RAM_SIZE) begin
                $display("錯誤: 權重檔案 'weights_hex.txt' 太小。需要 %0d, 實際 %0d", TOTAL_RAM_SIZE, read_count);
                $finish;
            end
            $display("權重預載入完成。");
            $fclose(weight_file);
        end

        // (B-2) 預先載入 bias
        bias_file = $fopen("../files/dwconv_bias_hex.txt", "r");
        if (bias_file == 0) begin
            $display("錯誤：無法開啟 dwconv_bias_hex.txt");
            $finish;
        end

        $display("階段 0: 預先載入 %0d 筆 bias 到 TB RAM...", CHANNELS);
        begin
            integer read_count_bias = 0;
            while (read_count_bias < CHANNELS && !$feof(bias_file)) begin
                if ($fscanf(bias_file, "%h", tb_full_bias_ram[read_count_bias]) == 1) begin
                    read_count_bias = read_count_bias + 1;
                end
            end
            if (read_count_bias < CHANNELS) begin
                $display("錯誤: bias 檔案太小。需要 %0d, 實際 %0d", CHANNELS, read_count_bias);
                $finish;
            end
            $display("bias 預載入完成。");
            $fclose(bias_file);
        end
        
        // (C) 開啟 'in_data' 檔案
        input_file = $fopen("../files/tv_1_fc1_out_hex.txt", "r");
        if (input_file == 0) begin $display("錯誤：無法開啟 tv_1_fc1_out_hex.txt"); $finish; end

        // (D) 階段 1: 等待重置結束
        @(posedge clk);
        while (rst_n === 1'b0) begin
            @(posedge clk);
        end
        $display("階段 1: 重置完成。");
        repeat(5) @(negedge clk); // 稍微等待一下再開始

        // =================================================================
        // [修改點] 階段 1.5: 傳送 90800 筆 in_valid=1, in_data=0
        // =================================================================
        $display("[%0t] 階段 1.5: 開始傳送 90800 筆 Zero Padding (Valid=1, Data=0)...", $time);
        
        // 雖然你說 weight/bias 可以是 unknown，但設為 0 可以避免紅字 X 傳播
        weight = 144'd0;    
        bias   = 16'd0;

        repeat (90880) begin
            in_valid <= 1'b1;     // <--- 這裡改為 1
            in_data  <= 16'h0000; // 資料為 0
            
            // 這裡不更動 weight/bias，維持 0
            
            @(negedge clk);
        end

        $display("[%0t] 階段 1.5: 90800 筆 0 傳送結束，無縫接軌檔案資料。", $time);
        // =================================================================
        // (E) 階段 2：混合模式激勵 (前 45312 筆連續，之後 1 valid + 9 idle)
        begin
            integer weight_idx;
            integer bias_idx;
            integer status_in;
            integer total_sent_count; // 新增：紀錄總共發送了幾筆
            reg  signed [15:0] in_word;
            integer k;

            $display("階段 2: 啟動混合模式激勵 (前 45312 筆連續送)...");

            weight_idx = 0;
            bias_idx   = 0;
            total_sent_count = 0;

            while (!$feof(input_file)) begin
                // 1. 讀取資料
                status_in = $fscanf(input_file, "%h", in_word);
                if (status_in != 1) break;

                total_sent_count = total_sent_count + 1;

                // 2. 驅動有效資料
                in_valid      <= 1'b1;
                in_data       <= in_word;

                weight <= '0;
                for (k = 0; k < 9; k = k + 1) begin
                    weight[k*16 +: 16] <= tb_full_weight_ram[weight_idx + k];
                end

                bias <= tb_full_bias_ram[bias_idx];

                // 索引遞增邏輯
                weight_idx = (weight_idx + 9 >= TOTAL_RAM_SIZE) ? 0 : weight_idx + 9;
                bias_idx   = (bias_idx + 1 >= CHANNELS) ? 0 : bias_idx + 1;

                @(negedge clk); 

                // 3. 判斷是否需要進入「間隔 9 拍」模式
                // 當發送次數超過 45312 時，執行間隔邏輯
                if (total_sent_count > 45312) begin
                    in_valid <= 1'b0;
                    in_data  <= 16'h0000;
                    weight   <= '0;
                    bias     <= 16'h0000;

                    repeat (8) begin
                        @(negedge clk);
                    end
                end
                // 如果在 45312 筆內，迴圈會直接回到開頭送下一筆，達成「連續」效果
            end

            $display("[%0t] PATTERN: 輸入檔案讀取與發送完畢。共發送 %0d 筆。", $time, total_sent_count);
            in_valid <= 1'b0;
            $fclose(input_file);
        end
    end // 結束 initial (Stimulus)

    // =================================================================
    // 結果檢查器 (Output Checker)
    // =================================================================
    initial begin
        golden_file = $fopen("../files/tv_2_dwconv_out_hex.txt", "r");
        if (golden_file == 0) begin
            $display("錯誤：無法開啟 golden_file 'tv_2_dwconv_out_hex.txt'");
            $finish;
        end
    end


// =================================================================
    // 結果檢查器：固定檢查 4096 筆
    // =================================================================
    always @(negedge clk) begin
        if (rst_n == 1'b1) begin 
            
            // 1. 終止條件：當 test_count 達到 4096 代表 0~4095 筆都比對完了
            if (test_count >= 4096) begin
                $display("-------------------------------------------------");
                $display("[%0t] PATTERN: 已完成 4096 筆輸出比對。", $time);
                
                if (error_count == 0) begin
                    $display("    >> 恭喜! 所有 4096 筆測試皆通過! <<");
                end else begin
                    $display("    >> 測試失敗: 共發現 %0d 筆錯誤。 <<", error_count);
                end
                $display("-------------------------------------------------");
                
                $fclose(golden_file);
                $finish; 
            end

            // 2. 正常比對邏輯
            if (out_valid) begin
                // 從黃金檔讀取預期結果
                if ($fscanf(golden_file, "%h", expected_sum) == 1) begin
                    if (sum !== expected_sum) begin
                        $display("[%0t] PATTERN: *** 比對錯誤 *** (Test #%0d)", $time, test_count);
                        $display("    預期: Sum=%h (%d)", expected_sum, expected_sum);
                        $display("    得到: Sum=%h (%d)", sum, sum);
                        error_count <= error_count + 1;
                    end else begin
                        // 正確時顯示 (可選)
                        // $display("\033[1;32m[%0t] PATTERN: *** 比對正確 *** (Test #%0d)\033[0m", $time, test_count);
                    end
                    
                    // 每收到一筆 valid 就累加 count
                    test_count <= test_count + 1;
                end
            end
        end
    end
    

endmodule