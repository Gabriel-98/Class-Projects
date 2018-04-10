LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_ProgramCounter IS
END TB_ProgramCounter;
 
ARCHITECTURE behavior OF TB_ProgramCounter IS 
 
    COMPONENT ProgramCounter
    PORT(
         addr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         clk : IN  std_logic;
         PCout : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal addr : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

   signal PCout : std_logic_vector(31 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: ProgramCounter PORT MAP (
          addr => addr,
          rst => rst,
          clk => clk,
          PCout => PCout
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin		
      rst <= '0';
		addr <= X"00000000";
      wait for 10 ns;
		rst <= '1';
		addr <= X"00000000";
      wait for 10 ns;
		rst <= '0';
		addr <= X"00000001";
      wait for 10 ns;
		rst <= '1';
		addr <= X"00000001";
      wait for 10 ns;
		rst <= '0';
		addr <= X"00000010";
      wait for 10 ns;
		rst <= '1';
		addr <= X"00000010";
      wait for 10 ns;	
   end process;

END;
