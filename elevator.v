

module elevator(

    input clk,

    input rst,

    input [3:0] req,

    output reg [1:0] current_floor,

    output reg [1:0] direction,

    output reg door_open

);
 
parameter F0 = 2'd0,

          F1 = 2'd1,

          F2 = 2'd2,

          F3 = 2'd3;
 
reg [1:0] state, next_state;
 
always @(posedge clk or posedge rst)

begin

    if(rst)

        state <= F0;

    else

        state <= next_state;

end
 
always @(*)

begin

    case(state)
 
        F0:

        begin

            if(req[1] || req[2] || req[3])

                next_state = F1;

            else

                next_state = F0;

        end
 
        F1:

        begin

            if(req[2] || req[3])

                next_state = F2;

            else if(req[0])

                next_state = F0;

            else

                next_state = F1;

        end
 
        F2:

        begin

            if(req[3])

                next_state = F3;

            else if(req[1] || req[0])

                next_state = F1;

            else

                next_state = F2;

        end
 
        F3:

        begin

            if(req[2] || req[1] || req[0])

                next_state = F2;

            else

                next_state = F3;

        end
 
        default: next_state = F0;
 
    endcase

end
 
always @(*)

begin

    current_floor = state;

    door_open = 0;

    direction = 0;
 
    case(state)
 
        F0:

        begin

            if(req[0])

                door_open = 1;

            else if(req[1] || req[2] || req[3])

                direction = 1;

        end
 
        F1:

        begin

            if(req[1])

                door_open = 1;

            else if(req[2] || req[3])

                direction = 1;

            else if(req[0])

                direction = 2;

        end
 
        F2:

        begin

            if(req[2])

                door_open = 1;

            else if(req[3])

                direction = 1;

            else if(req[1] || req[0])

                direction = 2;

        end
 
        F3:

        begin

            if(req[3])

                door_open = 1;

            else if(req[2] || req[1] || req[0])

                direction = 2;

        end
 
    endcase

end
 
endmodule
 