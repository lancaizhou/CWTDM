----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/06/15 08:54:11
-- Design Name: 
-- Module Name: test_fifo_4 - Behavioral
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

entity test_fifo_4 is
--  Port ( );
end test_fifo_4;

architecture Behavioral of test_fifo_4 is
COMPONENT fifo_generator_0
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    -- din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;
signal rst : std_logic:='1';
signal wr_clk : std_logic:='0';
signal rd_clk : std_logic:='0';
signal din : std_logic_vector(15 downto 0):=(others=>'0');
signal wr_en : std_logic:='0';
signal rd_en : std_logic:='0';
signal dout : std_logic_vector(15 downto 0);
signal full : std_logic;
signal empty : std_logic;

constant wr_clk_period : time:=1.39 ns; --1.39
constant rd_clk_period : time:=1.39 ns;--74.77

begin
your_instance_name : fifo_generator_0
  PORT MAP (
    rst => rst,
    wr_clk => wr_clk,
    rd_clk => rd_clk,
    din => din,
    wr_en => wr_en,
    rd_en => rd_en,
    dout => dout,
    full => full,
    empty => empty
  );
 clk_36M_process :process
   begin
		wr_clk <= '1';
		wait for wr_clk_period/2;
		wr_clk <= '0';
		wait for wr_clk_period/2;
   end process;
 
   clk_0_65M_process :process
   begin
		rd_clk <= '1';
		wait for rd_clk_period/2;
		rd_clk <= '0';
		wait for rd_clk_period/2;
   end process;
   
   process
	   begin
	   wait for 10*wr_clk_period;
		wr_en<='1';
		-- rst<='0';
		wait for 20*wr_clk_period;
		wr_en<='0';
	   end process;
	  
	 process
		 begin
		 wait for wr_clk_period;
			rst<='0';
		 end process;
   
	process
		begin
		wait for 10*rd_clk_period;
		rd_en<='1';
		wait for 50*rd_clk_period;
		rd_en<='0';
		end process;
   process 
	begin
		din<="1010001111111111";
		wait for  wr_clk_period;
		din<="1010101111111111";
		wait for  wr_clk_period;
		din<="1110001111111111";
		wait for  wr_clk_period;
		din<="1010011111111111";
		wait for  wr_clk_period;
		din<="1010011111111111";
		-- din<="10100011111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="10101011111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="11100011111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="10100111111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="10110011111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="11100001111111110100011111111111";
		-- wait for  wr_clk_period;
		-- din<="10000111111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="11100011111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="10101111111111010001111111111111";
		-- wait for  wr_clk_period;
		-- din<="10010010111111111010001111111111";
		-- wait for  wr_clk_period;
		-- din<="10100011111110100011111111111111";
		-- wait for  wr_clk_period;
		-- din<="11100011111110100011111111111111";
	end process;
end Behavioral;
