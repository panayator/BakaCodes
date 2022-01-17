.data
newline: .asciiz "\n"
.text
.globl main

main:
li $a0,1
Loop:
li $v0,1
syscall

move $t0,$a0

li $v0,4			#Prints newline/changes line
la $a0,newline
syscall

move $a0,$t0		
addi $a0,$a0,1		#t0 = t0 + 1
slt $t0,$a0,11      #if one value is less than another value then set the value/ $t0 = ($a0 < 11)
bne $t0,$0,Loop		# if ($t0 != $0 loop) 

jr $ra				#retrun to caller