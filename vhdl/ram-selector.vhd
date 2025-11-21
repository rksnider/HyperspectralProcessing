-- Generated from Simulink block CMOS_Kernel_Memory_Sync/MH/Memory Manager/Scanline Memory Subsystem/RAM Selector 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity mh_ram_selector_0_x0 is
  port (
    data_in : in std_logic_vector( 17-1 downto 0 );
    ram_select : in std_logic_vector( 3-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    out_ram_0 : out std_logic_vector( 17-1 downto 0 );
    out_ram_1 : out std_logic_vector( 17-1 downto 0 );
    out_ram_2 : out std_logic_vector( 17-1 downto 0 );
    out_ram_3 : out std_logic_vector( 17-1 downto 0 );
    out_ram_4 : out std_logic_vector( 17-1 downto 0 )
  );
end mh_ram_selector_0_x0;
architecture structural of mh_ram_selector_0_x0 is 
  signal clk_net : std_logic;
  signal delay_q_net : std_logic_vector( 17-1 downto 0 );
  signal line_out_ram_3_y_net : std_logic_vector( 17-1 downto 0 );
  signal delay_2_q_net : std_logic_vector( 17-1 downto 0 );
  signal line_out_ram_4_y_net : std_logic_vector( 17-1 downto 0 );
  signal ce_net : std_logic;
  signal line_out_ram_1_y_net : std_logic_vector( 17-1 downto 0 );
  signal constant1_op_net : std_logic_vector( 1-1 downto 0 );
  signal line_out_ram_0_y_net : std_logic_vector( 17-1 downto 0 );
  signal delay_3_q_net : std_logic_vector( 3-1 downto 0 );
  signal line_out_ram_2_y_net : std_logic_vector( 17-1 downto 0 );
  signal sel_value_ram_1_op_net : std_logic_vector( 3-1 downto 0 );
  signal sel_value_ram_2_op_net : std_logic_vector( 3-1 downto 0 );
  signal sel_ram_0_op_net : std_logic_vector( 1-1 downto 0 );
  signal sel_ram_1_op_net : std_logic_vector( 1-1 downto 0 );
  signal sel_ram_2_op_net : std_logic_vector( 1-1 downto 0 );
  signal sel_ram_4_op_net : std_logic_vector( 1-1 downto 0 );
  signal sel_ram_3_op_net : std_logic_vector( 1-1 downto 0 );
  signal sel_value_ram_0_op_net : std_logic_vector( 3-1 downto 0 );
  signal sel_value_ram_4_op_net : std_logic_vector( 3-1 downto 0 );
  signal sel_value_ram_3_op_net : std_logic_vector( 3-1 downto 0 );
begin
  out_ram_0 <= line_out_ram_0_y_net;
  out_ram_1 <= line_out_ram_1_y_net;
  out_ram_2 <= line_out_ram_2_y_net;
  out_ram_3 <= line_out_ram_3_y_net;
  out_ram_4 <= line_out_ram_4_y_net;
  delay_2_q_net <= data_in;
  delay_3_q_net <= ram_select;
  clk_net <= clk_1;
  ce_net <= ce_1;
  constant1 : entity xil_defaultlib.sysgen_constant_a598ef7898 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant1_op_net
  );
  delay : entity xil_defaultlib.mh_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 17
  )
