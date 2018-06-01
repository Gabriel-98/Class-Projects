library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity psr is
    Port ( reset : in  STD_LOGIC;
           clock : in  STD_LOGIC;
			  nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in  STD_LOGIC_VECTOR (0 downto 0);
			  cwp : out  STD_LOGIC_VECTOR (0 downto 0);
			  icc : out  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end psr;

architecture arq_psr of psr is

begin
	process(clock,reset,nzvc,ncwp)
	begin
		if reset = '1' then
			icc <= "0000";
			c <= '0';
			cwp <= "0";
		elsif clock'event and clock = '1' then
			icc <= nzvc;
			c <= nzvc(0);
			cwp <= ncwp;
		end if;
	end process;

end arq_psr;

