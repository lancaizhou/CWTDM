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
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
use ieee.std_logic_textio.all;
use std.textio.all; 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_combine_gaizhenzhen IS
END test_combine_gaizhenzhen;
 
ARCHITECTURE behavior OF test_combine_gaizhenzhen IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT combine_gaizhen
    PORT(
         clk_1M : IN  std_logic;
         clk_72M : IN  std_logic;
         rst : IN  std_logic;
		 en : in std_logic;
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
   signal en: std_logic:='0';
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
   constant clk_1M_period : time := 85.33 ns;  --初始74.77/1.39
   constant clk_72M_period : time := 1.61 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: combine_gaizhen PORT MAP (
          clk_1M => clk_1M,
          clk_72M => clk_72M,
          rst => rst,
		  en=>en,
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
   -- stim_proc: process
   -- begin		

		-- sigi1<="1000001111111111";
		-- sigi2<="1000001111111111";
		-- sigi3<="1000001111111111";
		-- sigi48<="1000001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1011001111111111";
		-- sigi2<="1011001111111111";
		-- sigi3<="1011001111111111";
		-- sigi48<="1011001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1010001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1010101111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1110001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1010011111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1011001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1110000111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1000011111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1110001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1010111111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1001001011111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1010001111111111";
		-- wait for  clk_1M_period;
		-- sigi1<="1110001111111111";
   -- end process;
   ------------------------------------------------------------------
	sigi1<="0000000000000001";
sigi2<="0000000000000010";
sigi3<="0000000000000011";
sigi4<="0000000000000100";
sigi5<="0000000000000101";
sigi6<="0000000000000110";
sigi7<="0000000000000111";
sigi8<="0000000000001000";
sigi9<="0000000000001001";
sigi10<="0000000000001010";
sigi11<="0000000000001011";
sigi12<="0000000000001100";
sigi13<="0000000000001101";
sigi14<="0000000000001110";
sigi15<="0000000000001111";
sigi16<="0000000000010000";
sigi17<="0000000000010001";
sigi18<="0000000000010010";
sigi19<="0000000000010011";
sigi40<="0000000000101000";
sigi41<="0000000000101001";
sigi42<="0000000000101010";
sigi43<="0000000000101011";
sigi44<="0000000000101100";
sigi45<="0000000000101101";
sigi46<="0000000000101110";
sigi47<="0000000000101111";
sigi48<="0000000000110000";


   
   ------------------------------------------------------------------
   
   -- stim_proc1: process
			-- variable vline: LINE;
			-- variable v: integer;
			-- file invect:text is "F:\fpgadata\sig1.txt";
			-- begin
			-- wait until rising_edge(clk_1M) and en='1';
				-- if not (ENDFILE(invect)) then
					-- readline(invect,vline);
					-- read(vline,v);
					-- sigi1 <= conv_std_logic_vector(v,16);
					
				-- end if;
	-- end process;
	
-- stim_proc2: process
			-- variable vline1: LINE;
			-- variable v1: integer;
			-- file invect1:text is "F:\fpgadata\sig2.txt";
			-- begin
			-- wait until rising_edge(clk_1M) and en='1';
				-- if not (ENDFILE(invect1)) then
					-- readline(invect1,vline1);
					-- read(vline1,v1);
					
					-- sigi2 <= conv_std_logic_vector(v1,16);
				-- end if;
	-- end process;
	
	
-- stim_proc3: process
			-- variable vline: LINE;
			-- variable v: integer;
			-- file invect:text is "F:\fpgadata\sig3.txt";
			-- begin
			-- wait until rising_edge(clk_1M) and en='1';
				-- if not (ENDFILE(invect)) then
					-- readline(invect,vline);
					-- read(vline,v);
					-- sigi3 <= conv_std_logic_vector(v,16);
					
				-- end if;
	-- end process;
	
-- stim_proc46: process
			-- variable vline: LINE;
			-- variable v: integer;
			-- file invect:text is "F:\fpgadata\sig46.txt";
			-- begin
			-- wait until rising_edge(clk_1M) and en='1';
				-- if not (ENDFILE(invect)) then
					-- readline(invect,vline);
					-- read(vline,v);
					-- sigi46 <= conv_std_logic_vector(v,16);
					
				-- end if;
	-- end process;	
	
-- stim_proc47: process
			-- variable vline: LINE;
			-- variable v: integer;
			-- file invect:text is "F:\fpgadata\sig47.txt";
			-- begin
			-- wait until rising_edge(clk_1M) and en='1';
				-- if not (ENDFILE(invect)) then
					-- readline(invect,vline);
					-- read(vline,v);
					-- sigi47 <= conv_std_logic_vector(v,16);
					
				-- end if;
	-- end process;
	
-- stim_proc48: process
			-- variable vline: LINE;
			-- variable v: integer;
			-- file invect:text is "F:\fpgadata\sig48.txt";
			-- begin
			-- wait until rising_edge(clk_1M) and en='1';
				-- if not (ENDFILE(invect)) then
					-- readline(invect,vline);
					-- read(vline,v);
					-- sigi48 <= conv_std_logic_vector(v,16);
					
				-- end if;
	-- end process;	

   process
	   begin
	   wait for clk_1M_period;
		rst<='0';
		wait for 10*clk_1M_period;
		en<='1';
	end process;
END;
