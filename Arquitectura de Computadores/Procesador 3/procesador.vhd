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
	Component seu13 
		Port (  sinm13 : in  STD_LOGIC_VECTOR (12 downto 0);
				  sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component seu22 
		Port (  sinm22 : in  STD_LOGIC_VECTOR (21 downto 0);
				  sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component seu30 
		Port (  sinm30 : in  STD_LOGIC_VECTOR (29 downto 0);
				  sinm32 : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component mux_op2 
		Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  i : in  STD_LOGIC;
				  result : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component mux_nrd 
		Port (  rd : in  STD_LOGIC_VECTOR (5 downto 0);
				  ro7 : in  STD_LOGIC_VECTOR (5 downto 0);
              rfdest : in  STD_LOGIC;
				  nrd : out  STD_LOGIC_VECTOR (5 downto 0));
	end component;
	Component mux_dwr 
		Port (  datatomem : in  STD_LOGIC_VECTOR (31 downto 0);
				  result_alu : in  STD_LOGIC_VECTOR (31 downto 0);
				  pc : in  STD_LOGIC_VECTOR (31 downto 0);
				  rfsource :in  STD_LOGIC_VECTOR (1 downto 0);
				  wrenin : in  STD_LOGIC;
				  wrenout : out  STD_LOGIC;
				  datatoreg : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component mux_npc 
		Port (  pc_call : in  STD_LOGIC_VECTOR (31 downto 0);
				  pc_branch : in  STD_LOGIC_VECTOR (31 downto 0);
				  pc : in  STD_LOGIC_VECTOR (31 downto 0);
				  result_alu : in  STD_LOGIC_VECTOR (31 downto 0);
				  pcsource : in  STD_LOGIC_VECTOR (1 downto 0);
				  npc : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component InstructionMemory 
		Port (  address : in  STD_LOGIC_VECTOR (31 downto 0);
				  reset : in  STD_LOGIC;
				  outInstruction : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component ControlUnit 
		Port (  op : in  STD_LOGIC_VECTOR (1 downto 0);
				  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
				  icc : in  STD_LOGIC_VECTOR (3 downto 0);
				  cond : in  STD_LOGIC_VECTOR (3 downto 0);
				  wrenmem : out  STD_LOGIC;
				--  rdenmem : out  STD_LOGIC;
				  wren : out  STD_LOGIC;
				  rfsource : out  STD_LOGIC_VECTOR (1 downto 0);
				  pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
				  rfdest : out  STD_LOGIC;
				  op_alu : out  STD_LOGIC_VECTOR (5 downto 0));
	end component;
	Component windows_manager 
		Port (  cwp : in  STD_LOGIC_VECTOR (0 downto 0);
				  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
				  rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
				  rd : in  STD_LOGIC_VECTOR (4 downto 0);
				  op : in  STD_LOGIC_VECTOR (1 downto 0);
				  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
				  ncwp : out  STD_LOGIC_VECTOR (0 downto 0);
				  nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
				  nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
				  nrd : out  STD_LOGIC_VECTOR (5 downto 0);
				  ro7 : out  STD_LOGIC_VECTOR (5 downto 0));
	end component;
	Component RegisterFile 
		Port (  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);				  
				  rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
				  rd : in  STD_LOGIC_VECTOR (5 downto 0);
				  dwr : in  STD_LOGIC_VECTOR (31 downto 0);
				  wren : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
				  crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
				  crd : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component psr 
		Port (  reset : in  STD_LOGIC;
				  clock : in  STD_LOGIC;
				  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
				  ncwp : in  STD_LOGIC_VECTOR (0 downto 0);
				  cwp : out  STD_LOGIC_VECTOR (0 downto 0);
				  icc : out  STD_LOGIC_VECTOR (3 downto 0);
				  c : out  STD_LOGIC);
	end component;
	Component psr_modifier
		Port (  crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
				  crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
				  op_alu : in  STD_LOGIC_VECTOR (5 downto 0);
				  result_alu : in  STD_LOGIC_VECTOR (31 downto 0);
				  nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	Component alu 
		Port (  A : in  STD_LOGIC_VECTOR (31 downto 0);
				  B : in  STD_LOGIC_VECTOR (31 downto 0);
				  c : in  STD_LOGIC;
				  op : in  STD_LOGIC_VECTOR (5 downto 0);
				  result : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component DataMemory 
		Port (  result_alu : in  STD_LOGIC_VECTOR (4 downto 0);
				  crd : in  STD_LOGIC_VECTOR (31 downto 0);
				  wrenmem : in  STD_LOGIC;
				  reset : in  STD_LOGIC;
				  datatomem : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	signal pc: STD_LOGIC_VECTOR(31 downto 0);
	signal npc: STD_LOGIC_VECTOR(31 downto 0);
	signal new_npc: STD_LOGIC_VECTOR(31 downto 0);
	signal dir: STD_LOGIC_VECTOR(31 downto 0);
	signal instruction: STD_LOGIC_VECTOR(31 downto 0);
	signal operation_alu: STD_LOGIC_VECTOR(5 downto 0);
	signal sinm32: STD_LOGIC_VECTOR(31 downto 0);
	signal crs1: STD_LOGIC_VECTOR(31 downto 0);
	signal crs2: STD_LOGIC_VECTOR(31 downto 0);
	signal crs2_or_sinm13: STD_LOGIC_VECTOR(31 downto 0);
	signal crd: STD_LOGIC_VECTOR(31 downto 0);
	signal rd: STD_LOGIC_VECTOR(5 downto 0);
	signal ro7: STD_LOGIC_VECTOR(5 downto 0);
	signal nrs1: STD_LOGIC_VECTOR(5 downto 0);
	signal nrs2: STD_LOGIC_VECTOR(5 downto 0);
	signal nrd: STD_LOGIC_VECTOR(5 downto 0);
	signal cwp: STD_LOGIC_VECTOR(0 downto 0);
	signal ncwp: STD_LOGIC_VECTOR(0 downto 0);
	signal nzvc: STD_LOGIC_VECTOR(3 downto 0);
	signal icc: STD_LOGIC_VECTOR(3 downto 0);
	signal c: STD_LOGIC;
	signal result_alu: STD_LOGIC_VECTOR(31 downto 0);
	signal wren:  STD_LOGIC;
	signal wren2:  STD_LOGIC;
	signal wrenmem: STD_LOGIC;
	signal rfdest: STD_LOGIC;
	signal rfsource: STD_LOGIC_VECTOR(1 downto 0);
	signal pcsource: STD_LOGIC_VECTOR(1 downto 0);
	signal datatomem: STD_LOGIC_VECTOR(31 downto 0);
	signal datatoreg: STD_LOGIC_VECTOR(31 downto 0);
	signal disp30: STD_LOGIC_VECTOR(31 downto 0);
	signal disp22: STD_LOGIC_VECTOR(31 downto 0);
	signal pc_call: STD_LOGIC_VECTOR(31 downto 0);
	signal pc_branch: STD_LOGIC_VECTOR(31 downto 0);

begin
	L1: sumador Port Map(
		 A => npc,
		 B => X"00000001",
		 C => dir
	);
	L2: ProgramCounter Port Map(
		 address => new_npc,
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
	-- Z1
	L5: windows_manager Port Map(
		 cwp => cwp,
		 rs1 => instruction(18 downto 14),
		 rs2 => instruction(4 downto 0),
		 rd => instruction(29 downto 25),
		 op => instruction(31 downto 30),
		 op3 => instruction(24 downto 19),
		 ncwp => ncwp,
		 nrs1 => nrs1,
		 nrs2 => nrs2,
		 nrd => rd,
		 ro7 => ro7
	);
	L6: ControlUnit Port Map(
		 op => instruction(31 downto 30),
		 op3 => instruction(24 downto 19),
		 icc => icc,
		 cond => instruction(28 downto 25),
		 wrenmem => wrenmem,
		 wren => wren,
		 rfsource => rfsource,
		 pcsource => pcsource,
		 rfdest => rfdest,
		 op_alu => operation_alu
	);
	L7: mux_nrd Port Map(
		 rd => rd,
		 ro7 => ro7,
       rfdest => rfdest,
		 nrd => nrd
	);
	L8: RegisterFile Port Map(
		 rs1 => nrs1,
		 rs2 => nrs2,
		 rd => nrd,
		 dwr => datatoreg,
		 wren => wren2,
		 reset => reset,
		 crs1 => crs1,
		 crs2 => crs2,
		 crd => crd
	);
	L9: seu13 Port Map(
		 sinm13 => instruction(12 downto 0),
		 sinm32 => sinm32
	);
	L10: seu30 Port Map(
		 sinm30 => instruction(29 downto 0),
		 sinm32 => disp30
	);
	L11: seu22 Port Map(
		 sinm22 => instruction(21 downto 0),
		 sinm32 => disp22
	);
	-- Z2
	L12: mux_op2 Port Map(
		 A => crs2,
		 B => sinm32,
		 i => instruction(13),
		 result => crs2_or_sinm13
	);
	L13: psr_modifier Port Map(
		crs1 => crs1,
		crs2 => crs2_or_sinm13,
		op_alu => operation_alu,
		result_alu => result_alu,
		nzvc => nzvc
	);
	L14: psr Port Map(
		reset => reset,
		clock => clock,
		nzvc => nzvc,
		ncwp => ncwp,
		cwp => cwp,
		icc => icc,
		c => c
	);
	L15: alu Port Map(
		 A => crs1,
		 B => crs2_or_sinm13,
		 c => c,
		 op => operation_alu,
		 result => result_alu
	);
	L16: sumador Port Map(
		 A => pc,
		 B => disp30,
		 C => pc_call
	);
	L17: sumador Port Map(
		 A => pc,
		 B => disp22,
		 C => pc_branch
	);
	L18: mux_npc Port Map(
		 pc_call => pc_call,
		 pc_branch => pc_branch,
		 pc => dir,
		 result_alu => result_alu,
		 pcsource => pcsource,
		 npc => new_npc
	);
	
	-- Z3
	L19: DataMemory Port Map(
		 result_alu => result_alu(4 downto 0),
       crd => crd,
       wrenmem => wrenmem,
       reset => reset,
       datatomem => datatomem
	);
	-- Z4
	L20: mux_dwr Port Map(
		 datatomem => datatomem,
       result_alu => result_alu,
       pc => pc,
       rfsource => rfsource,
		 wrenin => wren,
		 wrenout => wren2,
       datatoreg => datatoreg
	);
	
	result <= datatoreg;

end arq_procesador;

