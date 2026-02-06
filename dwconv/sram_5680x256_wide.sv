// sram_5680x256_wide.sv
module sram_5680x256_wide #(
  parameter int DW    = 5680, // 16 bits * 355 words = 5680 bits
  parameter int DEPTH = 256,  // 對應原本的 [0:255]
  parameter int AW    = 8     // ceil(log2(256)) = 8 bits
)(
  input  logic             clk,
  input  logic             rst_n,

  input  logic             W,        // Write enable: 1=write, 0=read
  input  logic [AW-1:0]    A,        // Address (0~255)
  input  logic [DW-1:0]    D,        // Write data (一整行 5680 bits)
  output logic [DW-1:0]    Q         // Read data (一整行 5680 bits)
);

  // Memory array
  // 注意：這裡宣告的總容量是 256 * 5680 bits，約 1.45 Mbit
  logic [DW-1:0] mem [0:DEPTH-1];

  // Internal registers for synchronous read
  logic [AW-1:0] A_q;
  logic          rd_en_q;

`ifndef SYNTHESIS
  // Simulation check
  always_ff @(posedge clk) begin
    if (A >= DEPTH) begin
      $error("SRAM addr out of range: A=%0d DEPTH=%0d", A, DEPTH);
    end
  end
`endif

  always_ff @(posedge clk) begin
    if (!rst_n) begin
      A_q     <= '0;
      rd_en_q <= 1'b0;
      Q       <= '0;
    end else begin
      // Latch read request
      rd_en_q <= ~W;
      A_q     <= A;

      // Write Operation
      if (W) begin
        mem[A] <= D;
      end

      // Read Operation (Sync Output)
      if (rd_en_q) begin
        Q <= mem[A_q];
      end
    end
  end

endmodule