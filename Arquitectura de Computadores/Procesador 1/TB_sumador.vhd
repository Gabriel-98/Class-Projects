LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_sumador IS
END TB_sumador;
 
ARCHITECTURE behavior OF TB_sumador IS 
 
    COMPONENT sumador
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         C : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');

   signal C : std_logic_vector(31 downto 0);
 
BEGIN

   uut: sumador PORT MAP (
          A => A,
          B => B,
          C => C
        );

   stim_proc: process
   begin		
      A <= "00000000000000000000000000000000";
		B <= "00000001101110000001110000000001";
      wait for 20 ns;
		A <= "00011100001100011010111010011100";
		B <= "01111001101001111000111000000000";
      wait for 20 ns;
		A <= "00011111100000111110000011111110";
		B <= "00000111110000000111100011111110";
      wait for 20 ns;
		A <= "00011110010100011001110011111001";
		B <= "00100111101011000000000000000011";
      wait for 20 ns;	
   end process;

END;
