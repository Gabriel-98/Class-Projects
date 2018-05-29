LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_mux_op2 IS
END TB_mux_op2;
 
ARCHITECTURE behavior OF TB_mux_op2 IS 
 
    COMPONENT mux_op2
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         i : IN  std_logic;
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    
   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

   signal result : std_logic_vector(31 downto 0);
 
BEGIN

   uut: mux_op2 PORT MAP (
          A => A,
          B => B,
          i => i,
          result => result
        );

   stim_proc: process
   begin		
      A <= X"00000000";
		B <= X"0AF05102";
		i <= '0';
      wait for 20 ns;
		A <= X"00000000";
		B <= X"0AF05102";
		i <= '1';
      wait for 20 ns;
		A <= X"00043F2A";
		B <= X"01111111";
		i <= '0';
      wait for 20 ns;
		A <= X"00043F2A";
		B <= X"01111111";
		i <= '1';
      wait for 20 ns;
		A <= X"110001AF";
		B <= X"0234AFC1";
		i <= '0';
      wait for 20 ns;
		A <= X"110001AF";
		B <= X"0234AFC1";
		i <= '1';
      wait for 20 ns;
   end process;

END;