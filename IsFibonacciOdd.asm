.data
n:        .word 10          # Input positive integer
result:   .word 0           # Output 1 if F(n) is odd, 0 if even

trueMsg:  .asciiz "1 (True)\n"
falseMsg: .asciiz "0 (False)\n"

.text
.globl main

main:
    lw    $a0, n
    jal   IsFibonacciOdd
    sw    $v0, result

    beq   $v0, $zero, PrintFalse

PrintTrue:
    li    $v0, 4
    la    $a0, trueMsg
    syscall
    j     Exit

PrintFalse:
    li    $v0, 4
    la    $a0, falseMsg
    syscall

Exit:
    li    $v0, 10
    syscall


IsFibonacciOdd:
    addi  $sp, $sp, -4
    sw    $ra, 0($sp)

    jal   fibonacci
    move  $a0, $v0
    jal   IsOdd

    lw    $ra, 0($sp)
    addi  $sp, $sp, 4
    jr    $ra


fibonacci:
    move  $v0, $a0
    sltiu $t0, $a0, 2       # If n <= 1 return n
    bne   $t0, $zero, fib_done

    move  $t1, $zero
    li    $t2, 1
    addiu $t0, $a0, -1

fib_loop:
    move  $t3, $t2
    addu  $t2, $t1, $t2
    move  $t1, $t3
    addiu $t0, $t0, -1
    bne   $t0, $zero, fib_loop

    move  $v0, $t2
fib_done:
    jr    $ra


IsOdd:
    addi  $sp, $sp, -4
    sw    $ra, 0($sp)

    li    $a1, 2
    jal   division          # $v0 = m % 2

    beq   $v0, $zero, NotOdd
    li    $v0, 1            # return 1
    j     IsOddEnd

NotOdd:
    li    $v0, 0            # return 0

IsOddEnd:
    lw    $ra, 0($sp)
    addi  $sp, $sp, 4
    jr    $ra


division:
    move  $t0, $a0
    move  $t1, $a1
    li    $t2, 0

DivisionLoop:
    sltu  $t3, $t0, $t1
    bne   $t3, $zero, DivisionEnd

    subu  $t0, $t0, $t1
    addiu $t2, $t2, 1
    j     DivisionLoop

DivisionEnd:
    move  $v0, $t0          # return remainder
    jr    $ra
