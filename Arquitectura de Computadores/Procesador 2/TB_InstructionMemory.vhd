LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_InstructionMemory IS
END TB_InstructionMemory;
 
ARCHITECTURE behavior OF TB_InstructionMemory IS 
 
    COMPONENT InstructionMemory
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

   signal outInstruction : std_logic_vector(31 downto 0);
 
BEGIN

   uut: InstructionMemory PORT MAP (
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

   stim_proc: process
   begin		
      reset <= '1';
		address <= X"00000000";
      wait for 20 ns;
		reset <= '0';
		address <= X"00000000";
		wait for 20 ns;
		address <= X"00000001";
		wait for 20 ns;
		address <= X"00000002";
		wait for 20 ns;
		address <= X"00000003";
		wait for 20 ns;
   end process;

END;
