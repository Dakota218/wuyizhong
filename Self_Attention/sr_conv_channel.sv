module SR_CONV_CHANNEL (
    input clk,
    input rst_n,
    input logic [15:0] weight,
    input logic [15:0] bias,
    input  logic [15:0] in_data,
    input in_valid,
    output logic [15:0] out_data,
    output logic out_valid
);
logic out_valid_n;
logic [15:0] out_data_n;
logic signed[24:0] mul,mul_n;
logic signed[24:0] sum[0:21],sum_n[0:21];
logic signed [23:0] bias_extended;
logic signed[15:0] in_data_reg, bias_reg, weight_reg;
logic [7:0] in_count, in_count_n;
logic [8:0] row_count, row_count_n;
logic [8:0] col_count_8, col_count_8_n;
logic [8:0] channel_count, channel_count_n;
logic signed[24:0] out_temp[0:1], out_temp_n[0:1];
logic start_out, start_out_n, has_start_out, has_start_out_n;
logic start_turn[1:0], start_turn_n[1:0];
logic start_in,start_in_n; 

assign bias_extended = {bias_reg,8'b0};
assign mul_n = in_data_reg * weight_reg;
always_comb begin           
    in_count_n = in_count;
    col_count_8_n = col_count_8;
    row_count_n = row_count;
    channel_count_n = channel_count;
    if(start_in)begin
        if(channel_count == 63)begin
            channel_count_n = 0;
            in_count_n = in_count + 1;
            if(in_count == 7)begin
                in_count_n = 0;
                col_count_8_n = col_count_8 + 1;
                if(col_count_8 == 21)begin
                    col_count_8_n = 0;
                    row_count_n = row_count + 1;
                    if(row_count == 7)begin
                        row_count_n = 0;
                    end
                end
            end
        end else begin
            channel_count_n = channel_count + 1;
        end
    end
end
assign out_temp_n[1] = sum[0] + bias_extended;
always_comb begin
    out_data_n = out_temp[1]>>>8;
    if(out_temp[1][7])begin
        if(out_temp[1][6:0] || out_temp[1][8])begin
            out_data_n = (out_temp[1]>>>8) + 1;
        end
    end
end
assign out_valid_n = start_out;

assign start_in_n = (in_valid)? 1:start_in;
always_comb begin
    out_temp_n[0] = out_temp[0];
    start_out_n = start_out;
    has_start_out_n = has_start_out;
    for(int i = 0; i <= 21; i = i + 1)begin
        sum_n[i] = sum[i];
    end
    if(start_turn[1])begin
        if(row_count == 7)begin
            
            out_temp_n[0] = sum[0] + mul;
            for(int i = 0; i < 21; i = i + 1)begin
                sum_n[i] = sum[i+1];
            end
            
            sum_n[0] = sum[1] + mul;
            if(col_count_8 == 0)begin
                start_out_n = 0;
                sum_n[21] = sum[0];
            end else begin
                start_out_n = 1;
                sum_n[21] = 0;
                has_start_out_n = 1;
            end
        end else begin
            
            for(int i = 0; i < 21; i = i + 1)begin
                sum_n[i] = sum[i+1];
            end
            sum_n[21] = sum[0];
            sum_n[0] = sum[1] + mul;
            start_out_n = 0;
            if(row_count == 0 && col_count_8 == 0 && has_start_out)begin
                start_out_n = 1;
                sum_n[21] = 0;
            end
            
        end
    end else begin
        sum_n[0] = sum[0] + mul;
        start_out_n = 0;
    end
end
assign start_turn_n[1] = start_turn[0];
//assign start_turn_n[2] = start_turn[1];
always_comb begin
    start_turn_n[0] = 0;
    if(in_count == 7 && channel_count == 63)begin
        start_turn_n[0] = 1;
    end 
end
always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        out_data <= 0;
        in_data_reg <= 0;
        bias_reg <= 0;
        weight_reg <= 0;
        mul <= 0;
        in_count <= 0;
        col_count_8 <= 0;
        row_count <= 0;
        channel_count <= 0;
        out_temp[0] <= 0;
        out_temp[1] <= 0;
        out_valid <= 0;
        start_out <= 0;
        start_turn[0] <= 0;
        start_turn[1] <= 0;
        has_start_out <= 0;
        //start_turn[2] <= 0;
        start_in <= 0;
        for(int i = 0; i <= 21; i = i + 1)begin
            sum[i] <= 0;
        end
    end else begin
        out_data <= out_data_n;
        in_data_reg <= in_data;
        bias_reg <= bias;
        weight_reg <= weight;
        mul <= mul_n;
        in_count <= in_count_n;
        col_count_8 <= col_count_8_n;
        row_count <= row_count_n;
        channel_count <= channel_count_n;
        out_temp[0] <= out_temp_n[0];
        out_temp[1] <= out_temp_n[1];
        out_valid <= out_valid_n;
        start_out <= start_out_n;
        start_turn[0] <= start_turn_n[0];
        start_turn[1] <= start_turn_n[1];
        has_start_out <= has_start_out_n;
        //start_turn[2] <= start_turn_n[2];
        start_in <= start_in_n;
        for(int i = 0; i <= 21; i = i + 1)begin
            sum[i] <= sum_n[i];
        end
    end
end

endmodule