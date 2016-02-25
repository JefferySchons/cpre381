-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-- cpre 381 lab-02
-- Iowa State University
-------------------------------------------------------------------------


-- part2d.vhd
-------------------------------------------------------------------------
-- NOTES:
-- 9/15/15 created
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity part2d is
  generic(N : integer := 32);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       i_B  : in std_logic_vector(N-1 downto 0);
       i_S  : in std_logic;
       o_F  : out std_logic_vector(N-1 downto 0));

end part2d;

architecture structure of part2d is

--component tbomux
  --port(a		: in std_logic;
       --b 	 	: in std_logic;
       --s		: in std_logic;
       --c 		: out std_logic);
--end component;

begin

-- we put the inputs in a mux index by index (structural)
g_tbomux2: for i in 0 to N-1 generate
	--(A*~S)+(B*S)
	o_F(i) <= ((i_A(i) AND (Not i_S)) OR (i_B(i) AND i_S));
end generate;

end structure;

