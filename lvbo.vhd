----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2018/04/18 10:42:00
-- Design Name: 
-- Module Name: lvbo - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 48路数据成形滤波
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

entity lvbo is
  Port (clk_1M : in STD_LOGIC;
           clk_2M : in STD_LOGIC;
		   rst:in std_logic;
           sigi1 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi2 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi3 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi4 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi5 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi6 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi7 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi8 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi9 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi10 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi11 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi12 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi13 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi14 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi15 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi16 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi17 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi18 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi19 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi20 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi21 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi22 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi23 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi24 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi25 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi26 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi27 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi28 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi29 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi30 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi31 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi32 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi33 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi34 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi35 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi36 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi37 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi38 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi39 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi40 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi41 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi42 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi43 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi44 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi45 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi46 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi47 : in STD_LOGIC_VECTOR (7 downto 0);
           sigi48 : in STD_LOGIC_VECTOR (7 downto 0);
           sig_out1 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out2 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out3 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out4 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out5 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out6 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out7 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out8 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out9 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out10 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out11 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out12 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out13 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out14 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out15 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out16 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out17 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out18 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out19 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out20 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out21 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out22 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out23 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out24 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out25 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out26 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out27 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out28 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out29 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out30 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out31 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out32 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out33 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out34 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out35 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out36 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out37 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out38 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out39 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out40 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out41 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out42 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out43 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out44 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out45 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out46 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out47 : out STD_LOGIC_VECTOR (15 downto 0);
           sig_out48 : out STD_LOGIC_VECTOR (15 downto 0));
end lvbo;

architecture Behavioral of lvbo is
signal s_tvalid : std_logic;
signal s_tready : std_logic_vector(47 downto 0);
signal m_tvalid : std_logic_vector(47 downto 0);
COMPONENT fir_compiler_0
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);	
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;
begin
u1 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(0),sigi1,m_tvalid(0),sig_out1);
u2 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(1),sigi2,m_tvalid(1),sig_out2);
u3 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(2),sigi3,m_tvalid(2),sig_out3);
u4 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(3),sigi4,m_tvalid(3),sig_out4);
u5 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(4),sigi5,m_tvalid(4),sig_out5);
u6 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(5),sigi6,m_tvalid(5),sig_out6);
u7 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(6),sigi7,m_tvalid(6),sig_out7);
u8 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(7),sigi8,m_tvalid(7),sig_out8);
u9 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(8),sigi9,m_tvalid(8),sig_out9);
u10 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(9),sigi10,m_tvalid(9),sig_out10);
u11 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(10),sigi11,m_tvalid(10),sig_out11);
u12 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(11),sigi12,m_tvalid(11),sig_out12);
u13 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(12),sigi13,m_tvalid(12),sig_out13);
u14 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(13),sigi14,m_tvalid(13),sig_out14);
u15 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(14),sigi15,m_tvalid(14),sig_out15);
u16 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(15),sigi16,m_tvalid(15),sig_out16);
u17 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(16),sigi17,m_tvalid(16),sig_out17);
u18 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(17),sigi18,m_tvalid(17),sig_out18);
u19 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(18),sigi19,m_tvalid(18),sig_out19);
u20 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(19),sigi20,m_tvalid(19),sig_out20);
u21 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(20),sigi21,m_tvalid(20),sig_out21);
u22 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(21),sigi22,m_tvalid(21),sig_out22);
u23 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(22),sigi23,m_tvalid(22),sig_out23);
u24 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(23),sigi24,m_tvalid(23),sig_out24);
u25 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(24),sigi25,m_tvalid(24),sig_out25);
u26 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(25),sigi26,m_tvalid(25),sig_out26);
u27 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(26),sigi27,m_tvalid(26),sig_out27);
u28 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(27),sigi28,m_tvalid(27),sig_out28);
u29 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(28),sigi29,m_tvalid(28),sig_out29);
u30 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(29),sigi30,m_tvalid(29),sig_out30);
u31 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(30),sigi31,m_tvalid(30),sig_out31);
u32 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(31),sigi32,m_tvalid(31),sig_out32);
u33 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(32),sigi33,m_tvalid(32),sig_out33);
u34 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(33),sigi34,m_tvalid(33),sig_out34);
u35 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(34),sigi35,m_tvalid(34),sig_out35);
u36 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(35),sigi36,m_tvalid(35),sig_out36);
u37 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(36),sigi37,m_tvalid(36),sig_out37);
u38 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(37),sigi38,m_tvalid(37),sig_out38);
u39 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(38),sigi39,m_tvalid(38),sig_out39);
u40 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(39),sigi40,m_tvalid(39),sig_out40);
u41 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(40),sigi41,m_tvalid(40),sig_out41);
u42 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(41),sigi42,m_tvalid(41),sig_out42);
u43 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(42),sigi43,m_tvalid(42),sig_out43);
u44 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(43),sigi44,m_tvalid(43),sig_out44);
u45 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(44),sigi45,m_tvalid(44),sig_out45);
u46 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(45),sigi46,m_tvalid(45),sig_out46);
u47 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(46),sigi47,m_tvalid(46),sig_out47);
u48 : fir_compiler_0 port map(clk_1M,s_tvalid,s_tready(47),sigi48,m_tvalid(47),sig_out48);


end Behavioral;
