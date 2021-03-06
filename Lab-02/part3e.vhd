-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-------------------------------------------------------------------------


-- part3e.vhd
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity part3e is
  generic(N : integer := 4);
end part3e;

architecture behavior of part3e is

component part3b
  port(i_A		: in std_logic_vector;
       i_B	 	: in std_logic_vector;
       c_in		: in std_logic;
       c_out 		: out std_logic;
       d_sum		: out std_logic_vector);
end component;

component part3d
  port(i_A		: in std_logic_vector;
       i_B	 	: in std_logic_vector;
       c_in		: in std_logic;
       c_out 		: out std_logic;
       d_sum		: out std_logic_vector);
end component;


-- Signals to connect to the modules
signal s_A : std_logic_vector(N-1 downto 0);
signal s_B : std_logic_vector(N-1 downto 0);
signal CarryIN : std_logic;
signal SUM1 : std_logic_vector(N-1 downto 0);
signal SUM2 : std_logic_vector(N-1 downto 0);
signal CarryOUT1 : std_logic;
signal CarryOUT2 : std_logic;

begin

DUT: part3b
  port map(i_A  => s_A,
	   i_B  => s_B,
	   c_in  => CarryIN,
	   c_out =>CarryOUT1,
	   d_sum =>SUM1 );
DUT1: part3d
  port map(  i_A  => s_A,
	   i_B  => s_B,
	   c_in  => CarryIN,
	   c_out =>CarryOUT2,
	   d_sum =>SUM2);
  -- Remember, a process executes sequentially
  -- and then if not told to 'wait' loops back
  -- around
  process
  begin

    wait for 100 ns;
--Normal addition no carry
    s_A <= "0011";
 
    s_B <= "0001";

   CarryIN <= '0';

    wait for 100 ns;
--Normal add with carry IN    
    s_A <= "0010";
 
    s_B <= "0010";

   CarryIN <= '1';

    wait for 100 ns;
--Full overflow
    s_A <= "1111";
 
    s_B <= "1111";

   CarryIN <= '1';
--    


  end process;
  
end behavior;
