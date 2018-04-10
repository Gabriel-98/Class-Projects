library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (5 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture arq_alu of alu is

begin
	result <=   A and B when op = "000001" else
					A or B when op = "000010" else
					A xor B when op = "000011" else
					A + B when op = "000000" else
					A - B when op = "000100" else
					X"00000000";
					
end arq_alu;
