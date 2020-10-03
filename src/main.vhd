library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity main is
	port (
		-- global
		clk, nrst : in std_logic;
		
		-- 26 GPIOs @ MAX3064/PLCC44
		cpu_ad : inout std_logic_vector(7 downto 0); -- 8
		cpu_a : in std_logic_vector(15 downto 14); -- 2
		cpu_nrd, cpu_nwr, cpu_ale,
		cpu_iom : in std_logic; -- 3

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
end main;

architecture rtl of main is
	signal led_int : std_logic := '0';
	signal cpu_a_int : std_logic_vector(7 downto 0) := x"00";
	signal cpu_do : std_logic_vector(7 downto 0) := x"00";
	signal cpu_do_active : std_logic := '0';
	
	signal spi_bit_count : unsigned(2 downto 0) := "000";
	signal spi_busy : boolean := false;
	signal spi_mosi_reg : std_logic_vector(7 downto 0) := x"00";
	signal spi_cs_reg : std_logic := '0';

	signal optrom : std_logic := '0';
	signal optrom_we : std_logic := '0';

	constant SPI_CS_REG_ADDR : std_logic_vector(7 downto 0) := x"71";
	constant SPI_DATA_REG_ADDR : std_logic_vector(7 downto 0) := x"72";
	constant MASK_RAM_REG_ADDR : std_logic_vector(7 downto 0) := x"73";
	constant DUMMY_REG_ADDR : std_logic_vector(7 downto 0) := x"70";
	constant CSROM_ADDR : std_logic_vector(7 downto 0) := x"E-";
begin

led <= optrom;

sd_ncs <= not spi_cs_reg;

cpu_ad <= cpu_do when cpu_do_active = '1' else "ZZZZZZZZ";

process(cpu_ale)
begin
	if falling_edge(cpu_ale) then
		cpu_a_int <= cpu_ad;
	end if;
end process;

sd_sck <= not clk when spi_busy else '0';
sd_mosi <= spi_mosi_reg(7);

process(cpu_a,cpu_iom,cpu_nrd,cpu_nwr,optrom_we,optrom,nrst)
begin
	if cpu_iom = '0' and cpu_a(15) = '0' then
		-- Access to "shadow RAM" behind system ROM @ 0x0000...0x7fff
		sram_nwe <= cpu_nwr or (not optrom_we);
		sram_noe <= cpu_nrd or (not optrom);
		sram_ncs <= '0';
	elsif cpu_iom = '0' and cpu_a(15) = '1' then
		-- Access to normal 32k RAM @ 0x8000...0xffff
		sram_nwe <= cpu_nwr;
		sram_noe <= cpu_nrd;
		sram_ncs <= '0';
	else
		sram_nwe <= '1';
		sram_noe <= '1';
		sram_ncs <= '1';
	end if;

	-- No banking yet, just a simple address passthrough
	sram_a(15 downto 14) <= cpu_a(15 downto 14);
end process;

process(clk, nrst)
begin
	if nrst = '1' then
		optrom <= '0';
		optrom_we <= '0';
	elsif rising_edge(clk) then

		if cpu_iom = '1' and cpu_nrd = '0' then
			case?(cpu_a_int) is
				when MASK_RAM_REG_ADDR =>
					cpu_do_active <= '1';
					cpu_do <= "0000000" & optrom_we;
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
			end case?;
		else 
			cpu_do_active <= '0';
		end if;
	
		if cpu_iom = '1' and cpu_nwr = '0' then
			case?(cpu_a_int) is			
				when MASK_RAM_REG_ADDR =>
					optrom_we <= cpu_ad(0);
				when CSROM_ADDR =>
					-- duplicate register for mapping option ROM
					optrom <= cpu_ad(0);
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
			end case?;
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
