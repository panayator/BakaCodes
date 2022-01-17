#paradeigma sth taksh gia to lab3
.data
msg: .asciiz "Hello World\n"
done: .asciiz "DONE!\n"

.text
.globl main
main:
li $t0,1 #initialize
start:
la $a0,msg
li $v0,4
syscall  #print msg
add $t0, $t0,1
ble $t0,10,start #branch to start
la $a0,done
li $v0,4
syscall #print done
jr $ra