LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_mux_nrd IS
END TB_mux_nrd;
 
ARCHITECTURE behavior OF TB_mux_nrd IS 
 
    COMPONENT mux_nrd
    PORT(
         rd : IN  std_logic_vector(5 downto 0);
         ro7 : IN  std_logic_vector(5 downto 0);
         rfdest : IN  std_logic;
         nrd : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;

   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal ro7 : std_logic_vector(5 downto 0) := (others => '0');
   signal rfdest : std_logic := '0';

   signal nrd : std_logic_vector(5 downto 0);
 
BEGIN

   uut: mux_nrd PORT MAP (
          rd => rd,
          ro7 => ro7,
          rfdest => rfdest,
          nrd => nrd
        );

   stim_proc: process
   begin	
		rd <= "010000";
		ro7 <= "001111";
		rfdest <= '0';
      wait for 20 ns;
		rfdest <= '1';
		wait for 20 ns;
		rd <= "010000";
		ro7 <= "011111";
		rfdest <= '0';
      wait for 20 ns;
		rfdest <= '1';
		wait for 20 ns;
   end process;

END;
