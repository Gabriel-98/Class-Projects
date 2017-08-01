LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_sumador_completo IS
END TB_sumador_completo;
 
ARCHITECTURE behavior OF TB_sumador_completo IS 
 
    COMPONENT sumador_completo
    PORT(
         A : IN  std_logic;
         B : IN  std_logic;
         C : IN  std_logic;
         Cout : OUT  std_logic;
         S : OUT  std_logic
        );
    END COMPONENT;
    
   signal A : std_logic := '0';
   signal B : std_logic := '0';
   signal C : std_logic := '0';
   signal Cout : std_logic;
   signal S : std_logic;
 
BEGIN
   uut: sumador_completo PORT MAP (
          A => A,
          B => B,
          C => C,
          Cout => Cout,
          S => S
        );

   stim_proc: process
   begin
		A <= '0';
		B <= '0';
		C <= '0';
      wait for 20 ns;
		A <= '0';
		B <= '0';
		C <= '1';
      wait for 20 ns;
		A <= '0';
		B <= '1';
		C <= '0';
      wait for 20 ns;
		A <= '0';
		B <= '1';
		C <= '1';
      wait for 20 ns;
		A <= '1';
		B <= '0';
		C <= '0';
      wait for 20 ns;
		A <= '1';
		B <= '0';
		C <= '1';
      wait for 20 ns;
		A <= '1';
		B <= '1';
		C <= '0';
      wait for 20 ns;
		A <= '1';
		B <= '1';
		C <= '1';
      wait for 20 ns;
   end process;

END;
