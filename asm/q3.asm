#questao 3

lw x10, a #atribuindo a ao reg x10 
lw x11, b #atribuindo b ao reg x11 
lw x12, aux #atribuindo aux ao reg x12

add x12, x10, x0 # aux = x10
srli x12, x12, 8#agora a ideia eh dar shift left no reg auxiliar
slli x12, x12, 24 #agora shift right pra ficar na pos correta
add x11, x12, x11 #somando x12 a x11 

halt
a: .word 0x10
b: .word 0x11
aux: .word 0x12