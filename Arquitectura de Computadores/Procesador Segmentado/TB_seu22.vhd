LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_seu22 IS
END TB_seu22;
 
ARCHITECTURE behavior OF TB_seu22 IS 
 
    COMPONENT seu22
    PORT(
         sinm22 : IN  std_logic_vector(21 downto 0);
         sinm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal sinm22 : std_logic_vector(21 downto 0) := (others => '0');

   signal sinm32 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: seu22 PORT MAP (
          sinm22 => sinm22,
          sinm32 => sinm32
        );

   stim_proc: process
   begin		
      sinm22 <= "0000000000000000000000";
      wait for 20 ns;
		sinm22 <= "0001010111011011010101";
		wait for 20 ns;
		sinm22 <= "1111100100010111010001";
		wait for 20 ns;
		sinm22 <= "1000011101110000101000";
		wait for 20 ns;
   end process;

END;
