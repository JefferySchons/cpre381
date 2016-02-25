-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-------------------------------------------------------------------------


-- part3b.vhd
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity part3b is
  generic(N : integer := 4);
  port(i_A		: in std_logic_vector(N-1 downto 0);
       i_B	 	: in std_logic_vector(N-1 downto 0);
       c_in		: in std_logic;
       c_out 		: out std_logic;
       d_sum		: out std_logic_vector(N-1 downto 0));

end part3b;

architecture structure of part3b is
  
  component part3a
    port(a          : in std_logic;
         b          : in std_logic;
         cin        : in std_logic;
	 cout       : out std_logic;
	 sum        : out std_logic);
  end component;

signal sVALUE_c_out : std_logic_vector(N-1 downto 0);
begin

g_part3a: for i in 0 to N-1 generate

     name:if (i = 0) generate
 
 	  part3a_1: part3a
		port map(a => i_A(i),
			 b  => i_B(i),
	         	cin  => c_in,
  	         	cout => sVALUE_c_out(i),
		 	sum => d_sum(i));
     end generate name;

     name1: if (i/= 0 and i/=(N-1)) generate 
	part3a_2: part3a
		port map(a => i_A(i),
			 b  => i_B(i),
	         	cin  => sVALUE_c_out(i-1),
  	         	cout => sVALUE_c_out(i),
		 	sum => d_sum(i));
     end generate name1;
     name3: if (i=(N-1)) generate
	  part3a_3: part3a
		port map(a => i_A(i),
			 b  => i_B(i),
	         	cin  => sVALUE_c_out(i-1),
  	         	cout => c_out,
		 	sum => d_sum(i));
     end generate name3;
end generate;  
 
end structure;
