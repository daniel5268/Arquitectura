library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MuxPcSource is
    Port ( PC4 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCDisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCDisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCAdress : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
           PCAdressOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxPcSource;

architecture Behavioral of MuxPcSource is

begin
	process  (PC4, PCDisp22, PCDisp30, PCAdress, PCSource)
	begin
		case PCSource is
			when "00" =>
					PCAdressOut <= PCAdress; --DM
			when "01" =>
					PCAdressOut <= PCDisp30; -- CALL
			when "10" =>
					PCAdressOut <= PCDisp22; -- Brach
			when "11" =>
					PCAdressOut <= PC4; -- ARIRM_LOG, etc
			when others =>
					PCAdressOut <= PC4;
			end case;
	end process;


end Behavioral;

