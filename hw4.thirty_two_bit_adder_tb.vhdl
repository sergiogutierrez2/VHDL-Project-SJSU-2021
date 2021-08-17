library ieee;
use ieee.std_logic_1164.all;

entity thirty_two_bit_adder_tb is
end thirty_two_bit_adder_tb;

architecture test of thirty_two_bit_adder_tb is  
	 
	 component thirty_two_bit_adder is
		 port (a, b: in std_logic_vector(31 downto 0);
			   subtract: in std_logic;
		 	   sum: out std_logic_vector (31 downto 0);
			   overflow: out std_logic);
	 end component;
  
     signal a, b, s: std_logic_vector(31 downto 0);
	 signal subtract, overflow: std_logic;
  
begin
  -- label: component-name port map (port1=>signal1, port2=> signal2, ... portn=>signaln);
  tb : thirty_two_bit_adder port map (a => a, b => b, subtract => subtract, sum => s, overflow => overflow); 
  process begin
    -- 14 + 12 = 26 (0x0000001A)
    subtract <= '0';
	a <= "00000000000000000000000000001110";
	b <= "00000000000000000000000000001100";
	wait for 20 ns;
	
	-- -3 + -6 = -9 (0xFFFFFFF7) 
    subtract <= '0';
	a <= "11111111111111111111111111111101";
	b <= "11111111111111111111111111111010";
	wait for 20 ns;
	
	-- 20 - 12 = 8 (0x00000008)
    subtract <= '1';
	a <= "00000000000000000000000000010100";
	b <= "00000000000000000000000000001100";
	wait for 20 ns;
	
	-- 4 - 20 = -16 (0xFFFFFFF0)
    subtract <= '1';
	a <= "00000000000000000000000000000100";
	b <= "00000000000000000000000000010100";
	wait for 20 ns;
	
	-- Large positive - large negative = overflow
    subtract <= '1';
	a <= "01111100000000000000000000010100";
	b <= "10000000000000000000000000001100";
	wait for 20 ns;
	
	-- large positive + large positive = overflow
    subtract <= '0';
	a <= "01111100000000111100000000001110";
	b <= "01110101111010100000000000001100";
	wait for 20 ns;
	
	-- large negative - large negative = no overflow
    subtract <= '1';
	a <= "11111100000000000000000000010100";
	b <= "11111000000000000000000000001100";
	wait for 20 ns;
	
	assert false report "reached end of test";
	wait;
  end process;
end;
