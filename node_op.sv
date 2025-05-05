module node_op #(
  parameter int nodes = 200,
  parameter int DW = 16 // for data width (16 for now)
  )(
  input logic  clk,
  input logic  rst,
  input logic valid_in,

  input logic [15:0] prev_outputs [0:nodes-1],
  input logic [15:0] weights    [0:nodes-1],
  input logic [15:0] biases    [0:nodes-1],
  
  output logic valid_out,
  output logic [15:0] x
);

// gen. idea
  // load all (3?) arrays
  //do first calculation and load
  //dp second calculation and load
  // place in accumulator. Then tell world x is ready (valid_out = 1)

integer i;
  logic [2*DW-1:0] sum; // inter-operation

  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      x         <= '0;
      valid_out <= 1'b0;
    end else begin
      if (valid_in) begin
        sum = '0;
        for (i = 0; i < nodes; i++) begin
          sum += prev_outputs[i] * weights[i] + biases[i];
        end
        x <= sum[DW-1:0]; // 16-bits
        valid_out <= 1'b1;
      end else begin
        valid_out <= 1'b0;
      end
    end
  end

endmodule
