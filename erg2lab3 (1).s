#Fibonacci Sequence.
.data
msg: .asciiz "Write the number of Fibonacci numbers you want to display: \n"
newline: .asciiz "\n"
.text
.globl main

main: 
la $a0,msg
li $v0, 4
syscall					#Prints message

li $t0,0				#puts first Fibonacci number in a temporary $t0 register
li $t1,1

li $v0, 5
syscall
move $t2, $v0

Loop:

move $a0, $t1		
li $v0,1
syscall

la $a0,newline			#prints newline to change line for each number.
li $v0, 4
syscall

add $t3,$t0,$t1			#transfer numbers between registers and add one more Fibonacci number each time.
move $t0, $t1
move $t1, $t3

sub $t2,$t2, 1
bne $t2, $zero, Loop	#if $t2!=0 go to loop.

jr $ra					#retrun to caller