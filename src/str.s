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
    ldr x0, =value
    ldr x0, [x0]

    ldr x1, =dst1
    ldr x2, =dst2
    ldr x3, =dst3
    ldr x4, =dst4

    str x0, [x1]
    strb w0, [x2]
    strh w0, [x3]
    str w0, [x4]
