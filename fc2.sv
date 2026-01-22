module fc2 (
    input clk,
    input rst_n,
    input logic [511:0] weight ,
    input  logic [10:0] in_data,
    input in_valid,
    output logic out_valid,
    output logic [15:0] sum
);
logic signed [15:0] sum_temp [0:63], sum_temp_n[0:63];
logic signed [24:0] sum_wire [0:63];
logic signed [15:0] sum_n;
logic out_valid_n;
logic [8:0] in_count, in_count_n;   // 6-bit (0-63)
logic [8:0] count[0:63], count_n[0:63]; /////////////////////////////////

logic [7:0] out_count, out_count_n; // 8-bit (0-255)
localparam signed [7:0] bias [0:63] = '{
    8'h24, 8'h0E, 8'h01, 8'h02, 8'h1F, 8'h12, 8'hFE, 8'hEF,
    8'h1A, 8'hE5, 8'h08, 8'h19, 8'h3E, 8'hD0, 8'h25, 8'h07,
    8'h12, 8'hF0, 8'hBC, 8'hF6, 8'hFF, 8'h06, 8'hF7, 8'hFD,
    8'h0E, 8'h01, 8'hD4, 8'hE7, 8'hF4, 8'hE0, 8'hD1, 8'h3E,
    8'h09, 8'h20, 8'hC6, 8'hFA, 8'hFD, 8'h17, 8'hF4, 8'hF0,
    8'h12, 8'h17, 8'hF3, 8'h12, 8'h01, 8'h12, 8'h01, 8'h19,
    8'h23, 8'hB9, 8'hFB, 8'h12, 8'hD8, 8'hB2, 8'h19, 8'hE9,
    8'hE9, 8'h16, 8'h11, 8'hC5, 8'h1C, 8'h01, 8'h26, 8'hD8
};

typedef enum logic [1:0] {
    IDLE,
    INPUT,
    OUTPUT
} state_t;

state_t state, state_n;

genvar i;
generate
    for (i = 0; i < 64; i = i + 1) begin          
        fc2_column fc (
            .clk(clk),
            .rst_n (rst_n),
            .weight (weight[(8*i)+7:8*i]),
            .in_data (in_data),
            .out_valid (out_valid),
            .bias(bias[i]),
            .in_count(count[i]),
            .sum (sum_wire[i])
        );    
    end
endgenerate

//assign sum_n = sum_temp[0]>>8;
always_comb begin
    
    if(in_count==260 )begin
        for (int k=0;k<=63;k=k+1) begin
            sum_temp_n[k]=sum_wire[k];
        end
    end else begin
        for (int k=0;k<63;k=k+1) begin
            sum_temp_n[k]=sum_temp[k+1];
        end
        sum_temp_n[63] = 25'b0;
    end
end

//FSM
always_comb begin
    //state_n  = state;
    case (state)
        IDLE:  state_n = (in_valid)?        INPUT : state;
        INPUT: state_n = (in_count == 260)?  OUTPUT : state;
        OUTPUT: state_n = (out_count == 64)? INPUT : state;
        default: state_n = IDLE;

    endcase
end

always_comb begin
    in_count_n = in_count;
    for (int j=0;j<64;j=j+1) begin
        count_n[j]=count[j];
    end
    out_count_n = out_count;
    out_valid_n = out_valid; 
    //sum_n = sum;
    sum_n = 0;
    case (state)
        IDLE: begin
            in_count_n = 0;
            out_count_n = 0;
            out_valid_n = 0;
            sum_n = 0;
            for (int j=0;j<64;j=j+1) begin
                count_n[j]=0;
            end
        end

        INPUT: begin
            if (in_count == 260) begin
                out_valid_n = 0;
                in_count_n = 5;
                for (int j=0;j<64;j=j+1) begin
                    count_n[j]=5;
                end
            end else begin
                in_count_n = in_count + 1;
                for (int j=0;j<64;j=j+1) begin
                    count_n[j]=count[j]+1;
                end
            end
        end

        OUTPUT: begin
            in_count_n = in_count + 1;
            out_valid_n = 1'b1;
            out_count_n = out_count + 1;
            sum_n = sum_temp[0];
            for (int j=0;j<64;j=j+1) begin
                count_n[j]=count[j] + 1;
            end
            if (out_count == 64) begin
                out_count_n = 0;
                out_valid_n = 0;
            end 
        end
    endcase
end

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        in_count <= 0;
        for (int j=0;j<64;j=j+1) begin
            count[j]<=0;
        end

        out_count <= 0;
        out_valid <= 1'b0; 
        sum<=0;
        for (int j=0;j<64;j=j+1) begin
            sum_temp[j]<=0;
        end
    end else begin
        state <= state_n;
        in_count <= in_count_n;
        for (int j=0;j<64;j=j+1) begin
            count[j]<=count_n[j];
        end

        out_count <= out_count_n;
        out_valid <= out_valid_n;
        sum <= sum_n;
        for (int j=0;j<64;j=j+1) begin
            sum_temp[j] <= sum_temp_n[j];
        end
    end
end

endmodule