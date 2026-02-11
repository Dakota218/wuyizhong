module Q_MUL_K_COLUMN(
    input clk,
    input rst_n,
    input logic [15:0] in_data_q,
    input  logic [15:0] in_data_k,
    input logic out_valid,
    input logic [6:0] in_count,
    output logic [30:0] sum
);
logic signed[27:0] mul_reg, mul;
logic signed[30:0] sum_n;
logic signed [15:0] in_data_q_reg, in_data_k_reg; 

assign mul = in_data_q_reg * in_data_k_reg;
always_comb begin
    if(in_count < 65)begin
        sum_n = sum + mul_reg;
    end else if(in_count == 65)begin
        sum_n = sum>>>11;
        if(sum[10])begin
            if(sum[9:0] || sum[11])begin
                sum_n = (sum>>>11) + 1;
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
        in_data_q_reg <= 0;
        in_data_k_reg <= 0;
    end else begin
        mul_reg <= mul;
        sum <= sum_n;
        in_data_q_reg <= in_data_q;
        in_data_k_reg <= in_data_k;
    end
end

endmodule