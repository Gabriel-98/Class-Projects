library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2a1_1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           S : in  STD_LOGIC;
           Z : out  STD_LOGIC);
end mux_2a1_1;

architecture arq_mux_2a1_1 of mux_2a1_1 is

begin
	Z <= (I0 and not(S)) or (I1 and S);

end arq_mux_2a1_1;

