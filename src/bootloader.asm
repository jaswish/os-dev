; Bootloader for the OS

org 0x7c00			; anchor to 0x7c00 

loop:
	; Set the screen to Graphics Mode
	mov al, 0x10		; set to Graphics mode, 640x350
	call SetVideoMode	; set the video mode

	; Move the cursor to a random position
	mov dh, 12		; set the cursor Y coordinate
	mov dl, 0		; set the cursor X coordinate
	call MoveCursor		; move the cursor

	; Print a character to this location
	mov al, 0x48		; set the character
	mov bl, 0x3B		; change the color to light cyan
	; mov cl, 1		; only print the character once
	call PutChar		; Print the char to the screen

inf_loop:
	jmp inf_loop		; infinite loop

; Include other libraries
%include "src/io.asm"
	
times 510-($-$$) db 0		; pad the rest of the 512 bytes with 0
dw 0xaa55			; Boot Signature

