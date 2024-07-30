.data
var1: .quad 0xf000000000000000
var2: .quad 0x1234567890abcdef

.text
.global main
main:
    ldr x0, =var1
    ldr x0, [x0]

    // Arithmetic shift right, in x2, the value stored in x0, by 4 bits
    // asr reg, reg, value
    asr x1, x0, #4
    asr x2, x0, #8
    asr x3, x0, #16
    asr x4, x0, #32

    ldr x0, =var2
    ldr x0, [x0]

    asr x5, x0, #4
    asr x6, x0, #8
    asr x7, x0, #16
    asr x8, x0, #32

    mov x0, #0
    ret
