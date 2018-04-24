library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity procesador is
    Port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end procesador;

architecture arq_procesador of procesador is

	Component ProgramCounter 
		Port (  address : in  STD_LOGIC_VECTOR (31 downto 0);
				  reset : in  STD_LOGIC;
				  clock : in  STD_LOGIC;
				  PCout : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component sumador 
		Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  C : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component InstructionMemory 
		Port (  address : in  STD_LOGIC_VECTOR (31 downto 0);
				  reset : in  STD_LOGIC;
				  outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component ControlUnit 
		Port (  op : in  STD_LOGIC_VECTOR (1 downto 0);
				  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
				  op_alu : out  STD_LOGIC_VECTOR (5 downto 0));
	end component;
	Component RegisterFile 
		Port (  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
				  rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
				  rd : in  STD_LOGIC_VECTOR (4 downto 0);
				  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
				  reset : in  STD_LOGIC;
				  crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
				  crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component seu 
		Port (  sinm13 : in  STD_LOGIC_VECTOR (12 downto 0);
				  sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component multiplexor 
		Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  i : in  STD_LOGIC;
				  result : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component alu 
		Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  op : in  STD_LOGIC_VECTOR (5 downto 0);
				  result : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	signal pc: STD_LOGIC_VECTOR(31 downto 0);
	signal npc: STD_LOGIC_VECTOR(31 downto 0);
	signal dir: STD_LOGIC_VECTOR(31 downto 0);
	signal instruction: STD_LOGIC_VECTOR(31 downto 0);
	signal operation_alu: STD_LOGIC_VECTOR(5 downto 0);
	signal sinm32: STD_LOGIC_VECTOR(31 downto 0);
	signal crs1: STD_LOGIC_VECTOR(31 downto 0);
	signal crs2: STD_LOGIC_VECTOR(31 downto 0);
	signal crs2_or_sinm13: STD_LOGIC_VECTOR(31 downto 0);
	signal result_alu: STD_LOGIC_VECTOR(31 downto 0);

begin
	L1: sumador Port Map(
		 A => npc,
		 B => X"00000001",
		 C => dir
	);
	L2: ProgramCounter Port Map(
		 address => dir,
		 reset => reset,
		 clock => clock,
		 PCout => npc
	);
	L3: ProgramCounter Port Map(
		 address => npc,
		 reset => reset,
		 clock => clock,
		 PCout => pc
	);
	L4: InstructionMemory Port Map(
		 address => pc,
		 reset => reset,
		 outInstruction => instruction
	);
	L5: ControlUnit Port Map(
		 op => instruction(31 downto 30),
		 op3 => instruction(24 downto 19),
		 op_alu => operation_alu
	);
	L6: RegisterFile Port Map(
		 rs1 => instruction(18 downto 14),
		 rs2 => instruction(4 downto 0),
		 rd => instruction(29 downto 25),
		 dwr => result_alu,
		 reset => reset,
		 crs1 => crs1,
		 crs2 => crs2
	);
	L7: seu Port Map(
		 sinm13 => instruction(12 downto 0),
		 sinm32 => sinm32
	);
	L8: multiplexor Port Map(
		 A => crs2,
		 B => sinm32,
		 i => instruction(13),
		 result => crs2_or_sinm13
	);
	L9: alu Port Map(
		 A => crs1,
		 B => crs2_or_sinm13,
		 op => operation_alu,
		 result => result_alu
	);
	
	result <= result_alu;

end arq_procesador;

