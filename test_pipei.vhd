----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/17 16:34:24
-- Design Name: 
-- Module Name: test_fir - Behavioral
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

entity test_pipei is
--  Port ( );
end test_pipei;

architecture Behavioral of test_pipei is
COMPONENT fir_compiler_1
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
signal aclk : std_logic:='0';
signal s_axis_data_tvalid : std_logic:='1';
signal s_axis_data_tdata : std_logic_vector(15 downto 0):=(others=>'0');
signal  s_axis_data_tready :  STD_LOGIC;
signal m_axis_data_tvalid :  STD_LOGIC;
signal m_axis_data_tdata :  STD_LOGIC_VECTOR(31 DOWNTO 0);

constant aclk_period : time := 1 ns;

begin
your_instance_name : fir_compiler_1
  PORT MAP (
    aclk => aclk,
    s_axis_data_tvalid => s_axis_data_tvalid,
    s_axis_data_tready => s_axis_data_tready,
    s_axis_data_tdata => s_axis_data_tdata,
    m_axis_data_tvalid => m_axis_data_tvalid,
    m_axis_data_tdata => m_axis_data_tdata
  );
 aclk_process :process
   begin
		aclk <= '0';
		wait for aclk_period/2;
		aclk <= '1';
		wait for aclk_period/2;
   end process;
       
     stim_proc1: process
			variable vline: LINE;
			variable v: std_logic_vector(15 downto 0);
			file invect:text is "F:\sig3.txt";
			begin
			wait until rising_edge(aclk);
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					s_axis_data_tdata <= v;
				end if;
	end process;
end Behavioral;
