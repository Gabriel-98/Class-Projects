library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Latch_SR_AB_En_AA is
    Port ( Sn : in  STD_LOGIC;
           Rn : in  STD_LOGIC;
           En : in  STD_LOGIC;
           Q : out  STD_LOGIC;
           Qn : out  STD_LOGIC);
end Latch_SR_AB_En_AA;

architecture Behavioral of Latch_SR_AB_En_AA is

signal Q_aux : std_logic := '0';
signal Qn_aux : std_logic := '1';

begin
	Q_aux <= (Rn nand En) nand Qn_aux;
	Qn_aux <= (Sn nand En) nand Q_aux;
	Q <= Q_aux;
	Qn <= Qn_aux;

end Behavioral;

