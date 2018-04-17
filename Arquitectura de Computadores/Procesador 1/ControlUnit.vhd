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
				when "000001" => op_alu <= "000001";
				when "000101" => op_alu <= "000101";
				when "000010" => op_alu <= "000010";
				when "000110" => op_alu <= "000110";
				when "000011" => op_alu <= "000011";
				when "000111" => op_alu <= "000111";
				when "000000" => op_alu <= "000000";
				when "000100" => op_alu <= "000100";
				when "100101" => op_alu <= "100101";
				when "100110" => op_alu <= "100110";
				when others => op_alu <= "111111";
			end case;
		else
			op_alu <= "111111";
		end if;
	end process;

end arq_ControlUnit;

