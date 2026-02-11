module KV (
    input clk,
    input rst_n,
    input logic [2047:0] weight ,
    input  logic [15:0] in_data,
    input in_valid,
    output logic out_valid,
    output logic [15:0] out_data
);
logic signed [15:0] sum_temp [0:127], sum_temp_n[0:127];
logic signed [24:0] sum_wire [0:127];
logic signed [15:0] out_data_n;
logic out_valid_n;
logic [6:0] in_count, in_count_n;   
logic [6:0] count[0:127], count_n[0:127];
logic [7:0] out_count, out_count_n; 
localparam signed [15:0] bias [0:127] = '{
    16'hFF94, 16'hFFB8, 16'h0065, 16'h0001, 16'hFF77, 16'hFFC1, 16'h0073, 16'hFFAE,
    16'h0074, 16'hFF8C, 16'hFFEB, 16'hFFF1, 16'h0004, 16'hFFCD, 16'h0019, 16'hFFAF,
    16'h0054, 16'hFFF8, 16'hFFC9, 16'h0021, 16'hFFD7, 16'hFF92, 16'h000F, 16'hFF81,
    16'h006E, 16'hFFB9, 16'h0056, 16'h0058, 16'hFFB7, 16'h0026, 16'hFFB2, 16'h0048,
    16'hFFE9, 16'hFFAF, 16'hFFF4, 16'h0036, 16'h0053, 16'h001A, 16'h0009, 16'h001B,
    16'h006F, 16'h005D, 16'hFFA1, 16'hFF9F, 16'h0004, 16'h0016, 16'h005F, 16'hFFA0,
    16'hFFE6, 16'h0068, 16'hFFF7, 16'h0087, 16'hFFBD, 16'h002B, 16'hFFF3, 16'h0059,
    16'hFFA3, 16'h005C, 16'hFFAE, 16'h0047, 16'h0028, 16'h0010, 16'h0031, 16'h008A,
    16'hFFFF, 16'hFFFC, 16'h0001, 16'hFFFE, 16'h0003, 16'h0001, 16'h0002, 16'h0000,
    16'h0000, 16'h0005, 16'h0002, 16'h0002, 16'h0000, 16'hFFFE, 16'hFFFE, 16'hFFFF,
    16'h0000, 16'h0001, 16'hFFFF, 16'h0001, 16'h0000, 16'hFFFF, 16'hFFFE, 16'h0004,
    16'hFFFD, 16'h0001, 16'h0000, 16'h0000, 16'hFFFE, 16'h0002, 16'h0001, 16'h0001,
    16'hFFFE, 16'hFFFE, 16'h0001, 16'h0001, 16'h0002, 16'h0000, 16'hFFFF, 16'h0000,
    16'hFFFF, 16'h0000, 16'hFFFF, 16'h0000, 16'hFFFF, 16'hFFFD, 16'h0000, 16'hFFFF,
    16'h0000, 16'h0002, 16'h0000, 16'h0000, 16'h0000, 16'h0005, 16'hFFFE, 16'h0001,
    16'h0000, 16'h0001, 16'h0000, 16'hFFFF, 16'hFFFF, 16'h0000, 16'h0000, 16'h0000
};
typedef enum logic [1:0] {
    IDLE,
    INPUT,
    OUTPUT
} state_t;

state_t state, state_n;

genvar i;
generate
    for (i = 0; i < 128; i = i + 1) begin        
        kv_column fc (
            .clk(clk),
            .rst_n (rst_n),
            .weight (weight[(16*i)+15:16*i]),
            .in_data (in_data),
            .out_valid (out_valid),
            .bias(bias[i]),
            .in_count(count[i]),
            .sum (sum_wire[i])
        );    
    end
endgenerate

always_comb begin
    
    if(in_count==67 )begin
        for (int k=0;k<=127;k=k+1) begin
            sum_temp_n[k]=sum_wire[k];
        end
    end else begin
        for (int k=0;k<127;k=k+1) begin
            sum_temp_n[k]=sum_temp[k+1];
        end
        sum_temp_n[127] = 25'b0;
    end
end

//FSM
always_comb begin
    case (state)
        IDLE:  state_n = (in_valid)?        INPUT : state;
        INPUT: state_n = (in_count == 67)?  OUTPUT : state;
        OUTPUT: state_n = (out_count == 127)? IDLE : state;
        default: state_n = IDLE;
    endcase
end

always_comb begin
    in_count_n = in_count;
    out_count_n = out_count;
    out_valid_n = out_valid; 
    for (int j=0;j<128;j=j+1) begin
        count_n[j]=count[j];
    end
    out_data_n = 0;
    case (state)
        IDLE: begin
            in_count_n = 0;
            out_count_n = 0;
            out_valid_n = 0;
            out_data_n = 0;
            for (int j=0;j<128;j=j+1) begin
                count_n[j]=0;
            end
        end

        INPUT: begin
            if (in_count == 67) begin
                in_count_n = 0;
                for (int j=0;j<128;j=j+1) begin
                    count_n[j]=0;
                end
            end else begin
                in_count_n = in_count + 1;
                for (int j=0;j<128;j=j+1) begin
                    count_n[j]=count[j]+1;
                end
            end
        end

        OUTPUT: begin
            out_valid_n = 1'b1;
            out_count_n = out_count + 1;
            out_data_n = sum_temp[0];
            in_count_n = 0;
            for (int j=0;j<128;j=j+1) begin
                count_n[j]=0;
            end
            if (out_count == 127) begin
                out_count_n = 0;
            end 
        end
    endcase
end

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        in_count <= 0;
        out_count <= 0;
        out_valid <= 1'b0; 
        out_data<=0;
        for (int j=0;j<128;j=j+1) begin
            count[j]<=0;
        end
        for (int j=0;j<128;j=j+1) begin
            sum_temp[j]<=0;
        end
    end else begin
        state <= state_n;
        in_count <= in_count_n;
        out_count <= out_count_n;
        out_valid <= out_valid_n;
        out_data <= out_data_n;
        for (int j=0;j<128;j=j+1) begin
            count[j]<=count_n[j];
        end
        for (int j=0;j<128;j=j+1) begin
            sum_temp[j] <= sum_temp_n[j];
        end
    end
end

endmodule