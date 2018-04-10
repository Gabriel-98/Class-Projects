LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Datapath IS
END TB_Datapath;
 
ARCHITECTURE behavior OF TB_Datapath IS 
 
    COMPONENT Datapath
    PORT(
         rst : IN  std_logic;
         clk : IN  std_logic;
         addr : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

   signal addr : std_logic_vector(31 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: Datapath PORT MAP (
          rst => rst,
          clk => clk,
          addr => addr
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
		rst <= '1';
      wait for 10 ns;
		rst <= '0';
		wait for 200 ns;
   end process;

END;
