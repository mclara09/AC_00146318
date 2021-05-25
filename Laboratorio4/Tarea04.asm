
          org    100h

          section .text
          XOR BX, BX
          XOR DI, DI
          XOR DX, DX
          XOR CX, CX
          XOR SI, SI

          MOV BP, Arreglo                     
          call storage               

          int 20h

          section .data                         

Arreglo   db      4,63,5,2,83,10,34,11,89,15;                          

storage:                      
          MOV BL, 2d                   
                                                
for: 
          XOR AX, AX                           
          MOV AL, [BP+di]                      
          INC di                             
          MOV BH,AL                             
          DIV BL                              
          CMP AH, 0                           
          JZ NumPar                              
          JA NumImpar                            

NumPar:       
          MOV si, dx                           
          MOV byte [0300H + si], BH           
          INC si                               
          MOV dx, si                           
          CMP di, 10d                           
          JE exit                             
          jmp for                     

NumImpar:
          MOV si, cx                           
          MOV byte [0320H + si], BH            
          INC si;                               
          MOV cx, si                            
          CMP di, 10d                           
          JE exit;                               
          jmp for;                        
     
exit:                                           
          ret;                                  