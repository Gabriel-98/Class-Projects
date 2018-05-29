library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity zeu30 is
    Port ( inm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           inm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end zeu30;

architecture arq_zeu30 of zeu30 is

begin
	process(inm30)
	begin
		inm32 <= "00" & inm30;
	end process;

end arq_zeu30;

