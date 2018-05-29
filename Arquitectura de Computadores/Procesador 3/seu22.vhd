library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seu22 is
    Port ( sinm22 : in  STD_LOGIC_VECTOR (21 downto 0);
           sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end seu22;

architecture arq_seu22 of seu22 is

begin
	process(sinm22)
	begin
		if sinm22(21) = '0' then
			sinm32 <= "0000000000" & sinm22;
		else
			sinm32 <= "1111111111" & sinm22;
		end if;
	end process;

end arq_seu22;

