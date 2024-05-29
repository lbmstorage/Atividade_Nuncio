        AREA    multiplicacao, CODE, READONLY           ; define uma área chamada “multiplicacao” para o código. Ela é marcada como somente leitura (READONLY)
        EXPORT  __main                                  ; A função main foi exportada para ser usada

__main
        LDR     R0, =6                                  ; LDR carrega o valor 6 no registrador R0
        LDR     R1, =7                                  ; LDR carrega o valor 3 no registrador R1

        MULS    R2, R0, R1                              ; MULS multiplica os valores nos registradores R0 e R1 e armazena o resultado no registrador R2.

        BX      LR                                      ; BX é usada para retornar ao endereço especificado pelo registrador LR (Link Register).

        END                                             ; Marca o final do código.
