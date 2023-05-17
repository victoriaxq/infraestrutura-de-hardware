#questao 6

addi x7, x0, 3
addi x8, x0, 4
addi x9, x0, 5
addi x10, x0, 6
addi x23, x0, 7
addi x24, x0, 8
addi x25, x0, 9

addi x11, x0, 1 #1! 
addi x12, x0, 2 #2!
addi x13, x0, 6 #3!
addi x14, x0, 24 #4!
addi x15, x0, 120 #5!
addi x16, x0, 720 #6!
addi x17, x0, 5040 #7!
addi x18, x0, 40320 #8!
addi x19, x0, 362880 #9!
addi x20, x0, 0 #keyboard
addi x21, x0, 0 #cont
addi x22, x0, 0 #aux
addi x26, x0, 13 #enter

addi x27, x0, 10 #10
addi x28, x0, 100 #100
addi x29, x0, 1000 #1000
lw x30, dez_mil
lw x31, cem_mil
lw x5, m_ilao

loop:
	lb x20, 1025(x0)
	beq x20, x26, enter
	addi x22, x20, -48
	beq x22, x11, one
	beq x22, x12, two
	beq x22, x7, three
	beq x22, x8, four
	beq x22, x9, five
	beq x22, x10, six
	beq x22, x23, seven
	beq x22, x24, eight
	beq x22, x25, nine
	jal x1, loop

one:
	add x21, x21, x11
	jal x1, loop

two:
	add x21, x21, x12
	jal x1, loop

three:
	add x21, x21, x13
	jal x1, loop

four:
	add x21, x21, x14
	jal x1, loop

five:
	add x21, x21, x15
	jal x1, loop

six:
	add x21, x21, x16
	jal x1, loop

seven:
	add x21, x21, x17
	jal x1, loop

eight:
	add x21, x21, x18
	jal x1, loop

nine:
	add x21, x21, x19
	jal x1, loop

#conversao
enter:
	addi x11, x0, 0
	addi x12, x0, 0
	addi x13, x0, 0
	addi x14, x0, 0
	addi x15, x0, 0
	addi x16, x0, 0
	beq x0, x0, milao #forcando condicao

milao:
	blt x21, x5, cent_mi #if x21 < 1000000
	sub x21, x21, x5 #x5
	addi x11, x11, 1 #milhao
	jal x1, milao

cent_mi:
	blt x21, x31, dez_mi #if x21 < 100000
	sub x21, x21, x31
	addi x12, x12, 1 #centena milhar
	jal x1, cent_mi

dez_mi:
	blt x21, x30, uni_mi #if x21 < 10000
	sub x21, x21, x30
	addi x13, x13, 1
	jal x1, dez_mi

uni_mi:
	blt x21, x29, cent #if x21< 1000
	sub x21, x21, x29
	addi x14, x14, 1
	jal x1, uni_mi

cent:
	blt x21, x28, dec #if x21 < 100
	sub x21, x21, x28
	addi x15, x15, 1
	jal x1, cent

dec:
	blt x21, x27, print
	sub x21, x21, x27
	addi x16, x16, 1
	jal x1, dec

print:
	addi x11, x11, 48
	addi x12, x12, 48
	addi x13, x13, 48
	addi x14, x14, 48
	addi x15, x15, 48
	addi x16, x16, 48
	addi x21, x21, 48
	sb x11, 1024(x0) #unidade milhao
	sb x12, 1024(x0) #centena milhar
	sb x13, 1024(x0) #dezena milhar
	sb x14, 1024(x0) #unidade milhar
	sb x15, 1024(x0) #centena 
	sb x16, 1024(x0) #dezena
	sb x21, 1024(x0) #unidade 

halt
dez_mil: .word 0x2710
cem_mil: .word 0x186A0
m_ilao: .word 0xF4240

