library verilog;
use verilog.vl_types.all;
entity led_show is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        data            : in     vl_logic_vector(20 downto 0);
        led_numseg      : out    vl_logic_vector(7 downto 0);
        led_select      : out    vl_logic_vector(7 downto 0)
    );
end led_show;
