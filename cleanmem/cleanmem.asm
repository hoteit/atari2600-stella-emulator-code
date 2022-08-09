    PROCESSOR 6502

    SEG CODE           
    ORG $F000       ; define the code origin at $F0000

Start:
    SEI             ; disable interrupts
    CLD             ; disable the BCD decimal math mode
    LDX #$FF        ; loads the X register with #$FF
    TXS             ; transfer the X register to the Stack pointer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear the Page Zero region ($00 to $FF)
; Meaning the entire RAM and al the entire TIA registers
; Note in Page Zero RAM and al the entire TIA registers  $00 to $80 are the TIA registers.
; $80 to $FF is the RAM
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    LDA #0          ; A = 0
    LDX #$FF        ; X = #$FF
    STA $FF         ; make sure $FF is zeroed before the loop start
MemLoop:
    DEX             ; X --
    STA $0,X        ; store the value of A inside memory address $0 + X
    BNE MemLoop     ; Loop until X is equal to zero (z-flag is set) branch if the last execution is not equal to zero.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fill the ROM size to exactly 4KB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ORG $FFFC       ; jump to the button of the catridge
    .WORD Start     ; Reset vector at $FFFC (where the program starts)  (2 bytes)
    .WORD Start     ; Interrupt vector at $FFFE (unused in the VCS) (2 bytes)