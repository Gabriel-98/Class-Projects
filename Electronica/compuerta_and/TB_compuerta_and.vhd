LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_compuerta_and IS
END TB_compuerta_and;
 
ARCHITECTURE behavior OF TB_compuerta_and IS 
 
    COMPONENT compuerta_and
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;

   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal S : std_logic;
 
BEGIN
   uut: compuerta_and PORT MAP (
          A => A,
          B => B,
          S => S
        );

   stim_proc: process
   begin		
		A <= '0';
		B <= '0';
      wait for 20 ns;	
		A <= '0';
		B <= '1';
      wait for 20 ns;
		A <= '1';
		B <= '0';
      wait for 20 ns;
		A <= '1';
		B <= '1';
      wait for 20 ns;
   end process;

END;
