.data

input: .space 11 # user input
enter: .asciiz "\n"
# N = 26 + (X % 11), N(base) = 30
# M = N - 10, M = 20
.text

main:
li $v0, 8
la $a0, input
li $a1, 11
syscall

enterInput:
move $t3, $a0
lb $s2, ($t3)

# check values
verify:
beq $t0, 10, output