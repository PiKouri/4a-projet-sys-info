----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:23:54 04/13/2021 
-- Design Name: 
-- Module Name:    Banc_Registres - Behavioral 
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

entity Banc_Registres is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           aW : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end Banc_Registres;


architecture Behavioral of Banc_Registres is

	type banc_registre is array (0 to 15) of STD_LOGIC_VECTOR(7 downto 0);
	signal br : banc_registre:=(others=>(others=>'0'));
begin
	QA<=br(TO_INTEGER(UNSIGNED(A))) when w='0' or aW/=A else DATA;
	QB<=br(TO_INTEGER(UNSIGNED(B)));
	
	ps_write : process (CLK, RST, W)
	begin
		if rising_edge(CLK) then
			if RST='0' then
				br<=(others=>(others=>'0'));
			else
				if W='1' then
					br(TO_INTEGER(UNSIGNED(aW)))<=DATA;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

