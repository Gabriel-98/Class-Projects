LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Latch_SR_AA IS
END TB_Latch_SR_AA;
 
ARCHITECTURE behavior OF TB_Latch_SR_AA IS 
 
    COMPONENT Latch_SR_AA
    PORT(
         S : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    
   signal S : std_logic := '0';
   signal R : std_logic := '0';

   signal Q : std_logic;
   signal Qn : std_logic;
 
BEGIN
 
   uut: Latch_SR_AA PORT MAP (
          S => S,
          R => R,
          Q => Q,
          Qn => Qn
        );

   stim_proc: process
   begin
		S <= '0';		
		R <= '0';
      wait for 100 ns;
		S <= '0';	
		R <= '1';
      wait for 100 ns;
		S <= '1';		
		R <= '0';
      wait for 100 ns;
		S <= '1';		
		R <= '1';
      wait for 100 ns;
   end process;

END;
