.org $8000

PPUCTRL               = $2000
PPUMASK               = $2001
PPUSTATUS             = $2002
OAMADDR               = $2003
OAMDATA               = $2004
PPUSCROLL             = $2005
PPUADDR               = $2006
PPUDATA               = $2007

Procedure     = $7FF
ProcedureAddr = $7FD

BOOT:
    sei
    cld
    ldx #$FF
    txs
    bit PPUSTATUS
:   bit PPUSTATUS
    bpl :-
:   bit PPUSTATUS
    bpl :-
    lda #0
    sta Procedure
    lda #%00001000
    sta PPUMASK
    lda #%10000000
    sta PPUCTRL
:   jmp :-


NMIProcedures:
    .addr Setup
    .addr DoNothing

NMI:
    ldx #$FF
    txs
    lda Procedure
    asl a
    tax
    jsr StartProcedure
:   jmp :-

StartProcedure:
    lda NMIProcedures, x
    sta ProcedureAddr
    lda NMIProcedures+1, x
    sta ProcedureAddr+1
    jmp (ProcedureAddr)

.macro WriteBinaryToPPU PPU, Start, Len
    lda #>PPU
    sta PPUADDR
    lda #<PPU
    sta PPUADDR
    ldx #0
:
    lda Start,x
    sta PPUDATA
    inx
    cpx #Len
    bne :-
.endmacro

Setup:
    lda #%00000000
    sta PPUCTRL
    lda #1
    sta Procedure
    WriteBinaryToPPU $3F00, MenuPalette, MenuPaletteEnd - MenuPalette
    WriteBinaryToPPU $2041, TextHello, TextHelloEnd - TextHello
    lda #0
    sta PPUSCROLL
    sta PPUSCROLL
    lda #%10000000
    sta PPUCTRL
    rts

DoNothing:
    rts

MenuPalette:
.byte $0F, $30, $10, $00
.byte $0F, $30, $10, $00
.byte $0F, $30, $10, $00
.byte $0F, $30, $10, $00
MenuPaletteEnd:

TextHello:
.byte "HELLO WORLD"
TextHelloEnd:

.res $FFFA - *, $00
.word NMI
.word BOOT
.word $fff0