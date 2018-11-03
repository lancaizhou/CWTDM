----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/05/02 09:14:51
-- Design Name: 
-- Module Name: fenjie - Behavioral
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
use ieee.std_logic_signed.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fenjie is
  Port (clk_36M : in std_logic;
			clk_0_65M : in std_logic;
			rst,en : in std_logic;
			data_in_i,data_in_q : in std_logic_vector(31 downto 0);
			sigi1 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi2 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi3 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi4 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi5 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi6 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi7 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi8 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi9 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi10 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi11 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi12 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi13 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi14 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi15 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi16 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi17 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi18 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi19 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi20 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi21 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi22 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi23 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi24 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi25 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi26 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi27 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi28 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi29 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi30 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi31 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi32 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi33 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi34 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi35 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi36 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi37 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi38 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi39 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi40 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi41 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi42 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi43 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi44 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi45 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi46 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi47 : out STD_LOGIC_VECTOR (31 downto 0);
           sigi48 : out STD_LOGIC_VECTOR (31 downto 0)
		   -- sigq1 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq2 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq3 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq4 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq5 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq6 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq7 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq8 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq9 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq10 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq11 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq12 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq13 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq14 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq15 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq16 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq17 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq18 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq19 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq20 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq21 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq22 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq23 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq24 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq25 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq26 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq27 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq28 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq29 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq30 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq31 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq32 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq33 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq34 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq35 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq36 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq37 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq38 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq39 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq40 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq41 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq42 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq43 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq44 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq45 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq46 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq47 : out STD_LOGIC_VECTOR (31 downto 0);
           -- sigq48 : out STD_LOGIC_VECTOR (31 downto 0);
  );
end fenjie;

architecture Behavioral of fenjie is
signal counter : integer range 0 to 8532;  		--7476
constant dd : integer :=6;
constant D : integer :=161;			--139
--fifo读使能信�?
signal wr_en : std_logic_vector(47 downto 0);
signal rd_en1 : std_logic_vector(47 downto 0):=(others=>'0');
signal full : std_logic_vector(47 downto 0);
signal empty : std_logic_vector(47 downto 0);
signal cnt : integer range 0 to 4:=0;
--fifo输入信号
type din_array is array(47 downto 0) of std_logic_vector(31 downto 0);
signal data_in,dout : din_array;
COMPONENT fifo_generator_3
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;
begin
 u0:for i in 0 to 47 generate
	 ux:fifo_generator_3 port map(rst,clk_36M,clk_0_65M,data_in(i),wr_en(i),rd_en1(i),dout(i),full(i),empty(i));
 end generate;

--	ux:fifo_generator_3 port map(rst,clk_36M,clk_0_65M,data_in(0),wr_en(0),rd_en1(0),sigi1,full(0),empty(0));

process(clk_36M)
begin

if en='1' then
	if rising_edge(clk_36M) then
			if cnt=2 then
				rd_en1<=(others=>'1');
			end if;
			if ((counter>=dd) and (counter<=D+dd-1)) then
				wr_en(0)<='1';
				data_in(0)<=data_in_i;
			elsif (counter=D+dd)  then
				cnt<=cnt+1;
				if cnt=4 then 
					cnt<=3;
				end if;
				wr_en(0)<='0';
			elsif ((counter>=D+2*dd) and (counter<=2*D+2*dd-1)) then
				wr_en(0)<='0';
				wr_en(1)<='1';
				data_in(1)<=data_in_i;
				
			elsif (counter=2*D+2*dd)  then
				wr_en(1)<='0';
			elsif ((counter>=2*D+3*dd) and (counter<=3*D+3*dd-1)) then
				wr_en(1)<='0';
				wr_en(2)<='1';
				data_in(2)<=data_in_i;
			elsif (counter=3*D+3*dd)  then
				wr_en(2)<='0';
			elsif ((counter>=3*D+4*dd) and (counter<=4*D+4*dd-1)) then
				wr_en(2)<='0';
				wr_en(3)<='1';
				data_in(3)<=data_in_i;
			elsif (counter=4*D+4*dd)  then
				wr_en(3)<='0';
			elsif ((counter>=4*D+5*dd) and (counter<=5*D+5*dd-1)) then
				wr_en(3)<='0';
				wr_en(4)<='1';
				data_in(4)<=data_in_i;
			elsif (counter=5*D+5*dd)  then
				wr_en(4)<='0';
			elsif ((counter>=5*D+6*dd) and (counter<=6*D+6*dd-1)) then
				wr_en(4)<='0';
				wr_en(5)<='1';
				data_in(5)<=data_in_i;
			elsif (counter=6*D+6*dd)  then
				wr_en(5)<='0';
			elsif ((counter>=6*D+7*dd) and (counter<=7*D+7*dd-1)) then
				wr_en(5)<='0';
				wr_en(6)<='1';
				data_in(6)<=data_in_i;
			elsif (counter=7*D+7*dd)  then
				wr_en(6)<='0';
			elsif ((counter>=7*D+8*dd) and (counter<=8*D+8*dd-1)) then
				wr_en(6)<='0';
				wr_en(7)<='1';
				data_in(7)<=data_in_i;
			elsif (counter=8*D+8*dd)  then
				wr_en(7)<='0';
			elsif ((counter>=8*D+9*dd) and (counter<=9*D+9*dd-1)) then
				wr_en(7)<='0';
				wr_en(8)<='1';
				data_in(8)<=data_in_i;
			elsif (counter=9*D+9*dd)  then
				wr_en(8)<='0';
			elsif ((counter>=9*D+10*dd) and (counter<=10*D+10*dd-1)) then
				wr_en(8)<='0';
				wr_en(9)<='1';
				data_in(9)<=data_in_i;
			elsif (counter=10*D+10*dd)  then
				wr_en(9)<='0';
			elsif ((counter>=10*D+11*dd) and (counter<=11*D+11*dd-1)) then
				wr_en(9)<='0';
				wr_en(10)<='1';
				data_in(10)<=data_in_i;
			elsif (counter=11*D+11*dd)  then
				wr_en(10)<='0';
			
			elsif ((counter>=11*D+12*dd) and (counter<=12*D+12*dd-1)) then
				wr_en(10)<='0';
				wr_en(11)<='1';
				data_in(11)<=data_in_i;
			elsif (counter=12*D+12*dd)  then
				wr_en(11)<='0';
			elsif ((counter>=12*D+13*dd) and (counter<=13*D+13*dd-1)) then
				wr_en(11)<='0';
				wr_en(12)<='1';
				data_in(12)<=data_in_i;
			elsif (counter=13*D+13*dd)  then
				wr_en(12)<='0';
			elsif ((counter>=13*D+14*dd) and (counter<=14*D+14*dd-1)) then
				wr_en(12)<='0';
				wr_en(13)<='1';
				data_in(13)<=data_in_i;
			elsif (counter=14*D+14*dd)  then
				wr_en(13)<='0';
			elsif ((counter>=14*D+15*dd) and (counter<=15*D+15*dd-1)) then
				wr_en(13)<='0';
				wr_en(14)<='1';
				data_in(14)<=data_in_i;
			elsif (counter=15*D+15*dd)  then
				wr_en(14)<='0';
			elsif ((counter>=15*D+16*dd) and (counter<=16*D+16*dd-1)) then
				wr_en(14)<='0';
				wr_en(15)<='1';
				data_in(15)<=data_in_i;
			elsif (counter=16*D+16*dd)  then
				wr_en(15)<='0';
			elsif ((counter>=16*D+17*dd) and (counter<=17*D+17*dd-1)) then
				wr_en(15)<='0';
				wr_en(16)<='1';
				data_in(16)<=data_in_i;
			elsif (counter=17*D+17*dd)  then
				wr_en(16)<='0';
			elsif ((counter>=17*D+18*dd) and (counter<=18*D+18*dd-1)) then
				wr_en(16)<='0';
				wr_en(17)<='1';
				data_in(17)<=data_in_i;
			elsif (counter=18*D+18*dd)  then
				wr_en(17)<='0';
			elsif ((counter>=18*D+19*dd) and (counter<=19*D+19*dd-1)) then
				wr_en(17)<='0';
				wr_en(18)<='1';
				data_in(18)<=data_in_i;
				elsif (counter=19*D+19*dd)  then
				wr_en(18)<='0';
			elsif ((counter>=19*D+20*dd) and (counter<=20*D+20*dd-1)) then
				wr_en(18)<='0';
				wr_en(19)<='1';
				data_in(19)<=data_in_i;
				elsif (counter=20*D+20*dd)  then
				wr_en(19)<='0';
			elsif ((counter>=20*D+21*dd) and (counter<=21*D+21*dd-1)) then
				wr_en(19)<='0';
				wr_en(20)<='1';
				data_in(20)<=data_in_i;
				elsif (counter=21*D+21*dd)  then
				wr_en(20)<='0';
			elsif ((counter>=21*D+22*dd) and (counter<=22*D+22*dd-1)) then
				wr_en(20)<='0';
				wr_en(21)<='1';
				data_in(21)<=data_in_i;
				elsif (counter=22*D+22*dd)  then
				wr_en(21)<='0';
			elsif ((counter>=22*D+23*dd) and (counter<=23*D+23*dd-1)) then
				wr_en(21)<='0';
				wr_en(22)<='1';
				data_in(22)<=data_in_i;
				elsif (counter=23*D+23*dd)  then
				wr_en(22)<='0';
			elsif ((counter>=23*D+24*dd) and (counter<=24*D+24*dd-1)) then
				wr_en(22)<='0';
				wr_en(23)<='1';
				data_in(23)<=data_in_i;
				elsif (counter=24*D+24*dd)  then
				wr_en(23)<='0';
			elsif ((counter>=24*D+25*dd) and (counter<=25*D+25*dd-1)) then
				wr_en(23)<='0';
				wr_en(24)<='1';
				data_in(24)<=data_in_i;
				elsif (counter=25*D+25*dd)  then
				wr_en(24)<='0';
			elsif ((counter>=25*D+26*dd) and (counter<=26*D+26*dd-1)) then
				wr_en(24)<='0';
				wr_en(25)<='1';
				data_in(25)<=data_in_i;
			elsif (counter=26*D+26*dd)  then
				wr_en(25)<='0';
			elsif ((counter>=26*D+27*dd) and (counter<=27*D+27*dd-1)) then
				wr_en(25)<='0';
				wr_en(26)<='1';
				data_in(26)<=data_in_i;
				elsif (counter=27*D+27*dd)  then
				wr_en(26)<='0';
			elsif ((counter>=27*D+28*dd) and (counter<=28*D+28*dd-1)) then
				wr_en(26)<='0';
				wr_en(27)<='1';
				data_in(27)<=data_in_i;
				elsif (counter=28*D+28*dd)  then
				wr_en(27)<='0';
			elsif ((counter>=28*D+29*dd) and (counter<=29*D+29*dd-1)) then
				wr_en(27)<='0';
				wr_en(28)<='1';
				data_in(28)<=data_in_i;
				elsif (counter=29*D+29*dd)  then
				wr_en(28)<='0';
			elsif ((counter>=29*D+30*dd) and (counter<=30*D+30*dd-1)) then
				wr_en(28)<='0';
				wr_en(29)<='1';
				data_in(29)<=data_in_i;
				elsif (counter=30*D+30*dd)  then
				wr_en(29)<='0';
			elsif ((counter>=30*D+31*dd) and (counter<=31*D+31*dd-1)) then
				wr_en(29)<='0';
				wr_en(30)<='1';
				data_in(30)<=data_in_i;
				elsif (counter=31*D+31*dd)  then
				wr_en(30)<='0';
			elsif ((counter>=31*D+32*dd) and (counter<=32*D+32*dd-1)) then
				wr_en(30)<='0';
				wr_en(31)<='1';
				data_in(31)<=data_in_i;
				elsif (counter=32*D+32*dd)  then
				wr_en(31)<='0';
			elsif ((counter>=32*D+33*dd) and (counter<=33*D+33*dd-1)) then
				wr_en(31)<='0';
				wr_en(32)<='1';
				data_in(32)<=data_in_i;
				elsif (counter=33*D+33*dd)  then
				wr_en(32)<='0';
			elsif ((counter>=33*D+34*dd) and (counter<=34*D+34*dd-1)) then
				wr_en(32)<='0';
				wr_en(33)<='1';
				data_in(33)<=data_in_i;
				elsif (counter=34*D+34*dd)  then
				wr_en(33)<='0';
			elsif ((counter>=34*D+35*dd) and (counter<=35*D+35*dd-1)) then
				wr_en(33)<='0';
				wr_en(34)<='1';
				data_in(34)<=data_in_i;
				elsif (counter=35*D+35*dd)  then
				wr_en(34)<='0';
			elsif ((counter>=35*D+36*dd) and (counter<=36*D+36*dd-1)) then
				wr_en(34)<='0';
				wr_en(35)<='1';
				data_in(35)<=data_in_i;
				elsif (counter=36*D+36*dd)  then
				wr_en(35)<='0';
			elsif ((counter>=36*D+37*dd) and (counter<=37*D+37*dd-1)) then
				wr_en(35)<='0';
				wr_en(36)<='1';
				data_in(36)<=data_in_i;
				elsif (counter=37*D+37*dd)  then
				wr_en(36)<='0';
			elsif ((counter>=37*D+38*dd) and (counter<=38*D+38*dd-1)) then
				wr_en(36)<='0';
				wr_en(37)<='1';
				data_in(37)<=data_in_i;
				elsif (counter=38*D+38*dd)  then
				wr_en(37)<='0';
			elsif ((counter>=38*D+39*dd) and (counter<=39*D+39*dd-1)) then
				wr_en(37)<='0';
				wr_en(38)<='1';
				data_in(38)<=data_in_i;
				elsif (counter=39*D+39*dd)  then
				wr_en(38)<='0';
			elsif ((counter>=39*D+40*dd) and (counter<=40*D+40*dd-1)) then
				wr_en(38)<='0';
				wr_en(39)<='1';
				data_in(39)<=data_in_i;
				elsif (counter=40*D+40*dd)  then
				wr_en(39)<='0';
			elsif ((counter>=40*D+41*dd) and (counter<=41*D+41*dd-1)) then
				wr_en(39)<='0';
				wr_en(40)<='1';
				data_in(40)<=data_in_i;
				elsif (counter=41*D+41*dd)  then
				wr_en(40)<='0';
			elsif ((counter>=41*D+42*dd) and (counter<=42*D+42*dd-1)) then
				wr_en(40)<='0';
				wr_en(41)<='1';
				data_in(41)<=data_in_i;
				elsif (counter=42*D+42*dd)  then
				wr_en(41)<='0';
			elsif ((counter>=42*D+43*dd) and (counter<=43*D+43*dd-1)) then
				wr_en(41)<='0';
				wr_en(42)<='1';
				data_in(42)<=data_in_i;
				elsif (counter=43*D+43*dd)  then
				wr_en(42)<='0';
			elsif ((counter>=43*D+44*dd) and (counter<=44*D+44*dd-1)) then
				wr_en(42)<='0';
				wr_en(43)<='1';
				data_in(43)<=data_in_i;
				elsif (counter=44*D+44*dd)  then
				wr_en(43)<='0';
			elsif ((counter>=44*D+45*dd) and (counter<=45*D+45*dd-1)) then
				wr_en(43)<='0';
				wr_en(44)<='1';
				data_in(44)<=data_in_i;
				elsif (counter=45*D+45*dd)  then
				wr_en(44)<='0';
			elsif ((counter>=45*D+46*dd) and (counter<=46*D+46*dd-1)) then
				wr_en(44)<='0';
				wr_en(45)<='1';
				data_in(45)<=data_in_i;
				elsif (counter=46*D+46*dd)  then
				wr_en(45)<='0';
			elsif ((counter>=46*D+47*dd) and (counter<=47*D+47*dd-1)) then
				wr_en(45)<='0';
				wr_en(46)<='1';
				data_in(46)<=data_in_i;
				elsif (counter=47*D+47*dd)  then
				wr_en(46)<='0';
			elsif ((counter>=47*D+48*dd) and (counter<=48*D+48*dd-1)) then
				wr_en(46)<='0';
				wr_en(47)<='1';
				data_in(47)<=data_in_i;
				elsif (counter=48*D+48*dd)  then
				wr_en(47)<='0';
			end if;
			counter<=counter+1;
		end if;
		else
			counter<=0;
			wr_en<=(others=>'0');
		
	end if;
end process;
sigi1<=dout(0);
sigi2<=dout(1);
sigi3<=dout(2);
sigi4<=dout(3);
sigi5<=dout(4);
sigi6<=dout(5);
sigi7<=dout(6);
sigi8<=dout(7);
sigi9<=dout(8);
sigi10<=dout(9);
sigi11<=dout(10);
sigi12<=dout(11);
sigi13<=dout(12);
sigi14<=dout(13);
sigi15<=dout(14);
sigi16<=dout(15);
sigi17<=dout(16);
sigi18<=dout(17);
sigi19<=dout(18);
sigi20<=dout(19);
sigi21<=dout(20);
sigi22<=dout(21);
sigi23<=dout(22);
sigi24<=dout(23);
sigi25<=dout(24);
sigi26<=dout(25);            
sigi27<=dout(26);
sigi28<=dout(27);
sigi29<=dout(28);
sigi30<=dout(29);
sigi31<=dout(30);
sigi32<=dout(31);
sigi33<=dout(32);
sigi34<=dout(33);
sigi35<=dout(34);
sigi36<=dout(35);
sigi37<=dout(36);
sigi38<=dout(37);
sigi39<=dout(38);
sigi40<=dout(39);
sigi41<=dout(40);
sigi42<=dout(41);
sigi43<=dout(42);
sigi44<=dout(43);
sigi45<=dout(44);
sigi46<=dout(45);
sigi47<=dout(46);
sigi48<=dout(47);
end Behavioral;
