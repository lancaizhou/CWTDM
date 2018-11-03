----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/09/01 15:15:06
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
component test_fifo 
  Port (
  clk_in : in std_logic;
  clk_out : in std_logic;
  rst : in std_logic;
  en : in std_logic;
  din : in std_logic_vector(31 downto 0);
  dout : out std_logic_vector(31 downto 0)
  );
end component;
signal clk_in : std_logic:='0';
signal clk_out : std_logic:='0';
signal rst:std_logic:='1';
signal en: std_logic:='0';
signal din:std_logic_vector(31 downto 0):=(others=>'0');
signal dout: std_logic_vector(31 downto 0);
constant clk_in_period : time:=1 ns;
constant clk_out_period : time :=4 ns;

begin
uut:test_fifo port map(clk_in,clk_out,rst,en,din,dout);
process
begin
    wait for clk_in_period/2;
    clk_in <='1';
    wait for clk_in_period/2;
    clk_in<='0';
end process;

process
begin
    wait for clk_out_period/2;
    clk_out<='1';
    wait for clk_out_period/2;
    clk_out<='0';
end process;

process
begin
    wait for 10*clk_in_period;
    rst<='0';
end process;

process
begin
    wait for 20*clk_in_period;
    en<='1';
    wait for 100*clk_in_period;
    en<='0';
end process;
end Behavioral;
