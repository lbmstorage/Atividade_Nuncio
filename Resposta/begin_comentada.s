		  THUMB                                             ; modo de instrução ARM que usa instruções de 16 bits em vez das instruções de 32 bits padrão
StackSize EQU 0x00000100                                    ; Define o tamanho da pilha para 256 (0x100 em hexadecimal)
          AREA STACK, NOINIT, READWRITE, ALIGN=3            ; Area Stack = define a area da memoria pra pilha / NOINIT = pilha não inicializada / Readwrite = permite leitura e gravação da pilha
MyStackMem SPACE StackSize                                  ; Isso reserva espaço na pilha da memória
          AREA RESET, READONLY                              ; Isso define uma área de memória somente leitura para o código do programa.
          EXPORT __Vectors                                  ; Isso torna o símbolo Vectors visível para outros arquivos.
__Vectors
          DCD MyStackMem + StackSize                        ; Isso define o vetor de interrupção. 
          DCD Reset_Handler                                 ; O primeiro valor é o endereço inicial da pilha e o segundo valor é o endereço do manipulador de reset.
          AREA MYCODE, CODE, READONLY                       ;
          EXPORT Reset_Handler                              ;
Reset_Handler

main
    NOP
    END