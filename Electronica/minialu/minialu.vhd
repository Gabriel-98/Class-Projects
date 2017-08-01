library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity minialu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Sc1 : in  STD_LOGIC;
           Sc0 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end minialu;

architecture arq_minialu of minialu is
	Component mux_2a1_1	
		Port ( 	I0 : in  STD_LOGIC;
					I1 : in  STD_LOGIC;
					S : in  STD_LOGIC;
					Z : out  STD_LOGIC );
	end component;
	Component mux_2a1_8 
		Port ( 	A : in  STD_LOGIC_VECTOR (7 downto 0);
					B : in  STD_LOGIC_VECTOR (7 downto 0);
					S : in  STD_LOGIC;
					Z : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	Component restador_8 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  Cout : out  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	Component sumador_8 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  Cout : out  STD_LOGIC;
				  S : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal N1: STD_LOGIC_VECTOR(7 downto 0);
	signal N2: STD_LOGIC_VECTOR(7 downto 0);
	signal N3: STD_LOGIC_VECTOR(7 downto 0);
	signal N4: STD_LOGIC_VECTOR(7 downto 0);
	signal C1: STD_LOGIC;
	signal C2: STD_LOGIC;	

begin
	L1: mux_2a1_8 Port Map(A,B,Sc0,N1);
	L2: mux_2a1_8 Port Map(B,C,Sc0,N2);
	L3: sumador_8 Port Map(N1,N2,C1,N3);
	L4: restador_8 Port Map(N1,N2,C2,N4);
	L5: mux_2a1_8 Port Map(N3,N4,Sc1,S);
	L6: mux_2a1_1 Port Map(C1,C2,Sc1,Cout);

end arq_minialu;

