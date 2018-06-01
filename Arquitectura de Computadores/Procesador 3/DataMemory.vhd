library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( result_alu : in  STD_LOGIC_VECTOR (4 downto 0);
           crd : in  STD_LOGIC_VECTOR (31 downto 0);
           wrenmem : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           datatomem : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture arq_DataMemory of DataMemory is

	type ram_type is array (0 to 31) of std_logic_vector(31 downto 0);
	signal DM : ram_type:=(others => X"00000000");

begin
	process(result_alu,crd,wrenmem,reset,DM)
	begin
		if reset = '1' then
			DM <= (others => X"00000000");
			datatomem <= X"00000000";
		else
			if wrenmem = '1' then
				DM(conv_integer(result_alu)) <= crd;
			end if;	
			datatomem <= DM(conv_integer(result_alu));
		end if;
	end process;

end arq_DataMemory;

