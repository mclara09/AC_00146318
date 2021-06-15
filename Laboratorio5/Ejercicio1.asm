 org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d
   
    MOV DH, 10 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor
    MOV byte [200h], 12
    MOV byte [201h], 14
    MOV byte [202h], 16

    call modotexto

    ITERARN1:        
        call movercursor ;llamada a mover cursor
        MOV CL, [n1+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        XOR CL, CL
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 10
        CMP DI, cadena1 ; Comparación de DI con 10d
        JB ITERARN1 ; si DI es menor a 10, entonces que siga iterando. 
        call espacio     
        jmp iterar1; de caso contrario, que salte a esperar tecla.
    iterar1:
        MOV word[400h], 0
        jmp ITERARN2

   ITERARN2:
        MOV DH, [200h]
        MOV SI, word[400h]
        call movercursor ;llamada a mover cursor
        MOV CL, [n2+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 10
        MOV word[400h],SI
        CMP DI, cadena2; Comparación de DI con 10d
        JB ITERARN2 ; si DI es menor a 10, entonces que siga iterando.   
        call espacio     
        jmp iterar2 ; de caso contrario, que salte a esperar tecla.
        
        iterar2:
        MOV word[401h], 0
        jmp ITERARN3

   ITERARN3:
        MOV DH, [201h]
        MOV SI, word[401h]
        call movercursor ;llamada a mover cursor
        MOV CL, [n3+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 10
        MOV word[401h],SI
        CMP DI, cadena3; Comparación de DI con 10d
        JB ITERARN3 ; si DI es menor a 10, entonces que siga iterando.    
        call espacio    
        jmp iterar3 ; de caso contrario, que salte a esperar tecla.

        iterar3:
        MOV word[402h], 0
        jmp ITERARN4

        ITERARN4:
        MOV DH, [202h]
        MOV SI, word[402h]
        call movercursor ;llamada a mover cursor
        MOV CL, [n4+SI] ;Colocar en CL el caracter actual de la cadena
        call escribircaracter; Llamada a escribircaracter
        INC SI ; SE SUMA 1 A SI PARA CONTINUAR CON EL SIGUIENTE CARACTER
        INC DL ; SE SUMA 1 A DL PARA MOVER CURSOR A LA SIGUIENTE COLUMNA
        INC DI ; contador para terminar la ejecución del programa al llegar a 10
        MOV word[402h], SI
        CMP DI, cadena4 ; Comparación de DI con 10d
        JB ITERARN4 ; si DI es menor a 10, entonces que siga iterando. 
        call espacio       
        jmp esperartecla ; de caso contrario, que salte a esperar tecla.
     
     espacio: ; subrutina que nos ayudara ir desplazandonos columnas por columnas donde seteamos el valor de di.
      MOV DI,0
      MOV DL,20
      RET 
    modotexto: 
     
        MOV AH, 0h ; activa modo texto
        MOV AL, 03h ; modo gráfico deseado
        INT 10h
        RET
    movercursor:     
       MOV AH, 02h ; posiciona el cursor en pantalla.
 
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
      
        MOV AH, 0Ah ; escribe caracter en pantalla según posición del cursor
        MOV AL, CL ; denotamos el caracter a escribir en pantalla, los valores deben ser según código hexadecimal de tabla ASCII
        MOV BH, 0h ; número de página
        MOV CX, 1h ; número de veces a escribir el caracter
        INT 10h
        RET

    esperartecla:
    
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h

    section .data

     n1 DB 'Madeline'
     cadena1 equ $-n1
     n2 DB 'Abigail' 
     cadena2 equ $-n2
     n3 DB 'Clara'
     cadena3 equ $-n3
     n4 DB 'Guevara'
     cadena4 equ $-n4