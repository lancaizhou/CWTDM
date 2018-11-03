----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/03 17:10:08
-- Design Name: 
-- Module Name: combine - Behavioral
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

entity combine is
    Port ( clk_1M : in STD_LOGIC;
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
end combine;


architecture Behavioral of combine is
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
--输入计数
type counter is array(47 downto 0) of integer range 0 to frame_len-1;
signal counter1 : counter;
signal counter2 : counter;
--帧头计数
signal counter_headB : integer range 0 to 2200;
signal counter_headS : integer range 0 to 1100;
--帧头计数使能信号
signal counter_headB_en : std_logic:='0';
signal counter_headS_en : std_logic:='0';
--帧头输出使能信号
signal headB_en : std_logic:='0';
signal headS_en : std_logic:='0';
--510帧头计数
signal counter_510 : integer range 0 to 10;
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
type state_type3 is (s30,s31,s32,s33,s34);
type state_type4 is (s40,s41,s42,s43,s44);
type state_type5 is (s50,s51,s52,s53,s54);
type state_type6 is (s60,s61,s62,s63,s64);
type state_type7 is (s70,s71,s72,s73,s74);
type state_type8 is (s80,s81,s82,s83,s84);
type state_type9 is (s90,s91,s92,s93,s94);
type state_type10 is (s100,s101,s102,s103,s104);
type state_type11 is (s110,s111,s112,s113,s114);
type state_type12 is (s120,s121,s122,s123,s124);
type state_type13 is (s130,s131,s132,s133,s134);
type state_type14 is (s140,s141,s142,s143,s144);
type state_type15 is (s150,s151,s152,s153,s154);
type state_type16 is (s160,s161,s162,s163,s164);
type state_type17 is (s170,s171,s172,s173,s174);
type state_type18 is (s180,s181,s182,s183,s184);
type state_type19 is (s190,s191,s192,s193,s194);
type state_type20 is (s200,s201,s202,s203,s204);
type state_type21 is (s210,s211,s212,s213,s214);
type state_type22 is (s220,s221,s222,s223,s224);
type state_type23 is (s230,s231,s232,s233,s234);
type state_type24 is (s240,s241,s242,s243,s244);
type state_type25 is (s250,s251,s252,s253,s254);
type state_type26 is (s260,s261,s262,s263,s264);
type state_type27 is (s270,s271,s272,s273,s274);
type state_type28 is (s280,s281,s282,s283,s284);
type state_type29 is (s290,s291,s292,s293,s294);
type state_type30 is (s300,s301,s302,s303,s304);
type state_type31 is (s310,s311,s312,s313,s314);
type state_type32 is (s320,s321,s322,s323,s324);
type state_type33 is (s330,s331,s332,s333,s334);
type state_type34 is (s340,s341,s342,s343,s344);
type state_type35 is (s350,s351,s352,s353,s354);
type state_type36 is (s360,s361,s362,s363,s364);
type state_type37 is (s370,s371,s372,s373,s374);
type state_type38 is (s380,s381,s382,s383,s384);
type state_type39 is (s390,s391,s392,s393,s394);
type state_type40 is (s400,s401,s402,s403,s404);
type state_type41 is (s410,s411,s412,s413,s414);
type state_type42 is (s420,s421,s422,s423,s424);
type state_type43 is (s430,s431,s432,s433,s434);
type state_type44 is (s440,s441,s442,s443,s444);
type state_type45 is (s450,s451,s452,s453,s454);
type state_type46 is (s460,s461,s462,s463,s464);
type state_type47 is (s470,s471,s472,s473,s474);
type state_type48 is (s480,s481,s482,s483,s484);


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
process
	-- variable k: integer:=1;
	variable state1 : state_type1:=s10;
	variable state2 : state_type2:=s20;
	variable state3 : state_type3:=s30;
	variable state4 : state_type4:=s40;
	variable state5 : state_type5:=s50;
	variable state6 : state_type6:=s60;
	variable state7 : state_type7:=s70;
	variable state8 : state_type8:=s80;
	variable state9 : state_type9:=s90;
	variable state10 : state_type10:=s100;
	variable state11 : state_type11:=s110;
	variable state12 : state_type12:=s120;
	variable state13 : state_type13:=s130;
	variable state14 : state_type14:=s140;
	variable state15 : state_type15:=s150;
	variable state16 : state_type16:=s160;
	variable state17 : state_type17:=s170;
	variable state18 : state_type18:=s180;
	variable state19 : state_type19:=s190;
	variable state20 : state_type20:=s200;
	variable state21 : state_type21:=s210;
	variable state22 : state_type22:=s220;
	variable state23 : state_type23:=s230;
	variable state24 : state_type24:=s240;
	variable state25 : state_type25:=s250;
	variable state26 : state_type26:=s260;
	variable state27 : state_type27:=s270;
	variable state28 : state_type28:=s280;
	variable state29 : state_type29:=s290;
	variable state30 : state_type30:=s300;
	variable state31 : state_type31:=s310;
	variable state32 : state_type32:=s320;
	variable state33 : state_type33:=s330;
	variable state34 : state_type34:=s340;
	variable state35 : state_type35:=s350;
	variable state36 : state_type36:=s360;
	variable state37 : state_type37:=s370;
	variable state38 : state_type38:=s380;
	variable state39 : state_type39:=s390;
	variable state40 : state_type40:=s400;
	variable state41 : state_type41:=s410;
	variable state42 : state_type42:=s420;
	variable state43 : state_type43:=s430;
	variable state44 : state_type44:=s440;
	variable state45 : state_type45:=s450;
	variable state46 : state_type46:=s460;
	variable state47 : state_type47:=s470;
	variable state48 : state_type48:=s480;
	
	begin
		wait until rising_edge(clk_1M);
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
									-- counter2(0)<=0;			
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
								end if;
				when s14=>if counter2(0)=frame_len then
									state1:=s11;
									counter2(0)<=0;
									counter1(0)<=counter1(0)+1;    --gai
									wr_en(0)<='1';
									wr_en(1)<='0';
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
									wr_en(2)<='1';
									wr_en(3)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s21=>if counter1(1)=D then
									state2:=s22;
									counter2(1)<=0;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='1';
								else
									state2:=s21;
									counter1(1)<=counter1(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s22=>if counter1(1)=frame_len then
									state2:=s23;
									counter1(1)<=0;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='0';
									wr_en(3)<='1';
								else
									state2:=s22;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s23=>if counter2(1)=D then
									state2:=s24;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='1';
								else
									state2:=s23;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='0';
									wr_en(3)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s24=>if counter2(1)=frame_len then
									state2:=s21;
									counter2(1)<=0;
									counter1(1)<=counter1(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='0';
								else
									state2:=s24;
									counter1(1)<=counter1(1)+1;
									counter2(1)<=counter2(1)+1;
									wr_en(2)<='1';
									wr_en(3)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;

			case state3 is
				when s30=>if counter1(2)=D-1 then
									state3:=s32;
									counter2(2)<=0;
									counter1(2)<=counter1(2)+1;
								else
									state3:=s30;
									counter1(2)<=counter1(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s31=>if counter1(2)=D then
									state3:=s32;
									counter2(2)<=0;
									counter1(2)<=counter1(2)+1;
									counter2(2)<=counter2(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='1';
								else
									state3:=s31;
									counter1(2)<=counter1(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s32=>if counter1(2)=frame_len then
									state3:=s33;
									counter1(2)<=0;
									counter2(2)<=counter2(2)+1;
									wr_en(4)<='0';
									wr_en(5)<='1';
								else
									state3:=s32;
									counter1(2)<=counter1(2)+1;
									counter2(2)<=counter2(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s33=>if counter2(2)=D then
									state3:=s34;
									-- counter2(2)<=0;
									counter1(2)<=counter1(2)+1;
									counter2(2)<=counter2(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='1';
								else
									state3:=s33;
									counter2(2)<=counter2(2)+1;
									wr_en(4)<='0';
									wr_en(5)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s34=>if counter2(2)=frame_len then
									state3:=s31;
									counter2(2)<=0;
									counter1(2)<=counter1(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='0';
								else
									state3:=s34;
									counter1(2)<=counter1(2)+1;
									counter2(2)<=counter2(2)+1;
									wr_en(4)<='1';
									wr_en(5)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state4 is
				when s40=>if counter1(3)=D-1 then
									state4:=s42;
									counter2(3)<=0;
									counter1(3)<=counter1(3)+1;
								else
									state4:=s40;
									counter1(3)<=counter1(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s41=>if counter1(3)=D then
									state4:=s42;
									counter2(3)<=0;
									counter1(3)<=counter1(3)+1;
									counter2(3)<=counter2(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='1';
								else
									state4:=s41;
									counter1(3)<=counter1(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s42=>if counter1(3)=frame_len then
									state4:=s43;
									counter1(3)<=0;
									counter2(3)<=counter2(3)+1;
									wr_en(6)<='0';
									wr_en(7)<='1';
								else
									state4:=s42;
									counter1(3)<=counter1(3)+1;
									counter2(3)<=counter2(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s43=>if counter2(3)=D then
									state4:=s44;
									counter1(3)<=counter1(3)+1;
									counter2(3)<=counter2(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='1';
								else
									state4:=s43;
									counter2(3)<=counter2(3)+1;
									wr_en(6)<='0';
									wr_en(7)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s44=>if counter2(3)=frame_len then
									state4:=s41;
									counter2(3)<=0;
									counter1(3)<=counter1(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='0';
								else
									state4:=s44;
									counter1(3)<=counter1(3)+1;
									counter2(3)<=counter2(3)+1;
									wr_en(6)<='1';
									wr_en(7)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state5 is
				when s50=>if counter1(4)=D-1 then
									state5:=s52;
									counter2(4)<=0;
									counter1(4)<=counter1(4)+1;
								else
									state5:=s50;
									counter1(4)<=counter1(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s51=>if counter1(4)=D then
									state5:=s52;
									counter2(4)<=0;
									counter1(4)<=counter1(4)+1;
									counter2(4)<=counter2(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='1';
								else
									state5:=s51;
									counter1(4)<=counter1(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s52=>if counter1(4)=frame_len then
									state5:=s53;
									counter1(4)<=0;
									counter2(4)<=counter2(4)+1;
									wr_en(8)<='0';
									wr_en(9)<='1';
								else
									state5:=s52;
									counter1(4)<=counter1(4)+1;
									counter2(4)<=counter2(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s53=>if counter2(4)=D then
									state5:=s54;
									counter1(4)<=counter1(4)+1;
									counter2(4)<=counter2(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='1';
								else
									state5:=s53;
									counter2(4)<=counter2(4)+1;
									wr_en(8)<='0';
									wr_en(9)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s54=>if counter2(4)=frame_len then
									state5:=s51;
									counter2(4)<=0;
									counter1(4)<=counter1(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='0';
								else
									state5:=s54;
									counter1(4)<=counter1(4)+1;
									counter2(4)<=counter2(4)+1;
									wr_en(8)<='1';
									wr_en(9)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state6 is
				when s60=>if counter1(5)=D-1 then
									state6:=s62;
									counter2(5)<=0;
									counter1(5)<=counter1(5)+1;
								else
									state6:=s60;
									counter1(5)<=counter1(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s61=>if counter1(5)=D then
									state6:=s62;
									counter2(5)<=0;
									counter1(5)<=counter1(5)+1;
									counter2(5)<=counter2(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='1';
								else
									state6:=s61;
									counter1(5)<=counter1(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s62=>if counter1(5)=frame_len then
									state6:=s63;
									counter1(5)<=0;
									counter2(5)<=counter2(5)+1;
									wr_en(10)<='0';
									wr_en(11)<='1';
								else
									state6:=s62;
									counter1(5)<=counter1(5)+1;
									counter2(5)<=counter2(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s63=>if counter2(5)=D then
									state6:=s64;
									counter1(5)<=counter1(5)+1;
									counter2(5)<=counter2(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='1';
								else
									state6:=s63;
									counter2(5)<=counter2(5)+1;
									wr_en(10)<='0';
									wr_en(11)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s64=>if counter2(5)=frame_len then
									state6:=s61;
									counter2(5)<=0;
									counter1(5)<=counter1(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='0';
								else
									state6:=s64;
									counter1(5)<=counter1(5)+1;
									counter2(5)<=counter2(5)+1;
									wr_en(10)<='1';
									wr_en(11)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state7 is
				when s70=>if counter1(6)=D-1 then
									state7:=s72;
									counter2(6)<=0;
									counter1(6)<=counter1(6)+1;
								else
									state7:=s70;
									counter1(6)<=counter1(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s71=>if counter1(6)=D then
									state7:=s72;
									counter2(6)<=0;
									counter1(6)<=counter1(6)+1;
									counter2(6)<=counter2(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='1';
								else
									state7:=s71;
									counter1(6)<=counter1(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s72=>if counter1(6)=frame_len then
									state7:=s73;
									counter1(6)<=0;
									counter2(6)<=counter2(6)+1;
									wr_en(12)<='0';
									wr_en(13)<='1';
								else
									state7:=s72;
									counter1(6)<=counter1(6)+1;
									counter2(6)<=counter2(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s73=>if counter2(6)=D then
									state7:=s74;
									counter1(6)<=counter1(6)+1;
									counter2(6)<=counter2(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='1';
								else
									state7:=s73;
									counter2(6)<=counter2(6)+1;
									wr_en(12)<='0';
									wr_en(13)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s74=>if counter2(6)=frame_len then
									state7:=s71;
									counter2(6)<=0;
									counter1(6)<=counter1(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='0';
								else
									state7:=s74;
									counter1(6)<=counter1(6)+1;
									counter2(6)<=counter2(6)+1;
									wr_en(12)<='1';
									wr_en(13)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state8 is
				when s80=>if counter1(7)=D-1 then
									state8:=s82;
									counter2(7)<=0;
									counter1(7)<=counter1(7)+1;
								else
									state8:=s80;
									counter1(7)<=counter1(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s81=>if counter1(7)=D then
									state8:=s82;
									counter2(7)<=0;
									counter1(7)<=counter1(7)+1;
									counter2(7)<=counter2(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='1';
								else
									state8:=s81;
									counter1(7)<=counter1(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s82=>if counter1(7)=frame_len then
									state8:=s83;
									counter1(7)<=0;
									counter2(7)<=counter2(7)+1;
									wr_en(14)<='0';
									wr_en(15)<='1';
								else
									state8:=s82;
									counter1(7)<=counter1(7)+1;
									counter2(7)<=counter2(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s83=>if counter2(7)=D then
									state8:=s84;
									counter1(7)<=counter1(7)+1;
									counter2(7)<=counter2(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='1';
								else
									state8:=s83;
									counter2(7)<=counter2(7)+1;
									wr_en(14)<='0';
									wr_en(15)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s84=>if counter2(7)=frame_len then
									state8:=s81;
									counter2(7)<=0;
									counter1(7)<=counter1(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='0';
								else
									state8:=s84;
									counter1(7)<=counter1(7)+1;
									counter2(7)<=counter2(7)+1;
									wr_en(14)<='1';
									wr_en(15)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state9 is
				when s90=>if counter1(8)=D-1 then
									state9:=s92;
									counter2(8)<=0;
									counter1(8)<=counter1(8)+1;
								else
									state9:=s90;
									counter1(8)<=counter1(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s91=>if counter1(8)=D then
									state9:=s92;
									counter2(8)<=0;
									counter1(8)<=counter1(8)+1;
									counter2(8)<=counter2(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='1';
								else
									state9:=s91;
									counter1(8)<=counter1(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s92=>if counter1(8)=frame_len then
									state9:=s93;
									counter1(8)<=0;
									counter2(8)<=counter2(8)+1;
									wr_en(16)<='0';
									wr_en(17)<='1';
								else
									state9:=s92;
									counter1(8)<=counter1(8)+1;
									counter2(8)<=counter2(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s93=>if counter2(8)=D then
									state9:=s94;
									counter1(8)<=counter1(8)+1;
									counter2(8)<=counter2(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='1';
								else
									state9:=s93;
									counter2(8)<=counter2(8)+1;
									wr_en(16)<='0';
									wr_en(17)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s94=>if counter2(8)=frame_len then
									state9:=s91;
									counter2(8)<=0;
									counter1(8)<=counter1(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='0';
								else
									state9:=s94;
									counter1(8)<=counter1(8)+1;
									counter2(8)<=counter2(8)+1;
									wr_en(16)<='1';
									wr_en(17)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state10 is
				when s100=>if counter1(9)=D-1 then
									state10:=s102;
									counter2(9)<=0;
									counter1(9)<=counter1(9)+1;
								else
									state10:=s100;
									counter1(9)<=counter1(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s101=>if counter1(9)=D then
									state10:=s102;
									counter2(9)<=0;
									counter1(9)<=counter1(9)+1;
									counter2(9)<=counter2(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='1';
								else
									state10:=s101;
									counter1(9)<=counter1(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s102=>if counter1(9)=frame_len then
									state10:=s103;
									counter1(9)<=0;
									counter2(9)<=counter2(9)+1;
									wr_en(18)<='0';
									wr_en(19)<='1';
								else
									state10:=s102;
									counter1(9)<=counter1(9)+1;
									counter2(9)<=counter2(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s103=>if counter2(9)=D then
									state10:=s104;
									counter1(9)<=counter1(9)+1;
									counter2(9)<=counter2(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='1';
								else
									state10:=s103;
									counter2(9)<=counter2(9)+1;
									wr_en(18)<='0';
									wr_en(19)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s104=>if counter2(9)=frame_len then
									state10:=s101;
									counter2(9)<=0;
									counter1(9)<=counter1(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='0';
								else
									state10:=s104;
									counter1(9)<=counter1(9)+1;
									counter2(9)<=counter2(9)+1;
									wr_en(18)<='1';
									wr_en(19)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state11 is
				when s110=>if counter1(10)=D-1 then
									state11:=s112;
									counter2(10)<=0;
									counter1(10)<=counter1(10)+1;
								else
									state11:=s110;
									counter1(10)<=counter1(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s111=>if counter1(10)=D then
									state11:=s112;
									counter2(10)<=0;
									counter1(10)<=counter1(10)+1;
									counter2(10)<=counter2(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='1';
								else
									state11:=s111;
									counter1(10)<=counter1(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s112=>if counter1(10)=frame_len then
									state11:=s113;
									counter1(10)<=0;
									counter2(10)<=counter2(10)+1;
									wr_en(20)<='0';
									wr_en(21)<='1';
								else
									state11:=s112;
									counter1(10)<=counter1(10)+1;
									counter2(10)<=counter2(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s113=>if counter2(10)=D then
									state11:=s114;
									counter1(10)<=counter1(10)+1;
									counter2(10)<=counter2(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='1';
								else
									state11:=s113;
									counter2(10)<=counter2(10)+1;
									wr_en(20)<='0';
									wr_en(21)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s114=>if counter2(10)=frame_len then
									state11:=s111;
									counter2(10)<=0;
									counter1(10)<=counter1(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='0';
								else
									state11:=s114;
									counter1(10)<=counter1(10)+1;
									counter2(10)<=counter2(10)+1;
									wr_en(20)<='1';
									wr_en(21)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state12 is
				when s120=>if counter1(11)=D-1 then
									state12:=s122;
									counter2(11)<=0;
									counter1(11)<=counter1(11)+1;
								else
									state12:=s120;
									counter1(11)<=counter1(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s121=>if counter1(11)=D then
									state12:=s122;
									counter2(11)<=0;
									counter1(11)<=counter1(11)+1;
									counter2(11)<=counter2(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='1';
								else
									state12:=s121;
									counter1(11)<=counter1(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s122=>if counter1(11)=frame_len then
									state12:=s123;
									counter1(11)<=0;
									counter2(11)<=counter2(11)+1;
									wr_en(22)<='0';
									wr_en(23)<='1';
								else
									state12:=s122;
									counter1(11)<=counter1(11)+1;
									counter2(11)<=counter2(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s123=>if counter2(11)=D then
									state12:=s124;
									counter1(11)<=counter1(11)+1;
									counter2(11)<=counter2(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='1';
								else
									state12:=s123;
									counter2(11)<=counter2(11)+1;
									wr_en(22)<='0';
									wr_en(23)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s124=>if counter2(11)=frame_len then
									state12:=s121;
									counter2(11)<=0;
									counter1(11)<=counter1(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='0';
								else
									state12:=s124;
									counter1(11)<=counter1(11)+1;
									counter2(11)<=counter2(11)+1;
									wr_en(22)<='1';
									wr_en(23)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state13 is
				when s130=>if counter1(12)=D-1 then
									state13:=s132;
									counter2(12)<=0;
									counter1(12)<=counter1(12)+1;
								else
									state13:=s130;
									counter1(12)<=counter1(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s131=>if counter1(12)=D then
									state13:=s132;
									counter2(12)<=0;
									counter1(12)<=counter1(12)+1;
									counter2(12)<=counter2(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='1';
								else
									state13:=s131;
									counter1(12)<=counter1(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s132=>if counter1(12)=frame_len then
									state13:=s133;
									counter1(12)<=0;
									counter2(12)<=counter2(12)+1;
									wr_en(24)<='0';
									wr_en(25)<='1';
								else
									state13:=s132;
									counter1(12)<=counter1(12)+1;
									counter2(12)<=counter2(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s133=>if counter2(12)=D then
									state13:=s134;
									counter1(12)<=counter1(12)+1;
									counter2(12)<=counter2(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='1';
								else
									state13:=s133;
									counter2(12)<=counter2(12)+1;
									wr_en(24)<='0';
									wr_en(25)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s134=>if counter2(12)=frame_len then
									state13:=s131;
									counter2(12)<=0;
									counter1(12)<=counter1(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='0';
								else
									state13:=s134;
									counter1(12)<=counter1(12)+1;
									counter2(12)<=counter2(12)+1;
									wr_en(24)<='1';
									wr_en(25)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
	
			case state14 is
				when s140=>if counter1(13)=D-1 then
									state14:=s142;
									counter2(13)<=0;
									counter1(13)<=counter1(13)+1;
								else
									state14:=s140;
									counter1(13)<=counter1(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s141=>if counter1(13)=D then
									state14:=s142;
									counter2(13)<=0;
									counter1(13)<=counter1(13)+1;
									counter2(13)<=counter2(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='1';
								else
									state14:=s141;
									counter1(13)<=counter1(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s142=>if counter1(13)=frame_len then
									state14:=s143;
									counter1(13)<=0;
									counter2(13)<=counter2(13)+1;
									wr_en(26)<='0';
									wr_en(27)<='1';
								else
									state14:=s142;
									counter1(13)<=counter1(13)+1;
									counter2(13)<=counter2(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s143=>if counter2(13)=D then
									state14:=s144;
									counter1(13)<=counter1(13)+1;
									counter2(13)<=counter2(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='1';
								else
									state14:=s143;
									counter2(13)<=counter2(13)+1;
									wr_en(26)<='0';
									wr_en(27)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s144=>if counter2(13)=frame_len then
									state14:=s141;
									counter2(13)<=0;
									counter1(13)<=counter1(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='0';
								else
									state14:=s144;
									counter1(13)<=counter1(13)+1;
									counter2(13)<=counter2(13)+1;
									wr_en(26)<='1';
									wr_en(27)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
	
			case state15 is
				when s150=>if counter1(14)=D-1 then
									state15:=s152;
									counter2(14)<=0;
									counter1(14)<=counter1(14)+1;
								else
									state15:=s150;
									counter1(14)<=counter1(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s151=>if counter1(14)=D then
									state15:=s152;
									counter2(14)<=0;
									counter1(14)<=counter1(14)+1;
									counter2(14)<=counter2(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='1';
								else
									state15:=s151;
									counter1(14)<=counter1(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s152=>if counter1(14)=frame_len then
									state15:=s153;
									counter1(14)<=0;
									counter2(14)<=counter2(14)+1;
									wr_en(28)<='0';
									wr_en(29)<='1';
								else
									state15:=s152;
									counter1(14)<=counter1(14)+1;
									counter2(14)<=counter2(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s153=>if counter2(14)=D then
									state15:=s154;
									counter1(14)<=counter1(14)+1;
									counter2(14)<=counter2(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='1';
								else
									state15:=s153;
									counter2(14)<=counter2(14)+1;
									wr_en(28)<='0';
									wr_en(29)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s154=>if counter2(14)=frame_len then
									state15:=s151;
									counter2(14)<=0;
									counter1(14)<=counter1(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='0';
								else
									state15:=s154;
									counter1(14)<=counter1(14)+1;
									counter2(14)<=counter2(14)+1;
									wr_en(28)<='1';
									wr_en(29)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state16 is
				when s160=>if counter1(15)=D-1 then
									state16:=s162;
									counter2(15)<=0;
									counter1(15)<=counter1(15)+1;
								else
									state16:=s160;
									counter1(15)<=counter1(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s161=>if counter1(15)=D then
									state16:=s162;
									counter2(15)<=0;
									counter1(15)<=counter1(15)+1;
									counter2(15)<=counter2(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='1';
								else
									state16:=s161;
									counter1(15)<=counter1(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s162=>if counter1(15)=frame_len then
									state16:=s163;
									counter1(15)<=0;
									counter2(15)<=counter2(15)+1;
									wr_en(30)<='0';
									wr_en(31)<='1';
								else
									state16:=s162;
									counter1(15)<=counter1(15)+1;
									counter2(15)<=counter2(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s163=>if counter2(15)=D then
									state16:=s164;
									counter1(15)<=counter1(15)+1;
									counter2(15)<=counter2(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='1';
								else
									state16:=s163;
									counter2(15)<=counter2(15)+1;
									wr_en(30)<='0';
									wr_en(31)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s164=>if counter2(15)=frame_len then
									state16:=s161;
									counter2(15)<=0;
									counter1(15)<=counter1(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='0';
								else
									state16:=s164;
									counter1(15)<=counter1(15)+1;
									counter2(15)<=counter2(15)+1;
									wr_en(30)<='1';
									wr_en(31)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state17 is
				when s170=>if counter1(16)=D-1 then
									state17:=s172;
									counter2(16)<=0;
									counter1(16)<=counter1(16)+1;
								else
									state17:=s170;
									counter1(16)<=counter1(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s171=>if counter1(16)=D then
									state17:=s172;
									counter2(16)<=0;
									counter1(16)<=counter1(16)+1;
									counter2(16)<=counter2(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='1';
								else
									state17:=s171;
									counter1(16)<=counter1(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s172=>if counter1(16)=frame_len then
									state17:=s173;
									counter1(16)<=0;
									counter2(16)<=counter2(16)+1;
									wr_en(32)<='0';
									wr_en(33)<='1';
								else
									state17:=s172;
									counter1(16)<=counter1(16)+1;
									counter2(16)<=counter2(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s173=>if counter2(16)=D then
									state17:=s174;
									counter1(16)<=counter1(16)+1;
									counter2(16)<=counter2(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='1';
								else
									state17:=s173;
									counter2(16)<=counter2(16)+1;
									wr_en(32)<='0';
									wr_en(33)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s174=>if counter2(16)=frame_len then
									state17:=s171;
									counter2(16)<=0;
									counter1(16)<=counter1(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='0';
								else
									state17:=s174;
									counter1(16)<=counter1(16)+1;
									counter2(16)<=counter2(16)+1;
									wr_en(32)<='1';
									wr_en(33)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state18 is
				when s180=>if counter1(17)=D-1 then
									state18:=s182;
									counter2(17)<=0;
									counter1(17)<=counter1(17)+1;
								else
									state18:=s180;
									counter1(17)<=counter1(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s181=>if counter1(17)=D then
									state18:=s182;
									counter2(17)<=0;
									counter1(17)<=counter1(17)+1;
									counter2(17)<=counter2(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='1';
								else
									state18:=s181;
									counter1(17)<=counter1(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s182=>if counter1(17)=frame_len then
									state18:=s183;
									counter1(17)<=0;
									counter2(17)<=counter2(17)+1;
									wr_en(34)<='0';
									wr_en(35)<='1';
								else
									state18:=s182;
									counter1(17)<=counter1(17)+1;
									counter2(17)<=counter2(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s183=>if counter2(17)=D then
									state18:=s184;
									counter1(17)<=counter1(17)+1;
									counter2(17)<=counter2(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='1';
								else
									state18:=s183;
									counter2(17)<=counter2(17)+1;
									wr_en(34)<='0';
									wr_en(35)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s184=>if counter2(17)=frame_len then
									state18:=s181;
									counter2(17)<=0;
									counter1(17)<=counter1(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='0';
								else
									state18:=s184;
									counter1(17)<=counter1(17)+1;
									counter2(17)<=counter2(17)+1;
									wr_en(34)<='1';
									wr_en(35)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state19 is
				when s190=>if counter1(18)=D-1 then
									state19:=s192;
									counter2(18)<=0;
									counter1(18)<=counter1(18)+1;
								else
									state19:=s190;
									counter1(18)<=counter1(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s191=>if counter1(18)=D then
									state19:=s192;
									counter2(18)<=0;
									counter1(18)<=counter1(18)+1;
									counter2(18)<=counter2(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='1';
								else
									state19:=s191;
									counter1(18)<=counter1(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s192=>if counter1(18)=frame_len then
									state19:=s193;
									counter1(18)<=0;
									counter2(18)<=counter2(18)+1;
									wr_en(36)<='0';
									wr_en(37)<='1';
								else
									state19:=s192;
									counter1(18)<=counter1(18)+1;
									counter2(18)<=counter2(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s193=>if counter2(18)=D then
									state19:=s194;
									counter1(18)<=counter1(18)+1;
									counter2(18)<=counter2(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='1';
								else
									state19:=s193;
									counter2(18)<=counter2(18)+1;
									wr_en(36)<='0';
									wr_en(37)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s194=>if counter2(18)=frame_len then
									state19:=s191;
									counter2(18)<=0;
									counter1(18)<=counter1(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='0';
								else
									state19:=s194;
									counter1(18)<=counter1(18)+1;
									counter2(18)<=counter2(18)+1;
									wr_en(36)<='1';
									wr_en(37)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state20 is
				when s200=>if counter1(19)=D-1 then
									state20:=s202;
									counter2(19)<=0;
									counter1(19)<=counter1(19)+1;
								else
									state20:=s200;
									counter1(19)<=counter1(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s201=>if counter1(19)=D then
									state20:=s202;
									counter2(19)<=0;
									counter1(19)<=counter1(19)+1;
									counter2(19)<=counter2(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='1';
								else
									state20:=s201;
									counter1(19)<=counter1(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s202=>if counter1(19)=frame_len then
									state20:=s203;
									counter1(19)<=0;
									counter2(19)<=counter2(19)+1;
									wr_en(38)<='0';
									wr_en(39)<='1';
								else
									state20:=s202;
									counter1(19)<=counter1(19)+1;
									counter2(19)<=counter2(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s203=>if counter2(19)=D then
									state20:=s204;
									counter1(19)<=counter1(19)+1;
									counter2(19)<=counter2(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='1';
								else
									state20:=s203;
									counter2(19)<=counter2(19)+1;
									wr_en(38)<='0';
									wr_en(39)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s204=>if counter2(19)=frame_len then
									state20:=s201;
									counter2(19)<=0;
									counter1(19)<=counter1(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='0';
								else
									state20:=s204;
									counter1(19)<=counter1(19)+1;
									counter2(19)<=counter2(19)+1;
									wr_en(38)<='1';
									wr_en(39)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state21 is
				when s210=>if counter1(20)=D-1 then
									state21:=s212;
									counter2(20)<=0;
									counter1(20)<=counter1(20)+1;
								else
									state21:=s210;
									counter1(20)<=counter1(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s211=>if counter1(20)=D then
									state21:=s212;
									counter2(20)<=0;
									counter1(20)<=counter1(20)+1;
									counter2(20)<=counter2(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='1';
								else
									state21:=s211;
									counter1(20)<=counter1(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s212=>if counter1(20)=frame_len then
									state21:=s213;
									counter1(20)<=0;
									counter2(20)<=counter2(20)+1;
									wr_en(40)<='0';
									wr_en(41)<='1';
								else
									state21:=s212;
									counter1(20)<=counter1(20)+1;
									counter2(20)<=counter2(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s213=>if counter2(20)=D then
									state21:=s214;
									counter1(20)<=counter1(20)+1;
									counter2(20)<=counter2(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='1';
								else
									state21:=s213;
									counter2(20)<=counter2(20)+1;
									wr_en(40)<='0';
									wr_en(41)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s214=>if counter2(20)=frame_len then
									state21:=s211;
									counter2(20)<=0;
									counter1(20)<=counter1(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='0';
								else
									state21:=s214;
									counter1(20)<=counter1(20)+1;
									counter2(20)<=counter2(20)+1;
									wr_en(40)<='1';
									wr_en(41)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state22 is
				when s220=>if counter1(21)=D-1 then
									state22:=s222;
									counter2(21)<=0;
									counter1(21)<=counter1(21)+1;
								else
									state22:=s220;
									counter1(21)<=counter1(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s221=>if counter1(21)=D then
									state22:=s222;
									counter2(21)<=0;
									counter1(21)<=counter1(21)+1;
									counter2(21)<=counter2(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='1';
								else
									state22:=s221;
									counter1(21)<=counter1(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s222=>if counter1(21)=frame_len then
									state22:=s223;
									counter1(21)<=0;
									counter2(21)<=counter2(21)+1;
									wr_en(42)<='0';
									wr_en(43)<='1';
								else
									state22:=s222;
									counter1(21)<=counter1(21)+1;
									counter2(21)<=counter2(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s223=>if counter2(21)=D then
									state22:=s224;
									counter1(21)<=counter1(21)+1;
									counter2(21)<=counter2(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='1';
								else
									state22:=s223;
									counter2(21)<=counter2(21)+1;
									wr_en(42)<='0';
									wr_en(43)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s224=>if counter2(21)=frame_len then
									state22:=s221;
									counter2(21)<=0;
									counter1(21)<=counter1(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='0';
								else
									state22:=s224;
									counter1(21)<=counter1(21)+1;
									counter2(21)<=counter2(21)+1;
									wr_en(42)<='1';
									wr_en(43)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state23 is
				when s230=>if counter1(22)=D-1 then
									state23:=s232;
									counter2(22)<=0;
									counter1(22)<=counter1(22)+1;
								else
									state23:=s230;
									counter1(22)<=counter1(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s231=>if counter1(22)=D then
									state23:=s232;
									counter2(22)<=0;
									counter1(22)<=counter1(22)+1;
									counter2(22)<=counter2(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='1';
								else
									state23:=s231;
									counter1(22)<=counter1(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s232=>if counter1(22)=frame_len then
									state23:=s233;
									counter1(22)<=0;
									counter2(22)<=counter2(22)+1;
									wr_en(44)<='0';
									wr_en(45)<='1';
								else
									state23:=s232;
									counter1(22)<=counter1(22)+1;
									counter2(22)<=counter2(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s233=>if counter2(22)=D then
									state23:=s234;
									counter1(22)<=counter1(22)+1;
									counter2(22)<=counter2(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='1';
								else
									state23:=s233;
									counter2(22)<=counter2(22)+1;
									wr_en(44)<='0';
									wr_en(45)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s234=>if counter2(22)=frame_len then
									state23:=s231;
									counter2(22)<=0;
									counter1(22)<=counter1(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='0';
								else
									state23:=s234;
									counter1(22)<=counter1(22)+1;
									counter2(22)<=counter2(22)+1;
									wr_en(44)<='1';
									wr_en(45)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state24 is
				when s240=>if counter1(23)=D-1 then
									state24:=s242;
									counter2(23)<=0;
									counter1(23)<=counter1(23)+1;
								else
									state24:=s240;
									counter1(23)<=counter1(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s241=>if counter1(23)=D then
									state24:=s242;
									counter2(23)<=0;
									counter1(23)<=counter1(23)+1;
									counter2(23)<=counter2(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='1';
								else
									state24:=s241;
									counter1(23)<=counter1(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s242=>if counter1(23)=frame_len then
									state24:=s243;
									counter1(23)<=0;
									counter2(23)<=counter2(23)+1;
									wr_en(46)<='0';
									wr_en(47)<='1';
								else
									state24:=s242;
									counter1(23)<=counter1(23)+1;
									counter2(23)<=counter2(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s243=>if counter2(23)=D then
									state24:=s244;
									counter1(23)<=counter1(23)+1;
									counter2(23)<=counter2(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='1';
								else
									state24:=s243;
									counter2(23)<=counter2(23)+1;
									wr_en(46)<='0';
									wr_en(47)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s244=>if counter2(23)=frame_len then
									state24:=s241;
									counter2(23)<=0;
									counter1(23)<=counter1(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='0';
								else
									state24:=s244;
									counter1(23)<=counter1(23)+1;
									counter2(23)<=counter2(23)+1;
									wr_en(46)<='1';
									wr_en(47)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state25 is
				when s250=>if counter1(24)=D-1 then
									state25:=s252;
									counter2(24)<=0;
									counter1(24)<=counter1(24)+1;
								else
									state25:=s250;
									counter1(24)<=counter1(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s251=>if counter1(24)=D then
									state25:=s252;
									counter2(24)<=0;
									counter1(24)<=counter1(24)+1;
									counter2(24)<=counter2(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='1';
								else
									state25:=s251;
									counter1(24)<=counter1(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s252=>if counter1(24)=frame_len then
									state25:=s253;
									counter1(24)<=0;
									counter2(24)<=counter2(24)+1;	
									wr_en(48)<='0';
									wr_en(49)<='1';
								else
									state25:=s252;
									counter1(24)<=counter1(24)+1;
									counter2(24)<=counter2(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s253=>if counter2(24)=D then
									state25:=s254;
									counter1(24)<=counter1(24)+1;
									counter2(24)<=counter2(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='1';
								else
									state25:=s253;
									counter2(24)<=counter2(24)+1;
									wr_en(48)<='0';
									wr_en(49)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s254=>if counter2(24)=frame_len then
									state25:=s251;
									counter2(24)<=0;
									counter1(24)<=counter1(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='0';
								else
									state25:=s254;
									counter1(24)<=counter1(24)+1;
									counter2(24)<=counter2(24)+1;
									wr_en(48)<='1';
									wr_en(49)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state26 is
				when s260=>if counter1(25)=D-1 then
									state26:=s262;
									counter2(25)<=0;
									counter1(25)<=counter1(25)+1;
								else
									state26:=s260;
									counter1(25)<=counter1(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s261=>if counter1(25)=D then
									state26:=s262;
									counter2(25)<=0;
									counter1(25)<=counter1(25)+1;
									counter2(25)<=counter2(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='1';
								else
									state26:=s261;
									counter1(25)<=counter1(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s262=>if counter1(25)=frame_len then
									state26:=s263;
									counter1(25)<=0;
									counter2(25)<=counter2(25)+1;
									wr_en(50)<='0';
									wr_en(51)<='1';
								else
									state26:=s262;
									counter1(25)<=counter1(25)+1;
									counter2(25)<=counter2(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s263=>if counter2(25)=D then
									state26:=s264;
									counter1(25)<=counter1(25)+1;
									counter2(25)<=counter2(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='1';
								else
									state26:=s263;
									counter2(25)<=counter2(25)+1;
									wr_en(50)<='0';
									wr_en(51)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s264=>if counter2(25)=frame_len then
									state26:=s261;
									counter2(25)<=0;
									counter1(25)<=counter1(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='0';
								else
									state26:=s264;
									counter1(25)<=counter1(25)+1;
									counter2(25)<=counter2(25)+1;
									wr_en(50)<='1';
									wr_en(51)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state27 is
				when s270=>if counter1(26)=D-1 then
									state27:=s272;
									counter2(26)<=0;
									counter1(26)<=counter1(26)+1;
								else
									state27:=s270;
									counter1(26)<=counter1(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s271=>if counter1(26)=D then
									state27:=s272;
									counter2(26)<=0;
									counter1(26)<=counter1(26)+1;
									counter2(26)<=counter2(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='1';
								else
									state27:=s271;
									counter1(26)<=counter1(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s272=>if counter1(26)=frame_len then
									state27:=s273;
									counter1(26)<=0;
									counter2(26)<=counter2(26)+1;
									wr_en(52)<='0';
									wr_en(53)<='1';
								else
									state27:=s272;
									counter1(26)<=counter1(26)+1;
									counter2(26)<=counter2(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s273=>if counter2(26)=D then
									state27:=s274;
									counter1(26)<=counter1(26)+1;
									counter2(26)<=counter2(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='1';
								else
									state27:=s273;
									counter2(26)<=counter2(26)+1;
									wr_en(52)<='0';
									wr_en(53)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s274=>if counter2(26)=frame_len then
									state27:=s271;
									counter2(26)<=0;
									counter1(26)<=counter1(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='0';
								else
									state27:=s274;
									counter1(26)<=counter1(26)+1;
									counter2(26)<=counter2(26)+1;
									wr_en(52)<='1';
									wr_en(53)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state28 is
				when s280=>if counter1(27)=D-1 then
									state28:=s282;
									counter2(27)<=0;
									counter1(27)<=counter1(27)+1;
								else
									state28:=s280;
									counter1(27)<=counter1(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s281=>if counter1(27)=D then
									state28:=s282;
									counter2(27)<=0;
									counter1(27)<=counter1(27)+1;
									counter2(27)<=counter2(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='1';
								else
									state28:=s281;
									counter1(27)<=counter1(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s282=>if counter1(27)=frame_len then
									state28:=s283;
									counter1(27)<=0;
									counter2(27)<=counter2(27)+1;
									wr_en(54)<='0';
									wr_en(55)<='1';
								else
									state28:=s282;
									counter1(27)<=counter1(27)+1;
									counter2(27)<=counter2(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s283=>if counter2(27)=D then
									state28:=s284;
									counter1(27)<=counter1(27)+1;
									counter2(27)<=counter2(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='1';
								else
									state28:=s283;
									counter2(27)<=counter2(27)+1;
									wr_en(54)<='0';
									wr_en(55)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s284=>if counter2(27)=frame_len then
									state28:=s281;
									counter2(27)<=0;
									counter1(27)<=counter1(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='0';
								else
									state28:=s284;
									counter1(27)<=counter1(27)+1;
									counter2(27)<=counter2(27)+1;
									wr_en(54)<='1';
									wr_en(55)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state29 is
				when s290=>if counter1(28)=D-1 then
									state29:=s292;
									counter2(28)<=0;
									counter1(28)<=counter1(28)+1;
								else
									state29:=s290;
									counter1(28)<=counter1(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s291=>if counter1(28)=D then
									state29:=s292;
									counter2(28)<=0;
									counter1(28)<=counter1(28)+1;
									counter2(28)<=counter2(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='1';
								else
									state29:=s291;
									counter1(28)<=counter1(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s292=>if counter1(28)=frame_len then
									state29:=s293;
									counter1(28)<=0;
									counter2(28)<=counter2(28)+1;
									wr_en(56)<='0';
									wr_en(57)<='1';
								else
									state29:=s292;
									counter1(28)<=counter1(28)+1;
									counter2(28)<=counter2(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s293=>if counter2(28)=D then
									state29:=s294;
									counter1(28)<=counter1(28)+1;
									counter2(28)<=counter2(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='1';
								else
									state29:=s293;
									counter2(28)<=counter2(28)+1;
									wr_en(56)<='0';
									wr_en(57)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s294=>if counter2(28)=frame_len then
									state29:=s291;
									counter2(28)<=0;
									counter1(28)<=counter1(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='0';
								else
									state29:=s294;
									counter1(28)<=counter1(28)+1;
									counter2(28)<=counter2(28)+1;
									wr_en(56)<='1';
									wr_en(57)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state30 is
				when s300=>if counter1(29)=D-1 then
									state30:=s302;
									counter2(29)<=0;
									counter1(29)<=counter1(29)+1;
								else
									state30:=s300;
									counter1(29)<=counter1(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s301=>if counter1(29)=D then
									state30:=s302;
									counter2(29)<=0;
									counter1(29)<=counter1(29)+1;
									counter2(29)<=counter2(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='1';
								else
									state30:=s301;
									counter1(29)<=counter1(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s302=>if counter1(29)=frame_len then
									state30:=s303;
									counter1(29)<=0;
									counter2(29)<=counter2(29)+1;
									wr_en(58)<='0';
									wr_en(59)<='1';
								else
									state30:=s302;
									counter1(29)<=counter1(29)+1;
									counter2(29)<=counter2(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s303=>if counter2(29)=D then
									state30:=s304;
									counter1(29)<=counter1(29)+1;
									counter2(29)<=counter2(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='1';
								else
									state30:=s303;
									counter2(29)<=counter2(29)+1;
									wr_en(58)<='0';
									wr_en(59)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s304=>if counter2(29)=frame_len then
									state30:=s301;
									counter2(29)<=0;
									counter1(29)<=counter1(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='0';
								else
									state30:=s304;
									counter1(29)<=counter1(29)+1;
									counter2(29)<=counter2(29)+1;
									wr_en(58)<='1';
									wr_en(59)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state31 is
				when s310=>if counter1(30)=D-1 then
									state31:=s312;
									counter2(30)<=0;
									counter1(30)<=counter1(30)+1;
								else
									state31:=s310;
									counter1(30)<=counter1(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s311=>if counter1(30)=D then
									state31:=s312;
									counter2(30)<=0;
									counter1(30)<=counter1(30)+1;
									counter2(30)<=counter2(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='1';
								else
									state31:=s311;
									counter1(30)<=counter1(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s312=>if counter1(30)=frame_len then
									state31:=s313;
									counter1(30)<=0;
									counter2(30)<=counter2(30)+1;
									wr_en(60)<='0';
									wr_en(61)<='1';
								else
									state31:=s312;
									counter1(30)<=counter1(30)+1;
									counter2(30)<=counter2(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s313=>if counter2(30)=D then
									state31:=s314;
									counter1(30)<=counter1(30)+1;
									counter2(30)<=counter2(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='1';
								else
									state31:=s313;
									counter2(30)<=counter2(30)+1;
									wr_en(60)<='0';
									wr_en(61)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s314=>if counter2(30)=frame_len then
									state31:=s311;
									counter2(30)<=0;
									counter1(30)<=counter1(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='0';
								else
									state31:=s314;
									counter1(30)<=counter1(30)+1;
									counter2(30)<=counter2(30)+1;
									wr_en(60)<='1';
									wr_en(61)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state32 is
				when s320=>if counter1(31)=D-1 then
									state32:=s322;
									counter2(31)<=0;
									counter1(31)<=counter1(31)+1;
								else
									state32:=s320;
									counter1(31)<=counter1(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s321=>if counter1(31)=D then
									state32:=s322;
									counter2(31)<=0;
									counter1(31)<=counter1(31)+1;
									counter2(31)<=counter2(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='1';
								else
									state32:=s321;
									counter1(31)<=counter1(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s322=>if counter1(31)=frame_len then
									state32:=s323;
									counter1(31)<=0;
									counter2(31)<=counter2(31)+1;
									wr_en(62)<='0';
									wr_en(63)<='1';
								else
									state32:=s322;
									counter1(31)<=counter1(31)+1;
									counter2(31)<=counter2(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s323=>if counter2(31)=D then
									state32:=s324;
									counter1(31)<=counter1(31)+1;
									counter2(31)<=counter2(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='1';
								else
									state32:=s323;
									counter2(31)<=counter2(31)+1;
									wr_en(62)<='0';
									wr_en(63)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s324=>if counter2(31)=frame_len then
									state32:=s321;
									counter2(31)<=0;
									counter1(31)<=counter1(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='0';	
								else
									state32:=s324;
									counter1(31)<=counter1(31)+1;
									counter2(31)<=counter2(31)+1;
									wr_en(62)<='1';
									wr_en(63)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state33 is
				when s330=>if counter1(32)=D-1 then
									state33:=s332;
									counter2(32)<=0;
									counter1(32)<=counter1(32)+1;
								else
									state33:=s330;
									counter1(32)<=counter1(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s331=>if counter1(32)=D then
									state33:=s332;
									counter2(32)<=0;
									counter1(32)<=counter1(32)+1;
									counter2(32)<=counter2(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='1';
								else
									state33:=s331;
									counter1(32)<=counter1(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s332=>if counter1(32)=frame_len then
									state33:=s333;
									counter1(32)<=0;
									counter2(32)<=counter2(32)+1;
									wr_en(64)<='0';
									wr_en(65)<='1';
								else
									state33:=s332;
									counter1(32)<=counter1(32)+1;
									counter2(32)<=counter2(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s333=>if counter2(32)=D then
									state33:=s334;
									counter1(32)<=counter1(32)+1;
									counter2(32)<=counter2(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='1';
								else
									state33:=s333;
									counter2(32)<=counter2(32)+1;
									wr_en(64)<='0';
									wr_en(65)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s334=>if counter2(32)=frame_len then
									state33:=s331;
									counter2(32)<=0;
									counter1(32)<=counter1(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='0';
								else
									state33:=s334;
									counter1(32)<=counter1(32)+1;
									counter2(32)<=counter2(32)+1;
									wr_en(64)<='1';
									wr_en(65)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state34 is
				when s340=>if counter1(33)=D-1 then
									state34:=s342;
									counter2(33)<=0;
									counter1(33)<=counter1(33)+1;
								else
									state34:=s340;
									counter1(33)<=counter1(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s341=>if counter1(33)=D then
									state34:=s342;
									counter2(33)<=0;
									counter1(33)<=counter1(33)+1;
									counter2(33)<=counter2(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='1';
								else
									state34:=s341;
									counter1(33)<=counter1(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s342=>if counter1(33)=frame_len then
									state34:=s343;
									counter1(33)<=0;
									counter2(33)<=counter2(33)+1;
									wr_en(66)<='0';
									wr_en(67)<='1';
								else
									state34:=s342;
									counter1(33)<=counter1(33)+1;
									counter2(33)<=counter2(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s343=>if counter2(33)=D then
									state34:=s344;
									counter1(33)<=counter1(33)+1;
									counter2(33)<=counter2(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='1';
								else
									state34:=s343;
									counter2(33)<=counter2(33)+1;
									wr_en(66)<='0';
									wr_en(67)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s344=>if counter2(33)=frame_len then
									state34:=s341;
									counter2(33)<=0;
									counter1(33)<=counter1(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='0';
								else
									state34:=s344;
									counter1(33)<=counter1(33)+1;
									counter2(33)<=counter2(33)+1;
									wr_en(66)<='1';
									wr_en(67)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state35 is
				when s350=>if counter1(34)=D-1 then
									state35:=s352;
									counter2(34)<=0;
									counter1(34)<=counter1(34)+1;
								else
									state35:=s350;
									counter1(34)<=counter1(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s351=>if counter1(34)=D then
									state35:=s352;
									counter2(34)<=0;
									counter1(34)<=counter1(34)+1;
									counter2(34)<=counter2(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='1';
								else
									state35:=s351;
									counter1(34)<=counter1(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s352=>if counter1(34)=frame_len then
									state35:=s353;
									counter1(34)<=0;
									counter2(34)<=counter2(34)+1;
									wr_en(68)<='0';
									wr_en(69)<='1';
								else
									state35:=s352;
									counter1(34)<=counter1(34)+1;
									counter2(34)<=counter2(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s353=>if counter2(34)=D then
									state35:=s354;
									counter1(34)<=counter1(34)+1;
									counter2(34)<=counter2(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='1';
								else
									state35:=s353;
									counter2(34)<=counter2(34)+1;
									wr_en(68)<='0';
									wr_en(69)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s354=>if counter2(34)=frame_len then
									state35:=s351;
									counter2(34)<=0;
									counter1(34)<=counter1(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='0';
								else
									state35:=s354;
									counter1(34)<=counter1(34)+1;
									counter2(34)<=counter2(34)+1;
									wr_en(68)<='1';
									wr_en(69)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state36 is
				when s360=>if counter1(35)=D-1 then
									state36:=s362;
									counter2(35)<=0;
									counter1(35)<=counter1(35)+1;
								else
									state36:=s360;
									counter1(35)<=counter1(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s361=>if counter1(35)=D then
									state36:=s362;
									counter2(35)<=0;
									counter1(35)<=counter1(35)+1;
									counter2(35)<=counter2(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='1';
								else
									state36:=s361;
									counter1(35)<=counter1(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s362=>if counter1(35)=frame_len then
									state36:=s363;
									counter1(35)<=0;
									counter2(35)<=counter2(35)+1;
									wr_en(70)<='0';
									wr_en(71)<='1';
								else
									state36:=s362;
									counter1(35)<=counter1(35)+1;
									counter2(35)<=counter2(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s363=>if counter2(35)=D then
									state36:=s364;
									counter1(35)<=counter1(35)+1;
									counter2(35)<=counter2(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='1';
								else
									state36:=s363;
									counter2(35)<=counter2(35)+1;
									wr_en(70)<='0';
									wr_en(71)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s364=>if counter2(35)=frame_len then
									state36:=s361;
									counter2(35)<=0;
									counter1(35)<=counter1(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='0';
								else
									state36:=s364;
									counter1(35)<=counter1(35)+1;
									counter2(35)<=counter2(35)+1;
									wr_en(70)<='1';
									wr_en(71)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state37 is
				when s370=>if counter1(36)=D-1 then
									state37:=s372;
									counter2(36)<=0;
									counter1(36)<=counter1(36)+1;
								else
									state37:=s370;
									counter1(36)<=counter1(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s371=>if counter1(36)=D then
									state37:=s372;
									counter2(36)<=0;
									counter1(36)<=counter1(36)+1;
									counter2(36)<=counter2(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='1';
								else
									state37:=s371;
									counter1(36)<=counter1(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s372=>if counter1(36)=frame_len then
									state37:=s373;
									counter1(36)<=0;
									counter2(36)<=counter2(36)+1;
									wr_en(72)<='0';
									wr_en(73)<='1';
								else
									state37:=s372;
									counter1(36)<=counter1(36)+1;
									counter2(36)<=counter2(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s373=>if counter2(36)=D then
									state37:=s374;
									counter1(36)<=counter1(36)+1;
									counter2(36)<=counter2(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='1';
								else
									state37:=s373;
									counter2(36)<=counter2(36)+1;
									wr_en(72)<='0';
									wr_en(73)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s374=>if counter2(36)=frame_len then
									state37:=s371;
									counter2(36)<=0;
									counter1(36)<=counter1(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='0';
								else
									state37:=s374;
									counter1(36)<=counter1(36)+1;
									counter2(36)<=counter2(36)+1;
									wr_en(72)<='1';
									wr_en(73)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state38 is
				when s380=>if counter1(37)=D-1 then
									state38:=s382;
									counter2(37)<=0;
									counter1(37)<=counter1(37)+1;
								else
									state38:=s380;
									counter1(37)<=counter1(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s381=>if counter1(37)=D then
									state38:=s382;
									counter2(37)<=0;
									counter1(37)<=counter1(37)+1;
									counter2(37)<=counter2(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='1';
								else
									state38:=s381;
									counter1(37)<=counter1(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s382=>if counter1(37)=frame_len then
									state38:=s383;
									counter1(37)<=0;
									counter2(37)<=counter2(37)+1;
									wr_en(74)<='0';
									wr_en(75)<='1';
								else
									state38:=s382;
									counter1(37)<=counter1(37)+1;
									counter2(37)<=counter2(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s383=>if counter2(37)=D then
									state38:=s384;
									counter1(37)<=counter1(37)+1;
									counter2(37)<=counter2(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='1';
								else
									state38:=s383;
									counter2(37)<=counter2(37)+1;
									wr_en(74)<='0';
									wr_en(75)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s384=>if counter2(37)=frame_len then
									state38:=s381;
									counter2(37)<=0;
									counter1(37)<=counter1(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='0';
								else
									state38:=s384;
									counter1(37)<=counter1(37)+1;
									counter2(37)<=counter2(37)+1;
									wr_en(74)<='1';
									wr_en(75)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state39 is
				when s390=>if counter1(38)=D-1 then
									state39:=s392;
									counter2(38)<=0;
									counter1(38)<=counter1(38)+1;
								else
									state39:=s390;
									counter1(38)<=counter1(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s391=>if counter1(38)=D then
									state39:=s392;
									counter2(38)<=0;
									counter1(38)<=counter1(38)+1;
									counter2(38)<=counter2(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='1';
								else
									state39:=s391;
									counter1(38)<=counter1(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s392=>if counter1(38)=frame_len then
									state39:=s393;
									counter1(38)<=0;
									counter2(38)<=counter2(38)+1;
									wr_en(76)<='0';
									wr_en(77)<='1';
								else
									state39:=s392;
									counter1(38)<=counter1(38)+1;
									counter2(38)<=counter2(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s393=>if counter2(38)=D then
									state39:=s394;
									counter1(38)<=counter1(38)+1;
									counter2(38)<=counter2(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='1';
								else
									state39:=s393;
									counter2(38)<=counter2(38)+1;
									wr_en(76)<='0';
									wr_en(77)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s394=>if counter2(38)=frame_len then
									state39:=s391;
									counter2(38)<=0;
									counter1(38)<=counter1(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='0';
								else
									state39:=s394;
									counter1(38)<=counter1(38)+1;
									counter2(38)<=counter2(38)+1;
									wr_en(76)<='1';
									wr_en(77)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state40 is
				when s400=>if counter1(39)=D-1 then
									state40:=s402;
									counter2(39)<=0;
									counter1(39)<=counter1(39)+1;
								else
									state40:=s400;
									counter1(39)<=counter1(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s401=>if counter1(39)=D then
									state40:=s402;
									counter2(39)<=0;
									counter1(39)<=counter1(39)+1;
									counter2(39)<=counter2(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='1';
								else
									state40:=s401;
									counter1(39)<=counter1(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s402=>if counter1(39)=frame_len then
									state40:=s403;
									counter1(39)<=0;
									counter2(39)<=counter2(39)+1;
									wr_en(78)<='0';
									wr_en(79)<='1';
								else
									state40:=s402;
									counter1(39)<=counter1(39)+1;
									counter2(39)<=counter2(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s403=>if counter2(39)=D then
									state40:=s404;
									counter1(39)<=counter1(39)+1;
									counter2(39)<=counter2(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='1';
								else
									state40:=s403;
									counter2(39)<=counter2(39)+1;
									wr_en(78)<='0';
									wr_en(79)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s404=>if counter2(39)=frame_len then
									state40:=s401;
									counter2(39)<=0;
									counter1(39)<=counter1(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='0';
								else
									state40:=s404;
									counter1(39)<=counter1(39)+1;
									counter2(39)<=counter2(39)+1;
									wr_en(78)<='1';
									wr_en(79)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state41 is
				when s410=>if counter1(40)=D-1 then
									state41:=s412;
									counter2(40)<=0;
									counter1(40)<=counter1(40)+1;
								else
									state41:=s410;
									counter1(40)<=counter1(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s411=>if counter1(40)=D then
									state41:=s412;
									counter2(40)<=0;
									counter1(40)<=counter1(40)+1;
									counter2(40)<=counter2(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='1';
								else
									state41:=s411;
									counter1(40)<=counter1(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s412=>if counter1(40)=frame_len then
									state41:=s413;
									counter1(40)<=0;
									counter2(40)<=counter2(40)+1;
									wr_en(80)<='0';
									wr_en(81)<='1';
								else
									state41:=s412;
									counter1(40)<=counter1(40)+1;
									counter2(40)<=counter2(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s413=>if counter2(40)=D then
									state41:=s414;
									counter1(40)<=counter1(40)+1;
									counter2(40)<=counter2(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='1';
								else
									state41:=s413;
									counter2(40)<=counter2(40)+1;
									wr_en(80)<='0';
									wr_en(81)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s414=>if counter2(40)=frame_len then
									state41:=s411;
									counter2(40)<=0;
									counter1(40)<=counter1(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='0';
								else
									state41:=s414;
									counter1(40)<=counter1(40)+1;
									counter2(40)<=counter2(40)+1;
									wr_en(80)<='1';
									wr_en(81)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state42 is
				when s420=>if counter1(41)=D-1 then
									state42:=s422;
									counter2(41)<=0;
									counter1(41)<=counter1(41)+1;
								else
									state42:=s420;
									counter1(41)<=counter1(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s421=>if counter1(41)=D then
									state42:=s422;
									counter2(41)<=0;
									counter1(41)<=counter1(41)+1;
									counter2(41)<=counter2(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='1';
								else
									state42:=s421;
									counter1(41)<=counter1(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s422=>if counter1(41)=frame_len then
									state42:=s423;
									counter1(41)<=0;
									counter2(41)<=counter2(41)+1;
									wr_en(82)<='0';
									wr_en(83)<='1';
								else
									state42:=s422;
									counter1(41)<=counter1(41)+1;
									counter2(41)<=counter2(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s423=>if counter2(41)=D then
									state42:=s424;
									counter1(41)<=counter1(41)+1;
									counter2(41)<=counter2(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='1';
								else
									state42:=s423;
									counter2(41)<=counter2(41)+1;
									wr_en(82)<='0';
									wr_en(83)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s424=>if counter2(41)=frame_len then
									state42:=s421;
									counter2(41)<=0;
									counter1(41)<=counter1(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='0';
								else
									state42:=s424;
									counter1(41)<=counter1(41)+1;
									counter2(41)<=counter2(41)+1;
									wr_en(82)<='1';
									wr_en(83)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state43 is
				when s430=>if counter1(42)=D-1 then
									state43:=s432;
									counter2(42)<=0;
									counter1(42)<=counter1(42)+1;
								else
									state43:=s430;
									counter1(42)<=counter1(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s431=>if counter1(42)=D then
									state43:=s432;
									counter2(42)<=0;
									counter1(42)<=counter1(42)+1;
									counter2(42)<=counter2(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='1';
								else
									state43:=s431;
									counter1(42)<=counter1(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s432=>if counter1(42)=frame_len then
									state43:=s433;
									counter1(42)<=0;
									counter2(42)<=counter2(42)+1;
									wr_en(84)<='0';
									wr_en(85)<='1';
								else
									state43:=s432;
									counter1(42)<=counter1(42)+1;
									counter2(42)<=counter2(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s433=>if counter2(42)=D then
									state43:=s434;
									counter1(42)<=counter1(42)+1;
									counter2(42)<=counter2(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='1';
								else
									state43:=s433;
									counter2(42)<=counter2(42)+1;
									wr_en(84)<='0';
									wr_en(85)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s434=>if counter2(42)=frame_len then
									state43:=s431;
									counter2(42)<=0;
									counter1(42)<=counter1(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='0';
								else
									state43:=s434;
									counter1(42)<=counter1(42)+1;
									counter2(42)<=counter2(42)+1;
									wr_en(84)<='1';
									wr_en(85)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state44 is
				when s440=>if counter1(43)=D-1 then
									state44:=s442;
									counter2(43)<=0;
									counter1(43)<=counter1(43)+1;
								else
									state44:=s440;
									counter1(43)<=counter1(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s441=>if counter1(43)=D then
									state44:=s442;
									counter2(43)<=0;
									counter1(43)<=counter1(43)+1;
									counter2(43)<=counter2(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='1';
								else
									state44:=s441;
									counter1(43)<=counter1(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s442=>if counter1(43)=frame_len then
									state44:=s443;
									counter1(43)<=0;
									counter2(43)<=counter2(43)+1;
									wr_en(86)<='0';
									wr_en(87)<='1';
								else
									state44:=s442;
									counter1(43)<=counter1(43)+1;
									counter2(43)<=counter2(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s443=>if counter2(43)=D then
									state44:=s444;
									counter1(43)<=counter1(43)+1;
									counter2(43)<=counter2(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='1';
								else
									state44:=s443;
									counter2(43)<=counter2(43)+1;
									wr_en(86)<='0';
									wr_en(87)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s444=>if counter2(43)=frame_len then
									state44:=s441;
									counter2(43)<=0;
									counter1(43)<=counter1(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='0';
								else
									state44:=s444;
									counter1(43)<=counter1(43)+1;
									counter2(43)<=counter2(43)+1;
									wr_en(86)<='1';
									wr_en(87)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state45 is
				when s450=>if counter1(44)=D-1 then
									state45:=s452;
									counter2(44)<=0;
									counter1(44)<=counter1(44)+1;
								else
									state45:=s450;
									counter1(44)<=counter1(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s451=>if counter1(44)=D then
									state45:=s452;
									counter2(44)<=0;
									counter1(44)<=counter1(44)+1;
									counter2(44)<=counter2(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='1';
								else
									state45:=s451;
									counter1(44)<=counter1(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s452=>if counter1(44)=frame_len then
									state45:=s453;
									counter1(44)<=0;
									counter2(44)<=counter2(44)+1;
									wr_en(88)<='0';
									wr_en(89)<='1';
								else
									state45:=s452;
									counter1(44)<=counter1(44)+1;
									counter2(44)<=counter2(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s453=>if counter2(44)=D then
									state45:=s454;
									counter1(44)<=counter1(44)+1;
									counter2(44)<=counter2(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='1';
								else
									state45:=s453;
									counter2(44)<=counter2(44)+1;
									wr_en(88)<='0';
									wr_en(89)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s454=>if counter2(44)=frame_len then
									state45:=s451;
									counter2(44)<=0;
									counter1(44)<=counter1(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='0';
								else
									state45:=s454;
									counter1(44)<=counter1(44)+1;
									counter2(44)<=counter2(44)+1;
									wr_en(88)<='1';
									wr_en(89)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state46 is
				when s460=>if counter1(45)=D-1 then
									state46:=s462;
									counter2(45)<=0;
									counter1(45)<=counter1(45)+1;
								else
									state46:=s460;
									counter1(45)<=counter1(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s461=>if counter1(45)=D then
									state46:=s462;
									counter2(45)<=0;
									counter1(45)<=counter1(45)+1;
									counter2(45)<=counter2(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='1';
								else
									state46:=s461;
									counter1(45)<=counter1(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s462=>if counter1(45)=frame_len then
									state46:=s463;
									counter1(45)<=0;
									counter2(45)<=counter2(45)+1;
									wr_en(90)<='0';
									wr_en(91)<='1';
								else
									state46:=s462;
									counter1(45)<=counter1(45)+1;
									counter2(45)<=counter2(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s463=>if counter2(45)=D then
									state46:=s464;
									counter1(45)<=counter1(45)+1;
									counter2(45)<=counter2(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='1';
								else
									state46:=s463;
									counter2(45)<=counter2(45)+1;
									wr_en(90)<='0';
									wr_en(91)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s464=>if counter2(45)=frame_len then
									state46:=s461;
									counter2(45)<=0;
									counter1(45)<=counter1(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='0';
								else
									state46:=s464;
									counter1(45)<=counter1(45)+1;
									counter2(45)<=counter2(45)+1;
									wr_en(90)<='1';
									wr_en(91)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state47 is
				when s470=>if counter1(46)=D-1 then
									state47:=s472;
									counter2(46)<=0;
									counter1(46)<=counter1(46)+1;
								else
									state47:=s470;
									counter1(46)<=counter1(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s471=>if counter1(46)=D then
									state47:=s472;
									counter2(46)<=0;
									counter1(46)<=counter1(46)+1;
									counter2(46)<=counter2(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='1';
								else
									state47:=s471;
									counter1(46)<=counter1(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s472=>if counter1(46)=frame_len then
									state47:=s473;
									counter1(46)<=0;
									counter2(46)<=counter2(46)+1;
									wr_en(92)<='0';
									wr_en(93)<='1';
								else
									state47:=s472;
									counter1(46)<=counter1(46)+1;
									counter2(46)<=counter2(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s473=>if counter2(46)=D then
									state47:=s474;
									counter1(46)<=counter1(46)+1;
									counter2(46)<=counter2(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='1';
								else
									state47:=s473;
									counter2(46)<=counter2(46)+1;
									wr_en(92)<='0';
									wr_en(93)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s474=>if counter2(46)=frame_len then
									state47:=s471;
									counter2(46)<=0;
									counter1(46)<=counter1(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='0';
								else
									state47:=s474;
									counter1(46)<=counter1(46)+1;
									counter2(46)<=counter2(46)+1;
									wr_en(92)<='1';
									wr_en(93)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
			case state48 is
				when s480=>if counter1(47)=D-1 then
									state48:=s482;
									counter2(47)<=0;
									counter1(47)<=counter1(47)+1;
								else
									state48:=s480;
									counter1(47)<=counter1(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s481=>if counter1(47)=D then
									state48:=s482;
									counter2(47)<=0;
									counter1(47)<=counter1(47)+1;
									counter2(47)<=counter2(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='1';
								else
									state48:=s481;
									counter1(47)<=counter1(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='0';
									-- rd_en(2)<='0';
									-- rd_en(3)<='1';
								end if;
				when s482=>if counter1(47)=frame_len then
									state48:=s483;
									counter1(47)<=0;
									counter2(47)<=counter2(47)+1;
									wr_en(94)<='0';
									wr_en(95)<='1';
								else
									state48:=s482;
									counter1(47)<=counter1(47)+1;
									counter2(47)<=counter2(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
				when s483=>if counter2(47)=D then
									state48:=s484;
									counter1(47)<=counter1(47)+1;
									counter2(47)<=counter2(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='1';
								else
									state48:=s483;
									counter2(47)<=counter2(47)+1;
									wr_en(94)<='0';
									wr_en(95)<='1';
									-- rd_en(2)<='1';
									-- rd_en(3)<='0';
								end if;
				when s484=>if counter2(47)=frame_len then
									state48:=s481;
									counter2(47)<=0;
									counter1(47)<=counter1(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='0';
								else
									state48:=s484;
									counter1(47)<=counter1(47)+1;
									counter2(47)<=counter2(47)+1;
									wr_en(94)<='1';
									wr_en(95)<='1';
									-- rd_en(2)<='0';
									-- rd_en(3)<='0';
								end if;
			end case;
			
	end process;
	--510帧头使能产生
	process(clk_72M)
		begin 
			if (counter1(0)>=283) and (counter1(0)<=302)  then				--初始292、302    1022:283\302
				counter_headS_en<='1';
				elsif (counter2(0)>=283) and (counter2(0)<=302) then
					counter_headS_en<='1';
			else
				counter_headS_en<='0';
			end if;
		end process;
	--510帧头计数，每一个复接帧counter_510加1，没隔10个510帧头插入一个2046帧头	
	process(clk_72M,counter_headS_en)
		begin
			if rising_edge(counter_headS_en) then
				if counter_510=9 then
					counter_510<=0;
				else
					counter_510<=counter_510+1;
				end if;
			end if;
		end process;
		--2046帧头使能产生
		process(clk_72M)
			begin
			if rising_edge(clk_72M) then
				if (counter1(0)>=251) and (counter1(0)<=301) then			--初始251、301  1022:251/301
					if (counter_510=0)  then
						counter_headB_en<='1';					
					elsif ((counter_510=1) and (counter_headS<=17)) then	--初始17
						counter_headB_en<='1';
					else
						counter_headB_en<='0';
					end if;
				end if;
			end if;
			end process;
		--2046帧头输出	
		process(clk_72M)
			begin
			if rising_edge(clk_72M) then
				if counter_headB_en='1' then
					if (counter_headB>=99) and (counter_headB<=99+2045) then			--初始132		1022:132/132+2045
						headB_en<='1';
					else
						headB_en<='0';
					end if;
					counter_headB<=counter_headB+1;
				--if counter_headB=132 then
					--读2046帧头使能有效
					--rom地址加1
					--sig_out<=rom输出
				else
					counter_headB<=0;
				end if;
			end if;
			end process;
		--510帧头输出	
		process(clk_72M)
			begin
			if rising_edge(clk_72M) then
				if counter_headS_en='1' then
					if counter_headS=1073 then			--初始525
						if rd_en_even='1' then
							rd_en(0)<='1';
							rd_en(1)<='0';
						elsif rd_en_odd='1' then
							rd_en(0)<='0';
							rd_en(1)<='1';
						end if;
					end if;
					if (counter_headS>=52) and (counter_headS<=53+1021) then			--初始17
						headS_en<='1';
					else
						headS_en<='0';
						-- a_510<=(others=>'0');
					end if;
					--if counter_headS=17 then
						--读510帧头使能有效
						--rom地址加1
						--sig_out<=rom输出					
						counter_headS<=counter_headS+1;
				else
					if ((counter_out>=frame_len) and (counter_out<=frame_len+D-1)) then
						rd_en(0)<='0';
						rd_en(1)<='0';
					end if;
					counter_headS<=0;
				end if;
			end if;
			end process;
		--信号数据输出	
		process(clk_72M)
		variable temp1 : std_logic_vector(15 downto 0):=(others=>'0');
		variable temp2 : std_logic_vector(15 downto 0):=(others=>'0');
		variable result : std_logic_vector(31 downto 0):=(others=>'0');
		-- variable k : integer;
			begin
			if rising_edge(clk_72M) then
			if counter_headS/=1074 then
				--加窗
				if rd_en/=0 then				
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
						-- sig_out<="11111111";
						-- sig_out<=temp1;
						counter_out<=counter_out+1;
				--第一帧
					elsif ((counter_out>=dd) and (counter_out<=D+dd-1)) then
						if rd_en(0)='1' then 
							temp1:=douti11; 
						elsif rd_en(1)='1' then
							temp1:=douti12;
						end if;
						sig_out<=temp1;
						if counter_out=D+dd-2 then			--有疑问，可能为D+dd-1
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
						-- sig_out<="11111111";
						-- sig_out<=temp1+temp2;
						counter_out<=counter_out+1;
				--第二帧
					elsif ((counter_out>=frame_len) and (counter_out<=frame_len+D-1)) then
						-- rd_en(0)<='0';
						-- rd_en(1)<='0';
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
						-- sig_out<="1111111111111111";
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
						-- sig_out<="1111111111111111";
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
						-- sig_out<="1111111111111111";
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
						-- sig_out<="1111111111111111";
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
						-- sig_out<="1111111111111111";
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
						result:=temp1*wb(counter_out-48*D-48*dd);			--gaia
						sig_out<=result(31 downto 16);
						sig_out<="1111111111111111";
							counter_out<=counter_out+1;
					elsif counter_out=48*D+49*dd then
						counter_out<=0;
							rd_en(94)<='0';
							rd_en(95)<='0';
							a_1022<=a_1022+1;
							sig_out<=spo_1022;
							-- sig_out<="1111000111111111";
					end if;
					else if headS_en='1' then
						a_1022<=a_1022+1;
					sig_out<=spo_1022;
					-- sig_out<="1111000111111111";
					end if;
				end if;
			else 
				a_1022<=a_1022+1;
				sig_out<=spo_1022;
				-- sig_out<="1111000111111111";
			end if;	
			end if;
			end process;
end Behavioral;
