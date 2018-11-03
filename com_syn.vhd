----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/25 09:24:11
-- Design Name: 
-- Module Name: com_syn - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 组帧和同步模块联合仿真
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity com_syn is
  Port (clk_1M : in STD_LOGIC;
           clk_72M : in STD_LOGIC;
		   rst:in std_logic;
           sigi1 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi2 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi3 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi4 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi5 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi6 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi7 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi8 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi9 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi10 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi11 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi12 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi13 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi14 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi15 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi16 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi17 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi18 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi19 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi20 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi21 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi22 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi23 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi24 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi25 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi26 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi27 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi28 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi29 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi30 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi31 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi32 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi33 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi34 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi35 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi36 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi37 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi38 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi39 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi40 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi41 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi42 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi43 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi44 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi45 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi46 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi47 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi48 : in STD_LOGIC_VECTOR (15 downto 0);
		   sys_out : out STD_LOGIC_VECTOR (15 downto 0));
end com_syn;

architecture Behavioral of com_syn is
component combine port(
clk_1M : in STD_LOGIC;
           clk_72M : in STD_LOGIC;
		   rst:in std_logic;
           sigi1 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi2 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi3 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi4 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi5 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi6 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi7 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi8 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi9 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi10 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi11 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi12 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi13 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi14 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi15 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi16 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi17 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi18 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi19 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi20 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi21 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi22 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi23 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi24 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi25 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi26 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi27 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi28 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi29 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi30 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi31 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi32 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi33 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi34 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi35 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi36 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi37 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi38 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi39 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi40 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi41 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi42 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi43 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi44 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi45 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi46 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi47 : in STD_LOGIC_VECTOR (15 downto 0);
           sigi48 : in STD_LOGIC_VECTOR (15 downto 0);
           sig_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component synchronized_fuben port(clk_72M : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (15 downto 0);
			rst : in std_logic;
           sys_out : out STD_LOGIC_VECTOR (15 downto 0));
end component;

signal aa : std_logic_vector(15 downto 0);

begin
u1:combine port map(clk_1M,clk_72M,rst,sigi1,sigi2,sigi3,sigi4,sigi5,
           sigi6,
           sigi7,
           sigi8,
           sigi9,
           sigi10,
           sigi11,
           sigi12,
           sigi13,
           sigi14,
           sigi15,
           sigi16,
           sigi17,
           sigi18,
           sigi19,
           sigi20,
           sigi21,
           sigi22,
           sigi23,
           sigi24,
           sigi25,
           sigi26,
           sigi27,
           sigi28,
           sigi29,
           sigi30,
           sigi31,
           sigi32,
           sigi33,
           sigi34,
           sigi35,
           sigi36,
           sigi37,
           sigi38,
           sigi39,
           sigi40,
           sigi41,
           sigi42,
           sigi43,
           sigi44,
           sigi45,
           sigi46,
           sigi47,
           sigi48,
		   aa);
u2:synchronized_fuben port map(clk_72M,aa,rst,sys_out);

end Behavioral;
