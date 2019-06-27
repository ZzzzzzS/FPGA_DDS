library verilog;
use verilog.vl_types.all;
entity SinWave is
    port(
        clk             : in     vl_logic;
        Sinout          : out    vl_logic_vector(15 downto 0);
        reset           : in     vl_logic;
        phase           : in     vl_logic_vector(31 downto 0);
        Step            : in     vl_logic_vector(31 downto 0)
    );
end SinWave;
