module PixelNormalizer(
     input  logic        clk,
     input  logic        rst,
     input  logic        valid_in,
     input  logic [7:0]  pixel_in,
     output logic        valid_out,
     output logic [15:0] pixel_out
 );
 
     always_ff @(posedge clk or posedge rst) begin
         if (rst) begin
             pixel_out  <= 16'd0;
             valid_out  <= 1'b0;
         end else begin
             if (valid_in) begin
                 // Norm
                 pixel_out <= (pixel_in << 8) / 8'd255;
                 valid_out <= 1'b1;
             end else begin
                 valid_out <= 1'b0;
             end
         end
     end
 
 endmodule
