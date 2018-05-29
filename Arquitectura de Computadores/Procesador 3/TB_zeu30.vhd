LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_zeu30 IS
END TB_zeu30;
 
ARCHITECTURE behavior OF TB_zeu30 IS 
 
    COMPONENT zeu30
    PORT(
         inm30 : IN  std_logic_vector(29 downto 0);
         inm32 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal inm30 : std_logic_vector(29 downto 0) := (others => '0');

   signal inm32 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: zeu30 PORT MAP (
          inm30 => inm30,
          inm32 => inm32
        );

   stim_proc: process
   begin
		inm30 <= "000000000000000000000000000000";
      wait for 20 ns;	
		inm30 <= "000100101010111010101010101010";
		wait for 20 ns;
		inm30 <= "111100001101000001101011111001";
		wait for 20 ns;
		inm30 <= "100001000100000001111000011001";
		wait for 20 ns;
   end process;

END;
