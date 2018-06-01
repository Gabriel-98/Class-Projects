library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_npc is
    Port ( pc_call : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_branch : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           result_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           pcsource : in  STD_LOGIC_VECTOR (1 downto 0);
           npc : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_npc;

architecture arq_mux_npc of mux_npc is

begin
	process(pc_call,pc_branch,pc,result_alu,pcsource)
	begin
		if pcsource = "11" then				-- CALL
			npc <= pc_call;
		elsif pcsource = "01" then			-- BRACH
			npc <= pc_branch;
		elsif pcsource = "10" then			-- JMPL
			npc <= result_alu;
		else
			npc <= pc;
		end if;
	end process;

end arq_mux_npc;
