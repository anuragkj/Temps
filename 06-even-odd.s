	.data
msg1:	.asciiz "Enter the no: "
msg_is_odd:	.asciiz "The no is odd\n"
msg_is_even: .asciiz "The no is even\n"
num:    .word 0

	.text
	.globl main

main:
    	li $v0, 4        # syscall 4 (print_str)
    	la $a0, msg1     # argument: string
    	syscall          # print the string

    	li $v0, 5
    	syscall
    	
	move $t0, $v0	# $t0 = num
	li $t1, 2
	div $t0, $t1
	
	mfhi $t0
	beq $t0, $zero, even_no
	la $a0, msg_is_odd
	j print_msg
even_no:
	la $a0, msg_is_even
print_msg:
	li	$v0, 4
	syscall

	li $v0, 10      # exit
    	syscall         #
.end main