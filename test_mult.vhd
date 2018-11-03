----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/10/24 09:29:36
-- Design Name: 
-- Module Name: test_mult - Behavioral
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

entity test_mult is
--  Port ( );
end test_mult;

architecture Behavioral of test_mult is

	COMPONENT mult_gen_1
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(40 DOWNTO 0)
  );
END COMPONENT;
signal CLK: std_logic:='0';
signal A : std_logic_vector(17 downto 0):=(others=>'0');
signal B : std_logic_vector(17 downto 0):=(others=>'0');
signal P : std_logic_vector(40 downto 0);

constant clk_period: time:=1 ns;
begin
uut:mult_gen_1
  PORT MAP (
    CLK => CLK,
    A => A,
    B => B,
    P => P
  );
clk_process :process
   begin
		CLK <= '0';
		wait for clk_period/2;
		CLK <= '1';
		wait for clk_period/2;
   end process;
   
 process
	 begin
	 wait for clk_period;
	A<="011111101000101101";
	B<="100000101000101101";
	wait for clk_period;
	A<="001101101001101101";
	B<="001101101000001101";
	wait for clk_period;
	A<="101101101001100101";
	B<="101101101000001001";
	wait for clk_period;
	A<="101101101001100101";
	B<="011101101011111001";
	 end process;
end Behavioral;
