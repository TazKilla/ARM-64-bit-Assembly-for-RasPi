.text
.global main
main:
    // neg reg, operand2
    mov x0, #10
    neg x1, x0 // put -10 in x1
    neg x2, x0, lsl 2 // multiply -10 by 4

    mov x3, #-200
    neg x4, x3

    mov x5, #0
    neg x6, x5

    mov x0, #0
    ret
