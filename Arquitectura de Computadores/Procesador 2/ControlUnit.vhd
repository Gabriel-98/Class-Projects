library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           op_alu : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture arq_ControlUnit of ControlUnit is

begin
	process(op,op3)
	begin
		if op = "10" then
			case op3 is
				when "000001" => op_alu <= "000001";	-- and
				when "010001" => op_alu <= "010001";	-- andcc
				when "000101" => op_alu <= "000101";	-- andn
				when "010101" => op_alu <= "010101";	-- andncc
				when "000010" => op_alu <= "000010";	-- or
				when "010010" => op_alu <= "010010";	-- orcc
				when "000110" => op_alu <= "000110";	-- orn
				when "010110" => op_alu <= "010110";	-- orncc
				when "000011" => op_alu <= "000011";	-- xor
				when "010011" => op_alu <= "010011";	-- xorcc
				when "000111" => op_alu <= "000111";	-- xnor
				when "010111" => op_alu <= "010111";	-- xnorcc
				when "000000" => op_alu <= "000000";	-- add
				when "010000" => op_alu <= "010000";	-- addcc
				when "001000" => op_alu <= "001000";	-- addx
				when "011000" => op_alu <= "011000";	-- addxcc
				when "000100" => op_alu <= "000100";	-- sub
				when "010100" => op_alu <= "010100";	-- subcc
				when "001100" => op_alu <= "001100";	-- subx
				when "011100" => op_alu <= "011100";	-- subxcc
				when "100101" => op_alu <= "100101";	-- sll
				when "100110" => op_alu <= "100110";	-- slr
				when others => op_alu <= "111111";
			end case;
		else
			op_alu <= "111111";
		end if;
	end process;

end arq_ControlUnit;

