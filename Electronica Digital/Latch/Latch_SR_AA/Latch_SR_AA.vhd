library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch_SR_AA is
    Port ( S : in  STD_LOGIC;
           R : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end Latch_SR_AA;

architecture Behavioral of Latch_SR_AA is

signal Q_aux: std_logic := '0';
signal Qn_aux: std_logic := '1';

begin
	Q_aux <= R nor Qn_aux;
	Qn_aux <= S nor Q_aux;
	Q <= Q_aux;
	Qn <= Qn_aux;

end Behavioral;

