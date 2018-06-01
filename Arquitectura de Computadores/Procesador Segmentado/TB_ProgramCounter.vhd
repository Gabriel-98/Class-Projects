LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_ProgramCounter IS
END TB_ProgramCounter;
 
ARCHITECTURE behavior OF TB_ProgramCounter IS 
 
    COMPONENT ProgramCounter
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         clock : IN  std_logic;
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

   signal PCout : std_logic_vector(31 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: ProgramCounter PORT MAP (
          address => address,
          reset => reset,
          clock => clock,
          PCout => PCout
        );

   clk_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
      reset <= '1';
		address <= X"00000000";
      wait for 20 ns;
		reset <= '0';
		address <= X"00000000";
      wait for 20 ns;
		reset <= '1';
		address <= X"00000001";
      wait for 20 ns;
		reset <= '0';
		address <= X"00000001";
      wait for 20 ns;
		reset <= '1';
		address <= X"00000010";
      wait for 20 ns;
		reset <= '0';
		address <= X"00000010";
      wait for 20 ns;	
   end process;

END;
