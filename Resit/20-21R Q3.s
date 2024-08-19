my_numbers DCD     -5, 11, 21, -72, -2, 2, 9, -3, 91, -6

           adr     r0, my_numbers
           ldr     r1, [r0] ; load the 1st element
           cmp     r1, #0
           rsblt   r3, r1, #0 ; get the abs value
           movgt   r3, r1 ; r3 is the currentMin
           add     r9, r0, #40
loop       add     r0, r0, #4
           cmp     r0, r9
           bgt     exit
           ldr     r1, [r0]
           cmp     r1, #0
           blt     reverse

           movgt   r2, r1
           b       cont
reverse    rsb     r2, r1, #0

cont       cmp     r2, r3
           movlt   r3, r2
           b       loop

exit       