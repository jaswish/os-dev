; A sample program to play around with booting an OS

; Set the screen to Graphics Mode
; mov al, 0x10            ; set to Graphics mode, 640x350
; call SetVideoMode       ; set the video mode

; Print our welcome message
mov dh, 2               ; set the cursor Y coordinate
mov dl, 0               ; set the cursor X coordinate
mov bl, 0x3B            ; change the color to light cyan
mov cx, 16              ; the string is 10 characters long
mov bp, welcome_msg     ; load the string into the register
call Print              ; print the string to the screen

welcome_msg:
        db 'Welcome to my OS'      ; define a welcome string

%include "../lib/io.asm"
