; GUARDAR UNA CADENA EN UN VARIABLE Y ESCRIBIRLA EN LA CONSOLA DE MS-DOS
; MAIN
	org 	100h

	section	.text

	; print msg1
    mov  DX, msg1	
    call EscribirCadena 
    ;print clave
    mov BP, clave      
    call LeerCadena    
    cmp DI, 0
    jg imprimirMala  
    call EscribirCadena 
    call EsperarTecla  

    int 20h

Comparar:   
	; input clave
    mov BH, [SI + clave]
    mov BL, [SI + clave2]
    INC SI
    cmp BH, BL
    je Bienvenido
    jnp incorrecto    
    jmp while

Bienvenido:       
        xor DX, DX
	;  print mensaje Bievenido
	mov 	DX, msg2
	;saltar while 
	jmp while

incorrecto:
        xor DI,DI
        inc DI		
	;jmp while
	jmp     while

imprimirMala:
        MOV DX, msg3           ;Limpiamos los registros que guardaran nuestras cadenas de respuesta
        call EscribirCadena 
        call EsperarTecla   ;espera que el usuario ingrese 
           

	section	.data
msg1 	db 	"Ingresar clave:$"
msg2 	db 	"BIENVENIDO$"
msg3	db 	"INCORRECTO$"
clave 	times 5 db  " " 	
clave2 	 db "madel$"

; FUNCIONES

; Permite leer un carácter de la entrada estándar con echo
; Parámetros:   AH: 07h         
; Salida:       AL: caracter ASCII leído
EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret


; Leer cadena de texto desde el teclado
; Salida:       SI: longitud de la cadena 		BP: direccion de guardado
LeerCadena:
        xor     SI, SI    ; SI = 0
       ; xor     DI, DI    ; DI=0  

while:  
        call    EsperarTecla    ; retorna un caracter en AL
        cmp     AL, 0x0D        ; comparar AL con caracter EnterKey
        je      exit           ; si AL == EnterKey, saltar a comparar
        mov     [BP+SI], AL   	; guardar caracter en memoria
        jmp     Comparar          ; saltar a while
exit:
	mov 	byte [BP+SI], "$"	; agregar $ al final de la cadena
        ret

; Permite escribir en la salida estándar una cadena de caracteres o string, este
; debe tener como terminación el carácter “$”
; Parámetros:	AH: 09h 	DX: dirección de la celda de memoria inicial de la cadena
EscribirCadena:
	mov 	AH, 09h
	int 	21h
	ret
