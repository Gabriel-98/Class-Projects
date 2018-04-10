library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seu is
    Port ( sinm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture arq_seu of seu is

begin
	sinm32(31) <= sinm13(12);
	sinm32(30) <= sinm13(12);
	sinm32(29) <= sinm13(12);
	sinm32(28) <= sinm13(12);
	sinm32(27) <= sinm13(12);
	sinm32(26) <= sinm13(12);
	sinm32(25) <= sinm13(12);
	sinm32(24) <= sinm13(12);
	sinm32(23) <= sinm13(12);
	sinm32(22) <= sinm13(12);
	sinm32(21) <= sinm13(12);
	sinm32(20) <= sinm13(12);
	sinm32(19) <= sinm13(12);
	sinm32(18) <= sinm13(12);
	sinm32(17) <= sinm13(12);
	sinm32(16) <= sinm13(12);
	sinm32(15) <= sinm13(12);
	sinm32(14) <= sinm13(12);
	sinm32(13) <= sinm13(12);
	sinm32(12) <= sinm13(12);
	sinm32(11) <= sinm13(11);
	sinm32(10) <= sinm13(10);
	sinm32(9) <= sinm13(9);
	sinm32(8) <= sinm13(8);
	sinm32(7) <= sinm13(7);
	sinm32(6) <= sinm13(6);
	sinm32(5) <= sinm13(5);
	sinm32(4) <= sinm13(4);
	sinm32(3) <= sinm13(3);
	sinm32(2) <= sinm13(2);
	sinm32(1) <= sinm13(1);
	sinm32(0) <= sinm13(0);

end arq_seu;

