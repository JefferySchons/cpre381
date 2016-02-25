-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-- cpre 381 lab-02
-- Iowa State University
-------------------------------------------------------------------------


-- OC.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file will invert all individual bits
--
--
-- NOTES:
-- 9/8/15 created
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity OC is
  generic(N : integer := 8);
  port(i_A  : in std_logic_vector(N-1 downto 0);
       o_F  : out std_logic_vector(N-1 downto 0);
       o_E  : out std_logic_vector(N-1 downto 0));

end OC;

architecture structure of OC is

component inv
  port(i_A  : in std_logic;
       o_F  : out std_logic);
end component;

begin

-- We invert the input(s) (structural)
g_inv: for i in 0 to N-1 generate
  inv_i: inv 
    port map(i_A  => i_A(i),
  	     o_F  => o_F(i));
end generate;

end structure;

