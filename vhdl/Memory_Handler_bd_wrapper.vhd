--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (win64) Build 5076996 Wed May 22 18:37:14 MDT 2024
--Date        : Tue Nov  4 01:17:23 2025
--Host        : Gilgamesh running 64-bit major release  (build 9200)
--Command     : generate_target Memory_Handler_bd_wrapper.bd
--Design      : Memory_Handler_bd_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Memory_Handler_bd_wrapper is
  port (
    clk : in STD_LOGIC;
    data_enable_18_bit : in STD_LOGIC;
    data_in_18_bit : in STD_LOGIC_VECTOR ( 17 downto 0 );
    data_input_12_bit : in STD_LOGIC_VECTOR ( 11 downto 0 );
    kernel_line_gateway_conversion : out STD_LOGIC_VECTOR ( 11 downto 0 );
    kernel_output_gateway_conversion : out STD_LOGIC_VECTOR ( 127 downto 0 );
    kernel_serial_position_gateway_conversion : out STD_LOGIC_VECTOR ( 11 downto 0 );
    valid_kernel_output_gateway_conversion : out STD_LOGIC;
    write_enable_12_bit : in STD_LOGIC
  );
end Memory_Handler_bd_wrapper;

architecture STRUCTURE of Memory_Handler_bd_wrapper is
  component Memory_Handler_bd is
  port (
    clk : in STD_LOGIC;
    data_enable_18_bit : in STD_LOGIC;
    data_in_18_bit : in STD_LOGIC_VECTOR ( 17 downto 0 );
    data_input_12_bit : in STD_LOGIC_VECTOR ( 11 downto 0 );
    kernel_line_gateway_conversion : out STD_LOGIC_VECTOR ( 11 downto 0 );
    kernel_output_gateway_conversion : out STD_LOGIC_VECTOR ( 127 downto 0 );
    kernel_serial_position_gateway_conversion : out STD_LOGIC_VECTOR ( 11 downto 0 );
    valid_kernel_output_gateway_conversion : out STD_LOGIC;
    write_enable_12_bit : in STD_LOGIC
  );
  end component Memory_Handler_bd;
begin
Memory_Handler_bd_i: component Memory_Handler_bd
     port map (
      clk => clk,
      data_enable_18_bit => data_enable_18_bit,
      data_in_18_bit(17 downto 0) => data_in_18_bit(17 downto 0),
      data_input_12_bit(11 downto 0) => data_input_12_bit(11 downto 0),
      kernel_line_gateway_conversion(11 downto 0) => kernel_line_gateway_conversion(11 downto 0),
      kernel_output_gateway_conversion(127 downto 0) => kernel_output_gateway_conversion(127 downto 0),
      kernel_serial_position_gateway_conversion(11 downto 0) => kernel_serial_position_gateway_conversion(11 downto 0),
      valid_kernel_output_gateway_conversion => valid_kernel_output_gateway_conversion,
      write_enable_12_bit => write_enable_12_bit
    );
end STRUCTURE;
