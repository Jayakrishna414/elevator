module elevator_tb;
 
reg clk;
reg rst;
reg [3:0] req;
 
wire [1:0] current_floor;
wire [1:0] direction;
wire door_open;
 
elevator uut(
    .clk(clk),
    .rst(rst),
    .req(req),
    .current_floor(current_floor),
    .direction(direction),
    .door_open(door_open)
);
 
always #5 clk = ~clk;
 
initial
begin
    clk = 0;
    rst = 1;
    req = 4'b0000;
 
    #10 rst = 0;
 
    #20 req = 4'b0100; // request floor2
    #40 req = 4'b0000;
 
    #40 req = 4'b1000; // request floor3
    #40 req = 4'b0000;
 
    #40 req = 4'b0001; // request floor0
    #40 req = 4'b0000;
 
    #200 $finish;
end
 
initial
begin
$monitor("Time=%0t Floor=%d Dir=%d Door=%b Req=%b",
          $time,current_floor,direction,door_open,req);
end
 
endmodule