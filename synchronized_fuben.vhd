----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/20 16:14:54
-- Design Name: 
-- Module Name: synchronize - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity synchronized_fuben is
    Port ( clk_72M : in STD_LOGIC;
           data_in_i : in STD_LOGIC_VECTOR (15 downto 0);
		   data_in_q : in STD_LOGIC_VECTOR (15 downto 0);
		   rst : in std_logic;
		   en : out std_logic;
           sys_out : out STD_LOGIC_VECTOR (35 downto 0));
end synchronized_fuben;

architecture Behavioral of synchronized_fuben is
signal temp:std_logic_vector(22 downto 0);
type tempp is array(511 downto 0) of std_logic_vector(17 downto 0);
signal xiangguan_i,xiangguan_q:tempp;
type Reg is array(534 downto 0) of std_logic_vector(15 downto 0);
signal regdin_i,regdin_q : Reg;
--第一级相加的结果
type re_1 is array(255 downto 0) of std_logic_vector(17 downto 0);
signal re_1_i,re_1_q:re_1:=(others=>(others=>'0'));
--第二级相加的结果
type re_2 is array(127 downto 0) of std_logic_vector(17 downto 0);
signal re_2_i,re_2_q:re_2;	
--第三级相加的结果
type re_3 is array(63 downto 0) of std_logic_vector(17 downto 0);
signal re_3_i,re_3_q:re_3;
--第四级相加的结果
type re_4 is array(31 downto 0) of std_logic_vector(17 downto 0);
signal re_4_i,re_4_q:re_4;
--第五级相加的结果
type re_5 is array(15 downto 0) of std_logic_vector(17 downto 0);
signal re_5_i,re_5_q:re_5;
--第六级相加的结果
type re_6 is array(7 downto 0) of std_logic_vector(17 downto 0);
signal re_6_i,re_6_q:re_6;
--第七级相加的结果
type re_7 is array(3 downto 0) of std_logic_vector(17 downto 0);
signal re_7_i,re_7_q:re_7;
--第八级相加的结果
type re_8 is array(1 downto 0) of std_logic_vector(17 downto 0);
signal re_8_i,re_8_q:re_8;
--第九级相加的结果
signal re_9_i,re_9_q:std_logic_vector(17 downto 0);

type PN_code is array(509 downto 0) of std_logic_vector(1 downto 0);
signal PN : PN_code:=("01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00",
"11",
"00",
"01",
"00",
"01",
"00",
"11",
"00",
"11",
"00");

--相关�?
signal counter : std_logic_vector(14 downto 0);
--捕获使能信号
signal PN_en : std_logic;
signal dout_i : std_logic_vector(15 downto 0);
signal dout_q : std_logic_vector(15 downto 0);

COMPONENT add_1
  PORT (
    A : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    CLK : IN STD_LOGIC;
    S : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END COMPONENT;

begin
--第一级相加加法器
u1_gen:for i in 0 to 254 generate
	u1_i : add_1
	  PORT MAP (
		A => xiangguan_i(2*i),
		B => xiangguan_i(2*i+1),
		CLK => clk_72M,
		S => re_1_i(i)
	  );
	  u1_q : add_1
	  PORT MAP (
		A => xiangguan_q(2*i),
		B => xiangguan_q(2*i+1),
		CLK => clk_72M,
		S => re_1_q(i)
	  );
 end generate;
--第二级相加加法器
u2_gen:for i in 0 to 127 generate
	u2_i : add_1
	  PORT MAP (
		A => re_1_i(2*i),
		B => re_1_i(2*i+1),
		CLK => clk_72M,
		S => re_2_i(i)
	  );
	  u2_q : add_1
	  PORT MAP (
		A => re_1_q(2*i),
		B => re_1_q(2*i+1),
		CLK => clk_72M,
		S => re_2_q(i)
	  );
 end generate;
 --第三级相加加法器
u3_gen:for i in 0 to 63 generate
	u3_i : add_1
	  PORT MAP (
		A => re_2_i(2*i),
		B => re_2_i(2*i+1),
		CLK => clk_72M,
		S => re_3_i(i)
	  );
	  u3_q : add_1
	  PORT MAP (
		A => re_2_q(2*i),
		B => re_2_q(2*i+1),
		CLK => clk_72M,
		S => re_3_q(i)
	  );
 end generate;
--第四级相加加法器
u4_gen:for i in 0 to 31 generate
	u4_i : add_1
	  PORT MAP (
		A => re_3_i(2*i),
		B => re_3_i(2*i+1),
		CLK => clk_72M,
		S => re_4_i(i)
	  );
	  u4_q : add_1
	  PORT MAP (
		A => re_3_q(2*i),
		B => re_3_q(2*i+1),
		CLK => clk_72M,
		S => re_4_q(i)
	  );
 end generate;
--第五级相加加法器
u5_gen:for i in 0 to 15 generate
	u5_i : add_1
	  PORT MAP (
		A => re_4_i(2*i),
		B => re_4_i(2*i+1),
		CLK => clk_72M,
		S => re_5_i(i)
	  );
	  u5_q : add_1
	  PORT MAP (
		A => re_4_q(2*i),
		B => re_4_q(2*i+1),
		CLK => clk_72M,
		S => re_5_q(i)
	  );
 end generate;
--第六级相加加法器
u6_gen:for i in 0 to 7 generate
	u6_i : add_1
	  PORT MAP (
		A => re_5_i(2*i),
		B => re_5_i(2*i+1),
		CLK => clk_72M,
		S => re_6_i(i)
	  );
	  u6_q : add_1
	  PORT MAP (
		A => re_5_q(2*i),
		B => re_5_q(2*i+1),
		CLK => clk_72M,
		S => re_6_q(i)
	  );
 end generate;
--第七级相加加法器
u7_gen:for i in 0 to 3 generate
	u7_i : add_1
	  PORT MAP (
		A => re_6_i(2*i),
		B => re_6_i(2*i+1),
		CLK => clk_72M,
		S => re_7_i(i)
	  );
	  u7_q : add_1
	  PORT MAP (
		A => re_6_q(2*i),
		B => re_6_q(2*i+1),
		CLK => clk_72M,
		S => re_7_q(i)
	  );
 end generate;
--第八级相加加法器
u8_gen:for i in 0 to 1 generate
	u8_i : add_1
	  PORT MAP (
		A => re_7_i(2*i),
		B => re_7_i(2*i+1),
		CLK => clk_72M,
		S => re_8_i(i)
	  );
	  u8_q : add_1
	  PORT MAP (
		A => re_7_q(2*i),
		B => re_7_q(2*i+1),
		CLK => clk_72M,
		S => re_8_q(i)
	  );
 end generate;
--第九级相加加法器
re_9_i<=re_8_i(0)+re_8_i(1);
re_9_q<=re_8_q(0)+re_8_q(1);
--�?终相关结�?
sys_out<=re_9_i*re_9_i+re_9_q*re_9_q;
-- sys_out_temp1<=re_9_i*re_9_i+re_9_q*re_9_q;
process(clk_72M,rst)
--注意此处要用variable，�?�不是signal
variable result_temp_i : std_logic_vector(17 downto 0);
variable result_temp_q : std_logic_vector(17 downto 0);
begin
	if rst='1' then
		regdin_i<=(others=>"0000000000000000");
		-- regdin_q<=(others=>"0000000000000000");
		regdin_q<=(others=>(others=>'0'));
		result_temp_i:=(others=>'0');
		result_temp_q:=(others=>'0');
		counter<=(others=>'0');
	elsif rising_edge(clk_72M) then
		--先将数据存到寄存器中
		for i in 0 to 534 loop
			if i=534 then
				regdin_i(i)<=data_in_i;
				regdin_q(i)<=data_in_q;
			else
				regdin_i(533-i)<=regdin_i(534-i);
				regdin_q(533-i)<=regdin_q(534-i);
			end if;
		
		end loop;
		--将数据与本地PN码相乘，去除符号信息，有时间延迟
		for i in 25 to 534 loop
			-- temp<=(others=>'0');
			-- xiangguan_i(i-25)<=regdin_i(i)*PN(534-i);
			-- temp(17 downto 0)<=xiangguan_i(i-25);
			-- xiangguan_ii(i-25)<=temp;
			-- temp<=(others=>'0');
			-- xiangguan_q(i-25)<=regdin_q(i)*PN(534-i);
			-- temp(17 downto 0)<=xiangguan_q(i-25);
			-- xiangguan_qq(i-25)<=temp;
			xiangguan_i(i-25)<=regdin_i(i)*PN(534-i);
			xiangguan_q(i-25)<=regdin_q(i)*PN(534-i);
		end loop;	
		
		-- for i in 0 to 2 loop
			-- if i=2 then
				-- sys_out_temp(i)<=sys_out_temp1;
			-- else
				-- sys_out_temp(1-i)<=sys_out_temp(2-i);
			-- end if;
		-- end loop;	
		
		counter<=counter+1;
		
		
		-- if sys_out_temp(0)>100 then
			-- if sys_out_temp(1)>sys_out_temp(0) then
				-- if sys_out_temp(2)<sys_out_temp(1) and sys_out_temp(2)>100 then
					-- en<='1';
				-- end if;
			-- end if;
		-- else
			-- en<='0';
		-- end if;	
	
	end if;
end process;
dout_i<=regdin_i(0);
dout_q<=regdin_q(0);
end Behavioral;








