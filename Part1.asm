.data
string: .asciiz "Welcome to the Computer Architecture Class!"
newline: .asciiz "\n"
string2: .asciiz ""

.text
main:
#li $v0,8
#li $a1,49
#la $a0,string




li $v0,4
la $a0,string
syscall

li $v0,4
la $a0,newline
syscall

li $t0,0





loop:	  lb $t1,string($t0)    
          slti $s1,$t1,96
          beq $t1,'\0',exit
          beq $s1,1,cont
          
	
        sub $t1,$t1,32
        
cont :	sb $t1,string2($t0)
	addi $t0,$t0,1
	
	j loop


exit:
li $v0,4
la $a0,string2
syscall


li $v0,10
syscall