         ;       Task 2:
         ;       Convert the integer stored in 'num' into 32-bit IEEE 754 floating point format.
         ;       Make sure both positive and negative numbers are properly converted.
         ;       ***IMPORTANT: Store your result in 'res'
         ;
         ;       Hint: a number multiplied by or divided by 2 can be achieved using shift operations.
         ;       Code correctness, efficiency, clarity and simplicity are all examined in this task.
         ;
num      dcd     0xF0100080
res      FILL    4

         adr     r0, num
         ldr     r1, [r0]
         ;ldr    r1, =num

         cmp     r1, #0
         beq     store
         ;       1. Extract the sign bit
         and     r2, r1, #0x80000000 ; r2 is the sign bit

         cmp     r1, #0
         blt     negative
         b       positive

negative rsb     r3, r1, #0 ; r3 stores the absolute value if negative
         b       copy
positive mov     r3, r1

         ;       2. Calculate the exponent
copy     mov     r4, r3 ; copy r3 to r4 for operations
loop     cmp     r4, #1
         beq     mantissa

         lsr     r4, r4, #1
         add     r5, r5, #1 ; r5 is the exponent counter
         b       loop

         ;       3. Get the mantissa
mantissa rsb     r6, r5, #32
         mov     r7, r3 ; for temporary operations
         lsl     r7, r7, r6
         lsr     r7, r7, #9 ; r7 holds the mantissa

assemble add     r8, r5, #127 ; exponent value in IEEE format
         lsl     r8, r8, #23
         orr     r10, r10, r2
         orr     r10, r10, r8
         orr     r10, r10, r7

store    
         adr     r11, res
         str     r10, [r11]
