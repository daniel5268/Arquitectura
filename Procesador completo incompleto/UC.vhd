----------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UC is
    Port ( OP : in  STD_LOGIC_VECTOR (1 downto 0);  --OP
			  OP2 : in  STD_LOGIC_VECTOR (2 downto 0); --OP2 Branch, SETHI, Nop
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0); --ARITM_LOG, etc
			  nzvc : in STD_LOGIC_VECTOR (3 downto 0); --icc
			  cond : in STD_LOGIC_VECTOR (3 downto 0); --cond branch
			  PCSource : out  STD_LOGIC_VECTOR (1 downto 0);--Criterio de desición para el mux PC
			  ALUOP : out  STD_LOGIC_VECTOR (5 downto 0); --Resultado
			  RFdest : out  STD_LOGIC:='0'; -- Habilita el registro 15 en la instrucción Call
			  wE : out  STD_LOGIC:='0';	  --Habilitar la escritura en el Data Memory
			  wERF : out  STD_LOGIC:='0';	  --Habilitar la escritura en el Register File
			  Habilita : out  STD_LOGIC:='0'; --Habilita el uso del Data Memory
			  RFsource : out  STD_LOGIC_VECTOR (1 downto 0)); --Criterio de desición para el mux de RF o DM
			  
end UC;

architecture Behavioral of UC is

begin
		process (OP,OP3)
		  begin
		  	if (OP = "01") then --CALL
				PCSource <= "01";
				wERF <= '1';
				RFSource <= "10";
				Habilita <= "1";
				RFdest <= '1';
				wE <= '0';
				ALUOP <= "111111";
				
				else
						if(OP='00') then
							if(OP2="010")then
								case cond is
									when "1000" => --Branch Always
										PCSource <= "10";
										wERF <= '0';
										RFSource <= "00";
										Habilita <= '1';
										RFdest <= '0';
										wE <= '0';
										ALUOP <= "111111";
									when "1001" => --Branch on not equal
										if(not(nzvc(2))='1')then
											PCSource <= "10";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
										else
											PCSource <= "11";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
									when "0001" => --Branch on equal
										if(nzvc(2)='1')then
											PCSource <= "10";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
										else
											PCSource <= "11";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
									when "1010" => --Branch on greater
										if(not((nzvc(2) or(nzvc(3)xor nzcv(1)))) = '1')then
											PCSource <= "10";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
										else
											PCSource <= "11";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
									when "0011" => --Branch on less
										if((nzvc(3) xor nzvc(1)) = '1')then
											PCSource <= "10";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
										else
											PCSource <= "11";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
									when "1011" => --Branch on greater or equal
										if(not(nzcv(3) xor nzvc(1)) = '1')then
											PCSource <= "10";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
										else
											PCSource <= "11";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
									when "0010" => --Branch on less or equal
										if((nzvc(2) or (nzvc(3) xor nzvc(1))) = '1')then
											PCSource <= "10";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
										else
											PCSource <= "11";
											wERF <= '0';
											RFSource <= "00";
											Habilita <= '1';
											RFdest <= '0';
											wE <= '0';
											ALUOP <= "111111";
									when others => --Not implemented
										PCSource <= "00";
										wERF <= '0';
										RFSource <= "00";
										Habilita <= '1';
										RFdest <= '0';
										wE <= '0';
										ALUOP <= "111111";
								end case;
							else
								if(OP2="100")then -- NOP
									PCSource <= "11";
									wERF <= '0';
									RFSource <= "01";
									Habilita <= "1";
									RFdest <= '0';
									wE <= '1';
									ALUOP <= "111111";
								end if;
							end if;		
		end process;
								


end Behavioral;

