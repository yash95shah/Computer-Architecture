.data
mymessage: .asciiz "Hey everyone my name is Yash \n Please enter the values of u and v respectively"
u: .asciiz "\n Enter the value of u "
v: .asciiz " Enter the value of v "
ans: .asciiz "The final result of the function is:"

.text
main:

li $v0,4
la $a0,mymessage
syscall

li $v0,4
la $a0,u
syscall

li $v0,5
syscall
move $a1,$v0
move $t0,$a1
jal square
move $s0,$v1

li $v0,4
la $a0,v
syscall

li $v0,5
syscall
move $a2,$v0
move $t0,$a2
jal square
move $s1,$v1

jal multiply
move $s2,$v1


mul $t2,$s1,3
move $s1,$t2
mul $s2,$s2,5
# move $s2,$t2

add $t2,$s0,$s2
sub $t2,$t2,$s1

li $v0,4
la $a0,ans
syscall

addi $a0,$t2,7
li $v0,1
syscall

li $v0,10
syscall




square:
mul $v1, $t0, $t0
jr $ra


multiply:
mul $v1,$a1,$a2
jr $ra

