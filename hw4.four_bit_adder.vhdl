library  ieee;
use  ieee.std_logic_1164.all;

entity four_bit_adder is
     port (a, b: in std_logic_vector(3 downto 0);
           cin : in std_logic;
           sum: out std_logic_vector (3 downto 0);
           cout: out std_logic);
end four_bit_adder;


architecture fa_arch of four_bit_adder is
     signal c: std_logic_vector (2 downto 0);
	 
component full_adder
     port(a, b, c: in std_logic;
          sum, carry: out std_logic);
end component;

begin
     FA0: full_adder
	     port map (a => a(0), b => b(0), c => cin, sum => sum(0), carry => c(0));
     FA1: full_adder
         port map (a => a(1), b => b(1), c => c(0), sum => sum(1), carry => c(1));
     FA2: full_adder
         port map (a => a(2), b => b(2), c => c(1), sum => sum(2), carry => c(2));
     FA3: full_adder
         port map (a => a(3), b => b(3), c => c(2), sum => sum(3), carry => cout);
end fa_arch;
