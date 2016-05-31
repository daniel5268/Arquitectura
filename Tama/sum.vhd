
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity sum is
    Port ( in_sum : in  STD_LOGIC_VECTOR (31 downto 0);
           out_sum : out  STD_LOGIC_VECTOR (31 downto 0));
end sum;

architecture Behavioral of sum is

begin
	process (in_sum)
	begin
		out_sum <= in_sum + x"00000001";
   end process; 

end Behavioral;

