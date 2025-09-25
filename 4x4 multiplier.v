module multiplier4x4(a,b,p);
input [3:0]a,b;
output [7:0]p;
wire [3:0]p0,p1,p2,p3;

assign p0 = a&{4{b[0]}};
assign p1 = a&{4{b[1]}};
assign p2 = a&{4{b[2]}};
assign p3 = a&{4{b[3]}};

wire [7:0]row0,row1,row2,row3;
assign row0 = {4'b0000,p0};
assign row1 = {3'b000,p1,1'b0};
assign row2 = {2'b00,p2,2'b00};
assign row3 = {1'b0,p3,3'b000};

wire [7:0]sum1,carry1,sum2,carry2;

csa ca1(.a(row0),.b(row1),.c(row2),.sum(sum1),.carry(carry1));
csa ca2(.a(row3),.b(sum1),.c(carry1),.sum(sum2),.carry(carry2));

assign p = sum2 + carry2;

endmodule
