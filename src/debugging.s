// Second assembly program, to discover debugging

.data
counter: .quad 10

.text
.global main
main:
    mov x2, #100
    ldr x0, =counter
    ldr x1, [x0]
    mov x0, #0
    ret
