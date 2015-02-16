/*
*
*	Author: Grant McGovern
*	Date: 12 Feb 2015 
*	Description: A bubble sort routine (originally written in C), translated to assembly.
*
*
*/

.global bubble

.text

/*
	NOTE: 	I indented this program to mimic a for-loop. I know this probably isn't "standard" convention, 
		but it helped me visualize and understand what was going on more.
*/

bubble:
	/* First move the array into register 23 */
	mov r23,r4
	
	/* Using the length of our list (in r5), perform a logical left shift to find the end of list */
	slli r20,r5,0x2
	
	/* Adding together r4 and r20, and store the result in r20. */
	add r20,r4,r20
	
	/* Branch to the first loop */
	br dj1

	/* First Loop */
	dj1:
		/* If r19 and r20 are equal, exit out of the loop */
		beq r23,r20,stop
		
		/* Otherwise, advance the loop by adding a displacement of 4 */
		addi r23,r23,0x4
		
		/* Store the contents of r19 into r17 */
		mov r24,r23
		
		/* Branch back to second loop */
		br dj2

		/* Second Loop */
		dj2:
			/* Load word from array index [j] */
			ldw r21,-4(r24)
			
			/* Load word from array index [j+1] */
			ldw r22,0(r24)		
			
			/* If [j+1] < [j], then we branch to our swap block */
			blt r22,r21,A
			
			/* Otherwise, branch back to the first loop */
			br dj1
			
			/* This is where we perform our swaps */
			A:
				/* Store [j+1] into r21 */
				stw r21,0(r24)
				
				/* Store [j] into r22 (using array displacements) */ 
				stw r22,-4(r24)
				
				/* Since we stopped, we need to de-increment it by adding -4 */
				addi r24,r24,-4
				
				/* If r24 and r4 are equal, branch to dj1 */
				beq r24,r4,dj1
				
				/* Otherwise, branch back to the second loop */
				br dj2

stop:
	ret
