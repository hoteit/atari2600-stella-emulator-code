    PROCESSOR 6502

    INCLUDE "vcs.h" 
    INCLUDE "macro.h"

    SEG code
    org $F000      ; defines the orign of the ROM at $F0000

START:
    CLEAN_START     ; Macro to safely clean the memory

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; set background luminosity color to yellow
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    LDA 