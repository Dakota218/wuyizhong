module dwconv (
    input clk,
    input rst_n,
    input logic [143:0] weight ,
    input logic [15:0] in_data,
    input logic [15:0] bias,
    input in_valid,
    output logic out_valid,
    output logic [20:0] sum
);

logic out_valid_n;
logic [6:0] in_row, in_row_n, conv_row, conv_row_n; 
logic [7:0] in_col, in_col_n, conv_col, conv_col_n;
logic [8:0] in_count, in_count_n; 
// logic start_conv, start_conv_n;
logic conv_flag;

logic [7:0] out_count, out_count_n; // 8-bit (0-255)   
logic [20:0] sum_temp[0:255], sum_temp_n[0:255];

typedef enum logic [1:0] {
    IDLE,
    INPUT,
    OUTPUT
} state_t;

state_t state, state_n;


dwconv_channel dw (
    .clk(clk),
    .rst_n (rst_n),
    .in_valid (in_valid),
    .weight (weight),
    .in_data (in_data),
    .bias (bias),
    .col(conv_col),
    .row(conv_row),
    .in_count(in_count),

    .out_valid (out_valid),
    // .in_count(count[i]),
    .sum (sum)
);


// always_comb begin
//     for (int k=0; k<255; k=k+1) begin
//         sum_temp_n[k] = sum_temp[k+1];
//     end
//     for (int k = 0; k < 256; k++) begin
//         sum[k*21 +: 21] = sum_temp[k];
//     end
// end

//FSM
always_comb begin
    state_n  = state;
    case (state)
        IDLE:  state_n = (in_valid)?        INPUT : state;
        INPUT: state_n = state;//////////////
        OUTPUT: state_n = (out_count == 255)? INPUT : state;
        default: state_n = IDLE;

    endcase
end

assign in_count_n = (in_count == 256)? 1 : in_count + (in_valid);
// assign start_conv_n = (in_row == 0 && in_col == 175 && in_count == 254)? 1'b1 : start_conv;
// assign conv_flag = (in_row && in_count == 255)? !(in_row == 1 && in_col == 0) : 1'b0;
assign conv_flag = (in_row && in_count == 255);
always_comb begin
    in_row_n = in_row;
    conv_row_n = conv_row;
    in_col_n = in_col;
    conv_col_n = conv_col;

    case (state)
        IDLE: begin
        end

        INPUT: begin
            if (in_count == 256) begin
                in_row_n = (in_col == 175)? in_row + 1 : in_row;
                in_col_n = (in_col == 175)? 0 : in_col + 1;
            end else begin
                conv_col_n = (conv_flag) ? ((conv_col == 176) ? 1 : conv_col + 1) : conv_col;
                conv_row_n = (conv_flag && conv_col == 176) ? conv_row + 1 : conv_row;
            end
        end

        OUTPUT: begin
        end
    endcase
end

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= IDLE;
        in_row <= 0;
        in_col <= 0;
        conv_row <= 0; 
        conv_col <= 0;
        // start_conv <= 0;
        in_count <= 0;
        for (int k=0; k<256; k=k+1) begin
            sum_temp[k] <= 0;
        end


        out_count <= 0;
        // out_valid <= 0;

    end else begin
        state <= state_n;
        in_row <= in_row_n;
        in_col <= in_col_n;
        conv_row <= conv_row_n;
        conv_col <= conv_col_n;
        // start_conv <= start_conv_n;
        in_count <= in_count_n;
        // for (int k=0; k<256; k=k+1) begin
        //     sum_temp[k] <= sum_temp_n[k];
        // end

        out_count <= out_count_n;
        // out_valid <= out_valid_n;

    end
end

//outvalid等256個串完就=1
endmodule