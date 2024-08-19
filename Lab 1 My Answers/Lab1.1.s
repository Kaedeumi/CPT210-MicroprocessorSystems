values dcd     2, 3, 6, 1, 8, 5, 6, 8
res1   fill    4
       adr     r9, values


       ;       task 1.1
       ;       Find out the highest value among these values and store the result to res1
       ;       ***Make sure your program works for all cases with 8 numbers***
       mov     r0, r9 ; back up to another register
       adr     r1, res1 ; get the address of saving the results
       add     r2, r0, #28 ; The address for the last number
       ldr     r5, [r0] ; get the current max

loop   add     r0, r0, #4 ; move to the next number
       cmp     r0, r2 ; to judge whether it is out of bounds or not
       bgt     exit
       ;       If not out of bounds, continue taking numbers and comparing
       ldr     r6, [r0] ; get the next number
       cmp     r5, r6 ; compare it with the current max value
       bgt     loop ; if the current is less than currentMax, continue
       mov     r5, r6 ; if the current is greater than or = currentMax, r6 is the new currentMax
       b       loop

exit   str     r5, [r1]