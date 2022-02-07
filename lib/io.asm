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
; 	      bl - text color (see color_table.txt)
PutChar:
	mov ah, 0x0e	; ah=0x0e - "tele-type" function
	int 0x10	; interrupt call
	ret		; return

; Print
; Print a string to the console
; Parameters: es:bp - Zero terminated string
;	      dh - Y coordinate to print string
;	      dl - X coordinate to print string
;	      cx - length of the string
; 	      bl - text color (see color_table.txt)
Print:
	mov ah, 0x13	; ah=9 - "print string" sub-function
	mov al, 0x01	; update cursor after printing	
	int 0x10	; interrupt call
	ret		; return

; SetVideoMode
; Set the video mode for the display
; Parameters: al = video mode
SetVideoMode:
	mov ah, 0x00	; set video mode function
	int 0x10	; interrupt call
	ret		; return
