LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_DataMemory IS
END TB_DataMemory;
 
ARCHITECTURE behavior OF TB_DataMemory IS 
 
    COMPONENT DataMemory
    PORT(
         result_alu : IN  std_logic_vector(31 downto 0);
         crd : IN  std_logic_vector(31 downto 0);
         wrenmem : IN  std_logic;
         rdenmem : IN  std_logic;
         reset : IN  std_logic;
         datatomem : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal result_alu : std_logic_vector(31 downto 0) := (others => '0');
   signal crd : std_logic_vector(31 downto 0) := (others => '0');
   signal wrenmem : std_logic := '0';
   signal rdenmem : std_logic := '0';
   signal reset : std_logic := '0';

   signal datatomem : std_logic_vector(31 downto 0);
 
BEGIN

   uut: DataMemory PORT MAP (
          result_alu => result_alu,
          crd => crd,
          wrenmem => wrenmem,
          rdenmem => rdenmem,
          reset => reset,
          datatomem => datatomem
        );

   stim_proc: process
   begin	
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		crd <= X"00102001";
      result_alu <= X"00000000";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"00000001";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;	
		result_alu <= X"00000002";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;	
		result_alu <= X"00000003";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"0000001D";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"0000001E";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"0000001F";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"00000000";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;
		result_alu <= X"00000001";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;	
		result_alu <= X"00000002";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;	
		result_alu <= X"00000003";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;
		result_alu <= X"0000001D";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;
		result_alu <= X"0000001E";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;
		result_alu <= X"0000001F";
		wrenmem <= '1';
		rdenmem <= '0';
      wait for 20 ns;
		result_alu <= X"00000000";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"00000001";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;	
		result_alu <= X"00000002";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;	
		result_alu <= X"00000003";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"0000001D";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"0000001E";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
		result_alu <= X"0000001F";
		wrenmem <= '0';
		rdenmem <= '1';
      wait for 20 ns;
   end process;

END;
