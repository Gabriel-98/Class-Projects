library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity windows_manager is
    Port ( cwp : in  STD_LOGIC_VECTOR (0 downto 0);
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC_VECTOR (0 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end windows_manager;

architecture arq_windows_manager of windows_manager is

begin
	process(cwp,rs1,rs2,rd,op,op3)
	begin
		if op = "00" or op = "01" then
			ncwp <= cwp;
			nrs1 <= "000000";
			nrs2 <= "000000";
			nrd <= "000000";
		else
			-- nrs1
			if rs1 >= "00000" and rs1 <= "00111" then
				nrs1 <= '0' & rs1;
			elsif rs1 >= "01000" and rs1 <= "10111" then
				nrs1 <= rs1 + (cwp * "10000");
			else
				nrs1 <= rs1 - (cwp * "10000");
			end if;
			
			-- nrs2
			if rs2 >= "00000" and rs2 <= "00111" then
				nrs2 <= '0' & rs2;
			elsif rs2 >= "01000" and rs2 <= "10111" then
				nrs2 <= rs2 + (cwp * "10000");
			else
				nrs2 <= rs2 - (cwp * "10000");
			end if;
			
			-- nrd
			if rd >= "00000" and rd <= "00111" then
				nrd <= '0' & rd;
			elsif rd >= "01000" and rd <= "10111" then
				nrd <= rd + (cwp * "10000");
			else
				nrd <= rd - (cwp * "10000");
			end if;
			
			-- ncwp
			case op3 is
				when "111100" => 								-- save
					if cwp = "1" then
						ncwp <= cwp - 1;
					else
						ncwp <= cwp;
					end if;
				when "111101" => ncwp <= cwp + 1;		-- restore
					if cwp = "0" then
						ncwp <= cwp + 1;
					else
						ncwp <= cwp;
					end if;
				when others => ncwp <= cwp;
			end case;
		end if;
	end process;

end arq_windows_manager;

