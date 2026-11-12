.data
n:      .word 10
result: .word 0

.text
.globl main
main:
    lw    $a0, n
    jal   fibonacci
    nop
    sw    $v0, result

    move  $a0, $v0
    li    $v0, 36       # Print the result as unsigned decimal.
    syscall

    li    $v0, 10
    syscall

# $a0 = n, $v0 = F(n)
fibonacci:
    move  $v0, $a0
    sltiu $t0, $a0, 2
    bne   $t0, $zero, fib_done
    nop

    move  $t1, $zero    # a = 0
    li    $t2, 1        # b = 1
    addiu $t0, $a0, -1  # n - 1 iterations

fib_loop:
    move  $t3, $t2
    addu  $t2, $t1, $t2
    move  $t1, $t3
    addiu $t0, $t0, -1
    bne   $t0, $zero, fib_loop
    nop

    move  $v0, $t2
fib_done:
    jr    $ra
    nop
