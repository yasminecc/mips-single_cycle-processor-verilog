.text

main:
    addi $t0, $0, 2
    addi $t2, $0, 2
    add  $t0, $t0, $t2
    addi $t1, $0, 1
    sw   $t0, 0($t1)
    lw   $t2, 0($t1)

loop:
    sub  $t0, $t0, $t1
    beq  $t0, $t1, end
    j loop

end:
    j end
