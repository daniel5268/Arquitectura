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
			--if(OP = "10") then
				--		if(OP3 = "000000") then
					--			ALUOP <= "000000";
						--elsif(OP3 = "000010")then
					--			ALUOP <= "000001";
						--elsif(OP3 = "000011")then
							--	ALUOP <= "000010";
					--	elsif(OP3 = "000001")then	
						--		ALUOP <= "000011";
						--elsif(OP3 = "000101")then	
							--	ALUOP <= "000100";
		--				elsif(OP3 = "000110")then	
			--					ALUOP <= "000101";
				--		elsif(OP3 = "000111")then
					--			ALUOP <= "000110";
				--		elsif(OP3 = "000100")then
					--			ALUOP <= "000111";
					--	else
						--		ALUOP <= "111111";
				--		end if; 
	--		end if;
		ALUOP <= OP3;
		end process;
								


end Behavioral;

