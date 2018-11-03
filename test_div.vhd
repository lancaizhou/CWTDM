----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/14 16:25:48
-- Design Name: 
-- Module Name: test_div - Behavioral
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
use ieee.numeric_std.all;
use ieee.math_real.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test_div is
  --Port ( );
end test_div;

architecture Behavioral of test_div is
COMPONENT div_gen_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_divisor_tvalid : IN STD_LOGIC;
    s_axis_divisor_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    s_axis_dividend_tvalid : IN STD_LOGIC;
    s_axis_dividend_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
  constant CLOCK_PERIOD : time := 10 ns;
  -- General inputs
  signal aclk               : std_logic := '1';  -- the master clock

  -- Slave channel DIVIDEND inputs
  signal s_axis_dividend_tvalid    : std_logic := '1';  -- TVALID for channel A
  signal s_axis_dividend_tdata     : std_logic_vector(15 downto 0) := (others => '1');  -- TDATA for channel A

  -- Slave channel DIVISOR inputs
  signal s_axis_divisor_tvalid    : std_logic := '1';  -- TVALID for channel B
  signal s_axis_divisor_tdata     : std_logic_vector(15 downto 0) := (others => '1');  -- TDATA for channel B
 -- Master channel DOUT outputs
  signal m_axis_dout_tvalid : std_logic;  -- TVALID for channel DOUT
  signal m_axis_dout_tdata  : std_logic_vector(31 downto 0) := (others => '0');  -- TDATA for channel DOUT

begin
your_instance_name : div_gen_0
  PORT MAP (
    aclk => aclk,
    s_axis_divisor_tvalid => s_axis_divisor_tvalid,
    s_axis_divisor_tdata => s_axis_divisor_tdata,
    s_axis_dividend_tvalid => s_axis_dividend_tvalid,
    s_axis_dividend_tdata => s_axis_dividend_tdata,
    m_axis_dout_tvalid => m_axis_dout_tvalid,
    m_axis_dout_tdata => m_axis_dout_tdata
  );
process
	begin
	wait for CLOCK_PERIOD/2;
	aclk<='0';
	wait for CLOCK_PERIOD/2;
	aclk<='1';
	end process;
process
	begin
	wait for 10 ns;
	s_axis_divisor_tdata<="0000000000000100";
	s_axis_dividend_tdata<="0000000000010010";
	wait for 10 ns;
	s_axis_divisor_tdata<="0000000000000100";
	s_axis_dividend_tdata<="0000000000010000";
	end process;
end Behavioral;
