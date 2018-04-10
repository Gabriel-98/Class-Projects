library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexor is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end multiplexor;

architecture arq_multiplexor of multiplexor is

begin
	result <= A when i = '0' else B;

end arq_multiplexor;

