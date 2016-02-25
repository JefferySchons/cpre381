-- attempt1a.vhd
-------------------------------------------------------------------------
-- DESCRIPTION: This file contains an implementation of an edge-triggered
-- flip-flop with parallel access and reset.
--
--
-- NOTES:
-- 9/07/08 by JAZ::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity attempt1a is
generic(N : integer := 32);
  port(n_CLK        : in std_logic;     -- Clock input
       n_RST        : in std_logic;     -- Reset input
       n_WE         : in std_logic;     -- Write enable input
       n_D          : in std_logic_vector(n-1 downto 0);     -- Data value input
       p_Q          : out std_logic_vector(n-1 downto 0));   -- Data value output

end attempt1a;

architecture structure of attempt1a is


component dff
    port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
  end component;

  signal s_D    : std_logic;    -- Multiplexed input to the FF
  signal s_Q    : std_logic;    -- Output of the FF

Begin

g_dff: for i in 0 to N-1 generate
	dff_1: dff
	port map(i_CLK => n_CLK,
		 i_RST  => n_RST,
	         i_WE  => n_WE,
  	         i_D => n_D(i),
		 o_Q => p_Q(i));

     end generate;
end structure;

