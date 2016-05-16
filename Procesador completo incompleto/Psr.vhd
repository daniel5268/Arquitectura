library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Psr is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  ncwp : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           carry_psr : out  STD_LOGIC;
			  cwp : out STD_LOGIC);
end Psr;

architecture Behavioral of Psr is

begin
		process(clk,rst,nzvc)
			begin
				if(rising_edge(clk))then
					if(rst = '1') then
						carry_psr <= '0';
						cwp <= '0';
					else
						cwp<=ncwp;
						carry_psr <= nzvc(0);
						end if;
				end if;
			end process;

end Behavioral;

