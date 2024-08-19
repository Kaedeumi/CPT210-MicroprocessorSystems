       ;       real instruction
       ldr     r1, =0xaabbccdd

       ;       pseudo instruction
value  dcd     0xaabbccdd
       ldr     r3, =value
       ldr     r2, [r3] ; equivalent