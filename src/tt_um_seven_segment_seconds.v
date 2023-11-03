`default_nettype none
module tt_um_seven_segment_seconds #(
    parameter MAX_COUNT = 24'd10_000_000
) (
    input wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input wire ena,      // will go high when the design is enabled
    input wire clk,      // clock
    input wire rst_n     // reset_n - low to reset
);

wire [7:0] dropoutdataout [0:7]; // Declare an array of wires to hold the dropout output
wire [7:0] datain [0:7]; // Declare an array of wires to connect to datain

assign datain = {ui_in, ui_in, ui_in, ui_in, ui_in, ui_in, ui_in, ui_in}; // Assign data to each element in the array

RandomDropout dropout_inst [0:7] (
    .clk(clk),
    .reset(rst_n),
    .enable(ena),
    .datain(datain),
    .dataout(dropoutdataout)
);

assign uo_out = dropoutdataout[0]; // Connect the first neuron's dropout output to uo_out

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

// wire [7:0] dropoutdataout; // Declare a wire to hold the dropout output
// reg [7:0] datain; // Create a register to connect to datain

// assign datain = ui_in; // Connect ui_in to datain

// RandomDropout dropout_inst (
//     .clk(clk),
//     .reset(rst_n),
//     .enable(ena),
//     .datain(datain),
//     .dataout(dropoutdataout)
// );

// assign uo_out = dropoutdataout; // Connect the dropout output to your output

// endmodule
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

// wire [7:0] dropoutdataout; // Declare a wire to hold the dropout output
// wire [7:0] datain [0:7]; // Create a wire array to connect to datain

// assign datain = ui_in; // Connect ui_in to datain

// RandomDropout dropout_inst (
//     .clk(clk),
//     .reset(rst_n),
//     .enable(ena),
//     .datain(datain),
//     .dataout(dropoutdataout)
// );

// assign uo_out = dropoutdataout; // Connect the dropout output to your output

// endmodule
// module tt_um_seven_segment_seconds #( parameter MAX_COUNT = 24'd10_000_000 ) (
//     input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
//     output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
//     input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
//     output wire [7:0] uio_out,  // IOs: Bidirectional Output path
//     output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
//     input  wire       ena,      // will go high when the design is enabled
//     input  wire       clk,      // clock
//     input  wire       rst_n     // reset_n - low to reset
// );

   
// wire [7:0] dropoutdataout [0:7];
// // assign ou_out = dropout_inst.dataout;
// // wire [N-1:0] dropoutdatain;
// // assign dropoutdatain = ui_in;

// assign uo_out = dropoutdataout;

// RandomDropout dropout_inst [0:7] (
//     .clk(clk),
//     .reset(rst_n),
//     .enable(ena),
//     .datain(ui_in),
//     .dataout(dropoutdataout)
//     );

    

