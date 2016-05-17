
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
		wE : in  STD_LOGIC;
		datToReg : IN std_logic_vector(31 downto 0);          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0);
		crd : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

COMPONENT UC
	PORT(
		OP : in  STD_LOGIC_VECTOR (1 downto 0);  
	   OP2 : in  STD_LOGIC_VECTOR (2 downto 0); 
	   OP3 : in  STD_LOGIC_VECTOR (5 downto 0); 
	   nzvc : in STD_LOGIC_VECTOR (3 downto 0); 
	   cond : in STD_LOGIC_VECTOR (3 downto 0); 
	   PCSource : out  STD_LOGIC_VECTOR (1 downto 0);
	   ALUOP : out  STD_LOGIC_VECTOR (5 downto 0); 
	   RFdest : out  STD_LOGIC:='0'; 
	   wE : out  STD_LOGIC:='0';	  
	   wERF : out  STD_LOGIC:='0';	  
	   Habilita : out  STD_LOGIC:='0'; 
	   RFsource : out  STD_LOGIC_VECTOR (1 downto 0)); 
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
			  icc : out STD_LOGIC_VECTOR (3 downto 0);
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

COMPONENT muxForCall
	PORT(
		rd : IN std_logic_vector(5 downto 0);
		RFDest : IN std_logic;          
		nRd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
COMPONENT DataMemory
	PORT(
		clk : IN std_logic;
		habilita : IN std_logic;
		rst : IN std_logic;
		crd : IN std_logic_vector(31 downto 0);
		address : IN std_logic_vector(31 downto 0);
		wE : IN std_logic;          
		datmemor : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT mux2
	PORT(
		datmemor : IN std_logic_vector(31 downto 0);
		alu_out : IN std_logic_vector(31 downto 0);
		PC : IN  STD_LOGIC_VECTOR (31 downto 0);
		RFsource : IN std_logic_vector(1 downto 0);          
		datReg : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Adder
	PORT(
		Operando1 : IN std_logic_vector(31 downto 0);
		Operando2 : IN std_logic_vector(31 downto 0);          
		Resultado : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT MuxPcSource
	PORT(
		PC4 : IN std_logic_vector(31 downto 0);
		PCDisp22 : IN std_logic_vector(31 downto 0);
		PCDisp30 : IN std_logic_vector(31 downto 0);
		PCAdress : IN std_logic_vector(31 downto 0);
		PCSource : IN std_logic_vector(1 downto 0);          
		PCAdressOut : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SingEU22
	PORT(
		imm22 : IN std_logic_vector(21 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT SingEU30
	PORT(
		imm30 : IN std_logic_vector(29 downto 0);          
		imm32 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
signal nPc_to_Pc, MuxPcSource_to_nPc, Pc_to_IM, sum_to_muxPcsource:std_logic_vector (31 downto 0):= x"00000000";
signal adder2_to_MuxPcSource,adder1_to_MuxPcSource,Out_Im,Mux2_to_RF, signal_crs1, signal_crs2,signal_crd :std_logic_vector (31 downto 0):= x"00000000";
signal SignEU30_to_adder1,SignEU22_to_adder2,DM_to_mux2,alu_out,signEU13_to_mux, mux_to_ALU :std_logic_vector (31 downto 0):= x"00000000";
signal Signal_aluop, signal_rd, signal_rs1, signal_rs2,nrd: std_logic_vector (5 downto 0):= "000000";
signal HabilitMemory,psr_to_wm, wm_to_psr,UC_to_muxforcall,UC_to_RF,Psr_to_ALU, UC_TO_DM: std_logic;
signal Mpsr_to_psr, psr_to_UC: std_logic_vector (3 downto 0);
signal UC_to_MuxPcSource: STD_LOGIC_VECTOR (1 downto 0);
signal UC_to_mux2: std_logic_vector(1 downto 0);

begin

	Inst_nPC: PC PORT MAP(
		clk_pc => clk,
		out_pc => nPc_to_Pc,
		in_pc => MuxPcSource_to_nPc,
		rst_pc => rst
	);

	Inst_PC: PC PORT MAP(
		clk_pc => clk,
		out_pc => Pc_to_IM,
		in_pc => nPc_to_Pc,
		rst_pc => rst
	);
	
	Inst_sum: sum PORT MAP(					--Sumador nPC + 1
		in_sum => nPc_to_Pc,
		out_sum => sum_to_muxPcsource
	);
	
	Inst_instructionMemory: instructionMemory PORT MAP(
		address => Pc_to_IM,
		reset =>  rst,
		outInstruction => Out_Im
	);
	
	Inst_WindowsManager : WindowsManager PORT MAP (
    rd=> Out_Im(29 downto 25), 
    rs1 => Out_Im(18 downto 14),
	 rs2 => Out_Im(4 downto 0), 
    op => Out_Im(31 downto 30),
	 op3 => Out_Im(24 downto 19),
    cwp=> psr_to_wm, 
    ncwp=> wm_to_psr, 
    nrd=> signal_rd, 
    nrs1=> signal_rs1, 
    nrs2=>signal_rs2
    );
	 
	Inst_muxForCall: muxForCall PORT MAP(
		rd => signal_rd,
		RFDest => UC_to_muxforcall,
		nRd => nrd
	);
	
	Inst_UC: UC PORT MAP(
		OP => Out_Im(31 downto 30) ,
		OP2 => Out_Im(24 downto 22),
		OP3 => Out_Im(24 downto 19),
		nzvc => psr_to_UC,
		cond => Out_Im(28 downto 25),
		PCSource =>UC_to_MuxPcSource ,
		ALUOP => Signal_aluop,
		RFdest => UC_to_muxforcall,
		wE => UC_TO_DM,
		wERF => UC_to_RF,
		Habilita =>HabilitMemory,
		RFsource => UC_to_mux2
	);
	
	Inst_RF: RF PORT MAP(
		rst_rf =>rst ,
		rs1 => signal_rs1,
		rs2 => signal_rs2,
		rd => nrd,
		wE=> UC_to_RF,
		datToReg => Mux2_to_RF,
		crs1 => signal_crs1,
		crs2 => signal_crs2,
		crd => signal_crd
	);
	

	Inst_SingEU: SingEU PORT MAP(				--Unidad de extención de signo 13=>32
		imm13 => Out_Im(12 downto 0),
		imm32 => signEU13_to_mux
	);
	
	
	Inst_mux: mux PORT MAP(       --Multiplexor Crs2
		crs2 => signal_crs2,
		imm32 => signEU13_to_mux,
		i => Out_Im(13),
		operando_alu =>mux_to_ALU 
	);

	Inst_Psr: Psr PORT MAP(
		clk => clk,
      rst => rst,
      nzvc => Mpsr_to_psr,
      carry_psr => Psr_to_ALU,
		icc => psr_to_UC,
		cwp=> psr_to_wm, 
		ncwp=>wm_to_psr
	);
	

	Inst_ALU: ALU PORT MAP(
		ALUOP => Signal_aluop,
		CRS1 => signal_crs1,
		CRS2 => mux_to_ALU,
		CARRY => Psr_to_ALU,
		ALURESULT => alu_out  
	);
	

	Inst_PSRModifier: PSRModifier PORT MAP(
		aluResult =>alu_out ,
      operando1 => signal_crs1(31),
      operando2 =>mux_to_ALU(31) ,
      aluOp => Signal_aluop,
		nzvc => Mpsr_to_psr
	);
	
	

	 
	Inst_DataMemory: DataMemory PORT MAP(
		clk =>clk ,
		habilita => HabilitMemory ,
		rst => rst,
		crd =>signal_crd ,
		address => alu_out,
		wE => UC_TO_DM,
		datmemor =>DM_to_mux2 
	);
	


	Inst_mux2: mux2 PORT MAP(      --Multiplexor registro destino
		datmemor => DM_to_mux2,
		alu_out =>alu_out ,
		PC => Pc_to_IM,
		RFsource => UC_to_mux2,
		datReg =>Mux2_to_RF 
	);
	
	Inst_Adder1: Adder PORT MAP(   --Sumador para call
		Operando1 => SignEU30_to_adder1,
		Operando2 => Pc_to_IM,
		Resultado => adder1_to_MuxPcSource
	);
	
	Inst_Adder2: Adder PORT MAP(   --Sumador para branch
		Operando1 => Pc_to_IM,
		Operando2 => SignEU30_to_adder1,
		Resultado =>adder2_to_MuxPcSource 
	);
	
	Inst_MuxPcSource: MuxPcSource PORT MAP(   --Multiplexor nPC
		PC4 => sum_to_muxPcsource,
		PCDisp22 => adder2_to_MuxPcSource,
		PCDisp30 => adder1_to_MuxPcSource,
		PCAdress => alu_out,
		PCSource => UC_to_MuxPcSource,
		PCAdressOut => MuxPcSource_to_nPc
	);
	
	Inst_SingEU22: SingEU22 PORT MAP(		--Unidad de extensión de 22 bits
		imm22 => Out_Im(21 downto 0),
		imm32 => SignEU22_to_adder2
	);
	
	Inst_SingEU30: SingEU30 PORT MAP(		--Unidad de extensión de 30 bits
		imm30 => Out_Im(29 downto 0),
		imm32 => SignEU30_to_adder1
	);

alu_result<=Mux2_to_RF;



end Behavioral;

