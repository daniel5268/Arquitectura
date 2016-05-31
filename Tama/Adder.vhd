library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity Adder is
    Port ( Operando1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Operando2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Resultado : out  STD_LOGIC_VECTOR (31 downto 0));
end Adder;

architecture Behavioral of Adder is

begin
	process(Operando1,Operando2)
		begin
			Resultado <= Operando1 + Operando2;
	end process;


end Behavioral;

