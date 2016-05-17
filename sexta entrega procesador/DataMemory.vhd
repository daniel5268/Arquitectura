
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DataMemory is
    Port ( clk : in  STD_LOGIC;
           habilita : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           crd : in  STD_LOGIC_VECTOR (31 downto 0);
           address : in  STD_LOGIC_VECTOR (31 downto 0);
           wE : in  STD_LOGIC;
           datmemor : out  STD_LOGIC_VECTOR (31 downto 0));
end DataMemory;

architecture Behavioral of DataMemory is
		type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
		signal ramMemory: ram_type:= (others => x"00000000");
begin

		process(clk)
				begin 
					if(rising_edge(clk))then
						if(habilita='1')then
							if(rst='1')then
								datmemor<=(others => '0');
								ramMemory <=(others => x"00000000");
							else
								if(wE='0')then
									datmemor <= ramMemory(conv_integer(address(5 downto 0)));
								else 
									ramMemory(conv_integer(address(5 downto 0))) <= crd;
								end if;
							end if;
						end if;
					end if;
				end process;
				
				
					
								

end Behavioral;

