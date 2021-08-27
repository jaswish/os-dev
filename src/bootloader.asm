; Bootloader for the OS

org 0x7c00			; anchor to 0x7c00 

loop:
	mov bh, 5		; set the cursor Y coordinate
	mov bl, 3		; set the cursor X coordinate
	call MoveCursor		; move the cursor
	mov bh, 5		; set the cursor Y coordinate
	mov bh, 12		; set the cursor X coordinate
	call MoveCursor		; move the cursor
	jmp loop		; infinite loop

%include "src/io.asm"
	
times 510-($-$$) db 0		; pad the rest of the 512 bytes with 0
dw 0xaa55			; Boot Signature

