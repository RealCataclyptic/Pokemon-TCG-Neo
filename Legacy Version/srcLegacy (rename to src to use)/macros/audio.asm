C_ EQU $1
C# EQU $2
D_ EQU $3
D# EQU $4
E_ EQU $5
F_ EQU $6
F# EQU $7
G_ EQU $8
G# EQU $9
A_ EQU $a
A# EQU $b
B_ EQU $c

MACRO note
	dn (\1), (\2) - 1 ; pitch, length
ENDM

MACRO bass
	dn $1, (\1) - 1
ENDM

MACRO snare1 ; medium length
	dn $3, (\1) - 1
ENDM

MACRO snare2 ; medium length
	dn $5, (\1) - 1
ENDM

MACRO snare3 ; short
	dn $7, (\1) - 1
ENDM

MACRO snare4 ; long
	dn $9, (\1) - 1
ENDM

MACRO snare5 ; long
	dn $c, (\1) - 1
ENDM

MACRO rest
	db \1 - 1
ENDM

MACRO speed
	db $d0, \1
ENDM

MACRO octave
	db ($d << 4) | \1
ENDM

MACRO inc_octave
	db $d7
ENDM

MACRO dec_octave
	db $d8
ENDM

MACRO tie
	db $d9
ENDM

MACRO stereo_panning
	db $dc, (\1 << 4) | \2
ENDM

MACRO MainLoop
	db $dd
ENDM

MACRO EndMainLoop
	db $de
ENDM

MACRO Loop
	db $df, \1
ENDM

MACRO EndLoop
	db $e0
ENDM

; unused
;MACRO music_jp
;	db $e1
;	dw \1
;ENDM

MACRO music_call
	db $e2
	dw \1
ENDM

MACRO music_ret
	db $e3
ENDM

MACRO frequency_offset
	db $e4, \1
ENDM

MACRO duty
	db $e5, \1 << 6
ENDM

MACRO volume_envelope
	db $e6
	IF \2 < 0
		dn \1, %1000 | (\2 * -1)
	ELSE
		dn \1, \2
	ENDC
ENDM

MACRO wave
	db $e7, \1
ENDM

MACRO cutoff
	db $e8, \1
ENDM

MACRO echo
	db $e9, \1
ENDM

MACRO vibrato_type
	db $ea, \1
ENDM

MACRO vibrato_delay
	db $eb, \1
ENDM

; unused
;MACRO pitch_offset
;	db $ec, \1
;ENDM

; unused
;MACRO adjust_pitch_offset
;	db $ed, \1
;ENDM

MACRO music_end
	db $ff
ENDM

MACRO sfx_0
	db \1, \2
ENDM

MACRO sfx_1
	db $10, \1
ENDM

MACRO sfx_2
	db $20 | \1
ENDM

MACRO sfx_loop
	db $30, \1
ENDM

MACRO sfx_endloop
	db $40
ENDM

MACRO sfx_5
	db $50, \1
ENDM

MACRO sfx_6
	db $60, \1
ENDM

MACRO sfx_8
	db $80, \1
ENDM

MACRO sfx_end
	db $f0
ENDM
