LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY TB_psr IS
END TB_psr;
 
ARCHITECTURE behavior OF TB_psr IS 
 
    COMPONENT psr
    PORT(
         reset : IN  std_logic;
         clock : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
			ncwp : IN  std_logic_vector(0 downto 0);
			cwp : OUT  std_logic_vector(0 downto 0);
			icc : OUT  std_logic_vector(3 downto 0);
         c : OUT  std_logic
        );
    END COMPONENT;

   signal reset : std_logic := '0';
   signal clock : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');
	signal ncwp : std_logic_vector(0 downto 0) := (others => '0');

	signal cwp : std_logic_vector(0 downto 0);
	signal icc : std_logic_vector(3 downto 0);
   signal c : std_logic;

   constant clock_period : time := 20 ns;
 
BEGIN

   uut: psr PORT MAP (
          reset => reset,
          clock => clock,
          nzvc => nzvc,
			 ncwp => ncwp,
			 cwp => cwp,
			 icc => icc,
          c => c
        );

   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
   stim_proc: process
   begin		
      reset <= '1';
      wait for 10 ns;
		reset <= '0';
		nzvc <= "1011";
		ncwp <= "0";
      wait for 20 ns;
		nzvc <= "0111";
		ncwp <= "0";
      wait for 20 ns;
		nzvc <= "0000";
		ncwp <= "1";
      wait for 20 ns;
		nzvc <= "0101";
		ncwp <= "0";
      wait for 20 ns;
		nzvc <= "0100";
		ncwp <= "0";
      wait for 20 ns;
		nzvc <= "1110";
		ncwp <= "1";
      wait for 20 ns;
		nzvc <= "1001";
		ncwp <= "1";
      wait for 20 ns;
		reset <= '1';
		ncwp <= "1";
		wait for 10 ns;
   end process;

END;
