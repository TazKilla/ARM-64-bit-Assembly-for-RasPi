// Fifth assembly program, to discover Ldr instruction
.data
value: .quad 0x123456789abcdef

.text
.global main
main:
    ldr x0, =value
    // Load unsigned data:
    ldrb w1, [x0]   // Load byte-size data in 32 bit register
    ldrh w2, [x0]   // Load half-word-size data
    ldr w3, [x0]    // Load word-size data

    // Load signed data:
    ldrsb w4, [x0]
    ldrsh w5, [x0]
    ldrsw x6, [x0]
    
    mov x0, #0
    ret
