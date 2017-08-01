LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY TB_restador_8 IS
END TB_restador_8;
 
ARCHITECTURE behavior OF TB_restador_8 IS 

    COMPONENT restador_8
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
   uut: restador_8 PORT MAP (
          A => A,
          B => B,
          Cout => Cout,
          S => S
        );
		  
   stim_proc: process
   begin		
      A <= "00101110";
		B <= "00011101";
      wait for 20 ns;
		A <= "01100110";
		B <= "00010011";
      wait for 20 ns;
		A <= "00000010";
		B <= "01111101";
      wait for 20 ns;
		A <= "00111000";
		B <= "00111000";
      wait for 20 ns;
		A <= "01010000";
		B <= "00001010";
      wait for 20 ns;
   end process;

END;
