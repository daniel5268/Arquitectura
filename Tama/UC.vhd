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
		process (OP,OP3,OP2,nzvc,cond)
		  begin
		  	if (OP = "01") then --CALL
				PCSource <= "01";
				wERF <= '1';
				RFSource <= "10";
				Habilita <= '1';
				RFdest <= '1';
				wE <= '0';
				ALUOP <= "111111";
				
				else
						if(OP="00") then
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
										end if;
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
										end if;
									when "1010" => --Branch on greater
										if((not(nzvc(2) or (nzvc(3) xor nzvc(1)))) = '1') then
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
										end if;
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
										end if;
									when "1011" => --Branch on greater or equal
										if((not(nzvc(3) xor nzvc(1))) = '1') then
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
										end if;
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
										end if;
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
									Habilita <= '1';
									RFdest <= '0';
									wE <= '1';
									ALUOP <= "111111";
								end if;
							end if;
							
						else
							if(OP="10")then
								case OP3 is
									--Adds instructions
									when "000000" =>	--ADD
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000000";
										Habilita <= '1';
									when "010000" =>	--ADDcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010000";
										Habilita <= '1';
									when "001000" =>	--ADDX
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "001000";
										Habilita <= '1';
									when "011000" =>	--ADDXcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "011000";
										Habilita <= '1';
									--Subs instructions
									when "000100" =>	--SUB
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000100";
										Habilita <= '1';
									when "010100" =>	--SUBcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010100";
										Habilita <= '1';
									when "001100" =>	--SUBX
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "001100";
										Habilita <= '1';
									when "011100" =>	--SUBXcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "011100";
										Habilita <= '1';
									--Logical instructions
									when "000001" =>	--AND
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000001";
										Habilita <= '1';
									when "010001" =>	--ANDcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010001";
										Habilita <= '1';
									when "000101" =>	--NAND
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000101";
										Habilita <= '1';
									when "010101" =>	--NANDcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010101";
										Habilita <= '1';
									when "000010" =>	--OR
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000010";
										Habilita <= '1';
									when "010010" =>	--ORcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010010";
										Habilita <= '1';
									when "000110" =>	--NOR
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000110";
										Habilita <= '1';
									when "010110" =>	--NORcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010110";
										Habilita <= '1';
									when "000011" =>	--XOR
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000011";
										Habilita <= '1';
									when "010011" =>	--XORcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010011";
										Habilita <= '1';
									when "000111" =>	--XNOR
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000111";
										Habilita <= '1';
									when "010111" =>	--XNORcc
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "010111";
										Habilita <= '1';
									--SAVE, RESTORE, JMPL
									when "111100" =>	--SAVE
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000000"; --Realiza la misma operación que un add y modifica CWP
										Habilita <= '1';
									when "111101" =>	--RESTORE
										PCSource <= "11"; 
										wERF <= '1'; 
										RFSource <= "01"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000000"; --Realiza la misma operación que un add y modifica CWP
										Habilita <= '1';
									when "111000" =>	--JMPL
										PCSource <= "00"; 
										wERF <= '1'; 
										RFSource <= "10"; 
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000000"; --Se deben sumar los operandos que entran en la ALU
										Habilita <= '1';
									when others =>
										PCSource <= "11"; 
										wERF <= '0'; 
										RFSource <= "01";
										RFDest <= '0'; 
										wE <= '0'; 
										ALUOP <= "000000";
										Habilita <= '1';
								end case;
							
							else
								if(OP="11")then
									case OP3 is
										when "000100" => -- STORE
											PCSource <= "11"; 
											wERF <= '0'; --El dato no se debe guardar en el RF
											RFSource <= "01"; 
											RFDest <= '0'; 
											wE <= '1'; -- El dato es escrito en Memoria de Datos
											ALUOP <= "000000";
											Habilita <= '1';
										when "000000" => -- LOAD
											PCSource <= "11"; 
											wERF <= '1'; 
											RFSource <= "00"; --Se debe guardar el dato que se carga de la Memoria
											RFDest <= '0'; 
											wE <= '0'; 
											ALUOP <= "000000";
											Habilita <= '1';
										when others =>
											PCSource <= "11"; 
											wERF <= '0'; 
											RFSource <= "01";
											RFDest <= '0'; 
											wE <= '0'; 
											ALUOP <= "000000";
											Habilita <= '1';
										end case;
								end if;								
							end if;
						end if;
			end if;
		end process;
								


end Behavioral;

