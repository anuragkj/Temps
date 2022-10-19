.data
array: .word 100000, 24, 56, 78, 90, 100, 323, 745, 4326, 57456
length: .word 10
msg: .asciiz "The largest element is :"

.text
main:

  	la $a0, array               # $a0 has base address
  	lw $a2, length              # Load length of array into $a2
 	li $t0, 0                   # i = 0
	lw $s0, 0($a0)

loop:
	addi $a0, $a0, 4		# Add 4 (1 word index) to the array
	addi $t0, $t0, 1		# Add one to the index
  	bge $t0, $a2, out           # If $t0 > $a2 [i > length], we are outside the array
  	lw $t1, 0($a0)              # Load the element into t1
  	blt $t1, $s0, loop         # Found the element
  	move $s0, $t1         
        j loop 

out:
	la $a0, msg		# print msg
	li $v0, 4
	syscall

	li $v0, 1		# print number
	move $a0, $s0
	syscall

  	li $v0, 10
  	syscall
.end main