library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        SignalOut       : out    vl_logic_vector(15 downto 0);
        OutMode         : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic;
        FreqPhaseSelect : in     vl_logic;
        UpDownSelect    : in     vl_logic;
        PushButton      : in     vl_logic_vector(2 downto 0);
        led_select      : out    vl_logic_vector(7 downto 0);
        led_numseg      : out    vl_logic_vector(7 downto 0);
        LEDGroup        : out    vl_logic_vector(2 downto 0)
    );
end top;
