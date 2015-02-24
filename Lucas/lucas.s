#
#	Author: Grant McGovern
#	Date: 22 Feb 2015
#
#	~ Recursive implementation of the Lucas Method (originally written in C) ~
#	~ To be run on Altera Nios II Architecture ~
#
#

.global lucas

.text

/*
	NOTE: After meeting with Dr. John, there was some concern about the saving
	and restoring of register r8. After carefully examining the program, it appears
	that r8 still remains 0 after each time the program is run. As a result, I
	didn't feel it was necessary to increase the stack frame and store the temp
	variable n 4(sp). However, if this is still an issue, I would be happy to discuss
	it!
*/

lucas:
	/* In the case N != 0, branch to the next step */	
	bne r4, r0, lucasA
	
	/* Otherwise, store 2 in r2 and exit */
	movi r2, 2
	
	ret	

lucasA:
	/* Perform N - 1 */
	subi r4, r4, 1
	
	/* In the case N != 1, branch to the next (recursive) step */
	bne r4, r0, lucasB
	
	/* Otherwise, add 1 to r4 and put 1 into r2 and exit */
	addi r4, r4, 1
	movi r2, 1
	
	ret

lucasB:	
	/* Stores the value of r8 in the stack pointer (sp) */
	subi sp, sp, 8	

	/* Stores 0th displacement of the stack pointer (sp) in r8 */
	stw r8, 0(sp)
	/* Stores the 4th displacement of the stack pointer in ra */
	stw ra, 4(sp)
	
	/* Recursively calls the lucas method (For N - 1) */
	call lucas
	
	/* Sets r8 equal to r2 */
	add r8, r2, r0
	
	/* Acts as an N - 2 (because we made a previous call for N - 1) */
	subi r4, r4, 1
	/* Recursively calls the lucas method (For N - 2) */
	call lucas
	
	/* Add together the contents of r2 & r8 and store them in r2 */
	add r2, r2, r8
	/* Add 2 to our r4 (parameter) register */
	addi r4, r4, 2
	
	/* Load value of 0th offset stack pointer into r8 */
	ldw r8, 0(sp)
	/* Load value of the 4th offset stack pointer into r8 */
    	ldw ra, 4(sp)
	
	/* Add 8 back to our stack pointer (# of registers * 4 bytes) */
	addi sp, sp, 8
	
	/* Otherwise, if all said and done, exit the program */
	br exit

/* Self-explanatory */
exit:
	ret
		