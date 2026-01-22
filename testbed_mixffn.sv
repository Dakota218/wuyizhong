`timescale 1ns/1ps

`include "pattern_mixffn.sv"

// 2. 根據模擬類型 (RTL vs. GATE) 包含 DUT 原始碼
`ifdef RTL
    `define DUMP_FILE "mixffn_rtl.fsdb"
    `define SDF_INSTANCE I_DUT
    `define SDF_FILE "mixffn_syn.sdf"
    `include "mixffn.sv"
    `include "dwconv.sv"
    `include "dwconv_channel.sv"
    `include "fc1.sv"
    `include "fc1_column.sv"
    `include "fc2.sv"
    `include "fc2_column.sv"
    `include "gelu_lut.sv"
    
`elsif GATE
    `define DUMP_FILE "mixffn_gate.fsdb"
    `define SDF_FILE "mixffn_syn.sdf"
    `define SDF_INSTANCE I_DUT

    // 包含合成後的閘級網表 (Netlist)
    `include "dwconv_syn.v"
    
`else
    `define DUMP_FILE "mixffn_rtl.fsdb"
    `define SDF_INSTANCE I_DUT
    `include "mixffn.sv"
    `include "dwconv.sv"
    `include "dwconv_channel.sv"
    `include "fc1.sv"
    `include "fc1_column.sv"
    `include "fc2.sv"
    `include "fc2_column.sv"
    `include "gelu_lut.sv"
`endif

// 3. 頂層測試平台模組
module TESTBED();
    // 4. 訊號定義 (Wires/Logic)
    logic clk;
    logic rst_n;
    
    logic             in_valid_fc1;
    logic             in_valid_fc2;
    logic             in_valid_dwconv;
    logic             in_valid_gelu;
    logic signed [9:0] in_data;
    logic signed [15:0] bias;
    logic signed [143:0] weight_conv;
    logic signed [2303:0] weight_fc1;
    logic signed [511:0] weight_fc2;
    logic             out_valid_fc1;
    logic             out_valid_dwconv;
    logic             out_valid_gelu;
    logic             out_valid;
    logic signed [15:0] sum;

    // 5. [新增] Clock 產生器 (例如 100MHz)
    parameter CLK_PERIOD = 10;
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
        @(negedge clk);
        #1; 
        rst_n = 1'b1;
        // 4. 等待電路穩定一點
        #(CLK_PERIOD * 2);

        // 5. 重新開啟時序檢查 (關鍵！)
        // 告訴 VCS: "Reset 結束了，現在開始要嚴格檢查了"
        $enable_warnings("timing");
    end

    // 7. 模擬器設定 (波形 Dump / SDF)
    
    initial begin
        `ifdef RTL
           // $fsdbDumpfile("waves.fsdb");
            //$fsdbDumpvars(0, TESTBED, "+mda");
        `elsif GATE
           // $fsdbDumpfile("waves.fsdb");
            $sdf_annotate(`SDF_FILE, I_DUT);
            //$fsdbDumpvars(0, TESTBED, "+mda");
        `endif
    end
    // 8. 實例化 DUT (Device Under Test)
    mixffn I_DUT (
        .clk(clk),
        .rst_n(rst_n),
        .in_valid_fc1(in_valid_fc1),
        .in_valid_dwconv(in_valid_dwconv),
        .in_valid_gelu(in_valid_gelu),
        .in_valid_fc2(in_valid_fc2),
        .in_data(in_data),
        .bias(bias),
        .weight_conv(weight_conv),
        .weight_fc1(weight_fc1),
        .weight_fc2(weight_fc2),
        .out_valid_fc1(out_valid_fc1),
        .out_valid_dwconv(out_valid_dwconv),
        .out_valid_gelu(out_valid_gelu),
        .out_valid(out_valid),
        .sum(sum)
    );

    // 9. 實例化 PATTERN 產生器/檢查器
    PATTERN I_PATTERN (
        .clk(clk),
        .rst_n(rst_n),
        .in_valid_fc1(in_valid_fc1),
        .in_valid_dwconv(in_valid_dwconv),
        .in_valid_gelu(in_valid_gelu),
        .in_valid_fc2(in_valid_fc2),
        .in_data(in_data),
        .bias(bias),
        .weight_conv(weight_conv),
        .weight_fc1(weight_fc1),
        .weight_fc2(weight_fc2),
        .out_valid_fc1(out_valid_fc1),
        .out_valid_dwconv(out_valid_dwconv),
        .out_valid_gelu(out_valid_gelu),
        .out_valid(out_valid),
        .sum(sum)
    );

endmodule