
-- partd.vhd
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

entity partd is

  generic(N : integer := 32; M : integer := 5);
  port(	input        : in std_logic_vector(M-1 downto 0);     -- decoder 5 bit input
       	output        : in std_logic_vector(N-1 downto 0));     			-- 32 bit output);

end partd;

architecture dflow of partd is

begin
	with M select N <=
  		"00000000000000000000000000000001" when "00000",
		"00000000000000000000000000000010" when "00001",
		"00000000000000000000000000000100" when "00010",
		"00000000000000000000000000001000" when "00011",
  		"00000000000000000000000000010000" when "00100",
		"00000000000000000000000000100000" when "00101",
		"00000000000000000000000001000000" when "00110",
		"00000000000000000000000010000000" when "00111",
  		"00000000000000000000000100000000" when "01000",
		"00000000000000000000001000000000" when "01001",
		"00000000000000000000010000000000" when "01010",
		"00000000000000000000100000000000" when "01011",
  		"00000000000000000001000000000000" when "01100",
		"00000000000000000010000000000000" when "01101",
		"00000000000000000100000000000000" when "01110",
		"00000000000000001000000000000000" when "01111",
  		"00000000000000010000000000000000" when "10000",
		"00000000000000100000000000000000" when "10001",
		"00000000000001000000000000000000" when "10010",
		"00000000000010000000000000000000" when "10011",
  		"00000000000100000000000000000000" when "10100",
		"00000000001000000000000000000000" when "10101",
		"00000000010000000000000000000000" when "10110",
		"00000000100000000000000000000000" when "10111",
  		"00000001000000000000000000000000" when "11000",
		"00000010000000000000000000000000" when "11001",
		"00000100000000000000000000000000" when "11010",
		"00001000000000000000000000000000" when "11011",
  		"00010000000000000000000000000000" when "11100",
		"00100000000000000000000000000000" when "11101",
		"01000000000000000000000000000000" when "11110",
		"10000000000000000000000000000000" when "11111";

end process;
  
end dflow;
