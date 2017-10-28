.data
array: .space 100	#create an array of size 100
.text
main:
  li $v0,8 		#scan string 
  la $a0,array
  li $a1,100		#a1=100
  syscall
  move $t0,$a0		#address of array in t0
  li $t1,0		#t1=0
  li $s0,65		#s0=65(ascii of A)
  li $s1,97		#s1=97(Ascii of a)
  l:
  lb $s3,($t0)		#load first byte in s3
  bge $s3,$s1,capital	#if s3> s1 convert to capital case
  bge $s3,$s0,small	#if s3> s0 convert to small
   X:
  addi $t0,$t0,2	#t0=t0+2
  addi $t1,$t1,2	#t1=t1+2
  bge $t1,$a1,exit	#if t1>=a1 then exit
  j l			#jump back to l
  small:
  addi $s3,$s3,32	#convert to small case by addding 32
  sb $s3,($t0)		#store byte in s3
  j X			#jump to x
  capital:
  addi $s3,$s3,-32	#convert to capital by substracting 32
  sb $s3,($t0)		#store byte in s3
  j X
  exit:    
  la $a0,array		#load address of array in a0
  li $v0,4		#v0=4
  syscall		#code for exit
  li $v0,10
  syscall
