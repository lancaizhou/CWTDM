----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/06/22 09:22:10
-- Design Name: 
-- Module Name: ram_test - Behavioral
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
use ieee.std_logic_textio.all;
use std.textio.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;



-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ram_test is
--  Port ( );
end ram_test;

architecture Behavioral of ram_test is


COMPONENT blk_mem_gen_0
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(16 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  );
END COMPONENT;

	signal clk_156_25M:std_logic:='0';
	signal start:std_logic:='0';
	signal din:std_logic_vector(23 downto 0):=(others=>'0');
	signal a :std_logic_vector(16 downto 0):=(others=>'0');
signal b :std_logic_vector(16 downto 0):=(others=>'0');
signal wea : std_logic_vector(0 downto 0):="1";
signal wea1 : std_logic_vector(0 downto 0):="0";
	signal dout:STD_LOGIC_VECTOR(23 DOWNTO 0);
	
	constant clk_5M_period : time := 49 ns;
    constant clk_49M_period : time := 5 ns;
	constant clk_62_5M_period:time:=3.92 ns;
	constant clk_1_25M_period:time:=196 ns;
	constant clk_312_5M_period:time:=0.784 ns;
	constant clk_156_25M_period:time:=1.568 ns;

begin
	
	
	
	uut_blk : blk_mem_gen_0
  PORT MAP (
    clka => clk_156_25M,
    wea => wea,
    addra => a,
    dina => din,
    douta => dout
  );
	
	
   
   clk_process5 :process
   begin
		clk_156_25M <= '0';
		wait for clk_156_25M_period/2;
		clk_156_25M <= '1';
		wait for clk_156_25M_period/2;
   end process;
   
 
	
	process(clk_156_25M)
	begin
		if rising_edge(clk_156_25M) then
			if start='1' then
				a <= a + 1;
			end if;
			
			if start='1' then
				b <= b + 1;
			else
				b<=(others=>'0');
			end if;
		end if;
	end process;
	
	-- process(start)
	-- begin
		-- if rising_edge(start) then
			-- wea<="1";
		-- end if;
	-- end process;

	
	stim_proc1: process
			variable vline: LINE;
			variable v: std_logic_vector(23 downto 0);
			file invect:text is "F:\ram_test\gw12.txt";
			begin
			wait until rising_edge(clk_156_25M);
				if not (ENDFILE(invect)) then
					readline(invect,vline);
					read(vline,v);
					din <= v;
				end if;
	end process;
		
	stim_pr: process
	begin		

	  wait for 1*clk_156_25M_period;
		start <= '1';
		-- wea1<="1";
		-- wea<=wea1;
      wait;
   end process;


end Behavioral;

