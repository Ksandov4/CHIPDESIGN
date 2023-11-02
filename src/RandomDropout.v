`default_nettype none

module RandomDropout (
    input wire clk,     //need a clock 
    input wire reset,   //need reset as well
    input wire enable,  //enable used to determine if dropout should occur
    input wire datain, //data in (could be a neuron, or could be a connection)
    output wire dataout //data out (if dropout occurs set this to 0, if not pass it back into data in)
);

parameter dropoutrate = 0.5; //dropout rate can be changed, it represents the likelihood that a given value will be set to 0. 

reg [31:0]randomvalue; //random value needed for the drpoout decision

always @(posedge clk or posedge reset) begin 
    if (reset) begin
        randomvalue <= 32'h0; //if reset, we no longer need a random value set it to 0
    end else if (enable) begin
        randomvalue <= $random; //if enable, then generate the random number. 
    end
end

always @(posedge clk or posedge reset) begin 
    if (reset) begin 
        dataout <= 32'h0; //if reset then det the output data to 0
    end else if (enable) begin 
        if (randomvalue < dropoutrate * 2**32) begin //if random value is in the threshold preform the dropout
            dataout <= 32'h0;
        end else begin // if not loop the output data back into the input data. 
            dataout <= datain;
        end
    end
end

endmodule
