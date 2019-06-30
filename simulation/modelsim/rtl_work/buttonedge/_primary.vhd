library verilog;
use verilog.vl_types.all;
entity buttonedge is
    port(
        clk             : in     vl_logic;
        buttonin        : in     vl_logic;
        buttonout       : out    vl_logic
    );
end buttonedge;
