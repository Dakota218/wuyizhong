// sram_16x90880_simple.sv
module sram_16x90880_simple #(
  parameter int DW    = 16,
  parameter int DEPTH = 90880,
  parameter int AW    = 17   // ceil(log2(90880))
)(
  input  logic             clk,
  input  logic             rst_n,

  input  logic             W,        // Write enable: 1=write, 0=read
  input  logic [AW-1:0]    A,        // Address
  input  logic [DW-1:0]    D,        // Write data
  output logic [DW-1:0]    Q         // Read data (1-cycle latency)
);

  // Memory array (RTL behavioral model)
  logic [DW-1:0] mem [0:DEPTH-1];

  // Registered address for sync read
  logic [AW-1:0] A_q;
  logic          rd_en_q;

`ifndef SYNTHESIS
  // Address range check (simulation safety)
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
      // latch read request
      rd_en_q <= ~W;   // W=0 => read
      A_q     <= A;

      // write
      if (W) begin
        mem[A] <= D;
      end

      // synchronous read (1-cycle latency)
      if (rd_en_q) begin
        Q <= mem[A_q];
      end
    end
  end

endmodule
