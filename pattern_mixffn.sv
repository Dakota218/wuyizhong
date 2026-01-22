`timescale 1ns/1ps

module PATTERN (
    // Clock 與 Reset
    input  logic clk,
    input  logic rst_n,

    // 輸出 (送往 DUT)
    output logic             in_valid_fc1,
    output logic             in_valid_dwconv,
    output logic             in_valid_gelu,
    output logic             in_valid_fc2,
    output logic signed [9:0] in_data,
    output logic signed [15:0] bias,
    output logic signed [143:0] weight_conv, // 256 * 16 * 9 = 36864 bit
    output logic signed [2303:0] weight_fc1,
    output logic signed [511:0] weight_fc2,
    // 輸入 (來自 DUT)
    input logic             out_valid_fc1,
    input logic             out_valid_dwconv,
    input logic             out_valid_gelu,
    input  logic             out_valid,
    input  logic signed [15:0] sum
);

    // =================================================================
    // 參數與內部變數
    // =================================================================
    parameter CHANNELS  = 256;  // 通道數 (Depthwise: In=Out)
    parameter K_SIZE    = 3;  // Kernel Size (3x3)
    localparam TOTAL_RAM_SIZE_CONV = K_SIZE * K_SIZE * CHANNELS;
    parameter NUM_WEIGHTS_PER_CYCLE = 256;
    parameter WEIGHT_PATTERN_CYCLES = 9;
    parameter TOTAL_RAM_SIZE_FC = 16384;

    // 權重檔案的預載入記憶體
    reg signed [15:0] tb_full_weight_ram_conv [0:TOTAL_RAM_SIZE_CONV-1];
    reg signed [15:0] tb_full_weight_ram_fc1 [0:TOTAL_RAM_SIZE_FC-1];
    reg signed [15:0] tb_full_weight_ram_fc2 [0:TOTAL_RAM_SIZE_FC-1];
    reg signed [15:0] tb_full_bias_ram   [0:CHANNELS-1]; 

    // 檔案處理
    integer input_file;
    integer golden_file;
    integer weight_file_conv;
    integer weight_file_fc1;
    integer weight_file_fc2;
    integer bias_file;

    // 檢查器變數
    static integer error_count = 0;
    static integer test_count = 0;
    logic signed [15:0] expected_sum;
    
    // 迴圈計數器
    integer j; 
    logic [15:0]total_cycle_count = 0;
    logic golden_file_is_done = 1'b0;

    // =================================================================
    // 激勵產生 (Stimulus Driver) - 單一主控制器
    // =================================================================
    initial begin
        $display("[%0t] PATTERN: 測試激勵 (Burst Mode) 已啟動...", $time);

        // (A) 初始化所有輸出
        in_valid_fc1     = 1'b0;
        in_data      = 16'h0000;
        weight_fc1       = 4096'b0;
        weight_fc2       = 4096'b0;
        weight_conv       = 4096'b0;
        bias         = 16'h0000;
        // (B) 階段 0: 預先載入權重 (Time 0)
        weight_file_conv = $fopen("files/dwconv_weights_hex.txt", "r");
        if (weight_file_conv == 0) begin $display("錯誤：無法開啟 dwconv_weights_hex.txt"); $finish; end
        weight_file_fc1 = $fopen("files/fc1_weights_hex.txt", "r");
        if (weight_file_fc1 == 0) begin $display("錯誤：無法開啟 fc1_weights_hex.txt"); $finish; end
        weight_file_fc2 = $fopen("files/fc2_weights_hex.txt", "r");
        if (weight_file_fc2 == 0) begin $display("錯誤：無法開啟 fc2_weights_hex.txt"); $finish; end
        $display("階段 0: 預先載入 %0d 筆權重到 TB RAM...", TOTAL_RAM_SIZE_CONV);
        $display("階段 0: 預先載入 %0d 筆權重到 TB RAM...", TOTAL_RAM_SIZE_FC);
        $display("階段 0: 預先載入 %0d 筆權重到 TB RAM...", TOTAL_RAM_SIZE_FC);
        begin
            static integer read_count = 0;
            //static integer read_count_1 = 0;
            while (read_count < TOTAL_RAM_SIZE_CONV&& !$feof(weight_file_conv)) begin
                if ($fscanf(weight_file_conv, "%h", tb_full_weight_ram_conv[read_count]) == 1) begin
                    read_count = read_count + 1;
                end
            end
            if (read_count < TOTAL_RAM_SIZE_CONV) begin
                $display("錯誤: 權重檔案 'weights_hex.txt' 太小。需要 %0d, 實際 %0d", TOTAL_RAM_SIZE_CONV, read_count);
                $finish;
            end
            $display("conv權重預載入完成。");
            $fclose(weight_file_conv);
            read_count = 0;
            while (read_count < TOTAL_RAM_SIZE_FC&& !$feof(weight_file_fc1)) begin
                if ($fscanf(weight_file_fc1, "%h", tb_full_weight_ram_fc1[read_count]) == 1) begin
                    //$fscanf(weight_file_fc2, "%h", tb_full_weight_ram_fc2[read_count])
                    read_count = read_count + 1;
                end
            end
            if (read_count < TOTAL_RAM_SIZE_FC) begin
                $display("錯誤: 權重檔案 'weights_hex.txt' 太小。需要 %0d, 實際 %0d", TOTAL_RAM_SIZE_FC, read_count);
                $finish;
            end
            read_count = 0;
            while (read_count < TOTAL_RAM_SIZE_FC&& !$feof(weight_file_fc2)) begin
                if ($fscanf(weight_file_fc2, "%h", tb_full_weight_ram_fc2[read_count]) == 1) begin
                    read_count = read_count + 1;
                end
            end
            $display("fc權重預載入完成。");
            $fclose(weight_file_fc1);
            $fclose(weight_file_fc2);
        end
        bias_file = $fopen("files/dwconv_bias_hex.txt", "r");
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
        input_file = $fopen("files/tv_0_input_hex.txt", "r");
        if (input_file == 0) begin $display("錯誤：無法開啟 tv_0_input_hex.txt"); $finish; end

        // (D) 階段 1: 等待重置結束
        @(posedge clk);
        while (rst_n === 1'b0) begin
            @(posedge clk);
        end
        $display("階段 1: 重置完成。");
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        // (E) 階段 2
        begin
            static integer cycle_offset = 0; // 追蹤權重模式 (0-63)
            integer ram_index;
            reg signed [15:0] read_data;
            integer status_in;
            integer active_cycle_count;
            integer pause_cycle_count;
            $display("階段 2: 啟動 Active 激勵...");
            // 主迴圈：只要輸入檔案還有資料就繼續
            //先把weight都存起來
            ram_index = 0;
            /*for (j = 0; j < NUM_WEIGHTS_PER_CYCLE * WEIGHT_PATTERN_CYCLES; j = j + 1) begin
                ram_index = ram_index + 1;
                weight_conv[ (j*16) +: 16 ] = tb_full_weight_ram_conv[ram_index];
            end*/
            while (!$feof(input_file)) begin
                //total_cycle_count = total_cycle_count + 1;
                // --- 階段 A: Active (傳送 64 週期) ---
                $display("[%0t] PATTERN: [Active] 開始 64 週期資料傳輸...", $time);
                active_cycle_count = 0;
                while (active_cycle_count < 64 && !$feof(input_file)) begin
                    
                    // 1. 讀取資料
                    status_in = $fscanf(input_file, "%h", read_data);
                    if (status_in != 1) begin
                        $display("[%0t] PATTERN: [Active] $fscanf 失敗或檔案提早結束。", $time);
                        break; // 脫離 active 迴圈
                    end

                    // 2. 驅動 Input Data
                    in_valid_fc1 <= 1'b1;
                    in_data  <= read_data;

                    // 3. 驅動 Weight (與 Input 同步)
                    for (j = 0; j < 256; j = j + 1) begin
                        ram_index = (j * 64) + cycle_offset;
                        weight_fc1[ (j*9) +: 9 ] = tb_full_weight_ram_fc1[ram_index];
                    end
                    
                    // 4. 等待時脈
                    @(negedge clk);

                    // 5. 更新狀態 (為下一個 *active* 週期準備)
                    active_cycle_count = active_cycle_count + 1;
                    cycle_offset = cycle_offset + 1; // 權重模式也推進
                    if (cycle_offset == 64) begin
                        cycle_offset = 0; // 權重模式歸零
                    end
                end // 結束 64 週期的 active 迴圈

                // --- 階段 B: Pause (暫停 178 週期) ---
                $display("[%0t] PATTERN: [Pause] 開始 191 週期暫停...", $time);
                in_valid_fc1     <= 1'b0;
                in_data  <= 0;
                for (pause_cycle_count = 0; pause_cycle_count <= 191; pause_cycle_count = pause_cycle_count + 1) begin
                    @(negedge clk);
                end
            end
            // (F) 檔案讀取完畢，清理
            $display("[%0t] PATTERN: 輸入檔案 'tv_0_input_hex' 讀取完畢。", $time);
            in_valid_fc1     <= 1'b0;
            $fclose(input_file);
        
    end // 結束 initial (Stimulus)
    end
    /*initial begin
        total_cycle_count = 0;
        while(total_cycle_count<1000) begin
            total_cycle_count = total_cycle_count + 1;
        end
    end*/
    always@(*) begin
        static integer cycle_offset = 0; 
        integer ram_index;
        reg signed [15:0] read_data;
        in_valid_fc2 = 0;
        while (out_valid_gelu) begin
            //$display("[%0t] fc2開始輸入", $time);
            @(negedge clk);
            in_valid_fc2 = 1;
            for (j = 0; j < 64; j = j + 1) begin
                ram_index = (j * 256) + cycle_offset;
                weight_fc2[ (j*8) +: 8 ] = tb_full_weight_ram_fc2[ram_index];
            end
            
            cycle_offset = cycle_offset + 1; // 權重模式也推進
            if (cycle_offset == 256) begin
                cycle_offset = 0; // 權重模式歸零
            end
            
        end 
    end
    
    always@(*) begin         //如果是一次讀一個就用這個
        static integer cycle_offset = 0; 
        integer ram_index;
        integer bias_idx; 
        reg signed [15:0] read_data;
        in_valid_dwconv = 0;
        bias_idx   = 0;
        while (out_valid_fc1) begin
            //$display("[%0t] dwconv開始輸入", $time);
            @(negedge clk);
            in_valid_dwconv = 1;
            for (j = 0; j < 9; j = j + 1) begin
                ram_index = (cycle_offset*9) + j;
                weight_conv[ (j*16) +: 16 ] = tb_full_weight_ram_conv[ram_index];
            end
            cycle_offset = cycle_offset + 1;
            if (cycle_offset == 256) begin
                cycle_offset = 0; // 權重模式歸零
            end
            bias <= tb_full_bias_ram[bias_idx];
            // bias index 每次 +1，跑完 256 就從頭開始
            bias_idx = bias_idx + 1;
            if (bias_idx >= CHANNELS) begin
                bias_idx = 0;
            end
        end 
    end
    always@(*) begin
        in_valid_gelu = 0;
        while (out_valid_dwconv) begin
            //$display("[%0t] gelu開始輸入", $time);
            @(negedge clk);
            in_valid_gelu = 1;
            
        end
    end

    // =================================================================
    // 結果檢查器 (Output Checker)
    // =================================================================
    initial begin
        golden_file = $fopen("files/tv_4_final_out_hex.txt", "r");
        if (golden_file == 0) begin
            $display("錯誤：無法開啟 golden_file 'tv_4_final_out_hex.txt'");
            $finish;
        end
    end

    always @(negedge clk) begin
        if (rst_n == 1'b1) begin 
            
            // 1. 檢查是否達到了 "終止條件"
            // (黃金檔案已讀完 且 DUT 不再輸出)

            if (golden_file_is_done) begin
            //if(test_count>=2048)begin
                $display("-------------------------------------------------");
                $display("[%0t] PATTERN: 偵測到最後一筆輸出已比對完成。", $time);
                
                // 總結報告
                if (error_count == 0) begin
                    $display("    >> 恭喜! 所有 %0d 筆測試皆通過! <<", test_count);
                end else begin
                    $display("    >> 測試失敗: 共發現 %0d 筆錯誤。 <<", error_count);
                end
                $display("-------------------------------------------------");
                
                $fclose(golden_file);
                $finish; // 結束模擬
            end

            // 2. 檢查 DUT 是否有有效輸出
            if (out_valid) begin
                if (golden_file_is_done) begin
                    // 錯誤: 黃金檔案已讀完，但 DUT 仍有 "額外" 輸出
                    $display("[%0t] PATTERN: 錯誤! DUT 產生了額外輸出, 但 'golden_file' 已讀完。", $time);
                    error_count <= error_count + 1;
                end else begin
                    // 正常比對程序
                    // [關鍵] 檢查 $fscanf 之後是否 "剛好" 到了檔案結尾
                    $fscanf(golden_file, "%h", expected_sum);
                    if ($feof(golden_file)) begin
                        $display("[%0t] PATTERN: 'golden_file' 偵測到 EOF。這是最後一筆比對。", $time);
                        golden_file_is_done <= 1'b1; // 設定終止旗標
                    end else begin
                        //$fscanf(golden_file, "%h", expected_sum);
                    
                        if (sum !== expected_sum && sum !== expected_sum-1) begin
                            $display("[%0t] PATTERN: *** 比對錯誤 *** (Test #%0d)", $time, test_count);
                            $display("    預期: Sum=%h (%d)", expected_sum, expected_sum);
                            $display("    得到: Sum=%h (%d)", sum, sum);
                            error_count <= error_count + 1;
                        end else if (sum == expected_sum-1) begin
                            $display("\033[1;36m[%0t] PATTERN: *** 比對差一 *** (Test #%0d)\033[0m", $time, test_count);
                            $display("\033[1;36m    預期: Sum=%h (%d)\033[0m", expected_sum, expected_sum);
                            $display("\033[1;36m    得到: Sum=%h (%d)\033[0m", sum, sum);
                        end else begin
                            $display("\033[1;32m[%0t] PATTERN: *** 比對正確 *** (Test #%0d)\033[0m", $time, test_count);
                            $display("\033[1;32m    預期: Sum=%h (%d)\033[0m", expected_sum, expected_sum);
                            $display("\033[1;32m    得到: Sum=%h (%d)\033[0m", sum, sum);
                        end
                        test_count <= test_count + 1;
                    end
                end
            end
        end
    end

endmodule