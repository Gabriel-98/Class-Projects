LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_mux_2a1_8 IS
END TB_mux_2a1_8;
 
ARCHITECTURE behavior OF TB_mux_2a1_8 IS 

    COMPONENT mux_2a1_8
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         S : IN  std_logic;
         Z : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal S : std_logic := '0';
   signal Z : std_logic_vector(7 downto 0);

BEGIN
   uut: mux_2a1_8 PORT MAP (
          A => A,
          B => B,
          S => S,
          Z => Z
        );

   stim_proc: process
   begin
		A <= "01101110";
		B <= "01010011";
		S <= '0';
      wait for 20 ns;
		A <= "01101110";
		B <= "01010011";
		S <= '1';
      wait for 20 ns;
		A <= "01000010";
		B <= "00111101";
		S <= '0';
      wait for 20 ns;
		A <= "01000010";
		B <= "00111101";
		S <= '1';
      wait for 20 ns;
		A <= "01111111";
		B <= "00100101";
		S <= '0';
      wait for 20 ns;
		A <= "01111111";
		B <= "00100101";
		S <= '1';
      wait for 20 ns;
   end process;

END;
