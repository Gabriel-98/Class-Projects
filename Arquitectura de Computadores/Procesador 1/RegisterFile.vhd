library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RegisterFile is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           dwr : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture arq_RegisterFile of RegisterFile is

	type ram_type is array (0 to 31) of std_logic_vector(31 downto 0);
	signal RF : ram_type:=(others => X"00000000");

begin
	process(rs1,rs2,rd,dwr,rst,RF)
	begin
		if rst = '1' then
			RF <= (others => X"00000000");
		end if;
		crs1 <= RF(conv_integer(rs1));
		crs2 <= RF(conv_integer(rs2));
		if rd /= "00000" then
			RF(conv_integer(rd)) <= dwr;
		end if;
	end process;


end arq_RegisterFile;

