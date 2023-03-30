        ORG #6100

; Virtue Da Dirty Soul game mini-intro
; Coded by Bazhenov Alexander (alx/brainwave), 24.01.2003

; This Source Code Form is subject to the terms of the
; BSD 3-Clause License. If a copy of the source(s)
; distributed with this file, You can obtain one at:
; https://github.com/alexanderbazhenoff/virtue-da-dirty-soul-intro


LOGOATR1_ADR    EQU #7600
FONT_ADR        EQU LOGOATR1_ADR+#200
LOGO_ADR        EQU FONT_ADR+#800
TITLESCR_ADR    EQU LOGO_ADR+#800
ATRBUF          EQU #C000
TXTSH_BUF       EQU #C000   ;FIXED!!!
MUS_ADR         EQU #DE00
INT_TABL        EQU #FD00


PAGE_PAUSE      EQU 3*#100-64-5



SIZE_Y  EQU 16
SIZE_X  EQU 16 ;X/2!!!
ATTRADR EQU #5920


 DISPLAY "+- -  -                -    -  - - --+"
 DISPLAY ", mini intro special for virtue game |"
 DISPLAY "| coded by alx^brainwave z4.oi.zoo3! '"
 DISPLAY "+-- - -  -    -                -  - -+"
 DISPLAY

        LD (STEK_RET),SP
        LD HL,SRCMUS
        LD DE,MUS_ADR
        LD BC,ESRCMUS-SRCMUS
        LDIR
        CALL CLS
        INC HL
;       LD HL,#4000
        LD D,'LOGO
        LD BC,#4020
        CALL SCR_CONV

        CALL MUS_ADR
;       DI
        XOR A
        LD (23560),A
IM_2_ON LD HL,INT_TABL
        LD B,L
        LD A,H
        LD I,A
        INC A
IM2_INS LD (HL),A
        INC HL
        DJNZ IM2_INS
        LD (HL),A
        LD H,A
        LD L,A
        LD (HL),#C3
        INC HL
        LD (HL),.INTER
        INC HL
        LD (HL),'INTER
        IM 2
        EI
        CALL CL_TXT

LOOP    LD HL,TEXT1
        CALL PAGE
        LD HL,TEXT11
        CALL PAGE
        LD HL,TEXT2
        CALL PAGE
        LD HL,TEXT3
        CALL PAGE
        LD HL,TEXT4
        CALL PAGE
        JR LOOP
EXIT;   EI
;       CALL CLEAR_TXT
;       DI
        XOR A
        LD (AFL_SW),A
        LD (SW_EXIT),A
        CALL FILL_ATTR
        EI

        LD SP,#3131
STEK_RET EQU $-2
        LD B,8
FAD_DSL PUSH BC
        HALT
        HALT
        LD HL,LOGOATR1_ADR
        LD BC,#200
        CALL FAD_LP
        POP BC
        DJNZ FAD_DSL
        XOR A
        LD (SW_M),A

        CALL CLS

NOFADE0 INC HL
        LD D,'SCREEN
        LD BC,#C020
        CALL SCR_CONV
        EX DE,HL
;       LD HL,SCREEN+#1800              ;?
        LD DE,ATRBUF+#1500
        LD B,3
        PUSH HL
        PUSH BC
        LDIR
        POP BC
        POP HL
        LD DE,ATRBUF
        PUSH DE
        LDIR
        POP HL
        LD B,6
        LD DE,ATRBUF+#1200
SFAD_L  PUSH BC
        PUSH HL
        PUSH HL
        PUSH DE
        CALL FADE_
        POP DE
        POP HL
        LD B,3
        LDIR
        LD A,D
        SUB 6
        LD D,A
        POP HL
        POP BC
        DJNZ SFAD_L

        LD B,7
        LD H,'ATRBUF+3
OUT_L   PUSH BC
        LD D,#58
        LD B,3
        EI
        DUP 2
        HALT
        EDUP
        LDIR
        POP BC
        DJNZ OUT_L

        CALL MUS_ADR+8
        DI
        LD A,#3F
        LD I,A
        IM 1
        LD HL,#2758
        LD IY,#5C3A
        EXX
        EI
        RET


PAGE
        CALL PRINT_LOOP
        CALL OUT_TEXT
SCAN_ENTER
        LD DE,PAGE_PAUSE
SCAN_EL HALT
        LD BC,#BFFE
        IN A,(C)
        RRA
        JR NC,ENTER_PRESSED
        DEC DE
        LD A,D
        OR E
        JR NZ,SCAN_EL
ENTER_PRESSED
CLEAR_TXT
        CALL CL_TXT

;-------clear text routines------------
OUT_TEXT
        XOR A
        LD HL,SW_EXIT
        LD (HL),A
        PUSH HL
        LD HL,TXTSH_BUF+#800
        LD DE,TXTSH_BUF+#91F
        LD BC,#4020
CLEAR_SCR_L
        PUSH BC
        PUSH HL
        PUSH DE
        HALT
CLEAR_SCR_L1
        LD A,(HL)
        RES 7,H
        LD (HL),A
        SET 7,H
        CALL DOWN_HL2
        EX DE,HL
        LD A,(HL)
        RES 7,H
        LD (HL),A
        SET 7,H
        CALL DOWN_HL2
        EX DE,HL
        DJNZ CLEAR_SCR_L1
        POP DE
        POP HL
        POP BC
        DEC E
        INC L
        DEC C
        JR NZ,CLEAR_SCR_L
        POP HL
        LD (HL),H
        RET

CL_TXT
        LD HL,TXTSH_BUF+#800
        LD DE,TXTSH_BUF+#801
        LD BC,#FFF
        LD (HL),L
        LDIR
        RET

;-------int routines-------
INTER   DI
        PUSH AF,BC,DE,HL
        EX AF,AF'
        PUSH AF
        LD A,#3E
SW_M    EQU $-1
        OR A
        JP Z,NO_M
        LD A,#77
HOOY1   EQU $-1
        RRCA
        LD (HOOY1),A
        LD HL,#46E0+#20
        LD (STEK),SP
        LD SP,HL
        LD B,A
        LD C,A
        DUP #10
        PUSH BC
        EDUP
        LD SP,#3131
STEK    EQU $-2

        LD HL,ATR2
ATTR_ADDR EQU $-2
        LD A,H
        XOR 1
        LD H,A
        LD (ATTR_ADDR),HL
        LD DE,#5800
        DUP 256
        LDI
        EDUP
NO_M
        CALL MUS_ADR+5
        LD A,#3E
AFL_SW  EQU $-1
        OR A
        JR Z,NO_FLALL
        LD A,9
        CALL IN_AY_REG
        CP #F
        LD BC,#10D
        JR NZ,NO_FLOGO
        LD BC,#414F
NO_FLOGO
        LD H,#58
        LD DE,COL_DATA1
        LD A,C
        CALL LFLASH
        INC DE
        LD C,B
        CALL LFLASH

ATTR_FLASH
        LD A,9
        CALL IN_AY_REG
        CALL ATTR_FP_AC
        LD A,L
        DUP 3
        ADD A,A
        EDUP
        LD L,A
        LD A,8
        CALL IN_AY_REG
        CP #A
        LD A,4
ATTR_INK EQU $-1
        JR C,NO_FL_INK
        INC A
NO_FL_INK
        OR L
        OR #40
        CALL FILL_ATTR
NO_FLALL

        LD HL,ATTR_INK
        LD A,(HL)
        XOR 1
        LD (HL),A

        LD A,#3E
SW_EXIT EQU $-1
        OR A
        JR Z,NO_EXITK

        LD BC,#7FFE
        IN A,(C)
        RRA
        JP NC,EXIT
NO_EXITK
        POP AF
        EX AF,AF'
        POP HL,DE,BC,AF
        EI
        RET

ATTR_FP_AC
        LD L,7
        CP #F
        RET Z
        DEC L
        DEC L
        CP #E
        RET Z
        LD L,1
        CP #9
        RET Z
        DEC L
        RET

LFLASH  LD A,(DE)
        OR A
        RET Z
        LD L,A
        LD (HL),C
        INC DE
        JR LFLASH

COL_DATA1 DB #23,#24,#28,#29,#2B,#2C,#2D,#30,#31,#32,#35,#36
          DB #3A,#3B,#3C,#3D,#38,0
COL_DATA2 DB #2E,#33,#43,#44,#46,#48,#49,#4E,#52,#53,#55
          DB #56,#58,#5A,#5B,#5C,0

IN_AY_REG
        LD BC,#FFFD
        OUT (C),A
        IN A,(C)
        RET

        ;PRINT_LOOP - несколько символов ;)
        ;HL=text_addr
        ;[#00] - end text
        ;[#0D] - next line
        ;[#10,X,Y] - position

        ;PRINT_CHR - один символ
        ;A=sybol
        ;BC=yx coords

CLS     EI
        HALT
        LD HL,#5800
        PUSH HL
        LD DE,#5801
        LD BC,#02FF
        LD (HL),L
        LDIR
        LD A,C
        POP HL
CLS_L   DEC HL
        LD (HL),A
        CP (HL)
        JR Z,CLS_L
        RET

PRINT_LOOP
        LD A,(HL)
        OR A
        RET Z
        CP #0D
        JR Z,ENTER
        CP #10
        JR Z,NEW_POS
        INC HL
        PUSH HL
        PUSH BC
        PUSH BC
        EX AF,AF'
        RR C
        LD A,B
        AND #18
        OR 'TXTSH_BUF
        LD D,A
        LD A,B
        AND 7
        DUP 3
        RRCA
        EDUP
        ADD A,C
        LD E,A

        EX AF,AF'
        LD H,0
        LD L,A
        DUP 3
        ADD HL,HL
        EDUP
        LD BC,FONT
        ADD HL,BC
        POP BC
        BIT 0,C
        LD A,#0F
        JR NZ,MASK0F
        CPL
MASK0F  LD C,A
        EX DE,HL
        DUP 7
        LD A,(DE)
        AND C
        OR (HL)
        LD (HL),A
        INC DE
        INC H
        EDUP
        LD A,(DE)
        AND C
        OR (HL)
        LD (HL),A
        POP BC
        POP HL

        INC C
        LD A,C
        CP #3F
        JR C,NO_ADD_Y
        LD C,0
        INC B
NO_ADD_Y
        JR PRINT_LOOP

ENTER
        INC HL
        INC B
        LD C,0
        JR PRINT_LOOP

NEW_POS INC HL
        LD C,(HL)
        INC HL
        LD B,(HL)
        INC HL
        JP PRINT_LOOP

;-------fill attributes of defined window---------
        ;A=attr
FILL_ATTR
        LD HL,ATTRADR
        LD BC,#20
        LD D,A
        LD E,A
        LD (STEKFILL),SP
        LD A,SIZE_Y
FILL_L
        LD SP,HL
        DUP SIZE_X
        PUSH DE
        EDUP
        ADD HL,BC
        DEC A
        JR NZ,FILL_L
        LD SP,#3131
STEKFILL EQU $-2
        RET

SCR_CONV
LLOOP   PUSH BC
        PUSH HL
LLOOP1  LD A,(DE)
        LD (HL),A
        INC DE
        CALL DOWN_HL
        DJNZ LLOOP1
        POP HL
        INC HL
        POP BC
        DEC C
        JR NZ,LLOOP
        RET

DOWN_HL2
        CALL DOWN_HL
DOWN_HL INC H
        LD A,H
        AND 7
        RET NZ
        LD A,L
        SUB #E0
        LD L,A
        SBC A,A
        AND #F8
        ADD A,H
        LD H,A
        RET


FADE_   LD BC,#300
FAD_LP  LD D,(HL)
        LD A,D
        AND 1+2+4
        OR A
        JR Z,NODINK
        DEC D
NODINK  LD A,D
        AND 8+16+32
        OR A
        JR Z,NODPAP
        LD A,D
        SUB 8
        LD D,A
NODPAP  LD (HL),D
        INC HL
        DEC BC
        LD A,B
        OR C
        JR NZ,FAD_LP
        RET

ENDCODE DISPLAY "lenght code: ",ENDCODE-#6100

TEXT1
 DB #D,#D,#D,#D,#D,#D,#D,#D,#D
 DB "                  Woohoow, skene! C-jeff of",#D
 DB "               +G+R+E+E+N+ +B+I+T+  +G+R+O+U+P+",#D,#D
 DB "                        bringz for ya:",#D,#D
 DB "                   - virtue da dirty soul -",#D,#D
 DB "                 new kool adventure minigame!",#D,#D
 DB "               press =enter= for read next page",#D
 DB "               press =space= for start loading!",#D,#D
 DB "                  release date:  26 jan 2003",#D,#D
 DB "                spekka skene alive phoreva !!!",0

TEXT11  DB #10,25,9,"Kredits list:",#D,#D
        DB "+-------------------------------------"
        DB "------------------------+",#0D
        DB "idea, game, kode, musik, 'virtue logo'"
        DB ", interface ...c-jeff^gbg"
        DB "main 'enemys' skreen and game grafix b"
        DB "y         ...dimidrol^gbg"
        DB "moral support, some critics ;)        "
        DB "                ...alx^bw"
        DB "pro tracker 3 intro tune              "
        DB "              ...infinite"
        DB "pro tracker 3 game tune               "
        DB "            ...fresh news"
        DB "oldscool mini intro coded, this square"
        DB " font, highpack, total   "
        DB "optimization :) and disk loader       "
        DB "                ...alx^bw"
        DB "this text                             "
        DB "            ...c-jeff^gbg",#D
        DB "+-------------------------------------"
        DB "------------------------+",0

TEXT2   DB #10,15,9,"Greetz goes 2 next Speccy-broozas:",#0D,#0D
        DB "+-------------------------------------"
        DB "------------------------+"
        DB #10,0,13
        DB "Green Bit Group,  Brainwave, Delirium Tremens,"
        DB "  Placebo, Macros"
        DB "Original Computer Association, Techno Lab, "
        DB "Triebkraft, Brothers"
        DB "Fourth Dimension, Anarchia, Invaders, Cyber Punks"
        DB " Unity,  Skrju"
        DB "Triumph,  Horror Soft,  Power Of Sound Web Team, "
        DB "Rain Group Inc"
        DB "Brutal Creators,  X-Team, Sage,  Digital"
        DB " Reality, Sinclair Club"
        DB "Extreme, Karlo Computers Soft,  BrokImSoft, Omega"
        DB " Hackers Group"
        DB "Energy Group,  Studio Stall, Gogin, Smokers Team,"
        DB "  Fenomen, j77"
        DB "Colour Of Magic, Hardwave Crew, Constellation,"
        DB " Optical Brothers"
        DB "Hooy Programm, "
        DB "Stefano, Lord Nikon,  3sc, K3l,  Gas13, "
        DB "Phantasy",#D
        DB "+-------------------------------------"
        DB "------------------------+",0

TEXT3   DB #10,18,9
        DB "Now Green Bit Group are:",#0D,#0D
        DB "+-------------------------------------"
        DB "------------------------+",#D
        DB "Arhon    ...organizza,dezigner e-mail:"
        DB "arholet@mail.ru",#0D
        DB "                               zx-net:"
        DB "5oo:8362/1.9 Oleg Groskow"
        DB "Dimidrol ...main gra-pix maker fido:2:5o52/3o"
        DB ".28",#0D
        DB "                               zx-net:5oo:"
        DB "8362/1.7 Dima Bahtin",#0D
        DB "C-jeff     ...musiq, some kode e-mail:"
        DB "cjflexo@rambler.ru",#0D
        DB "                               zxnet:5oo:"
        DB "8362/1.12 Dima Zhemkov"
        DB "Starling          ...main kode e-mail:"
        DB "nop@rambler.ru",#0D
        DB "Iron Lord    ...gra-pix makker mail to Dimidrol"
        DB #D,#D
        DB "+-------------------------------------"
        DB "------------------------+",0

TEXT4   DB #10,0,8
        INCBIN "starasci.t"
        DB 0

        DISPLAY
ENDTEXT DISPLAY "lenght of text: ",ENDTEXT-ENDCODE
        DISPLAY "end of text: ",ENDTEXT
        DISPLAY /L," (max=#73FF!!!)"
        DISPLAY

        ORG FONT_ADR
FONT    INCBIN "Crazzy.f"

        ORG LOGO_ADR
LOGO    INCBIN "logo"

        ORG TITLESCR_ADR
SCREEN  INCBIN "PICTURE"

SRCMUS  INCBIN "star_mu1"
ESRCMUS

        DISPLAY "+------------------------------------+"
ENDALL  DISPLAY "end object: ",ENDALL
        DISPLAY "total lenght: ",ENDALL-#6100

        ORG LOGOATR1_ADR
ATR1    INCBIN "logoatr1"
ATR2    INCBIN "logoatr2"
        ORG #6100
