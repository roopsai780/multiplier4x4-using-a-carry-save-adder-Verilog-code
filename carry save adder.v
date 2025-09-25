module csa(a,b,c,sum,carry);
input [7:0]a,b,c;
output [7:0]sum,carry;
wire [7:0]carry_unshift;
genvar i;
generate
for(i=0;i<8;i=i+1)
begin:loop
full_add fa(.a(a[i]),.b(b[i]),.cin(c[i]),.sum(sum[i]),.cout(carry_unshift[i]));
end
endgenerate
assign carry = carry_unshift <<1;
endmodule
