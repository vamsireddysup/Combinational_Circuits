module Nto1_mux_tb;

parameter N=2;
parameter W=4;

logic [N-1:0][W-1:0]ip;
logic [$clog2(N)-1:0]sel;
logic [W-1:0]out;
logic clk;
logic [W-1:0]expected_out;

Nto1_mux #(.N(N),.W(W))
	dut(.ip(ip),.sel(sel),.out(out));


initial begin
       	clk = 1;
	#5;
	forever clk=~clk;
end

task random_test;
	ip=$random;
	sel=$urandom_range(0,N-1);
	expected_out=ip[sel*W+:W];
	$display("Sel:%0d\t Input:%h\t Output:%h\t Expected_Output:%h\t",sel,ip,out,expected_out);
	if(out!=expected_out)begin
		$error("Outputs Not Matched: Expected Output:%h\t Actual Output:%h",expected_out,out);
	end
	else $display("Outputs Passed\t\tSel:%0d\t Input:%h\t Output:%h\t Expected_Output:%h\t",sel,ip,out,expected_out);   
endtask: random_test

initial begin
	for (int i=0;i<=10;i++) begin
		random_test();
		#10;
		end
	$stop;
	end

endmodule: Nto1_mux_tb
