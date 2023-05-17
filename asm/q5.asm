#questao 7
sb x5, 1030(x0) #temp

addi x6, x0, 0b000001 #red_left
addi x7, x0, 0b000010 #red_right
addi x8, x0, 0b000100 #yellow_left
addi x9, x0, 0b001000 #yellow_right
addi x10, x0, 0b010000 #green_left
addi x11, x0, 0b100000 #green_right

addi x12, x0, 0x147 #temp = 16
addi x13, x0, 0x1ad #temp = 21
addi x14, x0, 0x213 #temp = 26
addi x15, x0, 0x27a #temp = 31
addi x16, x0, 0x2e0 #temp = 36

loop:
	lh x5, 1031(x0) #lendo a temperatura
	blt x5, x12, red_left #temp < 16
	blt x5, x13, red_right #temp < 21
	blt x5, x14, yellow_left #temp < 26
 	blt x5, x15, yellow_right #temp < 31
	blt x5, x16, green_left # temp < 36
	bge x5, x16, green_right # temp > 36

red_left:
	sb x6, 1029(x0)
	jal x0, loop

red_right:
	sb x7, 1029(x0)
	jal x0, loop

yellow_left:
	sb x8, 1029(x0)
	jal x0, loop

yellow_right:
	sb x9, 1029(x0)
	jal x0, loop

green_left:
	sb x10, 1029(x0)
	jal x0, loop

green_right:
	sb x11, 1029(x0)
	jal x0, loop
halt

