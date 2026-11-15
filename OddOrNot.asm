.data
    m:       .word 7       
    result:  .space 4       

    trueMsg:  .asciiz "True\n"
    falseMsg: .asciiz "False\n"

.text
.globl main

main:
    lw $a0, m               
    jal IsOdd                 
    sw $v0, result          
    # Display returned Boolean
    beq $v0, $zero, PrintFalse

PrintTrue:
    li $v0, 4
    la $a0, trueMsg
    syscall
    j Exit

PrintFalse:
    li $v0, 4
    la $a0, falseMsg
    syscall

Exit:
    li $v0, 10
    syscall


# IsOdd(m)
# Input: m
# Output: True (1) or False (0)
IsOdd:
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    li $a1, 2                 # Divisor = 2

    jal division             # Calculate m % 2

    beq $v0, $zero, NotOdd    # If remainder = 0

    li $v0, 1                 # Return True
    j IsOddEnd

NotOdd:
    li $v0, 0                 # Return False

IsOddEnd:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra


# division(x,y)
# Input: x,y
# Output: remainder
division:
    move $t0, $a0             # x
    move $t1, $a1             # y
    li $t2, 0                 # quotient = 0

DivisionLoop:
    slt $t3, $t0, $t1        # Is x < y?
    bne $t3, $zero, DivisionEnd

    subu $t0, $t0, $t1       # x = x - y
    addi $t2, $t2, 1         # quotient++

    j DivisionLoop

DivisionEnd:
    move $v0, $t0             # Return remainder
    jr $ra

