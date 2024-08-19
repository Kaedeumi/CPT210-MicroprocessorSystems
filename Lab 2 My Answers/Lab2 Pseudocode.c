// initialization
r0 = address, adr my_data
r1 = offsetCounter, 3
r2 = current
r3 = current.next, [r0, #3]
r4 = r3.next, [r0, #2]
r5 = r4.next, [r0, #1]
r6 = r5.next, [r0, #0]
r7 = cumulativeResult, 0
r8 = stringCounter, 0
r9 = storeBackAddress, adr my_data
r10 = storeBackOffset, 0

// main program
while(r2 != null){
	// shift the window rightwards for 1 byte
	r2 = r3;
	r3 = r4;
	r4 = r5;
	r5 = r6;
	r6 = nextByte;
	
	// Determine whether the 'mug' needs to be skipped or not
	if(r2 == LF){
		// skip the case where mug is at the beginning
		r8 += 1; // increment the string counter by 1
		prepareStoreBackData();
	}else if(r6 == LF){
		// skip the case where mug is at the ending
		prepareStoreBackData();
	else{
		// The remaining case is that mug must appear in the middle
		// examine each byte to see whether they form a combination of mug or not
		if(r5 == 'g' || r5 == 'G'){
			if(r4 == 'u' || r4 == 'U'){
				if(r3 == 'm' || r3 == 'M'){
					// we've found a mug in the middle, replace it
					r3 = 'c';
					r4 = 'u';
					r5 = 'p';
				}
			}
		}
		prepareStoreBackData();
	}
}

prepareStoreBackData(){
	// prepare a whole word to be stored back in memory
	if(r1 == 0){
		reset();
	}
	r7 += r2;
	r1 -= 1;
	r7 << 2;
	continue;
	
}

reset(){
	// reset all the parameters to the initial state
	r7 += r2;
	store the modified word back;
	// Initialize the parameters
	r1 = 3;
	r10 += 4;
	r0 += 4;
	r7 = 0;
	if(r2 == null){
		exit;
	}else{
		continue;
	}
}