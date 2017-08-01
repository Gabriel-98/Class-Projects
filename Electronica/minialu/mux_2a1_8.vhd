library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2a1_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_2a1_8;

architecture arq_mux_2a1_8 of mux_2a1_8 is

begin
	Z(0) <= (A(0) and not(S)) or (B(0) and S);
	Z(1) <= (A(1) and not(S)) or (B(1) and S);
	Z(2) <= (A(2) and not(S)) or (B(2) and S);
	Z(3) <= (A(3) and not(S)) or (B(3) and S);
	Z(4) <= (A(4) and not(S)) or (B(4) and S);
	Z(5) <= (A(5) and not(S)) or (B(5) and S);
	Z(6) <= (A(6) and not(S)) or (B(6) and S);
	Z(7) <= (A(7) and not(S)) or (B(7) and S);

end arq_mux_2a1_8;

