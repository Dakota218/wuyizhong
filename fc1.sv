module fc1 (
    input clk,
    input rst_n,
    input logic [2303:0] weight ,
    input  logic [9:0] in_data,
    input in_valid,
    output logic out_valid,
    output logic [15:0] sum
);
logic signed [15:0] sum_temp [0:255], sum_temp_n[0:255];
logic signed [24:0] sum_wire [0:255];
logic signed [15:0] sum_n;
logic out_valid_n;
logic [6:0] in_count, in_count_n;   // 6-bit (0-63)
logic [6:0] count[0:255], count_n[0:255];
logic [7:0] out_count, out_count_n; // 8-bit (0-255)
localparam signed [10:0] bias [0:255] = '{
    16'hFF81,    16'hFFBA,    16'h0009,    16'hFFBC,    16'hFFE6,    16'h0067,    16'h0049,    16'hFF6E,    16'hFFEC,    16'h001F,    16'hFFCE,    16'h0022,    16'h0003,    16'hFEE2,    16'hFF45,    16'h003A,    16'hFFED,    16'h00F2,    16'h001F,    16'hFF96,    16'h0055,    16'h0082,    16'hFFA2,    16'h00BE,    16'h002B,    16'h0037,    16'h0012,    16'hFFD7,    16'hFF4C,    16'hFFFC,    16'h0071,    16'hFDA9,    16'hFFC6,    16'hFFB9,    16'h004F,    16'h00CB,    16'h0054,    16'hFFCB,    16'h000D,    16'hFFE9,    16'hFFD1,    16'hFFB6,    16'h00C4,    16'h0039,    16'h0049,    16'hFF14,    16'h000D,    16'h009D,    16'h005A,    16'hFFCE,    16'hFFD8,    16'hFFFA,    16'hFFAB,    16'h00C3,    16'hFD3F,    16'hFFF0,    16'hFF79,    16'h002B,    16'h0030,    16'hFFC8,    16'h006F,    16'hFF39,    16'hFF9A,    16'h0063,    16'hFF82,    16'hFFB7,    16'h0028,    16'h0063,    16'hFFE7,    16'h0059,    16'hFFB2,    16'h0005,    16'h00AD,    16'hFFFE,    16'h002A,    16'hFED5,    16'h004B,    16'h001A,    16'h034A,    16'h0003,    16'hFFA9,    16'h0040,    16'h0003,    16'h004F,    16'hFF8F,    16'h0026,    16'h0114,    16'hFFDE,    16'hFFC2,    16'hFFAB,    16'hFF22,    16'hFFD0,    16'h002B,    16'hFF4D,    16'hFFC9,    16'h000D,    16'h004E,    16'hFF2C,    16'hFFFD,    16'hFF35,    16'hFFF4,    16'h001D,    16'hFC81,    16'hFFEF,    16'h0005,    16'h006A,    16'hFFB3,    16'hFF20,    16'h0020,    16'h009E,    16'h00B9,    16'h014A,    16'h003A,    16'h00C7,    16'h0042,    16'h0094,    16'h007B,    16'h002D,    16'h00C5,    16'hFFB6,    16'h0049,    16'h004A,    16'h0065,    16'h0025,    16'hFFD8,    16'hFF9D,    16'hFF7E,    16'hFF3E,    16'h0054,    16'h0006,    16'h004A,    16'h0010,    16'hFFA4,    16'h0007,    16'h0077,    16'hFF96,    16'h003F,    16'h01AA,    16'hFFC7,    16'h000D,    16'hFFB7,    16'hFFE5,    16'h0011,    16'hFFAC,    16'hFEBA,    16'hFE83,    16'h0023,    16'h003F,    16'h0007,    16'h001E,    16'h0062,    16'h0040,    16'hFF6E,    16'hFFFA,    16'h0041,    16'hFFC1,    16'h0071,    16'h004F,    16'h000B,    16'h0144,    16'h0108,    16'hFF70,    16'h0027,    16'h0006,    16'h0069,    16'h014A,    16'hFFF1,    16'hFFE8,    16'h00A0,    16'hFFB5,    16'h00D4,    16'h0049,    16'hFFB1,    16'hFFA8,    16'hFFE6,    16'h000F,    16'h00AD,    16'h0090,    16'h0045,    16'h0002,    16'hFFAF,    16'hFF86,    16'hFFEE,    16'h005B,    16'h008D,    16'h012F,    16'hFFE7,    16'h000D,    16'hFFCB,    16'h00BA,    16'h0013,    16'h0016,    16'hFFD2,    16'h001A,    16'hFF31,    16'h0031,    16'hFFC4,    16'h0021,    16'h00CA,    16'hFFC3,    16'h0050,    16'hFFD1,    16'h0016,    16'hFFBE,    16'hFF62,    16'h0050,    16'hFFC7,    16'hFF7C,    16'h002D,    16'h0077,    16'hFFC4,    16'h003D,    16'h0032,    16'hFFB4,    16'h002E,    16'hFFFA,    16'hFF70,    16'hFFB6,    16'hFF84,    16'hFFA5,    16'h00CF,    16'hFFD8,    16'hFF70,    16'hFFE1,    16'h0033,    16'hFF0D,    16'h00E7,    16'hFFC3,    16'hFF63,    16'hFF59,    16'hFE81,    16'hFF2A,    16'h0007,    16'hFFEC,    16'h00DE,    16'hFFA8,    16'hFFF0,    16'hFF6D,    16'h007B,    16'h00CF,    16'hFF27,    16'h000D,    16'h007F,    16'h00AB,    16'h008A,    16'h0069,    16'hFF4E,    16'hFF4D,    16'h00C1,    16'h001A,    16'h008D,    16'hFFE9,    16'hFFAE,    16'hFFEF,    16'hFEDC,    16'h0020};

typedef enum logic [1:0] {
    IDLE,
    INPUT,
    OUTPUT
} state_t;

state_t state, state_n;

genvar i;
generate
    for (i = 0; i < 256; i = i + 1) begin        
        fc1_column fc (
            .clk(clk),
            .rst_n (rst_n),
            .weight (weight[(9*i)+8:9*i]),
            .in_data (in_data),
            .out_valid (out_valid),
            .bias(bias[i]),
            .in_count(count[i]),
            .sum (sum_wire[i])
        );    
    end
endgenerate

always_comb begin
    
    if(in_count==68 )begin
        for (int k=0;k<=255;k=k+1) begin
            sum_temp_n[k]=sum_wire[k];
        end
    end else begin
        for (int k=0;k<255;k=k+1) begin
            sum_temp_n[k]=sum_temp[k+1];
        end
        sum_temp_n[255] = 25'b0;
    end
end

//FSM
always_comb begin
    //state_n  = state;
    case (state)
        IDLE:  state_n = (in_valid)?        INPUT : state;
        INPUT: state_n = (in_count == 68)?  OUTPUT : state;
        OUTPUT: state_n = state;
        default: state_n = IDLE;

    endcase
end

always_comb begin
    in_count_n = in_count;
    out_count_n = out_count;
    out_valid_n = out_valid; 
    for (int j=0;j<256;j=j+1) begin
        count_n[j]=count[j];
    end
    sum_n = 0;
    case (state)
        IDLE: begin
            in_count_n = 0;
            out_count_n = 0;
            out_valid_n = 0;
            sum_n = 0;
            for (int j=0;j<256;j=j+1) begin
                count_n[j]=0;
            end
        end

        INPUT: begin
            if (in_count == 68) begin
                in_count_n = 0;
                for (int j=0;j<256;j=j+1) begin
                    count_n[j]=0;
                end
            end else begin
                in_count_n = in_count + 1;
                for (int j=0;j<256;j=j+1) begin
                    count_n[j]=count[j]+1;
                end
            end
        end

        OUTPUT: begin
            out_valid_n = 1'b1;
            out_count_n = out_count + 1;
            sum_n = sum_temp[0];
            in_count_n = 0;
            for (int j=0;j<256;j=j+1) begin
                count_n[j]=0;
            end
            if (out_count == 255) begin
                out_count_n = 0;
            end else if (out_count >= 187) begin
                in_count_n = in_count + 1;
                for (int j=0;j<256;j=j+1) begin
                    count_n[j]=count[j]+1;
                end
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
        sum<=0;
        for (int j=0;j<256;j=j+1) begin
            count[j]<=0;
        end
        for (int j=0;j<256;j=j+1) begin
            sum_temp[j]<=0;
        end
    end else begin
        state <= state_n;
        in_count <= in_count_n;
        out_count <= out_count_n;
        out_valid <= out_valid_n;
        sum <= sum_n;
        for (int j=0;j<256;j=j+1) begin
            count[j]<=count_n[j];
        end
        for (int j=0;j<256;j=j+1) begin
            sum_temp[j] <= sum_temp_n[j];
        end
    end
end

endmodule