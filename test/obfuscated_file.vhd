 
 
 
library ieee;
use ieee.std_logic_1164.all;
package gates is
    component andg
        generic (tpd_hl : time := 1 ns;
                 tpd_lh : time := 1 ns);
        port (in1, in2 : std_ulogic;
              out1 : out std_ulogic);
    end component;
    component org
        generic (tpd_hl : time := 1 ns;
                 tpd_lh : time := 1 ns);
        port (in1, in2 : std_logic;
              out1 : out std_logic);
    end component;
    component xorg
        generic (tpd_hl : time := 1 ns;
                 tpd_lh : time := 1 ns);
        port (in1, in2 : std_logic;
              out1 : out std_logic);
    end component;
end gates;

 
 
 
library ieee;
use ieee.std_logic_1164.all;
entity andg is
    generic (tpd_hl : time := 1 ns;
             tpd_lh : time := 1 ns);
    port (in1, in2 : std_ulogic;
          out1 : out std_ulogic);
end andg;

architecture ID_S_7c9bcfe7_79026127_E of andg is
begin
    ID_S_5978e6_7ffc7fbd_E: process(in1, in2)
        variable ID_S_7c9f6ef9_5fb53dab_E : std_logic;
    begin
        ID_S_7c9f6ef9_5fb53dab_E := in1 and in2;
        case ID_S_7c9f6ef9_5fb53dab_E is
            when '0' =>
                out1 <= '0' after tpd_hl;
            when '1' =>
                out1 <= '1' after tpd_lh;
            when others =>
                out1 <= ID_S_7c9f6ef9_5fb53dab_E;
        end case;
    end process;
end ID_S_7c9bcfe7_79026127_E;

 
 
 
library ieee;
use ieee.std_logic_1164.all;

entity org is
    generic (tpd_hl : time := 1 ns;
             tpd_lh : time := 1 ns);
    port (in1, in2 : std_logic;
          out1 : out std_logic);
end org;
architecture ID_S_7c9bcfe7_79026127_E of org is
begin
    ID_S_5978e6_7ffc7fbd_E: process(in1, in2)
        variable ID_S_7c9f6ef9_5fb53dab_E : std_logic;
    begin
        ID_S_7c9f6ef9_5fb53dab_E := in1 or in2;
        case ID_S_7c9f6ef9_5fb53dab_E is
            when '0' =>
                out1 <= '0' after tpd_hl;
            when '1' =>
                out1 <= '1' after tpd_lh;
            when others =>
                out1 <= ID_S_7c9f6ef9_5fb53dab_E;
        end case;
    end process;
end ID_S_7c9bcfe7_79026127_E;

 
 
 
library ieee;
use ieee.std_logic_1164.all;

entity xorg is
    generic (tpd_hl : time := 1 ns;
             tpd_lh : time := 1 ns);
    port (in1, in2 : std_logic;
          out1 : out std_logic);
end xorg;
architecture ID_S_7c9bcfe7_79026127_E of xorg is
begin
    ID_S_5978e6_7ffc7fbd_E: process(in1, in2)
        variable ID_S_7c9f6ef9_5fb53dab_E : std_logic;
    begin
        ID_S_7c9f6ef9_5fb53dab_E := in1 xor in2;
        case ID_S_7c9f6ef9_5fb53dab_E is
            when '0' =>
                out1 <= '0' after tpd_hl;
            when '1' =>
                out1 <= '1' after tpd_lh;
            when others =>
                out1 <= ID_S_7c9f6ef9_5fb53dab_E;
        end case;
    end process;
end ID_S_7c9bcfe7_79026127_E;

 
 
 
library ieee;
use ieee.std_logic_1164.all;
entity adder is
    port (ID_S_2b606_61_E    : in std_logic;
          ID_S_2b607_62_E    : in std_logic;
          ID_S_b8865ff_7e708066_E  : in std_logic;
          ID_S_b88ab9a_7e301668_E  : out std_logic;
          ID_S_7c9540c0_7a6720eb_E : out std_logic);
end adder;


 
architecture ID_S_b88a737_7e341f69_E of adder is
begin
    ID_S_b88ab9a_7e301668_E <= X"0";   
    ID_S_b88ab9a_7e301668_E <= (ID_S_2b606_61_E xor ID_S_2b607_62_E) xor ID_S_b8865ff_7e708066_E;
    ID_S_7c9540c0_7a6720eb_E <= (ID_S_2b606_61_E and ID_S_2b607_62_E) or (ID_S_b8865ff_7e708066_E and ID_S_2b606_61_E) or (ID_S_b8865ff_7e708066_E and ID_S_2b607_62_E);
end ID_S_b88a737_7e341f69_E;


 
use work.gates.all;
architecture structural of adder is
    signal ID_S_28a83346_381dabd_E,
           ID_S_11b9d80_104eab93_E,
           ID_S_12db601_1c960c44_E,
           ID_S_71d8bd2e_53253a19_E : std_logic;
begin
    xor1: xorg port map(
                in1  => ID_S_2b606_61_E,
                in2  => ID_S_2b607_62_E,
                out1 => ID_S_28a83346_381dabd_E);
    xor2: xorg port map(
                in1 => ID_S_28a83346_381dabd_E,
                in2 => ID_S_b8865ff_7e708066_E,
                out1 => ID_S_b88ab9a_7e301668_E);
    ID_S_7c942149_3af3e3a0_E: andg port map(
                in1 => ID_S_2b606_61_E,
                in2 => ID_S_2b607_62_E,
                out1   => ID_S_11b9d80_104eab93_E);
    ID_S_b8899f7_7e40e7ac_E: org port map(
                in1 => ID_S_2b606_61_E,
                in2 => ID_S_2b607_62_E,
                out1   => ID_S_71d8bd2e_53253a19_E);
    ID_S_7c94214a_3af3e3a3_E: andg port map(
                in1 => ID_S_b8865ff_7e708066_E,
                in2 => ID_S_71d8bd2e_53253a19_E,
                out1   => ID_S_12db601_1c960c44_E);
    ID_S_b8899f8_7e40e7af_E: org port map(
                in1 => ID_S_11b9d80_104eab93_E,
                in2 => ID_S_12db601_1c960c44_E,
                out1   => ID_S_7c9540c0_7a6720eb_E);
end structural;


 
 
 
 
library ieee;
use ieee.std_logic_1164.all;
entity ID_S_716d8ed3_50355879_E is
    generic(ID_S_2b613_6e_E : integer := 16);
    port (ID_S_2b606_61_E    : in std_logic_vector(ID_S_2b613_6e_E downto 1);
          ID_S_2b607_62_E    : in std_logic_vector(ID_S_2b613_6e_E downto 1);
          ID_S_b8865ff_7e708066_E  : in std_logic;
          ID_S_b88ab9a_7e301668_E  : out std_logic_vector(ID_S_2b613_6e_E downto 1);
          ID_S_7c9540c0_7a6720eb_E : out std_logic);
end ID_S_716d8ed3_50355879_E;

 
architecture structural of ID_S_716d8ed3_50355879_E is
    component adder
        port (ID_S_2b606_61_E    : in std_logic;
              ID_S_2b607_62_E    : in std_logic;
              ID_S_b8865ff_7e708066_E  : in std_logic;
              ID_S_b88ab9a_7e301668_E  : out std_logic;
              ID_S_7c9540c0_7a6720eb_E : out std_logic);
    end component;

    signal ID_S_f359ee6_5aa765df_E : std_logic_vector(0 to ID_S_2b613_6e_E);
begin
    ID_S_f359ee6_5aa765df_E(0) <= ID_S_b8865ff_7e708066_E;
    ID_S_7c9540c0_7a6720eb_E <= ID_S_f359ee6_5aa765df_E(ID_S_2b613_6e_E);

     
    ID_S_b88767f_7e60a06f_E: for ID_S_2b60e_69_E in 1 to ID_S_2b613_6e_E generate
        ID_S_b885cce_7e7895e2_E: adder port map(
                ID_S_2b606_61_E => ID_S_2b606_61_E(ID_S_2b60e_69_E),
                ID_S_2b607_62_E => ID_S_2b607_62_E(ID_S_2b60e_69_E),
                ID_S_b8865ff_7e708066_E => ID_S_f359ee6_5aa765df_E(ID_S_2b60e_69_E - 1),
                ID_S_b88ab9a_7e301668_E => ID_S_b88ab9a_7e301668_E(ID_S_2b60e_69_E),
                ID_S_7c9540c0_7a6720eb_E => ID_S_f359ee6_5aa765df_E(ID_S_2b60e_69_E));
   end generate;
end structural;


 
architecture ID_S_774d1ae2_21004c7_E of ID_S_716d8ed3_50355879_E is
begin
    ID_S_5978e6_7ffc7fbd_E: process(ID_S_2b606_61_E, ID_S_2b607_62_E, ID_S_b8865ff_7e708066_E)
        variable ID_S_7c9fbcf0_5ffd7cb6_E : std_logic_vector(ID_S_2b613_6e_E downto 1);
        variable ID_S_f359ee6_5aa765df_E : std_logic;
    begin
        ID_S_f359ee6_5aa765df_E := ID_S_b8865ff_7e708066_E;
        for ID_S_2b60e_69_E in 1 to ID_S_2b613_6e_E loop
            ID_S_7c9fbcf0_5ffd7cb6_E(ID_S_2b60e_69_E) := (ID_S_2b606_61_E(ID_S_2b60e_69_E) xor ID_S_2b607_62_E(ID_S_2b60e_69_E)) xor ID_S_f359ee6_5aa765df_E;
            ID_S_f359ee6_5aa765df_E := (ID_S_2b606_61_E(ID_S_2b60e_69_E) and ID_S_2b607_62_E(ID_S_2b60e_69_E)) or (ID_S_f359ee6_5aa765df_E and (ID_S_2b606_61_E(ID_S_2b60e_69_E) or ID_S_2b607_62_E(ID_S_2b60e_69_E)));
        end loop;
        ID_S_b88ab9a_7e301668_E <= ID_S_7c9fbcf0_5ffd7cb6_E;
        ID_S_7c9540c0_7a6720eb_E <= ID_S_f359ee6_5aa765df_E;
    end process ID_S_5978e6_7ffc7fbd_E;
end ID_S_774d1ae2_21004c7_E;

