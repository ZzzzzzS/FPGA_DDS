library verilog;
use verilog.vl_types.all;
entity ControlPanel is
    port(
        SinIn           : in     vl_logic_vector(15 downto 0);
        PWMIn           : in     vl_logic_vector(15 downto 0);
        TriangularIn    : in     vl_logic_vector(15 downto 0);
        rectangleIn     : in     vl_logic_vector(15 downto 0);
        SignalOut       : out    vl_logic_vector(15 downto 0);
        OutMode         : in     vl_logic_vector(1 downto 0);
        reset           : in     vl_logic
    );
end ControlPanel;
