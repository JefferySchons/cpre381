-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-- cpre 381 lab-02
-- Iowa State University
-------------------------------------------------------------------------


-- part2c.vhd
-------------------------------------------------------------------------
-- NOTES:
-- 9/15/15 created
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity part2c is
  generic(N : integer := 32);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       i_B  : in std_logic_vector(N-1 downto 0);
       i_S  : in std_logic;
       o_F  : out std_logic_vector(N-1 downto 0));

end part2c;

architecture structure of part2c is

component tbomux
  port(a		: in std_logic;
       b 	 	: in std_logic;
       s		: in std_logic;
       c 		: out std_logic);
end component;

begin

-- we put the inputs in a mux index by index (structural)
g_tbomux: for i in 0 to N-1 generate
  tbomux_main: tbomux
    port map(a  => i_A(i),
	     b  => i_B(i),
	     s  => i_S,
  	     c  => o_F(i));
end generate;

end structure;

