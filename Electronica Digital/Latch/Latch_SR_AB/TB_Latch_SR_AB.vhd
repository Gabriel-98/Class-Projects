LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Latch_SR_AB IS
END TB_Latch_SR_AB;
 
ARCHITECTURE behavior OF TB_Latch_SR_AB IS 

    COMPONENT Latch_SR_AB
    PORT(
         Sn : IN  std_logic;
         Rn : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    
   signal Sn : std_logic := '0';
   signal Rn : std_logic := '0';

   signal Q : std_logic;
   signal Qn : std_logic;
 
BEGIN

   uut: Latch_SR_AB PORT MAP (
          Sn => Sn,
          Rn => Rn,
          Q => Q,
          Qn => Qn
        ); 

   stim_proc: process
   begin		
      Sn <= '0';		
		Rn <= '0';
      wait for 100 ns;
		Sn <= '0';	
		Rn <= '1';
      wait for 100 ns;
		Sn <= '1';		
		Rn <= '0';
      wait for 100 ns;
		Sn <= '1';		
		Rn <= '1';
      wait for 100 ns;
   end process;

END;
