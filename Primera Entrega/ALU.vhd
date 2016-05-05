
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
		process (CRS1, CRS2, ALUOP)
		begin
					if(ALUOP = "000000")then
							ALURESULT <= CRS1+CRS2;
					elsif (ALUOP = "000001") then
							ALURESULT <= CRS1 or CRS2;
					elsif (ALUOP = "000010") then
							ALURESULT <= CRS1 xor CRS2;
					elsif (ALUOP = "000011") then
							ALURESULT <= CRS1 and CRS2;
					elsif (ALUOP = "000100") then
							ALURESULT <= CRS1 nand CRS2;
					elsif (ALUOP = "000101") then
							ALURESULT <= CRS1 nor CRS2;
					elsif (ALUOP = "000110") then
							ALURESULT <= CRS1 xnor CRS2;
					elsif (ALUOP = "000111") then
							ALURESULT <= CRS1 - CRS2;
					end if;
		end process;


end Behavioral;

