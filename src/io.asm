; Library for I/O related routines

; MoveCursor
; Move a cursor to a specific location on screen and remember it
; Parameters: bh = Y coordinate
;	      bl = X coordinate
MoveCursor:
	mov dh, bh          ; Cursor position line
	mov dl, bl          ; Cursor position column
	mov ah, 02h         ; Set cursor position function
	mov bh, 0           ; Page number
	int 10h             ; interrupt call
	ret		    ; return

; PutChar
; Print a character on screen at the current position
; Parameters: al - character to print
; 	      bl - text color
;	      cx = number of times the character is repeated
PutChar:
	mov ah, 2	; ah=2 - "print char" sub-function
	int 10h	; interrupt call
	ret		; return

; Print
; Print a string to the console
; Parameters: ds:si - Zero terminated string
mov dx, ds	; the address of our string goes to dx
mov ah, 9	; ah=9 - "print string" sub-function
int 10h	; interrupt call
ret		; return
