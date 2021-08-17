library ieee;
use ieee.std_logic_1164.all;

entity thirty_two_bit_adder is
port (a, b: in std_logic_vector(31 downto 0);
      subtract: in std_logic;
      sum: out std_logic_vector (31 downto 0);
      overflow: out std_logic);
end thirty_two_bit_adder;


architecture behave of thirty_two_bit_adder is
     signal c: std_logic_vector (7 downto 0); 
	 signal z: std_logic_vector(31 downto 0);
	 
component four_bit_adder
     port (a, b: in std_logic_vector(3 downto 0);
           cin : in std_logic;
           sum: out std_logic_vector (3 downto 0);
           cout: out std_logic);
end component;

begin
     z <= b(31 downto 0) when subtract = '0' else not b(31 downto 0);
     FA0: four_bit_adder
		 port map(a(3 downto 0) => a(3 downto 0), b(3 downto 0) => z(3 downto 0), cin => subtract, sum(3 downto 0) => sum(3 downto 0), cout => c(0));
     FA1: four_bit_adder
         port map(a(3 downto 0) => a(7 downto 4), b(3 downto 0) => z(7 downto 4), cin => c(0), sum(3 downto 0) => sum(7 downto 4), cout => c(1));
     FA2: four_bit_adder
         port map(a(3 downto 0) => a(11 downto 8), b(3 downto 0) => z(11 downto 8), cin => c(1), sum(3 downto 0) => sum(11 downto 8), cout => c(2));
     FA3: four_bit_adder
         port map(a(3 downto 0) => a(15 downto 12), b(3 downto 0) => z(15 downto 12), cin => c(2), sum(3 downto 0) => sum(15 downto 12), cout => c(3));
	 FA4: four_bit_adder
	     port map(a(3 downto 0) => a(19 downto 16), b(3 downto 0) => z(19 downto 16), cin => c(3), sum(3 downto 0) => sum(19 downto 16), cout => c(4));
     FA5: four_bit_adder
         port map(a(3 downto 0) => a(23 downto 20), b(3 downto 0) => z(23 downto 20), cin => c(4), sum(3 downto 0) => sum(23 downto 20), cout => c(5));
     FA6: four_bit_adder
         port map(a(3 downto 0) => a(27 downto 24), b(3 downto 0) => z(27 downto 24), cin => c(5), sum(3 downto 0) => sum(27 downto 24), cout => c(6));
     FA7: four_bit_adder
         port map(a(3 downto 0) => a(31 downto 28), b(3 downto 0) => z(31 downto 28), cin => c(6), sum(3 downto 0) => sum(31 downto 28), cout => c(7));
		 
		 overflow <= c(7) xor c(6); 		 
		 
end behave;