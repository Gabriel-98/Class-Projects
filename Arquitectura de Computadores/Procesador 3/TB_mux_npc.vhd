LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_mux_npc IS
END TB_mux_npc;
 
ARCHITECTURE behavior OF TB_mux_npc IS 
 
    COMPONENT mux_npc
    PORT(
         pc_call : IN  std_logic_vector(31 downto 0);
         pc_branch : IN  std_logic_vector(31 downto 0);
         pc : IN  std_logic_vector(31 downto 0);
         result_alu : IN  std_logic_vector(31 downto 0);
         pcsource : IN  std_logic_vector(1 downto 0);
         npc : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal pc_call : std_logic_vector(31 downto 0) := (others => '0');
   signal pc_branch : std_logic_vector(31 downto 0) := (others => '0');
   signal pc : std_logic_vector(31 downto 0) := (others => '0');
   signal result_alu : std_logic_vector(31 downto 0) := (others => '0');
   signal pcsource : std_logic_vector(1 downto 0) := (others => '0');

   signal npc : std_logic_vector(31 downto 0);
 
BEGIN

   uut: mux_npc PORT MAP (
          pc_call => pc_call,
          pc_branch => pc_branch,
          pc => pc,
          result_alu => result_alu,
          pcsource => pcsource,
          npc => npc
        );

   stim_proc: process
   begin	
		pc_call <= X"00000005";
		pc_branch <= X"0000000A";
		result_alu <= X"0000000F";
		pc <= X"00000014";
		pcsource <= "00";
      wait for 20 ns;
		pcsource <= "01";
      wait for 20 ns;
		pcsource <= "10";
      wait for 20 ns;
		pcsource <= "11";
      wait for 20 ns;
   end process;

END;
