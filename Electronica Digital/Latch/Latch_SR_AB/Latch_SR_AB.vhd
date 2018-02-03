library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch_SR_AB is
    Port ( Sn : in  STD_LOGIC;
           Rn : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end Latch_SR_AB;

architecture Behavioral of Latch_SR_AB is

signal Q_aux : std_logic := '0';
signal Qn_aux : std_logic := '0';

begin
	Q_aux <= Sn nand Qn_aux;
	Qn_aux <= Rn nand Q_aux;
	Q <= Q_aux;
	Qn <= Qn_aux;

end Behavioral;

