LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_Latch_SR_AB_En_AA IS
END TB_Latch_SR_AB_En_AA;
 
ARCHITECTURE behavior OF TB_Latch_SR_AB_En_AA IS 
 
    COMPONENT Latch_SR_AB_En_AA
    PORT(
         Sn : IN  std_logic;
         Rn : IN  std_logic;
         En : IN  std_logic;
         Q : OUT  std_logic;
         Qn : OUT  std_logic
        );
    END COMPONENT;
    
   signal Sn : std_logic := '0';
   signal Rn : std_logic := '0';
   signal En : std_logic := '0';
	
   signal Q : std_logic;
   signal Qn : std_logic;
  
BEGIN

   uut: Latch_SR_AB_En_AA PORT MAP (
          Sn => Sn,
          Rn => Rn,
          En => En,
          Q => Q,
          Qn => Qn
        );

   stim_proc: process
   begin		
      En <= '0';
      Sn <= '0';
		Rn <= '0';
      wait for 100 ns;
		En <= '0';
      Sn <= '0';
		Rn <= '1';
      wait for 100 ns;	
		En <= '0';
      Sn <= '1';
		Rn <= '0';
      wait for 100 ns;	
		En <= '0';
      Sn <= '1';
		Rn <= '1';
      wait for 100 ns;
		En <= '1';
      Sn <= '0';
		Rn <= '0';
      wait for 100 ns;
		En <= '1';
      Sn <= '0';
		Rn <= '1';
      wait for 100 ns;	
		En <= '1';
      Sn <= '1';
		Rn <= '0';
      wait for 100 ns;	
		En <= '1';
      Sn <= '1';
		Rn <= '1';
		wait for 100 ns;
   end process;

END;
