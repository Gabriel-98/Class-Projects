LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_sumador_8 IS
END TB_sumador_8;
 
ARCHITECTURE behavior OF TB_sumador_8 IS 

    COMPONENT sumador_8
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Cout : std_logic;
   signal S : std_logic_vector(7 downto 0);

BEGIN
   uut: sumador_8 PORT MAP (
          A => A,
          B => B,
          Cout => Cout,
          S => S
        );

   stim_proc: process
   begin		
      A <= "00110111";
		B <= "00010111";
      wait for 20 ns;
		A <= "00111000";
		B <= "00001001";
      wait for 20 ns;
		A <= "00111111";
		B <= "00110011";
      wait for 20 ns;
		A <= "00100001";
		B <= "00001011";
      wait for 20 ns;
		A <= "00100000";
		B <= "00011101";
      wait for 20 ns;
   end process;

END;
