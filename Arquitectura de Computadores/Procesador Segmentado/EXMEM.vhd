library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EXMEM is
    Port ( clock : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           npc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           wrenmem_in : in  STD_LOGIC;
           rfsource_in : in  STD_LOGIC_VECTOR (1 downto 0);
           crd_in : in  STD_LOGIC_VECTOR (31 downto 0);
           result_alu_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           npc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           wrenmem_out : out  STD_LOGIC;
           rfsource_out : out  STD_LOGIC_VECTOR (1 downto 0);
           crd_out : out  STD_LOGIC_VECTOR (31 downto 0);
           result_alu_out : out  STD_LOGIC_VECTOR (31 downto 0));
end EXMEM;

architecture arq_EXMEM of EXMEM is

begin
	process(clock, reset)
	begin
		if reset = '1' then
			pc_out <= X"00000000";
			npc_out <= X"00000000";
			wrenmem_out <= '0';
			rfsource_out <= "00";
			crd_out <= X"00000000";
			result_alu_out <= X"00000000";
		elsif clock'event and clock = '1' then
			pc_out <= pc_in;
			npc_out <= npc_in;
			wrenmem_out <= wrenmem_in;
			rfsource_out <= rfsource_in;
			crd_out <= crd_in;
			result_alu_out <= result_alu_in;
		end if;
	end process;

end arq_EXMEM;

