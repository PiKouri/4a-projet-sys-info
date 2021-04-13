--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:10:50 04/13/2021
-- Design Name:   
-- Module Name:   /home/hok/4A/PSI/4a-projet-sys-info/processeur/Processeur/testMemoireDonnees.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memoire_Donnees
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY testMemoireDonnees IS
END testMemoireDonnees;
 
ARCHITECTURE behavior OF testMemoireDonnees IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memoire_Donnees
    PORT(
         addr : IN  std_logic_vector(7 downto 0);
         pIN : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         pOUT : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal addr : std_logic_vector(7 downto 0) := (others => '0');
   signal pIN : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '1';
   signal RST : std_logic := '1';
   signal CLK : std_logic := '0';

 	--Outputs
   signal pOUT : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memoire_Donnees PORT MAP (
          addr => addr,
          pIN => pIN,
          RW => RW,
          RST => RST,
          CLK => CLK,
          pOUT => pOUT
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		pIN<="01100110";
		RW<='0';wait for CLK_period;
		RW<='1';wait for CLK_period;
		pIN<="00000001";
		addr<="00000010";wait for CLK_period;
		RW<='0';wait for CLK_period;
		RW<='1';wait for CLK_period;
		pIN<="00000111";wait for CLK_period*3;
		addr<="00000100";wait for CLK_period;
		RW<='0';wait for CLK_period;
		RW<='1';wait for CLK_period;
		
		RST<='0';wait for CLK_period*2;
		RST<='1';wait for CLK_period;
		
		
      wait for CLK_period*10;
      wait;
   end process;

END;
