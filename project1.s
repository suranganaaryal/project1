.data

input: .space 11 # user input
enter: .asciiz "\n"
.text

main:
li $v0, 8
la $a0, input
li $a1, 11
syscall