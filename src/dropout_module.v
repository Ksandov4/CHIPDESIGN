`default_nettype none

module dropout_module (
    input wire clk,      // Clock signal
    input wire rst_n,    // Reset signal
    input wire ui_ena,   // Enable signal used to determine if dropout should occur
    input wire [7:0] ui_in,
    output wire [7:0] uo_out
);

reg [7:0] dropout_weights [0:7]; // An array to store random dropout weights
reg [7:0] dropout_enabled_weights [0:7]; // An array to store dropout-enabled weights

parameter dropout_rate = 8'b10000000; // Hyperparameter for dropout rate (e.g., 0.5 for 50% dropout)

// Function to generate a random number
function [7:0] my_urandom;
    my_urandom = $urandom;
endfunction

// Generate random weights for each neuron
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // Reset on active low reset
        for (int i = 0; i < 8; i = i + 1) begin
            dropout_weights[i] <= 8'b0; // Initialize to 0
        end
    end else if (ui_ena) begin
        // Generate random weights for each neuron using my_urandom
        for (int i = 0; i < 8; i = i + 1) begin
            dropout_weights[i] <= my_urandom;
        end
    end
end

// Introduce dropout based on the hyperparameter dropout_rate
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // Reset on active low reset
        for (int i = 0; i < 8; i = i + 1) begin
            dropout_enabled_weights[i] <= 8'b0; // Initialize to 0
        end
    end else if (ui_ena) begin
        // Apply dropout based on the hyperparameter dropout_rate
        for (int i = 0; i < 8; i = i + 1) begin
            if (my_urandom < dropout_rate) begin
                // Set output to 0 based on dropout rate
                dropout_enabled_weights[i] <= 8'b0;
            end else begin
                // Pass through the original weights
                dropout_enabled_weights[i] <= dropout_weights[i];
            end
        end
    end
end

// Output the selected weights
assign uo_out[0] = dropout_enabled_weights[0];
assign uo_out[1] = dropout_enabled_weights[1];
assign uo_out[2] = dropout_enabled_weights[2];
assign uo_out[3] = dropout_enabled_weights[3];
assign uo_out[4] = dropout_enabled_weights[4];
assign uo_out[5] = dropout_enabled_weights[5];
assign uo_out[6] = dropout_enabled_weights[6];
assign uo_out[7] = dropout_enabled_weights[7];

endmodule

// module dropout_module (
//     input wire clk,      // Clock signal
//     input wire rst_n,    // Reset signal
//    input wire ui_ena,   // Enable signal used to determine if dropout should occur
//     input wire [7:0] ui_in,
//     output wire [7:0] uo_out
// );

// reg [7:0] dropout_weights [0:7]; // An array to store random dropout weights
// reg [7:0] dropout_enabled_weights [0:7]; // An array to store dropout-enabled weights

// parameter dropout_rate = 8'b10000000; // Hyperparameter for dropout rate (e.g., 0.5 for 50% dropout)

// // Generate random weights for each neuron
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Generate random weights for each neuron
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= $urandom; // Replace this with your own random weight generation logic
//         end
//     end
// end

// // Introduce dropout based on the hyperparameter dropout_rate
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_enabled_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Apply dropout based on the hyperparameter dropout_rate
//         for (int i = 0; i < 8; i = i + 1) begin
//             if ($urandom < dropout_rate) begin
//                 // Set output to 0 based on dropout rate
//                 dropout_enabled_weights[i] <= 8'b0;
//             end else begin
//                 // Pass through the original weights
//                 dropout_enabled_weights[i] <= dropout_weights[i];
//             end
//         end
//     end
// end

// // Output the selected weights
// assign uo_out[0] = dropout_enabled_weights[0];
// assign uo_out[1] = dropout_enabled_weights[1];
// assign uo_out[2] = dropout_enabled_weights[2];
// assign uo_out[3] = dropout_enabled_weights[3];
// assign uo_out[4] = dropout_enabled_weights[4];
// assign uo_out[5] = dropout_enabled_weights[5];
// assign uo_out[6] = dropout_enabled_weights[6];
// assign uo_out[7] = dropout_enabled_weights[7];

// endmodule
 

// module dropout_module (
//     input wire clk,      // Clock signal
//     input wire rst_n,    // Reset signal
//     input wire ui_ena,   // Enable signal used to determine if dropout should occur
//     input wire [7:0] ui_in,
//     output wire [7:0] uo_out
// );

// reg [7:0] dropout_weights [0:7]; // An array to store random dropout weights
// wire [7:0] dropout_enabled_weights [0:7]; // An array to store dropout-enabled weights

// parameter dropout_rate = 8'b10000000; // Hyperparameter for dropout rate (e.g., 0.5 for 50% dropout)

// // Generate random weights for each neuron
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Generate random weights for each neuron
//         for (i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= $random; // Replace this with your own random weight generation logic
//         end
//     end
// end

// // Introduce dropout based on the hyperparameter dropout_rate
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (i = 0; i < 8; i = i + 1) begin
//             dropout_enabled_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Apply dropout based on the hyperparameter dropout_rate
//         for (i = 0; i < 8; i = i + 1) begin
//             if ($random < dropout_rate) begin
//                 // Set output to 0 based on dropout rate
//                 dropout_enabled_weights[i] <= 8'b0;
//             end else begin
//                 // Pass through the original weights
//                 dropout_enabled_weights[i] <= dropout_weights[i];
//             end
//         end
//     end
// end

// // Output the selected weights
// assign uo_out[0] = dropout_enabled_weights[0];
// assign uo_out[1] = dropout_enabled_weights[1];
// assign uo_out[2] = dropout_enabled_weights[2];
// assign uo_out[3] = dropout_enabled_weights[3];
// assign uo_out[4] = dropout_enabled_weights[4];
// assign uo_out[5] = dropout_enabled_weights[5];
// assign uo_out[6] = dropout_enabled_weights[6];
// assign uo_out[7] = dropout_enabled_weights[7];

// endmodule


// module dropout_module (
//     input wire clk,      // Clock signal
//     input wire rst_n,    // Reset signal
//     input wire ui_ena,   // Enable signal used to determine if dropout should occur
//     input wire [7:0] ui_in,
//     output wire [7:0] uo_out
// );

// reg [7:0] dropout_weights [0:7]; // An array to store random dropout weights
// wire [7:0] dropout_enabled_weights [0:7]; // An array to store dropout-enabled weights

// parameter dropout_rate = 16'h8000; // Hyperparameter for dropout rate (e.g., 0.5 for 50% dropout)

// // Generate random weights for each neuron
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Generate random weights for each neuron
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= $random; // Replace this with your own random weight generation logic
//         end
//     end
// end

// // Introduce dropout based on the hyperparameter dropout_rate
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_enabled_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end
// end

// // Use another always block for the element-wise assignments
// always @* begin
//     for (int i = 0; i < 8; i = i + 1) begin
//         if (ui_ena) begin
//             if ($random < dropout_rate) begin
//                 // Set output to 0 based on dropout rate
//                 dropout_enabled_weights[i] = 8'b0;
//             end else begin
//                 // Pass through the original weights
//                 dropout_enabled_weights[i] = dropout_weights[i];
//             end
//         end else begin
//             // If ui_ena is 0, pass through the original weights
//             dropout_enabled_weights[i] = dropout_weights[i];
//         end
//     end
// end

// // Output the selected weights
// assign uo_out[0] = dropout_enabled_weights[0];
// assign uo_out[1] = dropout_enabled_weights[1];
// assign uo_out[2] = dropout_enabled_weights[2];
// assign uo_out[3] = dropout_enabled_weights[3];
// assign uo_out[4] = dropout_enabled_weights[4];
// assign uo_out[5] = dropout_enabled_weights[5];
// assign uo_out[6] = dropout_enabled_weights[6];
// assign uo_out[7] = dropout_enabled_weights[7];

// endmodule


// module dropout_module (
//     input wire clk,      // Clock signal
//     input wire rst_n,    // Reset signal
//     input wire ui_ena,   // Enable signal used to determine if dropout should occur
//     input wire [7:0] ui_in,
//     output wire [7:0] uo_out
// );

// reg [7:0] dropout_weights [0:7]; // An array to store random dropout weights
// wire [7:0] dropout_enabled_weights [0:7]; // An array to store dropout-enabled weights

// parameter dropout_rate = 4'b1000; // Hyperparameter for dropout rate (e.g., 0.5 for 50% dropout)

// // Generate random weights for each neuron
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Generate random weights for each neuron
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_weights[i] <= $random; // Replace this with your own random weight generation logic
//         end
//     end
// end

// // Introduce dropout based on the hyperparameter dropout_rate
// always @(posedge clk or negedge rst_n) begin
//     if (!rst_n) begin
//         // Reset on active low reset
//         for (int i = 0; i < 8; i = i + 1) begin
//             dropout_enabled_weights[i] <= 8'b0; // Initialize to 0
//         end
//     end else if (ui_ena) begin
//         // Apply dropout based on the hyperparameter dropout_rate
//         for (int i = 0; i < 8; i = i + 1) begin
//             if ($random < dropout_rate) begin
//                 // Set output to 0 based on dropout rate
//                 dropout_enabled_weights[i] <= 8'b0;
//             end else begin
//                 // Pass through the original weights
//                 dropout_enabled_weights[i] <= dropout_weights[i];
//             end
//         end
//     end
// end

// // Output the selected weights
// assign uo_out[0] = dropout_enabled_weights[0];
// assign uo_out[1] = dropout_enabled_weights[1];
// assign uo_out[2] = dropout_enabled_weights[2];
// assign uo_out[3] = dropout_enabled_weights[3];
// assign uo_out[4] = dropout_enabled_weights[4];
// assign uo_out[5] = dropout_enabled_weights[5];
// assign uo_out[6] = dropout_enabled_weights[6];
// assign uo_out[7] = dropout_enabled_weights[7];
// endmodule

// module RandomDropout (
//     input wire clk,      // Clock signal for simulation
//     input wire reset,    // Reset signal
//     input wire enable,   // Enable signal used to determine if dropout should occur
//     input wire [7:0] datain [0:7], // Data input for 8 neurons
//     output reg [7:0] dataout [0:7] // Data output for 8 neurons
// );

// parameter dropoutrate = 0.5; // Dropout rate, can be changed as needed

// reg [31:0] randomvalues [0:7]; // Array of random numbers, one per neuron

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

// genvar i;
// generate
//     for (i = 0; i < 8; i = i + 1) begin : dropout_block
//         always @* begin
//             if (reset) begin
//                 dataout[i] <= 8'h0; // Reset output to 0 for each neuron
//             end else if (enable) begin
//                 if (randomvalues[i] < dropoutrate * 2**32) begin
//                     dataout[i] <= 8'h0; // Apply dropout
//                 end else begin
//                     dataout[i] <= datain[i]; // Pass data through
//                 end
//             end
//         end
//     end
// endgenerate

// endmodule


// module RandomDropout (
//     input wire clk,      // need a clock
//     input wire reset,    // need reset as well
//     input wire enable,   // enable used to determine if dropout should occur
//     input wire [7:0] datain [0:7], // data in for 8 neurons
//     output reg [7:0] dataout [0:7] // data out for 8 neurons
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

// genvar i;
// generate
//     for (i = 0; i < 8; i = i + 1) begin : dropout_block
//         always @* begin
//             if (reset) begin
//                 dataout[i] <= 8'h0; // Reset output to 0 for each neuron
//             end else if (enable) begin
//                 if (randomvalues[i] < dropoutrate * 2**32) begin
//                     dataout[i] <= 8'h0; // Apply dropout
//                 end else begin
//                     dataout[i] <= datain[i]; // Pass data through
//                 end
//             end
//         end
//     end
// endgenerate

// endmodule
