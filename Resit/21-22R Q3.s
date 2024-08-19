my_chars  DCD     0x43505439, 0x31306973, 0x48617264, 0x21000000

          adr     r0, my_chars
loop      ldrb    r1, [r0]
          cmp     r1, #0x00
          beq     exit
          cmp     r1, #0x3A ; to see if it is a number
          ble     number
          b       cont

number    cmp     r1, #0x39 ; if is 39, change into 30
          moveq   r1, #0x30
          beq     cont_loop
          add     r1, r1, #1 ; else, +1 to the numbers
          strb    r1, [r0]
          add     r0, r0, #1
          b       loop

cont      cmp     r1, #0x60
          subgt   r1,r1,#0x20 ; if lower case, convert it into upper case
cont_loop strb    r1, [r0]
          add     r0, r0, #1
          b       loop


exit      