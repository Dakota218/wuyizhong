module kv_column (
    input clk,
    input rst_n,
    input out_valid,
    input logic signed [15:0] weight,
    input  logic signed [15:0] in_data,
    input  logic signed[15:0] bias,
    input logic [6:0] in_count,
    output logic signed [24:0] sum
);
logic signed[24:0] mul_reg, mul;
logic signed[24:0] sum_n;
logic signed [23:0] bias_extended;
logic signed [15:0] in_data_reg; 
logic signed [15:0] weight_reg; 
logic signed [15:0] bias_reg;

assign bias_extended = {bias_reg, 8'b0} ;
assign mul = in_data_reg * weight_reg;
always_comb begin
    if(in_count < 65)begin
        sum_n = sum + mul_reg;
    end else if(in_count == 65)begin
        sum_n = sum + bias_extended; 
    end else if(in_count == 66)begin
        sum_n = sum>>>8;
        if(sum[7])begin
            if(sum[6:0] || sum[8])begin
                sum_n = (sum>>>8) + 1;
            end
        end
    end else begin
        sum_n = 0;
    end
end

always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        mul_reg <= 0;
        sum <= 0;
        in_data_reg <= 0;
        weight_reg <= 0;
        bias_reg <= 0;
    end else begin
        mul_reg <= mul;
        sum <= sum_n;
        in_data_reg <= in_data;
        weight_reg <= weight;
        bias_reg <= bias;
    end
end



endmodule