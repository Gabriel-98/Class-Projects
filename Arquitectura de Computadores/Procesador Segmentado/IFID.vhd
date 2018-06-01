library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IFID is
    Port ( clock : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           next_pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction_in : in  STD_LOGIC_VECTOR (31 downto 0);
           pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           next_pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
           instruction_out : out  STD_LOGIC_VECTOR (31 downto 0));
end IFID;

architecture arq_IFID of IFID is

begin
	process(clock, reset)
	begin
		if reset = '1' then
			pc_out <= X"00000000";
			next_pc_out <= X"00000000";
			instruction_out <= X"00000000";
		elsif clock'event and clock = '1' then
			pc_out <= pc_in;
			next_pc_out <= next_pc_in;
			instruction_out <= instruction_in;
		end if;
	end process;

end arq_IFID;

