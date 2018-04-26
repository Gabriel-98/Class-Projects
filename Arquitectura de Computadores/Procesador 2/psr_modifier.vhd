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
		if op_alu /= "111111" and op_alu(4) = '1' then		-- ICC
			-- NEGATIVE
			nzvc(3) <= result_alu(31);
			
			-- ZERO
			if result_alu = X"00000000" then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;
			
			-- OVERFLOW
			nzvc(1) <= (crs1(31) and crs2(31) and not(result_alu(31))) or (not(crs1(31)) and not(crs2(31)) and result_alu(31));
			
			-- CARRY
			case op_alu is
				when "010000" => nzvc(0) <= (crs1(31) and crs2(31)) or (not(result_alu(31)) and (crs1(31) or crs2(31)));
				when "011000" => nzvc(0) <= (crs1(31) and crs2(31)) or (not(result_alu(31)) and (crs1(31) or crs2(31)));
				when "010100" => nzvc(0) <= (crs1(31) and crs2(31) and result_alu(31)) or (not(crs1(31)) and (crs2(31) or result_alu(31)));
				when "011100" => nzvc(0) <= (crs1(31) and crs2(31) and result_alu(31)) or (not(crs1(31)) and (crs2(31) or result_alu(31)));
				when others => nzvc(0) <= '0';
			end case;
		
		else
			nzvc <= "0000";
		end if;

	end process;

end arq_psr_modifier;

