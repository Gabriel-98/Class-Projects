library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_completo is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC);
end sumador_completo;

architecture arq_sumador_completo of sumador_completo is

begin
	Cout <= (A and B) or (A and C) or (B and C);
	S <= (not(A) and not(B) and C) or (not(A) and B and not(C)) or (A and not(B) and not(C)) or (A and B and C);

end arq_sumador_completo;

