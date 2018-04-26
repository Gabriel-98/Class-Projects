library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity psr is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           c : out  STD_LOGIC);
end psr;

architecture arq_psr of psr is

begin
	c <= nzvc(0);

end arq_psr;

