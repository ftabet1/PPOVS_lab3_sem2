	.def _c_int00
	.text
_c_int00:
	ld	#d3n, dp
	ssbx	frct
	rsbx	ovm
	orm	#1, pmst
	stm	#d3n, ar2
	rptz	A, #8
	stl	A, *ar2+
	
	
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