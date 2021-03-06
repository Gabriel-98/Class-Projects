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
			wren : IN  std_logic;
         reset : IN  std_logic;
         crs1 : OUT  std_logic_vector(31 downto 0);
         crs2 : OUT  std_logic_vector(31 downto 0);
			crd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;

   signal rs1 : std_logic_vector(5 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(5 downto 0) := (others => '0');
   signal rd : std_logic_vector(5 downto 0) := (others => '0');
   signal dwr : std_logic_vector(31 downto 0) := (others => '0');
	signal wren : std_logic := '0';
   signal reset : std_logic := '0';

   signal crs1 : std_logic_vector(31 downto 0);
   signal crs2 : std_logic_vector(31 downto 0);
	signal crd : std_logic_vector(31 downto 0);
 
BEGIN

   uut: RegisterFile PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          dwr => dwr,
			 wren => wren,
          reset => reset,
          crs1 => crs1,
          crs2 => crs2,
			 crd => crd
        );

   stim_proc: process
   begin
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		wren <= '1';
		rd <= "010000";
		rs1 <= "000000";
		rs2 <= "000000";
		dwr <= X"00000005";
		wait for 20 ns;
		rd <= "000000";
		rs1 <= "010000";
		rs2 <= "010000";
		dwr <= X"00000000";
		wait for 20 ns;
		wren <= '0';
		rd <= "010000";
		rs1 <= "000000";
		rs2 <= "000000";
		dwr <= X"00000006";
		wait for 20 ns;
		wren <= '1';
		rd <= "000000";
		rs1 <= "010000";
		rs2 <= "010000";
		dwr <= X"00000000";
		wait for 20 ns;
		wren <= '1';
		rd <= "010010";
		rs1 <= "000000";
		rs2 <= "000000";
		dwr <= X"00000007";
		wait for 20 ns;
		rd <= "000000";
		rs1 <= "010010";
		rs2 <= "010010";
		dwr <= X"00000000";
		wait for 20 ns;
		wren <= '0';
		rd <= "010011";
		rs1 <= "000000";
		rs2 <= "000000";
		dwr <= X"00000008";
		wait for 20 ns;
		rd <= "000000";
		rs1 <= "010011";
		rs2 <= "010011";
		dwr <= X"00000000";
		wait for 20 ns;
		--
		reset <= '1';
		wait for 20 ns;
		reset <= '0';
		wren <= '1';
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
