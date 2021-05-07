----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:05:43 04/13/2021 
-- Design Name: 
-- Module Name:    Memoire_Donnees - Behavioral 
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

entity Memoire_Donnees is
    Port ( addr : in  STD_LOGIC_VECTOR (7 downto 0);
           pIN : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           pOUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Memoire_Donnees;

architecture Behavioral of Memoire_Donnees is
	
	type memoire is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal mem : memoire:=(others=>(others=>'0'));
begin
	pOUT<=mem(TO_INTEGER(UNSIGNED(addr))) when rising_edge(CLK) and RW='1';
	
	ps_write : process (CLK, RST, RW)
	begin
		if rising_edge(CLK) then
			if RST='0' then
				mem<=(others=>(others=>'0'));
			else
				if RW='0' then
					mem(TO_INTEGER(UNSIGNED(addr)))<=pIN;
				end if;
			end if;
		end if;
	end process;
	
	
end Behavioral;

