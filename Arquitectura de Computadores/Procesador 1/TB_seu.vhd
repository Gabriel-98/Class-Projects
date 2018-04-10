LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_seu IS
END TB_seu;
 
ARCHITECTURE behavior OF TB_seu IS 
 
    COMPONENT seu
    PORT(
         sinm13 : IN  std_logic_vector(12 downto 0);
         sinm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal sinm13 : std_logic_vector(12 downto 0) := (others => '0');

   signal sinm32 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: seu PORT MAP (
          sinm13 => sinm13,
          sinm32 => sinm32
        );

   stim_proc: process
   begin		
		sinm13 <= "0000000000000";
      wait for 100 ns;
		sinm13 <= "1111111111111";
      wait for 100 ns;
		sinm13 <= "1101100001110";
      wait for 100 ns;
		sinm13 <= "0001110001111";
      wait for 100 ns;
		sinm13 <= "1000000000000";
      wait for 100 ns;
		sinm13 <= "0111111111111";
      wait for 100 ns;
   end process;

END;
