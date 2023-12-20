// Fourth assembly program, to discover constants definition

.equ buffer_size, 500
.equiv buffer_size, 4000

.text
.global main
main:
mov x0, #buffer_size
    mov x0, #0
    ret
