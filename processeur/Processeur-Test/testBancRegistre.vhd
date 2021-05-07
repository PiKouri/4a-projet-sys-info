--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:51:44 04/13/2021
-- Design Name:   
-- Module Name:   /home/hok/4A/PSI/4a-projet-sys-info/processeur/Processeur/testBancRegistre.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Banc_Registres
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
--USE ieee.numeric_std.ALL;
 
ENTITY testBancRegistre IS
END testBancRegistre;
 
ARCHITECTURE behavior OF testBancRegistre IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Banc_Registres
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         aW : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal aW : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '1';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Banc_Registres PORT MAP (
          A => A,
          B => B,
          aW => aW,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
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
		
		DATA<="01100110";
		W<='1';wait for CLK_period;
		DATA<="00000001";
		aW<="0010";wait for CLK_period;
		
		A<="0010";wait for CLK_period;
		
		DATA<="00000111";wait for CLK_period*3;
		aW<="0100";wait for CLK_period;
		B<="0100";wait for CLK_period;
		W<='0';
		RST<='0';wait for CLK_period*2;
		RST<='1';wait for CLK_period;
		
		
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
