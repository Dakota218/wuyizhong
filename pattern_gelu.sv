`timescale 1ns/1ps

module PATTERN (
    // Clock 與 Reset
    input  logic clk,
    input  logic rst_n,

    // 輸出 (送往 DUT)
    output logic             in_valid,
    output logic signed [15:0] in_data,

    // 輸入 (來自 DUT)
    input  logic             out_valid,
    input  logic signed [10:0] out_data
);

    // =================================================================
    // 參數與內部變數
    // =================================================================

    
    // 檔案處理
    integer input_file;
    integer golden_file;
    integer weight_file;

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
        
        // (C) 開啟 'in_data' 檔案
        input_file = $fopen("files/tv_2_dwconv_out_hex.txt", "r");
        if (input_file == 0) begin $display("錯誤：無法開啟 tv_2_dwconv_out_hex.txt"); $finish; end

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
        // (E) 階段 2: 啟動 "Active/Pause" 激勵
        begin
            reg signed [15:0] read_data;
            integer status_in;

            $display("階段 2: 啟動激勵循環...");

            // 主迴圈：只要輸入檔案還有資料就繼續
            while (!$feof(input_file)) begin
                    integer pause_cycle_count;
                // --- 階段 A: Active (傳送 64 週期) ---
                    
                    // 1. 讀取資料
                    status_in = $fscanf(input_file, "%h", read_data);
                    if (status_in != 1) begin
                        $display("[%0t] PATTERN: [Active] $fscanf 失敗或檔案提早結束。", $time);
                        break; // 脫離 active 迴圈
                    end

                    // 2. 驅動 Input Data
                    in_valid <= 1'b1;
                    in_data  <= read_data;

                    
                    // 4. 等待時脈
                    @(negedge clk);
                    in_valid     <= 1'b0;
                    in_data  <= 0;
                    for (pause_cycle_count = 0; pause_cycle_count <= 25; pause_cycle_count = pause_cycle_count + 1) begin
                        @(negedge clk);
                    end

                
            end // 結束 while (!$feof(input_file))

            // (F) 檔案讀取完畢，清理
            $display("[%0t] PATTERN: 輸入檔案 'tv_0_input_hex.txt' 讀取完畢。", $time);
            in_valid     <= 1'b0;
            $fclose(input_file);
        end
    end // 結束 initial (Stimulus)

    // =================================================================
    // 結果檢查器 (Output Checker)
    // =================================================================
    initial begin
        golden_file = $fopen("files/tv_3_gelu_out_hex.txt", "r");
        if (golden_file == 0) begin
            $display("錯誤：無法開啟 golden_file 'tv_3_gelu_out_hex.txt'");
            $finish;
        end
    end

    always @(negedge clk) begin
        if (rst_n == 1'b1) begin 
            
            // 1. 檢查是否達到了 "終止條件"
            // (黃金檔案已讀完 且 DUT 不再輸出)

            //if (golden_file_is_done && !out_valid) begin
            //if(golden_file_is_done)begin
            if(test_count>=2048)begin
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
                    
                        if (out_data !== expected_sum && out_data !== expected_sum-1) begin
                            $display("[%0t] PATTERN: *** 比對錯誤 *** (Test #%0d)", $time, test_count);
                            $display("    預期: Sum=%h (%d)", expected_sum, expected_sum);
                            $display("    得到: Sum=%h (%d)", out_data, out_data);
                            error_count <= error_count + 1;
                        end else if (out_data == expected_sum-1) begin
                            $display("\033[1;36m[%0t] PATTERN: *** 比對差一 *** (Test #%0d)\033[0m", $time, test_count);
                            $display("\033[1;36m    預期: Sum=%h (%d)\033[0m", expected_sum, expected_sum);
                            $display("\033[1;36m    得到: Sum=%h (%d)\033[0m", out_data, out_data);
                        end else begin
                            $display("\033[1;32m[%0t] PATTERN: *** 比對正確 *** (Test #%0d)\033[0m", $time, test_count);
                            $display("\033[1;32m    預期: Sum=%h (%d)\033[0m", expected_sum, expected_sum);
                            $display("\033[1;32m    得到: Sum=%h (%d)\033[0m", out_data, out_data);
                        end
                        test_count <= test_count + 1;
                    end
                end
            end
        end
    end

endmodule