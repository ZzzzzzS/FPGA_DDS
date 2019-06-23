library verilog;
use verilog.vl_types.all;
entity TriangularROM is
    port(
        address         : in     vl_logic_vector(6 downto 0);
        clock           : in     vl_logic;
        q               : out    vl_logic_vector(15 downto 0)
    );
end TriangularROM;
