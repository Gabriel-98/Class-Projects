library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_nrd is
    Port ( rd : in  STD_LOGIC_VECTOR (5 downto 0);
           ro7 : in  STD_LOGIC_VECTOR (5 downto 0);
           rfdest : in  STD_LOGIC;
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end mux_nrd;

architecture arq_mux_nrd of mux_nrd is

begin
	process(rd,ro7,rfdest)
	begin
		if rfdest = '0' then
			nrd <= rd;
		else								-- CALL
			nrd <= ro7;
		end if;
	end process;

end arq_mux_nrd;

