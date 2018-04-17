LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_procesador IS
END TB_procesador;
 
ARCHITECTURE behavior OF TB_procesador IS 
 
    COMPONENT procesador
    PORT(
         reset : IN  std_logic;
         clock : IN  std_logic;
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal reset : std_logic := '0';
   signal clock : std_logic := '0';

   signal result : std_logic_vector(31 downto 0);

   constant clock_period : time := 10 ns;
 
BEGIN

   uut: procesador PORT MAP (
          reset => reset,
          clock => clock,
          result => result
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
      wait for 5 ns;
		reset <= '0';
		wait for 200 ns;
   end process;

END;
