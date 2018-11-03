----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/25 10:03:59
-- Design Name: 
-- Module Name: clk_create - Behavioral
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

entity clk_create is
generic(D:integer:=53);			--分频倍数
  Port (  reset : in std_logic;
  clk_in1_p : in std_logic;
  clk_in1_n : in std_logic;
  clk_57_6M:out std_logic;
  clk_28_8M:out std_logic;
  clk_1_087M:out std_logic; 
  clk_0_5435M:out std_logic
);
end clk_create;

architecture Behavioral of clk_create is
signal locked:std_logic;
signal clk_57M_temp:std_logic;
signal clk_28M_temp:std_logic;
signal clk_1_temp:std_logic;
signal clk_0_temp:std_logic:='0';
signal counter1,counter2:integer range 0 to D;
signal clk_p:std_logic:='0';
signal clk_n:std_logic:='0';
component clk_syn
port
 (-- Clock in ports
  -- Clock out ports
  clk_57_6M          : out    std_logic;
  clk_28_8M          : out    std_logic;
  -- Status and control signals
  reset             : in     std_logic;
  locked            : out    std_logic;
  clk_in1_p         : in     std_logic;
  clk_in1_n         : in     std_logic
 );
end component;
begin
uut:clk_syn port map(
	reset=>reset,
	clk_in1_n=>clk_in1_n,
	clk_in1_p=>clk_in1_p,
	clk_57_6M=>clk_57M_temp,
	clk_28_8M=>clk_28M_temp
);

process(clk_57M_temp)
	begin
		if rising_edge(clk_57M_temp) then
			if counter1=D-1 then
				counter1<=0;
				clk_p<=not clk_p;
			elsif counter1=(D-1)/2 then
				counter1<=counter1+1;
				clk_p<=not clk_p;
			else
				counter1<=counter1+1;
			end if;
		end if;
		if falling_edge(clk_57M_temp) then
			if counter2=D-1 then
				counter2<=0;
				clk_n<=not clk_n;
			elsif counter2=(D-1)/2 then
				clk_n<=not clk_n;
				counter2<=counter2+1;
			else
				counter2<=counter2+1;
			end if;
		end if;
	end process;

process(clk_1_temp)
	begin
		if rising_edge(clk_1_temp) then
			clk_0_temp<=not clk_0_temp;
		end if;
	end process;

clk_1_temp<=clk_p or clk_n;
clk_1_087M<=clk_p or clk_n;
clk_0_5435M<=clk_0_temp;
clk_57_6M<=clk_57M_temp;
clk_28_8M<=clk_28M_temp;
end Behavioral;
