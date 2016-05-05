
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity Procesador is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           alu_result : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador;

architecture Behavioral of Procesador is

COMPONENT ALU
	PORT(
		ALUOP : IN std_logic_vector(5 downto 0);
		CRS1 : IN std_logic_vector(31 downto 0);
		CRS2 : IN std_logic_vector(31 downto 0);          
		ALURESULT : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT PC
	PORT(
		clk_pc : IN std_logic;
		in_pc : IN std_logic_vector(31 downto 0);
		rst_pc : IN std_logic;          
		out_pc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT instructionMemory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT RF
	PORT(
		rst_rf : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		out_alu : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT UC
	PORT(
		OP : IN std_logic_vector(1 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);          
		ALUOP : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

COMPONENT sum
	PORT(
		in_sum : IN std_logic_vector(31 downto 0);          
		out_sum : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SingEU
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT mux
	PORT(
		crs2 : IN std_logic_vector(31 downto 0);
		imm32 : IN std_logic_vector(31 downto 0);
		i : IN std_logic;          
		operando_alu : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal out_im, out_npc, out_pc,out_sum, out_crs1, out_crs2,out_aluSign, out_mux, out_signEU: std_logic_vector (31 downto 0):= x"00000000";
signal out_cu: std_logic_vector (5 downto 0):= "000000";

begin

	Inst_nPC: PC PORT MAP(
		clk_pc => clk,
		out_pc => out_npc,
		in_pc => out_sum,
		rst_pc => rst
	);

	Inst_PC: PC PORT MAP(
		clk_pc => clk,
		out_pc => out_pc,
		in_pc => out_npc,
		rst_pc => rst
	);
	
	Inst_sum: sum PORT MAP(
		in_sum => out_npc,
		out_sum => out_sum
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => out_pc,
		reset => rst ,
		outInstruction => out_im
	);
	
	Inst_UC: UC PORT MAP(
		OP => out_im(31 downto 30) ,
		OP3 => out_im(24 downto 19),
		ALUOP => out_cu
	);
	
	Inst_RF: RF PORT MAP(
		rst_rf => rst ,
		rs1 => out_im(18 downto 14),
		rs2 => out_im(4 downto 0),
		rd => out_im(29 downto 25),
		out_alu => out_aluSign,
		crs1 => out_crs1,
		crs2 => out_crs2
	);
	

	Inst_SingEU: SingEU PORT MAP(
		imm13 => out_im(12 downto 0),
		imm32 => out_signEU
	);
	
	
	Inst_mux: mux PORT MAP(
		crs2 => out_crs2,
		imm32 => out_signEU,
		i => out_im(13),
		operando_alu => out_mux
	);



	Inst_ALU: ALU PORT MAP(
		ALUOP => out_cu,
		CRS1 => out_crs1,
		CRS2 => out_mux,
		ALURESULT => out_aluSign 
	);
	
	alu_result<=out_aluSign;





end Behavioral;

