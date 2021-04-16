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
			  LOAD : in STD_LOGIC; -- '1' -> load
			  SENS : in STD_LOGIC; -- '1' -> incrément
           --pOUT : out  STD_LOGIC_VECTOR (31 downto 0);
			  Aout : out STD_LOGIC_VECTOR (7 downto 0);
			  OPout : out STD_LOGIC_VECTOR (7 downto 0);
			  Bout : out STD_LOGIC_VECTOR (7 downto 0);
			  Cout : out STD_LOGIC_VECTOR (7 downto 0));
end Memoire_Instructions;

architecture Behavioral of Memoire_Instructions is
	type memoire is array (0 to 255) of STD_LOGIC_VECTOR(31 downto 0);
	signal mem : memoire:=(
		0=>"00000110"&"00000000"&"00000011"&"00000000",	
		1=>"00000100"&"00000001"&"00000011"&"00000000",
		others=>(others=>'0'));
	signal pOUT : STD_LOGIC_VECTOR (31 downto 0);
	signal compteur : STD_LOGIC_VECTOR (7 downto 0) :=(others=>'0');
begin
	 pOUT <= mem(TO_INTEGER(UNSIGNED(compteur)));
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
                if(LOAD='1') then        --Chargement de DIN
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

