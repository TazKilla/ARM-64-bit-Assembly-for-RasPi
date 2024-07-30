.data
value: .quad 0x123456789

.text
.global main
main:
    ldr x0, =value
    ldr x0, [x0]

    // Store 4 in register x1
    mov x1, #4
    // Logical shift right, in x4, the value stored in x0, by 2 bits (value in x1)
    // lsr reg, reg, value
    lsr x2, x0, x1
    // Or use an immediate value
    lsr x3, x0, #4
    lsr x4, x0, #8
    lsr x5, x0, #16
    lsr x6, x0, #32
    lsr x7, x0, #48

    mov x0, #0
    ret
