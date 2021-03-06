-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-- cpre 381 lab-02
-- Iowa State University
-------------------------------------------------------------------------


-- OCW.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file will invert all individual bits
--
--
-- NOTES:
-- 9/9/15 created
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

-- This is an empty entity so we don't need to declare ports
entity OCW is
  generic(N : integer := 8);
end OCW;

architecture behavior of OCW is

-- Declare the component we are going to instantiate
component OC
  port(i_A  : in std_logic_vector;
       o_F  : out std_logic_vector);
end component;

component OC2
  port(i_A  : in std_logic_vector;
       o_E  : out std_logic_vector);
end component;
  

-- Signals to connect to the and2 module
signal s_A : std_logic_vector(N-1 downto 0);
signal s_F : std_logic_vector(N-1 downto 0); 
signal s_E : std_logic_vector(N-1 downto 0);

begin

DUT: OC
  port map(i_A  => s_A,
	   o_F  => s_F);
DUT1: OC2
  port map(i_A  => s_A,
  	   o_E  => s_E);
  -- Remember, a process executes sequentially
  -- and then if not told to 'wait' loops back
  -- around
  process
  begin

    s_A <= "01001110";
    wait for 100 ns;
   
    s_A <= "01010101";
    wait for 100 ns;


  end process;
  
end behavior;
