library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_medio is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC);
end sumador_medio;

architecture arq_sumador_medio of sumador_medio is

begin
	Cout <= A and B;
	S <= A xor B;

end arq_sumador_medio;

