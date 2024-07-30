.data
value: .quad 0x1234567890abcdef

.text
.global main
main:
        ldr x0, =value
        ldr x0, [x0]

        // ror reg, reg, value
        mov x1, #4
        // Rotate Right the value on x0 by x1(4) bits and load it on x2
        ror x2, x0, x1
        ror x3, x0, #16
        ror x4, x0, #32
        ror x5, x0, #48

        // Rotate Left the value on x0 by 4 bits and load it on x6
        ror x6, x0, #(64-4)
        ror x7, x0, #(64-16)
        ror x8, x0, #(64-32)
        ror x9, x0, #(64-48)

        mov x0, #0
        ret
