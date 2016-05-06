---
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY WindMang_tb IS
END WindMang_tb;
 
ARCHITECTURE behavior OF WindMang_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WindowsManager
    PORT(
         rd : IN  std_logic_vector(4 downto 0);
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         cwp : IN  std_logic;
         nrd : OUT  std_logic_vector(5 downto 0);
         nrs1 : OUT  std_logic_vector(5 downto 0);
         nrs2 : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal cwp : std_logic := '0';

 	--Outputs
   signal nrd : std_logic_vector(5 downto 0);
   signal nrs1 : std_logic_vector(5 downto 0);
   signal nrs2 : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WindowsManager PORT MAP (
          rd => rd,
          rs1 => rs1,
          rs2 => rs2,
          cwp => cwp,
          nrd => nrd,
          nrs1 => nrs1,
          nrs2 => nrs2
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      cwp<='0';
		wait for 10 ns;	
			rs1 <= "00000";
			rs2 <= "11111";
			rd <=  "11001";
		wait for 10 ns;
			rs1 <= "01100";
			rs2 <= "10011";
			rd <=  "11101";
		wait for 10 ns;	
			rs1 <= "01100";
			rs2 <= "10010";
			rd <=  "11000";
		wait for 10 ns;
			rs1 <= "00111";
			rs2 <= "11011";
			rd <=  "11101";
			
		cwp<='1';
		wait for 10 ns;	
			rs1 <= "00000";
			rs2 <= "11111";
			rd <=  "11001";
		wait for 10 ns;
			rs1 <= "01100";
			rs2 <= "10011";
			rd <=  "11101";
		wait for 10 ns;	
			rs1 <= "01100";
			rs2 <= "10010";
			rd <=  "11000";
		wait for 10 ns;
			rs1 <= "00111";
			rs2 <= "11011";
			rd <=  "11101";
			
		wait;
   end process;

END;
