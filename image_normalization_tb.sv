module image_normalization_tb;

    logic [7:0] pixel_in;
    logic [15:0] pixel_out;

    // Instantiate your module
    PixelNormalizer uut (
        .pixel_in(pixel_in),
        .pixel_out(pixel_out)
    );

    // Task to display result in both fixed-point and approximate decimal
    task print_output;
        input [7:0] val;
        real float_val;
        begin
            float_val = pixel_out / 256.0;
            $display("pixel_in = %0d --> pixel_out = 0x%04h (≈ %f)", val, pixel_out, float_val);
        end
    endtask

    initial begin
        $display("Starting PixelNormalizer test...");

        // Test different pixel values
        pixel_in = 8'd0;    #1; print_output(pixel_in);
        pixel_in = 8'd64;   #1; print_output(pixel_in);
        pixel_in = 8'd127;  #1; print_output(pixel_in);
        pixel_in = 8'd192;  #1; print_output(pixel_in);
        pixel_in = 8'd255;  #1; print_output(pixel_in);

        $display("Test complete.");
        $finish;
    end

endmodule
