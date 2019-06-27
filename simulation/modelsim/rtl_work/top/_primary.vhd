library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        PWMDuty         : in     vl_logic_vector(31 downto 0);
        SignalOut       : out    vl_logic_vector(15 downto 0);
        Switchadd       : in     vl_logic;
        Switchsub       : in     vl_logic;
        SwitchMicroadd  : in     vl_logic;
        SwitchMicrosub  : in     vl_logic;
        SwitchNanoadd   : in     vl_logic;
        SwitchNanosub   : in     vl_logic;
        OutMode         : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        phaseadd        : in     vl_logic;
        phasesub        : in     vl_logic
    );
end top;
