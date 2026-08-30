// =======================================================
// Title      : 4-to-1 Multiplexer (Structural / Dataflow Model)
// Course     : DPCO - Digital Principles & Computer Organization
// Description: A 4-to-1 Multiplexer selects one of four data
//              inputs (i0, i1, i2, i3) and routes it to a single
//              output (y), based on a 2-bit select line (sel).
//              An active-high enable (en) controls whether the
//              circuit is active.
// =======================================================

module mux_4to1 (
    input  wire       i0,      // Data input 0
    input  wire       i1,      // Data input 1
    input  wire       i2,      // Data input 2
    input  wire       i3,      // Data input 3
    input  wire [1:0] sel,     // 2-bit select line
    input  wire       en,      // Enable (active high)
    output wire       y        // Multiplexed output
);

    // Output is HIGH only from the input line whose address
    // matches the select combination, and only when enabled.
    assign y = en & ( (i0 & ~sel[1] & ~sel[0]) |   // sel = 00 -> i0
                       (i1 & ~sel[1] &  sel[0]) |   // sel = 01 -> i1
                       (i2 &  sel[1] & ~sel[0]) |   // sel = 10 -> i2
                       (i3 &  sel[1] &  sel[0]) );  // sel = 11 -> i3

endmodule
