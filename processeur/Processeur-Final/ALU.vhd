----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:23:00 04/13/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

	signal ADD : STD_LOGIC_VECTOR(8 downto 0):=(others=>'0');
	signal SUB : STD_LOGIC_VECTOR(8 downto 0):=(others=>'0');
	signal MUL : STD_LOGIC_VECTOR(15 downto 0):=(others=>'0');
	signal S9 : STD_LOGIC_VECTOR(8 downto 0):=(others=>'0');
	signal EQU : STD_LOGIC_VECTOR(8 downto 0):=(others=>'0');
	signal SUP : STD_LOGIC_VECTOR(8 downto 0):=(others=>'0');
	signal INF : STD_LOGIC_VECTOR(8 downto 0):=(others=>'0');


begin
	
	ADD <= ('0'&A)+('0'&B);
	SUB <= ('0'&A)-('0'&B);
	MUL <= A * B;
	EQU <= "000000001" when A=B
			else "000000000";
	SUP <= "000000001" when A>B
			else "000000000";
	INF <= "000000001" when A<B
			else "000000000";
	
	S9 <= ADD when (Ctrl_Alu="001") else
			MUL(8 downto 0) when (Ctrl_Alu="010") else
			SUB when (Ctrl_Alu="011") else 
			INF when (Ctrl_Alu="100") else 
			SUP when (Ctrl_Alu="101") else 
			EQU when (Ctrl_Alu="110") else 
			"000000000";
			
	S <= S9(7 downto 0);
	N <= S9(7);
	O <= '1' when MUL(15 downto 8)/="00000000" else '0';
	Z <= '1' when S9="000000000" else '0';
	C <= S9(8);

end Behavioral;

