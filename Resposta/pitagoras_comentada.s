        EXPORT start
        THUMB
        AREA MYCODE, CODE, READONLY
        ENTRY
        IMPORT Reset_Handler
        IMPORT __Vectors

start
    MOVS    R0, #3                      ; Carega o valor A como 3 no R0
    MOVS    R1, #4                      ; Carega o valor b como 4 no R1

    MULS    R3, R0, R0                  ; Calcula a^2 R3 = a * a = a^2

    MULS    R4, R1, R1                  ; Calcula b^2 R4 = b * b = b^2

    ADDS    R0, R3, R4                  ; Calcula a^2 + b^2 R0 = a^2 + b^2 = c^2

    BL    raiz                          ; Chama a função raiz   


raiz
    MOVS    R1, #0                         ; Move o valor 0 pra R1

    MOVS    R2, #0                         ; Move o valor 0 pra R2

raiz_loop
    CMP    R2, R0                          ; Compara R2 com R0

    BGT    raiz_feita                      ; Se R2 > R0, termina o loop

    ADDS    R1, R1, #1                     ; Incrementa +1 R1

    MULS    R2, R1, R1                     ; Calcula o quadrado de R1 e guarda R2

    B    raiz_loop                         ; Volta para o início do loop

raiz_feita
    SUBS    R1, R1, #1                       ; Decrementa -1 de R1

    MOVS    R0, R1                           ; Move R1 para R0

    BX    LR                              ; BX é usada para retornar ao endereço especificado pelo registrador LR (Link Register).

    END