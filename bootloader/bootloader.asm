; Bootloader for the OS

org 0x7c00			; anchor to 0x7c00 
bits 16
start: jmp boot

welcome_msg:
	db 'Booting OS...'	; define a welcome string

boot:
	; Set the screen to Graphics Mode
	mov al, 0x10		; set to Graphics mode, 640x350
	call SetVideoMode	; set the video mode

	; Print our welcome message
	mov dh, 1		; set the cursor Y coordinate
	mov dl, 0		; set the cursor X coordinate
	mov bl, 0x3B		; change the color to light cyan
	mov cx, 13		; the string is 10 characters long
	mov bp, welcome_msg	; load the string into the register
	call Print		; print the string to the screen

	; Ok, here goes...
	cli			; no interrupts
	cld			; clear direction flag

	mov ax, 0x50
	mov es, ax
	mov bx, 0x00

	mov al, 2		; read 2 sectors
	mov ch, 0		; track 0
	mov cl, 2		; read 2nd sector
	mov dh, 0		; head 0
	mov dl, 0		; drive A

	mov ah, 0x02		; reading sectors from the disk
	int 0x13		; interrupt call
	jmp 0x50:0x0		; jump and execute the OS

	hlt			; halt the system

; Include other libraries
%include "../lib/io.asm"
	
times 510-($-$$) db 0		; pad the rest of the 512 bytes with 0
dw 0xaa55			; Boot Signature

