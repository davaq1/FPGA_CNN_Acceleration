module image_normalization_tb;

    logic [7:0] pixel_in;
    logic [15:0] pixel_out;
    logic rst;
    logic clk;
    logic valid_out;
    logic valid_in;
    
    PixelNormalizer uut (
        .pixel_in(pixel_in),
        .pixel_out(pixel_out),
        .clk(clk),
        .rst(rst),
        .valin_in(valid_in),
        .valid_out(valid_out)
    );


    initial begin
        clk=0;
        repeat (2_000_000_000) begin
            #500_000 clk = ~clk;
        end
    end
    
    initial begin
	    #10
        rst = 1;      
        #20;           
        rst = 0;      
    end 
        
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


    initial begin
       
        #2_000_000_000;  
        $stop;         
    end


    //display
    task print_output;
        input [7:0] val;
        real float_val;
        begin
            float_val = pixel_out / 256.0;
            $display("pixel_in = %0d --> pixel_out = 0x%04h (≈ %f)", val, pixel_out, float_val);
        end
    endtask
    // display what is happening while running
    initial begin
        $monitor("Time: %0dns, clk: %b, rst: %b", $time, clk, rst);
    end
        

endmodule
