----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:43:51 04/16/2021 
-- Design Name: 
-- Module Name:    Chemin_Donnees - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Chemin_Donnees is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           pOUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Chemin_Donnees;

architecture Behavioral of Chemin_Donnees is

	component Memoire_Instructions is
		Port (
         DIN : IN  std_logic_vector(7 downto 0);
         CK : IN  std_logic;
         RST : IN  std_logic;
         EN : IN  std_logic;
         LOAD : IN  std_logic;
         SENS : IN  std_logic;
         Aout : OUT  std_logic_vector(7 downto 0);
         OPout : OUT  std_logic_vector(7 downto 0);
         Bout : OUT  std_logic_vector(7 downto 0);
         Cout : OUT  std_logic_vector(7 downto 0)
        );
	end component;
	
	component Etage_Pipeline is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           OP : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           Aout : out  STD_LOGIC_VECTOR (7 downto 0);
           OPout : out  STD_LOGIC_VECTOR (7 downto 0);
           Bout : out  STD_LOGIC_VECTOR (7 downto 0);
           Cout : out  STD_LOGIC_VECTOR (7 downto 0);
			  CLK : in STD_LOGIC);
	end component;
	
	component ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC);
	end component;
	
	component Banc_Registres is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           aW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	component Memoire_Donnees is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           pIN : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           pOUT : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
-- Signaux vides pour l'instant
	
	signal null1 : STD_LOGIC := '0';
	signal null11 : STD_LOGIC := '0';
	signal null12 : STD_LOGIC := '0';
	signal null13 : STD_LOGIC := '0';
	signal null14 : STD_LOGIC := '0';
	signal null8 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null89 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8A : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8B : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8C : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8D : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8E : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8F : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8G : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');

-- Constantes

	constant NOP   : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	constant ADD   : STD_LOGIC_VECTOR(7 downto 0):="00000001";
	constant MUL   : STD_LOGIC_VECTOR(7 downto 0):="00000010";
	constant SOU   : STD_LOGIC_VECTOR(7 downto 0):="00000011";
	constant DIV   : STD_LOGIC_VECTOR(7 downto 0):="00000100";
	constant COP   : STD_LOGIC_VECTOR(7 downto 0):="00000101";
	constant AFC   : STD_LOGIC_VECTOR(7 downto 0):="00000110";
	constant LOAD  : STD_LOGIC_VECTOR(7 downto 0):="00000111";
	constant STORE : STD_LOGIC_VECTOR(7 downto 0):="00001000";
	
-- General

	signal bulle : STD_LOGIC := '0';
	
-- Etage 1

	signal a_etage1 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal op_etage1 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal b_etage1 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal c_etage1 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	
-- Etage 2

	signal a_etage2 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal op_etage2 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal b_etage2 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal c_etage2 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal QAout : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal QBout : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal mux_out_etage2 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
-- Etage 3

	signal a_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal op_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal b_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal c_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal mux_out_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal S_UAL_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
-- Etage 4

	signal a_etage4 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal op_etage4 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal b_etage4 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal c_etage4 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	
-- Etage 5

	signal a_etage5 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal op_etage5 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal b_etage5 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal c_etage5 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal lc_etage5 : STD_LOGIC := '0';
	
begin

-- Etage 1

	MemInstruction : Memoire_Instructions PORT MAP(
		DIN => null8,
		LOAD => '0',
		SENS => '1',
      CK => CLK,
      RST => RST,
		EN => bulle,
		Aout => a_etage1,
		OPout => op_etage1,
		Bout => b_etage1,
		Cout => c_etage1
	); 
	
	LIDI : Etage_Pipeline PORT MAP(
		A => a_etage1,
		OP => op_etage1,
		B => b_etage1,
		C => c_etage1,
		Aout => a_etage2,
		OPout => op_etage2,
		Bout => b_etage2,
		Cout => c_etage2,
		CLK => CLK
	);
	
-- Etage 2
	
	BancRegistre : Banc_Registres PORT MAP (
		 A => b_etage1(3 downto 0),
		 B => c_etage2(3 downto 0),
		 aW => a_etage5(3 downto 0),
		 W => lc_etage5,
		 DATA => b_etage5,
		 RST => RST,
		 CLK => CLK,
		 QA => QAout,
		 QB => QBout
	  );
	  
	lc_etage5 <= '1' when op_etage5=AFC or op_etage5=COP or op_etage5=ADD or op_etage5=MUL or op_etage5=SOU-- AFC or COP or ADD or SOU or MUL
				else '0'; 
	
	mux_out_etage2 <= QAout when op_etage2=COP --COP
				else b_etage2; 
				
	bulle <= '1' when bulle='0' and (op_etage1=AFC or op_etage1=COP or op_etage1=ADD or op_etage1=MUL or op_etage1=SOU) and rising_edge(CLK)--AFC or COP or ADD or SOU or MUL
				else '0' when bulle='1' and (op_etage4=AFC or op_etage4=COP or op_etage4=ADD or op_etage4=MUL or op_etage4=SOU) and rising_edge(CLK) --AFC or COP or ADD or SOU or MUL
				else bulle;
	
	DIEX : Etage_Pipeline PORT MAP(
		A => a_etage2,
		OP => op_etage2,
		B => mux_out_etage2,
		C => QBout,
		Aout => a_etage3,
		OPout => op_etage3,
		Bout => b_etage3,
		Cout => c_etage3,
		CLK => CLK
	);
	
-- Etage 3

	UAL : ALU PORT MAP (
	 A => b_etage3,
	 B => c_etage3,
	 Ctrl_Alu => op_etage3(2 downto 0), --LC_etage3
	 S => S_UAL_etage3,
	 N => null1,
	 O => null11,
	 Z => null12,
	 C => null13
  );
  
  
  mux_out_etage3 <= S_UAL_etage3 when op_etage3=ADD or op_etage3=MUL or op_etage3=SOU --ADD SOU MUL (DIV)
				else b_etage3; 

	EXMEM : Etage_Pipeline PORT MAP(
		A => a_etage3,
		OP => op_etage3,
		B => mux_out_etage3,
		C => null89,
		Aout => a_etage4,
		OPout => op_etage4,
		Bout => b_etage4,
		Cout => null8A,
		CLK => CLK
	);
	
-- Etage 4

	MemDonnees : Memoire_Donnees PORT MAP (
		 addr => null8B,
		 pIN => null8C,
		 RW => null14,
		 RST => RST,
		 CLK => CLK,
		 pOUT => null8D
	  );
	
	MEMRE : Etage_Pipeline PORT MAP(
		A => a_etage4,
		OP => op_etage4,
		B => b_etage4,
		C => null8E,
		Aout => a_etage5,
		OPout => op_etage5,
		Bout => b_etage5,
		Cout => null8F,
		CLK => CLK
	);

-- Etage 5
	
	pOUT <= null8G;


end Behavioral;

