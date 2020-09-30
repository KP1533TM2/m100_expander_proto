library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cpld is
	port (
		-- global
		clk, nrst : in std_logic;
		
		-- 26 GPIOs @ MAX3064/PLCC44
		cpu_ad : inout std_logic_vector(7 downto 0); -- 8
		cpu_a : in std_logic_vector(15 downto 14); -- 2
		cpu_nrd, cpu_nwr, cpu_ale,
		cpu_iom : in std_logic; -- 3
		
		ramrst : in std_logic;
		
		-- SRAM signals
		sram_a : out std_logic_vector(15 downto 14); -- 3
		sram_ncs,
		sram_nwe,
		sram_noe : out std_logic; -- 3
		
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
	signal led_int : std_logic := '0';
	signal cpu_a_int : std_logic_vector(7 downto 0) := x"00";
	signal cpu_d : std_logic_vector(7 downto 0);
	signal cpu_do : std_logic_vector(7 downto 0) := x"00";
	signal cpu_do_active : std_logic := '0';
	
	signal spi_bit_count : unsigned(2 downto 0) := "000";
	signal spi_busy : boolean := false;
	signal spi_mosi_reg : std_logic_vector(7 downto 0) := x"00";
	signal spi_cs_reg : std_logic := '0';

	constant SPI_CS_REG_ADDR : std_logic_vector(7 downto 0) := x"71";
	constant SPI_DATA_REG_ADDR : std_logic_vector(7 downto 0) := x"72";
	constant DUMMY_REG_ADDR : std_logic_vector(7 downto 0) := x"70";

--	signal test_read_cs : std_logic;
begin

--led <= '1' when spi_busy else '0';
--led <= '1' when cpu_do_active = '1' else '0';

sd_ncs <= not spi_cs_reg;

cpu_d <= cpu_ad;
cpu_ad <= cpu_do when cpu_do_active = '1' else "ZZZZZZZZ";

-- test
--cpu_ad <= x"ff" when test_read_cs = '1' else "ZZZZZZZZ";
--test_read_cs <= '1' when cpu_iom = '1' and cpu_nrd = '0' and cpu_a_int = x"70" else '0';
--led <= '1' when test_read_cs = '1' else '0';

process(cpu_ale)
begin
	if falling_edge(cpu_ale) then
		cpu_a_int <= cpu_ad;
	end if;
end process;

sd_sck <= not clk when spi_busy else '0';
sd_mosi <= spi_mosi_reg(7);

sram_ncs <= '0' when cpu_a(15) = '1' and cpu_iom = '0' and ramrst = '1' else '1';
sram_nwe <= cpu_nwr when ramrst = '1' else '1';
sram_noe <= cpu_nrd when ramrst = '1' else '1';

sram_a(15) <= '0';
sram_a(14) <= cpu_a(14);

process(clk)
begin
	if rising_edge(clk) then

		if cpu_iom = '1' and cpu_nrd = '0' then
			case(cpu_a_int) is
				when DUMMY_REG_ADDR =>
					cpu_do_active <= '1';
					cpu_do <= x"44";
				when SPI_DATA_REG_ADDR =>
					cpu_do_active <= '1';
					cpu_do <= spi_mosi_reg;
				when SPI_CS_REG_ADDR =>
					cpu_do_active <= '1';
					cpu_do <= "0000000" & spi_cs_reg;
				when others =>
					cpu_do_active <= '0';
			end case;
		else 
			cpu_do_active <= '0';
		end if;
	
		if cpu_iom = '1' and cpu_nwr = '0' then
			case(cpu_a_int) is
				when SPI_DATA_REG_ADDR =>
					-- launch SPI transaction
					if not spi_busy then
						spi_bit_count <= "000";
						spi_mosi_reg <= cpu_ad;
						spi_busy <= true;
					end if;
				when SPI_CS_REG_ADDR =>
					-- only one CS for now, not gonna waste cells on entire bytes
					spi_cs_reg <= cpu_ad(0);
				when others => null;
			end case;
		end if;
		
		if spi_busy then
			spi_mosi_reg <= spi_mosi_reg(6 downto 0) & sd_miso;
			if spi_bit_count /= "111" then
				spi_bit_count <= spi_bit_count + "001";
			else
				spi_busy <= false;
			end if;		
		end if;
		
	end if;
end process;


end rtl;
