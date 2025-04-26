module node_op #(
  parameter int n_inputs = 16 // for array (16 for now)
  parameter int DW = 16 // for data width (16 for now)
  )(
  input logic  clk,
  input logic  rst,
  input logic valid_in,

  input logic [15:0] prev_outputs,
  input logic [15:0] weights,
  input logic [15:0] biases,
  
  output logic valid_out,
  output logic [15:0] x,
);

// gen. idea
  // load all (3?) arrays
  //do first calculation and load
  //dp second calculation and load
  // place in accumulator. Then tell world x is ready (valid_out = 1)

  // figure out cases below
  
