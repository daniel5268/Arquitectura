----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:36:31 03/14/2016 
-- Design Name: 
-- Module Name:    activadorLEDS - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity activadorLEDS is
    Port ( clk : in  STD_LOGIC;
           activador : out  STD_LOGIC_VECTOR (3 downto 0));
end activadorLEDS;

architecture Behavioral of activadorLEDS is

begin
process(clk)
variable  contador4ms : integer range 0 to 800000 :=0;
begin
	if(rising_edge(clk))then
			if(contador4ms<=200000)then
				activador<="1000";
				contador4ms:=contador4ms+1;
			elsif((contador4ms>200000) and(contador4ms<=400000))then
				activador<="0100";
				contador4ms:=contador4ms+1;
			elsif((contador4ms>400000) and (contador4ms<=600000))then
				activador<="0010";
				contador4ms:=contador4ms+1;
			elsif((contador4ms>600000) and (contador4ms<=800000))then
				activador<="0001";
				contador4ms:=contador4ms+1;
			elsif(contador4ms>800000) then
				contador4ms:=0;
		end if;
	end if;
end process;
end Behavioral;

