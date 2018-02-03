LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Latch_SR_AB_En_AB IS
END TB_Latch_SR_AB_En_AB;
 
ARCHITECTURE behavior OF TB_Latch_SR_AB_En_AB IS 

    COMPONENT Latch_SR_AB_En_AB
    PORT(
         Sn : IN  std_logic;
         Rn : IN  std_logic;
         Enn : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    
	signal Sn : std_logic := '0';
   signal Rn : std_logic := '0';
   signal Enn : std_logic := '0';

   signal Q : std_logic;
   signal Qn : std_logic;

BEGIN
 
   uut: Latch_SR_AB_En_AB PORT MAP (
          Sn => Sn,
          Rn => Rn,
          Enn => Enn,
          Q => Q,
          Qn => Qn
        );

   stim_proc: process
   begin		
		Enn <= '0';
      Sn <= '0';
		Rn <= '0';
      wait for 100 ns;
		Enn <= '0';
      Sn <= '0';
		Rn <= '1';
      wait for 100 ns;	
		Enn <= '0';
      Sn <= '1';
		Rn <= '0';
      wait for 100 ns;	
		Enn <= '0';
      Sn <= '1';
		Rn <= '1';
      wait for 100 ns;
		Enn <= '1';
      Sn <= '0';
		Rn <= '0';
      wait for 100 ns;
		Enn <= '1';
      Sn <= '0';
		Rn <= '1';
      wait for 100 ns;	
		Enn <= '1';
      Sn <= '1';
		Rn <= '0';
      wait for 100 ns;	
		Enn <= '1';
      Sn <= '1';
		Rn <= '1';
		wait for 100 ns;
   end process;

END;
