/*  Check for ascending sorted list -- if ok display "yes" 
    otherwise display "no".  Integer array (r4) and its size (r5) 
    passed as parameters.

    David John
    January 2015
*/

.global ascchk

.text 

ascchk:

	/* clear Hex0-Hex3  */
	movia  r18,0x10000020     /* address of Hex0-Hex3  */
        stw    r0,0(r18)

        /* check for size <=1 if so just exit */
        cmplei r19,r5,1
        beq    r19,r0,onward
        ret

onward:
        /* set Hex0-Hex3 to be negative */
        movia r18,0x10000020      /* address of Hex0-Hex3  */
        movia r19,HEXNO           /* assume worst  */
        ldw   r19,0(r19)
        stwio r19,0(r18)

	/* intialize r16 with N-1 and r20 with X[0]  */
	subi  r16,r5,1
        ldw   r20,0(r4)

	/* r23 will point to x[i] */
	mov r23,r4

        /* essentially create a for(I=1 ...) loop  */
loop:
        /* grab x[i+1]  */
        ldw  r21,4(r23)
        
        /* if x[i] <= x[i+1] great otherwise problem */	
	ble  r20,r21,ok

        /* so sorry, array out of order  */

	ret

ok:  
       /* set up to grab the next term and continue pairwise 
          comparisions  */
       mov  r20,r21      /*  move current x[I+1] into x[i] register */
       addi  r23,r23,4   /*  update displacement */

       /*  continue loop ??  */
       subi  r16,r16,1  
       bne   r16,r0,loop

       /* to get here all has gone very well, array is sorted  */

      movia r19,HEXYES
      ldw   r19,0(r19)
      stw   r19,0(r18)

      ret

.data

/* bit patterns for messages  */
HEXNO:  .word  0x0000373f  /* NO  */
HEXYES: .word  0x0066796d  /* YES */

.end

	