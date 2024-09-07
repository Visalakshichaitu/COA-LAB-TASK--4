org 100h           ; Set starting address
mov al, 11h        ; Load AL 
mov bl, 05h        ; Load BL 
mul bl             ; Multiply AL by BL, result in AX (AL * BL)
mov bl, al         ; Move result (AL) to BL for later use
mov ah, al         ; Move AL to AH for ASCII conversion
and ah, 0F0h       ; Mask lower nibble, keep upper
shr ah, 4          ; Shift upper nibble to lower position
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_first_digit ; If less or equal to '9', skip next step
add ah, 7          ; Convert to ASCII 'A'-'F' (if necessary)
print_first_digit:
mov dl, ah         ; Move first digit to DL
mov ah, 02h        ; Prepare for output (DOS interrupt 21h, function 02h)
int 21h            ; Print first digit
mov ah, bl         ; Move result (BL) back to AH
and ah, 0Fh        ; Mask upper nibble, keep lower
add ah, 30h        ; Convert to ASCII '0'-'9'
cmp ah, 39h        ; Compare with '9'
jle print_sec_digit ; If less or equal to '9', skip next step
add ah, 7          ; Convert to ASCII 'A'-'F' (if necessary)
print_sec_digit:
mov dl, ah         ; Move second digit to DL
mov ah, 02h        ; Prepare for output
int 21h            ; Print second digit
mov ah, 4Ch  
int 21h      
