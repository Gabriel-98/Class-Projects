LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_ControlUnit IS
END TB_ControlUnit;
 
ARCHITECTURE behavior OF TB_ControlUnit IS 

    COMPONENT ControlUnit
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         op3 : IN  std_logic_vector(5 downto 0);
         icc : IN  std_logic_vector(3 downto 0);
         cond : IN  std_logic_vector(3 downto 0);
         wrenmem : OUT  std_logic;
         rdenmem : OUT  std_logic;
         wren : OUT  std_logic;
         rfsource : OUT  std_logic_vector(1 downto 0);
         pcsource : OUT  std_logic_vector(1 downto 0);
         rfdest : OUT  std_logic;
         op_alu : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;

   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');
   signal icc : std_logic_vector(3 downto 0) := (others => '0');
   signal cond : std_logic_vector(3 downto 0) := (others => '0');

   signal wrenmem : std_logic;
   signal rdenmem : std_logic;
   signal wren : std_logic;
   signal rfsource : std_logic_vector(1 downto 0);
   signal pcsource : std_logic_vector(1 downto 0);
   signal rfdest : std_logic;
   signal op_alu : std_logic_vector(5 downto 0);

BEGIN

   uut: ControlUnit PORT MAP (
          op => op,
          op3 => op3,
          icc => icc,
          cond => cond,
          wrenmem => wrenmem,
          rdenmem => rdenmem,
          wren => wren,
          rfsource => rfsource,
          pcsource => pcsource,
          rfdest => rfdest,
          op_alu => op_alu
        );

   stim_proc: process
   begin		
      op <= "00";					-- FORMATO 2
		icc <= "0000";
		cond <= "1000";			-- ba
      wait for 20 ns;
		icc <= "0000";
		cond <= "0000";			-- bn
      wait for 20 ns;
		icc <= "0000";
		cond <= "1001";			-- bne
		wait for 20 ns;
		icc <= "0000";
		cond <= "0001";			-- be
		wait for 20 ns;
		icc <= "0010";
		cond <= "1010";			-- bg
		wait for 20 ns;
		icc <= "0100";
		cond <= "0010";			-- ble
		wait for 20 ns;
   end process;

END;
