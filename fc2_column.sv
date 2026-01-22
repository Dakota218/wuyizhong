module fc2_column (
    input clk,
    input rst_n,
    input out_valid,
    input logic signed [7:0] weight,
    input  logic signed [10:0] in_data,
    input  logic signed [7:0] bias,
    input logic [8:0] in_count,
    output logic signed [24:0] sum
);
logic signed[17:0] mul_reg, mul;
logic signed[24:0] sum_n;
logic signed [15:0] bias_extended;
logic signed [10:0] in_data_reg;
logic signed [7:0] weight_reg;
logic signed [7:0] bias_reg;
logic signed [23:0] sum_first, sum_first_n;
//assign mul = in_data * weight;
//assign sum_n = sum + mul_reg[5];
assign bias_extended = {bias_reg, 8'b0} ;
always_comb begin
    mul = in_data_reg * weight_reg;
    sum_n = sum;
    if(in_count < 257)begin
        if(in_count == 5 && sum_first)begin
            sum_n = sum_first + mul_reg;
        end else begin
            sum_n = sum + mul_reg;
        end
        //mul = in_data_reg * weight_reg;         //把sum後面的工作丟給其他變數，sum直接繼續接收下輪
    end else if(in_count == 257)begin
        sum_n = sum + bias_extended; 
        //mul = 0;
    end else if(in_count == 258)begin
        sum_n = sum>>>8;
        if(sum[7])begin
            if(sum[6:0] || sum[8])begin
                sum_n = (sum>>>8) + 1;
            end
        end
        //mul = 0;
    end else if(in_count == 259)begin
        sum_n = sum;
        //mul = 0;
    end else begin
        sum_n = 0;
        //mul = 0;
    end
end
always_comb begin
    sum_first_n = 0;
    if(in_count >= 257)begin
        sum_first_n = sum_first + mul_reg;
    end
end
always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        mul_reg <= 0;
        sum <= 0;
        in_data_reg <= 0;
        weight_reg <= 0;
        bias_reg <= 0;
        sum_first <= 0;
    end else begin
        mul_reg <= mul;
        sum <= sum_n;
        in_data_reg <= in_data;
        weight_reg <= weight;
        bias_reg <= bias;
        sum_first <= sum_first_n;
    end
end



endmodule