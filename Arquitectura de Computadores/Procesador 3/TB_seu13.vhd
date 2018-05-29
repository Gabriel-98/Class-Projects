LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_seu13 IS
END TB_seu13;
 
ARCHITECTURE behavior OF TB_seu13 IS 

    COMPONENT seu13
    PORT(
         sinm13 : IN  std_logic_vector(12 downto 0);
         sinm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal sinm13 : std_logic_vector(12 downto 0) := (others => '0');

   signal sinm32 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: seu13 PORT MAP (
          sinm13 => sinm13,
          sinm32 => sinm32
        );

   stim_proc: process
   begin		
      sinm13 <= "0000000000000";
      wait for 20 ns;
		sinm13 <= "0010010001110";
		wait for 20 ns;
		sinm13 <= "1111001001110";
		wait for 20 ns;
		sinm13 <= "1000101101101";
		wait for 20 ns;
   end process;

END;
