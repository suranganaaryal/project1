.data

input: .space 11 # user input
enter: .asciiz "\n"
.text

main:
li $v0, 8
la $a0, input
li $a1, 11
syscall

enterInput:
move $t3, $a0
lb $s2, ($t3)

verify:
beq $t0, 10, output

sort_values:
addi $t0, $t0, 1
bge $s2, 97, lowercaseU 
bge $s2, 65, uppercaseU 
bge $s2, 48, numbers 