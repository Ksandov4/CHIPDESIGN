`default_nettype none

module RandomDropout (
    input wire clk,      // need a clock
    input wire reset,    // need reset as well
    input wire enable,   // enable used to determine if dropout should occur
    input wire [7:0] datain [0:7], // data in for 8 neurons
    output reg [7:0] dataout [0:7] // data out for 8 neurons
);

parameter dropoutrate = 0.5; // dropout rate can be changed, it represents the likelihood that a given value will be set to 0.

reg [31:0] randomvalues [0:7]; // array of random numbers, one per neuron

always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (int i = 0; i < 8; i = i + 1) begin
            randomvalues[i] <= 32'h0;
        end
    end else if (enable) begin
        for (int i = 0; i < 8; i = i + 1) begin
            randomvalues[i] <= $urandom; // Use $urandom for uniform distribution
        end
    end
end

genvar i;
generate
    for (i = 0; i < 8; i = i + 1) begin : dropout_block
        always @* begin
            if (reset) begin
                dataout[i] <= 8'h0; // Reset output to 0 for each neuron
            end else if (enable) begin
                if (randomvalues[i] < dropoutrate * 2**32) begin
                    dataout[i] <= 8'h0; // Apply dropout
                end else begin
                    dataout[i] <= datain[i]; // Pass data through
                end
            end
        end
    end
endgenerate

endmodule
// module RandomDropout (
//     input wire clk,      // need a clock
//     input wire reset,    // need reset as well
//     input wire enable,   // enable used to determine if dropout should occur
//     input wire [7:0] datain [0:7], // data in for 8 neurons
//     output wire [7:0] dataout [0:7] // data out for 8 neurons
// );

// parameter dropoutrate = 0.5; // dropout rate can be changed, it represents the likelihood that a given value will be set to 0.

// reg [31:0] randomvalues [0:7]; // array of random numbers, one per neuron

// always @(posedge clk or posedge reset) begin
//     if (reset) begin
//         for (int i = 0; i < 8; i = i + 1) begin
//             randomvalues[i] <= 32'h0;
//         end
//     end else if (enable) begin
//         for (int i = 0; i < 8; i = i + 1) begin
//             randomvalues[i] <= $urandom; // Use $urandom for uniform distribution
//         end
//     end
// end

// generate
//     for (int i = 0; i < 8; i = i + 1) begin : dropout_block
//         always @* begin
//             if (reset) begin
//                 dataout[i] <= 8'h0; // Reset output to 0 for each neuron
//             else if (enable) begin
//                 if (randomvalues[i] < dropoutrate * 2**32) begin
//                     dataout[i] = 8'h0; // Apply dropout
//                 end else begin
//                     dataout[i] = datain[i]; // Pass data through
//                 end
//             end
//         end
//     end
// endgenerate
