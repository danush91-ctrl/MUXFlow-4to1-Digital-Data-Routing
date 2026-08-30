// =======================================================
// Title      : 4-to-1 Multiplexer (Behavioral Model)
// Course     : DPCO - Digital Principles & Computer Organization
// Description: Behavioral (case-statement) implementation of a
//              4-to-1 Multiplexer. This style directly mirrors
//              the truth table and is preferred in most
//              engineering lab workbooks.
// =======================================================

module mux_4to1_behavioral (
    input  wire       i0,
    input  wire       i1,
    input  wire       i2,
    input  wire       i3,
    input  wire [1:0] sel,
    input  wire       en,
    output reg        y
);

    always @(*) begin
        y = 1'b0;  // Default: output OFF

        if (en) begin
            case (sel)
                2'b00: y = i0;
                2'b01: y = i1;
                2'b10: y = i2;
                2'b11: y = i3;
                default: y = 1'b0;
            endcase
        end
    end

endmodule
