//uvm

module tb;
uart_if tb_if();


initial begin
    tb_if.clk <= 0 ;
end

always #10 tb_if.clk <= ~tb_if.clk;

initial begin
    uvm_config_db#(virtual uart_if)::set(null, "*", "tb_if", tb_if);
    run_test("test");
end

initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars;
end
endmodule
