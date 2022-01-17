.data
msg1: .asciiz "Write your surname: "
msg2: .asciiz "Write your AM number: "
result1: .asciiz "\nYour surname is: "
result2: .asciiz "\nYour AM number is: "
str: .space 255

.text
.globl main

main:

# prints out my text (msg1)
li $v0, 4						#syscall 4 (print_str)
la $a0, msg1					#argument: string
syscall							#print the string

# allocating memory
la $a0, str						#read string
li $a1,255 						#set 255 bytes max to allocate
li $v0,8						#read_str
syscall 						#read the string (allocate)

# prints out my text (msg2)
li $v0, 4
la $a0, msg2
syscall

# Reading
li $v0, 5 						# syscall 4 (read_int)
syscall 						# read the integer
add $t2, $zero, $v0				# add it to the running sum

# Printing
li $v0, 4
la $a0, result1
syscall

li $v0, 4
la $a0, str
syscall

li $v0, 4
la $a0, result2
syscall

add $a0, $zero, $t2
li $v0, 1 						# syscall 1 (print_int)
syscall 						# print the integer

jr $ra 							# retrun to caller
