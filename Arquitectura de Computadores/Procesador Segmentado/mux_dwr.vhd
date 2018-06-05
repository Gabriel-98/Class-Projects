library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_dwr is
    Port ( datatomem : in  STD_LOGIC_VECTOR (31 downto 0);
           result_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsource : in  STD_LOGIC_VECTOR (1 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0));
end mux_dwr;

architecture arq_mux_dwr of mux_dwr is

begin
	process(datatomem,result_alu,pc,rfsource)
	begin
		case rfsource is
			when "00" => datatoreg <= pc;					-- CALL Y JMPL
			when "01" => datatoreg <= datatomem;		-- LOAD
			when "10" => datatoreg <= result_alu;		-- ARITMETICAS Y LOGICAS
			when others => datatoreg <= result_alu;	-- (wren = 0) BRANCH Y STORE
		end case;
	end process;

end arq_mux_dwr;

