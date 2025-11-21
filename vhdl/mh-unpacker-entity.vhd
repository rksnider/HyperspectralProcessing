-- Generated from Simulink block CMOS_Kernel_Memory_Sync/MH/Data Slicer/Frame RAM Slicer/72 Bit Unpacker RAM 0/Unpack 72 Bit FIFO 0
library IEEE;
use IEEE.std_logic_1164.all;
library xil_defaultlib;
use xil_defaultlib.conv_pkg.all;
entity mh_unpack_72_bit_fifo_0 is
  port (
    x72_bit_input : in std_logic_vector( 72-1 downto 0 );
    x71_downto_60 : out std_logic_vector( 12-1 downto 0 );
    x59_downto_48 : out std_logic_vector( 12-1 downto 0 );
    x47_downto_36 : out std_logic_vector( 12-1 downto 0 );
    x35_downto_24 : out std_logic_vector( 12-1 downto 0 );
    x23_downto_12 : out std_logic_vector( 12-1 downto 0 );
    x11_downto_0 : out std_logic_vector( 12-1 downto 0 )
  );
end mh_unpack_72_bit_fifo_0;
