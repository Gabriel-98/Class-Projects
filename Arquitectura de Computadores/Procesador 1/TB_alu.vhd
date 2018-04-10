LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_alu IS
END TB_alu;
 
ARCHITECTURE behavior OF TB_alu IS 
 
    COMPONENT alu
    PORT(
         A : IN  std_logic_vector(31 downto 0);
         B : IN  std_logic_vector(31 downto 0);
         op : IN  std_logic_vector(5 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(31 downto 0) := (others => '0');
   signal B : std_logic_vector(31 downto 0) := (others => '0');
   signal op : std_logic_vector(5 downto 0) := (others => '0');

   signal result : std_logic_vector(31 downto 0);
 
BEGIN

   uut: alu PORT MAP (
          A => A,
          B => B,
          op => op,
          result => result
        );

   stim_proc: process
   begin		
      A <= X"000AF00A";
		B <= X"0000608F";
		op <= "000001";  
      wait for 20 ns;
		A <= X"000AF00A";
		B <= X"0000608F";
		op <= "000010";  
      wait for 20 ns;
		A <= X"000AF00A";
		B <= X"0000608F";
		op <= "000011";  
      wait for 20 ns;
		A <= X"000AF00A";
		B <= X"0000608F";
		op <= "000000";  
      wait for 20 ns;
		A <= X"000AF00A";
		B <= X"0000608F";
		op <= "000100";  
      wait for 20 ns;
		
   end process;

END;