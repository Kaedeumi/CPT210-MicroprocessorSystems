numbers dcd     -12, -15
res2    fill    4

        ;       Task 3.2
        ;       Extend 3.1 to support all negative values with a 15-bit-long absolute values (its positive version being 15 bits long).
        ;       Store the result in res2.

        adr     r9, numbers
        ldr     r2, [r9] ; r2 will be first number
        ldr     r3, [r9, #4] ; r3 will be second number

        cmp     r3, #0 ; if r3 is negative jump to loop 2
        blt     loop2

loop1   ;       if r3 is positive, increase r4 until r4 == r3
        cmp     r4, r3 ; if loop counter (r4)==r3 exit
        bge     exit

        add     r5, r5, r2 ; update output r5
        add     r4, r4, #1 ; increment r4
        b       loop1

loop2   ;       if r3 is negative, decrease r4 until r4 == r3
        cmp     r4, r3 ; if loop counter(r4)=r3 negate answer and finish
        ble     negate

        add     r5, r5, r2 ; update output r5
        sub     r4, r4, #1 ; decrement loop counter
        b       loop2
negate  
        rsb     r5, r5, #0 ; negate answer
exit    
        adr     r0, res2
        str     r5, [r0]