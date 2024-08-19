       ;       Task 3:
       ;       Reverse the order of the bits with even index numbers in "mydata".
       ;       Assume that:
       ;       1. "mydata" is always 32 bits long.
       ;       2. In this question, we treat the most significant bit as 0th bit.
       ;       3. The most significant bit has an even index number (0).
       ;
       ;       Your program should make sure that bits with odd index numbers are not affected.
       ;
       ;       ***IMPORTANT: Reversed result should be stored back to "mydata".
       ;
       ;       Example:
       ;       -----------------------------------------------------------------------------------
       ;       bit index: 0 1 2 3 4 5 6 7 8 9 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
       ;       0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
       ;       0xF0100080 [ 1 1 1 1 0 0 0 0 | 0 0 0 1 0 0 0 0 | 0 0 0 0 0 0 0 0 | 1 0 0 0 0 0 0 0 ]
       ;
       ;       even bits [ 1 _ 1 _ 0 _ 0 _ | 0 _ 0 _ 0 _ 0 _ | 0 _ 0 _ 0 _ 0 _ | 1 _ 0 _ 0 _ 0 _ ]
       ;       reversed [ 0 _ 0 _ 0 _ 1 _ | 0 _ 0 _ 0 _ 0 _ | 0 _ 0 _ 0 _ 0 _ | 0 _ 0 _ 1 _ 1 _ ]
       ;
       ;       odd bits [ _ 1 _ 1 _ 0 _ 0 | _ 0 _ 1 _ 0 _ 0 | _ 0 _ 0 _ 0 _ 0 | _ 0 _ 0 _ 0 _ 0 ]
       ;
       ;       Expected final result:
       ;       0x5210000A [ 0 1 0 1 0 0 1 0 | 0 0 0 1 0 0 0 0 | 0 0 0 0 0 0 0 0 | 0 0 0 0 1 0 1 0 ]
       ;
       ;       bit index: 0 1 2 3 4 5 6 7 8 9 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 3 3
       ;       0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
       ;
       ;       Code correctness, efficiency, clarity and simplicity are all examined in this task.

mydata DCD     0xF0100080
       ;evenMaskequ 0xAAAAAAAA

       adr     r0, mydata
       ldr     r1, [r0]

       orr     r2, r2, #0xAA
       orr     r2, r2, #0xAA00
       orr     r2, r2, #0xAA0000
       orr     r2, r2, #0xAA000000

       ;ldr    r2, =evenMask alternatively load directly if permitted.
       and     r3, r1, r2 ; r3 now holds the even-indexed bits only
       sub     r4, r1, r3 ; r4 now holds the odd-indexed bits only, keep that unchanged

       mov     r5, #-2
loop   add     r5, r5, #2
       cmp     r5, #32
       beq     exit
       ;       reverse the even indexed bits (Lab 2.1)
       lsl     r6, r3, r5 ; shift the bits to the left
       lsr     r6, r6, #31 ; shift the bits to the right
       add     r7, r5, #1
       lsl     r6, r6, r7 ; shift to the reversed position
       orr     r8, r8, r6
       b       loop

exit   ;       combine odd bits with reversed even bits
       orr     r9, r4, r8
       str     r9, [r0]
