--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:18:16 05/15/2018
-- Design Name:   
-- Module Name:   E:/Xilinx/projecrt/test_fre.vhd
-- Project Name:  projecrt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fre_est
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
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_textio.all;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_fre IS
END test_fre;
 
ARCHITECTURE behavior OF test_fre IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fre_est
    PORT(
         clk_36M : IN  std_logic;
		 clk_0_24M : IN std_logic;
         datai_in : IN  std_logic_vector(31 downto 0);
         dataq_in : IN  std_logic_vector(31 downto 0);
         en : IN  std_logic;
		 en_signal : IN std_logic;
         datai_out : OUT  std_logic_vector(31 downto 0);
         dataq_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_36M : std_logic := '0';
   signal clk_0_24M : std_logic :='0';
   signal datai_in : std_logic_vector(31 downto 0) := (others => '0');
   signal dataq_in : std_logic_vector(31 downto 0) := (others => '0');
   signal en : std_logic := '1';
   signal en_signal : std_logic:='1';

 	--Outputs
   signal datai_out : std_logic_vector(31 downto 0):=(others => '0');
   signal dataq_out : std_logic_vector(31 downto 0):= (others => '0');
   

   -- Clock period definitions
   constant clk_36M_period : time := 27.78 ns;
constant clk_0_06M_period : time := 4166.67 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fre_est PORT MAP (
          clk_36M => clk_36M,
		  clk_0_24M=>clk_0_24M,
          datai_in => datai_in,
          dataq_in => dataq_in,
          en => en,
		  en_signal =>en_signal,
          datai_out => datai_out,
          dataq_out => dataq_out
        );

   -- Clock process definitions
   clk_36M_process :process
   begin
		clk_36M <= '0';
		wait for clk_36M_period/2;
		clk_36M <= '1';
		wait for clk_36M_period/2;
   end process;
   
   clk_0_06M_process :process
   begin
		clk_0_24M <= '0';
		wait for clk_0_06M_period/2;
		clk_0_24M <= '1';
		wait for clk_0_06M_period/2;
   end process;
 

   -- process
	   -- begin
	   -- wait for 10*clk_36M_period;
	   -- en<='1';
	   -- wait for 1000*clk_36M_period;
		-- en <= '0';
	   -- end process;
   -- Stimulus process
 stim_proc1: process
			variable vline: LINE;
			-- variable v: std_logic_vector(7 downto 0);
			variable v:integer;
			file invect:text is "F:\fpgadata\data_i_pinpian.txt";
			begin
			wait until rising_edge(clk_36M);
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					datai_in <= conv_std_logic_vector(v,32);
				end if;
	end process;
	stim_proc2: process
			variable vline: LINE;
			-- variable v: std_logic_vector(7 downto 0);
			variable v:integer;
			file invect:text is "F:\fpgadata\data_q_pinpian.txt";
			begin
			wait until rising_edge(clk_36M);
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					dataq_in <= conv_std_logic_vector(v,32);
				end if;
	end process;
	

END;
