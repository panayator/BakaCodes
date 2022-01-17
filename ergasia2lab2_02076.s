.data
num1: .asciiz "enter first number: "
num2: .asciiz "enter second number: "
str1: .asciiz "The two numbers are equal\n"
str2: .asciiz "The two numbers are not equal\n"
str3: .asciiz "The greater number is number "
str4: .asciiz "\nThe smaller number is number "

.text
.globl main

main: 
la $a0, num1		# argument: string
li $v0, 4			# syscall 4 (print_str)
syscall				# print the string
 
li $v0,5			# syscall 4 (read_int)
syscall				# read the integer
move $t1, $v0		# moves from one register to another
 
la $a0, num2
li $v0, 4
syscall
 
li $v0,5
syscall
move $t2, $v0
 
beq $t1, $t2, equal
 
la $a0, str2
li $v0, 4
 syscall
 
j L2				# Branch to L2 label, unconditionally
 
equal:
la $a0, str1
li $v0, 4
syscall
 
L2: 
bge $t1, $t2, L1	# Branch to L1 label, if ($s1 ≥ $s0
move $t3, $t1
move $t1, $t2
move $t2, $t3
 
L1: 
la $a0, str3
li $v0, 4
syscall
 
add $a0, $zero, $t1
li $v0,1
syscall
 
la $a0, str4
li $v0, 4
syscall
add $a0, $zero, $t2
li $v0,1
syscall
 
jr $ra			# retrun to calller