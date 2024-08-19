       mov     r9, #0x10000008
       ;       add mask to left side and right side separately
       mov     r1, #0xFF
       orr     r1, r1, #0xFF00
       and     r2, r9, r1
       lsr     r7, r2, #1; right part

       lsl     r3, r1, #16 ; left part mask
       and     r4, r9, r3
       lsl     r8, r4, #1
       orr     r9, r7, r8