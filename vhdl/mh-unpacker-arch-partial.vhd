architecture structural of mh_unpack_72_bit_fifo_0 is 
  signal slice_35_down_to_24_y_net : std_logic_vector( 12-1 downto 0 );
  signal slice_59_down_to_48_y_net : std_logic_vector( 12-1 downto 0 );
  signal slice_47_down_to_36_y_net : std_logic_vector( 12-1 downto 0 );
  signal x72bit_frame_fifo_0_dout_net : std_logic_vector( 72-1 downto 0 );
  signal slice_71_down_to_60_y_net : std_logic_vector( 12-1 downto 0 );
  signal slice_11_down_to_0_y_net : std_logic_vector( 12-1 downto 0 );
  signal slice_23_down_to_12_y_net : std_logic_vector( 12-1 downto 0 );
begin
  x71_downto_60 <= slice_71_down_to_60_y_net;
  x59_downto_48 <= slice_59_down_to_48_y_net;
  x47_downto_36 <= slice_47_down_to_36_y_net;
  x35_downto_24 <= slice_35_down_to_24_y_net;
  x23_downto_12 <= slice_23_down_to_12_y_net;
  x11_downto_0 <= slice_11_down_to_0_y_net;
  x72bit_frame_fifo_0_dout_net <= x72_bit_input;
  slice_11_down_to_0 : entity xil_defaultlib.mh_xlslice 
  generic map (
    new_lsb => 0,
    new_msb => 11,
    x_width => 72,
    y_width => 12
  )
  port map (
    x => x72bit_frame_fifo_0_dout_net,
    y => slice_11_down_to_0_y_net
  );
  slice_23_down_to_12 : entity xil_defaultlib.mh_xlslice 
  generic map (
    new_lsb => 12,
    new_msb => 23,
    x_width => 72,
    y_width => 12
  )
  port map (
    x => x72bit_frame_fifo_0_dout_net,
    y => slice_23_down_to_12_y_net
  );
  slice_35_down_to_24 : entity xil_defaultlib.mh_xlslice 
  generic map (
    new_lsb => 24,
    new_msb => 35,
    x_width => 72,
    y_width => 12
  )
  port map (
    x => x72bit_frame_fifo_0_dout_net,
    y => slice_35_down_to_24_y_net
  );
