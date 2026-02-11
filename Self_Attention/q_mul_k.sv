module Q_MUL_K(
    input clk,
    input rst_n,
    input logic [15:0] in_data_q,
    input  logic [5631:0] in_data_k,
    input in_valid,
    output logic out_valid,
    output logic [15:0] out_data
);
logic signed [15:0] sum_temp [0:351], sum_temp_n[0:351];
logic signed [30:0] sum_wire [0:351];
logic signed [15:0] out_data_n;
logic out_valid_n;
logic [6:0] in_count, in_count_n;   
logic [6:0] count[0:351], count_n[0:351];
logic [8:0] out_count, out_count_n; 
localparam signed [15:0] invert_lut [0:511] = '{
    // Index 0 - 63
    16'h0000, 16'hFFFF, 16'h8000, 16'h5555, 16'h4000, 16'h3333, 16'h2AAA, 16'h2492,
    16'h2000, 16'h1C72, 16'h199A, 16'h1746, 16'h1555, 16'h13B1, 16'h1249, 16'h1111,
    16'h1000, 16'h0F0F, 16'h0E39, 16'h0D79, 16'h0CCD, 16'h0C31, 16'h0BA3, 16'h0B21,
    16'h0AAB, 16'h0A3D, 16'h09D9, 16'h097B, 16'h0925, 16'h08D4, 16'h0888, 16'h0842,
    16'h0800, 16'h07C2, 16'h0788, 16'h0750, 16'h071C, 16'h06EB, 16'h06BD, 16'h0690,
    16'h0666, 16'h063E, 16'h0618, 16'h05F4, 16'h05D1, 16'h05B0, 16'h0591, 16'h0572,
    16'h0555, 16'h0539, 16'h051F, 16'h0505, 16'h04EC, 16'h04D5, 16'h04BE, 16'h04A8,
    16'h0492, 16'h047E, 16'h046A, 16'h0457, 16'h0444, 16'h0432, 16'h0421, 16'h0410,

    // Index 64 - 127
    16'h0400, 16'h03F0, 16'h03E1, 16'h03D2, 16'h03C4, 16'h03B6, 16'h03A8, 16'h039B,
    16'h038E, 16'h0382, 16'h0376, 16'h036A, 16'h035E, 16'h0353, 16'h0348, 16'h033E,
    16'h0333, 16'h0329, 16'h031F, 16'h0316, 16'h030C, 16'h0303, 16'h02FA, 16'h02F1,
    16'h02E9, 16'h02E0, 16'h02D8, 16'h02D0, 16'h02C8, 16'h02C1, 16'h02B9, 16'h02B2,
    16'h02AB, 16'h02A4, 16'h029D, 16'h0296, 16'h028F, 16'h0289, 16'h0282, 16'h027C,
    16'h0276, 16'h0270, 16'h026A, 16'h0264, 16'h025F, 16'h0259, 16'h0254, 16'h024E,
    16'h0249, 16'h0244, 16'h023F, 16'h023A, 16'h0235, 16'h0230, 16'h022B, 16'h0227,
    16'h0222, 16'h021E, 16'h0219, 16'h0215, 16'h0211, 16'h020C, 16'h0208, 16'h0204,

    // Index 128 - 255 (每列 8 個)
    16'h0200, 16'h01FC, 16'h01F8, 16'h01F4, 16'h01F0, 16'h01ED, 16'h01E9, 16'h01E5,
    16'h01E2, 16'h01DE, 16'h01DB, 16'h01D7, 16'h01D4, 16'h01D1, 16'h01CE, 16'h01CA,
    16'h01C7, 16'h01C4, 16'h01C1, 16'h01BE, 16'h01BB, 16'h01B8, 16'h01B5, 16'h01B2,
    16'h01AF, 16'h01AC, 16'h01AA, 16'h01A7, 16'h01A4, 16'h01A1, 16'h019F, 16'h019C,
    16'h019A, 16'h0197, 16'h0195, 16'h0192, 16'h0190, 16'h018D, 16'h018B, 16'h0188,
    16'h0186, 16'h0184, 16'h0182, 16'h017F, 16'h017D, 16'h017B, 16'h0179, 16'h0176,
    16'h0174, 16'h0172, 16'h0170, 16'h016E, 16'h016C, 16'h016A, 16'h0168, 16'h0166,
    16'h0164, 16'h0162, 16'h0160, 16'h015E, 16'h015D, 16'h015B, 16'h0159, 16'h0157,
    16'h0155, 16'h0154, 16'h0152, 16'h0150, 16'h014E, 16'h014D, 16'h014B, 16'h0149,
    16'h0148, 16'h0146, 16'h0144, 16'h0143, 16'h0141, 16'h0140, 16'h013E, 16'h013D,
    16'h013B, 16'h013A, 16'h0138, 16'h0137, 16'h0135, 16'h0134, 16'h0132, 16'h0131,
    16'h012F, 16'h012E, 16'h012D, 16'h012B, 16'h012A, 16'h0129, 16'h0127, 16'h0126,
    16'h0125, 16'h0123, 16'h0122, 16'h0121, 16'h011F, 16'h011E, 16'h011D, 16'h011C,
    16'h011A, 16'h0119, 16'h0118, 16'h0117, 16'h0116, 16'h0115, 16'h0113, 16'h0112,
    16'h0111, 16'h0110, 16'h010F, 16'h010E, 16'h010D, 16'h010B, 16'h010A, 16'h0109,
    16'h0108, 16'h0107, 16'h0106, 16'h0105, 16'h0104, 16'h0103, 16'h0102, 16'h0101,

    // Index 256 - 511
    16'h0100, 16'h00FF, 16'h00FE, 16'h00FD, 16'h00FC, 16'h00FB, 16'h00FA, 16'h00F9,
    16'h00F8, 16'h00F7, 16'h00F6, 16'h00F5, 16'h00F5, 16'h00F4, 16'h00F3, 16'h00F2,
    16'h00F1, 16'h00F0, 16'h00EF, 16'h00EE, 16'h00ED, 16'h00ED, 16'h00EC, 16'h00EB,
    16'h00EA, 16'h00E9, 16'h00E8, 16'h00E8, 16'h00E7, 16'h00E6, 16'h00E5, 16'h00E4,
    16'h00E4, 16'h00E3, 16'h00E2, 16'h00E1, 16'h00E0, 16'h00E0, 16'h00DF, 16'h00DE,
    16'h00DD, 16'h00DD, 16'h00DC, 16'h00DB, 16'h00DA, 16'h00DA, 16'h00D9, 16'h00D8,
    16'h00D8, 16'h00D7, 16'h00D6, 16'h00D5, 16'h00D5, 16'h00D4, 16'h00D3, 16'h00D3,
    16'h00D2, 16'h00D1, 16'h00D1, 16'h00D0, 16'h00CF, 16'h00CF, 16'h00CE, 16'h00CD,
    16'h00CD, 16'h00CC, 16'h00CC, 16'h00CB, 16'h00CA, 16'h00CA, 16'h00C9, 16'h00C8,
    16'h00C8, 16'h00C7, 16'h00C7, 16'h00C6, 16'h00C5, 16'h00C5, 16'h00C4, 16'h00C4,
    16'h00C3, 16'h00C2, 16'h00C2, 16'h00C1, 16'h00C1, 16'h00C0, 16'h00C0, 16'h00BF,
    16'h00BF, 16'h00BE, 16'h00BD, 16'h00BD, 16'h00BC, 16'h00BC, 16'h00BB, 16'h00BB,
    16'h00BA, 16'h00BA, 16'h00B9, 16'h00B9, 16'h00B8, 16'h00B8, 16'h00B7, 16'h00B7,
    16'h00B6, 16'h00B6, 16'h00B5, 16'h00B5, 16'h00B4, 16'h00B4, 16'h00B3, 16'h00B3,
    16'h00B2, 16'h00B2, 16'h00B1, 16'h00B1, 16'h00B0, 16'h00B0, 16'h00AF, 16'h00AF,
    16'h00AE, 16'h00AE, 16'h00AD, 16'h00AD, 16'h00AC, 16'h00AC, 16'h00AC, 16'h00AB,
    16'h00AB, 16'h00AA, 16'h00AA, 16'h00A9, 16'h00A9, 16'h00A8, 16'h00A8, 16'h00A8,
    16'h00A7, 16'h00A7, 16'h00A6, 16'h00A6, 16'h00A5, 16'h00A5, 16'h00A5, 16'h00A4,
    16'h00A4, 16'h00A3, 16'h00A3, 16'h00A3, 16'h00A2, 16'h00A2, 16'h00A1, 16'h00A1,
    16'h00A1, 16'h00A0, 16'h00A0, 16'h009F, 16'h009F, 16'h009F, 16'h009E, 16'h009E,
    16'h009E, 16'h009D, 16'h009D, 16'h009C, 16'h009C, 16'h009C, 16'h009B, 16'h009B,
    16'h009B, 16'h009A, 16'h009A, 16'h0099, 16'h0099, 16'h0099, 16'h0098, 16'h0098,
    16'h0098, 16'h0097, 16'h0097, 16'h0097, 16'h0096, 16'h0096, 16'h0096, 16'h0095,
    16'h0095, 16'h0095, 16'h0094, 16'h0094, 16'h0094, 16'h0093, 16'h0093, 16'h0093,
    16'h0092, 16'h0092, 16'h0092, 16'h0091, 16'h0091, 16'h0091, 16'h0090, 16'h0090,
    16'h0090, 16'h008F, 16'h008F, 16'h008F, 16'h008E, 16'h008E, 16'h008E, 16'h008E,
    16'h008D, 16'h008D, 16'h008D, 16'h008C, 16'h008C, 16'h008C, 16'h008B, 16'h008B,
    16'h008B, 16'h008B, 16'h008A, 16'h008A, 16'h008A, 16'h0089, 16'h0089, 16'h0089,
    16'h0089, 16'h0088, 16'h0088, 16'h0088, 16'h0087, 16'h0087, 16'h0087, 16'h0087,
    16'h0086, 16'h0086, 16'h0086, 16'h0085, 16'h0085, 16'h0085, 16'h0085, 16'h0084,
    16'h0084, 16'h0084, 16'h0084, 16'h0083, 16'h0083, 16'h0083, 16'h0083, 16'h0082,
    16'h0082, 16'h0082, 16'h0082, 16'h0081, 16'h0081, 16'h0081, 16'h0080, 16'h0080
};
localparam [15:0] exp_lut [0:255] = '{
    // Index 0 - 63
    16'h0016, 16'h0017, 16'h0017, 16'h0018, 16'h0019, 16'h001A, 16'h001B, 16'h001B,
    16'h001C, 16'h001D, 16'h001E, 16'h001F, 16'h0020, 16'h0021, 16'h0022, 16'h0023,
    16'h0024, 16'h0025, 16'h0027, 16'h0028, 16'h0029, 16'h002A, 16'h002C, 16'h002D,
    16'h002F, 16'h0030, 16'h0032, 16'h0033, 16'h0035, 16'h0037, 16'h0038, 16'h003A,
    16'h003C, 16'h003E, 16'h0040, 16'h0042, 16'h0044, 16'h0046, 16'h0048, 16'h004B,
    16'h004D, 16'h0050, 16'h0052, 16'h0055, 16'h0057, 16'h005A, 16'h005D, 16'h0060,
    16'h0063, 16'h0066, 16'h006A, 16'h006D, 16'h0070, 16'h0074, 16'h0078, 16'h007B,
    16'h007F, 16'h0083, 16'h0088, 16'h008C, 16'h0090, 16'h0095, 16'h009A, 16'h009F,

    // Index 64 - 127
    16'h00A4, 16'h00A9, 16'h00AE, 16'h00B4, 16'h00BA, 16'h00C0, 16'h00C6, 16'h00CC,
    16'h00D2, 16'h00D9, 16'h00E0, 16'h00E7, 16'h00EF, 16'h00F6, 16'h00FE, 16'h0106,
    16'h010E, 16'h0117, 16'h0120, 16'h0129, 16'h0133, 16'h013C, 16'h0146, 16'h0151,
    16'h015C, 16'h0167, 16'h0172, 16'h017E, 16'h018A, 16'h0197, 16'h01A4, 16'h01B1,
    16'h01BF, 16'h01CD, 16'h01DC, 16'h01EB, 16'h01FB, 16'h020B, 16'h021B, 16'h022D,
    16'h023E, 16'h0251, 16'h0263, 16'h0277, 16'h028B, 16'h02A0, 16'h02B5, 16'h02CB,
    16'h02E2, 16'h02FA, 16'h0312, 16'h032B, 16'h0345, 16'h035F, 16'h037B, 16'h0397,
    16'h03B5, 16'h03D3, 16'h03F2, 16'h0412, 16'h0433, 16'h0456, 16'h0479, 16'h049E,

    // Index 128 - 191
    16'h04C3, 16'h04EA, 16'h0512, 16'h053C, 16'h0566, 16'h0592, 16'h05C0, 16'h05EF,
    16'h061F, 16'h0651, 16'h0685, 16'h06BA, 16'h06F1, 16'h0729, 16'h0764, 16'h07A0,
    16'h07DE, 16'h081E, 16'h0861, 16'h08A5, 16'h08EC, 16'h0934, 16'h097F, 16'h09CD,
    16'h0A1D, 16'h0A6F, 16'h0AC4, 16'h0B1C, 16'h0B77, 16'h0BD5, 16'h0C35, 16'h0C99,
    16'h0CFF, 16'h0D69, 16'h0DD7, 16'h0E48, 16'h0EBC, 16'h0F35, 16'h0FB1, 16'h1031,
    16'h10B5, 16'h113D, 16'h11CA, 16'h125B, 16'h12F0, 16'h138B, 16'h142A, 16'h14CF,
    16'h1579, 16'h1628, 16'h16DD, 16'h1797, 16'h1858, 16'h191E, 16'h19EB, 16'h1ABF,
    16'h1B99, 16'h1C7A, 16'h1D62, 16'h1E52, 16'h1F49, 16'h2049, 16'h2150, 16'h2260,

    // Index 192 - 255
    16'h2378, 16'h249A, 16'h25C4, 16'h26F8, 16'h2836, 16'h297F, 16'h2AD1, 16'h2C2E,
    16'h2D97, 16'h2F0B, 16'h308B, 16'h3217, 16'h33AF, 16'h3555, 16'h3708, 16'h38C9,
    16'h3A98, 16'h3C76, 16'h3E64, 16'h4061, 16'h426E, 16'h448C, 16'h46BB, 16'h48FC,
    16'h4B50, 16'h4DB6, 16'h5030, 16'h52BE, 16'h5562, 16'h581A, 16'h5AE9, 16'h5DCF,
    16'h60CC, 16'h63E2, 16'h6711, 16'h6A59, 16'h6DBD, 16'h713C, 16'h74D8, 16'h7892,
    16'h7C69, 16'h8060, 16'h8478, 16'h88B0, 16'h8D0C, 16'h918A, 16'h962E, 16'h9AF7,
    16'h9FE7, 16'hA500, 16'hAA42, 16'hAFAF, 16'hB549, 16'hBB10, 16'hC106, 16'hC72D,
    16'hCD86, 16'hD412, 16'hDAD5, 16'hE1CE, 16'hE900, 16'hF06D, 16'hF817, 16'hFFFF
};
typedef enum logic [1:0] {
    IDLE,
    INPUT,
    OUTPUT
} state_t;

state_t state, state_n;

genvar i;
generate
    for (i = 0; i < 352; i = i + 1) begin        
        Q_MUL_K_COLUMN fc (
            .clk(clk),
            .rst_n (rst_n),
            .in_data_k (in_data_k[(16*i)+15:16*i]),
            .in_data_q (in_data_q),
            .out_valid (out_valid),
            .in_count(count[i]),
            .sum (sum_wire[i])
        );    
    end
endgenerate

always_comb begin
    
    if(in_count==66 )begin
        for (int k=0;k<=351;k=k+1) begin
            sum_temp_n[k]=sum_wire[k];
        end
    end else begin
        for (int k=0;k<351;k=k+1) begin
            sum_temp_n[k]=sum_temp[k+1];
        end
        sum_temp_n[351] = 25'b0;
    end
end

//FSM
always_comb begin
    case (state)
        IDLE:  state_n = (in_valid)?        INPUT : state;
        INPUT: state_n = (in_count == 66)?  OUTPUT : state;
        OUTPUT: state_n = (out_count == 351)? IDLE : state;
        default: state_n = IDLE;
    endcase
end

always_comb begin
    in_count_n = in_count;
    out_count_n = out_count;
    out_valid_n = out_valid; 
    for (int j=0;j<352;j=j+1) begin
        count_n[j]=count[j];
    end
    out_data_n = 0;
    case (state)
        IDLE: begin
            in_count_n = 0;
            out_count_n = 0;
            out_valid_n = 0;
            out_data_n = 0;
            for (int j=0;j<352;j=j+1) begin
                count_n[j]=0;
            end
        end

        INPUT: begin
            if (in_count == 66) begin
                in_count_n = 0;
                for (int j=0;j<352;j=j+1) begin
                    count_n[j]=0;
                end
            end else begin
                in_count_n = in_count + 1;
                for (int j=0;j<352;j=j+1) begin
                    count_n[j]=count[j]+1;
                end
            end
        end

        OUTPUT: begin
            out_valid_n = 1'b1;
            out_count_n = out_count + 1;
            out_data_n = sum_temp[0];
            in_count_n = 0;
            for (int j=0;j<352;j=j+1) begin
                count_n[j]=0;
            end
            if (out_count == 351) begin
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
        for (int j=0;j<352;j=j+1) begin
            count[j]<=0;
        end
        for (int j=0;j<352;j=j+1) begin
            sum_temp[j]<=0;
        end
    end else begin
        state <= state_n;
        in_count <= in_count_n;
        out_count <= out_count_n;
        out_valid <= out_valid_n;
        out_data <= out_data_n;
        for (int j=0;j<352;j=j+1) begin
            count[j]<=count_n[j];
        end
        for (int j=0;j<352;j=j+1) begin
            sum_temp[j] <= sum_temp_n[j];
        end
    end
end

endmodule