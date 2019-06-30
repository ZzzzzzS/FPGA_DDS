library verilog;
use verilog.vl_types.all;
entity led_decoder is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        value           : in     vl_logic_vector(3 downto 0);
        led_numseg      : out    vl_logic_vector(7 downto 0)
    );
end led_decoder;
