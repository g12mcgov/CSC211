/*
*
*
* Author: Grant McGovern
* Date: 1 April 2015
*
*/

.global babylonian

.text

/* Macros */
.macro fmuls rgC, rgB, rgA
	custom 252, \rgC, \rgB, \rgA
.endm

.macro fadds rgC, rgB, rgA
	custom 253, \rgC, \rgB, \rgA
.endm

.macro fsubs rgC, rgB, rgA
	custom 254, \rgC, \rgB, \rgA
.endm

.macro fdivs rgC, rgB, rgA
	custom 255, \rgC, \rgB, \rgA
.endm

/* Note: I decided to use register 2 (r2) as a register througout the program
	rather than using an additional register. I know it is unconventional to
	use the return r2 register like this, but I found it made things simpler.

*/
babylonian:
	/* Move 2.0 into r6 */
	movia r6, FTwo
	/* Load the value */
	
	ldw r6, 0(r6)
	
	/* Divide r4 by r6 and store it in r2 */
	fdivs r2, r4, r6                                 

loop:
	/* Put r2 into r3 */
	add r3, r0, r2

	/* Perform a series of floating point arithmetic using above macros */
	fdivs r2, r4, r3
	fadds r2, r2, r3
	
	/* Each of these steps mimicks the algorithm */
	fdivs r2, r2, r6
	
	fsubs r5, r2, r3
	
	fdivs r5, r2, r3
	fdivs r5, r5, r2 	

	/* Perform bitwise operations as discussed in class */
	srli r5, r5, 23
	
	/* Perform a logical and imediate */
	andi r5, r5, 0x00ff
	
	cmpgti r5, r5, 0x0068
	
	/* Go back to the loop top */
	bgt r5, r0, loop
	

ret

.data
FTwo: .float 2.0

