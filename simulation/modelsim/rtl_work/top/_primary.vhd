library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        PWMDuty         : in     vl_logic_vector(7 downto 0);
        SignalOut       : out    vl_logic_vector(15 downto 0);
        Switch          : in     vl_logic_vector(1 downto 0);
        SwitchMicro     : in     vl_logic_vector(1 downto 0);
        SwitchNano      : in     vl_logic_vector(1 downto 0);
        OutMode         : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        phaseadd        : in     vl_logic;
        phasesub        : in     vl_logic
    );
end top;
