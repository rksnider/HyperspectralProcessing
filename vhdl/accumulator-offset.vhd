-- Generated from Simulink block CMOS_Kernel_Memory_Sync/MH/Math/Kernel Result 0/Accumulator Offset 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity mh_accumulator_offset_0 is
  port (
    input_value : in std_logic_vector( 34-1 downto 0 );
    input_valid : in std_logic_vector( 1-1 downto 0 );
    last_row : in std_logic_vector( 1-1 downto 0 );
    hard_reset : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    accumulator_output : out std_logic_vector( 64-1 downto 0 );
    accumulator_valid : out std_logic_vector( 1-1 downto 0 )
  );
end mh_accumulator_offset_0;
architecture structural of mh_accumulator_offset_0 is 
  signal clk_net : std_logic;
  signal last_combine_s_net : std_logic_vector( 34-1 downto 0 );
  signal delay_addition4_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay2_q_net : std_logic_vector( 1-1 downto 0 );
  signal delay_addition4_q_net_x0 : std_logic_vector( 1-1 downto 0 );
  signal delay_addition8_q_net : std_logic_vector( 1-1 downto 0 );
  signal accumulator_0_q_net : std_logic_vector( 64-1 downto 0 );
  signal ce_net : std_logic;
  signal mux_y_net : std_logic_vector( 34-1 downto 0 );
  signal logical1_y_net : std_logic_vector( 1-1 downto 0 );
  signal logical_y_net : std_logic_vector( 1-1 downto 0 );
  signal delay1_q_net : std_logic_vector( 1-1 downto 0 );
  signal constant_op_net : std_logic_vector( 18-1 downto 0 );
begin
  accumulator_output <= accumulator_0_q_net;
  accumulator_valid <= delay2_q_net;
  last_combine_s_net <= input_value;
  delay_addition4_q_net <= input_valid;
  delay_addition4_q_net_x0 <= last_row;
  delay_addition8_q_net <= hard_reset;
  clk_net <= clk_1;
  ce_net <= ce_1;
  accumulator_0 : entity xil_defaultlib.sysgen_accum_2292eb0fee 
  port map (
    clr => '0',
    b => mux_y_net,
    rst => delay1_q_net,
    clk => clk_net,
    ce => ce_net,
    q => accumulator_0_q_net
  );
  constant_x0 : entity xil_defaultlib.sysgen_constant_8eb6000ba6 
  port map (
    clk => '0',
    ce => '0',
    clr => '0',
    op => constant_op_net
  );
  delay1 : entity xil_defaultlib.mh_xldelay 
  generic map (
    latency => 1,
    reg_retiming => 0,
    reset => 0,
    width => 1
  )
  port map (
    en => '1',
    rst => '0',
