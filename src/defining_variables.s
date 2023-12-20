// Third assembly program, to discover variable definition

.data
sum: .quad 20

.text
.global main
main:
    ldr x0, =sum
    ldr x0, [x0]
    ret
