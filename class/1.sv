module class_test;
	class human_class;
		int id;

		function new(int i);
			id = i;
		endfunction

		task print_id;
			$display("The id of this class is %0d.", id);
		endtask

	endclass

	human_class h0, h1, h2, h3, h4, h5;

	initial begin
		h0 = new(0);
		h1 = new(1);
		h2 = new(2);
		h3 = new(3);
		h4 = new(4);
		h5 = new(5);

		h0.print_id();
		h1.print_id();
		h2.print_id();
		h3.print_id();
		h4.print_id();
		h5.print_id();
	end
endmodule

