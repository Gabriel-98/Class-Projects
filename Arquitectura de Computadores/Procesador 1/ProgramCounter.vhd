library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture arq_ProgramCounter of ProgramCounter is

begin
	process(clock,reset)
	begin
		if reset = '1' then
			PCout <= X"00000000";
		elsif clock'event and clock = '1' then
			PCout <= address;
		end if;
	end process;

end arq_ProgramCounter;

