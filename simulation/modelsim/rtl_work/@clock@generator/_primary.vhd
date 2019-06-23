library verilog;
use verilog.vl_types.all;
entity ClockGenerator is
    port(
        clk             : in     vl_logic;
        Switch          : in     vl_logic_vector(1 downto 0);
        SwitchMicro     : in     vl_logic_vector(1 downto 0);
        SwitchNano      : in     vl_logic_vector(1 downto 0);
        clk_N           : out    vl_logic;
        reset           : in     vl_logic
    );
end ClockGenerator;
