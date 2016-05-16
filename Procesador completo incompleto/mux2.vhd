library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux2 is
    Port ( datmemor : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_out : in  STD_LOGIC_VECTOR (31 downto 0);
			  PC : in  STD_LOGIC_VECTOR (31 downto 0);
           RFsource : in STD_LOGIC_VECTOR (1 downto 0);
           datReg : out  STD_LOGIC_VECTOR (31 downto 0));
end mux2;

architecture Behavioral of mux2 is

begin
		process (RFsource,datmemor, alu_out)
			begin
				case RFsource is
					when "00" =>
						datReg <= datmemor; --Pasa el dato de la memoria
					when "01" =>
						datReg <= alu_out; --Pasa el dato de la Alu
					when "10" =>
						datReg <= PC; --Pasa la dirección del PC
					when others =>
						datReg <= (others =>'0');
				end case;
		end process;

end Behavioral;

