; Library for I/O related routines

; MoveCursor
; Move a cursor to a specific location on screen and remember it
; Parameters: dh = Y coordinate
;	      dl = X coordinate
MoveCursor:
	mov ah, 0x02        ; Set cursor position function
	int 0x10            ; interrupt call
	ret		    ; return

; PutChar
; Print a character on screen at the current position
; Parameters: al - character to print
; 	      bl - text color
;	      cx = number of times the character is repeated
PutChar:
	mov ah, 0x0e	; ah=0x0e - "tele-type" function
	int 0x10	; interrupt call
	ret		; return

; TODO: This function is not complete
; Print
; Print a string to the console
; Parameters: ds:si - Zero terminated string
Print:
	mov dx, ds	; the address of our string goes to dx
	mov ah, 0x09	; ah=9 - "print string" sub-function
	int 10h	; interrupt call
	ret		; return

; SetVideoMode
; Set the video mode for the display
; Parameters: al = video mode
SetVideoMode:
	mov ah, 0x00	; set video mode function
	int 0x10	; interrupt call
	ret		; return
