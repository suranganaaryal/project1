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

sort_values:
addi $t0, $t0, 1
bge $s2, 97, lowercaseT # lowercase 
bge $s2, 65, uppercaseT # uppercase 
bge $s2, 48, numbers # for number 0

# creating a function
counter:
addi $t3, $t3, 1
lb $s2,($t3)
j verify

# uppercase character T
uppercaseT:
bge $s2, 85, counter # for letter t
sub $s2, $s2, 55
add $s3, $s3, $s2
j counter

# for the lowercase character t
lowercaseT:
bge $s2, 117, counter # for letter t
sub $s2, $s2, 87
add $s3, $s3, $s2
j counter

numbers:
bge $s2, 58, counter
sub $s2, $s2, 48
add $s3, $s3, $s2
j counter