library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SingEU22 is
    Port ( imm22 : in  STD_LOGIC_VECTOR (21 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SingEU22;

architecture Behavioral of SingEU22 is

begin
		process(imm22)
			 begin 
				if (imm22(21) = '1') then
						imm32(21 downto 0)<= imm22;
						imm32(31 downto 22)<= (others => '1');
				elsif(imm22(21) = '0')then
						imm32(21 downto 0)<= imm22;
						imm32(31 downto 22)<= (others => '0');
				end if;
		end process; 


end Behavioral;