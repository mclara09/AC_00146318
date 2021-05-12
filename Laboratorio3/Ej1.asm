org 100h

;promedio 00146318
section .text
    mov AL, 0d
    mov [200h], AL
    mov AL, 0d
    mov [201h], AL
    mov AL, 1d
    mov [202h], AL
    mov AL, 4d
    mov [203h], AL
    mov AL, 6d
    mov [204h], AL
    mov AL, 3d
    mov [205h], AL
    mov AL, 1d
    mov [206h], AL
    mov AL, 8d
    mov [207h], AL

    XOR SI, SI 
    XOR DI, DI 
    XOR AX, AX 
    MOV AX, 0d 
    MOV BX, 0d 
    MOV CX, 8d 
    call iteracion
    call promedio
    call salir

promedio:
    MOV AX, BX
    MOV CX, 8d
    DIV CX;
    MOV [20Ah], AL
    ret
    
salir:
    int 20h
    
iteracion:
    ADD BX, [200h+SI]
    INC SI 
    LOOP iteracion
    ret
    


