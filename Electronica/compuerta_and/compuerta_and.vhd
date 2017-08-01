library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compuerta_and is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out  STD_LOGIC);
end compuerta_and;

architecture arq_compuerta_and of compuerta_and is

begin
	S <= A and B;

end arq_compuerta_and;

