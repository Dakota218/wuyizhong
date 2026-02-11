module LN (
    input clk,
    input rst_n,
    input logic [15:0] weight,
    input logic [15:0] bias,
    input  logic [15:0] in_data,
    input in_valid,
    output logic out_valid,
    output logic [15:0] out_data
);
/*localparam signed[15:0] lut [0:191] = '{
    // 前 64 個數值 (ffff ...)
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,
    16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF, 16'hFFFF,

    // 中間 64 個數值 (fe06 ... d106)
    16'hFFFF, 16'hFE06, 16'hFC17, 16'hFA34, 16'hF85B, 16'hF68D, 16'hF4C8, 16'hF30E,
    16'hF15C, 16'hEFB3, 16'hEE13, 16'hEC7C, 16'hEAEC, 16'hE964, 16'hE7E4, 16'hE66B,
    16'hE4F9, 16'hE38E, 16'hE22A, 16'hE0CC, 16'hDF75, 16'hDE23, 16'hDCD7, 16'hDB92,
    16'hDA51, 16'hD916, 16'hD7E1, 16'hD6B0, 16'hD585, 16'hD45E, 16'hD33C, 16'hD21F,
    16'hD106, 16'hCFF1, 16'hCEE1, 16'hCDD5, 16'hCCCD, 16'hCBC9, 16'hCAC8, 16'hC9CC,
    16'hC8D3, 16'hC7DD, 16'hC6EB, 16'hC5FD, 16'hC512, 16'hC42A, 16'hC345, 16'hC263,
    16'hC185, 16'hC0A9, 16'hBFD0, 16'hBEFA, 16'hBE27, 16'hBD56, 16'hBC89, 16'hBBBD,
    16'hBAF5, 16'hBA2F, 16'hB96B, 16'hB8A9, 16'hB7EA, 16'hB72E, 16'hB673, 16'hB5BB,

    // 後續 64 個數值 (b505 ... a069)
    16'hB505, 16'hB451, 16'hB39F, 16'hB2EF, 16'hB241, 16'hB196, 16'hB0EC, 16'hB044,
    16'hAF9D, 16'hAEF9, 16'hAE56, 16'hADB6, 16'hAD16, 16'hAC79, 16'hABDD, 16'hAB43,
    16'hAAAB, 16'hAA14, 16'hA97E, 16'hA8EB, 16'hA858, 16'hA7C7, 16'hA738, 16'hA6AA,
    16'hA61D, 16'hA592, 16'hA508, 16'hA480, 16'hA3F9, 16'hA373, 16'hA2EE, 16'hA26B,
    16'hA1E9, 16'hA168, 16'hA0E8, 16'hA069, 16'h9FEC, 16'h9F70, 16'h9EF5, 16'h9E7B,
    16'h9E02, 16'h9D8A, 16'h9D13, 16'h9C9D, 16'h9C29, 16'h9BB5, 16'h9B42, 16'h9AD0,
    16'h9A60, 16'h99F0, 16'h9981, 16'h9913, 16'h98A6, 16'h983A, 16'h97CF, 16'h9764,
    16'h96FB, 16'h9692, 16'h962B, 16'h95C4, 16'h955E, 16'h94F8, 16'h9494, 16'h9430,

    // 最後 64 個數值 (93cd ... 8040)
    16'h93CD, 16'h936B, 16'h930A, 16'h92A9, 16'h9249, 16'h91EA, 16'h918C, 16'h912E,
    16'h90D1, 16'h9074, 16'h9019, 16'h8FBE, 16'h8F64, 16'h8F0A, 16'h8EB1, 16'h8E59,
    16'h8E01, 16'h8DAA, 16'h8D53, 16'h8CFD, 16'h8CA8, 16'h8C54, 16'h8C00, 16'h8BAC,
    16'h8B59, 16'h8B07, 16'h8AB5, 16'h8A64, 16'h8A13, 16'h89C3, 16'h8974, 16'h8925,
    16'h88D6, 16'h8889, 16'h883B, 16'h87EE, 16'h87A2, 16'h8756, 16'h870B, 16'h86C0,
    16'h8675, 16'h862B, 16'h85E2, 16'h8599, 16'h8550, 16'h8508, 16'h84C1, 16'h8479,
    16'h8433, 16'h83EC, 16'h83A7, 16'h8361, 16'h831C, 16'h82D8, 16'h8293, 16'h8250,
    16'h820C, 16'h81C9, 16'h8187, 16'h8145, 16'h8103, 16'h80C2, 16'h8081, 16'h8040
};*/
localparam signed [19:0] lut [0:255] = '{
    // 前段數據 (混合 16-bit 與 20-bit)
    20'h0FFFF, 20'h80000, 20'h5A828, 20'h49E6A, 20'h40000, 20'h393E5, 20'h34418, 20'h30612,
    20'h2D414, 20'h2AAAB, 20'h287A2, 20'h2697F, 20'h24F35, 20'h23803, 20'h2235A, 20'h210CB,
    20'h20000, 20'h1F0B7, 20'h1E2B8, 20'h1D5D8, 20'h1C9F2, 20'h1BEE9, 20'h1B4A3, 20'h1AB0A,
    20'h1A20C, 20'h1999A, 20'h191A5, 20'h18A23, 20'h18309, 20'h17C4E, 20'h175E9, 20'h16FD5,
    20'h16A0A, 20'h16483, 20'h15F3B, 20'h15A2D, 20'h15555, 20'h150B0, 20'h14C3B, 20'h147F1,
    20'h143D1, 20'h13FD8, 20'h13C03, 20'h13851, 20'h134BF, 20'h1314C, 20'h12DF6, 20'h12ABB,
    20'h1279A, 20'h12492, 20'h121A2, 20'h11EC7, 20'h11C02, 20'h11950, 20'h116B3, 20'h11427,
    20'h111AD, 20'h10F44, 20'h10CEA, 20'h10AA0, 20'h10865, 20'h10638, 20'h10419, 20'h10206,

    // 中段數據 (由 10000 開始下降)
    20'h10000, 20'h0FE06, 20'h0FC17, 20'h0FA34, 20'h0F85B, 20'h0F68D, 20'h0F4C8, 20'h0F30E,
    20'h0F15C, 20'h0EFB3, 20'h0EE13, 20'h0EC7C, 20'h0EAEC, 20'h0E964, 20'h0E7E4, 20'h0E66B,
    20'h0E4F9, 20'h0E38E, 20'h0E22A, 20'h0E0CC, 20'h0DF75, 20'h0DE23, 20'h0DCD7, 20'h0DB92,
    20'h0DA51, 20'h0D916, 20'h0D7E1, 20'h0D6B0, 20'h0D585, 20'h0D45E, 20'h0D33C, 20'h0D21F,
    20'h0D106, 20'h0CFF1, 20'h0CEE1, 20'h0CDD5, 20'h0CCCD, 20'h0CBC9, 20'h0CAC8, 20'h0C9CC,
    20'h0C8D3, 20'h0C7DD, 20'h0C6EB, 20'h0C5FD, 20'h0C512, 20'h0C42A, 20'h0C345, 20'h0C263,
    20'h0C185, 20'h0C0A9, 20'h0BFD0, 20'h0BEFA, 20'h0BE27, 20'h0BD56, 20'h0BC89, 20'h0BBBD,
    20'h0BAF5, 20'h0BA2F, 20'h0B96B, 20'h0B8A9, 20'h0B7EA, 20'h0B72E, 20'h0B673, 20'h0B5BB,

    // 後段數據 (下降至 8040)
    20'h0B505, 20'h0B451, 20'h0B39F, 20'h0B2EF, 20'h0B241, 20'h0B196, 20'h0B0EC, 20'h0B044,
    20'h0AF9D, 20'h0AEF9, 20'h0AE56, 20'h0ADB6, 20'h0AD16, 20'h0AC79, 20'h0ABDD, 20'h0AB43,
    20'h0AAAB, 20'h0AA14, 20'h0A97E, 20'h0A8EB, 20'h0A858, 20'h0A7C7, 20'h0A738, 20'h0A6AA,
    20'h0A61D, 20'h0A592, 20'h0A508, 20'h0A480, 20'h0A3F9, 20'h0A373, 20'h0A2EE, 20'h0A26B,
    20'h0A1E9, 20'h0A168, 20'h0A0E8, 20'h0A069, 20'h09FEC, 20'h09F70, 20'h09EF5, 20'h09E7B,
    20'h09E02, 20'h09D8A, 20'h09D13, 20'h09C9D, 20'h09C29, 20'h09BB5, 20'h09B42, 20'h09AD0,
    20'h09A60, 20'h099F0, 20'h09981, 20'h09913, 20'h098A6, 20'h0983A, 20'h097CF, 20'h09764,
    20'h096FB, 20'h09692, 20'h0962B, 20'h095C4, 20'h0955E, 20'h094F8, 20'h09494, 20'h09430,

    20'h093CD, 20'h0936B, 20'h0930A, 20'h092A9, 20'h09249, 20'h091EA, 20'h0918C, 20'h0912E,
    20'h090D1, 20'h09074, 20'h09019, 20'h08FBE, 20'h08F64, 20'h08F0A, 20'h08EB1, 20'h08E59,
    20'h08E01, 20'h08DAA, 20'h08D53, 20'h08CFD, 20'h08CA8, 20'h08C54, 20'h08C00, 20'h08BAC,
    20'h08B59, 20'h08B07, 20'h08AB5, 20'h08A64, 20'h08A13, 20'h089C3, 20'h08974, 20'h08925,
    20'h088D6, 20'h08889, 20'h083B,  20'h087EE, 20'h087A2, 20'h08756, 20'h0870B, 20'h086C0,
    20'h08675, 20'h0862B, 20'h085E2, 20'h08599, 20'h08550, 20'h08508, 20'h084C1, 20'h08479,
    20'h08433, 20'h083EC, 20'h083A7, 20'h08361, 20'h0831C, 20'h082D8, 20'h08293, 20'h08250,
    20'h0820C, 20'h081C9, 20'h08187, 20'h08145, 20'h08103, 20'h080C2, 20'h08081, 20'h08040
};
logic signed[24:0] sum, sum_n;
logic signed[35:0] sum_2, sum_2_n;
logic signed[15:0] in_data_reg, weight_reg;
logic signed[15:0] x[0:63], x_n[0:63];
logic signed[31:0]  x_2[0:63], x_2_n[0:63];
logic [6:0] in_count, in_count_n;
logic signed [15:0] avg, avg_n;
logic signed [24:0] avg_2, avg_2_n;
logic signed [27:0] vari, vari_n;
logic signed [25:0] vari_norm;
logic signed [15:0] x_avg_diff, x_avg_diff_n, x_avg_diff_reg[0:2], x_avg_diff_reg_n[0:2];
logic signed [19:0] lut_num, lut_out, lut_out_next;
logic signed [31:0] out_temp[0:2], out_temp_n[0:2];
logic signed [15:0] out_data_n;
logic signed [35:0] bias_extended;
logic signed [15:0] bias_reg;
logic [1:0]fraction;
logic [7:0] lut_addr, lut_addr_n;
logic [4:0] k;
logic out_valid_n;
typedef enum logic [1:0] { IDLE, INPUT, EVA, OUTPUT } state_t;
state_t state, state_n;
assign bias_extended = {bias_reg, 20'b0};
always_comb begin
    state_n = state;
    case(state)
        IDLE:state_n = (in_valid)? INPUT:IDLE;
        INPUT:state_n = (in_count == 63)? EVA:INPUT;
        EVA:state_n = (in_count == 9)? OUTPUT:EVA;
        OUTPUT:state_n = (in_count == 63)? IDLE:OUTPUT;
    endcase
end
always_comb begin
    case(state)
        IDLE:begin
            sum_n = 0; 
            sum_2_n = 0;
        end
        INPUT:begin
            if(in_count == 1)begin
                sum_n = x[0];
                sum_2_n = x_2[0];
            end else begin
                sum_n = sum + x[0];
                sum_2_n = sum_2 + x_2[0];
            end
        end
        EVA:begin
            if(in_count == 0)begin
                sum_n = sum + x[0];
                sum_2_n = sum_2 + x_2[0];
            end else begin
                sum_n = sum;
                sum_2_n = sum_2;
            end
        end
        OUTPUT:begin
            sum_n = sum; 
            sum_2_n = sum_2_n;
        end
    endcase
end
always_comb begin
    out_valid_n = 0;
    case(state)
        IDLE:begin
            in_count_n = 0;
        end
        INPUT:begin
            if(in_count == 63) in_count_n = 0;
            else in_count_n = in_count + 1;
        end
        EVA:begin
            if(in_count == 9) in_count_n = 0;
            else in_count_n = in_count + 1;
            if(in_count == 9)begin
                out_valid_n = 1;
            end
        end
        OUTPUT:begin
            if(in_count == 63) in_count_n = 0;
            else in_count_n = in_count + 1;
            if(in_count == 63)begin
                out_valid_n = 0;
            end else begin
                out_valid_n = 1;
            end
        end
    endcase
end
always_comb begin
    case(state)
        IDLE:begin
            for(int i = 0; i <= 63; i = i + 1)begin
                x_n[i] = 0;
                x_2_n[i] = 0;
            end
        end
        INPUT:begin
            x_n[0] = in_data_reg;
            x_2_n[0] = in_data_reg * in_data_reg;
            for(int i = 1; i <= 63; i = i + 1)begin
                x_n[i] = x[i-1];
                x_2_n[i] = x_2[i-1];
            end
        end
        EVA:begin
            if(in_count <= 1)begin
                for(int i = 1; i <= 63; i = i + 1)begin
                    x_n[i] = x[i];
                    x_2_n[i] = x_2[i];
                end
            end else begin
                x_n[0] = x[63];
                x_2_n[0] = x_2[63];
                for(int i = 1; i <= 63; i = i + 1)begin
                    x_n[i] = x[i-1];
                    x_2_n[i] = x_2[i-1];
                end
            end
        end
        OUTPUT:begin
            x_n[0] = x[63];
            x_2_n[0] = x_2[63];
            for(int i = 1; i <= 63; i = i + 1)begin
                x_n[i] = x[i-1];
                x_2_n[i] = x_2[i-1];
            end
        end
    endcase
end
assign avg_n = sum >> 6;   
assign avg_2_n = avg * avg;
assign x_avg_diff_n = x[63] - avg;
assign vari_n = (sum_2 >> 6) - avg_2;
assign vari_norm = vari >> 16;
//assign lut_addr_n = (vari_norm[9:2]>64)?vari_norm[9:2]-64:0;
assign lut_addr_n = vari_norm[9:2];
assign lut_out = lut[lut_addr];
//assign lut_out_next = lut[lut_addr + 1];
//assign fraction = vari_norm[1:0];
//assign lut_num = (lut_out + (($signed((lut_out_next - lut_out) * fraction)>>>2)))>>8;
assign lut_num = lut_out >> 8;
assign x_avg_diff_reg_n[0] = x_avg_diff;
assign x_avg_diff_reg_n[1] = x_avg_diff_reg[0];
assign x_avg_diff_reg_n[2] = x_avg_diff_reg[1];
assign out_temp_n[0] = x_avg_diff_reg[2] * lut_num;
assign out_temp_n[1] = out_temp[0] * weight_reg; 
assign out_temp_n[2] = out_temp[1] + bias_extended;
always_comb begin
    out_data_n = out_temp[2]>>>20;
    if(out_temp[2][19])begin
        if(out_temp[2][18:0] || out_temp[2][20])begin
            out_data_n = (out_temp[2]>>>20) + 1;
        end
    end
end
always_ff @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        for(int i = 0; i <= 63; i = i + 1)begin
            x[i] <= 0;
            x_2[i] <= 0;
        end
        in_data_reg <= 0;
        weight_reg <= 0;
        bias_reg <= 0;
        sum <= 0;
        sum_2 <= 0;
        in_count <= 0;
        avg <= 0;
        avg_2 <= 0;
        vari <= 0;
        x_avg_diff <= 0;
        x_avg_diff_reg[0] <= 0;
        x_avg_diff_reg[1] <= 0;
        x_avg_diff_reg[2] <= 0;
        out_temp[0] <= 0;
        out_temp[1] <= 0;
        out_temp[2] <= 0;
        out_data <= 0;
        state <= IDLE;
        out_valid <= 0;
        lut_addr <= 0;
    end else begin
        for(int i = 0; i <= 63; i = i + 1)begin
            x[i] <= x_n[i];
            x_2[i] <= x_2_n[i];
        end
        in_data_reg <= in_data;
        weight_reg <= weight;
        bias_reg <= bias;
        sum <= sum_n;
        sum_2 <= sum_2_n;
        in_count <= in_count_n;
        avg <= avg_n;
        avg_2 <= avg_2_n;
        vari <= vari_n;
        x_avg_diff <= x_avg_diff_n;
        x_avg_diff_reg[0] <= x_avg_diff_reg_n[0];
        x_avg_diff_reg[1] <= x_avg_diff_reg_n[1];
        x_avg_diff_reg[2] <= x_avg_diff_reg_n[2];
        out_temp[0] <= out_temp_n[0];
        out_temp[1] <= out_temp_n[1];
        out_temp[2] <= out_temp_n[2];
        out_data <= out_data_n;
        state <= state_n;
        out_valid <= out_valid_n;
        lut_addr <= lut_addr_n;
    end
end
endmodule