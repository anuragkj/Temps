#a  = a * b / c % d + e;
	.data
var_a: .word 10
var_b: .word 10
var_c: .word 10
var_d: .word 7
var_e: .word 10
msg_sum: .asciiz "The sum is:"

	.text
	.globl main

main:
	lw $t0, var_a
	lw $t1, var_b
	mul $t0, $t0, $t1
	lw $t1, var_c
	div $t0, $t1
	mflo $t0
	lw $t1, var_d
	div $t0, $t1
	mfhi $t0
	lw $t1, var_e
	add $t0, $t0, $t1	
	
	la $a0, msg_sum
	li $v0, 4
	syscall

	move $a0, $t0
	li $v0, 1
	syscall

	li $v0, 10      # exit
    	syscall         #
.end main