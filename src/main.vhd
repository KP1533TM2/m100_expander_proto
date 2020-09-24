library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpld is
	port (
		-- global
		clk, nrst : in std_logic;
		
		-- 26 GPIOs @ MAX3064/PLCC44
		
		cpu_ad : in std_logic_vector(7 downto 0); -- 8
		cpu_a : in std_logic_vector(15 downto 14); -- 2
		cpu_nrd, cpu_nwr,
		cpu_iorq : in std_logic; -- 3
		
		-- SRAM signals
		sram_a : out std_logic_vector(16 downto 14); -- 3
		sram_ncs : out std_logic; -- 1
		
		-- SDcard SPI
		sd_miso : in std_logic;
		sd_mosi,
		sd_sck,
		sd_ncs : out std_logic; -- 4
		
		-- debug
		led : out std_logic
		
	);
end cpld;

architecture rtl of cpld is
	signal counter : integer range 0 to 1000000 := 0;
	signal led_int : std_logic := '0';
begin

led <= led_int;

process(clk)
begin
	if rising_edge(clk) then
		if counter < 1000000 then
			counter <= counter + 1;
		else
			counter <= 0;
			led_int <= not led_int;
		end if;
	end if;
end process;

end rtl;
