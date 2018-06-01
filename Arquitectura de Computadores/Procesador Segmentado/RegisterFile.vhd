library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
			  wren : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  crd : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture arq_RegisterFile of RegisterFile is

	type ram_type is array (0 to 39) of std_logic_vector(31 downto 0);
	signal RF : ram_type:=(others => X"00000000");

begin
	process(rs1,rs2,rd,dwr,wren,reset,RF)
	begin
		if reset = '1' then
			RF <= (others => X"00000000");
			crs1 <= X"00000000";
			crs2 <= X"00000000";
			crd <= X"00000000";
		else
			crs1 <= RF(conv_integer(rs1));
			crs2 <= RF(conv_integer(rs2));
			crd <= RF(conv_integer(rd));
			if rd /= "000000" and wren = '1' then
				RF(conv_integer(rd)) <= dwr;
			end if;
		end if;
	end process;

end arq_RegisterFile;

