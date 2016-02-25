-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-------------------------------------------------------------------------


-- part3b.vhd
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity part4b is
  generic(N : integer := 4);
 
  port(i_A		: in std_logic_vector(N-1 downto 0);
       i_B	 	: in std_logic_vector(N-1 downto 0);
       c_in		: in std_logic;
       c_out 		: out std_logic;
       d_sum		: out std_logic_vector(N-1 downto 0);
       nAdd_sub		: in std_logic);
end part4b;

architecture structure of part4b is
  
  component part3a
    port(a          : in std_logic;
         b          : in std_logic;
         cin        : in std_logic;
	 cout       : out std_logic;
	 sum        : out std_logic);
  end component;

  component tbomux
    port(i_A	    : in std_logic;
	 i_B	    : in std_logic;
	 i_S	    : in std_logic;
	 o_F	    : out std_logic);
  end component;

  component oc2
    port(i_A	    : in std_logic;
	 o_E	    : out std_logic);
  end component;

signal sVALUE_c_out : std_logic_vector(N-1 downto 0);
signal sVALUE_control : std_logic_vector(N-1 downto 0);
signal sVALUE_bnot : std_logic;

begin

g_part3a: for i in 0 to N-1 generate

     name:if (i = 0) generate
	  OC2_1: OC2
		port map(i_A => i_B(i),
			 o_E => sVALUE_bnot);
 	  tbomux_1: tbomux
		port map(i_A =>sVALUE_bnot,
			 i_B => i_B(i),
			 i_S => nAdd_sub,
			 o_F => sVALUE_control(i));
 	  part3a_1: part3a
		port map(a => i_A(i),
			 b  => sVALUE_control(i),
	         	cin  => c_in,
  	         	cout => sVALUE_c_out(i),
		 	sum => d_sum(i));
     end generate name;

     name2: if (i/= 0 and i/=(N-1)) generate 
	OC2_2: OC2
		port map(i_A => i_B(i),
			 o_E => sVALUE_bnot);
	tbomux_2: tbomux 
		port map(i_A => sVALUE_bnot,
			 i_B => i_B(i),
			 i_S => nAdd_sub,
			 o_F => sVALUE_control(i));
	part3a_2: part3a
		port map(a => i_A(i),
			 b  => sVALUE_control(i),
	         	cin  => sVALUE_c_out(i-1),
  	         	cout => sVALUE_c_out(i),
		 	sum => d_sum(i));
     end generate name2;
     name3: if (i=(N-1)) generate
	  OC2_3: OC2
		port map(i_A => i_B(i),
			 o_E => sVALUE_bnot);
	  tbomux_3: tbomux 
		port map(i_A => sVALUE_bnot,
			 i_B => i_B(i),
			 i_S => nAdd_sub,
			 o_F => sVALUE_control(i));
	  part3a_3: part3a
		port map(a => i_A(i),
			 b  => sVALUE_control(i),
	         	cin  => sVALUE_c_out(i-1),
  	         	cout => c_out,
		 	sum => d_sum(i));
     end generate name3;
end generate;  
 
end structure;
