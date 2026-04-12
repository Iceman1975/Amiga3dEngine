BLITTER_NASTY = 1

DEST	    equ   $100
SRCC	    equ   $200
SRCB	    equ   $400
SRCA	    equ   $800

ABC	    equ   $80
ABNC	    equ   $40
ANBC	    equ   $20
ANBNC	    equ   $10
NABC	    equ   $8
NABNC	    equ   $4
NANBC	    equ   $2
NANBNC	    equ   $1

BLITREVERSE equ   $2
DMAB_BLTDONE   EQU   14

_screenw=160 ; must be multiple of 16
_screenh=100
_screend=4   ; fixed
chunkyBufferSize=_screenw*_screenh


_screen_width=320
_screen_height=256
_screen_bitplane_size=_screen_width/8*_screen_height


waitblit macro
	tst	dmaconr(a6)
.\@:
	btst.b	#DMAB_BLTDONE-8,dmaconr(a6)
	bne.s	.\@
	endm

; a0 buffer
c2p2x1_4_Blitter_stretchedByte:
		ifd BLITTER_NASTY
			move.w  #$8400,$DFF096  
		endif 
		lea $dff000,a6
        move.l  #-1,bltafwm(a6)
		move.l buffer,a0

		
		
.pass:									;res0
		move.l buffer,a0
		sub.l #8,a0
		lea res0,a1
		
	
        move.l  a0,bltapt(a6)	;A buffer 
		adda.l #2,a0
        move.l  a0,bltbpt(a6)	; B buffer
		
        move.l  a1,bltdpt(a6)	; res0 res0
		move.w  #$F0F0,bltcdat(a6)
		
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		
		move.w  #4<<12,bltcon1(a6)
		waitblit
 		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)			; 2 CPU lines
		waitblit
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)			; 2 CPU lines
		waitblit
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)			; 2 CPU lines
		waitblit
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)			; 2 CPU lines
		waitblit 	
		
		
		
		
.merge4_4:
		;**********
		;bitmap3
		;**********		
		
		lea    res0,a0
		lea    res1,a1
		adda.l #80*100-2,a0
		adda.l #80*100-2,a1
        move.l  a0,bltapt(a6)	;res0 
        move.l  a0,bltbpt(a6)	; res0		
        move.l  a1,bltdpt(a6)	; res1
		move.w  #$CCCC,bltcdat(a6)
		
        move.w  #0,bltamod(a6)
        move.w  #0,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		;move.w #ANBNC!ANBC!ABNC!ABC!DEST!SRCC!SRCB!SRCA,bltcon0(a6) 	;only A

		move.w  #6<<12!BLITREVERSE,bltcon1(a6)
		waitblit

		move.w  #(100*64)+(((80*8))/16),bltsize(a6)		; 9 CPU lines
		waitblit
		
		

		lea    res1,a0
		move.l Screen_RENDER,a1
		adda.l #3*screen_bitplanesizeGame,a1
        move.l  a0,bltapt(a6)	;A res1 
		adda.l #2,a0
        move.l  a0,bltbpt(a6)	; B res1
		
        move.l  a1,bltdpt(a6)	; bitmap3
		move.w  #$FF00,bltcdat(a6)
		
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		
		move.w  #8<<12,bltcon1(a6)
		waitblit
 		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		; 1 CPU lines
		waitblit		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		; 1 CPU lines
		waitblit

		
		
		;**********
		;bitmap2
		;**********		
		
		lea    res0,a0
		lea    res1,a1
		adda.l #80*100-2,a0
		adda.l #80*100-2,a1
        move.l  a0,bltapt(a6)	;res0 
        move.l  a0,bltbpt(a6)	; res0		
        move.l  a1,bltdpt(a6)	; res1
		move.w  #$CCCC,bltcdat(a6)
		
        move.w  #0,bltamod(a6)
        move.w  #0,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #2<<12!NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		;move.w #ANBNC!ANBC!ABNC!ABC!DEST!SRCC!SRCB!SRCA,bltcon0(a6) 	;only A

		move.w  #8<<12!BLITREVERSE,bltcon1(a6)
		waitblit

		move.w  #(100*64)+(((80*8))/16),bltsize(a6)		; 9 CPU lines
		waitblit
		
		

		lea    res1,a0
		move.l Screen_RENDER,a1
		adda.l #2*screen_bitplanesizeGame,a1
        move.l  a0,bltapt(a6)	;A res1 
		adda.l #2,a0
        move.l  a0,bltbpt(a6)	; B res1
		
        move.l  a1,bltdpt(a6)	; bitmap3
		move.w  #$FF00,bltcdat(a6)
		
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		
		move.w  #8<<12,bltcon1(a6)
		waitblit
 		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		; 1 CPU lines
		waitblit		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		; 1 CPU lines
		waitblit
		

	
		
			
.merge4_4_part2:

.pass2:									;res0
				
		move.l buffer,a0
		sub.l #8,a0
		lea res0,a1
		adda.l #160*100-4,a0
		adda.l #80*100-2,a1
	
		
        move.l  a0,bltapt(a6)	;A buffer 
		adda.l #2,a0
        move.l  a0,bltbpt(a6)	; B buffer
		
        move.l  a1,bltdpt(a6)	; res0 res0
		move.w  #$F0F0,bltcdat(a6)
		
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        ;move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCA,bltcon0(a6)
        move.w  #4<<12!NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		
		move.w  #BLITREVERSE,bltcon1(a6)
		;move.w  #0,bltcon1(a6)
		waitblit
 		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit
		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit 	
		
		
		
		;**********
		;bitmap1
		;**********		
		
		lea    res0,a0
		lea    res1,a1
		adda.l #80*100-2,a0
		adda.l #80*100-2,a1
        move.l  a0,bltapt(a6)	;res0 
        move.l  a0,bltbpt(a6)	; res0		
        move.l  a1,bltdpt(a6)	; res1
		move.w  #$CCCC,bltcdat(a6)
		
        move.w  #0,bltamod(a6)
        move.w  #0,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		;move.w #ANBNC!ANBC!ABNC!ABC!DEST!SRCC!SRCB!SRCA,bltcon0(a6) 	;only A

		move.w  #6<<12!BLITREVERSE,bltcon1(a6)
		waitblit

		move.w  #(100*64)+(((80*8))/16),bltsize(a6)		
		waitblit
		
		

		lea    res1,a0
		move.l Screen_RENDER,a1
		adda.l #1*screen_bitplanesizeGame,a1
        move.l  a0,bltapt(a6)	;A res1 
		adda.l #2,a0
        move.l  a0,bltbpt(a6)	; B res1
		
        move.l  a1,bltdpt(a6)	; bitmap1
		move.w  #$FF00,bltcdat(a6)
		
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		
		move.w  #8<<12,bltcon1(a6)
		waitblit
 		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit
		
		
		;**********
		;bitmap0
		;**********		
		
		lea    res0,a0
		lea    res1,a1
		adda.l #80*100-2,a0
		adda.l #80*100-2,a1
        move.l  a0,bltapt(a6)	;res0 
        move.l  a0,bltbpt(a6)	; res0		
        move.l  a1,bltdpt(a6)	; res1
		move.w  #$CCCC,bltcdat(a6)
		
        move.w  #0,bltamod(a6)
        move.w  #0,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #2<<12!NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		;move.w #ANBNC!ANBC!ABNC!ABC!DEST!SRCC!SRCB!SRCA,bltcon0(a6) 	;only A

		move.w  #8<<12!BLITREVERSE,bltcon1(a6)
		waitblit

		move.w  #(100*64)+(((80*8))/16),bltsize(a6)		
		waitblit
		
		

		lea    res1,a0
		move.l Screen_RENDER,a1
		;adda.l #screen_bitplane_size,a1
        move.l  a0,bltapt(a6)	;A res1 
		adda.l #2,a0
        move.l  a0,bltbpt(a6)	; B res1
		
        move.l  a1,bltdpt(a6)	; bitmap3
		move.w  #$FF00,bltcdat(a6)
		
        move.w  #2,bltamod(a6)
        move.w  #2,bltbmod(a6)
        move.w  #0,bltdmod(a6)
        move.w  #NABNC!ANBC!ABNC!ABC!DEST!SRCB!SRCA,bltcon0(a6)
		
		move.w  #8<<12,bltcon1(a6)
		waitblit
 		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit		
		move.w  #(20*50*64)+(((16))/16),bltsize(a6)		
		waitblit

		rts
		
		
		
		
		
	
res0 ds.b chunkyBufferSize/2

res1 ds.b chunkyBufferSize/2


