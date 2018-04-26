library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity windows_manager is
    Port ( cwp : in  STD_LOGIC_VECTOR (0 downto 0);
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           op : in  STD_LOGIC_VECTOR (2 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC_VECTOR (0 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (6 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (6 downto 0);
           nrd : out  STD_LOGIC_VECTOR (6 downto 0));
end windows_manager;

architecture arq_windows_manager of windows_manager is

begin


end arq_windows_manager;

