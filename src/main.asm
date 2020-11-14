; convert ascii
; space
.charmap    $20,   $34
; !
.charmap    $21,   $3B
; -
.charmap    $2D,   $38
; x to cross
.charmap    $78,   $39
; .
.charmap    $2E,   $BF

; 0
.charmap $30+00,   $10
; 1
.charmap $30+01,   $11
; 2
.charmap $30+02,   $12
; 3
.charmap $30+03,   $13
; 4
.charmap $30+04,   $14
; 5
.charmap $30+05,   $15
; 6
.charmap $30+06,   $16
; 7
.charmap $30+07,   $17
; 8
.charmap $30+08,   $18
; 9
.charmap $30+09,   $19

; A
.charmap $41+00, $1A+00
; B
.charmap $41+01, $1A+01
; C
.charmap $41+02, $1A+02
; D
.charmap $41+03, $1A+03
; E
.charmap $41+04, $1A+04
; F
.charmap $41+05, $1A+05
; G
.charmap $41+06, $1A+06
; H
.charmap $41+07, $1A+07
; I
.charmap $41+08, $1A+08
; J
.charmap $41+09, $1A+09
; K
.charmap $41+10, $1A+10
; L
.charmap $41+11, $1A+11
; M
.charmap $41+12, $1A+12
; N
.charmap $41+13, $1A+13
; O
.charmap $41+14, $1A+14
; P
.charmap $41+15, $1A+15
; Q
.charmap $41+16, $1A+16
; R
.charmap $41+17, $1A+17
; S
.charmap $41+18, $1A+18
; T
.charmap $41+19, $1A+19
; U
.charmap $41+20, $1A+20
; V
.charmap $41+21, $1A+21
; W
.charmap $41+22, $1A+22
; X
.charmap $41+23, $1A+23
; Y
.charmap $41+24, $1A+24
; Z
.charmap $41+25, $1A+25

; allow line continuation feature
.linecont +

.segment "INES"
.byte $4E,$45,$53,$1A
.byte 2 ; prg
.byte 1 ; chr
.byte %00000001 ; flags 6

.segment "PRG"
.include "prg.asm"

.segment "CHR"
.incbin "../charset.chr"
