library verilog;
use verilog.vl_types.all;
entity phase is
    port(
        add             : in     vl_logic;
        sub             : in     vl_logic;
        phase           : out    vl_logic_vector(7 downto 0)
    );
end phase;
