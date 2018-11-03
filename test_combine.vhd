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
-- VHDL Test Bench Created by ISE for module: combine
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
 
ENTITY test_combine IS
END test_combine;
 
ARCHITECTURE behavior OF test_combine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combine
    PORT(
         clk_1M : IN  std_logic;
         clk_72M : IN  std_logic;
         rst : IN  std_logic;
         sigi1 : IN  std_logic_vector(15 downto 0);
         sigi2 : IN  std_logic_vector(15 downto 0);
         sigi3 : IN  std_logic_vector(15 downto 0);
         sigi4 : IN  std_logic_vector(15 downto 0);
         sigi5 : IN  std_logic_vector(15 downto 0);
         sigi6 : IN  std_logic_vector(15 downto 0);
         sigi7 : IN  std_logic_vector(15 downto 0);
         sigi8 : IN  std_logic_vector(15 downto 0);
         sigi9 : IN  std_logic_vector(15 downto 0);
         sigi10 : IN  std_logic_vector(15 downto 0);
         sigi11 : IN  std_logic_vector(15 downto 0);
         sigi12 : IN  std_logic_vector(15 downto 0);
         sigi13 : IN  std_logic_vector(15 downto 0);
         sigi14 : IN  std_logic_vector(15 downto 0);
         sigi15 : IN  std_logic_vector(15 downto 0);
         sigi16 : IN  std_logic_vector(15 downto 0);
         sigi17 : IN  std_logic_vector(15 downto 0);
         sigi18 : IN  std_logic_vector(15 downto 0);
         sigi19 : IN  std_logic_vector(15 downto 0);
         sigi20 : IN  std_logic_vector(15 downto 0);
         sigi21 : IN  std_logic_vector(15 downto 0);
         sigi22 : IN  std_logic_vector(15 downto 0);
         sigi23 : IN  std_logic_vector(15 downto 0);
         sigi24 : IN  std_logic_vector(15 downto 0);
         sigi25 : IN  std_logic_vector(15 downto 0);
         sigi26 : IN  std_logic_vector(15 downto 0);
         sigi27 : IN  std_logic_vector(15 downto 0);
         sigi28 : IN  std_logic_vector(15 downto 0);
         sigi29 : IN  std_logic_vector(15 downto 0);
         sigi30 : IN  std_logic_vector(15 downto 0);
         sigi31 : IN  std_logic_vector(15 downto 0);
         sigi32 : IN  std_logic_vector(15 downto 0);
         sigi33 : IN  std_logic_vector(15 downto 0);
         sigi34 : IN  std_logic_vector(15 downto 0);
         sigi35 : IN  std_logic_vector(15 downto 0);
         sigi36 : IN  std_logic_vector(15 downto 0);
         sigi37 : IN  std_logic_vector(15 downto 0);
         sigi38 : IN  std_logic_vector(15 downto 0);
         sigi39 : IN  std_logic_vector(15 downto 0);
         sigi40 : IN  std_logic_vector(15 downto 0);
         sigi41 : IN  std_logic_vector(15 downto 0);
         sigi42 : IN  std_logic_vector(15 downto 0);
         sigi43 : IN  std_logic_vector(15 downto 0);
         sigi44 : IN  std_logic_vector(15 downto 0);
         sigi45 : IN  std_logic_vector(15 downto 0);
         sigi46 : IN  std_logic_vector(15 downto 0);
         sigi47 : IN  std_logic_vector(15 downto 0);
         sigi48 : IN  std_logic_vector(15 downto 0);
         sig_out : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_1M : std_logic := '0';
   signal clk_72M : std_logic := '0';
   signal rst : std_logic := '1';
   signal sigi1 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi2 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi3 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi4 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi5 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi6 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi7 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi8 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi9 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi10 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi11 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi12 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi13 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi14 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi15 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi16 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi17 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi18 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi19 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi20 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi21 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi22 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi23 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi24 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi25 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi26 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi27 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi28 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi29 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi30 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi31 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi32 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi33 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi34 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi35 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi36 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi37 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi38 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi39 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi40 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi41 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi42 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi43 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi44 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi45 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi46 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi47 : std_logic_vector(15 downto 0) := (others => '0');
   signal sigi48 : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal sig_out : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant clk_1M_period : time := 74.77 ns;  --初始74.77/1.39
   constant clk_72M_period : time := 1.389 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combine PORT MAP (
          clk_1M => clk_1M,
          clk_72M => clk_72M,
          rst => rst,
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
          sigi48 => sigi48,
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

		sigi1<="1000001111111111";
		sigi2<="1000001111111111";
		sigi3<="1000001111111111";
		sigi48<="1000001111111111";
		wait for  clk_1M_period;
		sigi1<="1011001111111111";
		sigi2<="1011001111111111";
		sigi3<="1011001111111111";
		sigi48<="1011001111111111";
		wait for  clk_1M_period;
		sigi1<="1010001111111111";
		wait for  clk_1M_period;
		sigi1<="1010101111111111";
		wait for  clk_1M_period;
		sigi1<="1110001111111111";
		wait for  clk_1M_period;
		sigi1<="1010011111111111";
		wait for  clk_1M_period;
		sigi1<="1011001111111111";
		wait for  clk_1M_period;
		sigi1<="1110000111111111";
		wait for  clk_1M_period;
		sigi1<="1000011111111111";
		wait for  clk_1M_period;
		sigi1<="1110001111111111";
		wait for  clk_1M_period;
		sigi1<="1010111111111111";
		wait for  clk_1M_period;
		sigi1<="1001001011111111";
		wait for  clk_1M_period;
		sigi1<="1010001111111111";
		wait for  clk_1M_period;
		sigi1<="1110001111111111";
   end process;

   process
	   begin
	   wait for clk_1M_period;
	rst<='0';
	end process;
END;
