module dwconv_channel (
    input clk,
    input rst_n,
    input in_valid,
    input logic signed [143:0] weight,
    input  logic signed [15:0] in_data,
    input  logic signed[15:0] bias,
    input logic [7:0] col,
    input logic [6:0] row,
    input logic [8:0] in_count,
    // input logic [6:0] in_count,
    output logic out_valid,
    output logic signed [20:0] sum
);
logic signed [15:0] weight_reg[0:8];
logic signed [15:0] in_data_reg[0:255][0:354], in_data_reg_n[0:255][0:354], bias_reg[0:1], in_data_354, in_data_353, in_data_352, in_data_178, in_data_177, in_data_176, in_data_2, in_data_1, in_data_0;
logic signed [31:0] mul[0:8], mul_n[0:8], mul_closed[0:8];
logic [7:0] col_reg;
logic [6:0] row_reg;
logic [1:0] head_tail;
logic out_valid_n;

logic signed [31:0] bias_extended;
logic signed [28:0] sum_temp;
logic signed [20:0] sum_n;

always_comb begin
    in_data_0 = in_data_reg[0][0];
    in_data_1 = in_data_reg[0][1];  
    in_data_2 = in_data_reg[0][2];
    in_data_176 = in_data_reg[0][176];
    in_data_177 = in_data_reg[0][177];
    in_data_178 = in_data_reg[0][178];
    in_data_352 = in_data_reg[0][352];
    in_data_353 = in_data_reg[0][353];
    in_data_354 = in_data_reg[0][354];
end


assign out_valid_n = (col_reg == 1 && in_count == 2)? 1 : ((col_reg == 176 &&  row_reg == 127)? 0 : out_valid);
assign bias_extended = {{8{bias_reg[1][15]}}, bias_reg[1], 8'b0};
assign sum_temp = (mul_closed[0] + mul_closed[1] + mul_closed[2] + mul_closed[3] + mul_closed[4] + mul_closed[5] + mul_closed[6] + mul_closed[7] + mul_closed[8] + bias_extended);
always_comb begin
    sum_n = sum_temp>>>8;

    if(sum_temp[7])begin
        if(sum_temp[6:0] || sum_temp[8])begin
            sum_n = (sum_temp>>>8) + 1;
        end
    end
end
// assign sum_n = (mul_closed[0] + mul_closed[1] + mul_closed[2] + mul_closed[3] + mul_closed[4] + mul_closed[5] + mul_closed[6] + mul_closed[7] + mul_closed[8] + bias_extended) >>> 8;

always_comb begin
    mul_n[0] = in_data_reg[0][0] * weight_reg[0];
    mul_n[1] = in_data_reg[0][1] * weight_reg[1];
    mul_n[2] = in_data_reg[0][2] * weight_reg[2];
    mul_n[3] = in_data_reg[0][176] * weight_reg[3];
    mul_n[4] = in_data_reg[0][177] * weight_reg[4];
    mul_n[5] = in_data_reg[0][178] * weight_reg[5];
    mul_n[6] = in_data_reg[0][352] * weight_reg[6];
    mul_n[7] = in_data_reg[0][353] * weight_reg[7];
    mul_n[8] = in_data_reg[0][354] * weight_reg[8];

    mul_closed[0] = (head_tail == 2'b10)? 0 : mul[0];
    mul_closed[1] = mul[1];
    mul_closed[2] = (head_tail == 2'b01)? 0 : mul[2];
    mul_closed[3] = (head_tail == 2'b10)? 0 : mul[3];
    mul_closed[4] = mul[4];
    mul_closed[5] = (head_tail == 2'b01)? 0 : mul[5];
    mul_closed[6] = (head_tail == 2'b10)? 0 : mul[6];
    mul_closed[7] = mul[7];
    mul_closed[8] = (head_tail == 2'b01)? 0 : mul[8];
end

always_comb begin
    case (col_reg)
        0:   head_tail = 2'b11;
        1:   head_tail = 2'b10;
        176: head_tail = 2'b01;
        default: head_tail = 2'b00;
    endcase
end

always_comb begin
        in_data_reg_n[0][354] = (in_valid)? in_data : 0;
        for (int j = 0; j<354; j++)begin
            in_data_reg_n[0][j] = in_data_reg[1][j+1];
        end
        for (int i = 1; i<255; i++)begin
            for (int j = 0; j<355; j++)begin
                in_data_reg_n[i][j] = in_data_reg[i+1][j];
            end
        end
        for (int j = 0; j<355; j++)begin
            in_data_reg_n[255][j] = in_data_reg[0][j];
        end
end

always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        bias_reg[0] <= 0;
        bias_reg[1] <= 0;
        col_reg <= 0;  
        row_reg <= 0;
        out_valid <= 0;

        for (int i = 0; i<9; i++)begin
            weight_reg[i] <= 0;
            mul[i] <= 0;
        end
        for (int i = 0; i<256; i++)begin
            for (int j = 0; j<355; j++)begin
                in_data_reg[i][j] <= 0;
            end
        end
        sum <= 0;
    end else begin
        bias_reg[0] <= bias;
        bias_reg[1] <= bias_reg[0];

        col_reg <= col; 

        row_reg <= row;
        out_valid <= out_valid_n;

        for (int i = 0; i<9; i++)begin
            weight_reg[i] <= weight[16*i +: 16];
            mul[i] <= mul_n[i];
        end

        for (int i = 0; i<256; i++)begin
            for (int j = 0; j<355; j++)begin
                in_data_reg[i][j] <= in_data_reg_n[i][j];
            end
        end

        sum <= sum_n;
    end
end



endmodule