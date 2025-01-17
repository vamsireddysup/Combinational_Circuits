module Nto1_mux #(parameter N=2,
		parameter W=4)
		(
	input bit [N-1:0][W-1:0]ip,
	input bit [$clog2(N)-1:0]sel,
	output bit [W-1:0]out
	);
	always_comb begin
		out = ip[sel*W+:W];
	end
	
endmodule:Nto1_mux
