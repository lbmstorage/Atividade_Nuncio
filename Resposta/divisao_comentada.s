AREA    divisao, CODE, READONLY
EXPORT  __main

__main
        LDR     R0, =10                        ; LDR carrega o valor 10 no registrador R0
        LDR     R1, =3                         ; LDR carrega o valor 3 no registrador R1

        MOV     R2, #0                         ; Move o valor 0 para o registrador R2
        MOV     R3, #0                         ; Move o valor 0 para o registrador R3

divisao_loop                                   ; Inicio do loop
        CMP     R0, R1                         ; Compara os valores R0 e R1 (10 e 3)
        BLT     divisao_feita                  ; Se a comparação for "menor que", somos direcionados para divisao_feita

        SUB     R0, R0, R1                     ; Subtrai o valor do R1 em R0 (10-3)
        ADD     R2, R2, #1                     ; Adiciona +1 no R2 (Isso está contando quantas vezes R1 pode ser subtraído em R0)

        B       divisao_loop                   ; Salta pro inicio do loop até que R0 seja menor que R1

divisao_feita                                  ; Inicio da função que retorna o resultado, e fim do loop que mostra o resultado R2

        BX      LR                             ; Retona pro endereço que está no LR

        END                                    ; Fim do programa
