-- Example of a four bit adder

library  ieee;
use  ieee.std_logic_1164.all;

-- definition of a full adder

entity full_adder is
  port (a, b, c: in std_logic;
        sum, carry: out std_logic);
end full_adder;

architecture rt1 of full_adder is
begin
  sum <= (a xor b) xor c;
  carry <= (a and b) or (c and (a xor b));
end rt1;

 
