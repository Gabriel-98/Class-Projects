library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ControlUnit is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  cond : in  STD_LOGIC_VECTOR (3 downto 0);
			  wrenmem : out  STD_LOGIC;								-- Habilita escritura en Data Memory
			  rdenmem : out  STD_LOGIC;								-- Habilita lectura en Data Memory
			  wren : out  STD_LOGIC;									-- Habilita escritura en register file
			  rfsource : out  STD_LOGIC_VECTOR (1 downto 0);	-- Selecciona si result_alu, data memory o pc se envia al RF
           pcsource : out  STD_LOGIC_VECTOR (1 downto 0);	-- Determina la nueva direccion en la lista de instrucciones 
			  rfdest : out  STD_LOGIC;									-- Determina si se va usar o7 o cualquier registro
			  op_alu : out  STD_LOGIC_VECTOR (5 downto 0));
end ControlUnit;

architecture arq_ControlUnit of ControlUnit is

	signal n: STD_LOGIC;
	signal z: STD_LOGIC;
	signal v: STD_LOGIC;
	signal c: STD_LOGIC;
	signal result_icc: STD_LOGIC;

begin
	process(op,op3,icc,cond)
	begin
		if op = "01" then														-- FORMATO 1
			op_alu <= "111111";
		elsif op = "00" then													-- FORMATO 2
			op_alu <= "111111";
		elsif op = "10" then													-- FORMATO 3
			case op3 is
				when "000001" => op_alu <= "000001";					-- and
				when "010001" => op_alu <= "010001";					-- andcc
				when "000101" => op_alu <= "000101";					-- andn
				when "010101" => op_alu <= "010101";					-- andncc
				when "000010" => op_alu <= "000010";					-- or
				when "010010" => op_alu <= "010010";					-- orcc
				when "000110" => op_alu <= "000110";					-- orn
				when "010110" => op_alu <= "010110";					-- orncc
				when "000011" => op_alu <= "000011";					-- xor
				when "010011" => op_alu <= "010011";					-- xorcc
				when "000111" => op_alu <= "000111";					-- xnor
				when "010111" => op_alu <= "010111";					-- xnorcc
				when "000000" => op_alu <= "000000";					-- add
				when "010000" => op_alu <= "010000";					-- addcc
				when "001000" => op_alu <= "001000";					-- addx
				when "011000" => op_alu <= "011000";					-- addxcc
				when "000100" => op_alu <= "000100";					-- sub
				when "010100" => op_alu <= "010100";					-- subcc
				when "001100" => op_alu <= "001100";					-- subx
				when "011100" => op_alu <= "011100";					-- subxcc
				when "100101" => op_alu <= "100101";					-- sll
				when "100110" => op_alu <= "100110";					-- slr
				when "111100" => op_alu <= "000000";					-- save
				when "111101" => op_alu <= "000000";					-- restore
				when "111000" => op_alu <= "000000";					-- jmpl
				when others => op_alu <= "111111";
			end case;
		else																		-- FORMATO 4
			case op3 is
				when "000000" => op_alu <= "000000";					-- load
				when "000100" => op_alu <= "000000";					-- store
				when others => op_alu <= "111111";
			end case;
		end if;
		
		if op = "01" then														-- FORMATO 1
			pcsource <= "11";													-- call
		elsif op = "00" then 												-- FORMATO 2
			n <= icc(3);
			z <= icc(2);
			v <= icc(1);
			c <= icc(0);
			case cond is
				when "1000" => pcsource <= z & v;						-- ba
				when "0000" => pcsource <= z & v;						-- bn
				when "1001" => pcsource <= z & v;					-- bne
				when "0001" => pcsource <= z & v;							-- be
				when "1010" => pcsource <= z & v;	-- bg
				when "0010" => pcsource <= z & v;			-- ble
				when "1011" => pcsource <= '0' & not(icc(3) xor icc(1));			-- bge
				when "0011" => pcsource <= '0' & (n xor v);					-- bl
				when "1100" => pcsource <= '0' & not(c or z);				-- bgu
				when "0100" => pcsource <= '0' & (c or z);					-- bleu
				when "1101" => pcsource <= '0' & not(c);					-- bcc
				when "0101" => pcsource <= '0' & c;							-- bcs
				when "1110" => pcsource <= '0' & not(n);					-- bpos
				when "0110" => pcsource <= '0' & n;							-- bneg
				when "1111" => pcsource <= '0' & not(v);					-- bvc
				when "0111" => pcsource <= '0' & v;							-- bvs
				when others => pcsource <= '0' & '0';
			end case;
		elsif op = "10" then													-- FORMATO 3
			case op3 is
				when "111000" => pcsource <= "10";						-- jmpl
				when others => pcsource <= "00";							-- aritmeticas y logicas
			end case;
		else																		-- FORMATO 4
			pcsource <= "00";													-- instrucciones de memoria
		end if;
		
		if op = "00" then														-- BRANCH
			rfsource <= "11";
			wrenmem <= '0';
			rdenmem <= '0';
			wren <= '0';
		elsif op = "01" then													-- CALL
			rfsource <= "00";
			wrenmem <= '0';
			rdenmem <= '0';
			wren <= '1';
		elsif op = "10" then
			if op3 = "111000" then											-- JMPL
				rfsource <= "00";
				wrenmem <= '0';
				rdenmem <= '0';
				wren <= '1';
			else																	-- ARITMETICAS Y LOGICAS
				rfsource <= "10";
				wrenmem <= '0';
				rdenmem <= '0';
				wren <= '1';
			end if;
 		else
			if op3 = "000000" then											-- LOAD
				rfsource <= "01";
				wrenmem <= '0';
				rdenmem <= '1';
				wren <= '1';
			elsif	op3 = "000100" then										-- STORE
				rfsource <= "11";
				wrenmem <= '1';
				rdenmem <= '0';
				wren <= '0';
			else
				rfsource <= "11";
				wrenmem <= '0';
				rdenmem <= '0';
				wren <= '0';
			end if;
		end if;
		
		if op = "01" then														-- CALL
			rfdest <= '1';
		else
			rfdest <= '0';
		end if;
	end process;

end arq_ControlUnit;