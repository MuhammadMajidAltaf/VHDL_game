-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.2 (win64) Build 1577090 Thu Jun  2 16:32:40 MDT 2016
-- Date        : Tue Jan 10 09:15:50 2017
-- Host        : DESKTOP-IB3KRIO running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               C:/Users/Tibo/Documents/programmable_logic/_game/_game.srcs/sources_1/ip/GAME_OVER_ROM/GAME_OVER_ROM_sim_netlist.vhdl
-- Design      : GAME_OVER_ROM
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z010clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GAME_OVER_ROM_rom is
  port (
    spo : out STD_LOGIC_VECTOR ( 0 to 0 );
    a : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of GAME_OVER_ROM_rom : entity is "rom";
end GAME_OVER_ROM_rom;

architecture STRUCTURE of GAME_OVER_ROM_rom is
  signal \spo[0]_INST_0_i_10_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_11_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_12_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_13_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_14_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_15_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_16_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_17_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_18_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_19_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_1_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_20_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_21_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_22_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_23_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_24_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_25_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_26_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_27_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_28_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_29_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_30_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_3_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_4_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_5_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_6_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_7_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_8_n_0\ : STD_LOGIC;
  signal \spo[0]_INST_0_i_9_n_0\ : STD_LOGIC;
begin
\spo[0]_INST_0\: unisim.vcomponents.MUXF7
     port map (
      I0 => \spo[0]_INST_0_i_1_n_0\,
      I1 => \spo[0]_INST_0_i_2_n_0\,
      O => spo(0),
      S => a(11)
    );
\spo[0]_INST_0_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"B8BBB888"
    )
        port map (
      I0 => \spo[0]_INST_0_i_3_n_0\,
      I1 => a(13),
      I2 => \spo[0]_INST_0_i_4_n_0\,
      I3 => a(12),
      I4 => \spo[0]_INST_0_i_5_n_0\,
      O => \spo[0]_INST_0_i_1_n_0\
    );
\spo[0]_INST_0_i_10\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[0]_INST_0_i_24_n_0\,
      I1 => \spo[0]_INST_0_i_25_n_0\,
      I2 => a(7),
      I3 => \spo[0]_INST_0_i_26_n_0\,
      I4 => a(6),
      I5 => \spo[0]_INST_0_i_27_n_0\,
      O => \spo[0]_INST_0_i_10_n_0\
    );
\spo[0]_INST_0_i_11\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[0]_INST_0_i_13_n_0\,
      I1 => \spo[0]_INST_0_i_14_n_0\,
      I2 => a(7),
      I3 => \spo[0]_INST_0_i_26_n_0\,
      I4 => a(6),
      I5 => \spo[0]_INST_0_i_28_n_0\,
      O => \spo[0]_INST_0_i_11_n_0\
    );
\spo[0]_INST_0_i_12\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[0]_INST_0_i_17_n_0\,
      I1 => \spo[0]_INST_0_i_29_n_0\,
      I2 => a(7),
      I3 => \spo[0]_INST_0_i_22_n_0\,
      I4 => a(6),
      I5 => \spo[0]_INST_0_i_30_n_0\,
      O => \spo[0]_INST_0_i_12_n_0\
    );
\spo[0]_INST_0_i_13\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222A800037768191"
    )
        port map (
      I0 => a(5),
      I1 => a(2),
      I2 => a(1),
      I3 => a(0),
      I4 => a(3),
      I5 => a(4),
      O => \spo[0]_INST_0_i_13_n_0\
    );
\spo[0]_INST_0_i_14\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C7D7D35220200000"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(2),
      I3 => a(0),
      I4 => a(1),
      I5 => a(3),
      O => \spo[0]_INST_0_i_14_n_0\
    );
\spo[0]_INST_0_i_15\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1100004555777777"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(0),
      I3 => a(2),
      I4 => a(1),
      I5 => a(3),
      O => \spo[0]_INST_0_i_15_n_0\
    );
\spo[0]_INST_0_i_16\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"88802AA800017E6E"
    )
        port map (
      I0 => a(5),
      I1 => a(2),
      I2 => a(1),
      I3 => a(0),
      I4 => a(3),
      I5 => a(4),
      O => \spo[0]_INST_0_i_16_n_0\
    );
\spo[0]_INST_0_i_17\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"55557FFFFFFE8191"
    )
        port map (
      I0 => a(5),
      I1 => a(2),
      I2 => a(1),
      I3 => a(0),
      I4 => a(3),
      I5 => a(4),
      O => \spo[0]_INST_0_i_17_n_0\
    );
\spo[0]_INST_0_i_18\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"262E3E3E3A3B7B6B"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(3),
      I3 => a(0),
      I4 => a(1),
      I5 => a(2),
      O => \spo[0]_INST_0_i_18_n_0\
    );
\spo[0]_INST_0_i_19\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"958D8F0F0F0E4E56"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(3),
      I3 => a(0),
      I4 => a(1),
      I5 => a(2),
      O => \spo[0]_INST_0_i_19_n_0\
    );
\spo[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFE200E2"
    )
        port map (
      I0 => \spo[0]_INST_0_i_6_n_0\,
      I1 => a(10),
      I2 => \spo[0]_INST_0_i_7_n_0\,
      I3 => a(12),
      I4 => \spo[0]_INST_0_i_8_n_0\,
      I5 => a(13),
      O => \spo[0]_INST_0_i_2_n_0\
    );
\spo[0]_INST_0_i_20\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7D5D5DDD6C6C4C48"
    )
        port map (
      I0 => a(5),
      I1 => a(3),
      I2 => a(2),
      I3 => a(0),
      I4 => a(1),
      I5 => a(4),
      O => \spo[0]_INST_0_i_20_n_0\
    );
\spo[0]_INST_0_i_21\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"100004044CCCC4C4"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(1),
      I3 => a(0),
      I4 => a(2),
      I5 => a(3),
      O => \spo[0]_INST_0_i_21_n_0\
    );
\spo[0]_INST_0_i_22\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"222622266AEBEBEB"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(2),
      I3 => a(1),
      I4 => a(0),
      I5 => a(3),
      O => \spo[0]_INST_0_i_22_n_0\
    );
\spo[0]_INST_0_i_23\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"999111100A8AEEE6"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(1),
      I3 => a(0),
      I4 => a(2),
      I5 => a(3),
      O => \spo[0]_INST_0_i_23_n_0\
    );
\spo[0]_INST_0_i_24\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"200888882464CCC8"
    )
        port map (
      I0 => a(5),
      I1 => a(3),
      I2 => a(1),
      I3 => a(0),
      I4 => a(2),
      I5 => a(4),
      O => \spo[0]_INST_0_i_24_n_0\
    );
\spo[0]_INST_0_i_25\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6D7D79F880000808"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(2),
      I3 => a(0),
      I4 => a(1),
      I5 => a(3),
      O => \spo[0]_INST_0_i_25_n_0\
    );
\spo[0]_INST_0_i_26\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000442634363"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(2),
      I3 => a(1),
      I4 => a(0),
      I5 => a(3),
      O => \spo[0]_INST_0_i_26_n_0\
    );
\spo[0]_INST_0_i_27\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"858D8F0F0B0A4A52"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(3),
      I3 => a(0),
      I4 => a(1),
      I5 => a(2),
      O => \spo[0]_INST_0_i_27_n_0\
    );
\spo[0]_INST_0_i_28\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A7AFAF2F2B2A6A7A"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(3),
      I3 => a(0),
      I4 => a(1),
      I5 => a(2),
      O => \spo[0]_INST_0_i_28_n_0\
    );
\spo[0]_INST_0_i_29\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9880262664644444"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(1),
      I3 => a(0),
      I4 => a(2),
      I5 => a(3),
      O => \spo[0]_INST_0_i_29_n_0\
    );
\spo[0]_INST_0_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000444"
    )
        port map (
      I0 => a(10),
      I1 => \spo[0]_INST_0_i_9_n_0\,
      I2 => a(9),
      I3 => a(8),
      I4 => a(12),
      O => \spo[0]_INST_0_i_3_n_0\
    );
\spo[0]_INST_0_i_30\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BBB337366464444C"
    )
        port map (
      I0 => a(5),
      I1 => a(4),
      I2 => a(1),
      I3 => a(0),
      I4 => a(2),
      I5 => a(3),
      O => \spo[0]_INST_0_i_30_n_0\
    );
\spo[0]_INST_0_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"BF80FF0FBF80F000"
    )
        port map (
      I0 => \spo[0]_INST_0_i_10_n_0\,
      I1 => a(8),
      I2 => a(9),
      I3 => \spo[0]_INST_0_i_11_n_0\,
      I4 => a(10),
      I5 => \spo[0]_INST_0_i_7_n_0\,
      O => \spo[0]_INST_0_i_4_n_0\
    );
\spo[0]_INST_0_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF80"
    )
        port map (
      I0 => \spo[0]_INST_0_i_6_n_0\,
      I1 => a(10),
      I2 => a(9),
      I3 => \spo[0]_INST_0_i_12_n_0\,
      O => \spo[0]_INST_0_i_5_n_0\
    );
\spo[0]_INST_0_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[0]_INST_0_i_13_n_0\,
      I1 => \spo[0]_INST_0_i_14_n_0\,
      I2 => a(7),
      I3 => \spo[0]_INST_0_i_15_n_0\,
      I4 => a(6),
      I5 => \spo[0]_INST_0_i_16_n_0\,
      O => \spo[0]_INST_0_i_6_n_0\
    );
\spo[0]_INST_0_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[0]_INST_0_i_17_n_0\,
      I1 => \spo[0]_INST_0_i_14_n_0\,
      I2 => a(7),
      I3 => \spo[0]_INST_0_i_18_n_0\,
      I4 => a(6),
      I5 => \spo[0]_INST_0_i_19_n_0\,
      O => \spo[0]_INST_0_i_7_n_0\
    );
\spo[0]_INST_0_i_8\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"CFDFC080"
    )
        port map (
      I0 => a(9),
      I1 => \spo[0]_INST_0_i_9_n_0\,
      I2 => a(10),
      I3 => a(8),
      I4 => \spo[0]_INST_0_i_10_n_0\,
      O => \spo[0]_INST_0_i_8_n_0\
    );
\spo[0]_INST_0_i_9\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AFA0CFCFAFA0C0C0"
    )
        port map (
      I0 => \spo[0]_INST_0_i_20_n_0\,
      I1 => \spo[0]_INST_0_i_21_n_0\,
      I2 => a(7),
      I3 => \spo[0]_INST_0_i_22_n_0\,
      I4 => a(6),
      I5 => \spo[0]_INST_0_i_23_n_0\,
      O => \spo[0]_INST_0_i_9_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GAME_OVER_ROM_dist_mem_gen_v8_0_10_synth is
  port (
    spo : out STD_LOGIC_VECTOR ( 0 to 0 );
    a : in STD_LOGIC_VECTOR ( 13 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of GAME_OVER_ROM_dist_mem_gen_v8_0_10_synth : entity is "dist_mem_gen_v8_0_10_synth";
end GAME_OVER_ROM_dist_mem_gen_v8_0_10_synth;

architecture STRUCTURE of GAME_OVER_ROM_dist_mem_gen_v8_0_10_synth is
begin
\gen_rom.rom_inst\: entity work.GAME_OVER_ROM_rom
     port map (
      a(13 downto 0) => a(13 downto 0),
      spo(0) => spo(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GAME_OVER_ROM_dist_mem_gen_v8_0_10 is
  port (
    a : in STD_LOGIC_VECTOR ( 13 downto 0 );
    d : in STD_LOGIC_VECTOR ( 0 to 0 );
    dpra : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk : in STD_LOGIC;
    we : in STD_LOGIC;
    i_ce : in STD_LOGIC;
    qspo_ce : in STD_LOGIC;
    qdpo_ce : in STD_LOGIC;
    qdpo_clk : in STD_LOGIC;
    qspo_rst : in STD_LOGIC;
    qdpo_rst : in STD_LOGIC;
    qspo_srst : in STD_LOGIC;
    qdpo_srst : in STD_LOGIC;
    spo : out STD_LOGIC_VECTOR ( 0 to 0 );
    dpo : out STD_LOGIC_VECTOR ( 0 to 0 );
    qspo : out STD_LOGIC_VECTOR ( 0 to 0 );
    qdpo : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute C_ADDR_WIDTH : integer;
  attribute C_ADDR_WIDTH of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 14;
  attribute C_DEFAULT_DATA : string;
  attribute C_DEFAULT_DATA of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is "0";
  attribute C_DEPTH : integer;
  attribute C_DEPTH of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 8960;
  attribute C_ELABORATION_DIR : string;
  attribute C_ELABORATION_DIR of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is "./";
  attribute C_FAMILY : string;
  attribute C_FAMILY of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is "zynq";
  attribute C_HAS_CLK : integer;
  attribute C_HAS_CLK of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_D : integer;
  attribute C_HAS_D of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO : integer;
  attribute C_HAS_QSPO of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_CE : integer;
  attribute C_HAS_QSPO_CE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_RST : integer;
  attribute C_HAS_QSPO_RST of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_QSPO_SRST : integer;
  attribute C_HAS_QSPO_SRST of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_HAS_SPO : integer;
  attribute C_HAS_SPO of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_MEM_INIT_FILE : string;
  attribute C_MEM_INIT_FILE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is "GAME_OVER_ROM.mif";
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_PARSER_TYPE : integer;
  attribute C_PARSER_TYPE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_READ_MIF : integer;
  attribute C_READ_MIF of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_REG_A_D_INPUTS : integer;
  attribute C_REG_A_D_INPUTS of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 0;
  attribute C_SYNC_ENABLE : integer;
  attribute C_SYNC_ENABLE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 1;
  attribute C_WIDTH : integer;
  attribute C_WIDTH of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is 1;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of GAME_OVER_ROM_dist_mem_gen_v8_0_10 : entity is "dist_mem_gen_v8_0_10";
end GAME_OVER_ROM_dist_mem_gen_v8_0_10;

architecture STRUCTURE of GAME_OVER_ROM_dist_mem_gen_v8_0_10 is
  signal \<const0>\ : STD_LOGIC;
begin
  dpo(0) <= \<const0>\;
  qdpo(0) <= \<const0>\;
  qspo(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\synth_options.dist_mem_inst\: entity work.GAME_OVER_ROM_dist_mem_gen_v8_0_10_synth
     port map (
      a(13 downto 0) => a(13 downto 0),
      spo(0) => spo(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity GAME_OVER_ROM is
  port (
    a : in STD_LOGIC_VECTOR ( 13 downto 0 );
    spo : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of GAME_OVER_ROM : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of GAME_OVER_ROM : entity is "GAME_OVER_ROM,dist_mem_gen_v8_0_10,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of GAME_OVER_ROM : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of GAME_OVER_ROM : entity is "dist_mem_gen_v8_0_10,Vivado 2016.2";
end GAME_OVER_ROM;

architecture STRUCTURE of GAME_OVER_ROM is
  signal NLW_U0_dpo_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_qdpo_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_U0_qspo_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute C_FAMILY : string;
  attribute C_FAMILY of U0 : label is "zynq";
  attribute C_HAS_D : integer;
  attribute C_HAS_D of U0 : label is 0;
  attribute C_HAS_DPO : integer;
  attribute C_HAS_DPO of U0 : label is 0;
  attribute C_HAS_DPRA : integer;
  attribute C_HAS_DPRA of U0 : label is 0;
  attribute C_HAS_I_CE : integer;
  attribute C_HAS_I_CE of U0 : label is 0;
  attribute C_HAS_QDPO : integer;
  attribute C_HAS_QDPO of U0 : label is 0;
  attribute C_HAS_QDPO_CE : integer;
  attribute C_HAS_QDPO_CE of U0 : label is 0;
  attribute C_HAS_QDPO_CLK : integer;
  attribute C_HAS_QDPO_CLK of U0 : label is 0;
  attribute C_HAS_QDPO_RST : integer;
  attribute C_HAS_QDPO_RST of U0 : label is 0;
  attribute C_HAS_QDPO_SRST : integer;
  attribute C_HAS_QDPO_SRST of U0 : label is 0;
  attribute C_HAS_WE : integer;
  attribute C_HAS_WE of U0 : label is 0;
  attribute C_MEM_TYPE : integer;
  attribute C_MEM_TYPE of U0 : label is 0;
  attribute C_PIPELINE_STAGES : integer;
  attribute C_PIPELINE_STAGES of U0 : label is 0;
  attribute C_QCE_JOINED : integer;
  attribute C_QCE_JOINED of U0 : label is 0;
  attribute C_QUALIFY_WE : integer;
  attribute C_QUALIFY_WE of U0 : label is 0;
  attribute C_REG_DPRA_INPUT : integer;
  attribute C_REG_DPRA_INPUT of U0 : label is 0;
  attribute KEEP_HIERARCHY : string;
  attribute KEEP_HIERARCHY of U0 : label is "true";
  attribute c_addr_width : integer;
  attribute c_addr_width of U0 : label is 14;
  attribute c_default_data : string;
  attribute c_default_data of U0 : label is "0";
  attribute c_depth : integer;
  attribute c_depth of U0 : label is 8960;
  attribute c_elaboration_dir : string;
  attribute c_elaboration_dir of U0 : label is "./";
  attribute c_has_clk : integer;
  attribute c_has_clk of U0 : label is 0;
  attribute c_has_qspo : integer;
  attribute c_has_qspo of U0 : label is 0;
  attribute c_has_qspo_ce : integer;
  attribute c_has_qspo_ce of U0 : label is 0;
  attribute c_has_qspo_rst : integer;
  attribute c_has_qspo_rst of U0 : label is 0;
  attribute c_has_qspo_srst : integer;
  attribute c_has_qspo_srst of U0 : label is 0;
  attribute c_has_spo : integer;
  attribute c_has_spo of U0 : label is 1;
  attribute c_mem_init_file : string;
  attribute c_mem_init_file of U0 : label is "GAME_OVER_ROM.mif";
  attribute c_parser_type : integer;
  attribute c_parser_type of U0 : label is 1;
  attribute c_read_mif : integer;
  attribute c_read_mif of U0 : label is 1;
  attribute c_reg_a_d_inputs : integer;
  attribute c_reg_a_d_inputs of U0 : label is 0;
  attribute c_sync_enable : integer;
  attribute c_sync_enable of U0 : label is 1;
  attribute c_width : integer;
  attribute c_width of U0 : label is 1;
begin
U0: entity work.GAME_OVER_ROM_dist_mem_gen_v8_0_10
     port map (
      a(13 downto 0) => a(13 downto 0),
      clk => '0',
      d(0) => '0',
      dpo(0) => NLW_U0_dpo_UNCONNECTED(0),
      dpra(13 downto 0) => B"00000000000000",
      i_ce => '1',
      qdpo(0) => NLW_U0_qdpo_UNCONNECTED(0),
      qdpo_ce => '1',
      qdpo_clk => '0',
      qdpo_rst => '0',
      qdpo_srst => '0',
      qspo(0) => NLW_U0_qspo_UNCONNECTED(0),
      qspo_ce => '1',
      qspo_rst => '0',
      qspo_srst => '0',
      spo(0) => spo(0),
      we => '0'
    );
end STRUCTURE;
