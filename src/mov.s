.text
.global main
main:
        // mov
        // movz
        // movk
        // mov reg, src
        mov x0, #1000
        mov x1, x0
        // This instruction can not be executed by assembly
        // mov x0, #0x12345
        // We have to do it in two instructions:
        // First, load the four lower digits of the value in x2,
        // and fill the other ones with zeros.
        movz x2, #0x2345
        // Then, add the higher digit to x2, with an offset of 16 bits,
        // and keep previous x2 content.
        movk x2, #1, lsl #16

        // Trying to load 0x1234567890abcdef with mov,
        // we can only Shift Left on the move instruction,
        // and the shift value must be 16, 32 or 48 bits.
        movz x3, #0xcdef
        movk x3, #0x90ab, lsl #16
        movk x3, #0x5678, lsl #32
        movk x3, #0x1234, lsl #48

        mov w2, #1000

        mov x0, #0
        ret
