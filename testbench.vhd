-- Testbench for time_ckt gate
library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity testbench is
-- empty
end testbench;

architecture tb of testbench is

-- DUT component
component time_ckt is
Port (dig3,dig2,dig1,dig0 : in std_logic_vector(3 downto 0);
        cat : out std_logic_vector(6 downto 0 );
        an : out std_logic_vector(3 downto 0 );
        clk : in std_logic );
end component;

signal clock : std_logic :='0';
signal d3,d2,d1,d0 : std_logic_vector(3 downto 0);
signal x : std_logic_vector(16 downto 0) := "00000000000000000";
signal cathode : std_logic_vector(6 downto 0);
signal anode : std_logic_vector(3 downto 0);
signal our_clock : std_logic;
begin
d0<="0001";
d1<="0010";
d2<="0011";
d3<="0100";


  process
  begin
    clock<='0';
    wait for 5 ns;
    clock<='1';
    wait for 5 ns;
  end process;
  process(clock)
  begin
  if (rising_edge(clock)) then 
  	x<=x+'1';
  end if;
  
  end process;
  our_clock<=x(16);
  
  UUT : time_ckt port map(dig3=>d3,dig2=>d2,dig1=>d1,dig0=>d0,cat=>cathode,an=>anode,clk=>clock);
end tb;