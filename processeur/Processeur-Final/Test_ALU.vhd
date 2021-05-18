--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:45:47 04/13/2021
-- Design Name:   
-- Module Name:   /home/hok/4A/PSI/4a-projet-sys-info/processeur/ALU/Test_ALU.vhd
-- Project Name:  ALU
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Test_ALU IS
END Test_ALU;
 
ARCHITECTURE behavior OF Test_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant Clk_period : time := 10 ns;
	signal Clk : std_logic:='0';
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          A => A,
          B => B,
          Ctrl_Alu => Ctrl_Alu,
          S => S,
          N => N,
          O => O,
          Z => Z,
          C => C
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for Clk_period*10;

		A <= std_logic_vector(to_unsigned(16,8)); wait for Clk_period;
		B <= std_logic_vector(to_unsigned(4,8)); wait for Clk_period;
		Ctrl_Alu <= "001"; wait for Clk_period;
		Ctrl_Alu <= "011"; wait for Clk_period;
		Ctrl_Alu <= "010";
		
		A <= std_logic_vector(to_unsigned(4,8)); wait for Clk_period;
		B <= std_logic_vector(to_unsigned(16,8)); wait for Clk_period;
		Ctrl_Alu <= "011"; wait for Clk_period;
		
		A <= std_logic_vector(to_unsigned(4,8)); wait for Clk_period;
		B <= std_logic_vector(to_unsigned(4,8)); wait for Clk_period;
		Ctrl_Alu <= "011"; wait for Clk_period;
		
		A <= std_logic_vector(to_unsigned(255,8)); wait for Clk_period;
		B <= std_logic_vector(to_unsigned(4,8)); wait for Clk_period;
		Ctrl_Alu <= "001"; wait for Clk_period;
		Ctrl_Alu <= "010";

      wait;
   end process;

END;
