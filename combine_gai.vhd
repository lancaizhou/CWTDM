----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/03 17:10:08
-- Design Name: 
-- Module Name: combine_gai - Behavioral
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

entity combine_gai is
    Port ( clk_1M : in STD_LOGIC;
           clk_72M : in STD_LOGIC;
		   rst:in std_logic;
		   en:in std_logic;
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
end combine_gai;


architecture Behavioral of combine_gai is
--fifo写使能和读使能信号
signal wr_en:std_logic_vector(95 downto 0);
signal rd_en : std_logic_vector(95 downto 0):=(others=>'0');

signal rd_en_even : std_logic;
signal rd_en_odd : std_logic;
--fifo输出
signal douti11,douti12,douti21,douti22,douti31,douti32,douti41,douti42,douti51,douti52,douti61,douti62,douti71,douti72,douti81,douti82,douti91,douti92,douti101,douti102,douti111,douti112,douti121,douti122:std_logic_vector(15 downto 0);
signal douti131,douti132,douti141,douti142,douti151,douti152,douti161,douti162,douti171,douti172,douti181,douti182,douti191,douti192,douti201,douti202,douti211,douti212,douti221,douti222,douti231,douti232,douti241,douti242:std_logic_vector(15 downto 0);
signal douti251,douti252,douti261,douti262,douti271,douti272,douti281,douti282,douti291,douti292,douti301,douti302,douti311,douti312,douti321,douti322,douti331,douti332,douti341,douti342,douti351,douti352,douti361,douti362:std_logic_vector(15 downto 0);
signal douti371,douti372,douti381,douti382,douti391,douti392,douti401,douti402,douti411,douti412,douti421,douti422,douti431,douti432,douti441,douti442,douti451,douti452,douti461,douti462,douti471,douti472,douti481,douti482:std_logic_vector(15 downto 0);

signal full:std_logic_vector(95 downto 0);
signal empty:std_logic_vector(95 downto 0);
--定义参数
constant D:integer:=278;
constant dd:integer:=12;
constant frame_len:integer:=D+dd*2;
--输入计数，两个fifo写数据计数
type counter is array(1 downto 0) of integer range 0 to frame_len-1;
signal counter1 : counter;
signal counter2 : counter;
--帧头计数
signal counter_headS : integer range -1 to 1100;
signal counter_headSS : integer range 0 to 1100:=0;
--使能信号，延时一个周期用于产生原始的headS_en
signal en_temp:std_logic:='0';
--帧头输出使能信号
signal headB_en : std_logic:='0';
signal headS_en : std_logic:='0';
--计数已经存储多少组有效数据(278)，用于产生第一个帧头使能信号的输出
signal cnt : std_logic_vector(8 downto 0):=(others=>'0');
signal cnt_t : std_logic_vector(8 downto 0):=(others=>'0');
--输出计数
signal counter_out : integer range 0 to 14442:=0;
--510帧头输入输出
signal a_1022 : std_logic_vector(9 downto 0):=(others=>'0');
signal spo_1022 : std_logic_vector(15 downto 0);
--窗函数
type chuan is array(11 downto 0) of std_logic_vector(15 downto 0);
signal wb:chuan:=("0111111111111111","0111110111010010","0111011101101100","0110110101000010","0110000000000000","0101000010010000","0100000000000000","0010111101101111","0010000000000000","0001001010111101","0000100010010011","0000001000101101");
signal wf:chuan:=("0000001000101101","0000100010010011","0001001010111101","0010000000000000","0010111101101111","0100000000000000","0101000010010000","0110000000000000","0110110101000010","0111011101101100","0111110111010010","0111111111111111");
--状态机状态
type state_type1 is (s10,s11,s12,s13,s14);
type state_type2 is (s20,s21,s22,s23,s24);


COMPONENT fifo_generator_0
  PORT (
    rst : IN STD_LOGIC;
    wr_clk : IN STD_LOGIC;
    rd_clk : IN STD_LOGIC;
    din : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    wr_en : IN STD_LOGIC;
    rd_en : IN STD_LOGIC;
    dout : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    full : OUT STD_LOGIC;
    empty : OUT STD_LOGIC
  );
END COMPONENT;

COMPONENT m1022_rom
  PORT (
    a : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
    spo : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

begin
u1 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi1,wr_en(0),rd_en(0),douti11,full(0),empty(0));
u2 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi1,wr_en(1),rd_en(1),douti12,full(1),empty(1));
u3 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi2,wr_en(2),rd_en(2),douti21,full(2),empty(2));
u4 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi2,wr_en(3),rd_en(3),douti22,full(3),empty(3));
u5 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi3,wr_en(4),rd_en(4),douti31,full(4),empty(4));
u6 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi3,wr_en(5),rd_en(5),douti32,full(5),empty(5));
u7 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi4,wr_en(6),rd_en(6),douti41,full(6),empty(6));
u8 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi4,wr_en(7),rd_en(7),douti42,full(7),empty(7));
u9 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi5,wr_en(8),rd_en(8),douti51,full(8),empty(8));
u10 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi5,wr_en(9),rd_en(9),douti52,full(9),empty(9));
u11 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi6,wr_en(10),rd_en(10),douti61,full(10),empty(10));
u12 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi6,wr_en(11),rd_en(11),douti62,full(11),empty(11));
u13 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi7,wr_en(12),rd_en(12),douti71,full(12),empty(12));
u14 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi7,wr_en(13),rd_en(13),douti72,full(13),empty(13));
u15 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi8,wr_en(14),rd_en(14),douti81,full(14),empty(14));
u16 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi8,wr_en(15),rd_en(15),douti82,full(15),empty(15));
u17 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi9,wr_en(16),rd_en(16),douti91,full(16),empty(16));
u18 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi9,wr_en(17),rd_en(17),douti92,full(17),empty(17));
u19 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi10,wr_en(18),rd_en(18),douti101,full(18),empty(18));
u20 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi10,wr_en(19),rd_en(19),douti102,full(19),empty(19));

u21 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi11,wr_en(20),rd_en(20),douti111,full(20),empty(20));
u22 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi11,wr_en(21),rd_en(21),douti112,full(21),empty(21));
u23 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi12,wr_en(22),rd_en(22),douti121,full(22),empty(22));
u24 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi12,wr_en(23),rd_en(23),douti122,full(23),empty(23));
u25 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi13,wr_en(24),rd_en(24),douti131,full(24),empty(24));
u26 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi13,wr_en(25),rd_en(25),douti132,full(25),empty(25));
u27 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi14,wr_en(26),rd_en(26),douti141,full(26),empty(26));
u28 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi14,wr_en(27),rd_en(27),douti142,full(27),empty(27));
u29 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi15,wr_en(28),rd_en(28),douti151,full(28),empty(28));
u30 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi15,wr_en(29),rd_en(29),douti152,full(29),empty(29));

u31 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi16,wr_en(30),rd_en(30),douti161,full(30),empty(30));
u32 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi16,wr_en(31),rd_en(31),douti162,full(31),empty(31));
u33 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi17,wr_en(32),rd_en(32),douti171,full(32),empty(32));
u34 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi17,wr_en(33),rd_en(33),douti172,full(33),empty(33));
u35 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi18,wr_en(34),rd_en(34),douti181,full(34),empty(34));
u36 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi18,wr_en(35),rd_en(35),douti182,full(35),empty(35));
u37 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi19,wr_en(36),rd_en(36),douti191,full(36),empty(36));
u38 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi19,wr_en(37),rd_en(37),douti192,full(37),empty(37));
u39 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi20,wr_en(38),rd_en(38),douti201,full(38),empty(38));
u40 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi20,wr_en(39),rd_en(39),douti202,full(39),empty(39));

u41 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi21,wr_en(40),rd_en(40),douti211,full(40),empty(40));
u42 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi21,wr_en(41),rd_en(41),douti212,full(41),empty(41));
u43 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi22,wr_en(42),rd_en(42),douti221,full(42),empty(42));
u44 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi22,wr_en(43),rd_en(43),douti222,full(43),empty(43));
u45 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi23,wr_en(44),rd_en(44),douti231,full(44),empty(44));
u46 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi23,wr_en(45),rd_en(45),douti232,full(45),empty(45));
u47 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi24,wr_en(46),rd_en(46),douti241,full(46),empty(46));
u48 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi24,wr_en(47),rd_en(47),douti242,full(47),empty(47));
u49 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi25,wr_en(48),rd_en(48),douti251,full(48),empty(48));
u50 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi25,wr_en(49),rd_en(49),douti252,full(49),empty(49));

u51 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi26,wr_en(50),rd_en(50),douti261,full(50),empty(50));
u52 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi26,wr_en(51),rd_en(51),douti262,full(51),empty(51));
u53 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi27,wr_en(52),rd_en(52),douti271,full(52),empty(52));
u54 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi27,wr_en(53),rd_en(53),douti272,full(53),empty(53));
u55 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi28,wr_en(54),rd_en(54),douti281,full(54),empty(54));
u56 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi28,wr_en(55),rd_en(55),douti282,full(55),empty(55));
u57 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi29,wr_en(56),rd_en(56),douti291,full(56),empty(56));
u58 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi29,wr_en(57),rd_en(57),douti292,full(57),empty(57));
u59 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi30,wr_en(58),rd_en(58),douti301,full(58),empty(58));
u60 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi30,wr_en(59),rd_en(59),douti302,full(59),empty(59));

u61 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi31,wr_en(60),rd_en(60),douti311,full(60),empty(60));
u62 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi31,wr_en(61),rd_en(61),douti312,full(61),empty(61));
u63 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi32,wr_en(62),rd_en(62),douti321,full(62),empty(62));
u64 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi32,wr_en(63),rd_en(63),douti322,full(63),empty(63));
u65 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi33,wr_en(64),rd_en(64),douti331,full(64),empty(64));
u66 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi33,wr_en(65),rd_en(65),douti332,full(65),empty(65));
u67 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi34,wr_en(66),rd_en(66),douti341,full(66),empty(66));
u68 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi34,wr_en(67),rd_en(67),douti342,full(67),empty(67));
u69 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi35,wr_en(68),rd_en(68),douti351,full(68),empty(68));
u70 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi35,wr_en(69),rd_en(69),douti352,full(69),empty(69));

u71 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi36,wr_en(70),rd_en(70),douti361,full(70),empty(70));
u72 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi36,wr_en(71),rd_en(71),douti362,full(71),empty(71));
u73 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi37,wr_en(72),rd_en(72),douti371,full(72),empty(72));
u74 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi37,wr_en(73),rd_en(73),douti372,full(73),empty(73));
u75 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi38,wr_en(74),rd_en(74),douti381,full(74),empty(74));
u76 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi38,wr_en(75),rd_en(75),douti382,full(75),empty(75));
u77 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi39,wr_en(76),rd_en(76),douti391,full(76),empty(76));
u78 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi39,wr_en(77),rd_en(77),douti392,full(77),empty(77));
u79 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi40,wr_en(78),rd_en(78),douti401,full(78),empty(78));
u80 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi40,wr_en(79),rd_en(79),douti402,full(79),empty(79));

u81 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi41,wr_en(80),rd_en(80),douti411,full(80),empty(80));
u82 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi41,wr_en(81),rd_en(81),douti412,full(81),empty(81));
u83 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi42,wr_en(82),rd_en(82),douti421,full(82),empty(82));
u84 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi42,wr_en(83),rd_en(83),douti422,full(83),empty(83));
u85 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi43,wr_en(84),rd_en(84),douti431,full(84),empty(84));
u86 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi43,wr_en(85),rd_en(85),douti432,full(85),empty(85));
u87 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi44,wr_en(86),rd_en(86),douti441,full(86),empty(86));
u88 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi44,wr_en(87),rd_en(87),douti442,full(87),empty(87));
u89 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi45,wr_en(88),rd_en(88),douti451,full(88),empty(88));
u90 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi45,wr_en(89),rd_en(89),douti452,full(89),empty(89));

u91 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi46,wr_en(90),rd_en(90),douti461,full(90),empty(90));
u92 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi46,wr_en(91),rd_en(91),douti462,full(91),empty(91));
u93 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi47,wr_en(92),rd_en(92),douti471,full(92),empty(92));
u94 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi47,wr_en(93),rd_en(93),douti472,full(93),empty(93));
u95 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi48,wr_en(94),rd_en(94),douti481,full(94),empty(94));
u96 : fifo_generator_0 PORT MAP (rst,clk_1M,clk_72M,sigi48,wr_en(95),rd_en(95),douti482,full(95),empty(95));

--1022帧头rom例化
u97 : m1022_rom
  PORT MAP (
    a => a_1022,
    spo => spo_1022
  );
process				--数据存储过程
	variable state1 : state_type1:=s10;
	variable state2 : state_type2:=s20;
	
	begin
		wait until rising_edge(clk_1M);						--控制fifo的写使能，应该需要再加一个使能信号，表示数据已经到来
			if en='1' then
			case state1 is
				when s10=>if counter1(0)=D-1 then
									state1:=s12;
									counter2(0)<=0;
									counter1(0)<=counter1(0)+1;			--gai
								else
									state1:=s10;
									counter1(0)<=counter1(0)+1;
									wr_en(0)<='1';
									wr_en(1)<='0';
									rd_en_even<='0';
									rd_en_odd<='0';
								end if;
				when s11=>if counter1(0)=D then
									state1:=s12;
									counter2(0)<=counter2(0)+1;			--gai
									counter1(0)<=counter1(0)+1;			--gai
									wr_en(0)<='1';
									wr_en(1)<='1';
									rd_en_even<='0';
									rd_en_odd<='0';
								else
									state1:=s11;
									counter1(0)<=counter1(0)+1;
									wr_en(0)<='1';
									wr_en(1)<='0';
									rd_en_even<='0';
									rd_en_odd<='1';
								end if;
				when s12=>if counter1(0)=frame_len then
									state1:=s13;
									counter1(0)<=0;
									counter2(0)<=counter2(0)+1;
									wr_en(0)<='0';
									wr_en(1)<='1';
									cnt<=cnt+1;
								else
									state1:=s12;
									counter1(0)<=counter1(0)+1;
									counter2(0)<=counter2(0)+1;
									wr_en(0)<='1';
									wr_en(1)<='1';
									rd_en_even<='0';
									rd_en_odd<='0';
									if (counter1(0)>=frame_len-2) and (counter1(0)<=frame_len-1) then
									rd_en_even<='1';
									rd_en_odd<='0';
									end if;
									
								end if;
				when s13=>if counter2(0)=D then
									state1:=s14;		
									counter1(0)<=counter1(0)+1;--gai
									counter2(0)<=counter2(0)+1;--gai
									wr_en(0)<='1';
									wr_en(1)<='1';
									rd_en_even<='0';
									rd_en_odd<='0';
									
								else
									state1:=s13;
									counter2(0)<=counter2(0)+1;
									wr_en(0)<='0';
									wr_en(1)<='1';
									rd_en_even<='1';
									rd_en_odd<='0';
									if cnt=1 then
										headB_en<='1';
									end if;
								end if;
				when s14=>if counter2(0)=frame_len then
									state1:=s11;
									counter2(0)<=0;
									counter1(0)<=counter1(0)+1;    --gai
									wr_en(0)<='1';
									wr_en(1)<='0';
									cnt<=cnt+1;
									
								else
									state1:=s14;
									counter1(0)<=counter1(0)+1;
									counter2(0)<=counter2(0)+1;
									wr_en(0)<='1';
									wr_en(1)<='1';
									rd_en_even<='0';
									rd_en_odd<='0';
									if (counter2(0)>=frame_len-2) and (counter2(0)<=frame_len-1) then
									rd_en_even<='0';
									rd_en_odd<='1';
									end if;
									headB_en<='0';
								end if;
			end case;
			
			case state2 is
				when s20=>if counter1(1)=D-1 then
									state2:=s22;
									counter2(1)<=0;
									counter1(1)<=counter1(1)+1;
								else
									state2:=s20;
									counter1(1)<=counter1(1)+1;
									wr_en(95 downto 2)<="0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101";
								end if;
				when s21=>if counter1(1)=D then
									state2:=s22;
									counter2(1)<=0;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='1';
									wr_en(95 downto 2)<=(others=>'1');
								else
									state2:=s21;
									counter1(1)<=counter1(1)+1;
									wr_en(95 downto 2)<="0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101";
								end if;
				when s22=>if counter1(1)=frame_len then
									state2:=s23;
									counter1(1)<=0;
									counter2(1)<=counter2(1)+1;
									wr_en(95 downto 2)<="1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010";
								else
									state2:=s22;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(95 downto 2)<=(others=>'1');
								end if;
				when s23=>if counter2(1)=D then
									state2:=s24;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(95 downto 2)<=(others=>'1');
								else
									state2:=s23;
									counter2(1)<=counter2(1)+1;
									wr_en(95 downto 2)<="1010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010";
								end if;
				when s24=>if counter2(1)=frame_len then
									state2:=s21;
									counter2(1)<=0;
									counter1(1)<=counter1(1)+1;
									wr_en(95 downto 2)<="0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101";
								else
									state2:=s24;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(95 downto 2)<=(others=>'1');
								end if;
			end case;
			end if;
	end process;
			
		process(clk_72M)													--改帧头使能信号输出，已完成，
			begin
				if rising_edge(clk_72M) then
					if headB_en='1' then
						if cnt_t=1 then
							en_temp<='1';
						else
							en_temp<='0';
						end if;
						
						if counter_headSS=1022 then
							en_temp<='0';
							counter_headSS<=0;
							cnt_t<=cnt_t+1;
							else
							counter_headSS<=counter_headSS+1;
						end if;
						counter_headS<=counter_headSS-1;
						headS_en<=en_temp;
					elsif (rd_en/=0 and counter_out=13932) or (rd_en=0 and counter_headS>0) then
						headS_en<='1';
						counter_headS<=counter_headS+1;
						if counter_headS=1022 then
							headS_en<='0';
							counter_headS<=0;
						end if;
					else
						counter_headS<=0;
						headS_en<='0';
					end if;
				end if;
			end process;
			
		
		--510帧头输出	
		process(clk_72M)
			begin
			if rising_edge(clk_72M) then
					if counter_headS=1020 and headS_en='1' then			--初始525
						if rd_en_even='1' then
							rd_en(0)<='1';
							rd_en(1)<='0';
						elsif rd_en_odd='1' then
							rd_en(0)<='0';
							rd_en(1)<='1';
						end if;
					end if;
					if ((counter_out>=frame_len) and (counter_out<=frame_len+D-1)) then
						rd_en(0)<='0';
						rd_en(1)<='0';
					end if;
			end if;
			end process;
		--信号数据输出	
		process(clk_72M)
		variable temp1 : std_logic_vector(15 downto 0):=(others=>'0');
		variable temp2 : std_logic_vector(15 downto 0):=(others=>'0');
		variable result : std_logic_vector(31 downto 0):=(others=>'0');
			begin
			if rising_edge(clk_72M) then
				--加窗
				if headS_en='1' then
					a_1022<=a_1022+1;
						sig_out<=spo_1022;
				else if rd_en/=0 then				
						a_1022<=(others=>'0');
				--第一帧
					if counter_out<=dd-1 then
						if rd_en(0)='1' then 
							temp1:=douti11;
						elsif rd_en(1)='1' then
							temp1:=douti12;
						end if;
						result:=temp1*wf(counter_out);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第一帧
					elsif ((counter_out>=dd) and (counter_out<=D+dd-1)) then
						if rd_en(0)='1' then 
							temp1:=douti11; 
						elsif rd_en(1)='1' then
							temp1:=douti12;
						end if;
						sig_out<=temp1;
						if counter_out=D+dd-2 then			
							if rd_en(0)='1' then
								rd_en(2)<='1';
							elsif rd_en(1)='1' then
								rd_en(3)<='1';
							end if;
						end if;
						counter_out<=counter_out+1;
				--第一帧、第二帧
					elsif ((counter_out>=D+dd) and (counter_out<=frame_len-1)) then
						if rd_en(0)='1' then 
							temp1:=douti11; 
						elsif rd_en(1)='1' then
							temp1:=douti12;
						end if;
						if rd_en(2)='1' then 
							temp2:=douti21; 
						elsif rd_en(3)='1' then
							temp2:=douti22;
						end if;
						result:=temp1*wb(counter_out-D-dd)+temp2*wf(counter_out-D-dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第二帧
					elsif ((counter_out>=frame_len) and (counter_out<=frame_len+D-1)) then
						if rd_en(2)='1' then 
							temp2:=douti21; 
						elsif rd_en(3)='1' then
							temp2:=douti22;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=frame_len+D-2 then
							if rd_en(2)='1' then
								rd_en(4)<='1';
							elsif rd_en(3)='1' then
								rd_en(5)<='1';
							end if;
						end if;
				--第二帧、第三帧
					elsif ((counter_out>=2*D+2*dd) and (counter_out<=2*D+3*dd-1)) then
						if rd_en(2)='1' then 
							temp1:=douti21; 
						elsif rd_en(3)='1' then
							temp1:=douti22;
						end if;
						if rd_en(4)='1' then 
							temp2:=douti31; 
						elsif rd_en(5)='1' then
							temp2:=douti32;
						end if;
						result:=temp1*wb(counter_out-2*D-2*dd)+temp2*wf(counter_out-2*D-2*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第三帧		
					elsif ((counter_out>=2*D+3*dd) and (counter_out<=3*D+3*dd-1)) then
						rd_en(2)<='0';
						rd_en(3)<='0';
						if rd_en(4)='1' then 
							temp2:=douti31; 
						elsif rd_en(5)='1' then
							temp2:=douti32;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=3*D+3*dd-2 then
							if rd_en(4)='1' then 
								rd_en(6)<='1';
							elsif rd_en(5)='1' then
								rd_en(7)<='1';
							end if;
						end if;
					--第三帧、第四帧
					elsif ((counter_out>=3*D+3*dd) and (counter_out<=3*D+4*dd-1)) then
						if rd_en(4)='1' then 
							temp1:=douti31; 
						elsif rd_en(5)='1' then
							temp1:=douti32;
						end if;
						if rd_en(6)='1' then 
							temp2:=douti41; 
						elsif rd_en(7)='1' then
							temp2:=douti42;
						end if;
						result:=temp1*wb(counter_out-3*D-3*dd)+temp2*wf(counter_out-3*D-3*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第四帧		
					elsif ((counter_out>=3*D+4*dd) and (counter_out<=4*D+4*dd-1)) then
						rd_en(4)<='0';
						rd_en(5)<='0';
						if rd_en(6)='1' then 
							temp2:=douti41; 
						elsif rd_en(7)='1' then
							temp2:=douti42;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=4*D+4*dd-2 then
							if rd_en(6)='1' then 
								rd_en(8)<='1';
							elsif rd_en(7)='1' then
								rd_en(9)<='1';
							end if;
						end if;
					--第四帧、第五帧
					elsif ((counter_out>=4*D+4*dd) and (counter_out<=4*D+5*dd-1)) then
						if rd_en(6)='1' then 
							temp1:=douti41; 
						elsif rd_en(7)='1' then
							temp1:=douti42;
						end if;
						if rd_en(8)='1' then 
							temp2:=douti51; 
						elsif rd_en(9)='1' then
							temp2:=douti52;
						end if;
						result:=temp1*wb(counter_out-4*D-4*dd)+temp2*wf(counter_out-4*D-4*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第5帧		
					elsif ((counter_out>=4*D+5*dd) and (counter_out<=5*D+5*dd-1)) then
						rd_en(6)<='0';
						rd_en(7)<='0';
						if rd_en(8)='1' then 
							temp2:=douti51; 
						elsif rd_en(9)='1' then
							temp2:=douti52;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=5*D+5*dd-2 then
							if rd_en(8)='1' then 
								rd_en(10)<='1';
							elsif rd_en(9)='1' then
								rd_en(11)<='1';
							end if;
						end if;	
					--第5帧、第6帧
					elsif ((counter_out>=5*D+5*dd) and (counter_out<=5*D+6*dd-1)) then
						if rd_en(8)='1' then 
							temp1:=douti51; 
						elsif rd_en(9)='1' then
							temp1:=douti52;
						end if;
						if rd_en(10)='1' then 
							temp2:=douti61; 
						elsif rd_en(11)='1' then
							temp2:=douti62;
						end if;
						result:=temp1*wb(counter_out-5*D-5*dd)+temp2*wf(counter_out-5*D-5*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第6帧		
					elsif ((counter_out>=5*D+6*dd) and (counter_out<=6*D+6*dd-1)) then
						rd_en(8)<='0';
						rd_en(9)<='0';
						if rd_en(10)='1' then 
							temp2:=douti61; 
						elsif rd_en(11)='1' then
							temp2:=douti62;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=6*D+6*dd-2 then
							if rd_en(10)='1' then 
								rd_en(12)<='1';
							elsif rd_en(11)='1' then
								rd_en(13)<='1';
							end if;
						end if;
					--第6帧、第7帧
					elsif ((counter_out>=6*D+6*dd) and (counter_out<=6*D+7*dd-1)) then
						if rd_en(10)='1' then 
							temp1:=douti61; 
						elsif rd_en(11)='1' then
							temp1:=douti62;
						end if;
						if rd_en(12)='1' then 
							temp2:=douti71; 
						elsif rd_en(13)='1' then
							temp2:=douti72;
						end if;
						result:=temp1*wb(counter_out-6*D-6*dd)+temp2*wf(counter_out-6*D-6*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第7帧		
					elsif ((counter_out>=6*D+7*dd) and (counter_out<=7*D+7*dd-1)) then
						rd_en(10)<='0';
						rd_en(11)<='0';
						if rd_en(12)='1' then 
							temp2:=douti71; 
						elsif rd_en(13)='1' then
							temp2:=douti72;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=7*D+7*dd-2 then
							if rd_en(12)='1' then 
								rd_en(14)<='1';
							elsif rd_en(13)='1' then
								rd_en(15)<='1';
							end if;
						end if;	
					--第7帧、第8帧
					elsif ((counter_out>=7*D+7*dd) and (counter_out<=7*D+8*dd-1)) then
						if rd_en(12)='1' then 
							temp1:=douti71; 
						elsif rd_en(13)='1' then
							temp1:=douti72;
						end if;
						if rd_en(14)='1' then 
							temp2:=douti81; 
						elsif rd_en(15)='1' then
							temp2:=douti82;
						end if;
						result:=temp1*wb(counter_out-7*D-7*dd)+temp2*wf(counter_out-7*D-7*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第8帧		
					elsif ((counter_out>=7*D+8*dd) and (counter_out<=8*D+8*dd-1)) then
						rd_en(12)<='0';
						rd_en(13)<='0';
						if rd_en(14)='1' then 
							temp2:=douti81; 
						elsif rd_en(15)='1' then
							temp2:=douti82;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=8*D+8*dd-2 then
							if rd_en(14)='1' then 
								rd_en(16)<='1';
							elsif rd_en(15)='1' then
								rd_en(17)<='1';
							end if;
						end if;	
					--第8帧、第9帧
					elsif ((counter_out>=8*D+8*dd) and (counter_out<=8*D+9*dd-1)) then
						if rd_en(14)='1' then 
							temp1:=douti81; 
						elsif rd_en(15)='1' then
							temp1:=douti82;
						end if;
						if rd_en(16)='1' then 
							temp2:=douti91; 
						elsif rd_en(17)='1' then
							temp2:=douti92;
						end if;
						result:=temp1*wb(counter_out-8*D-8*dd)+temp2*wf(counter_out-8*D-8*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第9帧		
					elsif ((counter_out>=8*D+9*dd) and (counter_out<=9*D+9*dd-1)) then
						rd_en(14)<='0';
						rd_en(15)<='0';
						if rd_en(16)='1' then 
							temp2:=douti91; 
						elsif rd_en(17)='1' then
							temp2:=douti92;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=9*D+9*dd-2 then
							if rd_en(16)='1' then 
								rd_en(18)<='1';
							elsif rd_en(17)='1' then
								rd_en(19)<='1';
							end if;
						end if;	
					--第9帧、第10帧
					elsif ((counter_out>=9*D+9*dd) and (counter_out<=9*D+10*dd-1)) then
						if rd_en(16)='1' then 
							temp1:=douti91; 
						elsif rd_en(17)='1' then
							temp1:=douti92;
						end if;
						if rd_en(18)='1' then 
							temp2:=douti101; 
						elsif rd_en(19)='1' then
							temp2:=douti102;
						end if;
						result:=temp1*wb(counter_out-9*D-9*dd)+temp2*wf(counter_out-9*D-9*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第10帧		
					elsif ((counter_out>=9*D+10*dd) and (counter_out<=10*D+10*dd-1)) then
						rd_en(16)<='0';
						rd_en(17)<='0';
						if rd_en(18)='1' then 
							temp2:=douti101; 
						elsif rd_en(19)='1' then
							temp2:=douti102;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=10*D+10*dd-2 then
							if rd_en(18)='1' then 
								rd_en(20)<='1';
							elsif rd_en(19)='1' then
								rd_en(21)<='1';
							end if;
						end if;
					--第10帧、第11帧
					elsif ((counter_out>=10*D+10*dd) and (counter_out<=10*D+11*dd-1)) then
						if rd_en(18)='1' then 
							temp1:=douti101; 
						elsif rd_en(19)='1' then
							temp1:=douti102;
						end if;
						if rd_en(20)='1' then 
							temp2:=douti111; 
						elsif rd_en(21)='1' then
							temp2:=douti112;
						end if;
						result:=temp1*wb(counter_out-10*D-10*dd)+temp2*wf(counter_out-10*D-10*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第11帧		
					elsif ((counter_out>=10*D+11*dd) and (counter_out<=11*D+11*dd-1)) then
						rd_en(18)<='0';
						rd_en(19)<='0';
						if rd_en(20)='1' then 
							temp2:=douti111; 
						elsif rd_en(21)='1' then
							temp2:=douti112;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=11*D+11*dd-2 then
							if rd_en(20)='1' then 
								rd_en(22)<='1';
							elsif rd_en(21)='1' then
								rd_en(23)<='1';
							end if;
						end if;	
					--第11帧、第12帧
					elsif ((counter_out>=11*D+11*dd) and (counter_out<=11*D+12*dd-1)) then
						if rd_en(20)='1' then 
							temp1:=douti111; 
						elsif rd_en(21)='1' then
							temp1:=douti112;
						end if;
						if rd_en(22)='1' then 
							temp2:=douti121; 
						elsif rd_en(23)='1' then
							temp2:=douti122;
						end if;
						result:=temp1*wb(counter_out-11*D-11*dd)+temp2*wf(counter_out-11*D-11*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第12帧		
					elsif ((counter_out>=11*D+12*dd) and (counter_out<=12*D+12*dd-1)) then
						rd_en(20)<='0';
						rd_en(21)<='0';
						if rd_en(22)='1' then 
							temp2:=douti121; 
						elsif rd_en(23)='1' then
							temp2:=douti122;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=12*D+12*dd-2 then
							if rd_en(22)='1' then 
								rd_en(24)<='1';
							elsif rd_en(23)='1' then
								rd_en(25)<='1';
							end if;
						end if;
					--第12帧、第13帧
					elsif ((counter_out>=12*D+12*dd) and (counter_out<=12*D+13*dd-1)) then
						if rd_en(22)='1' then 
							temp1:=douti121; 
						elsif rd_en(23)='1' then
							temp1:=douti122;
						end if;
						if rd_en(24)='1' then 
							temp2:=douti131; 
						elsif rd_en(25)='1' then
							temp2:=douti132;
						end if;
						result:=temp1*wb(counter_out-12*D-12*dd)+temp2*wf(counter_out-12*D-12*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第13帧		
					elsif ((counter_out>=12*D+13*dd) and (counter_out<=13*D+13*dd-1)) then
						rd_en(22)<='0';
						rd_en(23)<='0';
						if rd_en(24)='1' then 
							temp2:=douti131; 
						elsif rd_en(25)='1' then
							temp2:=douti132;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=13*D+13*dd-2 then
							if rd_en(24)='1' then 
								rd_en(26)<='1';
							elsif rd_en(25)='1' then
								rd_en(27)<='1';
							end if;
						end if;
					--第13帧、第14帧
					elsif ((counter_out>=13*D+13*dd) and (counter_out<=13*D+14*dd-1)) then
						if rd_en(24)='1' then 
							temp1:=douti131; 
						elsif rd_en(25)='1' then
							temp1:=douti132;
						end if;
						if rd_en(26)='1' then 
							temp2:=douti141; 
						elsif rd_en(27)='1' then
							temp2:=douti142;
						end if;
						result:=temp1*wb(counter_out-13*D-13*dd)+temp2*wf(counter_out-13*D-13*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第14帧		
					elsif ((counter_out>=13*D+14*dd) and (counter_out<=14*D+14*dd-1)) then
						rd_en(24)<='0';
						rd_en(25)<='0';
						if rd_en(26)='1' then 
							temp2:=douti141; 
						elsif rd_en(27)='1' then
							temp2:=douti142;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=14*D+14*dd-2 then
							if rd_en(26)='1' then 
								rd_en(28)<='1';
							elsif rd_en(27)='1' then
								rd_en(29)<='1';
							end if;
						end if;	
					--第14帧、第15帧
					elsif ((counter_out>=14*D+14*dd) and (counter_out<=14*D+15*dd-1)) then
						if rd_en(26)='1' then 
							temp1:=douti141; 
						elsif rd_en(27)='1' then
							temp1:=douti142;
						end if;
						if rd_en(28)='1' then 
							temp2:=douti151; 
						elsif rd_en(29)='1' then
							temp2:=douti152;
						end if;
						result:=temp1*wb(counter_out-14*D-14*dd)+temp2*wf(counter_out-14*D-14*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第15帧		
					elsif ((counter_out>=14*D+15*dd) and (counter_out<=15*D+15*dd-1)) then
						rd_en(26)<='0';
						rd_en(27)<='0';
						if rd_en(28)='1' then 
							temp2:=douti151; 
						elsif rd_en(29)='1' then
							temp2:=douti152;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=15*D+15*dd-2 then
							if rd_en(28)='1' then 
								rd_en(30)<='1';
							elsif rd_en(29)='1' then
								rd_en(31)<='1';
							end if;
						end if;		
					--第15帧、第16帧
					elsif ((counter_out>=15*D+15*dd) and (counter_out<=15*D+16*dd-1)) then
						if rd_en(28)='1' then 
							temp1:=douti151; 
						elsif rd_en(29)='1' then
							temp1:=douti152;
						end if;
						if rd_en(30)='1' then 
							temp2:=douti161; 
						elsif rd_en(31)='1' then
							temp2:=douti162;
						end if;
						result:=temp1*wb(counter_out-15*D-15*dd)+temp2*wf(counter_out-15*D-15*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第16帧		
					elsif ((counter_out>=15*D+16*dd) and (counter_out<=16*D+16*dd-1)) then
						rd_en(28)<='0';
						rd_en(29)<='0';
						if rd_en(30)='1' then 
							temp2:=douti161; 
						elsif rd_en(31)='1' then
							temp2:=douti162;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=16*D+16*dd-2 then
							if rd_en(30)='1' then 
								rd_en(32)<='1';
							elsif rd_en(31)='1' then
								rd_en(33)<='1';
							end if;
						end if;	
					--第16帧、第17帧
					elsif ((counter_out>=16*D+16*dd) and (counter_out<=16*D+17*dd-1)) then
						if rd_en(30)='1' then 
							temp1:=douti161; 
						elsif rd_en(31)='1' then
							temp1:=douti162;
						end if;
						if rd_en(32)='1' then 
							temp2:=douti171; 
						elsif rd_en(33)='1' then
							temp2:=douti172;
						end if;
						result:=temp1*wb(counter_out-16*D-16*dd)+temp2*wf(counter_out-16*D-16*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第17帧		
					elsif ((counter_out>=16*D+17*dd) and (counter_out<=17*D+17*dd-1)) then
						rd_en(30)<='0';
						rd_en(31)<='0';
						if rd_en(32)='1' then 
							temp2:=douti171; 
						elsif rd_en(33)='1' then
							temp2:=douti172;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=17*D+17*dd-2 then
							if rd_en(32)='1' then 
								rd_en(34)<='1';
							elsif rd_en(33)='1' then
								rd_en(35)<='1';
							end if;
						end if;
					--第17帧、第18帧
					elsif ((counter_out>=17*D+17*dd) and (counter_out<=17*D+18*dd-1)) then
						if rd_en(32)='1' then 
							temp1:=douti171; 
						elsif rd_en(33)='1' then
							temp1:=douti172;
						end if;
						if rd_en(34)='1' then 
							temp2:=douti181; 
						elsif rd_en(35)='1' then
							temp2:=douti182;
						end if;
						result:=temp1*wb(counter_out-17*D-17*dd)+temp2*wf(counter_out-17*D-17*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第18帧		
					elsif ((counter_out>=17*D+18*dd) and (counter_out<=18*D+18*dd-1)) then
						rd_en(32)<='0';
						rd_en(33)<='0';
						if rd_en(34)='1' then 
							temp2:=douti181; 
						elsif rd_en(35)='1' then
							temp2:=douti182;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=18*D+18*dd-2 then
							if rd_en(34)='1' then 
								rd_en(36)<='1';
							elsif rd_en(35)='1' then
								rd_en(37)<='1';
							end if;
						end if;
					--第18帧、第19帧
					elsif ((counter_out>=18*D+18*dd) and (counter_out<=18*D+19*dd-1)) then
						if rd_en(34)='1' then 
							temp1:=douti181; 
						elsif rd_en(35)='1' then
							temp1:=douti182;
						end if;
						if rd_en(36)='1' then 
							temp2:=douti191; 
						elsif rd_en(37)='1' then
							temp2:=douti192;
						end if;
						result:=temp1*wb(counter_out-18*D-18*dd)+temp2*wf(counter_out-18*D-18*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第19帧		
					elsif ((counter_out>=18*D+19*dd) and (counter_out<=19*D+19*dd-1)) then
						rd_en(34)<='0';
						rd_en(35)<='0';
						if rd_en(36)='1' then 
							temp2:=douti191; 
						elsif rd_en(37)='1' then
							temp2:=douti192;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=19*D+19*dd-2 then
							if rd_en(36)='1' then 
								rd_en(38)<='1';
							elsif rd_en(37)='1' then
								rd_en(39)<='1';
							end if;
						end if;
					--第19帧、第20帧
					elsif ((counter_out>=19*D+19*dd) and (counter_out<=19*D+20*dd-1)) then
						if rd_en(36)='1' then 
							temp1:=douti191; 
						elsif rd_en(37)='1' then
							temp1:=douti192;
						end if;
						if rd_en(38)='1' then 
							temp2:=douti201; 
						elsif rd_en(39)='1' then
							temp2:=douti202;
						end if;
						result:=temp1*wb(counter_out-19*D-19*dd)+temp2*wf(counter_out-19*D-19*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第20帧		
					elsif ((counter_out>=19*D+20*dd) and (counter_out<=20*D+20*dd-1)) then
						rd_en(36)<='0';
						rd_en(37)<='0';
						if rd_en(38)='1' then 
							temp2:=douti201; 
						elsif rd_en(39)='1' then
							temp2:=douti202;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=20*D+20*dd-2 then
							if rd_en(38)='1' then 
								rd_en(40)<='1';
							elsif rd_en(39)='1' then
								rd_en(41)<='1';
							end if;
						end if;
					--第20帧、第21帧
					elsif ((counter_out>=20*D+20*dd) and (counter_out<=20*D+21*dd-1)) then
						if rd_en(38)='1' then 
							temp1:=douti201; 
						elsif rd_en(39)='1' then
							temp1:=douti202;
						end if;
						if rd_en(40)='1' then 
							temp2:=douti211; 
						elsif rd_en(41)='1' then
							temp2:=douti212;
						end if;
						result:=temp1*wb(counter_out-20*D-20*dd)+temp2*wf(counter_out-20*D-20*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第21帧		
					elsif ((counter_out>=20*D+21*dd) and (counter_out<=21*D+21*dd-1)) then
						rd_en(38)<='0';
						rd_en(39)<='0';
						if rd_en(40)='1' then 
							temp2:=douti211; 
						elsif rd_en(41)='1' then
							temp2:=douti212;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=21*D+21*dd-2 then
							if rd_en(40)='1' then 
								rd_en(42)<='1';
							elsif rd_en(41)='1' then
								rd_en(43)<='1';
							end if;
						end if;
					--第21帧、第22帧
					elsif ((counter_out>=21*D+21*dd) and (counter_out<=21*D+22*dd-1)) then
						if rd_en(40)='1' then 
							temp1:=douti211; 
						elsif rd_en(41)='1' then
							temp1:=douti212;
						end if;
						if rd_en(42)='1' then 
							temp2:=douti221; 
						elsif rd_en(43)='1' then
							temp2:=douti222;
						end if;
						result:=temp1*wb(counter_out-21*D-21*dd)+temp2*wf(counter_out-21*D-21*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第22帧		
					elsif ((counter_out>=21*D+22*dd) and (counter_out<=22*D+22*dd-1)) then
						rd_en(40)<='0';
						rd_en(41)<='0';
						if rd_en(42)='1' then 
							temp2:=douti221; 
						elsif rd_en(43)='1' then
							temp2:=douti222;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=22*D+22*dd-2 then
							if rd_en(42)='1' then 
								rd_en(44)<='1';
							elsif rd_en(43)='1' then
								rd_en(45)<='1';
							end if;
						end if;
					--第22帧、第23帧
					elsif ((counter_out>=22*D+22*dd) and (counter_out<=22*D+23*dd-1)) then
						if rd_en(42)='1' then 
							temp1:=douti221; 
						elsif rd_en(43)='1' then
							temp1:=douti222;
						end if;
						if rd_en(44)='1' then 
							temp2:=douti231; 
						elsif rd_en(45)='1' then
							temp2:=douti232;
						end if;
						result:=temp1*wb(counter_out-22*D-22*dd)+temp2*wf(counter_out-22*D-22*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第23帧		
					elsif ((counter_out>=22*D+23*dd) and (counter_out<=23*D+23*dd-1)) then
						rd_en(42)<='0';
						rd_en(43)<='0';
						if rd_en(44)='1' then 
							temp2:=douti231; 
						elsif rd_en(45)='1' then
							temp2:=douti232;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=23*D+23*dd-2 then
							if rd_en(44)='1' then 
								rd_en(46)<='1';
							elsif rd_en(45)='1' then
								rd_en(47)<='1';
							end if;
						end if;
					--第23帧、第24帧
					elsif ((counter_out>=23*D+23*dd) and (counter_out<=23*D+24*dd-1)) then
						if rd_en(44)='1' then 
							temp1:=douti231; 
						elsif rd_en(45)='1' then
							temp1:=douti232;
						end if;
						if rd_en(46)='1' then 
							temp2:=douti241; 
						elsif rd_en(47)='1' then
							temp2:=douti242;
						end if;
						result:=temp1*wb(counter_out-23*D-23*dd)+temp2*wf(counter_out-23*D-23*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第24帧		
					elsif ((counter_out>=23*D+24*dd) and (counter_out<=24*D+24*dd-1)) then
						rd_en(44)<='0';
						rd_en(45)<='0';
						if rd_en(46)='1' then 
							temp2:=douti241; 
						elsif rd_en(47)='1' then
							temp2:=douti242;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=24*D+24*dd-2 then
							if rd_en(46)='1' then 
								rd_en(48)<='1';
							elsif rd_en(47)='1' then
								rd_en(49)<='1';
							end if;
						end if;
					--第24帧、第25帧
					elsif ((counter_out>=24*D+24*dd) and (counter_out<=24*D+25*dd-1)) then
						if rd_en(46)='1' then 
							temp1:=douti241; 
						elsif rd_en(47)='1' then
							temp1:=douti242;
						end if;
						if rd_en(48)='1' then 
							temp2:=douti251; 
						elsif rd_en(49)='1' then
							temp2:=douti252;
						end if;
						result:=temp1*wb(counter_out-24*D-24*dd)+temp2*wf(counter_out-24*D-24*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第25帧		
					elsif ((counter_out>=24*D+25*dd) and (counter_out<=25*D+25*dd-1)) then
						rd_en(46)<='0';
						rd_en(47)<='0';
						if rd_en(48)='1' then 
							temp2:=douti251; 
						elsif rd_en(49)='1' then
							temp2:=douti252;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=25*D+25*dd-2 then
							if rd_en(48)='1' then 
								rd_en(50)<='1';
							elsif rd_en(49)='1' then
								rd_en(51)<='1';
							end if;
						end if;
					--第25帧、第26帧
					elsif ((counter_out>=25*D+25*dd) and (counter_out<=25*D+26*dd-1)) then
						if rd_en(48)='1' then 
							temp1:=douti251; 
						elsif rd_en(49)='1' then
							temp1:=douti252;
						end if;
						if rd_en(50)='1' then 
							temp2:=douti261; 
						elsif rd_en(51)='1' then
							temp2:=douti262;
						end if;
						result:=temp1*wb(counter_out-25*D-25*dd)+temp2*wf(counter_out-25*D-25*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第26帧		
					elsif ((counter_out>=25*D+26*dd) and (counter_out<=26*D+26*dd-1)) then
						rd_en(48)<='0';
						rd_en(49)<='0';
						if rd_en(50)='1' then 
							temp2:=douti261; 
						elsif rd_en(51)='1' then
							temp2:=douti262;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=26*D+26*dd-2 then
							if rd_en(50)='1' then 
								rd_en(52)<='1';
							elsif rd_en(51)='1' then
								rd_en(53)<='1';
							end if;
						end if;
					--第26帧、第27帧
					elsif ((counter_out>=26*D+26*dd) and (counter_out<=26*D+27*dd-1)) then
						if rd_en(50)='1' then 
							temp1:=douti261; 
						elsif rd_en(51)='1' then
							temp1:=douti262;
						end if;
						if rd_en(52)='1' then 
							temp2:=douti271; 
						elsif rd_en(53)='1' then
							temp2:=douti272;
						end if;
						result:=temp1*wb(counter_out-26*D-26*dd)+temp2*wf(counter_out-26*D-26*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第27帧		
					elsif ((counter_out>=26*D+27*dd) and (counter_out<=27*D+27*dd-1)) then
						rd_en(50)<='0';
						rd_en(51)<='0';
						if rd_en(52)='1' then 
							temp2:=douti271; 
						elsif rd_en(53)='1' then
							temp2:=douti272;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=27*D+27*dd-2 then
							if rd_en(52)='1' then 
								rd_en(54)<='1';
							elsif rd_en(53)='1' then
								rd_en(55)<='1';
							end if;
						end if;
					--第27帧、第28帧
					elsif ((counter_out>=27*D+27*dd) and (counter_out<=27*D+28*dd-1)) then
						if rd_en(52)='1' then 
							temp1:=douti271; 
						elsif rd_en(53)='1' then
							temp1:=douti272;
						end if;
						if rd_en(54)='1' then 
							temp2:=douti281; 
						elsif rd_en(55)='1' then
							temp2:=douti282;
						end if;
						result:=temp1*wb(counter_out-27*D-27*dd)+temp2*wf(counter_out-27*D-27*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第28帧		
					elsif ((counter_out>=27*D+28*dd) and (counter_out<=28*D+28*dd-1)) then
						rd_en(52)<='0';
						rd_en(53)<='0';
						if rd_en(54)='1' then 
							temp2:=douti281; 
						elsif rd_en(55)='1' then
							temp2:=douti282;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=28*D+28*dd-2 then
							if rd_en(54)='1' then 
								rd_en(56)<='1';
							elsif rd_en(55)='1' then
								rd_en(57)<='1';
							end if;
						end if;
					--第28帧、第29帧
					elsif ((counter_out>=28*D+28*dd) and (counter_out<=28*D+29*dd-1)) then
						if rd_en(54)='1' then 
							temp1:=douti281; 
						elsif rd_en(55)='1' then
							temp1:=douti282;
						end if;
						if rd_en(56)='1' then 
							temp2:=douti291; 
						elsif rd_en(57)='1' then
							temp2:=douti292;
						end if;
						result:=temp1*wb(counter_out-28*D-28*dd)+temp2*wf(counter_out-28*D-28*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第29帧		
					elsif ((counter_out>=28*D+29*dd) and (counter_out<=29*D+29*dd-1)) then
						rd_en(54)<='0';
						rd_en(55)<='0';
						if rd_en(56)='1' then 
							temp2:=douti291; 
						elsif rd_en(57)='1' then
							temp2:=douti292;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=29*D+29*dd-2 then
							if rd_en(56)='1' then 
								rd_en(58)<='1';
							elsif rd_en(57)='1' then
								rd_en(59)<='1';
							end if;
						end if;
					--第29帧、第30帧
					elsif ((counter_out>=29*D+29*dd) and (counter_out<=29*D+30*dd-1)) then
						if rd_en(56)='1' then 
							temp1:=douti291; 
						elsif rd_en(57)='1' then
							temp1:=douti292;
						end if;
						if rd_en(58)='1' then 
							temp2:=douti301; 
						elsif rd_en(59)='1' then
							temp2:=douti302;
						end if;
						result:=temp1*wb(counter_out-29*D-29*dd)+temp2*wf(counter_out-29*D-29*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第30帧		
					elsif ((counter_out>=29*D+30*dd) and (counter_out<=30*D+30*dd-1)) then
						rd_en(56)<='0';
						rd_en(57)<='0';
						if rd_en(58)='1' then 
							temp2:=douti301; 
						elsif rd_en(59)='1' then
							temp2:=douti302;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=30*D+30*dd-2 then
							if rd_en(58)='1' then 
								rd_en(60)<='1';
							elsif rd_en(59)='1' then
								rd_en(61)<='1';
							end if;
						end if;
					--第30帧、第31帧
					elsif ((counter_out>=30*D+30*dd) and (counter_out<=30*D+31*dd-1)) then
						if rd_en(58)='1' then 
							temp1:=douti301; 
						elsif rd_en(59)='1' then
							temp1:=douti302;
						end if;
						if rd_en(60)='1' then 
							temp2:=douti311; 
						elsif rd_en(61)='1' then
							temp2:=douti312;
						end if;
						result:=temp1*wb(counter_out-30*D-30*dd)+temp2*wf(counter_out-30*D-30*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第31帧		
					elsif ((counter_out>=30*D+31*dd) and (counter_out<=31*D+31*dd-1)) then
						rd_en(58)<='0';
						rd_en(59)<='0';
						if rd_en(60)='1' then 
							temp2:=douti311; 
						elsif rd_en(61)='1' then
							temp2:=douti312;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=31*D+31*dd-2 then
							if rd_en(60)='1' then 
								rd_en(62)<='1';
							elsif rd_en(61)='1' then
								rd_en(63)<='1';
							end if;
						end if;
					--第31帧、第32帧
					elsif ((counter_out>=31*D+31*dd) and (counter_out<=31*D+32*dd-1)) then
						if rd_en(60)='1' then 
							temp1:=douti311; 
						elsif rd_en(61)='1' then
							temp1:=douti312;
						end if;
						if rd_en(62)='1' then 
							temp2:=douti321; 
						elsif rd_en(63)='1' then
							temp2:=douti322;
						end if;
						result:=temp1*wb(counter_out-31*D-31*dd)+temp2*wf(counter_out-31*D-31*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第32帧		
					elsif ((counter_out>=31*D+32*dd) and (counter_out<=32*D+32*dd-1)) then
						rd_en(60)<='0';
						rd_en(61)<='0';
						if rd_en(62)='1' then 
							temp2:=douti321; 
						elsif rd_en(63)='1' then
							temp2:=douti322;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=32*D+32*dd-2 then
							if rd_en(62)='1' then 
								rd_en(64)<='1';
							elsif rd_en(63)='1' then
								rd_en(65)<='1';
							end if;
						end if;
					--第32帧、第33帧
					elsif ((counter_out>=32*D+32*dd) and (counter_out<=32*D+33*dd-1)) then
						if rd_en(62)='1' then 
							temp1:=douti321; 
						elsif rd_en(63)='1' then
							temp1:=douti322;
						end if;
						if rd_en(64)='1' then 
							temp2:=douti331; 
						elsif rd_en(65)='1' then
							temp2:=douti332;
						end if;
						result:=temp1*wb(counter_out-32*D-32*dd)+temp2*wf(counter_out-32*D-32*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第33帧		
					elsif ((counter_out>=32*D+33*dd) and (counter_out<=33*D+33*dd-1)) then
						rd_en(62)<='0';
						rd_en(63)<='0';
						if rd_en(64)='1' then 
							temp2:=douti331; 
						elsif rd_en(65)='1' then
							temp2:=douti332;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=33*D+33*dd-2 then
							if rd_en(64)='1' then 
								rd_en(66)<='1';
							elsif rd_en(65)='1' then
								rd_en(67)<='1';
							end if;
						end if;
					--第33帧、第34帧
					elsif ((counter_out>=33*D+33*dd) and (counter_out<=33*D+34*dd-1)) then
						if rd_en(64)='1' then 
							temp1:=douti331; 
						elsif rd_en(65)='1' then
							temp1:=douti332;
						end if;
						if rd_en(66)='1' then 
							temp2:=douti341; 
						elsif rd_en(67)='1' then
							temp2:=douti342;
						end if;
						result:=temp1*wb(counter_out-33*D-33*dd)+temp2*wf(counter_out-33*D-33*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第34帧		
					elsif ((counter_out>=33*D+34*dd) and (counter_out<=34*D+34*dd-1)) then
						rd_en(64)<='0';
						rd_en(65)<='0';
						if rd_en(66)='1' then 
							temp2:=douti341; 
						elsif rd_en(67)='1' then
							temp2:=douti342;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=34*D+34*dd-2 then
							if rd_en(66)='1' then 
								rd_en(68)<='1';
							elsif rd_en(67)='1' then
								rd_en(69)<='1';
							end if;
						end if;
					--第34帧、第35帧
					elsif ((counter_out>=34*D+34*dd) and (counter_out<=34*D+35*dd-1)) then
						if rd_en(66)='1' then 
							temp1:=douti341; 
						elsif rd_en(67)='1' then
							temp1:=douti342;
						end if;
						if rd_en(68)='1' then 
							temp2:=douti351; 
						elsif rd_en(69)='1' then
							temp2:=douti352;
						end if;
						result:=temp1*wb(counter_out-34*D-34*dd)+temp2*wf(counter_out-34*D-34*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第35帧		
					elsif ((counter_out>=34*D+35*dd) and (counter_out<=35*D+35*dd-1)) then
						rd_en(66)<='0';
						rd_en(67)<='0';
						if rd_en(68)='1' then 
							temp2:=douti351; 
						elsif rd_en(69)='1' then
							temp2:=douti352;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=35*D+35*dd-2 then
							if rd_en(68)='1' then 
								rd_en(70)<='1';
							elsif rd_en(69)='1' then
								rd_en(71)<='1';
							end if;
						end if;
					--第35帧、第36帧
					elsif ((counter_out>=35*D+35*dd) and (counter_out<=35*D+36*dd-1)) then
						if rd_en(68)='1' then 
							temp1:=douti351; 
						elsif rd_en(69)='1' then
							temp1:=douti352;
						end if;
						if rd_en(70)='1' then 
							temp2:=douti361; 
						elsif rd_en(71)='1' then
							temp2:=douti362;
						end if;
						result:=temp1*wb(counter_out-35*D-35*dd)+temp2*wf(counter_out-35*D-35*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第36帧		
					elsif ((counter_out>=35*D+36*dd) and (counter_out<=36*D+36*dd-1)) then
						rd_en(68)<='0';
						rd_en(69)<='0';
						if rd_en(70)='1' then 
							temp2:=douti361; 
						elsif rd_en(71)='1' then
							temp2:=douti362;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=36*D+36*dd-2 then
							if rd_en(70)='1' then 
								rd_en(72)<='1';
							elsif rd_en(71)='1' then
								rd_en(73)<='1';
							end if;
						end if;
					--第36帧、第37帧
					elsif ((counter_out>=36*D+36*dd) and (counter_out<=36*D+37*dd-1)) then
						if rd_en(70)='1' then 
							temp1:=douti361; 
						elsif rd_en(71)='1' then
							temp1:=douti362;
						end if;
						if rd_en(72)='1' then 
							temp2:=douti371; 
						elsif rd_en(73)='1' then
							temp2:=douti372;
						end if;
						result:=temp1*wb(counter_out-36*D-36*dd)+temp2*wf(counter_out-36*D-36*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第37帧		
					elsif ((counter_out>=36*D+37*dd) and (counter_out<=37*D+37*dd-1)) then
						rd_en(70)<='0';
						rd_en(71)<='0';
						if rd_en(72)='1' then 
							temp2:=douti371; 
						elsif rd_en(73)='1' then
							temp2:=douti372;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=37*D+37*dd-2 then
							if rd_en(72)='1' then 
								rd_en(74)<='1';
							elsif rd_en(73)='1' then
								rd_en(75)<='1';
							end if;
						end if;
					--第37帧、第38帧
					elsif ((counter_out>=37*D+37*dd) and (counter_out<=37*D+38*dd-1)) then
						if rd_en(72)='1' then 
							temp1:=douti371; 
						elsif rd_en(73)='1' then
							temp1:=douti372;
						end if;
						if rd_en(74)='1' then 
							temp2:=douti381; 
						elsif rd_en(75)='1' then
							temp2:=douti382;
						end if;
						result:=temp1*wb(counter_out-37*D-37*dd)+temp2*wf(counter_out-37*D-37*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第38帧		
					elsif ((counter_out>=37*D+38*dd) and (counter_out<=38*D+38*dd-1)) then
						rd_en(72)<='0';
						rd_en(73)<='0';
						if rd_en(74)='1' then 
							temp2:=douti381; 
						elsif rd_en(75)='1' then
							temp2:=douti382;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=38*D+38*dd-2 then
							if rd_en(74)='1' then 
								rd_en(76)<='1';
							elsif rd_en(75)='1' then
								rd_en(77)<='1';
							end if;
						end if;
					--第38帧、第39帧
					elsif ((counter_out>=38*D+38*dd) and (counter_out<=38*D+39*dd-1)) then
						if rd_en(74)='1' then 
							temp1:=douti381; 
						elsif rd_en(75)='1' then
							temp1:=douti382;
						end if;
						if rd_en(76)='1' then 
							temp2:=douti391; 
						elsif rd_en(77)='1' then
							temp2:=douti392;
						end if;
						result:=temp1*wb(counter_out-38*D-38*dd)+temp2*wf(counter_out-38*D-38*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第39帧		
					elsif ((counter_out>=38*D+39*dd) and (counter_out<=39*D+39*dd-1)) then
						rd_en(74)<='0';
						rd_en(75)<='0';
						if rd_en(76)='1' then 
							temp2:=douti391; 
						elsif rd_en(77)='1' then
							temp2:=douti392;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=39*D+39*dd-2 then
							if rd_en(76)='1' then 
								rd_en(78)<='1';
							elsif rd_en(77)='1' then
								rd_en(79)<='1';
							end if;
						end if;
					--第39帧、第40帧
					elsif ((counter_out>=39*D+39*dd) and (counter_out<=39*D+40*dd-1)) then
						if rd_en(76)='1' then 
							temp1:=douti391; 
						elsif rd_en(77)='1' then
							temp1:=douti392;
						end if;
						if rd_en(78)='1' then 
							temp2:=douti401; 
						elsif rd_en(79)='1' then
							temp2:=douti402;
						end if;
						result:=temp1*wb(counter_out-39*D-39*dd)+temp2*wf(counter_out-39*D-39*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第40帧		
					elsif ((counter_out>=39*D+40*dd) and (counter_out<=40*D+40*dd-1)) then
						rd_en(76)<='0';
						rd_en(77)<='0';
						if rd_en(78)='1' then 
							temp2:=douti401; 
						elsif rd_en(79)='1' then
							temp2:=douti402;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=40*D+40*dd-2 then
							if rd_en(78)='1' then 
								rd_en(80)<='1';
							elsif rd_en(79)='1' then
								rd_en(81)<='1';
							end if;
						end if;
					--第40帧、第41帧
					elsif ((counter_out>=40*D+40*dd) and (counter_out<=40*D+41*dd-1)) then
						if rd_en(78)='1' then 
							temp1:=douti401; 
						elsif rd_en(79)='1' then
							temp1:=douti402;
						end if;
						if rd_en(80)='1' then 
							temp2:=douti411; 
						elsif rd_en(81)='1' then
							temp2:=douti412;
						end if;
						result:=temp1*wb(counter_out-40*D-40*dd)+temp2*wf(counter_out-40*D-40*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第41帧		
					elsif ((counter_out>=40*D+41*dd) and (counter_out<=41*D+41*dd-1)) then
						rd_en(78)<='0';
						rd_en(79)<='0';
						if rd_en(80)='1' then 
							temp2:=douti411; 
						elsif rd_en(81)='1' then
							temp2:=douti412;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=41*D+41*dd-2 then
							if rd_en(80)='1' then 
								rd_en(82)<='1';
							elsif rd_en(81)='1' then
								rd_en(83)<='1';
							end if;
						end if;	
					--第41帧、第42帧
					elsif ((counter_out>=41*D+41*dd) and (counter_out<=41*D+42*dd-1)) then
						if rd_en(80)='1' then 
							temp1:=douti411; 
						elsif rd_en(81)='1' then
							temp1:=douti412;
						end if;
						if rd_en(82)='1' then 
							temp2:=douti421; 
						elsif rd_en(83)='1' then
							temp2:=douti422;
						end if;
						result:=temp1*wb(counter_out-41*D-41*dd)+temp2*wf(counter_out-41*D-41*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第42帧		
					elsif ((counter_out>=41*D+42*dd) and (counter_out<=42*D+42*dd-1)) then
						rd_en(80)<='0';
						rd_en(81)<='0';
						if rd_en(82)='1' then 
							temp2:=douti421; 
						elsif rd_en(83)='1' then
							temp2:=douti422;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=42*D+42*dd-2 then
							if rd_en(82)='1' then 
								rd_en(84)<='1';
							elsif rd_en(83)='1' then
								rd_en(85)<='1';
							end if;
						end if;	
					--第42帧、第43帧
					elsif ((counter_out>=42*D+42*dd) and (counter_out<=42*D+43*dd-1)) then
						if rd_en(82)='1' then 
							temp1:=douti421; 
						elsif rd_en(83)='1' then
							temp1:=douti422;
						end if;
						if rd_en(84)='1' then 
							temp2:=douti431; 
						elsif rd_en(85)='1' then
							temp2:=douti432;
						end if;
						result:=temp1*wb(counter_out-42*D-42*dd)+temp2*wf(counter_out-42*D-42*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第43帧		
					elsif ((counter_out>=42*D+43*dd) and (counter_out<=43*D+43*dd-1)) then
						rd_en(82)<='0';
						rd_en(83)<='0';
						if rd_en(84)='1' then 
							temp2:=douti431; 
						elsif rd_en(85)='1' then
							temp2:=douti432;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=43*D+43*dd-2 then
							if rd_en(84)='1' then 
								rd_en(86)<='1';
							elsif rd_en(85)='1' then
								rd_en(87)<='1';
							end if;
						end if;	
					--第43帧、第44帧
					elsif ((counter_out>=43*D+43*dd) and (counter_out<=43*D+44*dd-1)) then
						if rd_en(84)='1' then 
							temp1:=douti431; 
						elsif rd_en(85)='1' then
							temp1:=douti432;
						end if;
						if rd_en(86)='1' then 
							temp2:=douti441; 
						elsif rd_en(87)='1' then
							temp2:=douti442;
						end if;
						result:=temp1*wb(counter_out-43*D-43*dd)+temp2*wf(counter_out-43*D-43*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第44帧		
					elsif ((counter_out>=43*D+44*dd) and (counter_out<=44*D+44*dd-1)) then
						rd_en(84)<='0';
						rd_en(85)<='0';
						if rd_en(86)='1' then 
							temp2:=douti441; 
						elsif rd_en(87)='1' then
							temp2:=douti442;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=44*D+44*dd-2 then
							if rd_en(86)='1' then 
								rd_en(88)<='1';
							elsif rd_en(87)='1' then
								rd_en(89)<='1';
							end if;
						end if;	
					--第44帧、第45帧
					elsif ((counter_out>=44*D+44*dd) and (counter_out<=44*D+45*dd-1)) then
						if rd_en(86)='1' then 
							temp1:=douti441; 
						elsif rd_en(87)='1' then
							temp1:=douti442;
						end if;
						if rd_en(88)='1' then 
							temp2:=douti451; 
						elsif rd_en(89)='1' then
							temp2:=douti452;
						end if;
						result:=temp1*wb(counter_out-44*D-44*dd)+temp2*wf(counter_out-44*D-44*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第45帧		
					elsif ((counter_out>=44*D+45*dd) and (counter_out<=45*D+45*dd-1)) then
						rd_en(86)<='0';
						rd_en(87)<='0';
						if rd_en(88)='1' then 
							temp2:=douti451; 
						elsif rd_en(89)='1' then
							temp2:=douti452;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=45*D+45*dd-2 then
							if rd_en(88)='1' then 
								rd_en(90)<='1';
							elsif rd_en(89)='1' then
								rd_en(91)<='1';
							end if;
						end if;	
					--第45帧、第46帧
					elsif ((counter_out>=45*D+45*dd) and (counter_out<=45*D+46*dd-1)) then
						if rd_en(88)='1' then 
							temp1:=douti451; 
						elsif rd_en(89)='1' then
							temp1:=douti452;
						end if;
						if rd_en(90)='1' then 
							temp2:=douti461; 
						elsif rd_en(91)='1' then
							temp2:=douti462;
						end if;
						result:=temp1*wb(counter_out-45*D-45*dd)+temp2*wf(counter_out-45*D-45*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第46帧		
					elsif ((counter_out>=45*D+46*dd) and (counter_out<=46*D+46*dd-1)) then
						rd_en(88)<='0';
						rd_en(89)<='0';
						if rd_en(90)='1' then 
							temp2:=douti461; 
						elsif rd_en(91)='1' then
							temp2:=douti462;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=46*D+46*dd-2 then
							if rd_en(90)='1' then 
								rd_en(92)<='1';
							elsif rd_en(91)='1' then
								rd_en(93)<='1';
							end if;
						end if;	
					--第46帧、第47帧
					elsif ((counter_out>=46*D+46*dd) and (counter_out<=46*D+47*dd-1)) then
						if rd_en(90)='1' then 
							temp1:=douti461; 
						elsif rd_en(91)='1' then
							temp1:=douti462;
						end if;
						if rd_en(92)='1' then 
							temp2:=douti471; 
						elsif rd_en(93)='1' then
							temp2:=douti472;
						end if;
						result:=temp1*wb(counter_out-46*D-46*dd)+temp2*wf(counter_out-46*D-46*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第47帧		
					elsif ((counter_out>=46*D+47*dd) and (counter_out<=47*D+47*dd-1)) then
						rd_en(90)<='0';
						rd_en(91)<='0';
						if rd_en(92)='1' then 
							temp2:=douti471; 
						elsif rd_en(93)='1' then
							temp2:=douti472;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
						if counter_out=47*D+47*dd-2 then
							if rd_en(92)='1' then 
								rd_en(94)<='1';
							elsif rd_en(93)='1' then
								rd_en(95)<='1';
							end if;
						end if;
					--第47帧、第48帧
					elsif ((counter_out>=47*D+47*dd) and (counter_out<=47*D+48*dd-1)) then
						if rd_en(92)='1' then 
							temp1:=douti471; 
						elsif rd_en(93)='1' then
							temp1:=douti472;
						end if;
						if rd_en(94)='1' then 
							temp2:=douti481; 
						elsif rd_en(95)='1' then
							temp2:=douti482;
						end if;
						result:=temp1*wb(counter_out-47*D-47*dd)+temp2*wf(counter_out-47*D-47*dd);
						sig_out<=result(31 downto 16);
						counter_out<=counter_out+1;
				--第48帧		
					elsif ((counter_out>=47*D+48*dd) and (counter_out<=48*D+48*dd-1)) then
						rd_en(92)<='0';
						rd_en(93)<='0';
						if rd_en(94)='1' then 
							temp2:=douti481; 
						elsif rd_en(95)='1' then
							temp2:=douti482;
						end if;
						sig_out<=temp2;
						counter_out<=counter_out+1;
				--第48帧后12点
					elsif ((counter_out>=48*D+48*dd) and (counter_out<=48*D+49*dd-1)) then    		--gaia
						if rd_en(94)='1' then 
							temp2:=douti481; 
						elsif rd_en(95)='1' then
							temp2:=douti482;
						end if;
						result:=temp2*wb(counter_out-48*D-48*dd);			--gaia
						sig_out<=result(31 downto 16);
							counter_out<=counter_out+1;
					elsif counter_out=48*D+49*dd then
						counter_out<=0;
							rd_en(94)<='0';
							rd_en(95)<='0';
							a_1022<=a_1022+1;
							sig_out<=spo_1022;
					end if;
					end if;
				end if;	
			end if;
			end process;
end Behavioral;
