EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L max3000a:EPM3064Axx-44 U1
U 1 1 5F8CB097
P 5500 3050
F 0 "U1" H 5500 4365 50  0000 C CNN
F 1 "EPM3064Axx-44" H 5500 4274 50  0000 C CNN
F 2 "Package_QFP:TQFP-44_10x10mm_P0.8mm" H 5150 4150 50  0001 C CNN
F 3 "" H 5150 4150 50  0001 C CNN
	1    5500 3050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Counter_Clockwise J1
U 1 1 5F8CF8C1
P 1550 2500
F 0 "J1" H 1600 3617 50  0000 C CNN
F 1 "M100 System Bus" H 1600 3526 50  0000 C CNN
F 2 "Package_DIP:DIP-40_W15.24mm_Socket" H 1550 2500 50  0001 C CNN
F 3 "~" H 1550 2500 50  0001 C CNN
	1    1550 2500
	1    0    0    -1  
$EndComp
Text Label 1000 1600 0    50   ~ 0
VDD
Text Label 1000 1700 0    50   ~ 0
GND
Text Label 1000 1800 0    50   ~ 0
AD0
Text Label 1000 1900 0    50   ~ 0
AD2
Text Label 1000 2000 0    50   ~ 0
AD4
Text Label 1000 2100 0    50   ~ 0
AD6
Text Label 1000 2200 0    50   ~ 0
A8
Text Label 1000 2300 0    50   ~ 0
A10
Text Label 1000 2400 0    50   ~ 0
A12
Text Label 1000 2500 0    50   ~ 0
A14
Text Label 1000 2600 0    50   ~ 0
GND
Text Label 1000 2700 0    50   ~ 0
~RD
Text Label 1000 2800 0    50   ~ 0
IO\~M
Text Label 1000 2900 0    50   ~ 0
ALE
Wire Wire Line
	1350 3000 1000 3000
Text Label 1000 3000 0    50   ~ 0
CLK
NoConn ~ 1350 3500
NoConn ~ 1850 3400
Wire Wire Line
	1350 3400 1000 3400
Text Label 1000 3400 0    50   ~ 0
RAMRST
Wire Wire Line
	1000 2900 1350 2900
Wire Wire Line
	1000 2800 1350 2800
Wire Wire Line
	1000 2700 1350 2700
Wire Wire Line
	1000 2600 1350 2600
Wire Wire Line
	1000 2500 1350 2500
Wire Wire Line
	1000 2400 1350 2400
Wire Wire Line
	1000 2300 1350 2300
Wire Wire Line
	1000 2200 1350 2200
Wire Wire Line
	1000 2100 1350 2100
Wire Wire Line
	1000 2000 1350 2000
Wire Wire Line
	1000 1900 1350 1900
Wire Wire Line
	1000 1800 1350 1800
Wire Wire Line
	1000 1700 1350 1700
Wire Wire Line
	1000 1600 1350 1600
Text Label 1000 3300 0    50   ~ 0
GND
Wire Wire Line
	1000 3300 1350 3300
Text Label 1000 3100 0    50   ~ 0
*(A)
Wire Wire Line
	1000 3100 1350 3100
Text Label 2200 1600 2    50   ~ 0
VDD
Text Label 2200 1700 2    50   ~ 0
GND
Text Label 2200 1800 2    50   ~ 0
AD1
Text Label 2200 1900 2    50   ~ 0
AD3
Text Label 2200 2000 2    50   ~ 0
AD5
Text Label 2200 2100 2    50   ~ 0
AD7
Text Label 2200 2200 2    50   ~ 0
A9
Text Label 2200 2300 2    50   ~ 0
A11
Text Label 2200 2400 2    50   ~ 0
A13
Text Label 2200 2500 2    50   ~ 0
A15
Text Label 2200 2600 2    50   ~ 0
GND
Text Label 2200 2700 2    50   ~ 0
~WR
Text Label 2200 2800 2    50   ~ 0
S0
Text Label 2200 2900 2    50   ~ 0
S1
Wire Wire Line
	1850 3000 2200 3000
Text Label 2200 3000 2    50   ~ 0
~Y0
Wire Wire Line
	2200 2900 1850 2900
Wire Wire Line
	2200 2800 1850 2800
Wire Wire Line
	2200 2700 1850 2700
Wire Wire Line
	2200 2600 1850 2600
Wire Wire Line
	2200 2500 1850 2500
Wire Wire Line
	2200 2400 1850 2400
Wire Wire Line
	2200 2300 1850 2300
Wire Wire Line
	2200 2200 1850 2200
Wire Wire Line
	2200 2100 1850 2100
Wire Wire Line
	2200 2000 1850 2000
Wire Wire Line
	2200 1900 1850 1900
Wire Wire Line
	2200 1800 1850 1800
Wire Wire Line
	2200 1700 1850 1700
Wire Wire Line
	2200 1600 1850 1600
Text Label 2200 3300 2    50   ~ 0
GND
Wire Wire Line
	2200 3300 1850 3300
Text Label 2200 3200 2    50   ~ 0
INTA
Wire Wire Line
	2200 3200 1850 3200
Text Label 2200 3100 2    50   ~ 0
~RESET
Wire Wire Line
	2200 3100 1850 3100
Wire Wire Line
	1350 3200 1000 3200
Text Label 1000 3200 0    50   ~ 0
INTR
$Comp
L Device:LED D1
U 1 1 5F90E855
P 4100 1250
F 0 "D1" H 4093 1467 50  0000 C CNN
F 1 "LED" H 4093 1376 50  0000 C CNN
F 2 "" H 4100 1250 50  0001 C CNN
F 3 "~" H 4100 1250 50  0001 C CNN
	1    4100 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F91044F
P 4500 1250
F 0 "R1" V 4293 1250 50  0000 C CNN
F 1 "750" V 4384 1250 50  0000 C CNN
F 2 "" V 4430 1250 50  0001 C CNN
F 3 "~" H 4500 1250 50  0001 C CNN
	1    4500 1250
	0    1    1    0   
$EndComp
Wire Wire Line
	4250 1250 4350 1250
$Comp
L power:GND #PWR01
U 1 1 5F911E87
P 3850 1350
F 0 "#PWR01" H 3850 1100 50  0001 C CNN
F 1 "GND" H 3855 1177 50  0000 C CNN
F 2 "" H 3850 1350 50  0001 C CNN
F 3 "" H 3850 1350 50  0001 C CNN
	1    3850 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1350 3850 1250
Wire Wire Line
	3850 1250 3950 1250
Wire Wire Line
	4650 1250 4850 1250
Text Label 4850 1250 2    50   ~ 0
LED
Wire Wire Line
	4500 2300 3850 2300
Text Label 3850 2300 0    50   ~ 0
LED
$Comp
L power:GND #PWR03
U 1 1 5F917FAC
P 4400 4200
F 0 "#PWR03" H 4400 3950 50  0001 C CNN
F 1 "GND" H 4405 4027 50  0000 C CNN
F 2 "" H 4400 4200 50  0001 C CNN
F 3 "" H 4400 4200 50  0001 C CNN
	1    4400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4200 4400 4100
Wire Wire Line
	4400 2900 4500 2900
Wire Wire Line
	4500 4100 4400 4100
Connection ~ 4400 4100
Wire Wire Line
	4400 4100 4400 3600
$Comp
L power:GND #PWR04
U 1 1 5F91A476
P 6600 4200
F 0 "#PWR04" H 6600 3950 50  0001 C CNN
F 1 "GND" H 6605 4027 50  0000 C CNN
F 2 "" H 6600 4200 50  0001 C CNN
F 3 "" H 6600 4200 50  0001 C CNN
	1    6600 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4200 6600 3400
Wire Wire Line
	6600 3400 6500 3400
Wire Wire Line
	6500 2200 6600 2200
Wire Wire Line
	6600 2200 6600 2800
Connection ~ 6600 3400
Wire Wire Line
	6500 2800 6600 2800
Connection ~ 6600 2800
Wire Wire Line
	6600 2800 6600 3400
$Comp
L power:+3V3 #PWR05
U 1 1 5F91E033
P 6700 1800
F 0 "#PWR05" H 6700 1650 50  0001 C CNN
F 1 "+3V3" H 6715 1973 50  0000 C CNN
F 2 "" H 6700 1800 50  0001 C CNN
F 3 "" H 6700 1800 50  0001 C CNN
	1    6700 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 1800 6700 2900
Wire Wire Line
	6700 2900 6500 2900
Wire Wire Line
	6500 4100 6700 4100
Wire Wire Line
	6700 4100 6700 2900
Connection ~ 6700 2900
$Comp
L power:+3V3 #PWR02
U 1 1 5F92191D
P 4300 1800
F 0 "#PWR02" H 4300 1650 50  0001 C CNN
F 1 "+3V3" H 4315 1973 50  0000 C CNN
F 2 "" H 4300 1800 50  0001 C CNN
F 3 "" H 4300 1800 50  0001 C CNN
	1    4300 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 1800 4300 2200
Wire Wire Line
	4300 2200 4500 2200
Wire Wire Line
	4300 2200 4300 3400
Wire Wire Line
	4300 3400 4500 3400
Connection ~ 4300 2200
Wire Wire Line
	4500 3600 4400 3600
Connection ~ 4400 3600
Wire Wire Line
	4400 3600 4400 2900
Wire Wire Line
	6500 2100 7200 2100
Text Label 7200 2100 2    50   ~ 0
CLK
Wire Wire Line
	6500 2300 7200 2300
Text Label 7200 2300 2    50   ~ 0
AD1
Wire Wire Line
	6500 2400 7200 2400
Text Label 7200 2400 2    50   ~ 0
AD0
Wire Wire Line
	6500 2500 7200 2500
Text Label 7200 2500 2    50   ~ 0
AD2
Wire Wire Line
	6500 2700 7200 2700
Text Label 7200 2700 2    50   ~ 0
AD3
Wire Wire Line
	6500 3000 7200 3000
Text Label 7200 3000 2    50   ~ 0
AD5
Wire Wire Line
	6500 3100 7200 3100
Text Label 7200 3100 2    50   ~ 0
AD4
Wire Wire Line
	6500 3500 7200 3500
Text Label 7200 3500 2    50   ~ 0
AD7
Wire Wire Line
	6500 3300 7200 3300
Text Label 7200 3300 2    50   ~ 0
AD6
Wire Wire Line
	6500 3600 7200 3600
Text Label 7200 3600 2    50   ~ 0
A14
Wire Wire Line
	6500 3700 7200 3700
Text Label 7200 3700 2    50   ~ 0
A15
Wire Wire Line
	6500 3800 7200 3800
Text Label 7200 3800 2    50   ~ 0
~RD
Wire Wire Line
	6500 3900 7200 3900
Text Label 7200 3900 2    50   ~ 0
~WR
Wire Wire Line
	6500 4000 7200 4000
Text Label 7200 4000 2    50   ~ 0
IO\~M
Wire Wire Line
	4500 4000 3850 4000
Text Label 3850 4000 0    50   ~ 0
ALE
Wire Wire Line
	4500 2400 3850 2400
Text Label 3850 2400 0    50   ~ 0
SD_SCK
Wire Wire Line
	4500 2500 3850 2500
Text Label 3850 2500 0    50   ~ 0
SD_MOSI
Wire Wire Line
	4500 2700 3850 2700
Text Label 3850 2700 0    50   ~ 0
SD_MISO
Wire Wire Line
	4500 2800 3850 2800
Text Label 3850 2800 0    50   ~ 0
SD_~CS
$Comp
L 74xx:74LS373 U?
U 1 1 5F9ADE1B
P 4400 5600
F 0 "U?" H 4400 6581 50  0000 C CNN
F 1 "74LS373" H 4400 6490 50  0000 C CNN
F 2 "" H 4400 5600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS373" H 4400 5600 50  0001 C CNN
	1    4400 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5100 3700 5100
Wire Wire Line
	3900 5200 3700 5200
Text Label 3700 5200 0    50   ~ 0
AD4
Wire Wire Line
	3900 5300 3700 5300
Text Label 3700 5300 0    50   ~ 0
AD7
Wire Wire Line
	3900 5400 3700 5400
Text Label 3700 5400 0    50   ~ 0
AD6
Wire Wire Line
	3900 5500 3700 5500
Text Label 3700 5500 0    50   ~ 0
AD1
Wire Wire Line
	3900 5600 3700 5600
Text Label 3700 5600 0    50   ~ 0
AD0
Wire Wire Line
	3900 5700 3700 5700
Text Label 3700 5700 0    50   ~ 0
AD3
Wire Wire Line
	3900 5800 3700 5800
Text Label 3700 5800 0    50   ~ 0
AD2
Text Label 3700 6000 0    50   ~ 0
ALE
Wire Wire Line
	3700 6000 3900 6000
Text Label 3700 5100 0    50   ~ 0
AD5
Wire Wire Line
	4900 5100 5300 5100
Text Label 5300 5100 2    50   ~ 0
SRAM_A8
Wire Wire Line
	4900 5200 5300 5200
Text Label 5300 5200 2    50   ~ 0
SRAM_A3
Wire Wire Line
	4900 5300 5300 5300
Text Label 5300 5300 2    50   ~ 0
SRAM_A2
Wire Wire Line
	4900 5400 5300 5400
Text Label 5300 5400 2    50   ~ 0
SRAM_A0
Wire Wire Line
	4900 5500 5300 5500
Text Label 5300 5500 2    50   ~ 0
SRAM_A1
Wire Wire Line
	4900 5600 5300 5600
Text Label 5300 5600 2    50   ~ 0
SRAM_A10
Wire Wire Line
	4900 5700 5300 5700
Text Label 5300 5700 2    50   ~ 0
SRAM_A4
Wire Wire Line
	4900 5800 5300 5800
Text Label 5300 5800 2    50   ~ 0
SRAM_A7
Wire Wire Line
	4500 3900 3850 3900
Text Label 3850 3900 0    50   ~ 0
SRAM_~CS
Wire Wire Line
	4500 3700 3850 3700
Text Label 3850 3700 0    50   ~ 0
SRAM_~OE
Wire Wire Line
	4500 3800 3850 3800
Text Label 3850 3800 0    50   ~ 0
SRAM_A11
Wire Wire Line
	4500 3500 3850 3500
Text Label 3850 3500 0    50   ~ 0
SRAM_A9
Wire Wire Line
	4500 3300 3850 3300
Text Label 3850 3300 0    50   ~ 0
SRAM_~WE
Wire Wire Line
	4500 3100 3850 3100
Text Label 3850 3100 0    50   ~ 0
RAMRST
Wire Wire Line
	4500 2000 3850 2000
Text Label 3850 2000 0    50   ~ 0
~RESET
Wire Wire Line
	1850 3500 2200 3500
Text Label 2200 3500 2    50   ~ 0
VB**
Text Notes 700  7000 0    50   ~ 0
** I've modified my M100 by soldering a wire between VB and system\nbus pin, in this case pin 21, to keep external RAM powered from internal\nbattery
Wire Wire Line
	4500 3000 3850 3000
Text Label 3850 3000 0    50   ~ 0
RAM_EN
$EndSCHEMATC
