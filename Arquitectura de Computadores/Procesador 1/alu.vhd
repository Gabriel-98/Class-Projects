library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all; 

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           op : in  STD_LOGIC_VECTOR (5 downto 0);
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture arq_alu of alu is

begin
	process(A,B,op)
	begin
		case op is
			when "000001" => result <= A and B;
			when "000101" => result <= A and not(B);
			when "000010" => result <= A or B;
			when "000110" => result <= A or not(B);
			when "000011" => result <= A xor B;
			when "000111" => result <= A xor not(B);
			when "000000" => result <= A + B;
			when "000100" => result <= A - B;
			when "100101" => result <= std_logic_vector(unsigned(A) sll conv_integer(B(4 downto 0)));
			when "100110" => result <= std_logic_vector(unsigned(A) srl conv_integer(B(4 downto 0)));
			when others => result <= X"00000000";
		end case;
	end process;
					
end arq_alu;
