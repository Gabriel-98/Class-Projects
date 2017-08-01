LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_minialu IS
END TB_minialu;
 
ARCHITECTURE behavior OF TB_minialu IS 
 
    COMPONENT minialu
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         C : IN  std_logic_vector(7 downto 0);
         Sc1 : IN  std_logic;
         Sc0 : IN  std_logic;
         Cout : OUT  std_logic;
         S : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal C : std_logic_vector(7 downto 0) := (others => '0');
   signal Sc1 : std_logic := '0';
   signal Sc0 : std_logic := '0';
   signal Cout : std_logic;
   signal S : std_logic_vector(7 downto 0);
 
BEGIN
   uut: minialu PORT MAP (
          A => A,
          B => B,
          C => C,
          Sc1 => Sc1,
          Sc0 => Sc0,
          Cout => Cout,
          S => S
        );

   stim_proc: process
   begin
		A <= "00010101";
		B <= "00001000";
		C <= "00111010";
		Sc1 <= '0';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '0';
		Sc0 <= '1';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '1';
      wait for 20 ns;
		
		A <= "00010010";
		B <= "00101001";
		C <= "01000101";
		Sc1 <= '0';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '0';
		Sc0 <= '1';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '1';
      wait for 20 ns;
		
		A <= "01010000";
		B <= "00100100";
		C <= "00010101";
		Sc1 <= '0';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '0';
		Sc0 <= '1';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '1';
      wait for 20 ns;
		
		A <= "00110011";
		B <= "00101111";
		C <= "00010111";
		Sc1 <= '0';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '0';
		Sc0 <= '1';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '0';
      wait for 20 ns;
		Sc1 <= '1';
		Sc0 <= '1';
      wait for 20 ns;	
   end process;

END;
