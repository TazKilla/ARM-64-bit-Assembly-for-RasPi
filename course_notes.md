
# Requirements

- Basic knowledge of one high-level language - OK
- RasPi 3 or 4 - OK
- USB to TTL cable - OK

# COMPUTER ARCHITECTURE

## 2 - Intro to Computer Arch

    Main memory representation

             MSB           LSB
    Address   7 6 5 4 3 2 1 0
    00000000 |1|0|0|1|1|0|0|1| Byte (8 bits)
    00000001 |0|0|0|0|0|1|1|1| Half word (2 bytes)
    00000002 |0|1|0|0|1|0|1|0|
    00000003 |0|1|0|0|1|0|1|0| Word (4 bytes)
    00000004 |0|0|1|1|0|1|0|0|
    00000005 |1|1|1|1|0|1|0|0|
    00000006 |1|0|0|0|0|0|1|1|
    00000007 |0|0|1|0|1|0|1|0| Quad (8 bytes)

## 3 - Intro to Processor Modes

              / 64-bit OS and 64-bit programs
             | 31 64-bit general purpose registers (x0 - x30)
            / aarch64 -| PSTATE
           |           | Stack pointer (SP)
           |           | Zero Register (XZR)
    ARMv8 -|            \ Program Counter(PC)
           |
           |            /
            \ aarch32 -| Backward Compatibility
             \

    - ARM instruction size = 1 word (4 bytes)
    - 64-bit GP registers:
        [      XO      ] (64 bits)
                [  WO  ] (lower 32 bits of XO)
    - Register X30, aka link register, holds return address of procedures
    - Register X29 can be used for frame pointer

# DATA REPRESENTATION

## 4 - Number systems

### 4.1 - Decimal (base 10)

    Available digits: [0,1,2,3,4,5,6,7,8,9]

### 4.2 - Binary (base 2)

    Available digits: [0,1]
    [2³][2²][2¹][2⁰]
                  0
                  1
              1   0
              1   1
          1   0   0
          1   0   1
          1   1   0
          1   1   1
      1   0   0   0
      1   0   0   1
      1   0   1   0
      1   0   1   1  
      1   1   0   0
      1   1   0   1 ---> 1x2³ + 1x2² + 0x2¹ + 1x2⁰
                  = 8 + 4 + 0 + 1
                  = 13

### 4.3 - Hexadecimal (base 16)

    Available digits: [0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F]
    [16¹][16⁰]
           0
           1
           2
           3
           .
           .
           D
           E
           F
      1    0
      1    1
      1    2
      1    3 ---> 1x16¹ + 3x16⁰
           = 16 + 3
           = 19

### 4.4 - Convertions

    | Bin  | Hexa |
    | 0000 |   0  |
    | 0001 |   1  |
    | 0010 |   2  |
    | 0011 |   3  |
    | 0100 |   4  |
    | 0101 |   5  |
    | 0110 |   6  |
    | 0111 |   7  |
    | 1000 |   8  |
    | 1001 |   9  |
    | 1010 |   A  |
    | 1011 |   B  |
    | 1100 |   C  |
    | 1101 |   D  |
    | 1110 |   E  |
    | 1111 |   F  |

### 4.5 - From binary to hexadecimal

        1010001001
         /   |   \
      0010 1000  1001
        |    |    |
        2    8    9 ---> 2x16² + 8x16¹ + 2x16⁰
                  = 512 + 128 + 9
                  = 649

### 4.6 - From hexadecimal to binary

       7  A  E
      /   |   \
    0111 1010 1110

### 4.7 - How to write them

    Decimal     20
    Binary      0b10100
    Hexadecimal 0x14

## 5 - Representing Integers

### 5.1 - Unsigned numbers

    [ 1 Bit ]   [ 2 Bits ]   [ 3 Bits]
      0 = 0       00 = 0      000 = 0
      1 = 1       01 = 1      001 = 1
    0 to 2¹-1     10 = 2      010 = 2
                  11 = 3      011 = 3
                0 to 2²-1     100 = 4
                              101 = 5
     [ N Bits]                110 = 6
    0 to 2^n -1               111 = 7
                             0 to 2³-1

### 5.2 - Positive Signed Numbers

        [ 8 Bits ]
        Sign Bit (0 positive, 1 negative)
        \
         00000000 = 0
         00101000 = 1x2⁵ + 1x2³
                  = 32 + 8
                  = 40

         01111111 = 127

        So N-Bit Positive Numbers have range of: 0 to 2^(n-1)-1

### 5.3 - Negative Signed Numbers

    Negative numbers use two's complement representation
        [Two's Complement]
        Sign Bit
        \
         10101000 ---> ???
        To convert it, invert every bit and add 1:
         01010111
        +       1
        = 01011000 ---> 1x2⁶ + 1x2⁴ + 1x2³
        = 64 + 16 + 8
        = -88

         11111111 ---> ???
         00000000
        +        1
        = 00000001 ---> 1x2⁰
        = -1

        So N-Bit Negative numbers have range of: -2^(n-1) to 0

    So Signed Numbers have a range of: -2^(n-1) to 2^(n-1)-1

## 6 - ASCII Code

    American Standard Code for Information Interchange provides 128
    characters, and to each is assigned a unique 7 bits number.

        [Character][Decimal]
             0         48
             a         97
             A         65
             ?         63

    A string is composed of one or more characters, and can be converted as:
          HELLO
        = [H][E][L][L][O]
        = [72][69][76][76][79][0] 0 stand for end of the string,
                                  or null-terminated string.

# ASSEMBLY LANGUAGE BASICS

## 8 - Assembling and Linking Basics

                    |'''''''''''''|
                    | Source File |
                    |,,,,,,,,,,,,,|
                           |
                           |   Assembler
                           |
    |'''''''''''|   |'''''''''''''|
    | C Library |   | Object File |
    |,,,,,,,,,,,|   |,,,,,,,,,,,,,|
          |                |
          |________________|   Linker
                   |
            |'''''''''''''|
            | Executable  |
            |    File     |
            |,,,,,,,,,,,,,|

## 9 - The First Program

    Here is our first assembly program:

    1  .data
    2  var: .byte 0
    3
    4  .text
    5  .global main
    6  main:
    7          mov x0, #0
    8          ret
    9

    |Label  |opcode |operands |comments
     main:   mov     x0,       #0
             ret

    To compile the program, run the command: gcc source_file.s -o output_file
    (add -g to add debugging info)

# LOAD AND STORE INSTRUCTIONS

## 13 - Ldr Instructions

                     |''''''''|
                     | ARM v8 |
                     |,,,,,,,,|
              ____________|_____________
             |                          |
    |''''''''''''''''|  |'''''''''''''''''''''''|
    |  Load & Store  |  |    Data Processing    |
    |,,,,,,,,,,,,,,,,|  |,,,,,,,,,,,,,,,,,,,,,,,|

      Load:  Ldr Ldp     Arithmetic: Add Sub Mul
      Store: Str Stp     Logical:    And Orr Eor
                         Shift:      Lsl Lsr

    To proceed arithmetic operation, we need to move data from
    memory to registers, or Load the data.
    To save the result, we need to move data from registers to
    memory, or Store the data.
