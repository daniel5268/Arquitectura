library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity SingEU30  is
    Port ( imm30 : in  STD_LOGIC_VECTOR (29 downto 0);
           imm32 : out  STD_LOGIC_VECTOR (31 downto 0));
end SingEU30 ;

architecture Behavioral of SingEU30  is

begin
		process(imm30)
			 begin 
				if (imm30(29) = '1') then
						imm32(29 downto 0)<= imm30;
						imm32(31 downto 22)<= (others => '1');
				elsif(imm30(29) = '0')then
						imm32(29 downto 0)<= imm30;
						imm32(31 downto 22)<= (others => '0');
				end if;
		end process; 


end Behavioral;