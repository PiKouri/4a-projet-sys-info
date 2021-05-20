----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:37:14 04/16/2021 
-- Design Name: 
-- Module Name:    Memoire_Instructions - Behavioral 
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

entity Memoire_Instructions is
    Port ( DIN : in  STD_LOGIC_VECTOR (7 downto 0);
           CK : in  STD_LOGIC;
			  RST : in STD_LOGIC; -- '0' -> Reset
			  EN : in STD_LOGIC; -- '0' -> Actif
			  pLOAD : in STD_LOGIC; -- '1' -> load
			  SENS : in STD_LOGIC; -- '1' -> incrément
           --pOUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  Aout : out STD_LOGIC_VECTOR (7 downto 0);
			  OPout : out STD_LOGIC_VECTOR (7 downto 0);
			  Bout : out STD_LOGIC_VECTOR (7 downto 0);
			  Cout : out STD_LOGIC_VECTOR (7 downto 0));
end Memoire_Instructions;

architecture Behavioral of Memoire_Instructions is

	-- Constantes

	constant NOP   : STD_LOGIC_VECTOR(7 downto 0):="00000000";
	constant ADD   : STD_LOGIC_VECTOR(7 downto 0):="00000001";
	constant MUL   : STD_LOGIC_VECTOR(7 downto 0):="00000010";
	constant SOU   : STD_LOGIC_VECTOR(7 downto 0):="00000011";
	constant INF	: STD_LOGIC_VECTOR(7 downto 0):="00000100";
	constant SUP	: STD_LOGIC_VECTOR(7 downto 0):="00000101";
	constant EQU	: STD_LOGIC_VECTOR(7 downto 0):="00000110";
	
	constant DIV   : STD_LOGIC_VECTOR(7 downto 0):="00000111";
	constant COP   : STD_LOGIC_VECTOR(7 downto 0):="00001000";
	constant AFC   : STD_LOGIC_VECTOR(7 downto 0):="00001001";
	constant LOAD  : STD_LOGIC_VECTOR(7 downto 0):="00001010";
	constant STORE : STD_LOGIC_VECTOR(7 downto 0):="00001011";
	
	constant PRINT : STD_LOGIC_VECTOR(7 downto 0):="00001100";
	constant JMP 	: STD_LOGIC_VECTOR(7 downto 0):="00001101";
	constant JMF 	: STD_LOGIC_VECTOR(7 downto 0):="00001110";

	type memoire is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
	signal mem : memoire:=(
		0=>AFC &"00000000"&"00000011"&"00000000",	--AFC 0 3
		1=>ADD &"00000011"&"00000000"&"00000000", --COP 3 0
		2=>SOU &"00000010"&"00000011"&"00000000",	--ADD 2 3 0 (=6)
		3=>AFC &"00000100"&"00001100"&"00000000",	--AFC 4 12
		4=>SOU &"00000101"&"00000100"&"00000000",	--SOU 5 4 0 (=9)
		5=>MUL &"00000110"&"00000101"&"00000000",	--MUL 6 5 0 (=27)
		6=>STORE &"00001110"&"00000101"&"00000000",	--STORE 14 5 0 (9)
		7=>LOAD &"00001111"&"00001110"&"00000000",	--LOAD 15 14 0 (9)
		8=>PRINT &"00000000"&"00000110"&"00000000",	--PRINT 0 6 0 (27)
		9=>SUP &"00000000"&"00000110"&"00000100",	--SUP 0 6 4 (1)
		10=>PRINT &"00000000"&"00000000"&"00000000",	--PRINT 0 0 0 (1)
		11=>INF &"00000000"&"00000110"&"00000100",	--INF 0 6 4 (0)
		12=>PRINT &"00000000"&"00000000"&"00000000",	--PRINT 0 0 0 (0)
		13=>EQU &"00000000"&"00001000"&"00001001",	--EQU 0 8 9 (1)
		14=>PRINT &"00000000"&"00000000"&"00000000",	--PRINT 0 0 0 (1)
		15 =>JMF &"00000100"&"00000001"&"00000000",	--JMF 4 1 0 (should not jump)
		16 =>JMF &"00000011"&"00000000"&"00000000",	--JMF 3 0 0 (should jump)
		17 =>JMP &"00000001"&"00000000"&"00000000",	--JMP 1 0 0 (Commenter les lignes 15 et 16 pour tester JMP)
		-- 0=>"00001001000000110000000000000000",
		-- 1=>"00001000000000100000001100000000",
		-- 2=>"00001001000001000000000100000000",
		-- 3=>"00001000000000110000010000000000",
		-- 4=>"00001001000001110010010000000000",
		-- 5=>"00001000000001100000011100000000",
		-- 6=>"00001001000010000011110000000000",
		-- 7=>"00001000000001110000100000000000",
		-- 8=>"00001001000010010000110000000000",
		-- 9=>"00001000000010000000100100000000",
		-- 10=>"00001000000010010000011000000000",
		-- 11=>"00001000000010100000011100000000",
		-- 12=>"00000100000010010000100100001010",
		-- 13=>"00001110000100110000100100000000",
		-- 14=>"00001000000010010000011000000000",
		-- 15=>"00001000000000000000100100000000",
		-- 16=>"00001000000010010000011100000000",
		-- 17=>"00001000000000010000100100000000",
		-- 18=>"00001101000101110000000000000000",
		-- 19=>"00001000000010010000011100000000",
		-- 20=>"00001000000000000000100100000000",
		-- 21=>"00001000000010010000011000000000",
		-- 22=>"00001000000000010000100100000000",
		-- 23=>"00001001000010010000000100000000",
		-- 24=>"00001000000000100000100100000000",
		-- 25=>"00001000000010010000001000000000",
		-- 26=>"00001001000010100000000100000000",
		-- 27=>"00000011000010010000100100001010",
		-- 28=>"00001000000010100000000000000000",
		-- 29=>"00000100000010010000100100001010",
		-- 30=>"00001110010010000000100100000000",
		-- 31=>"00001000000010010000000000000000",
		-- 32=>"00001000000001000000100100000000",
		-- 33=>"00001000000010010000010000000000",
		-- 34=>"00001001000010100000000100000000",
		-- 35=>"00000001000010010000100100001010",
		-- 36=>"00001000000010100000001000000000",
		-- 37=>"00000101000010010000100100001010",
		-- 38=>"00001110001011000000100100000000",
		-- 39=>"00001000000010010000010000000000",
		-- 40=>"00001000000010100000001000000000",
		-- 41=>"00000011000010010000100100001010",
		-- 42=>"00001000000001000000100100000000",
		-- 43=>"00001101001000100000000000000000",
		-- 44=>"00001000000010010000000100000000",
		-- 45=>"00001000000001010000100100000000",
		-- 46=>"00001000000010010000010100000000",
		-- 47=>"00001001000010100000000100000000",
		-- 48=>"00000001000010010000100100001010",
		-- 49=>"00001000000010100000001000000000",
		-- 50=>"00000101000010010000100100001010",
		-- 51=>"00001110001110010000100100000000",
		-- 52=>"00001000000010010000010100000000",
		-- 53=>"00001000000010100000001000000000",
		-- 54=>"00000011000010010000100100001010",
		-- 55=>"00001000000001010000100100000000",
		-- 56=>"00001101001011110000000000000000",
		-- 57=>"00001000000010010000010000000000",
		-- 58=>"00001001000010100000000000000000",
		-- 59=>"00000110000010010000100100001010",
		-- 60=>"00001110010000110000100100000000",
		-- 61=>"00001000000010010000010100000000",
		-- 62=>"00001001000010100000000000000000",
		-- 63=>"00000110000010010000100100001010",
		-- 64=>"00001110010000110000100100000000",
		-- 65=>"00001000000010010000001000000000",
		-- 66=>"00001000000000110000100100000000",
		-- 67=>"00001000000010010000001000000000",
		-- 68=>"00001001000010100000000100000000",
		-- 69=>"00000001000010010000100100001010",
		-- 70=>"00001000000000100000100100000000",
		-- 71=>"00001101000110100000000000000000",
		-- 72=>"00001100000000000000100000000000",
		-- 73=>"00001100000000000000001100000000",

		others=>(others=>'0'));
	signal pOUT : STD_LOGIC_VECTOR (31 downto 0);
	signal compteur : STD_LOGIC_VECTOR (7 downto 0) :=(others=>'0');
begin
	 pOUT <= mem(TO_INTEGER(UNSIGNED(compteur))) when EN='0'
				else (others=>'0');
	 OPout <= pOUT(31 downto 24);
	 Aout <= pOUT(23 downto 16);
	 Bout <= pOUT(15 downto 8);
	 Cout <= pOUT(7 downto 0);
    -- Compteur Synchrone
    ps_compter : process (CK) is
    begin
        --Sur un front montant de la clock
        if rising_edge(CK) then
            if(RST = '0') then           --Remise à Zero
                compteur <= "00000000";
            else
                if(pLOAD='1') then        --Chargement de DIN
                    compteur <= DIN;
                else
                    if(EN='0') then      --Compteur actif
                        if(SENS='0') then --Décrémentation
									 if (compteur/="00000000") then
										compteur<=STD_LOGIC_VECTOR(UNSIGNED(compteur)-1);
									 end if;
                        else              --Incrémentation
									 if (compteur/="11111111") then
										compteur<=STD_LOGIC_VECTOR(UNSIGNED(compteur)+1);
									 end if;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process ps_compter;
end Behavioral;

