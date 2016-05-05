
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY Procesador_tb IS
END Procesador_tb;
 
ARCHITECTURE behavior OF Procesador_tb IS 
 

 
    COMPONENT Procesador
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         alu_result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal alu_result : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador PORT MAP (
          clk => clk,
          rst => rst,
          alu_result => alu_result
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst<='1';
      wait for 10 ns;	
		rst<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
