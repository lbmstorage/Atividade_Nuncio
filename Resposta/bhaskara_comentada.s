        EXPORT start
        THUMB
        AREA MYCODE, CODE, READONLY
        ENTRY
        IMPORT Reset_Handler
        IMPORT __Vectors

start
    MOVS    R0, #1                                              ; Coeficiente a
    MOVS    R1, #2                                              ; Coeficiente b
    MOVS    R2, #1                                              ; Coeficiente c

    BL      bhaskara                                            ; Chama a função de bhaskara
    
    B       .                                                   ; Infinito loop para manter o programa rodando

bhaskara
    MOVS    R3, R1                                              ; Calcula o discriminante (b^2 - 4ac)
    MULS    R3, R3, R3                                          ; b^2
    MOVS    R4, R0
    MOVS    R5, R2
    MULS    R4, R4, R5                                          ; ac
    MOVS    R5, #4
    MULS    R4, R4, R5                                          ; 4ac
    SUBS    R3, R3, R4                                          ; b^2 - 4ac

    MOVS    R0, R3                                              ; Calcula a raiz quadrada do discriminante
    BL      raiz
    MOVS    R3, R0                                              ; raiz(b^2 - 4ac)

    MOVS    R4, #2
    MULS    R4, R4, R0                                          ; 2a
    SUBS    R0, R1, R3                                          ; -b - raiz(b^2 - 4ac)
    DIVS    R0, R0, R4                                          ; (-b - raiz(b^2 - 4ac)) / 2a
    ADDS    R1, R1, R3                                          ; -b + raiz(b^2 - 4ac)
    DIVS    R1, R1, R4                                          ; (-b + raiz(b^2 - 4ac)) / 2a

    BX      LR                                                  ; BX é usada para retornar ao endereço especificado pelo registrador LR (Link Register).

raiz
    MOVS    R1, #0                                              ; Inicializa R1 com 0

    MOVS    R2, #0                                              ; Inicializa R2 com 0

raiz_loop
    CMP     R2, R0                                              ; Compara R2 com R0

    BGT     raiz_feita                                          ; Se R2 > R0, termina o loop

    ADDS    R1, R1, #1                                          ; Incrementa R1

    MOVS    R4, R1                                              ; Calcula o quadrado de R1
    MULS    R2, R4, R4                                          ; Armazena o resultado em R2

    B       raiz_loop                                           ; Volta para o início do loop

raiz_feita
    SUBS    R1, R1, #1                                          ; Decrementa -1 de R1

    MOVS    R0, R1                                              ; Move R1 para R0

    BX      LR                                                  ; BX é usada para retornar ao endereço especificado pelo registrador LR (Link Register).

    END