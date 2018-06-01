library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seu30 is
    Port ( sinm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end seu30;

architecture arq_seu30 of seu30 is

begin
	process(sinm30)
	begin
		if sinm30(29) = '0' then
			sinm32 <= "00" & sinm30;
		else
			sinm32 <= "11" & sinm30;
		end if;
	end process;

end arq_seu30;