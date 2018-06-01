LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_windows_manager IS
END TB_windows_manager;
 
ARCHITECTURE behavior OF TB_windows_manager IS 
 
    COMPONENT windows_manager
    PORT(
         cwp : IN  std_logic_vector(0 downto 0);
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic_vector(0 downto 0);
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0);
         nrd : OUT  std_logic_vector(5 downto 0);
			ro7 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    
   signal cwp : std_logic_vector(0 downto 0) := (others => '0');
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

   signal ncwp : std_logic_vector(0 downto 0);
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   signal nrd : std_logic_vector(5 downto 0);
	signal ro7 : std_logic_vector(5 downto 0);
 
BEGIN

   uut: windows_manager PORT MAP (
          cwp => cwp,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          op => op,
          op3 => op3,
          ncwp => ncwp,
          nrs1 => nrs1,
          nrs2 => nrs2,
          nrd => nrd,
			 ro7 => ro7
        );

   stim_proc: process
   begin
		cwp <= "0";
		rs1 <= "00000";
		rs2 <= "10000";
		rd <= "11111";
		op <= "10";
		op3 <= "111101";		-- RESTORE
		wait for 20 ns;
		cwp <= "1";
		rs1 <= "00000";
		rs2 <= "10000";
		rd <= "11111";
		op <= "10";
		op3 <= "111101";		-- RESTORE
		wait for 20 ns;
		cwp <= "0";
		rs1 <= "00000";
		rs2 <= "10000";
		rd <= "11111";
		op <= "10";
		op3 <= "111100";		-- SAVE
		wait for 20 ns;
		cwp <= "1";
		rs1 <= "00000";
		rs2 <= "10000";
		rd <= "11111";
		op <= "10";
		op3 <= "111100";		-- SAVE
		wait for 20 ns;
		
		cwp <= "0";
		rs1 <= "00000";
		rs2 <= "00100";
		rd <= "00111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		cwp <= "0";
		rs1 <= "01000";
		rs2 <= "01101";
		rd <= "01111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		cwp <= "0";
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "10111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		cwp <= "0";
		rs1 <= "11000";
		rs2 <= "11001";
		rd <= "11111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		
		cwp <= "1";
		rs1 <= "00000";
		rs2 <= "00100";
		rd <= "00111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		cwp <= "1";
		rs1 <= "01000";
		rs2 <= "01101";
		rd <= "01111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		cwp <= "1";
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "10111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
		cwp <= "1";
		rs1 <= "11000";
		rs2 <= "11001";
		rd <= "11111";
		op <= "10";
		op3 <= "000000";
      wait for 20 ns;
   end process;

END;
