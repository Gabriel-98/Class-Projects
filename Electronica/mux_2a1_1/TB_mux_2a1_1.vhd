LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_mux_2a1_1 IS
END TB_mux_2a1_1;
 
ARCHITECTURE behavior OF TB_mux_2a1_1 IS 
 
    COMPONENT mux_2a1_1
    PORT(
         I0 : IN  std_logic;
         I1 : IN  std_logic;
         S : IN  std_logic;
         Z : OUT  std_logic
        );
    END COMPONENT;

   signal I0 : std_logic := '0';
   signal I1 : std_logic := '0';
   signal S : std_logic := '0';
   signal Z : std_logic;
 
BEGIN
   uut: mux_2a1_1 PORT MAP (
          I0 => I0,
          I1 => I1,
          S => S,
          Z => Z
        );

   stim_proc: process
   begin	
		I0 <= '0';
		I1 <= '0';
      S <= '0';
      wait for 20 ns;
		I0 <= '0';
		I1 <= '0';
		S <= '1';
      wait for 20 ns;
		I0 <= '0';
		I1 <= '1';
      S <= '0';
      wait for 20 ns;
		I0 <= '0';
		I1 <= '1';
		S <= '1';
      wait for 20 ns;
		I0 <= '1';
		I1 <= '0';
      S <= '0';
      wait for 20 ns;
		I0 <= '1';
		I1 <= '0';
		S <= '1';
      wait for 20 ns;
		I0 <= '1';
		I1 <= '1';
      S <= '0';
      wait for 20 ns;
		I0 <= '1';
		I1 <= '1';
		S <= '1';
      wait for 20 ns;
   end process;

END;
