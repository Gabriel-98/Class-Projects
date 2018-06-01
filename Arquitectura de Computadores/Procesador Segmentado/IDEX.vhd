library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IDEX is
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
end IDEX;

architecture arq_IDEX of IDEX is

begin
	process(clock, reset)
	begin
		if reset = '1' then
			pc_out <= X"00000000";
			next_pc_out <= X"00000000";
			disp30_out <= X"00000000";
			disp22_out <= X"00000000";
			rfsource_out <= "00";
			pcsource_out <= "00";
			wrenmem_out <= '0';
			aluop_out <= "000000";
			wren_out <= '0';
			ncwp_out <= "0";
			crs1_out <= X"00000000";
			crs2_out <= X"00000000";
			crd_out <= X"00000000";
			op2sinm_out <= X"00000000";
			i_out <= '0';
		elsif clock'event and clock = '1' then
			pc_out <= pc_in;
			next_pc_out <= next_pc_in;
			disp30_out <= disp30_in;
			disp22_out <= disp22_in;
			rfsource_out <= rfsource_in;
			pcsource_out <= pcsource_in;
			wrenmem_out <= wrenmem_in;
			aluop_out <= aluop_in;
			wren_out <= wren_in;
			ncwp_out <= ncwp_in;
			crs1_out <= crs1_in;
			crs2_out <= crs2_in;
			crd_out <= crd_in;
			op2sinm_out <= op2sinm_in;
			i_out <= i_in;
		end if;
	end process;
	
end arq_IDEX;

