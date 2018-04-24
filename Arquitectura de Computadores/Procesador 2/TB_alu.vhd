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
		op <= "000001";		-- and
      wait for 20 ns;
		op <= "000101";  		-- andn
      wait for 20 ns;
		op <= "000010";		-- or
      wait for 20 ns;
		op <= "000110";  		-- orn
      wait for 20 ns;
		op <= "000011";  		-- xor
      wait for 20 ns;
		op <= "000111";  		-- xnor
      wait for 20 ns;
		op <= "000000";  		-- add
      wait for 20 ns;
		op <= "000100";  		-- sub
      wait for 20 ns;
		A <= X"00000005";
		B <= X"00000002";
		op <= "100101";  		-- sll
      wait for 20 ns;
		op <= "100110";  		-- srl
      wait for 20 ns;
		A <= X"00000CA2";
		B <= X"0000000A";
		op <= "100101";  		-- sll
      wait for 20 ns;
		op <= "100110";  		-- srl
      wait for 20 ns;
		A <= X"00000001";
		B <= X"0000001F";
		op <= "100101";  		-- sll
      wait for 20 ns;
		op <= "100110";  		-- srl
      wait for 20 ns;
   end process;

END;
