library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity testbench is
    --empty
end entity testbench;

architecture BENCH of testbench is
  signal clock, reset : STD_LOGIC;
  signal if_int : std_logic_vector(2 downto 0);
  signal wb_in,wb_out : std_logic_vector(4 downto 0);
  signal Stop : BOOLEAN;
begin
  Clock_gen: process
  begin
    while not Stop loop
      Clock <= '1';
      wait for 5 NS;
      Clock <= '0';
      wait for 5 NS;
	end loop;
    wait;
  end process Clock_gen;
  
  Stim: process
  begin
	  reset<='1';
      report "reset case";
 
      wait for 10 NS;
      -----------------------------------------------------
      reset<='0';
      if_int<="111";
      wb_in<="11001";
      report "not RTI case";

      wait for 10 NS;
      ------------------------------------------------------
      if_int<="101";
      report "clock 2 case";

      wait for 10 NS;
      -------------------------------------------------------
      report "clock 3 case";

      wait for 10 NS;
      -------------------------------------------------------
      report "clock 4 case";
      if_int<="000";
      wb_in<="01011";


      wait for 10 NS;
      -------------------------------------------------------
      report "clock 5 case";

      wait for 10 NS;
      -------------------------------------------------------
      report "clock 6 case";

      wait for 10 NS;
      -------------------------------------------------------
	Stop <= TRUE;
	report "Simulation finished";
    wait;
  end process Stim;

  DUT : entity work.buffer_holder2
    port map(clock, reset,  if_int, wb_in,wb_out);

end architecture BENCH;