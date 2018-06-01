LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_seu30 IS
END TB_seu30;
 
ARCHITECTURE behavior OF TB_seu30 IS 
 
    COMPONENT seu30
    PORT(
         sinm30 : IN  std_logic_vector(29 downto 0);
         sinm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal sinm30 : std_logic_vector(29 downto 0) := (others => '0');

   signal sinm32 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: seu30 PORT MAP (
          sinm30 => sinm30,
          sinm32 => sinm32
        );

   stim_proc: process
   begin		
      sinm30 <= "000000000000000000000000000000";
      wait for 20 ns;
		sinm30 <= "000100001000011110100111000001";
		wait for 20 ns;
		sinm30 <= "111110010111110001111111010010";
		wait for 20 ns;
		sinm30 <= "100000010001000000000111000100";
		wait for 20 ns;
   end process;

END;
