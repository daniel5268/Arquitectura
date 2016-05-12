
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity RF is
    Port ( rst_rf : in  STD_LOGIC;
           rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           out_alu : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RF;

architecture Behavioral of RF is
    type ram_type is array (0 to 39) of std_logic_vector (31 downto 0);
    signal registro : ram_type := (others => x"00000000");
	 
begin
		
		process (rst_rf, rs1, rs2, rd, out_alu)
		begin 
				
				if(rst_rf = '1') then
						crs1 <=  "00000000000000000000000000000000";
						crs2 <=  "00000000000000000000000000000000";
						registro <= (others => x"00000000");
				else 
						
						crs1 <= registro(conv_integer(rs1));
						crs2 <= registro(conv_integer(rs2));
						registro(conv_integer(rd)) <= out_alu;--Consultar instruccion?
						registro(0) <= x"00000000";
				end if;
		end process;
						
end Behavioral;

