LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_mux_dwr IS
END TB_mux_dwr;
 
ARCHITECTURE behavior OF TB_mux_dwr IS 

    COMPONENT mux_dwr
    PORT(
         datatomem : IN  std_logic_vector(31 downto 0);
         result_alu : IN  std_logic_vector(31 downto 0);
         pc : IN  std_logic_vector(31 downto 0);
         rfsource : IN  std_logic_vector(1 downto 0);
         datatoreg : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal datatomem : std_logic_vector(31 downto 0) := (others => '0');
   signal result_alu : std_logic_vector(31 downto 0) := (others => '0');
   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal rfsource : std_logic_vector(1 downto 0) := (others => '0');

   signal datatoreg : std_logic_vector(31 downto 0);
 
BEGIN

   uut: mux_dwr PORT MAP (
          datatomem => datatomem,
          result_alu => result_alu,
          pc => pc,
          rfsource => rfsource,
          datatoreg => datatoreg
        );

   stim_proc: process
   begin		
		pc <= X"0000000F";
      datatomem <= X"00000014";
		result_alu <= X"00000019";
		rfsource <= "00";
      wait for 20 ns;	
		rfsource <= "01";
		wait for 20 ns;
		rfsource <= "10";
		wait for 20 ns;
		rfsource <= "11";
		wait for 20 ns;
   end process;

END;
