
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity muxForCall is
    Port ( rd : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDest : in  STD_LOGIC;
           nRd : out  STD_LOGIC_VECTOR (5 downto 0));
end muxForCall;

architecture Behavioral of muxForCall is

begin
		process (RFDest,rd)
			begin
				if (RFDest='0')then
					nRd <= rd;
				elsif(RFDest='1')then  
				   nRd <= "001111";
				end if;
		end process;

end Behavioral;