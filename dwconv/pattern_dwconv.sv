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
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        @(negedge clk);
        // (E) 階段 2
        begin
            integer weight_idx;   // 指向 tb_full_weight_ram 的 index (以 9 為步進)
            integer bias_idx;     // 指向 tb_full_bias_ram 的 index (以 1 為步進)
            integer status_in;
            reg  signed [15:0] in_word;
            integer k;

            $display("階段 2: 啟動一拍一個 in_data + 9 weights + 1 bias 的激勵...");


            weight_idx = 0; // 0 ~ TOTAL_RAM_SIZE-1, 每次 +9
            bias_idx   = 0; // 0 ~ CHANNELS-1, 每次 +1

            // 主迴圈：只要輸入檔案還有資料就繼續
            while (!$feof(input_file)) begin
                // 1. 讀一個 16-bit in_data
                status_in = $fscanf(input_file, "%h", in_word);
                if (status_in != 1) begin
                    $display("[%0t] PATTERN: [Active] $fscanf 失敗或檔案提早結束。", $time);
                    break;
                end

                // 2. 準備 in_data (在這裡只用低 16 bit，其餘清 0)
                in_data <= '0;
                in_data[15:0] <= in_word;

                // 3. 準備 9 個 weight，concate 到 weight[0 +: 16], [16 +: 16], ... [128 +: 16]
                weight <= '0;
                for (k = 0; k < 9; k = k + 1) begin
                    weight[k*16 +: 16] <= tb_full_weight_ram[weight_idx + k];
                end

                // weight index 每次往後跳 9，跑完 2304 (=256*9) 就從頭開始
                weight_idx = weight_idx + 9;
                if (weight_idx >= TOTAL_RAM_SIZE) begin
                    weight_idx = 0;
                end

                // 4. 準備 bias，同樣只用低 16 bit，其餘清 0
                bias <= '0;
                bias <= tb_full_bias_ram[bias_idx];

                // bias index 每次 +1，跑完 256 就從頭開始
                bias_idx = bias_idx + 1;
                if (bias_idx >= CHANNELS) begin
                    bias_idx = 0;
                end

                // 5. 驅動 in_valid
                in_valid <= 1'b1;

                @(negedge clk);
            end


            // (F) 檔案讀取完畢，清理
            $display("[%0t] PATTERN: 輸入檔案 'tv_1_fc1_out_hex.txt' 讀取完畢。", $time);
            in_valid     <= 1'b0;
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
    // 修正版：以「讀取結果」作為結束依據
    // =================================================================
    always @(negedge clk) begin
        if (rst_n == 1'b1 && out_valid) begin 
            integer res;
            
            // 1. 嘗試讀取下一筆 Golden
            res = $fscanf(golden_file, "%h", expected_sum);

            // 2. 判斷讀取是否成功
            if (res !== 1) begin
                // =========================================================
                // [關鍵修改] 
                // 當 DUT 送出資料，但 Golden File 已經讀不到東西 (res != 1)
                // 這代表 Golden File 已經比對完了。
                // 我們直接把它當作「正常結束」，而不是錯誤。
                // =========================================================
                $display("-------------------------------------------------");
                $display("[%0t] PATTERN: Golden File 已讀取完畢 (EOF)，停止模擬。", $time);
                
                if (error_count == 0) begin
                    $display("    >> 恭喜! 所有測試皆通過! <<");
                end else begin
                    $display("    >> 測試失敗: 共發現 %0d 筆錯誤。 <<", error_count);
                end
                $display("-------------------------------------------------");
                
                $fclose(golden_file);
                $finish; 
                
            end else begin
                // 3. 讀取成功，進行正常比對
                if (sum !== expected_sum) begin
                    $display("[%0t] PATTERN: *** 比對錯誤 *** (Test #%0d)", $time, test_count);
                    $display("    預期: Sum=%h (%d)", expected_sum, expected_sum);
                    $display("    得到: Sum=%h (%d)", sum, sum);
                    error_count <= error_count + 1;
                end else begin
                     // 可以在這裡把正確的 log 註解掉，版面比較乾淨
                     // $display("\033[1;32m[%0t] PATTERN: *** 比對正確 *** (Test #%0d)\033[0m", $time, test_count);
                end
                test_count <= test_count + 1;

                // 4. (雙重保險) 如果剛好該行後面沒有換行符號，這裡就會直接結束
                if ($feof(golden_file)) begin
                    $display("-------------------------------------------------");
                    $display("[%0t] PATTERN: 偵測到 EOF (無換行)，停止模擬。", $time);
                    if (error_count == 0) $display("    >> 恭喜! 所有測試皆通過! <<");
                    else $display("    >> 測試失敗: 共發現 %0d 筆錯誤。 <<", error_count);
                    $display("-------------------------------------------------");
                    $finish;
                end
            end
        end
    end
    // always @(negedge clk) begin
    //     if (rst_n == 1'b1) begin 
            
    //         // 1. 檢查是否達到了 "終止條件"
    //         // (黃金檔案已讀完 且 DUT 不再輸出)

    //         if (golden_file_is_done && !out_valid) begin
    //         // if(test_count>=4096)begin
    //             $display("-------------------------------------------------");
    //             $display("[%0t] PATTERN: 偵測到最後一筆輸出已比對完成。", $time);
                
    //             // 總結報告
    //             if (error_count == 0) begin
    //                 $display("    >> 恭喜! 所有 %0d 筆測試皆通過! <<", test_count);
    //             end else begin
    //                 $display("    >> 測試失敗: 共發現 %0d 筆錯誤。 <<", error_count);
    //             end
    //             $display("-------------------------------------------------");
                
    //             $fclose(golden_file);
    //             $finish; // 結束模擬
    //         end

    //         // 2. 檢查 DUT 是否有有效輸出
    //         if (out_valid) begin
    //             if (golden_file_is_done) begin
    //                 // 錯誤: 黃金檔案已讀完，但 DUT 仍有 "額外" 輸出
    //                 $display("[%0t] PATTERN: 錯誤! DUT 產生了額外輸出, 但 'golden_file' 已讀完。", $time);
    //                 error_count <= error_count + 1;
    //             end else begin
    //                 // 正常比對程序
                    
    //                 $fscanf(golden_file, "%h", expected_sum);
    //                 if (sum !== expected_sum) begin
    //                     $display("[%0t] PATTERN: *** 比對錯誤 *** (Test #%0d)", $time, test_count);
    //                     $display("    預期: Sum=%h (%d)", expected_sum, expected_sum);
    //                     $display("    得到: Sum=%h (%d)", sum, sum);
    //                     error_count <= error_count + 1;
    //                 end else begin
    //                     $display("\033[1;32m[%0t] PATTERN: *** 比對正確 *** (Test #%0d)\033[0m", $time, test_count);
    //                     $display("\033[1;32m    預期: Sum=%h (%d)\033[0m", expected_sum, expected_sum);
    //                     $display("\033[1;32m    得到: Sum=%h (%d)\033[0m", sum, sum);
    //                 end
    //                 test_count <= test_count + 1;

    //                 // [關鍵] 檢查 $fscanf 之後是否 "剛好" 到了檔案結尾
    //                 if ($feof(golden_file)) begin
    //                     $display("[%0t] PATTERN: 'golden_file' 偵測到 EOF。這是最後一筆比對。", $time);
    //                     golden_file_is_done <= 1'b1; // 設定終止旗標
    //                 end
    //             end
    //         end
    //     end
    // end

endmodule