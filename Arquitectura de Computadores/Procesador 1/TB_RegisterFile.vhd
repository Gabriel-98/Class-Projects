LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_RegisterFile IS
END TB_RegisterFile;
 
ARCHITECTURE behavior OF TB_RegisterFile IS 

    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         rst : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
   signal rst : std_logic := '0';

   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          rst => rst,
          crs1 => crs1,
          crs2 => crs2
        );

   stim_proc: process
   begin
		rst <= '1';
		wait for 20 ns;
		rst <= '0';
		rs1 <= "00001";
		rs2 <= "00001";
		rd <= "00000";
		dwr <= X"00AF0120";
		wait for 20 ns;
		rs1 <= "00000";
		rs2 <= "00000";
		rd <= "00001";
		wait for 20 ns;
		rs1 <= "00001";
		rs2 <= "00001";
		rd <= "00000";
		wait for 20 ns;
		rs1 <= "00000";
		rs2 <= "00000";
		rd <= "00001";
		wait for 20 ns;
		rs1 <= "00001";
		rs2 <= "00001";
		rd <= "00000";
		wait for 20 ns;
   end process;

END;
