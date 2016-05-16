
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux is
    Port ( crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           i : in  STD_LOGIC;
           operando_alu : out  STD_LOGIC_VECTOR (31 downto 0));
end mux;

architecture Behavioral of mux is

begin
		process (i,crs2, imm32)
			begin
				if (i='1')then
					operando_alu <=imm32;
				elsif(i='0')then  
				   operando_alu <= crs2;
				end if;
		end process;

end Behavioral;

