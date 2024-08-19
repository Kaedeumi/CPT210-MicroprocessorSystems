        ;       Task 1:
        ;
        ;       Write a program to sum up the absolute values of
        ;       negative numbers stored in "nums".
        ;       "Nums" always ends with value 0 and there will
        ;       never be any 0s in the middle.
        ;
        ;       In the example given below, the result should be:
        ;       "1 + 2 + 9 = 12"
        ;
        ;       ***IMPORTANT: Result should be stored into "abs".
        ;
        ;       Marks will be deducted if result is not saved properly.
        ;       No need to consider overflow and underflow in this task.
        ;       Code correctness, clarity and simplicity are examined in this task.

nums    DCD     -1, -2, 7, 3, -9, 0
abs     FILL    4

        adr     r0, nums ; get the address of the array
        ldr     r2, [r0] ; load the first element

compare 
        cmp     r2, #0 ; compare with 0
        blt     negate
        b       next

negate  rsb     r3, r2, #0 ; if negative, take its opposite number

sum     add     r4, r4, r3 ; r4 is the current sum

        ;       if positive, skip the summing step
next    add     r0, r0, #4
        ldr     r2, [r0]
        cmp     r2, #0 ; if at the end of array, exit
        beq     exit
        b       compare

exit    adr     r5, abs
        str     r4, [r5]