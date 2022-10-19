	.data
msg1:	.asciiz "Enter the no: "
msg_sum: .asciiz "The sum is:"

	.text
	.globl main

main:
    	li $v0, 4        # syscall 4 (print_str)
    	la $a0, msg1     # argument: string
    	syscall          # print the string

    	li $v0, 5
    	syscall
    	
	move $t0, $v0	# $t0 = num
	li $t1, 0	# $t1 = sum
	li $t2, 10	# $t2 = 10
next:
	beq $t0, $zero, print_result
	div $t0, $t2
	mfhi $t3
	mflo $t0
	add $t1, $t1, $t3
	j next
print_result:
	la $a0, msg_sum
	li $v0, 4
	syscall

	move $a0, $t1
	li $v0, 1
	syscall

	li $v0, 10      # exit
    	syscall         #
.end main