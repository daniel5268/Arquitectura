library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity WindowsManager is
    Port ( rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
			  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC;
			  ncwp : out  STD_LOGIC := '0';
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0));
end WindowsManager;

architecture Behavioral of WindowsManager is

begin
		Process(cwp,rs1,rs2,rd)
			begin
			if (op="10" and op3="111100" and cwp ='1')then 
				ncwp<='0';
			elsif(op = "10" and (op3="111101" ) and cwp ='0')then
				ncwp<='1';
		   end if;
			
				if(rs1>="00000" and rs1<="00111")then--Globals
							nrs1(5)<='0';
							nrs1(4 downto 0)<= rs1;
				elsif(rs1>="01000" and rs1<="01111")then-- output
							nrs1(5)<='0';
							nrs1(4)<=cwp;
							nrs1(3 downto 0)<= rs1(3 downto 0);
				elsif(rs1>="10000" and rs1<="10111")then--locals
							if(cwp='1')then
								nrs1(5)<='1';
								nrs1(4)<='0';
								nrs1(3 downto 0)<= rs1(3 downto 0);
							elsif(cwp='0')then
								nrs1(5)<='0';
								nrs1(4 downto 0)<= rs1;
							end if;
				elsif(rs1>="11000" and rs1<="11111")then--input
							if(cwp='1')then 
								nrs1(5)<='0';
								nrs1(4)<='0';
								nrs1(3 downto 0)<= rs1(3 downto 0);
							elsif(cwp='0')then 
								nrs1(5)<='0';
								nrs1(4 downto 0)<= rs1;
							end if;
				end if;
				
				
				if(rs2>="00000" and rs2<="00111")then--Globals
							nrs2(5)<='0';
							nrs2(4 downto 0)<= rs2;
				elsif(rs2>="01000" and rs2<="01111")then-- output
							nrs2(5)<='0';
							nrs2(4)<=cwp;
							nrs2(3 downto 0)<= rs2(3 downto 0);
				elsif(rs2>="10000" and rs2<="10111")then--locals
							if(cwp='1')then
								nrs2(5)<='1';
								nrs2(4)<='0';
								nrs2(3 downto 0)<= rs2(3 downto 0);
							elsif(cwp='0')then
								nrs2(5)<='0';
								nrs2(4 downto 0)<= rs2;
							end if;
				elsif(rs2>="11000" and rs2<="11111")then--input
							if(cwp='1')then 
								nrs2(5)<='0';
								nrs2(4)<='0';
								nrs2(3 downto 0)<= rs2(3 downto 0);
							elsif(cwp='0')then 
								nrs2(5)<='0';
								nrs2(4 downto 0)<= rs2;
							end if;
				end if;
				
				
				if(rd>="00000" and rd<="00111")then--Globals
							nrd(5)<='0';
							nrd(4 downto 0)<= rd;
				elsif(rd>="01000" and rd<="01111")then-- output
							nrd(5)<='0';
							nrd(4)<=cwp;
							nrd(3 downto 0)<= rd(3 downto 0);
				elsif(rd>="10000" and rd<="10111")then--locals
							if(cwp='1')then
								nrd(5)<='1';
								nrd(4)<='0';
								nrd(3 downto 0)<= rd(3 downto 0);
							elsif(cwp='0')then
								nrd(5)<='0';
								nrd(4 downto 0)<= rd;
							end if;
				elsif(rd>="11000" and rd<="11111")then--input
							if(cwp='1')then 
								nrd(5)<='0';
								nrd(4)<='0';
								nrd(3 downto 0)<= rd(3 downto 0);
							elsif(cwp='0')then 
								nrd(5)<='0';
								nrd(4 downto 0)<= rd;
							end if;
				end if;
	end process;

end Behavioral;

