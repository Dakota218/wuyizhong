module fc2_column (
    input clk,
    input rst_n,
    input out_valid,
    input in_valid,
    input logic signed [7:0] weight,
    input  logic signed [10:0] in_data,
    input  logic signed [7:0] bias,
    input logic [8:0] in_count,
    input logic [3:0] pause_count,
    output logic signed [24:0] out_data
);
logic signed[18:0] mul_reg, mul;
logic signed[24:0] sum, sum_n;
logic signed [18:0] bias_extended;
logic signed [9:0] in_data_reg; 
logic signed [8:0] weight_reg; 
logic signed [10:0] bias_reg;
logic signed [24:0] out_data_n;
logic signed [24:0] out_temp, out_temp_n;

assign bias_extended = {bias_reg, 8'b0} ;
assign mul = in_data_reg * weight_reg;
assign out_temp_n = sum + bias_extended;
always_comb begin
    out_data_n = out_temp>>>8;
    if(out_temp[7])begin
        if(out_temp[6:0] || out_temp[8])begin
            out_data_n = (out_temp>>>8) + 1;
        end
    end
end
always_comb begin
    if(in_count == 256 && pause_count == 1)begin
        sum_n = mul_reg;
    end else begin
        sum_n = sum + mul_reg;
    end
end

always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        mul_reg <= 0;
        sum <= 0;
        in_data_reg <= 0;
        weight_reg <= 0;
        bias_reg <= 0;
        out_data <= 0;
        out_temp <= 0;
    end else begin
        mul_reg <= mul;
        sum <= sum_n;
        in_data_reg <= in_data;
        weight_reg <= weight;
        bias_reg <= bias;
        out_data <= out_data_n;
        out_temp <= out_temp_n;
    end
end


endmodule