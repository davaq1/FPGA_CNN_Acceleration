module image_normalization(
    input logic [7:0] pixel_in,
    output logic [15:0] pixel_out
);
    always_comb begin
        // Convert to fixed point: (pixel_in << 8) / 255
        pixel_out = (pixel_in << 8) / 8'd255;
    end
endmodule
