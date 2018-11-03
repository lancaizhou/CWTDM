--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:28:52 04/25/2018
-- Design Name:   
-- Module Name:   E:/Xilinx/projecrt/test_buhuo.vhd
-- Project Name:  projecrt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: buhuo
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
 
ENTITY test_buhuo IS
END test_buhuo;
 
ARCHITECTURE behavior OF test_buhuo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT buhuo
    PORT(
         clk_72M : IN  std_logic;
         data_in_i : IN  std_logic_vector(15 downto 0);
		 data_in_q : IN  std_logic_vector(15 downto 0);
         rst : IN  std_logic;
         sys_out : OUT  std_logic_vector(35 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_72M : std_logic := '0';
   signal data_in_i : std_logic_vector(15 downto 0) := (others => '0');
   signal data_in_q : std_logic_vector(15 downto 0) := (others => '0');
   signal rst : std_logic := '1';

 	--Outputs
   signal sys_out : std_logic_vector(35 downto 0);

   -- Clock period definitions
   constant clk_72M_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: buhuo PORT MAP (
          clk_72M => clk_72M,
          data_in_i => data_in_i,
		  data_in_q => data_in_q,
          rst => rst,
          sys_out => sys_out
        );

   -- Clock process definitions
   clk_72M_process :process
   begin
		clk_72M <= '0';
		wait for clk_72M_period/2;
		rst<='0';
		clk_72M <= '1';
		wait for clk_72M_period/2;
   end process;
 

   -- Stimulus process
stim_proc1: process
			variable vline: LINE;
			variable v: integer;
			file invect:text is "F:\sig_tongbu.txt";
			begin
			wait until rising_edge(clk_72M);
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					data_in_i <= conv_std_logic_vector(v,16);
					
				end if;
	end process;
	
stim_proc2: process
			variable vline1: LINE;
			variable v1: integer;
			file invect1:text is "F:\sig_tongbu.txt";
			begin
			wait until rising_edge(clk_72M);
				if not (ENDFILE(invect1)) then
					readline(invect1,vline1);
					read(vline1,v1);
					
					data_in_q <= conv_std_logic_vector(v1,16);
				end if;
	end process;

END;

