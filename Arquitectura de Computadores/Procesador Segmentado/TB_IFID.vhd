LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_IFID IS
END TB_IFID;
 
ARCHITECTURE behavior OF TB_IFID IS 
 
    COMPONENT IFID
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         pc_in : IN  std_logic_vector(31 downto 0);
         next_pc_in : IN  std_logic_vector(31 downto 0);
         instruction_in : IN  std_logic_vector(31 downto 0);
         pc_out : OUT  std_logic_vector(31 downto 0);
         next_pc_out : OUT  std_logic_vector(31 downto 0);
         instruction_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal clock : std_logic := '0';
   signal reset : std_logic := '0';
   signal pc_in : std_logic_vector(31 downto 0) := (others => '0');
   signal next_pc_in : std_logic_vector(31 downto 0) := (others => '0');
   signal instruction_in : std_logic_vector(31 downto 0) := (others => '0');

   signal pc_out : std_logic_vector(31 downto 0);
   signal next_pc_out : std_logic_vector(31 downto 0);
   signal instruction_out : std_logic_vector(31 downto 0);

   constant clock_period : time := 20 ns;
 
BEGIN

   uut: IFID PORT MAP (
          clock => clock,
          reset => reset,
          pc_in => pc_in,
          next_pc_in => next_pc_in,
          instruction_in => instruction_in,
          pc_out => pc_out,
          next_pc_out => next_pc_out,
          instruction_out => instruction_out
        );

   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
   stim_proc: process
   begin		
      reset <= '1';
      wait for 20 ns;
		reset <= '0';
		pc_in <= X"00000001";
		next_pc_in <= X"00000002"; 
		instruction_in <= X"00100110";
		wait for 20 ns;
		pc_in <= X"00000002";
		next_pc_in <= X"00000003"; 
		instruction_in <= X"00100110";
		wait for 20 ns;
		pc_in <= X"00000003";
		next_pc_in <= X"00000004"; 
		instruction_in <= X"00100110";
		wait for 20 ns;
		pc_in <= X"00000004";
		next_pc_in <= X"00000005"; 
		instruction_in <= X"00100110";
		wait for 20 ns;
		pc_in <= X"00000005";
		next_pc_in <= X"00000006"; 
		instruction_in <= X"00100110";
		wait for 20 ns;
   end process;

END;
