
.global babylonian

.text

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


babylonian:

	movia r6, FTwo
	ldw r6, 0(r6)
	fdivs r2, r4, r6                                 

doloop:
	mov r3, r2
	fdivs r2, r4, r3
	fadds r2, r2, r3
	fdivs r2, r4, r6
	fsubs r5, r2, r3
	fdivs r5, r2, r3
	fdivs r5, r5, r2 	

	srli r5, r5, 23
	andi r5, r5, 0x00ff
	cmpgti r5, r5, 0x0068
	bgt r5, r0, doloop
	

ret

.data
FTwo: .float 2.0

