module testbench();
reg [3:0]a,b;
wire [7:0]p;

multiplier4x4 dut(.a(a),.b(b),.p(p));
initial
begin
$monitor("time = %0t,a=%b(%d),b=%b(%d),p=%b(%d)",$time,a,a,b,b,p,p);

a = 4'b1111;b = 4'b1111;#10;
a = 4'b1010;b = 4'b1101;#10;
a = 4'b1011;b= 4'b1101;#10;
$finish;
end
endmodule
