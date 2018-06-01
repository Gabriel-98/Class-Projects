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
	Component IFID 
		Port (  clock : in  STD_LOGIC;
				  reset : in STD_LOGIC;
				  pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  next_pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  instruction_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  next_pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  instruction_out : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	Component IDEX 
		Port (  clock : in  STD_LOGIC;
				  reset : in STD_LOGIC;
				  pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  next_pc_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  disp30_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  disp22_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  rfsource_in : in  STD_LOGIC_VECTOR (1 downto 0);
				  pcsource_in : in  STD_LOGIC_VECTOR (1 downto 0); 
				  wrenmem_in : in  STD_LOGIC;
				  aluop_in : in  STD_LOGIC_VECTOR (5 downto 0);
				  wren_in : in  STD_LOGIC;		  
				  ncwp_in : in  STD_LOGIC_VECTOR (0 downto 0);
				  crs1_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  crs2_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  crd_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  op2sinm_in : in  STD_LOGIC_VECTOR (31 downto 0);
				  i_in : in  STD_LOGIC;
				  pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  next_pc_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  disp30_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  disp22_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  rfsource_out : out  STD_LOGIC_VECTOR (1 downto 0);
				  pcsource_out : out  STD_LOGIC_VECTOR (1 downto 0);
				  wrenmem_out : out  STD_LOGIC;
				  aluop_out : out  STD_LOGIC_VECTOR (5 downto 0);
				  wren_out : out  STD_LOGIC;
				  ncwp_out : out  STD_LOGIC_VECTOR (0 downto 0);
				  crs1_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  crs2_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  crd_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  op2sinm_out : out  STD_LOGIC_VECTOR (31 downto 0);
				  i_out : out  STD_LOGIC);
	end component;
	
	signal pc2: STD_LOGIC_VECTOR(31 downto 0);
	signal dir2: STD_LOGIC_VECTOR(31 downto 0);
	signal instruction2: STD_LOGIC_VECTOR(31 downto 0);
	
	signal pc3: STD_LOGIC_VECTOR(31 downto 0);
	signal dir3: STD_LOGIC_VECTOR(31 downto 0);
	signal disp30_2: STD_LOGIC_VECTOR(31 downto 0);
	signal disp22_2: STD_LOGIC_VECTOR(31 downto 0);
	signal rfsource2: STD_LOGIC_VECTOR(1 downto 0);
	signal pcsource2: STD_LOGIC_VECTOR(1 downto 0);
	signal wrenmem2: STD_LOGIC;
	signal operation_alu2: STD_LOGIC_VECTOR(5 downto 0);
	signal wren2:  STD_LOGIC;
	signal ncwp2: STD_LOGIC_VECTOR(0 downto 0);
	signal crs1_2: STD_LOGIC_VECTOR(31 downto 0);
	signal crs2_2: STD_LOGIC_VECTOR(31 downto 0);
	signal crd_2: STD_LOGIC_VECTOR(31 downto 0);
	signal i:  STD_LOGIC;
	
	signal wren3:  STD_LOGIC;
	
	signal wren4:  STD_LOGIC;
	
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
	--------------------------------------------
	Z1: IFID Port Map(
		 clock => clock,
		 reset => reset,
		 pc_in => pc,
       next_pc_in => dir,
       instruction_in => instruction,
       pc_out => pc2,
       next_pc_out => dir2,
       instruction_out => instruction2
	);
	--------------------------------------------
	L5: windows_manager Port Map(
		 cwp => cwp,
		 rs1 => instruction2(18 downto 14),
		 rs2 => instruction2(4 downto 0),
		 rd => instruction2(29 downto 25),
		 op => instruction2(31 downto 30),
		 op3 => instruction2(24 downto 19),
		 ncwp => ncwp,
		 nrs1 => nrs1,
		 nrs2 => nrs2,
		 nrd => rd,
		 ro7 => ro7
	);
	L6: ControlUnit Port Map(
		 op => instruction2(31 downto 30),
		 op3 => instruction2(24 downto 19),
		 icc => icc,
		 cond => instruction2(28 downto 25),
		 wrenmem => wrenmem,
		 wren => wren3,
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
		 sinm13 => instruction2(12 downto 0),
		 sinm32 => sinm32
	);
	L10: seu30 Port Map(
		 sinm30 => instruction2(29 downto 0),
		 sinm32 => disp30
	);
	L11: seu22 Port Map(
		 sinm22 => instruction2(21 downto 0),
		 sinm32 => disp22
	);
	--------------------------------------------
	Z2: IDEX Port Map(
		 clock => clock,
		 reset => reset,
		 pc_in => pc2,
       next_pc_in => dir2,
		 disp30_in => disp30,
		 disp22_in => disp22,
		 rfsource_in => rfsource,
		 pcsource_in => pcsource,
		 wrenmem_in => wrenmem,
		 aluop_in => operation_alu,
		 wren_in =>	wren,
		 ncwp_in => ncwp,
		 crs1_in => crs1,
		 crs2_in => crs2,
		 crd_in => crd,
		 op2sinm_in =>
		 i_in => instruction2(13),
		 pc_out => pc3,
		 next_pc_out => dir3,
		 disp30_out => disp30_2,
		 disp22_out => disp22_2,
		 rfsource_out => rfsource2,
		 pcsource_out => pcsource2,
		 wrenmem_out => wrenmem2,
		 aluop_out => operation_alu2,
		 wren_out => wren2,
		 ncwp_out => ncwp2,
		 crs1_out => crs1_2,
		 crs2_out => crs2_2,
		 crd_out => crd_2,
		 op2sinm_out =>
		 i_out => i
	);
	--------------------------------------------
	L12: mux_op2 Port Map(
		 A => crs2_2,
		 B => sinm32,
		 i => i,
		 result => crs2_or_sinm13
	);
	L13: psr_modifier Port Map(
		crs1 => crs1_2,
		crs2 => crs2_or_sinm13,
		op_alu => operation_alu2,
		result_alu => result_alu,
		nzvc => nzvc
	);
	L14: psr Port Map(
		reset => reset,
		clock => clock,
		nzvc => nzvc,
		ncwp => ncwp2,
		cwp => cwp,
		icc => icc,
		c => c
	);
	L15: alu Port Map(
		 A => crs1_2,
		 B => crs2_or_sinm13,
		 c => c,
		 op => operation_alu2,
		 result => result_alu
	);
	L16: sumador Port Map(
		 A => pc3,
		 B => disp30_2,
		 C => pc_call
	);
	L17: sumador Port Map(
		 A => pc3,
		 B => disp22_2,
		 C => pc_branch
	);
	L18: mux_npc Port Map(
		 pc_call => pc_call,
		 pc_branch => pc_branch,
		 pc => dir3,
		 result_alu => result_alu,
		 pcsource => pcsource2,
		 npc => new_npc
	);
	
	-- Z3
	L19: DataMemory Port Map(
		 result_alu => result_alu(4 downto 0),
       crd => crd_2,
       wrenmem => wrenmem2,
       reset => reset,
       datatomem => datatomem
	);
	-- Z4
	L20: mux_dwr Port Map(
		 datatomem => datatomem,
       result_alu => result_alu,
       pc => pc3,
       rfsource => rfsource2,
		 wrenin => wren2,
		 wrenout => wren3,
       datatoreg => datatoreg
	);
	
	result <= datatoreg;

end arq_procesador;

