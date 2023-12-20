.data
value: .quad 0x11011011

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]

    // Store 2 in register x1
    mov x1, #2
    // Logical shift left, in x2, the value stored in x0, by 2 bits (value in x1)
    // lsl reg, reg, value
    lsl x2, x0, x1
    // Or use an immediate value
    lsl x3, x0, #4
    lsl x4, x0, #8
    lsl x5, x0, #16
    lsl x6, x0, #32
    lsl x7, x0, #48

    mov x0, #0
    ret
