-------------------------------------------------------------------------
-- Collin Farrell and Jeffery Schons
-------------------------------------------------------------------------


-- part3d.vhd
-------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;


entity part3d is
  generic(N : integer := 4);
  port(i_A		: in std_logic_vector(N-1 downto 0);
       i_B	 	: in std_logic_vector(N-1 downto 0);
       c_in		: in std_logic;
       c_out 		: out std_logic;
       d_sum		: out std_logic_vector(N-1 downto 0));

end part3d;

architecture structure of part3d is

signal sVALUE_c_out : std_logic_vector(N-1 downto 0);

begin

g_part3a: for i in 0 to N-1 generate
	name:if (i = 0) generate
		d_sum(i)<= ((Not i_A(i))and(i_B(i) Xor C_in)) Or (i_A(i)and(Not(i_B(i) Xor C_in)));
		sVALUE_c_out(i)<= (i_A(i) and C_in) or (i_B(i) and C_in) or (i_A(i) and i_B(i));
	end generate name;
	name1:if (i/= 0 And i/=(N-1)) generate --c_in goto sVALUE_c_out(i-1)
		d_sum(i)<=((Not i_A(i))and(i_B(i) Xor sVALUE_c_out(i-1))) Or (i_A(i)and(Not(i_B(i) Xor sVALUE_c_out(i-1))));
		sVALUE_c_out(i)<=(i_A(i) and sVALUE_c_out(i-1)) or (i_B(i) and sVALUE_c_out(i-1)) or (i_A(i) and i_B(i));
	end generate name1;
	name2:if (i=(N-1)) generate --sVALUE_c_out(i)<=goto c_out<=
		d_sum(i)<=((Not i_A(i))and(i_B(i) Xor sVALUE_c_out(i-1))) Or (i_A(i)and(Not(i_B(i) Xor sVALUE_c_out(i-1))));
		c_out<=(i_A(i) and sVALUE_c_out(i-1)) or (i_B(i) and sVALUE_c_out(i-1)) or (i_A(i) and i_B(i));
	end generate name2;

end generate;  
 
end structure;
