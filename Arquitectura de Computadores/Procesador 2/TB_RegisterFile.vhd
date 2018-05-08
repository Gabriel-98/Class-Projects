LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_RegisterFile IS
END TB_RegisterFile;
 
ARCHITECTURE behavior OF TB_RegisterFile IS 

    COMPONENT RegisterFile
    PORT(
         rs1 : IN  std_logic_vector(5 downto 0);
         rs2 : IN  std_logic_vector(5 downto 0);
         rd : IN  std_logic_vector(5 downto 0);
         dwr : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
 
BEGIN

   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
          reset => reset,
          crs1 => crs1,
          crs2 => crs2
        );

   stim_proc: process
   begin
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		rs1 <= "000001";
		rs2 <= "000001";
		rd <= "000000";
		dwr <= X"00AF0120";
		wait for 20 ns;
		rs1 <= "000000";
		rs2 <= "000000";
		rd <= "000001";
		wait for 20 ns;
		rs1 <= "000001";
		rs2 <= "000001";
		rd <= "000000";
		wait for 20 ns;
		rs1 <= "000000";
		rs2 <= "000000";
		rd <= "000001";
		wait for 20 ns;
		rs1 <= "000001";
		rs2 <= "000001";
		rd <= "000000";
		wait for 20 ns;
		rs1 <= "000001";
		rs2 <= "000001";
		rd <= "000010";
		wait for 20 ns;
		rs1 <= "000010";
		rs2 <= "000010";
		rd <= "000100";
		wait for 20 ns;
		rs1 <= "000100";
		rs2 <= "000100";
		rd <= "001100";
		wait for 20 ns;
		rs1 <= "001100";
		rs2 <= "001100";
		rd <= "010100";
		wait for 20 ns;
		rs1 <= "010100";
		rs2 <= "010100";
		rd <= "011000";
		wait for 20 ns;
		rs1 <= "011000";
		rs2 <= "011000";
		rd <= "100111";
		wait for 20 ns;
		rs1 <= "100111";
		rs2 <= "100111";
		rd <= "000000";
		wait for 20 ns;
		rs1 <= "000000";
		rs2 <= "000000";
		rd <= "000000";
		wait for 20 ns;
   end process;

END;
