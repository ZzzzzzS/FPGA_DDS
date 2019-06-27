library verilog;
use verilog.vl_types.all;
entity Button is
    port(
        FreqPhaseSelect : in     vl_logic;
        UpDownSelect    : in     vl_logic;
        PushButton      : in     vl_logic_vector(2 downto 0);
        reset           : in     vl_logic;
        Switchadd       : out    vl_logic;
        Switchsub       : out    vl_logic;
        SwitchMicroadd  : out    vl_logic;
        SwitchMicrosub  : out    vl_logic;
        SwitchNanoadd   : out    vl_logic;
        SwitchNanosub   : out    vl_logic;
        Phaseadd        : out    vl_logic;
        Phasesub        : out    vl_logic;
        PWMDuty         : out    vl_logic_vector(31 downto 0)
    );
end Button;
