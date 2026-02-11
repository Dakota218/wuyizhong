`timescale 1ns/1ps

`include "pattern_gelu.sv"

// 2. 根據模擬類型 (RTL vs. GATE) 包含 DUT 原始碼
`ifdef RTL
    `define DUMP_FILE "gelu_lut_rtl.fsdb"
    `define SDF_INSTANCE I_DUT
    `define SDF_FILE "gelu_lut_syn.sdf"
    `include "gelu_lut.sv"
`elsif GATE
    `define DUMP_FILE "gelu_lut_gate.fsdb"
    `define SDF_FILE "gelu_lut_syn.sdf"
    `define SDF_INSTANCE I_DUT

    // 包含合成後的閘級網表 (Netlist)
    `include "gelu_lut_syn.v"
    
`else
    `define DUMP_FILE "gelu_lut_rtl.fsdb"
    `define SDF_INSTANCE I_DUT
    `include "gelu_lut.sv"
`endif

// 3. 頂層測試平台模組
module TESTBED();

    // 4. 訊號定義 (Wires/Logic)
    logic clk;
    logic rst_n;
    
    logic             in_valid;
    logic signed [15:0] in_data;
    
    logic             out_valid;
    logic signed [10:0] out_data;

    // 5. [新增] Clock 產生器 (例如 100MHz)
    parameter CLK_PERIOD = 5.1;
    initial begin
        clk = 1'b0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // 6. [新增] Reset 產生器
    initial begin
        rst_n = 1'b1;
        $disable_warnings("timing");
        #1;
        rst_n = 1'b0;
        #(CLK_PERIOD * 5); // 維持 5 個週期的重置
        @(posedge clk); 
        #10;
        rst_n = 1'b1;
        // 4. 等待電路穩定一點
        #(CLK_PERIOD * 2);

        // 5. 重新開啟時序檢查 (關鍵！)
        // 告訴 VCS: "Reset 結束了，現在開始要嚴格檢查了"
        $enable_warnings("timing");
    end

    // 7. 模擬器設定 (波形 Dump / SDF)
    
    initial begin
       /* // $fsdbDumpfile 指定輸出的 FSDB 檔案名稱
        $fsdbDumpfile("waves.fsdb");

        // $fsdbDumpvars 告訴模擬器要 dump 哪些訊號
        // 0: 代表 dump 'TESTBED' 模組底下所有層級的訊號
        // TESTBED: 您要 dump 的頂層模組名稱
        $fsdbDumpvars(0, TESTBED, "+mda");
        $sdf_annotate(`SDF_FILE, I_DUT);*/
        `ifdef RTL
            //$fsdbDumpfile("waves.fsdb");
            //$fsdbDumpvars(0, TESTBED, "+mda");
        `elsif GATE
            $fsdbDumpfile("waves.fsdb");
            $sdf_annotate(`SDF_FILE, I_DUT);
            $fsdbDumpvars(0, TESTBED, "+mda");
        `endif
    end
    // 8. 實例化 DUT (Device Under Test)
    gelu_lut_module I_DUT (
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_data(in_data),
        .out_valid(out_valid),
        .out_data(out_data)
    );

    // 9. 實例化 PATTERN 產生器/檢查器
    PATTERN I_PATTERN (
        .clk(clk),
        .rst_n(rst_n),
        .in_valid(in_valid),
        .in_data(in_data),
        .out_valid(out_valid),
        .out_data(out_data)
    );

endmodule