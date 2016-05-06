library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PC is
    Port ( clk_pc : in  STD_LOGIC;
           out_pc : out  STD_LOGIC_VECTOR (31 downto 0);
           in_pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rst_pc : in  STD_LOGIC);
end PC;

architecture pc_architecture of PC is

begin
		process (clk_pc, rst_pc)
		begin 
				if (rst_pc = '1')then
					out_pc <=(others=>'0');
				elsif (rising_edge (clk_pc)) then
					out_pc <= in_pc;
				end if;
		end process;
end pc_architecture;

