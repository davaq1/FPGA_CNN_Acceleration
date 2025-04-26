module node_op(
  input logic  clk,
  input logic  rst,
  input logic valid_in,

  input logic [15:0] prev_outputs,
  input logic [15:0] weights,
  input logic [15:0] biases,
  
  output logic valid_out,
  output logic [15:0] x,
);


  // load all (3?) arrays
  //do first calculation and load
  //dp second calculation and load

  
