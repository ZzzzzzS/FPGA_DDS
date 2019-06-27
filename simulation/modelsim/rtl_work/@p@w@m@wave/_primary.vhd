library verilog;
use verilog.vl_types.all;
entity PWMWave is
    port(
        clk             : in     vl_logic;
        PWMDuty         : in     vl_logic_vector(31 downto 0);
        PWMout          : out    vl_logic_vector(15 downto 0);
        reset           : in     vl_logic;
        phase           : in     vl_logic_vector(31 downto 0);
        Step            : in     vl_logic_vector(31 downto 0)
    );
end PWMWave;
