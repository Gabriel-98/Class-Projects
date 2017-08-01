library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mayor_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC_VECTOR (7 downto 0));
end mayor_8;

architecture arq_mayor_8 of mayor_8 is
signal Comp1: STD_LOGIC_VECTOR(7 downto 0);
signal Comp2: STD_LOGIC_VECTOR(7 downto 0);
signal C: STD_LOGIC_VECTOR(7 downto 0);
signal Carry: STD_LOGIC_VECTOR(7 downto 0);
signal Z: STD_LOGIC_VECTOR(7 downto 0);
signal K: STD_LOGIC;

begin
	Comp1 <= not(B);
	C(0) <= '1';
	Comp2(0) <= C(0) xor Comp1(0);
	C(1) <= C(0) and Comp1(0);
	Comp2(1) <= C(1) xor Comp1(1);
	C(2) <= C(1) and Comp1(1);
	Comp2(2) <= C(2) xor Comp1(2);
	C(3) <= C(2) and Comp1(2);
	Comp2(3) <= C(3) xor Comp1(3);
	C(4) <= C(3) and Comp1(3);
	Comp2(4) <= C(4) xor Comp1(4);
	C(5) <= C(4) and Comp1(4);
	Comp2(5) <= C(5) xor Comp1(5);
	C(6) <= C(5) and Comp1(5);
	Comp2(6) <= C(6) xor Comp1(6);
	C(7) <= C(6) and Comp1(6);
	Comp2(7) <= C(7) xor Comp1(7);
	
	Carry(0) <= '0';
	Z(0) <= (not(Carry(0)) and (A(0) xor Comp2(0))) or (Carry(0) and not(A(0) xor Comp2(0)));
	Carry(1) <= (not(Carry(0)) and A(0) and Comp2(0)) or (Carry(0) and (A(0) or Comp2(0)));
	Z(1) <= (not(Carry(1)) and (A(1) xor Comp2(1))) or (Carry(1) and not(A(1) xor Comp2(1)));
	Carry(2) <= (not(Carry(1)) and A(1) and Comp2(1)) or (Carry(1) and (A(1) or Comp2(1)));
	Z(2) <= (not(Carry(2)) and (A(2) xor Comp2(2))) or (Carry(2) and not(A(2) xor Comp2(2)));
	Carry(3) <= (not(Carry(2)) and A(2) and Comp2(2)) or (Carry(2) and (A(2) or Comp2(2)));
	Z(3) <= (not(Carry(3)) and (A(3) xor Comp2(3))) or (Carry(3) and not(A(3) xor Comp2(3)));
	Carry(4) <= (not(Carry(3)) and A(3) and Comp2(3)) or (Carry(3) and (A(3) or Comp2(3)));
	Z(4) <= (not(Carry(4)) and (A(4) xor Comp2(4))) or (Carry(4) and not(A(4) xor Comp2(4)));
	Carry(5) <= (not(Carry(4)) and A(4) and Comp2(4)) or (Carry(4) and (A(4) or Comp2(4)));
	Z(5) <= (not(Carry(5)) and (A(5) xor Comp2(5))) or (Carry(5) and not(A(5) xor Comp2(5)));
	Carry(6) <= (not(Carry(5)) and A(5) and Comp2(5)) or (Carry(5) and (A(5) or Comp2(5)));
	Z(6) <= (not(Carry(6)) and (A(6) xor Comp2(6))) or (Carry(6) and not(A(6) xor Comp2(6)));
	Carry(7) <= (not(Carry(6)) and A(6) and Comp2(6)) or (Carry(6) and (A(6) or Comp2(6)));
	Z(7) <= (not(Carry(7)) and (A(7) xor Comp2(7))) or (Carry(7) and not(A(7) xor Comp2(7)));
	K <= (not(Carry(7)) and A(7) and Comp2(7)) or (Carry(7) and (A(7) or Comp2(7)));
	
	Cout(1) <= '0'; Cout(2) <= '0'; Cout(3) <= '0'; Cout(4) <= '0'; Cout(5) <= '0'; Cout(6) <= '0'; Cout(7) <= '0';
	Cout(0) <= K and (Z(7) or Z(6) or Z(5) or Z(4) or Z(3) or Z(2) or Z(1) or Z(0));

end arq_mayor_8;

