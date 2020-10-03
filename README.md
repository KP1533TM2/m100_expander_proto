# TRS-80 Model 100 RAM expander and SPI peripheral (prototype)

Just me prototyping an expansion for TRS-80 Model 100.

# Some barebones documentation
## Hardware
My current "hardware platform" is made out of:
* Altera EPM3064ALC-44 CPLD
* LM1117-ADJ for CPLD 3.3V power supply
* Winbond W24512A 64k SRAM
* 74HC373 for external address latch (8085 has lower address bus multiplexed with data bus)
* Eon 25F80 SPI Flash ROM (1 megabyte), socketable DIP package

MAX3000A CPLD is quite power-hungry, drawing atleast 20mA when empty and idle,
so I'm considering Xilinx CoolRunner (or CoolRunner2+lever translator IC).

There's no rhyme or reason with the choice of components above, I just threw together
a prototype out of reasonable enough parts that I have on hand.

Device takes up "system bus" socket only, however it takes over option ROM duties, so the option ROM socket shouldn't be used.

**todo: pics**

**todo: schematic**

## I/O ports
CPLD implements SPI peripheral, address decoding and basic memory mapping.
A few I/O registers are implemented in CPLD to control the operation:

| Address     | Access | Description  |
|:----------- |:------ |:------------|
| 0xE0...0xEF | W  | Duplicates bit 0 of builtin M100 register of the same address range in order to page in Option "ROM". |
| 0x70        | R  | Dummy register, maybe put a version or ID in there or remove it entirely in the future. |
| 0x71        | RW | SPI CS register. Only bit 0 available at the moment, for selecting SPI flash ROM. Other bits read 0. |
| 0x72        | RW | SPI data register. Causes transaction when written to, sends written byte over SPI, reads a byte received by SPI in the last transaction |
| 0x73        | RW | Shadow RAM/"Option ROM" access control register. Bit 0 allows writing to ROM addresses while system ROM is active. Other bits read 0. |

All power-on/reset default values are 0, unless otherwise specified.

## Option ROM loading algorithm
* Normal operation, system ROM is active
* Write 0x01 to I/O 0x73 maps lower RAM writes into system ROM area
* 0x8000 bytes of SPI flash are read at specified address and writted to system ROM area
* Write 0x00 to I/O 0x73 - lower RAM becomes read-only again
* Lower RAM would then substitute system ROM as an option ROM normally

There's a distant probability that, since device duplicates internal
option ROM switch register instead of using internal one, they might
disagree and cause contention. But more likely than anything, it would
be because option ROM circuitry might be already damaged in either the
computer or the device.

### ROM loader
There's a VirtualT IDE project that contains a small assembly routine
to copy option ROMs programmed into SPI flash into RAM.
* Assemble it, generate BASIC loader, put it on real M100;
* Run it, follow up with `CLEAR` statement;
* `CALL58240,<# of ROM image from 0 to 31>`;
* After `Ok`, restart it (to let system probe for option ROM successfully);
* Go to BASIC again, then `CALL 63012` as with normal option ROM

ROM images should be programmed in externally with a programmer at
the moment, consecutively starting at address 0:
* ROM image 0 -> 0x000000 - 0x007fff
* ROM image 1 -> 0x008000 - 0x00ffff
* ROM image 2 -> 0x010000 - 0x017fff
* etc etc...

## Problems
* Battery-backed RAM still corrupts itself after power-on, not during
restart/reset though - might need pullups or has something to do with
MAX3000A power sequencing

**Solved** by wiring *Ⓐ signal (system bus pin 16) to SRAM CE2 - SRAM
effectively becomes active only when CPU is active. Also added 10k
pulldown resistor for good measure.
