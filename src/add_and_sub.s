.text
.global main
main:
    // add reg, src1, operand2
    mov x0, #1000
    mov x1, x0

    add x2, x0, #1
    add x3, x0, x1

    // x0 + x1 * 2
    add x4, x0, x1, lsl #1
    // x0 + x1 / 2
    add x5, x0, x1, asr #1 // we use asr to keep the sign

    mov x6, #-1
    mov w6, #-1
    add x7, x0, x6
    add x8, x0, x6, sxtw // signed extended word

    // sub reg, src1, operand2
    mov x0, #1000
    mov x1, #500

    sub x2, x0, #1
    sub x3, x0, x1

    sub x4, x0, x1, lsl #1
    sub x5, x0, x1, asr #1

    mov w6, #-100
    sub x7, x0, x6
    sub x8, x0, x6, sxtw

    mov x0, #0
    ret
