`default_nettype none

module RandomDropout (
    input wire clk,     //need a clock 
    input wire reset,   //need reset as well
    input wire enable,  //enable used to determine if dropout should occur
    input wire [N-1:0]datain, //data in (could be a neuron, or could be a connection)
    output wire [N-1:0]dataout //data out (if dropout occurs set this to 0, if not pass it back into data in)
);

parameter dropoutrate = 0.5; //dropout rate can be changed, it represents the likelihood that a given value will be set to 0. 
parameter N = 8;

reg [31:0]randomvalues [0:N-1]; //array of random numbers, one per neuron 


always @(posedge clk or posedge reset) begin
    if (reset) begin
        for (int i = 0; i < N; i = i + 1) begin
            randomvalues[i] <= 32'h0;
        end
        enable <= 1'b0;
    end else if (enable) begin
        for (int i = 0; i < N; i = i + 1) begin
            randomvalues[i] <= $urandom; // Use $urandom for uniform distribution
        end
    end
end

always @* begin
    for (int i = 0; i < N; i = i + 1) begin
        if (reset) begin
            dataout[i] = 32'h0; // Reset output to 0
        else if (enable) begin
            if (randomvalues[i] < dropoutrate * 2**32) begin
                dataout[i] = 32'h0; // Apply dropout
            end else begin
                dataout[i] = datain[i]; // Pass data through
            end
        end
    end
end

endmodule