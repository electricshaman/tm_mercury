defmodule TM.Mercury.Opcode do
  @opcodes [
    write_flash:                0x01,
    read_flash:                 0x02,
    version:                    0x03,
    boot_firmware:              0x04,
    set_baud_rate:              0x06,
    erase_flash:                0x07,
    verify_image_crc:           0x08,
    boot_bootloader:            0x09,
    hw_version:                 0x10,
    modify_flash:               0x0A,
    get_dsp_silicon_id:         0x0B,
    get_current_program:        0x0C,
    write_flash_sector:         0x0D,
    get_sector_size:            0x0E,
    modify_flash_sector:        0x0F,
    read_tag_id_single:         0x21,
    read_tag_id_multiple:       0x22,
    write_tag_id:               0x23,
    write_tag_data:             0x24,
    lock_tag:                   0x25,
    kill_tag:                   0x26,
    read_tag_data:              0x28,
    get_tag_id_buffer:          0x29,
    clear_tag_id_buffer:        0x2A,
    write_tag_specific:         0x2D,
    erase_block_tag_specific:   0x2E,
    multi_protocol_tag_op:      0x2F,
    get_antenna_port:           0x61,
    get_read_tx_power:          0x62,
    get_tag_protocol:           0x63,
    get_write_tx_power:         0x64,
    get_freq_hop_table:         0x65,
    get_user_gpio_inputs:       0x66,
    get_region:                 0x67,
    get_power_mode:             0x68,
    get_user_mode:              0x69,
    get_reader_optional_params: 0x6A,
    get_protocol_param:         0x6B,
    get_reader_stats:           0x6C,
    get_user_profile:           0x6D,
    get_available_protocols:    0x70,
    get_available_regions:      0x71,
    get_temperature:            0x72,
    set_antenna_port:           0x91,
    set_read_tx_power:          0x92,
    set_tag_protocol:           0x93,
    set_write_tx_power:         0x94,
    set_freq_hop_table:         0x95,
    set_user_gpio_outputs:      0x96,
    set_region:                 0x97,
    set_power_mode:             0x98,
    set_user_mode:              0x99,
    set_reader_optional_params: 0x9a,
    set_protocol_param:         0x9B,
    set_user_profile:           0x9D,
    set_protocol_licensekey:    0x9E,
    set_operating_freq:         0xC1,
    tx_cw_signal:               0xC3,
  ]

  defmacro __using__(_opts) do
    quote location: :keep do
      for {k, v} <- TM.Mercury.Opcode.opcodes do
        k = :"opcode_#{k}"
        Module.register_attribute __MODULE__, k, []
        Module.put_attribute(__MODULE__, k, v)
      end
    end
  end

  def opcodes do
    @opcodes
  end

  for {k, v} <- @opcodes do
    def unquote(k)() do
      unquote(v)
    end
  end
end
