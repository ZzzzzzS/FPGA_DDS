library verilog;
use verilog.vl_types.all;
entity ClockGenerator is
    port(
        Switchadd       : in     vl_logic;
        Switchsub       : in     vl_logic;
        SwitchMicroadd  : in     vl_logic;
        SwitchMicrosub  : in     vl_logic;
        SwitchNanoadd   : in     vl_logic;
        SwitchNanosub   : in     vl_logic;
        Step            : out    vl_logic_vector(31 downto 0);
        reset           : in     vl_logic
    );
end ClockGenerator;
