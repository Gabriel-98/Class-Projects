library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port ( rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           addr : out  STD_LOGIC_VECTOR (31 downto 0));
end Datapath;

architecture arq_Datapath of Datapath is

	Component ProgramCounter 
		Port (  addr : in  STD_LOGIC_VECTOR (31 downto 0);
				  rst : in  STD_LOGIC;
				  clk : in  STD_LOGIC;
				  PCout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component sumador 
		Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  C : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	signal pc: STD_LOGIC_VECTOR(31 downto 0);
	signal npc: STD_LOGIC_VECTOR(31 downto 0);
	signal dir: STD_LOGIC_VECTOR(31 downto 0);

begin
	L1: sumador Port Map(
		A => pc,
		B => X"00000004",
		C => dir
	);
	L2: ProgramCounter Port Map(
		addr => dir,
		rst => rst,
		clk => clk,
		PCout => npc
	);
	L3: ProgramCounter Port Map(
		addr => npc,
		rst => rst,
		clk => clk,
		PCout => pc
	);
	addr <= pc;

end arq_Datapath;

