library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Sc2 : in  STD_LOGIC;
           Sc1 : in  STD_LOGIC;
           Sc0 : in  STD_LOGIC;
           Cout : out  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (7 downto 0));
end alu;

architecture arq_alu of alu is
	Component mux_2a1_8 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  S : in  STD_LOGIC;
				  Z : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	Component mux_5a1_8 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  C : in  STD_LOGIC_VECTOR (7 downto 0);
				  D : in  STD_LOGIC_VECTOR (7 downto 0);
				  E : in  STD_LOGIC_VECTOR (7 downto 0);
				  Sc0 : in  STD_LOGIC;
				  Sc1 : in  STD_LOGIC;
				  Sc2 : in  STD_LOGIC;
				  Sc3 : in  STD_LOGIC;
				  Z : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	Component conjuncion 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  S : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	Component disyuncion 
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  S : out  STD_LOGIC_VECTOR (7 downto 0));
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
	Component mayor_8
		Port (  A : in  STD_LOGIC_VECTOR (7 downto 0);
				  B : in  STD_LOGIC_VECTOR (7 downto 0);
				  Cout : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	signal S1: STD_LOGIC;
	signal S2: STD_LOGIC;
	signal S3: STD_LOGIC;
	signal S4: STD_LOGIC;
	signal S5: STD_LOGIC;
	signal S6: STD_LOGIC;
	signal N1: STD_LOGIC_VECTOR(7 downto 0);
	signal N2: STD_LOGIC_VECTOR(7 downto 0);
	signal OP1: STD_LOGIC_VECTOR(7 downto 0);
	signal OP2: STD_LOGIC_VECTOR(7 downto 0);
	signal OP3: STD_LOGIC_VECTOR(7 downto 0);
	signal OP4: STD_LOGIC_VECTOR(7 downto 0);
	signal OP5: STD_LOGIC_VECTOR(7 downto 0);
	signal C1: STD_LOGIC;
	signal C2: STD_LOGIC;

begin
	S1 <= Sc0 and Sc2;
	S2 <= (not(Sc0) and not(Sc1) and not(Sc2)) or (Sc0 and Sc2);
	S3 <= Sc0;
	S4 <= not(Sc1);
	S5 <= (not(Sc0) and not(Sc1) and not(Sc2)) or (Sc1 and Sc2);
	S6 <= (Sc0 and not(Sc1) and not(Sc2));
	L1: mux_2a1_8 Port Map(A,B,S1,N1);
	L2: mux_2a1_8	Port Map(B,C,S2,N2);
	L3: disyuncion Port Map(N1,N2,OP1);
	L4: conjuncion Port Map(N1,N2,OP2);
	L5: sumador_8 Port Map(N1,N2,C1,OP3);
	L6: restador_8 Port Map(N1,N2,C2,OP4);
	L7: mayor_8 Port Map(N1,N2,OP5);
	L8: mux_5a1_8 Port Map(OP1,OP2,OP3,OP4,OP5,S3,S4,S5,S6,S);
	Cout <= C1 and C2;

end arq_alu;

