// =======================================================
// Title      : Testbench for 4-to-1 Multiplexer
// Course     : DPCO - Digital Principles & Computer Organization
// Description: Applies all combinations of data inputs, select
//              lines, and enable, then prints/dumps the outputs
//              so students can verify against the truth table.
// =======================================================

`timescale 1ns / 1ps

module mux_4to1_tb;

    reg        i0, i1, i2, i3;
    reg  [1:0] sel;
    reg        en;
    wire       y;

    // Instantiate the Unit Under Test (UUT)
    mux_4to1 uut (
        .i0(i0),
        .i1(i1),
        .i2(i2),
        .i3(i3),
        .sel(sel),
        .en(en),
        .y(y)
    );

    initial begin
        $dumpfile("mux_4to1.vcd");
        $dumpvars(0, mux_4to1_tb);

        $display("===================================================");
        $display(" EN | I0 I1 I2 I3 | SEL |  Y (expected)");
        $display("===================================================");

        // Fixed distinct input pattern so each line is uniquely identifiable
        i0 = 1'b1; i1 = 1'b0; i2 = 1'b1; i3 = 1'b0;

        // Enable = 0 case (output must be 0 regardless of sel)
        en = 1'b0; sel = 2'b00; #10; print_row;

        // Enable = 1, sweep sel through all 4 combinations
        en = 1'b1;
        sel = 2'b00; #10; print_row;   // expect y = i0 = 1
        sel = 2'b01; #10; print_row;   // expect y = i1 = 0
        sel = 2'b10; #10; print_row;   // expect y = i2 = 1
        sel = 2'b11; #10; print_row;   // expect y = i3 = 0

        // Flip inputs and re-check
        i0 = 1'b0; i1 = 1'b1; i2 = 1'b0; i3 = 1'b1;
        sel = 2'b00; #10; print_row;   // expect y = i0 = 0
        sel = 2'b01; #10; print_row;   // expect y = i1 = 1
        sel = 2'b10; #10; print_row;   // expect y = i2 = 0
        sel = 2'b11; #10; print_row;   // expect y = i3 = 1

        $display("===================================================");
        $finish;
    end

    task print_row;
        begin
            $display("  %b  |  %b  %b  %b  %b |  %b%b  |   %b",
                       en, i0, i1, i2, i3, sel[1], sel[0], y);
        end
    endtask

endmodule
