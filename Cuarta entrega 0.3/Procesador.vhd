
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
		CARRY : IN std_logic; 
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
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
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

COMPONENT Psr
	PORT ( 
			  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  ncwp : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           carry_psr : out  STD_LOGIC;
			  cwp : out STD_LOGIC);
	END COMPONENT;
	
COMPONENT PSRModifier
	PORT (  aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           operando1 : in  STD_LOGIC;
           operando2 : in  STD_LOGIC;
           aluOp : in  STD_LOGIC_VECTOR (5 downto 0);
			  nzvc : out std_logic_vector(3 downto 0));
	END COMPONENT;
	
COMPONENT WindowsManager
	PORT (  rd : in  STD_LOGIC_VECTOR (4 downto 0);
           rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
			  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC;
			  ncwp : out  STD_LOGIC;
           nrd : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0));
	END COMPONENT;
	
signal out_im, out_npc, out_pc,out_sum, out_crs1, out_crs2,out_aluSign, out_mux, out_signEU: std_logic_vector (31 downto 0):= x"00000000";
signal out_cu,nrs1s,nrs2s,nrds: std_logic_vector (5 downto 0):= "000000";
signal out_psr,ncwp_wm,cwp_psr: std_logic;
signal out_PSRModifier: std_logic_vector (3 downto 0);

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
		rs1 => nrs1s,
		rs2 =>nrs2s ,
		rd => nrds,
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

	Inst_Psr: Psr PORT MAP(
		clk => clk,
      rst => rst,
      nzvc => out_PSRModifier,
      carry_psr => out_psr,
		cwp=>ncwp_wm, 
		ncwp=>cwp_psr
	);
	

	Inst_ALU: ALU PORT MAP(
		ALUOP => out_cu,
		CRS1 => out_crs1,
		CRS2 => out_mux,
		CARRY => out_psr,
		ALURESULT => out_aluSign 
	);
	

	Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult => out_aluSign,
      operando1 => out_crs1(31),
      operando2 => out_mux(31),
      aluOp => out_cu,
		nzvc => out_PSRModifier
	);
	
	

	Inst_WindowsManager : WindowsManager PORT MAP (
    rd=>out_im(29 downto 25), 
    rs1 => out_im(18 downto 14),
	 rs2 => out_im(4 downto 0), 
    op => out_im(31 downto 30) ,
	 op3 => out_im(24 downto 19),
    cwp=>ncwp_wm, 
    ncwp=>cwp_psr, 
    nrd=>nrds, 
    nrs1=>nrs1s, 
    nrs2=>nrs2s
    );

alu_result<=out_aluSign;


end Behavioral;

