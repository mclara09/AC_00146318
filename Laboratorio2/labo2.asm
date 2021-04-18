       org 100h
       ;primera parte
       section .text 
       mov AL, 'M'
       mov [200h], AL
       mov AL, 'A'
       mov [201h], AL
       mov AL, 'C'
       mov [202h], AL
       mov AL, 'G'
       mov [203h], AL

       ;direccionamiento directo
       mov AX, [200h]

       ;direccionamiento indirecto por registro

       mov BX, [201h]
       mov CX, BX

       ;direccionamiento indirecto base + indice

       mov BX, 200h
       mov SI, 2h
       mov DX, DS:[BX+SI]

       ;direccionamiento relativo
       
       mov SI, 3h
       mov DI, DS:[200h+SI]

       int 20h