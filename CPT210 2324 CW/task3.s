       ;       Task 3:
       ;       Reverse the order of the bits with even index numbers in "mydata".
       ;       Assume that:
       ;       1. "mydata" is always 32 bits long.
       ;       2. In this question, we treat the most significant bit as 0th bit.
       ;       3. The most significant bit has an even index number (0).
       ;
       ;       Your program should make sure that bits with odd index numbers are not affected.
       ;
       ;       ***IMPORTANT: Reversed result should be stored back to "mydata".
       ;
       ;       Example:
       ;       -----------------------------------------------------------------------------------
       ;       bit index:   0 1 2 3 4 5 6 7   8 9 1 1 1 1 1 1   1 1 1 1 2 2 2 2   2 2 2 2 2 2 3 3 
       ;                                          0 1 2 3 4 5   6 7 8 9 0 1 2 3   4 5 6 7 8 9 0 1
       ;       0xF0100080 [ 1 1 1 1 0 0 0 0 | 0 0 0 1 0 0 0 0 | 0 0 0 0 0 0 0 0 | 1 0 0 0 0 0 0 0 ]
       ;       
       ;       even bits  [ 1 _ 1 _ 0 _ 0 _ | 0 _ 0 _ 0 _ 0 _ | 0 _ 0 _ 0 _ 0 _ | 1 _ 0 _ 0 _ 0 _ ]
       ;       reversed   [ 0 _ 0 _ 0 _ 1 _ | 0 _ 0 _ 0 _ 0 _ | 0 _ 0 _ 0 _ 0 _ | 0 _ 0 _ 1 _ 1 _ ]
       ;
       ;       odd bits   [ _ 1 _ 1 _ 0 _ 0 | _ 0 _ 1 _ 0 _ 0 | _ 0 _ 0 _ 0 _ 0 | _ 0 _ 0 _ 0 _ 0 ]
       ;
       ;       Expected final result:
       ;       0x5210000A [ 0 1 0 1 0 0 1 0 | 0 0 0 1 0 0 0 0 | 0 0 0 0 0 0 0 0 | 0 0 0 0 1 0 1 0 ]
       ;
       ;       bit index:   0 1 2 3 4 5 6 7   8 9 1 1 1 1 1 1   1 1 1 1 2 2 2 2   2 2 2 2 2 2 3 3 
       ;                                          0 1 2 3 4 5   6 7 8 9 0 1 2 3   4 5 6 7 8 9 0 1
       ;
       ;       Code correctness, efficiency, clarity and simplicity are all examined in this task.

mydata DCD     0xF0100080
