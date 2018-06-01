library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity psr_modifier is
    Port ( crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           op_alu : in  STD_LOGIC_VECTOR (5 downto 0);
           result_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end psr_modifier;

architecture arq_psr_modifier of psr_modifier is

begin
	process(crs1,crs2,op_alu,result_alu)
	begin
		if op_alu = "010000" or op_alu = "011000" or op_alu = "010100" or op_alu = "011100" or
			op_alu = "010001" or op_alu = "010101" or op_alu = "010010" or op_alu = "010110" or
			op_alu = "010011" or op_alu = "010111" then
			
			-- NEGATIVE
			nzvc(3) <= result_alu(31);
			
			-- ZERO
			if result_alu = X"00000000" then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			
			-- OVERFLOW
			if op_alu = "010000" or op_alu = "011000" then
				nzvc(1) <= (crs1(31) and crs2(31) and not(result_alu(31))) or (not(crs1(31)) and not(crs2(31)) and result_alu(31));
			elsif op_alu = "010100" or op_alu = "011100" then
				nzvc(1) <= (not(crs1(31)) and crs2(31) and result_alu(31)) or (crs1(31) and not(crs2(31)) and not(result_alu(31)));
			else
				nzvc(1) <= '0';
			end if;
			
			-- CARRY
			if op_alu = "010000" or op_alu = "011000" then
				nzvc(0) <= (crs1(31) and crs2(31)) or (not(result_alu(31)) and (crs1(31) or crs2(31)));
			elsif op_alu = "010100" or op_alu = "011100" then
				nzvc(0) <= (not(crs1(31)) and crs2(31)) or (result_alu(31) and (not(crs1(31)) or crs2(31)));
			else
				nzvc(0) <= '0';
			end if;
		
		else
			nzvc <= "0000";
		end if;

	end process;

end arq_psr_modifier;

