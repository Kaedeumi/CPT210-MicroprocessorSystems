lbarray      fill    4
             ;       task 2.2
             ;       Assume that the first 10 bits of lbarray (light bulb array) controls 10 light bulbs.
             ;       1 means that the light bulb is on. 0 means that the light bulb is off.
             ;       Write a piece of code so that these light bulbs flash with the following pattern:
             ;       1111100000
             ;       0111110000
             ;       0011111000
             ;       0001111100
             ;       0000111110
             ;       0000011111
             ;       0000111110
             ;       0001111100
             ;       .
             ;       .

             ;       That is, five consecutive lights bounces back and forth in the light bulb array.
             ;       Also, assume that the value of "bounces" controls the number of time it bounces
             ;       this part should finish when the number of bounces reaches the specified number.(5)
             adr     r9, lbarray
             mov     r5, #0b11111000000000000000000000000000
             str     r5, [r9]

right        cmp     r4, #5 ; compare the current bounce amount with the maximum
             beq     exit
             cmp     r3, #5 ; compare the shift amount with 5
             beq     bounce_left
             lsr     r5, r5, #1 ; move rightwards for 1 bit
             str     r5, [r9]
             add     r3, r3, #1
             b       right

bounce_left  mov     r2, #0 ; initialize the left shifting counter
             add     r4, r4, #1
             cmp     r4, #5 ; compare the current bounce amount with the maximum
             beq     exit
             b       left

left         cmp     r4, #5 ; compare the current bounce amount with the maximum
             beq     exit
             cmp     r2, #5 ; compare the shift amount with 5
             beq     bounce_right
             lsl     r5, r5, #1 ; move rightwards for 1 bit
             str     r5, [r9]
             add     r2, r2, #1
             b       left

bounce_right 
             mov     r3, #0 ; initialize the left shifting counter
             add     r4, r4, #1
             cmp     r4, #5 ; compare the current bounce amount with the maximum
             beq     exit
             b       right

exit         