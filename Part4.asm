.data
num1: .asciiz  "Enter the value of i:  "
num2: .asciiz "Enter the value of x:  "
answer: .asciiz "The final result is:  "

.text
.globl main
main:
li $v0,4
la $a0,num1
syscall

li $v0,5
syscall
move $a1,$v0

li $v0,4
la $a0,num2
syscall

li $v0,5
syscall
move $a2,$v0

li $v0,4
la $a0,answer
syscall

jal compute

move $a0,$v0
li $v0,1
syscall

li $v0,10
syscall


compute:
subu $sp,$sp,12
sw $ra,0($sp)
sw $a2,4($sp)
sw $a1,8($sp)



bgtz $a2,label1
bgtz $a1,label2
li $v0,1

lw $ra,0($sp)
addi $sp,$sp,12
jr   $ra 




label1:
subi  $a2,$a2,1
jal compute

addi $v0,$v0,1
lw $ra,0($sp)
lw $a2,4($sp)
lw $a1,8($sp)
addi $sp,$sp,12
jr $ra

label2:

subi $a1,$a1,1
addi $a2,$a1,0
jal compute
addi $v0,$v0,5
lw $ra, 0($sp)
lw $a2,4($sp)
lw $a1,8($sp)

addi $sp,$sp,12
jr $ra


