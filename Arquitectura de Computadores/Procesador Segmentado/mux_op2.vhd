library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_op2 is
    Port ( A : in  STD_LOGIC_VECTOR (31 downto 0);
           B : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_op2;

architecture arq_mux_op2 of mux_op2 is

begin
	process(A,B,i)
	begin
		case i is
			when '0' => result <= A;
			when others => result <= B;
		end case;
	end process;

end arq_mux_op2;