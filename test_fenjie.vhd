--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:21:19 05/02/2018
-- Design Name:   
-- Module Name:   E:/Xilinx/projecrt/test_fenjie.vhd
-- Project Name:  projecrt
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fenjie
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
 
ENTITY test_fenjie IS
END test_fenjie;
 
ARCHITECTURE behavior OF test_fenjie IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fenjie
    PORT(
         clk_36M : IN  std_logic;
         clk_0_65M : IN  std_logic;
         rst : IN  std_logic;
         en : IN  std_logic;
         data_in_i : IN  std_logic_vector(31 downto 0);
         data_in_q : IN  std_logic_vector(31 downto 0);
         sigi1 : OUT  std_logic_vector(31 downto 0);
         sigi2 : OUT  std_logic_vector(31 downto 0);
         sigi3 : OUT  std_logic_vector(31 downto 0);
         sigi4 : OUT  std_logic_vector(31 downto 0);
         sigi5 : OUT  std_logic_vector(31 downto 0);
         sigi6 : OUT  std_logic_vector(31 downto 0);
         sigi7 : OUT  std_logic_vector(31 downto 0);
         sigi8 : OUT  std_logic_vector(31 downto 0);
         sigi9 : OUT  std_logic_vector(31 downto 0);
         sigi10 : OUT  std_logic_vector(31 downto 0);
         sigi11 : OUT  std_logic_vector(31 downto 0);
         sigi12 : OUT  std_logic_vector(31 downto 0);
         sigi13 : OUT  std_logic_vector(31 downto 0);
         sigi14 : OUT  std_logic_vector(31 downto 0);
         sigi15 : OUT  std_logic_vector(31 downto 0);
         sigi16 : OUT  std_logic_vector(31 downto 0);
         sigi17 : OUT  std_logic_vector(31 downto 0);
         sigi18 : OUT  std_logic_vector(31 downto 0);
         sigi19 : OUT  std_logic_vector(31 downto 0);
         sigi20 : OUT  std_logic_vector(31 downto 0);
         sigi21 : OUT  std_logic_vector(31 downto 0);
         sigi22 : OUT  std_logic_vector(31 downto 0);
         sigi23 : OUT  std_logic_vector(31 downto 0);
         sigi24 : OUT  std_logic_vector(31 downto 0);
         sigi25 : OUT  std_logic_vector(31 downto 0);
         sigi26 : OUT  std_logic_vector(31 downto 0);
         sigi27 : OUT  std_logic_vector(31 downto 0);
         sigi28 : OUT  std_logic_vector(31 downto 0);
         sigi29 : OUT  std_logic_vector(31 downto 0);
         sigi30 : OUT  std_logic_vector(31 downto 0);
         sigi31 : OUT  std_logic_vector(31 downto 0);
         sigi32 : OUT  std_logic_vector(31 downto 0);
         sigi33 : OUT  std_logic_vector(31 downto 0);
         sigi34 : OUT  std_logic_vector(31 downto 0);
         sigi35 : OUT  std_logic_vector(31 downto 0);
         sigi36 : OUT  std_logic_vector(31 downto 0);
         sigi37 : OUT  std_logic_vector(31 downto 0);
         sigi38 : OUT  std_logic_vector(31 downto 0);
         sigi39 : OUT  std_logic_vector(31 downto 0);
         sigi40 : OUT  std_logic_vector(31 downto 0);
         sigi41 : OUT  std_logic_vector(31 downto 0);
         sigi42 : OUT  std_logic_vector(31 downto 0);
         sigi43 : OUT  std_logic_vector(31 downto 0);
         sigi44 : OUT  std_logic_vector(31 downto 0);
         sigi45 : OUT  std_logic_vector(31 downto 0);
         sigi46 : OUT  std_logic_vector(31 downto 0);
         sigi47 : OUT  std_logic_vector(31 downto 0);
         sigi48 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_36M : std_logic := '0';
   signal clk_0_65M : std_logic := '0';
   signal rst : std_logic := '1';
   signal en : std_logic := '0';
   signal data_in_i : std_logic_vector(31 downto 0) := (others => '0');
   signal data_in_q : std_logic_vector(31 downto 0) := (others => '0');

   signal en_temp:std_logic:='0';
   
 	--Outputs
   signal sigi1 : std_logic_vector(31 downto 0);
   signal sigi2 : std_logic_vector(31 downto 0);
   signal sigi3 : std_logic_vector(31 downto 0);
   signal sigi4 : std_logic_vector(31 downto 0);
   signal sigi5 : std_logic_vector(31 downto 0);
   signal sigi6 : std_logic_vector(31 downto 0);
   signal sigi7 : std_logic_vector(31 downto 0);
   signal sigi8 : std_logic_vector(31 downto 0);
   signal sigi9 : std_logic_vector(31 downto 0);
   signal sigi10 : std_logic_vector(31 downto 0);
   signal sigi11 : std_logic_vector(31 downto 0);
   signal sigi12 : std_logic_vector(31 downto 0);
   signal sigi13 : std_logic_vector(31 downto 0);
   signal sigi14 : std_logic_vector(31 downto 0);
   signal sigi15 : std_logic_vector(31 downto 0);
   signal sigi16 : std_logic_vector(31 downto 0);
   signal sigi17 : std_logic_vector(31 downto 0);
   signal sigi18 : std_logic_vector(31 downto 0);
   signal sigi19 : std_logic_vector(31 downto 0);
   signal sigi20 : std_logic_vector(31 downto 0);
   signal sigi21 : std_logic_vector(31 downto 0);
   signal sigi22 : std_logic_vector(31 downto 0);
   signal sigi23 : std_logic_vector(31 downto 0);
   signal sigi24 : std_logic_vector(31 downto 0);
   signal sigi25 : std_logic_vector(31 downto 0);
   signal sigi26 : std_logic_vector(31 downto 0);
   signal sigi27 : std_logic_vector(31 downto 0);
   signal sigi28 : std_logic_vector(31 downto 0);
   signal sigi29 : std_logic_vector(31 downto 0);
   signal sigi30 : std_logic_vector(31 downto 0);
   signal sigi31 : std_logic_vector(31 downto 0);
   signal sigi32 : std_logic_vector(31 downto 0);
   signal sigi33 : std_logic_vector(31 downto 0);
   signal sigi34 : std_logic_vector(31 downto 0);
   signal sigi35 : std_logic_vector(31 downto 0);
   signal sigi36 : std_logic_vector(31 downto 0);
   signal sigi37 : std_logic_vector(31 downto 0);
   signal sigi38 : std_logic_vector(31 downto 0);
   signal sigi39 : std_logic_vector(31 downto 0);
   signal sigi40 : std_logic_vector(31 downto 0);
   signal sigi41 : std_logic_vector(31 downto 0);
   signal sigi42 : std_logic_vector(31 downto 0);
   signal sigi43 : std_logic_vector(31 downto 0);
   signal sigi44 : std_logic_vector(31 downto 0);
   signal sigi45 : std_logic_vector(31 downto 0);
   signal sigi46 : std_logic_vector(31 downto 0);
   signal sigi47 : std_logic_vector(31 downto 0);
   signal sigi48 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_36M_period : time := 1 ns;		--1.39
   constant clk_0_65M_period : time :=53 ns;		--79
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fenjie PORT MAP (
          clk_36M => clk_36M,
          clk_0_65M => clk_0_65M,
          rst => rst,
          en => en,
          data_in_i => data_in_i,
          data_in_q => data_in_q,
          sigi1 => sigi1,
          sigi2 => sigi2,
          sigi3 => sigi3,
          sigi4 => sigi4,
          sigi5 => sigi5,
          sigi6 => sigi6,
          sigi7 => sigi7,
          sigi8 => sigi8,
          sigi9 => sigi9,
          sigi10 => sigi10,
          sigi11 => sigi11,
          sigi12 => sigi12,
          sigi13 => sigi13,
          sigi14 => sigi14,
          sigi15 => sigi15,
          sigi16 => sigi16,
          sigi17 => sigi17,
          sigi18 => sigi18,
          sigi19 => sigi19,
          sigi20 => sigi20,
          sigi21 => sigi21,
          sigi22 => sigi22,
          sigi23 => sigi23,
          sigi24 => sigi24,
          sigi25 => sigi25,
          sigi26 => sigi26,
          sigi27 => sigi27,
          sigi28 => sigi28,
          sigi29 => sigi29,
          sigi30 => sigi30,
          sigi31 => sigi31,
          sigi32 => sigi32,
          sigi33 => sigi33,
          sigi34 => sigi34,
          sigi35 => sigi35,
          sigi36 => sigi36,
          sigi37 => sigi37,
          sigi38 => sigi38,
          sigi39 => sigi39,
          sigi40 => sigi40,
          sigi41 => sigi41,
          sigi42 => sigi42,
          sigi43 => sigi43,
          sigi44 => sigi44,
          sigi45 => sigi45,
          sigi46 => sigi46,
          sigi47 => sigi47,
          sigi48 => sigi48
        );

   -- Clock process definitions
   clk_36M_process :process
   begin
		clk_36M <= '1';
		wait for clk_36M_period/2;
		clk_36M <= '0';
		wait for clk_36M_period/2;
   end process;
 
   clk_0_65M_process :process
   begin
		clk_0_65M <= '1';
		wait for clk_0_65M_period/2;
		clk_0_65M <= '0';
		wait for clk_0_65M_period/2;
   end process;
 
-- process 
	-- begin
		-- data_in_i<="10100011111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10101011111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100011111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10100111111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10110011111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100001111111110100011111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10000111111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100011111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10101111111111010001111111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10010010111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10100011111110100011111111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100011111110100011111111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10101011111011101010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100001111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10100111011111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10110011111111111010001111011111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100001111111110100011111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10000111111111111010001111101111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100011111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10101111111111010001101111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10010010111111111010001111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="10100011101110100011110111111111";
		-- wait for  clk_36M_period;
		-- data_in_i<="11100010111110100011111111111101";
	-- end process;

	
 stim_proc1: process
			variable vline: LINE;
			variable v: integer;
			file invect:text is "F:\fpgadata\data_fenjie.txt";
			begin
			wait until rising_edge(clk_36M) and en_temp='1';
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					data_in_i <= conv_std_logic_vector(v,32);
					
				end if;
	end process;
	
process
	begin
	wait for 400*clk_36M_period;
	en<='1';
	wait for 8022*clk_36M_period;			--6966
	en<='0';
	wait for 111*clk_36M_period;			--511
	en<='0';
	end process;

process
	begin
		wait for 400*clk_36M_period;
		en_temp<='1';
	end process;
	
process
    begin
    wait for 10*clk_36M_period;
    rst<='0';
    end process;
END;
