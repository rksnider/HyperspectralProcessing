-- Generated from Simulink block CMOS_Kernel_Memory_Sync/MH/Data Slicer/Frame RAM Slicer/Data Point Tracker
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity mh_data_point_tracker is
  port (
    data_in_ram_0 : in std_logic_vector( 72-1 downto 0 );
    data_in_ram_1 : in std_logic_vector( 72-1 downto 0 );
    data_in_ram_2 : in std_logic_vector( 72-1 downto 0 );
    data_in_ram_3 : in std_logic_vector( 72-1 downto 0 );
    data_in_ram_4 : in std_logic_vector( 72-1 downto 0 );
    valid_enable_in : in std_logic_vector( 1-1 downto 0 );
    clk_1 : in std_logic;
    ce_1 : in std_logic;
    data_out_ram_0 : out std_logic_vector( 72-1 downto 0 );
    data_out_ram_1 : out std_logic_vector( 72-1 downto 0 );
    data_out_ram_2 : out std_logic_vector( 72-1 downto 0 );
    data_out_ram_3 : out std_logic_vector( 72-1 downto 0 );
    data_out_ram_4 : out std_logic_vector( 72-1 downto 0 );
    valid_enable_out : out std_logic_vector( 1-1 downto 0 );
    last_value_out : out std_logic_vector( 1-1 downto 0 )
  );
end mh_data_point_tracker;
architecture structural of mh_data_point_tracker is 
  signal valid_delay_0_q_net : std_logic_vector( 1-1 downto 0 );
  signal last_point_op_net : std_logic_vector( 1-1 downto 0 );
  signal last_data_point_value_op_net : std_logic_vector( 7-1 downto 0 );
  signal data_point_counter_op_net : std_logic_vector( 7-1 downto 0 );
  signal data_in_delay_1_ram_0_q_net : std_logic_vector( 72-1 downto 0 );
  signal data_in_delay_1_ram_1_q_net : std_logic_vector( 72-1 downto 0 );
  signal data_in_delay_1_ram_3_q_net : std_logic_vector( 72-1 downto 0 );
  signal last_value_enable_y_net : std_logic_vector( 1-1 downto 0 );
  signal dual_port_ram_1_douta_net : std_logic_vector( 72-1 downto 0 );
  signal ce_net : std_logic;
