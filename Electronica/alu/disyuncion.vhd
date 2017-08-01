library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity disyuncion is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end disyuncion;

architecture arq_disyuncion of disyuncion is

begin
	S <= A or B;

end arq_disyuncion;

