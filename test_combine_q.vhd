--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:39:59 04/06/2018
-- Design Name:   
-- Module Name:   D:/ise/cwtdm/test.vhd
-- Project Name:  cwtdm
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: combine_q
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
 
ENTITY test_combine_q IS
END test_combine_q;
 
ARCHITECTURE behavior OF test_combine_q IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combine_q
    PORT(
         clk_1M : IN  std_logic;
         clk_72M : IN  std_logic;
         rst : IN  std_logic;
         sigq1 : IN  std_logic_vector(15 downto 0);
         sigq2 : IN  std_logic_vector(15 downto 0);
         sigq3 : IN  std_logic_vector(15 downto 0);
         sigq4 : IN  std_logic_vector(15 downto 0);
         sigq5 : IN  std_logic_vector(15 downto 0);
         sigq6 : IN  std_logic_vector(15 downto 0);
         sigq7 : IN  std_logic_vector(15 downto 0);
         sigq8 : IN  std_logic_vector(15 downto 0);
         sigq9 : IN  std_logic_vector(15 downto 0);
         sigq10 : IN  std_logic_vector(15 downto 0);
         sigq11 : IN  std_logic_vector(15 downto 0);
         sigq12 : IN  std_logic_vector(15 downto 0);
         sigq13 : IN  std_logic_vector(15 downto 0);
         sigq14 : IN  std_logic_vector(15 downto 0);
         sigq15 : IN  std_logic_vector(15 downto 0);
         sigq16 : IN  std_logic_vector(15 downto 0);
         sigq17 : IN  std_logic_vector(15 downto 0);
         sigq18 : IN  std_logic_vector(15 downto 0);
         sigq19 : IN  std_logic_vector(15 downto 0);
         sigq20 : IN  std_logic_vector(15 downto 0);
         sigq21 : IN  std_logic_vector(15 downto 0);
         sigq22 : IN  std_logic_vector(15 downto 0);
         sigq23 : IN  std_logic_vector(15 downto 0);
         sigq24 : IN  std_logic_vector(15 downto 0);
         sigq25 : IN  std_logic_vector(15 downto 0);
         sigq26 : IN  std_logic_vector(15 downto 0);
         sigq27 : IN  std_logic_vector(15 downto 0);
         sigq28 : IN  std_logic_vector(15 downto 0);
         sigq29 : IN  std_logic_vector(15 downto 0);
         sigq30 : IN  std_logic_vector(15 downto 0);
         sigq31 : IN  std_logic_vector(15 downto 0);
         sigq32 : IN  std_logic_vector(15 downto 0);
         sigq33 : IN  std_logic_vector(15 downto 0);
         sigq34 : IN  std_logic_vector(15 downto 0);
         sigq35 : IN  std_logic_vector(15 downto 0);
         sigq36 : IN  std_logic_vector(15 downto 0);
         sigq37 : IN  std_logic_vector(15 downto 0);
         sigq38 : IN  std_logic_vector(15 downto 0);
         sigq39 : IN  std_logic_vector(15 downto 0);
         sigq40 : IN  std_logic_vector(15 downto 0);
         sigq41 : IN  std_logic_vector(15 downto 0);
         sigq42 : IN  std_logic_vector(15 downto 0);
         sigq43 : IN  std_logic_vector(15 downto 0);
         sigq44 : IN  std_logic_vector(15 downto 0);
         sigq45 : IN  std_logic_vector(15 downto 0);
         sigq46 : IN  std_logic_vector(15 downto 0);
         sigq47 : IN  std_logic_vector(15 downto 0);
         sigq48 : IN  std_logic_vector(15 downto 0);
         sig_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_1M : std_logic := '0';
   signal clk_72M : std_logic := '0';
   signal rst : std_logic := '0';
   signal sigq1 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq2 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq3 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq4 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq5 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq6 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq7 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq8 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq9 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq10 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq11 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq12 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq13 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq14 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq15 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq16 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq17 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq18 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq19 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq20 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq21 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq22 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq23 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq24 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq25 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq26 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq27 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq28 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq29 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq30 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq31 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq32 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq33 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq34 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq35 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq36 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq37 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq38 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq39 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq40 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq41 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq42 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq43 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq44 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq45 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq46 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq47 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigq48 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal sig_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_1M_period : time := 72 ns;  --初始74.77/1.39
   constant clk_72M_period : time := 1.3385 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combine_q PORT MAP (
          clk_1M => clk_1M,
          clk_72M => clk_72M,
          rst => rst,
          sigq1 => sigq1,
          sigq2 => sigq2,
          sigq3 => sigq3,
          sigq4 => sigq4,
          sigq5 => sigq5,
          sigq6 => sigq6,
          sigq7 => sigq7,
          sigq8 => sigq8,
          sigq9 => sigq9,
          sigq10 => sigq10,
          sigq11 => sigq11,
          sigq12 => sigq12,
          sigq13 => sigq13,
          sigq14 => sigq14,
          sigq15 => sigq15,
          sigq16 => sigq16,
          sigq17 => sigq17,
          sigq18 => sigq18,
          sigq19 => sigq19,
          sigq20 => sigq20,
          sigq21 => sigq21,
          sigq22 => sigq22,
          sigq23 => sigq23,
          sigq24 => sigq24,
          sigq25 => sigq25,
          sigq26 => sigq26,
          sigq27 => sigq27,
          sigq28 => sigq28,
          sigq29 => sigq29,
          sigq30 => sigq30,
          sigq31 => sigq31,
          sigq32 => sigq32,
          sigq33 => sigq33,
          sigq34 => sigq34,
          sigq35 => sigq35,
          sigq36 => sigq36,
          sigq37 => sigq37,
          sigq38 => sigq38,
          sigq39 => sigq39,
          sigq40 => sigq40,
          sigq41 => sigq41,
          sigq42 => sigq42,
          sigq43 => sigq43,
          sigq44 => sigq44,
          sigq45 => sigq45,
          sigq46 => sigq46,
          sigq47 => sigq47,
          sigq48 => sigq48,
          sig_out => sig_out
        );

   -- Clock process definitions
   clk_1M_process :process
   begin
		clk_1M <= '1';
		wait for clk_1M_period/2;
		clk_1M <= '0';
		wait for clk_1M_period/2;
   end process;
 
   clk_72M_process :process
   begin
		clk_72M <= '1';
		wait for clk_72M_period/2;
		clk_72M <= '0';
		wait for clk_72M_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	

		sigq1<="1000001111111111";
		sigq2<="1000001111111111";
		sigq3<="1000001111111111";
		sigq48<="1000001111111111";
		wait for  clk_1M_period;
		sigq1<="1011001111111111";
		sigq2<="1011001111111111";
		sigq3<="1011001111111111";
		sigq48<="1011001111111111";
		wait for  clk_1M_period;
		sigq1<="1010001111111111";
		wait for  clk_1M_period;
		sigq1<="1010101111111111";
		wait for  clk_1M_period;
		sigq1<="1110001111111111";
		wait for  clk_1M_period;
		sigq1<="1010011111111111";
		wait for  clk_1M_period;
		sigq1<="1011001111111111";
		wait for  clk_1M_period;
		sigq1<="1110000111111111";
		wait for  clk_1M_period;
		sigq1<="1000011111111111";
		wait for  clk_1M_period;
		sigq1<="1110001111111111";
		wait for  clk_1M_period;
		sigq1<="1010111111111111";
		wait for  clk_1M_period;
		sigq1<="1001001011111111";
		wait for  clk_1M_period;
		sigq1<="1010001111111111";
		wait for  clk_1M_period;
		sigq1<="1110001111111111";
   end process;

END;
