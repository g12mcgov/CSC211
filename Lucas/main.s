/*

	Read the (18 bit) integer N stored in the switches,
	compute lucas(N), and display lucas(N) in the 18 red leds.
	
	David John
	February 2015
	
*/

/* 
	After doing some Googling, I found that we need
	to define some I/O base addresses in order to be
	able to display our signature.
*/

.equ HEX3_HEX_0_BASE_ADDRESS, 0x10000020
.equ HEX7_HEX_4_BASE_ADDRESS, 0x10000030

.global  _start

.extern  lucas
#.extern signature

_start:
	/* Display my signature on the board */
	movia r10, HEX3_HEX_0_BASE_ADDRESS
	movia r11, HEX7_HEX_4_BASE_ADDRESS
	movia r12, signature

	ldw r6, 0(r12)
	stwio r6, 0(r11)
	ldw r6, 4(r12)
	stwio r6, 0(r10)

	/* initialize sp register, needed for 
	   store/load in calling convention  */
	movia  sp,0x007ffffc     /*  top SRAM  address  */

	/* get value of N  (18 bits) from switches  */
	movia  r8,0x10000040     /*  address of slider switches  */
	ldwio  r4,0(r8)          /*  grab value and place in r4 */
	
	/* call lucas(N)  */
	call   lucas
	
	/* display returned value (18 bits) in red leds  */
	movia  r8,0x10000000     /* address of red leds  */
	stwio  r2,0(r8)

stop:
		br stop

.data
	signature:
		/* Display 1 - "g" */
		.word 0x000000006F
		/* Display 2 - "rant */
		.word 0x6F505C5470
.end

