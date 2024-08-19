num1   equ     0xFB32C76D
num2   equ     0x0D796B7C
num3   equ     0x79C286A4

       ldr     r0, =num1
       ldr     r1, =num2
       ldr     r2, =num3

       sub     r4, r0, #0x78
       eor     r5, r1, #0x0008C000
       bic     r6, r2, r0
       add     r7, r1, r2, lsl #4