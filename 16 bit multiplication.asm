org 100h           ; Set starting address
mov ax, 0101h      ; Load AX with first number
mov bx, 0011h      ; Load BX with second number
mul bx             ; Multiply AX by BX, result in AX
mov bx, ax         ; BX now holds the result's lower 16 bits 
                                                            
; --- Convert and print the high nibble of BH (BX high byte) ---
mov ah, bh         ; Move BH (high byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII value '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed
print_high_nibble:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output (DOS function 02h)
int 21h            ; Print the high nibble of BH

; --- Convert and print the low nibble of BH (BX high byte) ---
mov ah, bh         ; Move BH back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed
print_low_nibble:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BH

; --- Convert and print the high nibble of BL (BX low byte) ---
mov ah, bl         ; Move BL (low byte of BX) to AH
shr ah, 4          ; Shift right to isolate the high nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_high_nibble2 ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed
print_high_nibble2:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the high nibble of BL

; --- Convert and print the low nibble of BL (BX low byte) ---
mov ah, bl         ; Move BL back to AH
and ah, 0fh        ; Mask the high nibble, keep the low nibble
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_low_nibble2 ; If less than or equal to '9', skip next step
add ah, 7          ; Adjust to ASCII 'A'-'F' if needed
print_low_nibble2:
mov dl, ah         ; Move the ASCII value to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print the low nibble of BL
mov ah, 4Ch        ; DOS terminate function
int 21h            ; Terminate the program
