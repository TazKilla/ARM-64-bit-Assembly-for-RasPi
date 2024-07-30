// Discovery of store instruction
.data
value: .quad 0x1234567890abcdef
dst1: .quad 0
dst2: .quad 0
dst3: .quad 0
dst4: .quad 0

.text
.global main
main:
    // str reg, addr
    // Loads as the same as above
    ldr x0, =value
    ldr x0, [x0]

    // Loads more addresses into next registers
    ldr x1, =dst1
    ldr x2, =dst2
    ldr x3, =dst3
    ldr x4, =dst4

    // Stores the value from x0 to memory address specified into x1
    str x0, [x1]
    // Stores unsigned byte
    strb w0, [x2]
    // Stores unsigned half-word
    strh w0, [x3]
    // Stores unsigned word (long)
    str w0, [x4]

    mov x0, #0
    ret
