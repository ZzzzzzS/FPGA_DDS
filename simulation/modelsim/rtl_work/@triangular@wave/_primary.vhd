library verilog;
use verilog.vl_types.all;
entity TriangularWave is
    port(
        clk             : in     vl_logic;
        Triangularout   : out    vl_logic_vector(15 downto 0);
        reset           : in     vl_logic;
        phase           : in     vl_logic_vector(7 downto 0)
    );
end TriangularWave;
