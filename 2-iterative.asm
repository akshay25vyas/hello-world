.data
.text
main:
  li $v0,5       	#scan x
  syscall
  move $s7,$v0   	#s7=x
  li $v0,5 		#scan n
  syscall
  move $s1,$v0 		#s1=n
  addi $s1,$s1,-1	#s1=s1-1
  move $s4,$s7    	#s4=x
  mul $s4,$s4,$s7	#s4=s4*x
  addi $s1,$s1,-1	#s1=s1-1
  jal power
  li $v0,10
  syscall
  power: 		#calculate(x^n)
  beq $s1,$zero,print
  mul $s4,$s4,$s7	#multiply till n decrements to 0 
  addi $s1,$s1,-1
  j power
  print:		#print d result
  move $a0,$s4
  li $v0,1
  syscall
  jr $ra
