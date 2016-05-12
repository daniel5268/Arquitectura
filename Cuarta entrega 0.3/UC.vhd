----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
end UC;

architecture Behavioral of UC is

begin
		process (OP,OP3)
		  begin
			if(OP = "10") then
				ALUOP <= OP3;
			end if;
		
		end process;
								


end Behavioral;

