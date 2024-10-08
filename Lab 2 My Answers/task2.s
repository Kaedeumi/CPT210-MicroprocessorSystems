          ;       We consider an array of strings stored in my_data.
          ;       Each string ends with a "line feed" character (please search for it in the ASCII table online)
          ;       The end of the whole array is signified by the "NULL" character (also mentioned in the ASCII table)

          ;       Your task: replace all occurrences of "mug" that appear in the middle of a string with "cup".
          ;       For example, "My beloved mug" and "Mug falls on the ground" should not be replaced,
          ;       but "There's a mug on my desk" or "abcmugcba" should be replaced.
          ;       The search should be case insensitive, meaning that "Mug", "mUg" and "MUG" should all be replaced with "cup" (lower case)

          ;       The final result must be written back to my_data.
          ;       You should also indicate how many strings does my_data contain in R8
          ;       Failing to do so results in mark deduction

          ;       In this current "my_data", it stores the two strings:
          ;       M y b e l o v e d m u g LF a b c m u g c b a LF NULL
          ;       4d 79 20 62 65 6c 6f 76 65 64 20 6d 75 67 0A 61 62 63 6d 75 67 63 62 61 0A 00
          ;       you program must work for any valid data created
my_data   DCD     0x4d792062, 0x656c6f76, 0x6564206d, 0x75670A61, 0x62636d75, 0x67636261, 0x0A000000
          ;my_datadcd 0x0A6d7567,0x00000000

          ;       first decide the role of each register: r0 holds address, r2 is the current char, with r3 r4 r5 being
          ;       the next sequential ones. r6 points to the whole current byte, r8 is the counter of strings whose value
          ;       is incremented once a LF has been detected.
          ;       Specially, r1 denotes the offset of the char on the NEXT byte, being initialized with the value of #3.

          ;       Note that we make sure that the word 'mug' doesn't appear at the beginning or the ending by checking
          ;       the contents of r3 r4 r5 since r2 is the current one and r6 is the last one
          adr     r9, my_data
          mov     r0, r9

          mov     r1, #3 ; offset counter being initialized to 3 (which refers to the first 2 bits of a byte)
          mov     r7, #0
          mov     r8, #0 ; string counter
          mov     r10, #0 ; storage pointer
          ;       load the following 4 characters into the registers
          ldrb    r3, [r0, #3]
          ldrb    r4, [r0, #2]
          ldrb    r5, [r0, #1]
          ldrb    r6, [r0, #0]
          add     r0, r0, #4 ; move to the next bar of memory

loop1     ;       This method barely moves the pointer forward iteratively (for 4 times each row)
          ;       much like a moving queue or moving linked list
          mov     r2, r3
          mov     r3, r4
          mov     r4, r5
          mov     r5, r6
          ldrb    r6, [r0,r1] ; the fresh new data loaded from the next bar

          ;       The lines below handle the special cases
          ;       to judge whether the current position is a LF or not
          cmp     r2, #0x0A
          beq     line_feed
          ;       to judge whether the last index in the array (r6) is a LF or not
          ;       This if clause is very important: an appearance of LF on r6 makes it sure that we are
          ;       not going to the normal procedure of checking mugs.
          cmp     r6, #0x0A
          beq     continue1 ; jump directly
          ;       Now the remaining case is when the farthest char in sight is not LF, then check as normal
          ;       if we have found a 'g' somewhere..
          cmp     r5, #0x67 ;g
          beq     gIsFound
          cmp     r5, #0x47 ;G
          beq     gIsFound


continue1 ;This   regularly forms a full bar of updated memory (on r7) to be stored back
          ;       if r1 gets to 0
          cmp     r1, #0
          beq     reset ; which means that we have got a whole bar of number in r7

          add     r7, r7, r2 ; add the cumulative result (r7) with the current byte
          sub     r1, r1, #1 ; reduce the offset by 1
          lsl     r7, r7, #8 ; logical shift r7 by 8 bits (2 bytes) to ensure an adequate space
          b       loop1

line_feed ;       once a line feed has been detected, increase the amount of r8 (linefeed counter) by 1
          add     r8, r8, #1
          b       continue1

gIsFound  ;       if have u, check m next
          cmp     r4,#0x75 ; check U
          beq     uIsFound
          cmp     r4, #0x55 ; check for U
          beq     uIsFound ;
          b       continue1


uIsFound  ;       if have M, change mug to cup
          cmp     r3, #0x6d ; check for m
          beq     allFound
          cmp     r3, #0x4D ; check for M
          beq     allFound
          b       continue1


allFound  mov     r3, #0x63 ; replace with m
          mov     r4, #0x75 ; replace with u
          mov     r5, #0x70 ; replace with g
          b       continue1

reset     ;       in this method, we restore all of the related parameters back to their original state
          ;       this function is invoked by a zero return of r1.
          add     r7, r7, r2
          str     r7, [r9, r10] ; store the current whole row to the place indicated by r10 offset of r9
          mov     r1, #3 ; offset counter is initialized to 3
          add     r10, r10, #4
          add     r0, r0, #4
          mov     r7, #0x0
          ;       if end of array: finish
          cmp     r2, #0x0
          beq     exit
          ;       else, continue looping
          b       loop1

exit      