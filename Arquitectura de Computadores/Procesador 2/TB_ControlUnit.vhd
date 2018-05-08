LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_ControlUnit IS
END TB_ControlUnit;
 
ARCHITECTURE behavior OF TB_ControlUnit IS 
 
    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         op_alu : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;

   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

   signal op_alu : std_logic_vector(5 downto 0);
 
BEGIN

   uut: ControlUnit PORT MAP (
          op => op,
          op3 => op3,
          op_alu => op_alu
        );

   stim_proc: process
   begin		
      op <= "10";
		op3 <= "000001";
      wait for 20 ns;
		op3 <= "000101";
      wait for 20 ns;
		op3 <= "000010";
      wait for 20 ns;
		op3 <= "000110";
      wait for 20 ns;
		op3 <= "000011";
      wait for 20 ns;
		op3 <= "000111";
      wait for 20 ns;
		op3 <= "000000";
      wait for 20 ns;
		op3 <= "000100";
      wait for 20 ns;
		op3 <= "100101";
      wait for 20 ns;
		op3 <= "100110";
      wait for 20 ns;
		op3 <= "111100";
		wait for 20 ns;
		op3 <= "111101";
		wait for 20 ns;
   end process;

END;
