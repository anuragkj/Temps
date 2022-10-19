#factorial=1;
#if (N >= 1)
#{
#   for(i=1; i<=n; i++)
#   {
#     factorial *= i;
#   }
#}

	.data
msg1:   .asciiz "Enter N: "
msg2:   .asciiz "Factorial = "
no:    	.word 0
factorial:    .word 0
#crlf:   .byte 0xd, 0xa, 0

	.text
	.globl main

main:   
	li $v0, 4		# syscall 4 (print_str)
    	la $a0, msg1    	# argument: address of string
    	syscall         	# print the string

    	li $v0, 5		# syscall 5 (read_int)
    	syscall			# read int into $v0
    	sw $v0, no		# store in no

    	li  $t0, 1     		# factorial = 1	
    	li  $t1, 1      	# $t1 (i = 1)
    	lw  $t2, no     	# $t2 (t2 = no)

blt $t2, $t1, outer
loop: 	bgt $t1, $t2, outer
	mul $t0, $t0, $t1
	addi $t1, $t1, 1
	j loop
outer:

    sw  $t0, factorial

    li $v0, 4       		# syscall 4 (print_str)
    la $a0, msg2    		# argument: string
    syscall         		# print the string

    li 	$v0, 1      		# syscall 4 (print_int)
    lw  $a0, factorial	# argument: int to be printed in $a0
    syscall

#    li $v0, 4        		# syscall 4 (print_str)
#    la $a0, crlf     		# argument: string
#    syscall          		# print the string

    li $v0, 10      		# 
    syscall         		#

 .end main 