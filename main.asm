	.def _c_int00
	.mmregs
	.text
_c_int00:
	ld	#d3n, dp
	ssbx	frct
	rsbx	ovm
	orm	#1, PMST
	stm	#d3n, ar2
	rptz	A, #8
	stl	A, *ar2+
	
	stm	#511, ar1
	stm	#yn, ar3
	stm	#xn, ar4
loop:	
	;d1(n)
	ld	*ar4+, 16, A
	ld	d1nm1, T
	mas	b11, A
	mas	b11, A
	ld	d1nm2, T
	masr	b21, A
	sth	A, d1n
	;y1(n)
	mpy	a21, A
	ltd	d1nm1
	mac	a11, A
	ltd	d1n
	mac	a01, A
	;d2(n)
	ld	d2nm1, T
	mas	b12, A
	mas	b12, A
	ld	d2nm2, T
	masr	b22, A
	sth	A, d2n
	;y2(n)
	mpy	a22, A
	ltd	d2nm1
	mac	a12, A
	ltd	d2n
	mac	a02, A
	;d3(n)
	ld	d3nm1, T
	mas	b13, A
	mas	b13, A
	ld	d3nm2, T
	masr	b23, A
	sth	A, d3n
	;y(n)
	mpy	a23, A
	ltd	d3nm1
	mac	a13, A
	ltd	d3n
	mac	a03, A
	
	sth	a, *ar3+
	banz	loop, *ar1-
	.align
	.data
;----------------------------------
;********intermediate value********
d3n	.word	0x0000
d3nm1	.word	0x0000
d3nm2	.word	0x0000

d2n	.word	0x0000
d2nm1	.word	0x0000
d2nm2	.word	0x0000

d1n	.word	0x0000
d1nm1	.word	0x0000
d1nm2	.word	0x0000	
;----------------------------------


;----------------------------------
;***************coefs**************
a01	.word	0x072A
a11	.word	0x851F
a21	.word	0x072B
b11	.word	0x4C0B ;x2
b21	.word	0x32B5

a02	.word	0x198A
a12	.word	0xF02A
a22	.word	0x198A
b12	.word	0x44F9 ;x2
b22	.word	0x4C65

a03	.word	0x3331
a13	.word	0xFCF1
a23	.word	0x3333
b13	.word	0x41A5 ;x2
b23	.word	0x6DF4
;----------------------------------


;----------------------------------
;*************signals**************
xn	.space 512*16
yn	.space 512*16
;----------------------------------