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
			  CLK : in STD_LOGIC;
			  Bulle : in STD_LOGIC);
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
	signal null81 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null82 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null83 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null84 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null85 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null86 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null87 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null88 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null89 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8A : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8B : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8C : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8D : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8E : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8F : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal null8G : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	
	signal null3 : STD_LOGIC_VECTOR(2 downto 0) := (others=>'0');
	signal null4 : STD_LOGIC_VECTOR(3 downto 0) := (others=>'0');
	
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
	
-- Etage 3

	signal a_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal op_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal b_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	signal c_etage3 : STD_LOGIC_VECTOR(7 downto 0) := (others=>'0');
	
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
		Cout => null81,
		CLK => CLK,
		Bulle => bulle
	);
	
-- Etage 2
	
	BancRegistre : Banc_Registres PORT MAP (
		 A => null4,
		 B => null4,
		 aW => a_etage5(3 downto 0),
		 W => lc_etage5,
		 DATA => b_etage5,
		 RST => RST,
		 CLK => CLK,
		 QA => null82,
		 QB => null83
	  );
	  
	lc_etage5 <= '1' when op_etage5="00000110" 
				else '0'; -- AFC

	DIEX : Etage_Pipeline PORT MAP(
		A => a_etage2,
		OP => op_etage2,
		B => b_etage2,
		C => null84,
		Aout => a_etage3,
		OPout => op_etage3,
		Bout => b_etage3,
		Cout => null85,
		CLK => CLK,
		Bulle => bulle	
	);
	
-- Etage 3

	UAL : ALU PORT MAP (
	 A => null86,
	 B => null87,
	 Ctrl_Alu => null3,
	 S => null88,
	 N => null1,
	 O => null11,
	 Z => null12,
	 C => null13
  );

	EXMEM : Etage_Pipeline PORT MAP(
		A => a_etage3,
		OP => op_etage3,
		B => b_etage3,
		C => null89,
		Aout => a_etage4,
		OPout => op_etage4,
		Bout => b_etage4,
		Cout => null8A,
		CLK => CLK,
		Bulle => bulle	
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
		CLK => CLK,
		Bulle => bulle	
	);

-- Etage 5
	
	pOUT <= null8G;


end Behavioral;

