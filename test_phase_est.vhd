----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/06/05 14:55:10
-- Design Name: 
-- Module Name: test_phase_est - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_textio.all;
use std.textio.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_phase_est is
--  Port ( );
end test_phase_est;

architecture Behavioral of test_phase_est is
component phase_est
	port(clk_36M : in std_logic;
			datai_in : IN  std_logic_vector(31 downto 0);
			dataq_in : IN  std_logic_vector(31 downto 0);
			en : IN  std_logic;
			datai_out : OUT  std_logic_vector(31 downto 0);
			dataq_out : OUT  std_logic_vector(31 downto 0));
end component;
--Inputs
   signal clk_36M : std_logic := '0';
   signal datai_in : std_logic_vector(31 downto 0) := (others => '0');
   signal dataq_in : std_logic_vector(31 downto 0) := (others => '0');
   signal en : std_logic := '0';

 	--Outputs
   signal datai_out : std_logic_vector(31 downto 0):=(others => '0');
   signal dataq_out : std_logic_vector(31 downto 0):= (others => '0');
   

   -- Clock period definitions
   constant clk_36M_period : time := 34.722 ns;	--27.78
begin
		-- Instantiate the Unit Under Test (UUT)
   uut: phase_est PORT MAP (
          clk_36M => clk_36M,
          datai_in => datai_in,
          dataq_in => dataq_in,
          en => en,
          datai_out => datai_out,
          dataq_out => dataq_out
        );
	
clk_36M_process :process
   begin
		clk_36M <= '0';
		wait for clk_36M_period/2;
		clk_36M <= '1';
		wait for clk_36M_period/2;
   end process;
   
   process
	   begin
	   wait for 0.5*clk_36M_period;
	   en<='1';
	   wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   wait for 8532*clk_36M_period;
		en <= '1';
		wait for clk_36M_period;
	   en<='0';
	   -- wait for 70*clk_36M_period;
		-- en <= '1';
		-- wait for clk_36M_period;
	   -- en<='0';
	   end process;
	   
	   stim_proc1: process
			variable vline: LINE;
			-- variable v: std_logic_vector(7 downto 0);
			variable v:integer;
			file invect:text is "F:\fpgadata\data_i_pinpian_second.txt";
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
			file invect:text is "F:\fpgadata\data_q_pinpian_second.txt";
			begin
			wait until rising_edge(clk_36M);
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					dataq_in <= conv_std_logic_vector(v,32);
				end if;
	end process;
end Behavioral;
