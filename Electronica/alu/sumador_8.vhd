library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end sumador_8;

architecture arq_sumador_8 of sumador_8 is
signal Carry: STD_LOGIC_VECTOR(7 downto 0);

begin
	Carry(0) <= '0';
	S(0) <= (not(Carry(0)) and (A(0) xor B(0))) or (Carry(0) and not(A(0) xor B(0)));
	Carry(1) <= (A(0) and B(0)) or (A(0) and Carry(0)) or (B(0) and Carry(0));
	S(1) <= (not(Carry(1)) and (A(1) xor B(1))) or (Carry(1) and not(A(1) xor B(1)));
	Carry(2) <= (A(1) and B(1)) or (A(1) and Carry(1)) or (B(1) and Carry(1));
	S(2) <= (not(Carry(2)) and (A(2) xor B(2))) or (Carry(2) and not(A(2) xor B(2)));
	Carry(3) <= (A(2) and B(2)) or (A(2) and Carry(2)) or (B(2) and Carry(2));
	S(3) <= (not(Carry(3)) and (A(3) xor B(3))) or (Carry(3) and not(A(3) xor B(3)));
	Carry(4) <= (A(3) and B(3)) or (A(3) and Carry(3)) or (B(3) and Carry(3));
	S(4) <= (not(Carry(4)) and (A(4) xor B(4))) or (Carry(4) and not(A(4) xor B(4)));
	Carry(5) <= (A(4) and B(4)) or (A(4) and Carry(4)) or (B(4) and Carry(4));
	S(5) <= (not(Carry(5)) and (A(5) xor B(5))) or (Carry(5) and not(A(5) xor B(5)));
	Carry(6) <= (A(5) and B(5)) or (A(5) and Carry(5)) or (B(5) and Carry(5));
	S(6) <= (not(Carry(6)) and (A(6) xor B(6))) or (Carry(6) and not(A(6) xor B(6)));
	Carry(7) <= (A(6) and B(6)) or (A(6) and Carry(6)) or (B(6) and Carry(6));
	S(7) <= (not(Carry(7)) and (A(7) xor B(7))) or (Carry(7) and not(A(7) xor B(7)));
	Cout <= (A(7) and B(7)) or (A(7) and Carry(7)) or (B(7) and Carry(7));

end arq_sumador_8;

