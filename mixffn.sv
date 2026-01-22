module mixffn (
    input clk,
    input rst_n,
    input logic signed [143:0] weight_conv,
    input logic signed [2303:0] weight_fc1,
    input logic signed [511:0] weight_fc2,
    input  logic [9:0] in_data,
    input logic signed [15:0] bias,
    input in_valid_fc1,
    input in_valid_dwconv,
    input in_valid_gelu,
    input in_valid_fc2,
    output logic out_valid_fc1,
    output logic out_valid_dwconv,
    output logic out_valid_gelu,
    output logic out_valid,
    output logic [15:0] sum
);
logic signed [15:0] sum1;
logic signed [15:0] sum2;
logic signed [10:0] sum3;
//logic out_valid_fc1, out_valid_dwconv, out_valid_gelu;

genvar i;
fc1 fc1 (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_fc1),
    .in_data(in_data),
    .weight(weight_fc1),
    .out_valid(out_valid_fc1),
    .sum(sum1)
);
dwconv I_DUT (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_dwconv),
    .in_data(sum1),
    .bias(bias),
    .weight(weight_conv),
    .out_valid(out_valid_dwconv),
    .sum(sum2)
);
gelu_lut_module dut (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_gelu),
    .in_data(sum2),
    .out_valid(out_valid_gelu),
    .out_data(sum3)
);
fc2 fc2 (
    .clk(clk),
    .rst_n(rst_n),
    .in_valid(in_valid_fc2),
    .in_data(sum3),
    .weight(weight_fc2),
    .out_valid(out_valid),
    .sum(sum)
);

endmodule