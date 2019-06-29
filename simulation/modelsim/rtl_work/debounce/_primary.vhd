library verilog;
use verilog.vl_types.all;
entity debounce is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        key_in          : in     vl_logic;
        key_out         : out    vl_logic
    );
end debounce;
