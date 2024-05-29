        EXPORT start
        THUMB
        AREA MYCODE, CODE, READONLY
        ENTRY
        IMPORT Reset_Handler
        IMPORT __Vectors

start
    MOVS    R0, #16                             ; Move o valor que queromos a raiz para R0

    BL      raiz                                ; Chama a função raiz

    B       .                                   ; Chama um loop infinito

raiz                                            ; Função da raiz quadrada
    MOVS    R1, #0                              ; Move o valor 0 para o registrador R1

    MOVS    R2, #0                              ; Move o valor 0 para o registrador R2

raiz_loop                                       ; Começa a função de loop da raiz
    CMP     R2, R0                              ; Compara os valores nos registradores R2 e R0 ()

    BGT     raiz_feita                          ; Se R2 > R0 termina o loop

    ADDS    R1, R1, #1                          ; Adiciona +1 no R1

    MOVS    R3, R1                              ; Calcula o quadrado de R1
    MULS    R2, R3, R3                          ; Armazena o quadrado em R2

    B       raiz_loop                           ; Volta pro inicio do loop

raiz_feita      	                        
    SUBS    R1, R1, #1                          ; O loop termina quando o quadrado atual é maior que o que calculando a raiz quadrada, precisamos decrementar R1 para obter a raiz quadrada correta.

    MOVS    R0, R1                              ; Esta linha move o valor de R1 (a raiz quadrada) para R0.

    BX      LR                                  ; BX é usada para retornar ao endereço especificado pelo registrador LR (Link Register).

    END