/*  main program driver for bubble.s 

    David John
    January 2015
*/

.global  _start

.extern  ascchk
.extern  bubble

.text

_start:

        /*  set up parameters for bubble sort and
            then call bubble   */
	movia r4,myarray
        movi  r5,100

	call  bubble

       /*   set up parameters for sort checker and
            then call ascchk  */
        movia r4,myarray
        movi  r5,100

        call  ascchk

       /*  done -- loop it off  (love to ret to an op sys)  */

loop:
	br  loop




.data
/*    Here is the data that I'm sorting   */
myarray:
	.word  8,2,14,1,6,3,7,17,44,82,3,9,2,1,8,14,66,7,4,3
        .word  8,2,14,1,6,3,7,17,44,82,3,9,2,1,8,14,66,7,4,3
        .word  8,2,14,1,6,3,7,17,44,82,3,9,2,1,8,14,66,7,4,3
        .word  8,2,14,1,6,3,7,17,44,82,3,9,2,1,8,14,66,7,4,3
        .word  8,2,14,1,6,3,7,17,44,82,3,9,2,1,8,14,66,7,4,3
.end
