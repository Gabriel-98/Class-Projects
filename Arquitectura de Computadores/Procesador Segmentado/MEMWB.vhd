library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEMWB is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           rfsource_in : in  STD_LOGIC_VECTOR (1 downto 0);
           datatomem_in : in  STD_LOGIC_VECTOR (31 downto 0);
           result_alu_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsource_out : out  STD_LOGIC_VECTOR (1 downto 0);
           datatomem_out : out  STD_LOGIC_VECTOR (31 downto 0);
           result_alu_out : out  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0));
end MEMWB;

architecture arq_MEMWB of MEMWB is

begin
	process(clock, reset)
	begin
		if reset = '1' then
			rfsource_out <= "00";
			datatomem_out <= X"00000000";
			result_alu_out <= X"00000000";
			pc_out <= X"00000000";
		elsif clock'event and clock = '1' then
			rfsource_out <= rfsource_in;
			datatomem_out <= datatomem_in;
			result_alu_out <= result_alu_in;
			pc_out <= pc_in;
		end if;
	end process;

end arq_MEMWB;

