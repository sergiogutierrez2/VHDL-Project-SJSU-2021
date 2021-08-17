library ieee;
use ieee.std_logic_1164.all;

entity four_bit_adder_tb is
end four_bit_adder_tb;

architecture test of four_bit_adder_tb is  
     component four_bit_adder
         port (a, b: in std_logic_vector(3 downto 0);
               cin : in std_logic;
               sum: out std_logic_vector (3 downto 0);
               cout: out std_logic);
     end component;
  
     signal a, b, s: std_logic_vector(3 downto 0);
	 signal cin, cout: std_logic;
  
begin
  -- label: component-name port map (port1=>signal1, port2=> signal2, ... portn=>signaln);
  tb : four_bit_adder port map (a => a, b => b, cin => cin, sum => s, cout => cout); 
  process begin
    cin <= '0';
	a <= "1010";
	b <= "0111";
	wait for 20 ns;
	
	cin <= '1';
	a <= "0001";
	b <= "0111";
	wait for 20 ns;
	
	assert false report "reached end of test";
	wait;
  end process;
end;