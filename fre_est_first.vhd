----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/28 14:21:44
-- Design Name: 
-- Module Name: fre_est_first - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 频偏估计
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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fre_est_first is
  Port (clk_36M : in std_logic;
  clk_0_24M : in std_logic;
  datai_in : in std_logic_vector(31 downto 0);
  dataq_in : in std_logic_vector(31 downto 0);
  en : in std_logic;
  en_signal : in std_logic;
  datai_out : out std_logic_vector(31 downto 0);
  dataq_out : out std_logic_vector(31 downto 0));
end fre_est_first;

architecture Behavioral of fre_est_first is
signal counter:integer range 0 to 8000;
signal sum1_i:std_logic_vector(39 downto 0):=(others=>'0');
signal sum1_q:std_logic_vector(39 downto 0):=(others=>'0');
signal sum2_i:std_logic_vector(39 downto 0):=(others=>'0');
signal sum2_q:std_logic_vector(39 downto 0):=(others=>'0');

--截取
signal sum1j_i:std_logic_vector(15 downto 0);
signal sum1j_q:std_logic_vector(15 downto 0);
signal sum2j_i:std_logic_vector(15 downto 0);
signal sum2j_q:std_logic_vector(15 downto 0);
--cordic输入信号
signal s_axis_cartesian_tvalid : std_logic:='1';
signal s_axis_cartesian_tdata : std_logic_vector(31 downto 0);
--cordic输出信号
signal m_axis_dout_tdata : std_logic_vector(15 downto 0);
signal m_axis_dout_tvalid : std_logic:='1';
-- --除法器输入信号
-- signal s_axis_divisor_tvalid:std_logic:='1';
-- signal s_axis_dividend_tvalid:std_logic:='1';
-- signal s_axis_divisor_tdata : std_logic_vector(15 downto 0);
-- signal s_axis_dividend_tdata : std_logic_vector(15 downto 0);
-- --除法器输出信号
-- signal m_tvalid_div:std_logic;
-- signal m_tdata_div : std_logic_vector(31 downto 0);
--乘法器输入信号
signal AA : std_logic_vector(15 downto 0);
signal B : std_logic_vector(15 downto 0);
--乘法器输出信号
signal P : std_logic_vector(31 downto 0);
--511rom输入信号
signal a:STD_LOGIC_VECTOR(8 DOWNTO 0):=(others=>'0');
signal a_temp : std_logic_vector(8 downto 0):=(others=>'0');
--511rom输出信号
signal spo :  STD_LOGIC_VECTOR(1 DOWNTO 0);
--dds输入信号
signal s_axis_phase_tvalid : std_logic := '0';
signal s_axis_phase_tdata : std_logic_vector(23 downto 0):=(others=>'0');
--dds输出信号
signal m_axis_data_tvalid : std_logic;
signal m_axis_phase_tvalid : std_logic;
signal m_axis_data_tdata : std_logic_vector(31 downto 0);
signal m_axis_phase_tdata : std_logic_vector(23 downto 0);
--dds输出正弦和余弦信号
signal cos_tdata : std_logic_vector(15 downto 0);
signal sin_tdata : std_logic_vector(15 downto 0);
--两个fifo输入信号
signal srst : std_logic;
signal wr_en1,wr_en2,wr_en3,wr_en4 : STD_LOGIC:='0';
signal rd_en1,rd_en2,rd_en3,rd_en4 : STD_LOGIC;
--两个fifo输出信号
signal dout1,dout2,dout3,dout4 : STD_LOGIC_VECTOR(31 DOWNTO 0);
signal full1,full2,full3,full4 : STD_LOGIC;
signal empty1,empty2,empty3,empty4 : STD_LOGIC;

signal en1,en2 : std_logic:='0';

signal en11,en22 : std_logic:='0';
--粗估计频偏
signal df : std_logic_vector(15 downto 0);
signal est_c : std_logic_vector(15 downto 0);
--帧头相位
signal phase1,phase2 : std_logic_vector(15 downto 0);
signal phase11,phase22 : std_logic_vector(15 downto 0);

--
signal dds_temp : std_logic_vector(35 downto 0);
--粗补偿信号
signal datai_temp : std_logic_vector(47 downto 0);
signal dataq_temp : std_logic_vector(47 downto 0);
signal datai_tempp : std_logic_vector(33 downto 0);
signal dataq_tempp : std_logic_vector(33 downto 0);

signal temp_signal_i,temp_signal_q : std_logic_vector(31 downto 0);

--求相位
COMPONENT cordic_0
  PORT (
    s_axis_cartesian_tvalid : IN STD_LOGIC;
    s_axis_cartesian_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_dout_tvalid : OUT STD_LOGIC;
    m_axis_dout_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
--帧头
COMPONENT m511_rom
  PORT (
    a : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    spo : OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
  );
END COMPONENT;
--乘法器
COMPONENT mult_gen_0
  PORT (
    CLK : IN STD_LOGIC;
    A : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    B : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    P : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
--dds信号发生器
COMPONENT dds_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_phase_tvalid : IN STD_LOGIC;
    s_axis_phase_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_phase_tvalid : OUT STD_LOGIC;
    m_axis_phase_tdata : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
  );
END COMPONENT;
--fifo寄存器
COMPONENT fifo_generator_fre
  PORT (
    clk : IN STD_LOGIC;
    srst : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;
begin
	
u1 : cordic_0
  PORT MAP (
    s_axis_cartesian_tvalid => s_axis_cartesian_tvalid,
    s_axis_cartesian_tdata => s_axis_cartesian_tdata,
    m_axis_dout_tvalid => m_axis_dout_tvalid,
    m_axis_dout_tdata => m_axis_dout_tdata
  );
u2 : mult_gen_0
  PORT MAP (
    CLK => clk_36M,
    A => AA,
    B => B,
    P => P
  );
u3 : m511_rom
  PORT MAP (
    a => a,
    spo => spo
  );
u4 : dds_compiler_0
  PORT MAP (
    aclk => clk_36M,
    s_axis_phase_tvalid => s_axis_phase_tvalid,
    s_axis_phase_tdata => s_axis_phase_tdata,
    m_axis_data_tvalid => m_axis_data_tvalid,
    m_axis_data_tdata => m_axis_data_tdata,
    m_axis_phase_tvalid => m_axis_phase_tvalid,
    m_axis_phase_tdata => m_axis_phase_tdata
  );
u5 : fifo_generator_fre
  PORT MAP (
    clk => clk_36M,
    srst => srst,
    din => temp_signal_i,
    wr_en => wr_en1,
    rd_en => rd_en1,
    dout => dout1,
    full => full1,
    empty => empty1
  );
u6 : fifo_generator_fre
  PORT MAP (
    clk => clk_36M,
    srst => srst,
    din => temp_signal_i,
    wr_en => wr_en2,
    rd_en => rd_en2,
    dout => dout2,
    full => full2,
    empty => empty2
  );
u7 : fifo_generator_fre
  PORT MAP (
    clk => clk_36M,
    srst => srst,
    din => temp_signal_q,
    wr_en => wr_en3,
    rd_en => rd_en3,
    dout => dout3,
    full => full3,
    empty => empty3
  );
u8 : fifo_generator_fre
  PORT MAP (
    clk => clk_36M,
    srst => srst,
    din => temp_signal_q,
    wr_en => wr_en4,
    rd_en => rd_en4,
    dout => dout4,
    full => full4,
    empty => empty4
  );

--将数据延时一个周期
process(clk_36M)
begin
	if rising_edge(clk_36M) then
		temp_signal_i<=datai_in;
		temp_signal_q<=dataq_in;
	end if;
end process;

process(clk_36M)
begin
	if en1/=en2 then
		if rising_edge(clk_36M) then
			if en1='1' then
				wr_en1<='1';
				wr_en3<='1';
				wr_en2<='0';
				wr_en4<='0';
			elsif en2='1' then
				wr_en1<='0';
				wr_en3<='0';
				wr_en2<='1';
				wr_en4<='1';
			end if;
			if counter<=255 then
				-- a_temp<=a_temp+1;
				-- a<=a_temp;
				a<=a+1;
				sum1_i<=sum1_i+datai_in*spo;
				sum1_q<=sum1_q+dataq_in*spo;
			elsif counter<=510 then
				-- a_temp<=a_temp+1;
				a<=a+1;
				-- a<=a_temp;
				sum2_i<=sum2_i+datai_in*spo;
				sum2_q<=sum2_q+dataq_in*spo;
			elsif counter=511 then
				sum1j_i<=sum1_i(39 downto 24);
				sum1j_q<=sum1_q(39 downto 24);
				sum2j_i<=sum2_i(39 downto 24);
				sum2j_q<=sum2_q(39 downto 24);
				a<=(others=>'0');
				sum1_i<=(others=>'0');
				sum1_q<=(others=>'0');
				sum2_i<=(others=>'0');
				sum2_q<=(others=>'0');
			--延时一个周期
			elsif counter=512 then
				s_axis_cartesian_tdata(31 downto 16)<=sum1j_q;
				s_axis_cartesian_tdata(15 downto 0)<=sum1j_i;
				--计算帧头前255个点的相位
			elsif counter=513 then
			phase1<=m_axis_dout_tdata;
			s_axis_cartesian_tdata(31 downto 16)<=sum2j_q;
				s_axis_cartesian_tdata(15 downto 0)<=sum2j_i;
				--计算帧头后255个点的相位			
			elsif counter=514 then
				phase2<=m_axis_dout_tdata;
			elsif counter=515 then
				--改变phase的表示方式，使得phase2-phase1可以s_axis_dividend_tdata可以表示大于4的数
				phase11(15)<= phase1(15);
				phase11(14)<=phase1(15);
				phase11(13 downto 12)<=phase1(14 downto 13);
				phase11(11 downto 0)<=phase1(12 downto 1);
				phase22(15)<= phase2(15);
				phase22(14)<=phase2(15);
				phase22(13 downto 12)<=phase2(14 downto 13);
				phase22(11 downto 0)<=phase2(12 downto 1);
			elsif counter=516 then
				df<=phase22-phase11;
				--如果df>4，那么df=df-2*pi
			elsif counter=517 then
				if df>"0100000000000000" then
					df<=df-"0110010001111010";
				--如果df<-4,那么df=df+2*pi
				elsif df<"1100000000000000" then
					df<=df+"0110010001111010";
				end if;
			--送入乘法器
			elsif counter=518 then
				AA<=df;
				B<="0101011111000101";
			--调用dds产生正弦信号
			--00011101110100110111表示格式为1QN，即0.46603，由2^24/fclk计算得来，24是s_axis_phase_tdata的位数
			elsif counter=521 then
				dds_temp<=est_c*"00011101110100110111";
			elsif counter=523 then
				s_axis_phase_tdata(15)<=dds_temp(35);
				s_axis_phase_tdata(14 downto 0)<=dds_temp(32 downto 18);
				--dds输入有效位置1，产生信号输出，有延时
				s_axis_phase_tvalid<='1';
			elsif counter=529 then
				if en1='1' then
					rd_en1<='1';
					rd_en3<='1';
				elsif en2='1' then
					rd_en2<='1';
					rd_en4<='1';
				end if;
			elsif counter>=530 then
				if en1='1' then
					rd_en1<='1';
					rd_en2<='0';
					rd_en3<='1';
					rd_en4<='0';
					en11<='1';
					en22<='0';
				elsif en2='1' then
					rd_en1<='0';
					rd_en2<='1';
					rd_en3<='0';
					rd_en4<='1';
					en11<='0';
					en22<='1';
				end if;
			end if;
		end if;
	-- else
		-- counter<=0;
	end if;
	
end process;




--粗估计频偏输出，用于生成正弦信号，计算s_axis_phase_tdata
est_c(15)<=P(31);
est_c(14 downto 0)<=P(26 downto 12);
 
cos_tdata<=m_axis_data_tdata(15 downto 0);
sin_tdata<=m_axis_data_tdata(31 downto 16);
--第一次补偿


datai_tempp<=datai_temp(47 downto 14);
dataq_tempp<=dataq_temp(47 downto 14);


--使能信号改变
process(clk_36M)
begin
	if rising_edge(clk_36M) then
		if en11='1' then
			datai_temp<=dout1*cos_tdata+dout3*sin_tdata;
			dataq_temp<=dout3*cos_tdata-dout1*sin_tdata;
		elsif en22='1' then
			datai_temp<=dout2*cos_tdata+dout4*sin_tdata;
			dataq_temp<=dout4*cos_tdata-dout2*sin_tdata;
		end if;
		if (en='1') and (en1=en2) then
			en1<=not en1;
			en2<=en2;
			counter<=1;
		elsif (en='1') and (en1/=en2) then
			en1<=not en1;
			en2<=not en2;
			counter<=1;
		else
			counter<=counter+1;
		end if;
	end if;
end process;

--第一次补偿后信号输出
datai_out<=datai_tempp(33 downto 2);
dataq_out<=dataq_tempp(33 downto 2);

end Behavioral;
