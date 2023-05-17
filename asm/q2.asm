#questao 2
addi x12, x0, 0 #x
addi x13, x0, 0 #keyboard
addi x14, x0, 0 #aux_a
addi x15, x0, 0 #aux_b
addi x16, x0, 0 #aux_c

addi x19, x0, 13 #enter

addi x10, x0, 62 #62
addi x11, x0, 15 #15
addi x12, x0, 0 #x = 0

addi x21, x0, 0
addi x22, x0, 0
addi x23, x0, 0

converte_a:
	lb x13, 1025(x0) #pega o char
	sb x13, 1024(x0)
	beq x13, x19, converte_b
	addi x14, x13, -48 #vira int
	slli x21, x14, 3 # x10
	slli x14, x14, 1
	add x14, x14, x21
	jal x20, converte_a

converte_b:
	lb x13, 1025(x0)
	sb x13, 1024(x0)
	beq x13, x19, converte_c
	addi x15, x13, -48
	slli x22, x15, 3
	slli x15, x15, 1
	add x15, x15, x22
	jal x20, converte_b

converte_c:
	lb x13, 1025(x0)
	sb x13, 1024(x0)
	beq x13, x19, cond_1
	addi x16, x13, -48
	slli x23, x16, 3
	slli x16, x16, 1
	add x16, x16, x23
	jal x20, converte_c

cond_1:
	bge x14, x0, cond_2 # a>=0
	blt x14, x0, x_zero

cond_2:
	bge x10, x15, cond_3 # b<=62
	blt x10, x15, x_zero

cond_3:
	blt x11, x16, x_um # 15<c
	bge x11, x16, x_zero

x_zero:
	addi x12, x12, 48
	sb x12, 1024(x0)
	jal x20, converte_a

x_um:
	addi x12, x12, 49
	sb x12, 1024(x0)
	jal x20, converte_a
	