        AREA    fatorial, CODE, READONLY
        EXPORT  __main

__main
    MOVS    R0, #5                                             ; Move o valor que queremos o fatorial para R0

    BL      fatorial                                           ; Chama a função fatorial

    B       .                                                  ; A função fica rodando em loop

fatorial
    CMP     R0, #1                                             ; Compara o valor de R0 com 1

    BEQ     fatorial_feito                                     ; Se R0 == 1, a função fatorial_feito é chamada
    PUSH    {R0}                                               ; Salva o valor atual de R0
    SUBS    R0, R0, #1                                         ; Subtrai 1 do valor de R0
    BL      fatorial                                           ; Chama de forma recursiva a função fatorial de novo
    POP     {R1}                                               ; Restaura o valor de R0

    MULS    R0, R0, R1                                         ; Multiplica o resultado pelo valor de R0                 

fatorial_feito                                                 ; Da o resultado final: 12
    BX      LR                                                 ; Retona pro endereço que está no LR

    END