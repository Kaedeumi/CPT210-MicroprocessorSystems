num1    dcd     0x1, 0x2, 0x3, 0x4

        ;       real instruction: get the address of num1
        ldr     r0, =num1

        ;       pseudo instruction: get the address of num1 in another way
address dcd     0x200
        ldr     r2, =address
        ldr     r1, [r2];equivalent