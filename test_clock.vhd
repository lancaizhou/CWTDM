----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/25 09:26:38
-- Design Name: 
-- Module Name: test_clock - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_clock is
--  Port ( );
end test_clock;

architecture Behavioral of test_clock is
component clk_create
port
 (-- Clock in ports
  -- Clock out ports
  clk_57_6M          : out    std_logic;
  clk_28_8M          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic;
	clk_1_087M:out std_logic; 
  clk_0_5435M:out std_logic
 );
end component;

signal clk_in1_n:std_logic:='0';
signal clk_in1_p:std_logic:='1';
signal reset:std_logic:='1';

signal clk_57_6M:std_logic;
signal clk_28_8M:std_logic;
signal locked:std_logic;
signal clk_1_087M:std_logic;
signal clk_0_5435M:std_logic;

constant clk_period:time:=3.3333 ns;
begin
your_instance_name : clk_create
   port map ( 
  -- Clock out ports  
   clk_57_6M => clk_57_6M,
   clk_28_8M => clk_28_8M,
  -- Status and control signals                
   reset => reset,
   -- Clock in ports
   clk_in1_p => clk_in1_p,
   clk_in1_n => clk_in1_n,
   clk_1_087M=>clk_1_087M,
   clk_0_5435M=>clk_0_5435M
 );

process
	begin
		wait for clk_period/2;
		clk_in1_n<='1';
		clk_in1_p<='0';
		wait for clk_period/2;
		clk_in1_n<='0';
		clk_in1_p<='1';
	end process;
	
process
	begin
	wait for clk_period;
	reset<='0';
	end process;
end Behavioral;
