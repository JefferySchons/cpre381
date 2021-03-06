-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-- cpre 381 lab-02
-- Iowa State University
-------------------------------------------------------------------------


-- part2e.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file will invert all individual bits
--
--
-- NOTES:
-- 9/15/15 created
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- This is an empty entity so we don't need to declare ports
entity part2e is
  generic(N : integer := 32);
end part2e;

architecture behavior of part2e is

-- Declare the component we are going to instantiate
component part2c
  port(i_A  : in std_logic_vector;
       i_B  : in std_logic_vector;
       i_S  : in std_logic;
       o_F  : out std_logic_vector);

end component;

component part2d
  port(i_A  : in std_logic_vector;
       i_B  : in std_logic_vector;
       i_S  : in std_logic;
       o_F  : out std_logic_vector);
end component;
  

-- Signals to connect to the and2 module
signal s_A : std_logic_vector(N-1 downto 0);
signal s_B : std_logic_vector(N-1 downto 0); 
signal s_S : std_logic;
signal s_F : std_logic_vector(N-1 downto 0);
signal s_E : std_logic_vector(N-1 downto 0);

begin

DUT: part2c
  port map(i_A  => s_A,
	   i_B  => s_B,
	   i_S  => s_S,
	   o_F  => s_F);
DUT1: part2d
  port map(i_A  => s_A,
 	   i_B  => s_B,
	   i_S  => s_S,
  	   o_F  => s_E);
  -- Remember, a process executes sequentially
  -- and then if not told to 'wait' loops back
  -- around
  process
  begin

    wait for 100 ns;

    s_A <= "00001111000011110000111100001111";
 
    s_B <= "00110011001100110011001100110011";

    s_S <= '1';

    wait for 100 ns;
    
    s_A <= "00001111000011110000111100001111";
 
    s_B <= "00110011001100110011001100110011";

    s_S <= '0';


  end process;
  
end behavior;
