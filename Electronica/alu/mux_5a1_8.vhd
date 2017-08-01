library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_5a1_8 is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           D : in  STD_LOGIC_VECTOR (7 downto 0);
           E : in  STD_LOGIC_VECTOR (7 downto 0);
           Sc0 : in  STD_LOGIC;
           Sc1 : in  STD_LOGIC;
           Sc2 : in  STD_LOGIC;
           Sc3 : in  STD_LOGIC;
           Z : out  STD_LOGIC_VECTOR (7 downto 0));
end mux_5a1_8;

architecture arq_mux_5a1_8 of mux_5a1_8 is
	Component mux_2a1_8 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  S : in  STD_LOGIC;
				  Z : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

	signal N1: STD_LOGIC_VECTOR(7 downto 0);
	signal N2: STD_LOGIC_VECTOR(7 downto 0);
	signal N3: STD_LOGIC_VECTOR(7 downto 0);

begin
	L1: mux_2a1_8 Port Map(A,B,Sc0,N1);
	L2: mux_2a1_8 Port Map(N1,C,Sc1,N2);
	L3: mux_2a1_8 Port Map(N2,D,Sc2,N3);
	L4: mux_2a1_8 Port Map(N3,E,Sc3,Z);

end arq_mux_5a1_8;

