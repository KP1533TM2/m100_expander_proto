;	.8080

;

SPI_CS_REG equ 71h
SPI_DATA_REG equ 72h
MASK_RAM_REG equ 73h

SPI_READ_DATA equ 03h ; + A[23:16], A[15:8], A[7:0]
OPTROM_REG equ 68h

	aseg

	org	0e380h ;58240

start:
	di
	; A - ROM # to load
	ani		1fh	; limit selectable roms to 32 (0..31), also carry clear
	mov		h, a
	mvi		l, 00h
	; shift HL 1 bit right, resulting in 2 higher bytes of address
	mov		a, h
	rar
	mov		h, a
	mov		a, l
	rar
	mov		l, a
	; 2 high bytes of address are in HL, now let's mess with SPI
	mvi		a, 01h ; /CS enable (also enable shadow write into ROM area)
	out		MASK_RAM_REG ; enable shadow writes
	out		SPI_CS_REG ; enable flash ROM /CS
	mvi		a, SPI_READ_DATA	; SPI flash read command
	out		SPI_DATA_REG
	mov		a, h ; ROM A[23:16]
	out		SPI_DATA_REG
	mov		a, l ; ROM A[15:8]
	out		SPI_DATA_REG
	mvi		a, 00h ; ROM A[7:0] - always 0
	out		SPI_DATA_REG
	
	lxi		b, 8000h ; loop through 32768 bytes
	lxi		h, 0	; set destination address
load_loop:
	; payload
	out		SPI_DATA_REG ; just output whatever byte
	in		SPI_DATA_REG ;  read back the result, ROM should return data
	mov		M, a ; store byte in shadow RAM
	inx		h ; ptr++
	; loop control
	dcx		b	; decrement count
	mov		a, c
	ora		b	; check if zero
	jnz		load_loop	
	
	; loop end
	mvi		a, 00h
	out		MASK_RAM_REG ; disable shadow writes
	out		SPI_CS_REG ; disable /CS
	
;	mvi		a, 01h
;	out		OPTROM_REG
;	rst		0
	
	ei
	rst		0
	
