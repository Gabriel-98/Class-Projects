LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_psr_modifier IS
END TB_psr_modifier;
 
ARCHITECTURE behavior OF TB_psr_modifier IS 
 
    COMPONENT psr_modifier
    PORT(
         crs1 : IN  std_logic_vector(31 downto 0);
         crs2 : IN  std_logic_vector(31 downto 0);
         op_alu : IN  std_logic_vector(5 downto 0);
         result_alu : IN  std_logic_vector(31 downto 0);
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;

   signal crs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal crs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal op_alu : std_logic_vector(5 downto 0) := (others => '0');
   signal result_alu : std_logic_vector(31 downto 0) := (others => '0');

   signal nzvc : std_logic_vector(3 downto 0);
 
BEGIN
 
   uut: psr_modifier PORT MAP (
          crs1 => crs1,
          crs2 => crs2,
          op_alu => op_alu,
          result_alu => result_alu,
          nzvc => nzvc
        ); 

   stim_proc: process
   begin
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "000001";				-- and 
		result_alu <= X"00000000";
      wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "010001";				-- andcc
		result_alu <= X"00000000";
      wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "000101";				-- andn
		result_alu <= X"0000F0F0";
      wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "010101";				-- andncc
		result_alu <= X"0000F0F0";
      wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "000010";				-- or
		result_alu <= X"0000FFFF";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "010010";				-- orcc
		result_alu <= X"0000FFFF";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "000110";				-- orn
		result_alu <= X"FFFFF0F0";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "010110";				-- orncc
		result_alu <= X"FFFFF0F0";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "000011";				-- xor
		result_alu <= X"0000FFFF";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "010011";				-- xorcc
		result_alu <= X"0000FFFF";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "000111";				-- xnor
		result_alu <= X"FFFF0000";
		wait for 20 ns;
		crs1 <= X"0000F0F0";
		crs2 <= X"00000F0F";
		op_alu <= "010111";				-- xnorcc
		result_alu <= X"FFFF0000";
		wait for 20 ns;
		
		
		crs1 <= X"7FFFFFF1";
		crs2 <= X"0000000F";
		op_alu <= "000000";				-- add
		result_alu <= X"80000000";
      wait for 20 ns;
		crs1 <= X"7FFFFFF1";
		crs2 <= X"0000000F";
		op_alu <= "010000";				-- addcc 
		result_alu <= X"80000000";
      wait for 20 ns;
		crs1 <= X"7FFFFFF1";
		crs2 <= X"0000000F";
		op_alu <= "001000";				-- addx
		result_alu <= X"80000000";
      wait for 20 ns;
		crs1 <= X"7FFFFFF1";
		crs2 <= X"0000000F";
		op_alu <= "011000";				-- addxcc 
		result_alu <= X"80000000";
      wait for 20 ns;
		crs1 <= X"00000000";
		crs2 <= X"80000000";
		op_alu <= "000100";				-- sub 
		result_alu <= X"00000000";
      wait for 20 ns;
		crs1 <= X"00000000";
		crs2 <= X"80000000";
		op_alu <= "010100";				-- subcc
		result_alu <= X"00000000";
      wait for 20 ns;
		crs1 <= X"00000000";
		crs2 <= X"80000000";
		op_alu <= "001100";				-- subx
		result_alu <= X"00000000";
      wait for 20 ns;
		crs1 <= X"00000000";
		crs2 <= X"80000000";
		op_alu <= "011100";				-- subxcc
		result_alu <= X"00000000";
      wait for 20 ns;
   end process;

END;
