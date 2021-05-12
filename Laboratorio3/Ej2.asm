org 100h

 XOR SI, SI 
    XOR DI, DI 
    XOR AX, AX 
    MOV AX, 1d 
    MOV BX, 0d 
    MOV CX, 5d 
    call iteracion

    MOV [20Bh], AX
    call salir

    salir:
    int 20h
    
iteracion:
    MUL CX
    INC SI 
    LOOP iterar 
    ret
    