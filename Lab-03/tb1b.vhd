-------------------------------------------------------------------------
-- Joseph Zambreno
-- Department of Electrical and Computer Engineering
-- Iowa State University
-------------------------------------------------------------------------


-- tb1b.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains a simple VHDL testbench for the
-- edge-triggered flip-flop with parallel access and reset.
--
--
-- NOTES:
-- 9/07/08 by JAZ::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity tb1b is
  generic(N : integer := 32; gCLK_HPER   : time := 50 ns);
end tb1b;

architecture behavior of tb1b is
  
  -- Calculate the clock period as twice the half-period
  constant cCLK_PER  : time := gCLK_HPER * 2;


  component attempt1a
	
    port(n_CLK        : in std_logic;     -- Clock input
       	n_RST        : in std_logic;     -- Reset input
       	n_WE         : in std_logic;     -- Write enable input
 	n_D          : in std_logic_vector;     -- Data value input
       	p_Q          : out std_logic_vector);   -- Data value output

  end component;

  -- Temporary signals to connect to the dff component.
  signal s_CLK : std_logic;
  signal s_RST : std_logic;
  signal s_WE  : std_logic;
  signal s_D : std_logic_vector(n-1 downto 0);
  signal s_Q : std_logic_vector(n-1 downto 0);

begin

  DUT: attempt1a
  port map(n_CLK => s_CLK, 
           n_RST => s_RST,
           n_WE  => s_WE,
           n_D   => s_D,
           p_Q   => s_Q);

  -- This process sets the clock value (low for gCLK_HPER, then high
  -- for gCLK_HPER). Absent a "wait" command, processes restart 
  -- at the beginning once they have reached the final statement.
  P_CLK: process
  begin
    s_CLK <= '0';
    wait for gCLK_HPER;
    s_CLK <= '1';
    wait for gCLK_HPER;
  end process;
  
  -- Testbench process  
  P_TB: process
  begin
    -- Reset the FF
    s_RST <= '1';
    s_WE  <= '0';
    s_D   <= "00000000000000000000000000000000";
    wait for cCLK_PER;

    -- Store '1'
    s_RST <= '0';
    s_WE  <= '1';
    s_D   <= "00000000000000000000000000000001";
    wait for cCLK_PER;  

    -- Keep '1'
    s_RST <= '0';
    s_WE  <= '0';
    s_D   <= "00000000000000000000000000000000";
    wait for cCLK_PER;  

    -- Store '0'    
    s_RST <= '0';
    s_WE  <= '1';
    s_D   <= "00000000000000000000000000000000";
    wait for cCLK_PER;  

    -- Keep '0'
    s_RST <= '0';
    s_WE  <= '0';
    s_D   <= "00000000000000000000000000000001";
    wait for cCLK_PER; 
 
    -- Store 'number'    
    s_RST <= '0';
    s_WE  <= '1';
    s_D   <= "01010101010110101010101010101010";
    wait for cCLK_PER; 

    -- Keep 'number'
    s_RST <= '0';
    s_WE  <= '0';
    s_D   <= "00000000000000000000000000000001";
    wait for cCLK_PER; 

    -- reset
    s_RST <= '1';
    s_WE  <= '0';
    s_D   <= "01111111101110000011100000000001";
    wait for cCLK_PER; 
    wait;
  end process;
  
end behavior;
