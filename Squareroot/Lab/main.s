

.global _start

.equ HEX3_HEX_0_BASE_ADDRESS, 0x10000020
.equ HEX7_HEX_4_BASE_ADDRESS, 0x10000030

.extern babylonian

_start:

	/* execution of my logo */

	/* Display my signature on the board */
	movia r10, HEX3_HEX_0_BASE_ADDRESS
	movia r11, HEX7_HEX_4_BASE_ADDRESS
	movia r12, signature

	ldw r9, 0(r12)
	stwio r9, 0(r11)
	ldw r9, 4(r12)
	stwio r9, 0(r10)

	/* initialize sp register, needed for 
	store/load in calling convention */
	movia sp, 0x007ffffc			/* top SRAM address */
	
	/* get the float N (18 bits) from switches */
	movia r8, FArg
	ldwio r4, 0(r8)
	
	/* call babylonian(N)  */
	call babylonian
	
	/* display returned value in red LEDs */
	movia r8, 0x10000000 /* address of red LEDs */
	stwio r2, 0(r8)
	
stop:
	br stop

.data
	signature:
			/* Display 1 - "g" */
			.word 0x000000006F
			/* Display 2 - "rant */
			.word 0x6F505C5470
	FArg: .float 26.13
	.end


	




















