mydata dcd     0xABCDEF01
res1   fill    4
       ;       task 2.1
       ;       Reverse the bits of mydata and save it to res1.
       ;       The pattern is:
       ;       The most significant bit will become the least significant bit.
       ;       The second msb will become the second lsb.
       ;       The third msb -> third lsb
       ;       ...
       ;
       ;       examples:
       ;       0x80008000 -> 0x00010001
       ;       0x00018000 -> 0x00018000
       ;       0x13700000 -> 0x00000EC8

       adr     r3, mydata ; assign mydata's address to R3
       ldr     r2, [r3] ; load the value held in r3 to r2

loop   cmp     r1, #31 ; r1 is the pointer
       bgt     exit
       lsl     r4, r2, r1 ; clear the bits to the left of that bit
       lsr     r4, r4, #31 ; clear the bits to the right of that bit
       lsl     r4, r4, r1 ; move that bit to the correct position in the result
       orr     r0, r0, r4 ; save the current bit to r0
       add     r1, r1, #1 ; increment the counter
       b       loop

exit   adr     r5, res1
       str     r0, [r5]