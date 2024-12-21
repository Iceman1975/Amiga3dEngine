scrambled=0

screenw=320 ; must be multiple of 16
screenh=100
screend=4   ; fixed
bplbytes=(screenw/8)*screenh
bplwords=bplbytes/2

;xstart=$81+(320-screenw)/2
;ystart=$2c+(256-screenh)/2 ; first scanline

custom	                EQU   $dff000
DEST	    equ   $100
SRCC	    equ   $200
SRCB	    equ   $400
SRCA	    equ   $800
DMAB_SETCLR    EQU   15
DMAB_AUD0      EQU   0
DMAB_AUD1      EQU   1
DMAB_AUD2      EQU   2
DMAB_AUD3      EQU   3
DMAB_DISK      EQU   4
DMAB_SPRITE    EQU   5
DMAB_BLITTER   EQU   6
DMAB_COPPER    EQU   7
DMAB_RASTER    EQU   8
DMAB_MASTER    EQU   9
DMAB_BLITHOG   EQU   10
DMAB_BLTDONE   EQU   14
DMAB_BLTNZERO  EQU   13

BLITREVERSE equ   $2

waitblit macro
	tst	dmaconr(a6)
.\@:
	btst.b	#DMAB_BLTDONE-8,dmaconr(a6)
	bne.s	.\@
	endm

doblit macro
        rept (\1)>>10
        move.w  #1,bltsize(a6)
        waitblit
        endr
        if (\1)&1023
        move.w  #((\1)&1023)*64+1,bltsize(a6)
        waitblit
        endc
        endm

;
; Performs 2x1 C2P on specially prepared data.
;
; Pixel format is: %aa00bb00cc00dd00 (where a is the most significant bit of the 4 bpl pixel)
;
; The first pass merges two adjacent pixels together. If "scrambled" is non-zero it assumes
; this step has already been performed (perhaps as part of the rendering process).
; Note: Two pixels p1 and p2 (with p1 being leftmost) are combined like this: p1 | p2 >> 2
;

; There's some redundant setup done for some of the blits, and it could likely be done smarter.
; Improving this is left as an exercise for the reader :)


; Input: a0=chunky buffer (format as above), a1=tempbuffer (can be buffer+4*bplbytes if not pre-scrambled)
; Output: buffer converted to planar mode (format as described above)
; Transhes: a2
c2p1x1_4_Blitter:
        move.l	#custom,a6
        ; Common to all passes
        move.l  #-1,bltafwm(a6)

        ifeq scrambled

        ;
        ; First pass (omitted if adjacent pixels have already been combined)
        ;

        move.l  a0,bltapt(a6)
        lea     2(a0),a2
        move.l  a2,bltbpt(a6)
        move.l  a0,bltdpt(a6)
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #SRCA!SRCB!DEST!$FC,bltcon0(a6)
        move.w  #2<<12,bltcon1(a6)
        doblit  (4*bplwords)

        endc ; scrambled
        
        
        ;
        ; Second pass
        ;

        move.l  a0,bltapt(a6)
        lea     2(a0),a2
        move.l  a2,bltbpt(a6)
        move.l  a1,bltdpt(a6)
        move.w  #$f0f0,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #6,bltdmod(a6)
        move.w  #SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #4<<12,bltcon1(a6)
        doblit  bplwords
       

        lea     4(a0),a2
        move.l  a2,bltapt(a6)
        addq.l  #2,a2
        move.l  a2,bltbpt(a6)
        lea     2(a1),a2
        move.l  a2,bltdpt(a6)
        move.w  #$f0f0,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #6,bltdmod(a6)
        move.w  #SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #4<<12,bltcon1(a6)
        doblit  bplwords

       

        move.l  a0,a2
        add.l   #4*bplbytes-8,a2
        move.l  a2,bltapt(a6)
        addq.w  #2,a2
        move.l  a2,bltbpt(a6)
        move.l  a1,a2
        add.l   #4*bplbytes-4,a2
        move.l  a2,bltdpt(a6)
        move.w  #$f0f0,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #6,bltdmod(a6)
        move.w  #4<<12!SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #BLITREVERSE,bltcon1(a6)
        doblit  bplwords

        move.l  a0,a2
        add.l   #4*bplbytes-4,a2
        move.l  a2,bltapt(a6)
        addq.l  #2,a2
        move.l  a2,bltbpt(a6)
        move.l  a1,a2
        add.l   #4*bplbytes-2,a2
        move.l  a2,bltdpt(a6)
        move.w  #$f0f0,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #6,bltdmod(a6)
        move.w  #4<<12!SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #BLITREVERSE,bltcon1(a6)
        doblit  bplwords

         
        ;
        ; Third (and final) pass
        ;

        move.l  a1,bltapt(a6)
        lea     2(a1),a2
        move.l  a2,bltbpt(a6)
        move.l  a0,a2
        add.l   #3*bplbytes,a2
        move.l  a2,bltdpt(a6)
        move.w  #$ff00,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #8<<12,bltcon1(a6)
        doblit  bplwords
 

        lea     4(a1),a2
        move.l  a2,bltapt(a6)
        addq.l  #2,a2
        move.l  a2,bltbpt(a6)
        move.l  a0,a2
        add.l   #2*bplbytes,a2
        move.l  a2,bltdpt(a6)
        move.w  #$ff00,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #8<<12,bltcon1(a6)
        doblit  bplwords

        move.l  a1,a2
        add.l   #4*bplbytes-8,a2
        move.l  a2,bltapt(a6)
        addq.l  #2,a2
        move.l  a2,bltbpt(a6)
        move.l  a0,a2
        add.l   #2*bplbytes-2,a2
        move.l  a2,bltdpt(a6)
        move.w  #$ff00,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #8<<12!SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #BLITREVERSE,bltcon1(a6)
        doblit  bplwords

        
        move.l  a1,a2
        add.l   #4*bplbytes-4,a2
        move.l  a2,bltapt(a6)
        addq.l  #2,a2
        move.l  a2,bltbpt(a6)
        move.l  a0,a2
        add.l   #1*bplbytes-2,a2
        move.l  a2,bltdpt(a6)
        move.w  #$ff00,bltcdat(a6)
        move.w  #6,bltamod(a6)
        move.w  #6,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #8<<12!SRCA!SRCB!DEST!$E4,bltcon0(a6)
        move.w  #BLITREVERSE,bltcon1(a6)
        doblit  bplwords
        rts