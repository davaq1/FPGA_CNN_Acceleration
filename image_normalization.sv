module PixelNormalizer #(
    parameter int M = 4,
    parameter int N = 4
)(
    input  logic        clk,
    input  logic        rst,
    input  logic        valid_in,
    input  logic [7:0]  pixel_in,
    output logic        valid_out,
    output logic [15:0] pixel_out
);

    //..
    logic signed [15:0] biases      [0:M-1];
    logic signed [15:0] weights     [0:M*N-1];
    logic signed [15:0] prev_outputs[0:N-1];
    logic signed [31:0] x           [0:M-1];
    
    integer i,j,k;
    
    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            pixel_out  <= 16'd0;
            valid_out  <= 1'b0;
        end else begin
            if (valid_in) begin
            // Update below
             k = 0;
            for (i = 0; i < M; i = i + 1) begin
                x[i] = biases[i]; // use blocking '=' for combinational computation
                for (j = 0; j < N; j = j + 1) begin
                    x[i] = x[i] + (prev_outputs[j] * weights[k]);
                    k = k + 1;
                end
                end
                // update end
            pixel_out <= x[0][15:0]; // review
            valid_out <= 1'b1;
            end else begin
                valid_out <= 1'b0;
            end
        end
    end

endmodule
