
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity ALU is
    Port ( ALUOP : in  STD_LOGIC_VECTOR (5 downto 0);
           CRS1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRS2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  CARRY : in STD_LOGIC;
           ALURESULT : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
		process (CRS1, CRS2, ALUOP)
		begin
					if(ALUOP = "000000")then   			-- add
							ALURESULT <= CRS1+CRS2;
					elsif (ALUOP = "010000") then			-- addcc
							ALURESULT <= CRS1 + CRS2;		
					elsif (ALUOP = "001000") then			-- addx
							ALURESULT <= CRS1 + CRS2 + CARRY;	
					elsif (ALUOP = "011000") then			-- addxcc
							ALURESULT <= CRS1 + CRS2 + CARRY;
					elsif (ALUOP = "000100") then			-- sub
							ALURESULT <= CRS1 - CRS2;
					elsif (ALUOP = "010100") then       -- subcc
							ALURESULT <= CRS1 - CRS2;		
					elsif (ALUOP = "001100") then			-- subx
							ALURESULT <= CRS1 - CRS2 - CARRY;		
					elsif (ALUOP = "011100") then			-- subxcc
							ALURESULT <= CRS1 - CRS2 - CARRY;
					elsif (ALUOP = "000001") then			-- and
							ALURESULT <= CRS1 and CRS2;
					elsif (ALUOP = "010001") then			-- andcc
							ALURESULT <= CRS1 and CRS2;
					elsif (ALUOP = "000101") then			-- Nand
							ALURESULT <= CRS1 nand CRS2;
					elsif (ALUOP = "010101") then			-- Nandcc
							ALURESULT <= CRS1 nand CRS2;	
					elsif (ALUOP = "000010") then			-- or
							ALURESULT <= CRS1 or CRS2;
					elsif (ALUOP = "010010") then			-- orcc
							ALURESULT <= CRS1 or CRS2;
					elsif (ALUOP = "000110") then			-- Nor
							ALURESULT <= CRS1 nor CRS2;
					elsif (ALUOP = "010110") then			-- Norcc
							ALURESULT <= CRS1 nor CRS2;
					elsif (ALUOP = "000011") then 		-- xor
							ALURESULT <= CRS1 xor CRS2;
					elsif (ALUOP = "010011") then 		-- xorcc
							ALURESULT <= CRS1 xor CRS2;
					elsif (ALUOP = "000111") then			-- XNor
							ALURESULT <= CRS1 xnor CRS2;
					elsif (ALUOP = "010111") then			-- XNorcc
							ALURESULT <= CRS1 xnor CRS2;
					end if;
		end process;


end Behavioral;

