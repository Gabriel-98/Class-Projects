library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProgramCounter is
    Port ( addr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           PCout : out  STD_LOGIC_VECTOR (31 downto 0));
end ProgramCounter;

architecture arq_ProgramCounter of ProgramCounter is

begin
	process(clk,rst)
	begin
		if rst = '1' then
			PCout <= X"00000000";
		elsif clk'event and clk = '1' then
			PCout <= addr;
		end if;
	end process;

end arq_ProgramCounter;

