mydata dcd     1,2,3,4

       ldr     r1, =mydata
       mov     r2, #1
       ldr     r0, [r1, r2, lsl #2]