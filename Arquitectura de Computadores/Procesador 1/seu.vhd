library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seu is
    Port ( sinm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture arq_seu of seu is

begin
	process(sinm13)
	begin
		sinm32 <= (31 downto 12 => sinm13(12),
					  11 => sinm13(11),
					  10 => sinm13(10),
					  9 => sinm13(9),
					  8 => sinm13(8),
					  7 => sinm13(7),
					  6 => sinm13(6),
					  5 => sinm13(5),
					  4 => sinm13(4),
					  3 => sinm13(3),
					  2 => sinm13(2),
					  1 => sinm13(1),
					  0 => sinm13(0));
	end process;

end arq_seu;

