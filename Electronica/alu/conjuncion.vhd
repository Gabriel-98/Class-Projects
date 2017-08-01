library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity conjuncion is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end conjuncion;

architecture arq_conjuncion of conjuncion is

begin
	S <= A and B;

end arq_conjuncion;

