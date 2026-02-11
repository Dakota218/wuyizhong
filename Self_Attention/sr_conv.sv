module SR_CONV (
    input clk,
    input rst_n,
    input logic [575:0] weight,
    input  logic [15:0] in_data,
    input in_valid,
    output logic out_valid,
    output logic [15:0] out_data
);
logic out_valid_n;
logic [15:0] out_data_n;
logic [15:0] out[0:63];
logic [6:0] in_count[0:63], in_count_n[0:63];
logic [5:0]out_count, out_count_n;
logic [15:0] out_temp[0:63], out_temp_n[0:63];
logic pre_out_valid[0:63];
localparam signed [11:0] bias [0:63] = '{
    16'h0404, 16'h0004, 16'hFF1A, 16'h005A, 16'h0018, 16'h005B, 16'hFFDB, 16'hFF68,
    16'h006E, 16'h006B, 16'hFE97, 16'hFEB3, 16'h0120, 16'h01C3, 16'h025B, 16'hFF39,
    16'hFFC9, 16'h0028, 16'h0098, 16'h0030, 16'h01B9, 16'h0117, 16'hFEE2, 16'hFE1A,
    16'h0057, 16'hFD74, 16'h002F, 16'h0061, 16'h0016, 16'hFFFC, 16'h009C, 16'h001E,
    16'h0048, 16'hFC9E, 16'h0095, 16'hFFE7, 16'h0002, 16'h003B, 16'hFFD6, 16'hFF72,
    16'h0037, 16'hFD0F, 16'h0165, 16'hFEF7, 16'h004A, 16'h007C, 16'h0007, 16'hFF78,
    16'h0049, 16'hFD85, 16'h0015, 16'h00F7, 16'hFF2C, 16'h0007, 16'hFFB4, 16'hFF50,
    16'hFFEF, 16'h000B, 16'h003D, 16'h0010, 16'hFFFA, 16'h0044, 16'h009C, 16'hFFF0
};

typedef enum logic [1:0] { 
    IDLE,
    INPUT,
    OUTPUT
} state_t;
state_t state, state_n;

genvar i;
generate
    for(i = 0; i <= 63; i = i + 1)begin
        SR_CONV_CHANNEL sr(
            .clk(clk),
            .rst_n(rst_n),
            .weight (weight[(9*i)+8:9*i]),
            .in_data (in_data),
            .bias(bias[i]),
            .in_valid(in_valid),
            .out_data (out[i]),
            .out_valid (pre_out_valid[i])
        );
    end
endgenerate
always_comb begin
    case (state)
        IDLE: state_n = (in_valid)? INPUT : IDLE;
        INPUT: state_n = (pre_out_valid[0])? OUTPUT : INPUT;
        OUTPUT: state_n = (out_count == 63)? INPUT : OUTPUT;
        default: state_n = IDLE;
    endcase
end
always_comb begin
    if(pre_out_valid[0])begin
        for(int i = 0; i < 64; i = i + 1)begin
            out_temp_n[i] = out[i];
        end
    end else begin
        for(int i = 0; i < 63; i = i + 1)begin
            out_temp_n[i] = out_temp[i + 1];
        end
        out_temp_n[63] = out_temp[0];
    end
end
always_comb begin
    out_valid_n = out_valid;
    out_data_n = out_data;
    out_count_n = out_count;
    case (state)
        IDLE: begin
            out_count_n = 0;
            out_valid_n = 0;
        end
        INPUT: begin
            out_count_n = 0;
            out_valid_n = 0;
        end
        OUTPUT: begin
            out_data_n = out_temp[0];
            out_count_n = out_count + 1;
            out_valid_n = 1;
        end
    endcase
end
always_ff @(posedge clk or negedge rst_n)begin
    if(!rst_n)begin
        state <= IDLE;
        out_valid <= 0;
        out_data <= 0;
        out_count <=0;
        for(int i = 0; i < 64; i = i + 1)begin
            out_temp[i] = 0;
        end
    end else begin
        state <= state_n;
        out_valid <= out_valid_n;
        out_data <= out_data_n;
        out_count <= out_count_n;
        for(int i = 0; i < 64; i = i + 1)begin
            out_temp[i] = out_temp_n[i];
        end
    end
end

endmodule