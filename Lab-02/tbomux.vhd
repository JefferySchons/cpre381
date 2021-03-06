-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-------------------------------------------------------------------------


-- tbomux.vhd
-------------------------------------------------------------------------
-- NOTES:
-- 9/15/15 by JAZ::Design created.
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity tbomux is

  port(a		: in std_logic;
       b 	 	: in std_logic;
       s		: in std_logic;
       c 		: out std_logic);

end tbomux;

architecture structure of tbomux is
  
  -- Describe the component entities as defined in Adder.vhd 
  -- and Multiplier.vhd (not strictly necessary).
  component and2
    port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
  end component;

  component or2
    port(i_A          : in std_logic;
       i_B          : in std_logic;
       o_F          : out std_logic);
  end component;

  component inv
    port(i_A          : in std_logic;
       o_F          : out std_logic);
  end component;


--S inverted 
  signal sVALUE_notS : std_logic;
--A and inverted S
  signal sVALUE_AxnotS : std_logic;
--B and S
  signal sVALUE_BxS : std_logic;

begin

  
  ---------------------------------------------------------------------------
  -- Level 1: Calculate ~S and calculate b*s
  ---------------------------------------------------------------------------
  g_inv: inv
    port MAP(i_A              => s,
             o_F              => sVALUE_notS);

  g_firstAnd: and2
    port MAP(i_A              => b,
             i_B              => s,
             o_F              => sVALUE_BxS);

    
 ---------------------------------------------------------------------------
  -- Level 2: Calculate a*~s
  ---------------------------------------------------------------------------
  g_secondAnd: and2
    port MAP(i_A              => a,
             i_B              => sVALUE_notS,
             o_F              => sVALUE_AxnotS);
    
  ---------------------------------------------------------------------------
  -- Level 3: Calculate (a*~s)+(b*s)
  ---------------------------------------------------------------------------
  g_firstOr: or2
    port MAP(i_A              => sVALUE_AxnotS,
             i_B              => sVALUE_BxS,
             o_F              => c);
  
end structure;
