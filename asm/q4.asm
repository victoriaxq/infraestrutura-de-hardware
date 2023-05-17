#questao 4
addi x5, x0, 97 #a
addi x6, x0, 65 #A
addi x7, x0, 101 #e
addi x8, x0, 69 #E
addi x9, x0, 105 #i
addi x10, x0, 73 #I
addi x18, x0, 111 #o
addi x12, x0, 79 #O
addi x13, x0, 117 #u
addi x14, x0, 85 #U
addi x17, x0, 13 #enter
addi x16, x0, 0 # contador de consoantes

addi x20, x0, 100 #converte centenas
addi x21, x0, 10 #converte dezenas
addi x22, x0, 0

loop:
	lb x15, 1025(x0)
	bne x17, x15, a #if char teclado == enter -> a
	beq x17, x15, conv #if char teclado != enter -> conv

#compara o char do teclado com 'a'
a:	
	beq x15, x5, loop #char == 'a'
	bne x15, x5, A #char != 'a'

#compara o char do teclado com 'A'
A:
	beq x15, x6, loop
	bne x15, x6, e

#compara o char do teclado com 'e'
e:
	beq x15, x7, loop
	bne x15, x7, E

#compara o char do teclado com 'E'
E:
	beq x15, x8, loop
	bne x15, x8, i

#compara o char do teclado com 'i'
i:
	beq x15, x9, loop
	bne x15, x9, I

#compara o char do teclado com 'I'
I:
	beq x15, x10, loop
	bne x15, x10, o

#compara o char do teclado com 'o'
o:
	beq x15, x18, loop
	bne x15, x18, O

#compara o char do teclado com 'O'
O:
	beq x15, x12, loop
	bne x15, x12, u

#compara o char do teclado com 'u'
u:
	beq x15, x13, loop
	bne x15, x13, U

#compara o char do teclado com 'U'
U:
	beq x15, x14, loop
	bne x15, x14, soma

#se o char nao for vogal, adiciona-se 1 ao registrador x16
soma:
	addi x16, x16, 1
	jal x11, loop #volta pro inicio ler mais caracteres

#conversao
# x21 = 10
conv:  
	blt x16, x21, print #se num consoantes < 10, ja printa
	bge x16, x21, mais_de_dez 

mais_de_dez:
	blt x16, x21, print 
	addi x16, x16, -10 #x16 = unidade
	addi x22, x22, 1 #x22 = dezena
	jal x11, mais_de_dez


print:
	addi x22, x22, 48 #printa primeiro dezena
	sb x22,1024(x0)
	addi x16, x16, 48 #depois, unidade
	sb x16, 1024(x0)

#48 por causa da tabela ascii

