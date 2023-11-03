`default_nettype none

module tt_um_seven_segment_seconds_ksandov4 (
    input wire clk,      // Clock signal
    input wire rst_n,    // Reset signal
    input wire ena,   // Enable signal used to determine if dropout should occur
    input wire [7:0] ui_in, // Data input for 8 neurons
    output wire [7:0] uo_out,
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
     output wire [7:0] uio_oe,
     input wire [7:0] uio_in  // Data output for 8 neurons
     // Output enable for 8 neurons
);

dropout_module RandomDropout (
    .clk(clk),        // Connect clk from top module to dropout module
    .rst_n(rst_n),    // Connect rst_n from top module to dropout module
    .ui_ena(ena),  // Connect ui_ena from top module to dropout module
    .ui_in(ui_in),    // Connect ui_in from top module to dropout module
    .uo_out(uo_out)   // Connect uo_out from dropout module to uo_out in the top module
);

assign uio_oe = 0;
assign uio_out = 0;
endmodule
// module tt_um_seven_segment_seconds #(
//     parameter MAX_COUNT = 24'd10_000_000
// ) (
//     input wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
//     output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
//     input wire [7:0] uio_in,   // IOs: Bidirectional Input path
//     output wire [7:0] uio_out,  // IOs: Bidirectional Output path
//     output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
//     input wire ena,      // will go high when the design is enabled
//     input wire clk,      // clock
//     input wire rst_n     // reset_n - low to reset
// );

// wire [7:0] dropoutdataout [0:7]; // Declare an array of wires to hold the dropout output
// wire [7:0] datain [0:7]; // Declare an array of wires to connect to datain

// assign datain[0] = ui_in;
// assign datain[1] = ui_in;
// assign datain[2] = ui_in;
// assign datain[3] = ui_in;
// assign datain[4] = ui_in;
// assign datain[5] = ui_in;
// assign datain[6] = ui_in;
// assign datain[7] = ui_in;

// RandomDropout dropout_inst (
//     .clk(clk),
//     .reset(rst_n),
//     .enable(ena),
//     .datain(datain),
//     .dataout(dropoutdataout)
// );

// assign uo_out = dropoutdataout[0]; // Connect the first neuron's dropout output to uo_out

// endmodule
