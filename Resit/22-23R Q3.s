         mov     r0, #0b10101111
         mov     r1, #0b11110000
         MOV     R2, #7 ; Counter for loop (0 to 7)

zip_loop 
         add     r7, r2, r2 ; offset counter for r1
         add     r8, r7, #1 ; offset counter for r0

         LSR     R4, R0, R2 ; Logical shift right R0 by R2 bits
         AND     R4, R4, #1 ; Mask to get the least significant bit of the result
         LSL     R4, R4, R8 ; Shift it back to its original position in R0
         ORR     R3, R3, R4 ; Place it into R3

         LSR     R5, R1, R2 ; Logical shift right R1 by R2 bits
         AND     R5, R5, #1 ; Mask to get the least significant bit of the result
         LSL     R5, R5, R7 ; Shift it back to its original position in R1
         ;       ADD R5, R5, R2 ; Shift it one more bit to the left (since it goes in odd positions)
         ORR     R3, R3, R5 ; Place it into R3

         SUB     R2, R2, #1 ; Decrement counter
         CMP     R2, #0 ; Compare counter to 0
         BGE     zip_loop ; If counter is >= 0, continue loop

         ;       R3 now contains the zipped result
