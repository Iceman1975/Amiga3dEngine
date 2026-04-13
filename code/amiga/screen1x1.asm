SCREEN_SIZE_X:		equ	320
SCREEN_SIZE_Y:		equ	200
SCREEN_BITPLANES:	equ	4

screen_waitVBlank:
wait:              ; wait until at beam line 0
                              move.l    $dff004,d0                                                                 ; read VPOSR and VHPOSR into d0 as one long word
                              and.l     #$000fff00,d0
                              cmp.l     #$00011000,d0
                              bne.s     wait                                                                       ; if not equal jump to wait
                              rts



screen_init:	
                              lea.l     copper,a1                                                                  ; put copper address into a1
                              move.l    a1,$dff080                                                                 ; COP1LCH (also sets COP1LCL)
                              move.w    $dff088,d0                                                                 ; COPJMP1 
                              move.w    #$81a0,$dff096                                                             ; DMACON set bitplane, copper, sprite
	
                              rts	
	




screen_swap:
                              add.w #1,screen_fps_count
                              add.w #1,screen_fps_count_rest
                              tst.w Screen_change_flag
                              beq.s .noSwap
                              add.w #1,screen_fps_count_change
                              move.w #0,Screen_change_flag
                              move.w #0,screen_fps_count_rest

                              lea.l     Screen_READY,a0
                              lea.l     Screen_SHOW,a5
                              move.l    (a0),d0                                                                    ;RENDER-> d0
                              move.l    (a5),(a0)                                                                  ;SHOW->RENDER
                              move.l    d0,(a5)   

                              lea.l     Screen_SHOW,a0
                              
                              move.l    (a0),d0                                                                    ;RENDER-> d0
                              lea       copper_screen,a0
                              moveq     #3,d7                                                                      ; only 4 bitplanes here
.ss1:
                              move      d0,6(a0) 
                              swap      d0 
                              move      d0,2(a0) 
                              swap      d0 
                              ;add.l     #screenBuffer_width_Byte,d0 
							  add.l		#screenBuffer_bitplanesize,d0
                              addq.l    #8,a0 

                              dbf       d7,.ss1
.noSwap
                              cmp.w #50,screen_fps_count
                              bne.s .done
                              move.w screen_fps_count_change,screen_fps
                              move.w screen_fps_count_rest,screen_fps_rest
                              move.w #0,screen_fps_count
                              move.w #0,screen_fps_count_change
.done
                              rts

screen_swapToNewScreen:
                              lea.l     Screen_RENDER,a0
                              lea.l     Screen_READY,a5
                              move.l    (a0),d0                                                                    ;RENDER-> d0
                              move.l    (a5),(a0)                                                                  ;SHOW->RENDER
                              move.l    d0,(a5)   

                              move.w  #1,Screen_change_flag
                              rts

screen_clear:
	move.l	Screen_RENDER,a0
	lea	(SCREEN_SIZE_X/8)*(SCREEN_SIZE_Y*SCREEN_BITPLANES)(a0),a0
	moveq	#124,d7
	moveq	#0,d0
	moveq	#0,d1
	moveq	#0,d2
	moveq	#0,d3
	moveq	#0,d4
	moveq	#0,d5
	moveq	#0,d6
	sub.l	a1,a1
	
.loop:
	rept	8
	movem.l	d0-d6/a1,-(a0)
	endr
	dbf	d7,.loop
	rts	

screen_clear2
		move.l Screen_RENDER,a1
		move.w #GAME_SCREEN_HEIGHT-1,d0
	
  	moveq	#0,d1
    moveq	#0,d2
    moveq	#0,d3
    moveq	#0,d4
    moveq	#0,d5
    moveq	#0,d6
    moveq	#0,d7
    sub.l	a2,a2
    sub.l	a3,a3
    sub.l	a4,a4
    sub.l	a5,a5
    sub.l	a6,a6

.s_line:

		;movem.l (a0)+,d1-d7/a2-a6
		movem.l d1-d7/a2-a6,(a1)
		lea 48(A1),A1
		;movem.l (a0)+,d1-d7/a2-a6
		movem.l	d1-d7/a2-a6,(a1)
		lea 48(a1),a1
		;movem.l (a0)+,d1-d7/a2-a6
		movem.l d1-d7/a2-a6,(a1)
		lea 48(a1),a1
		;movem.l (a0)+,d1-d4
		movem.l d1-d4,(a1)
		lea 16(a1),a1

		dbra d0,.s_line
		rts

screen_buffer
		move.l buffer,a1
		move.w #GAME_SCREEN_HEIGHT-1,d0
	
  	moveq	#0,d1
    moveq	#0,d2
    moveq	#0,d3
    moveq	#0,d4
    moveq	#0,d5
    moveq	#0,d6
    moveq	#0,d7
    sub.l	a2,a2
    sub.l	a3,a3
    sub.l	a4,a4
    sub.l	a5,a5
    sub.l	a6,a6

.s_line:

		;movem.l (a0)+,d1-d7/a2-a6
		movem.l d1-d7/a2-a4,(a1)
		lea 40(A1),A1
		;movem.l (a0)+,d1-d7/a2-a6
		movem.l	d1-d7/a2-a4,(a1)
		lea 40(a1),a1
		;movem.l (a0)+,d1-d7/a2-a6
		movem.l d1-d7/a2-a4,(a1)
		lea 40(a1),a1
		;movem.l (a0)+,d1-d4
		movem.l d1-d7/a2-a4,(a1)
		lea 40(a1),a1

		dbra d0,.s_line
		rts

;a0 pointer to colors
screen_setColors
                              lea       copper_colors,a1
							  move.l 	currentLevel,a0
							  move.l   10(a0),a0
							  ;lea		map_colors,a0
                              moveq     #15,d0
sr_col_loop                   move.l    (a0)+,(a1)+
                              dbf       d0,sr_col_loop
                              rts

screen_setGradient:
  rts ;TODO

	move.l currentLevel,a0
	move.l 14(a0),a0
	beq.s .done 	;no gradient? -> done
	move.w (a0)+,d6
	
	lea copper_colorGradient,a1
	adda.l #10,a1
.loop:
	move.w (a0)+,(a1)
	adda.l #28,a1
	dbf.w d6,.loop
.done:
	rts



screen_buffer2screen
  ; d0.w	chunkyx [chunky-pixels]
; d1.w	chunkyy [chunky-pixels]
; d2.w	offsx [screen-pixels]
; d3.w	offsy [screen-pixels]
; a0	chunkyscreen
; a1	BitMap

  move.w #160,d0
  move.w #100,d1
  move.w #64,d2
  move.w #28,d3
  move.l buffer,a0
  move.l Screen_RENDER,a1

  bsr _c2p1x1_4_c5_bm_word;_c2p1x1_4_c5_bm  
  rts
							  
sprites_init:
  lea.l      blanksprite,a1                                                                                                               ; put blanksprite address into a1
  lea.l      sp0,a2                                                                                                                       ; put copper address into a2
  add.l      #10,a2                                                                                                                       ; add 10 to copper address in a2
  move.l     a1,d1                                                                                                                        ; move blanksprite address into d1
  moveq      #6,d0                                                                                                                        ; setup sprite counter

s1_sprcoploop:            ; set all 7 sprite pointers
  swap       d1                                                                                                                           ; high and low to point to blanksprite 
  move.w     d1,(a2)
  addq.l     #4,a2
  swap       d1
  move.w     d1,(a2)
  addq.l     #4,a2
  dbra       d0,s1_sprcoploop                                                                                                             ; loop trough all 7 sprite pointers

                                                                                                      ; transfer sprite address low to copper
  rts
  

	
screen_mem1:			;Reserve screen memory 
                include "./data/background/bg1x1_UU.asm"
                           ; ds.b      screenBuffer_size

screen_mem2:			;Reserve screen memory 
  include "./data/background/bg1x1_UU.asm"
                            ;ds.b      screenBuffer_size

screen_mem3:			;Reserve screen memory 
 include "./data/background/bg1x1_UU.asm"
							;ds.b      screenBuffer_size
    
Screen_SHOW:                  dc.l      screen_mem1
Screen_RENDER:                dc.l      screen_mem2			

Screen_READY                  dc.l      screen_mem3	
		
bufferBefore			ds.b (160/8)*(100)
bufferMem				ds.b      screenBuffer_size
bufferAfter				ds.b (160/8)*(100)

buffer 					dc.l bufferMem


;bufferMask ds.b (256/8)*(48*4)

Screen_change_flag   dc.w 0

screen_fps              dc.w 0
screen_fps_rest         dc.w 0
screen_fps_count        dc.w 0
screen_fps_count_change dc.w 0
screen_fps_count_rest dc.w 0

copper:

copper_screen:
                              dc.w      BPL1PTH,0
                              dc.w      BPL1PTL,0
                              dc.w      BPL2PTH,0
                              dc.w      BPL2PTL,0
                              dc.w      BPL3PTH,0
                              dc.w      BPL3PTL,0
                              dc.w      BPL4PTH,0
                              dc.w      BPL4PTL,0

	
copper_scroll:
                              dc.w      BPLCON1, $0000

                              dc.w      BPLCON0,$4200
							  dc.w      BPLCON2,$0000
                              dc.w      BPL1MOD,-2
                              dc.w      BPL2MOD,-2

copper_sprites:
sp0:	
             dc.w       $0120,$0000                                                                                                                                      ; SPR0PTH
             dc.w       $0122,$0000                                                                                                                                      ; SPR0PTL
sp1:
             dc.w       $0124,$0000                                                                                                                                      ; SPR1PTH
             dc.w       $0126,$0000                                                                                                                                      ; SPR1PTL
sp2:	
             dc.w       $0128,$0000                                                                                                                                      ; SPR2PTH
             dc.w       $012a,$0000                                                                                                                                      ; SPR2PTL
sp3:	
             dc.w       $012c,$0000                                                                                                                                      ; SPR3PTH
             dc.w       $012e,$0000                                                                                                                                      ; SPR3PTL
sp4:	
             dc.w       $0130,$0000                                                                                                                                      ; SPR4PTH
             dc.w       $0132,$0000                                                                                                                                      ; SPR4PTL
sp5:
             dc.w       $0134,$0000                                                                                                                                      ; SPR5PTH
             dc.w       $0136,$0000                                                                                                                                      ; SPR5PTL
             dc.w       $0138,$0000                                                                                                                                      ; SPR6PTH
             dc.w       $013a,$0000                                                                                                                                      ; SPR6PTL
             dc.w       $013c,$0000                                                                                                                                      ; SPR7PTH
             dc.w       $013e,$0000  

copper_colors:

							  
							  


;wall
	dc.w  COLOR00, $0222
	dc.w  COLOR01, $0444
	dc.w  COLOR02, $0620
	dc.w  COLOR03, $0260
	dc.w  COLOR04, $0666
	dc.w  COLOR05, $0940
	dc.w  COLOR06, $0999
	dc.w  COLOR07, $0692
	dc.w  COLOR08, $0b60
	dc.w  COLOR09, $0bbb
	dc.w  COLOR10, $0ddd
	dc.w  COLOR11, $0d90
	dc.w  COLOR12, $0b74
	dc.w  COLOR13, $0452
	dc.w  COLOR14, $0d40
	dc.w  COLOR15, $0a00


; sprite colors:
	dc.w  COLOR16, $0323
	dc.w  COLOR17, $0222
	dc.w  COLOR18, $0311
	dc.w  COLOR19, $0b54
	dc.w  COLOR20, $0f65
	dc.w  COLOR21, $0f63
	dc.w  COLOR22, $0501
	dc.w  COLOR23, $0f52
	dc.w  COLOR24, $0f53
	dc.w  COLOR25, $0911
	dc.w  COLOR26, $0711
	dc.w  COLOR27, $0d31
	dc.w  COLOR28, $0622
	dc.w  COLOR29, $0b32
	dc.w  COLOR30, $0b10
	dc.w  COLOR31, $0d11	

copper_colorGradient:

copperSlot:
                              dc.w      $ffdf,$fffe                                                                ; wait($df,$ff) enables waits > $ff vertical
                              dc.w      $2c01,$fffe                                                                ; wait($01,$12c) - $2c is $12c
                              dc.w      BPLCON0,$0200                                                              ; BPLCON0 unset bitplanes, enable color burst; needed to support older PAL chips						
                              dc.w      $ffff,$fffe                                                                ; end of copper
                              



	include    "./code/c2p/c2p1x1_4_c5_bm.asm"