values dcd     2, 3, 6, 1, 8, 5, 6, 8
res3   fill    4
       adr     r9, values

       ;       task 1.3
       ;       Find out the second highest value among these values, store the result to res3
       ;       For the numbers given above, the answer should be 6
       ;       ***Make sure your program works for all cases with 8 numbers***
       mov     r0, r9
       adr     r1, res3
       add     r2, r0, #28
       ldr     r5, [r0] ; r5 holds the current max
       ldr     r4, =0x80000000 ; r4 is the 2ndMax, initialized with the smallest integer

loop   add     r0, r0, #4
       cmp     r0, r2
       bgt     exit
       ldr     r6, [r0] ; r6 is the current value
       cmp     r5, r6 ; compare it with the current max
       bge     l2 ; if currentMax >= current, branch into l2 to handle more situations
       ;       currentMax < current, assign currentMax and current2ndMax with new values
       mov     r4, r5
       mov     r5, r6
       b       loop

l2     cmp     r5, r6
       beq     loop ; if current == currentMax, do nothing
       ;       now that currentMax > current, handle the sub-cases
       cmp     r4, r6
       bgt     loop ; if current2ndMax > current, do nothing
       ;       the only case remaining is current2ndMax < current < currentMax
       mov     r4, r6
       b       loop


exit   str     r4, [r1]