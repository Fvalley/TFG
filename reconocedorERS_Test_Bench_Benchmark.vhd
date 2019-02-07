--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:17:10 04/18/2011
-- Design Name:   
-- Module Name:   D:/SkyNet/Mis documentos/My Dropbox/Universidad/Proyecto/ReconocedorERs_v3/vBenchmark/reconocedorERS_Test_Bench_Benchmark.vhd
-- Project Name:  vBenchmark
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: regExpMatching
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
 
ENTITY reconocedorERS_Test_Bench_Benchmark IS
END reconocedorERS_Test_Bench_Benchmark;
 
ARCHITECTURE behavior OF reconocedorERS_Test_Bench_Benchmark IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT regExpMatching
    PORT(
         clock : IN  std_logic;
         charIn : IN  std_logic_vector(7 downto 0);
         output1 : OUT  std_logic;
         output2 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal charIn : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal output1 : std_logic;
   signal output2 : std_logic;

   -- Clock period definitions
   constant clock_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: regExpMatching PORT MAP (
          clock => clock,
          charIn => charIn,
          output1 => output1,
          output2 => output2
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	

      --wait for clock_period*10;
		wait for clock_period*10;
		
		--Prueba para babu@eritalk.com

      -- insert stimulus here 
		INPUT_LOOP: LOOP
			charIn <= "01100010";
			WAIT FOR clock_period;
			charIn <= "01100001";
			WAIT FOR clock_period;
			charIn <= "01100010";
			WAIT FOR clock_period;
			charIn <= "01110101";
			WAIT FOR clock_period;
			charIn <= "01000000";
			WAIT FOR clock_period;
			charIn <= "01100101";
			WAIT FOR clock_period;
			charIn <= "01110010";
			WAIT FOR clock_period;
			charIn <= "01101001";
			WAIT FOR clock_period;
			charIn <= "01110100";
			WAIT FOR clock_period;
			charIn <= "01100001";
			WAIT FOR clock_period;
			charIn <= "01101100";
			WAIT FOR clock_period;
			charIn <= "01101011";
			WAIT FOR clock_period;
			charIn <= "00101110";
			WAIT FOR clock_period;
			charIn <= "01100011";
			WAIT FOR clock_period;
			charIn <= "01101111";
			WAIT FOR clock_period;
			charIn <= "01101101";
			WAIT FOR clock_period;
			END LOOP INPUT_LOOP;
      wait;
   end process;

END;
