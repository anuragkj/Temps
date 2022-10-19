.data
ArrayA: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
ArrayB: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
ArrayC: .space 40  # 10 * 4 = 40 bytes
length: .word  10  # eg 10 elements
msg: .asciiz "\n"

.text
.globl main

main:
     li $t0, 0        # i = 0
     lw $t1, length   # $t1 = n
next_i:
     bge $t0, $t1, print  # if i >= n then L1 (out of loop)
     sll $t2, $t0, 2   # each element is 4bytes A[i] = A + i*4
     lw  $t3, ArrayA($t2)  # $t3 = A1[i]
     lw  $t4, ArrayB($t2)  # $t4 = B[i]
     add $t5, $t3, $t4 # $t5 = $t3, $t4
     sw  $t5, ArrayC($t2)  # C[i] = A[i] + B[i]
     add $t0, $t0, 1   # i++
     j   next_i
print:  
	li $t0, 0        # i = 0
print_next:
	bge $t0, $t1, L1  # if i >= n then L1 (out of loop)
     	sll $t2, $t0, 2   # each element is 4bytes A[i] = A + i*4
     	lw  $a0, ArrayC($t2)  # $t3 = C[i]
	li $v0, 1
	syscall
	la $a0, msg
	li $v0, 4
	syscall
	add $t0, $t0, 1   # i++
	j print_next
L1:
	li $v0,10
	syscall
.end main
