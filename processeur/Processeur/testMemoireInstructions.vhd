--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:52:16 04/16/2021
-- Design Name:   
-- Module Name:   /home/hok/4A/PSI/4a-projet-sys-info/processeur/Processeur/testMemoireInstructions.vhd
-- Project Name:  Processeur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Memoire_Instructions
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
 
ENTITY testMemoireInstructions IS
END testMemoireInstructions;
 
ARCHITECTURE behavior OF testMemoireInstructions IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Memoire_Instructions
    PORT(
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
    END COMPONENT;
    

   --Inputs
   signal DIN : std_logic_vector(7 downto 0) := (others => '0');
   signal CK : std_logic := '0';
   signal RST : std_logic := '1'; -- '0' -> Reset
   signal EN : std_logic := '0'; -- '0' -> Actif
   signal LOAD : std_logic := '0'; -- '1' -> load
   signal SENS : std_logic := '1'; -- '1' -> incrément

 	--Outputs
   signal Aout : std_logic_vector(7 downto 0);
   signal OPout : std_logic_vector(7 downto 0);
   signal Bout : std_logic_vector(7 downto 0);
   signal Cout : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant CK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Memoire_Instructions PORT MAP (
          DIN => DIN,
          CK => CK,
          RST => RST,
          EN => EN,
          LOAD => LOAD,
          SENS => SENS,
          Aout => Aout,
          OPout => OPout,
          Bout => Bout,
          Cout => Cout
        );

   -- Clock process definitions
   CK_process :process
   begin
		CK <= '0';
		wait for CK_period/2;
		CK <= '1';
		wait for CK_period/2;
   end process;
 

END;
