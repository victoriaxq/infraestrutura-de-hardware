#questao 1

lw x10, a 
lw x11, b
lw x12, m

add x12, x12, x10 # m = a
beq x11 , x12, if # if b == m
bne x11, x12, else

if:
	sub x12, x11, x10 #m = b - a

else:
	sub x12, x10, x11 #m = a - b

halt
a: .word 0x10
b: .word 0x11
m: .word 0x12