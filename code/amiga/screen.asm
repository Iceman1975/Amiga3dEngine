

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
							  bsr screen_initFooter
							  bsr screen_setGradient
                              rts	
	

screen_initFooter:
                              lea.l     footer-2,a0
                              
                              move.l    a0,d0                                                                    ;RENDER-> d0
                              lea       copper_footer,a0
                              moveq     #3,d7                                                                      ; only 4 bitplanes here
.ss1:
                              move      d0,6(a0) 
                              swap      d0 
                              move      d0,2(a0) 
                              swap      d0 
                              add.l     #screenBuffer_width_Byte,d0 
                              addq.l    #8,a0 

                              dbf       d7,.ss1
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
							  ifnd BLITTER_C2P
                              	add.l     #screenBuffer_width_Byte,d0 
							  else
							  	add.l     #screen_bitplanesizeGame,d0
							  endif
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
	lea	(screen_width/8)*(screen_height*screen_colorDepth)(a0),a0
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


screen_buffer2screen
  ; d0.w	chunkyx [chunky-pixels]
; d1.w	chunkyy [chunky-pixels]
; d2.w	offsx [screen-pixels]
; d3.w	offsy [screen-pixels]
; a0	chunkyscreen
; a1	BitMap

  move.w #160,d0
  move.w #100,d1
  move.w #16,d2
  move.w #0,d3
  move.l buffer,a0
  move.l Screen_RENDER,a1

  ;bsr _c2p2x1_4_c5_bm
  ;bsr c2p2x1_4_CPU_stretchedByte  
  ifnd BLITTER_C2P
  bsr _c2p2x1_4_c5_bm
  else
  bsr c2p2x1_4_Blitter_stretchedByte  
  endif
 
  rts
							  
sprites_init:
  lea.l      sprites,a1                                                                                                               ; put blanksprite address into a1
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
  rts

screen_updateSprites: 
  move.l sprites_pointer,a0
  move.l (a0),a0	
  lea sp0,a1
  moveq      #7,d1 	
.loop:
  move.l a0,d0
  move.w d0,6(a1)
  swap d0
  move.w d0,2(a1)

  ;lea w0p0_s1,a0
  adda.l #64*4,a0
  adda.l #8,a1
  dbra d1,.loop

  bsr screen_setSpriteColors  

  lea sprites_pointer,a0
  add.l #4,(a0)
  move.l (a0),a0

  cmp.l #-1,(a0)
  bne.s .done
  lea  sprites,a0
  move.l a0,sprites_pointer	
.done:
  rts

  
;a0 pointer to colors
screen_setSpriteColors
                              lea       copper_sprite_colors,a1
							  ;move.l 	currentLevel,a0
							  ;move.l   10(a0),a0
							  ;lea.l   weapon0_color,a0
							  ;lea		map_colors,a0
                              moveq     #15,d0
.sr_col_loop                   move.l    (a0)+,(a1)+
                              dbf       d0,.sr_col_loop
                              rts

screen_drawFPS:
                              lea        screen_fps,a4
							  moveq #0,d0
							  move.w (a4),d0
							  divs #10,d0
							  swap d0


                              lea.l      smallFont,a3
                              
		;last
                              move.l     8(a3),a0
                              move.l     8(a3),a1
		
                              
                              and.l      #$f,d0

                              move.w     4(a3),d1
                              lsl.w      d1,d0

                              adda.l     d0,a0                                                                      ; pointer to mask
                              add.w      16(a3),d0
                              adda.l     d0,a1

                              move.l     #16,d0	; x pos
                              move.l     #7,d1 ; y pos
                              move.w     12(a3),d5
                              move.w     14(a3),d7   
                              move.w     6(a3),d6                                

    ; d0,d1 x,y
    ; d5 blitsize
    ; d6 height
    ; d7 modulo
                              move.w     #36,d7 
                              bsr        screen_copyBitmapToFooter

                              lea        screen_fps,a4
 							  moveq #0,d0
							  move.w (a4),d0
							  divs #10,d0


                              lea.l      smallFont,a3
                              
		;last
                              move.l     8(a3),a0
                              move.l     8(a3),a1
		
                              ;lsr        #4,d0
                              and.l      #$f,d0

                              move.w     4(a3),d1
                              lsl.w      d1,d0

                              adda.l     d0,a0                                                                      ; pointer to mask
                              add.w      16(a3),d0
                              adda.l     d0,a1

                              move.l     #8,d0	; x pos
                              move.l     #7,d1 ; y pos
                              move.w     12(a3),d5
                              move.w     14(a3),d7   
                              move.w     6(a3),d6                                

    ; d0,d1 x,y
    ; d5 blitsize
    ; d6 height
    ; d7 modulo
                              move.w     #36,d7 
                              bsr        screen_copyBitmapToFooter		
                              rts


screen_setGradient:
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

	  ; a0 pointer to bitmap
		; a1 pointer to bitmap mask
    ; a6 footer repair
		; d0,d1 x,y
    ; d5 blitsize
    ; d6 height
    ; d7 modulo

screen_copyBitmapToFooter:
                                      	
.bitmap_draw_init_blitter
                              btst       #14,$dff002
                              bne.s      .bitmap_draw_init_blitter
	
                              move       #-2,$dff064                                                                ;A Modulo
                              move       #-2,$dff062                                                                ;B Modulo

                              clr        $dff042
                              move.l     #$ffff0000,$dff044

                              lea.l      footer,a2  
							  mulu       #screenBuffer_lineSize,d1	
                              add.l      d1,a2                                                                      ; add to address
                              move.l     d0,d1 
                              lsr        #3,d0 
                              add.l      d0,a2                                                                      ; add x offset
 
                              ror        #4,d1 
                              and        #$f000,d1 
	
.bitmap_waitblit_1
                              btst       #14,$dff002
                              bne.s      .bitmap_waitblit_1


                              move       d7,$dff060                                                                 ;C Address TODO BULLET_WIDTH_BLITTER was replaced by static 32 and 16 for the blitter
                              move       d7,$dff066                                                                 ;D Address
                              move       d1,$dff042 
                              or         #%0000111111001010,d1 
                              move       d1,$dff040 

.bitmap_waitblit_2
                              btst       #14,$dff002
                              bne.s      .bitmap_waitblit_2
	
                              move.l     a1,$dff050                                                                 ;A=Maske
                              move.l     a0,$dff04c                                                                 ;B=Source
                              move.l     a2,$dff048                                                                 ;C=Dest read
                              move.l     a2,$dff054                                                                 ;D=Dest write
                    ;blisize (bitplanes*height*64)+((width_in_pixel+16)/16)
                    ;move      #((3*25*64)+((32+16)/16)),$dff058
                              move       d5,$dff058

                              rts
;********** done **********************
                            


	
screen_mem1:			;Reserve screen memory 
                            ds.b      screen_size

screen_mem2:			;Reserve screen memory 
                            ds.b      screen_size

screen_mem3:			;Reserve screen memory 
							ds.b      screen_size
    
Screen_SHOW:                  dc.l      screen_mem1
Screen_RENDER:                dc.l      screen_mem2			

Screen_READY                  dc.l      screen_mem3	



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
							  ;dc.w      BPLCON2,$0000
                              dc.w      BPL1MOD,screenBuffer_modulo
                              dc.w      BPL2MOD,screenBuffer_modulo

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
             dc.w       $0136,$0000    
sp6:                                                                                                                                  ; SPR5PTL
             dc.w       $0138,$0000                                                                                                                                      ; SPR6PTH
             dc.w       $013a,$0000                                                                                                                                      ; SPR6PTL
sp7:
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

copper_sprite_colors:
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

;double size
copper_colorGradient:

	dc.w $3001,$fffe
	dc.w  $303f,$fffe, COLOR00,$0000, $30df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3101,$fffe
	dc.w  $313f,$fffe, COLOR00,$0000, $31df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3201,$fffe
	dc.w  $323f,$fffe, COLOR00,$0000, $32df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3301,$fffe
	dc.w  $333f,$fffe, COLOR00,$0000, $33df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3401,$fffe
	dc.w  $343f,$fffe, COLOR00,$0000, $34df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3501,$fffe
	dc.w  $353f,$fffe, COLOR00,$0000, $35df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3601,$fffe
	dc.w  $363f,$fffe, COLOR00,$0000, $36df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3701,$fffe
	dc.w  $373f,$fffe, COLOR00,$0000, $37df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3801,$fffe
	dc.w  $383f,$fffe, COLOR00,$0000, $38df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3901,$fffe
	dc.w  $393f,$fffe, COLOR00,$0000, $39df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3a01,$fffe
	dc.w  $3a3f,$fffe, COLOR00,$0000, $3adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3b01,$fffe
	dc.w  $3b3f,$fffe, COLOR00,$0000, $3bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3c01,$fffe
	dc.w  $3c3f,$fffe, COLOR00,$0000, $3cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3d01,$fffe
	dc.w  $3d3f,$fffe, COLOR00,$0000, $3ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $3e01,$fffe
	dc.w  $3e3f,$fffe, COLOR00,$0000, $3edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $3f01,$fffe
	dc.w  $3f3f,$fffe, COLOR00,$0000, $3fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4001,$fffe
	dc.w  $403f,$fffe, COLOR00,$0000, $40df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4101,$fffe
	dc.w  $413f,$fffe, COLOR00,$0000, $41df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4201,$fffe
	dc.w  $423f,$fffe, COLOR00,$0000, $42df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4301,$fffe
	dc.w  $433f,$fffe, COLOR00,$0000, $43df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4401,$fffe
	dc.w  $443f,$fffe, COLOR00,$0000, $44df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4501,$fffe
	dc.w  $453f,$fffe, COLOR00,$0000, $45df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4601,$fffe
	dc.w  $463f,$fffe, COLOR00,$0000, $46df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4701,$fffe
	dc.w  $473f,$fffe, COLOR00,$0000, $47df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4801,$fffe
	dc.w  $483f,$fffe, COLOR00,$0000, $48df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4901,$fffe
	dc.w  $493f,$fffe, COLOR00,$0000, $49df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4a01,$fffe
	dc.w  $4a3f,$fffe, COLOR00,$0000, $4adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4b01,$fffe
	dc.w  $4b3f,$fffe, COLOR00,$0000, $4bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4c01,$fffe
	dc.w  $4c3f,$fffe, COLOR00,$0000, $4cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4d01,$fffe
	dc.w  $4d3f,$fffe, COLOR00,$0000, $4ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $4e01,$fffe
	dc.w  $4e3f,$fffe, COLOR00,$0000, $4edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $4f01,$fffe
	dc.w  $4f3f,$fffe, COLOR00,$0000, $4fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5001,$fffe
	dc.w  $503f,$fffe, COLOR00,$0000, $50df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5101,$fffe
	dc.w  $513f,$fffe, COLOR00,$0000, $51df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5201,$fffe
	dc.w  $523f,$fffe, COLOR00,$0000, $52df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5301,$fffe
	dc.w  $533f,$fffe, COLOR00,$0000, $53df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5401,$fffe
	dc.w  $543f,$fffe, COLOR00,$0000, $54df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5501,$fffe
	dc.w  $553f,$fffe, COLOR00,$0000, $55df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5601,$fffe
	dc.w  $563f,$fffe, COLOR00,$0000, $56df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5701,$fffe
	dc.w  $573f,$fffe, COLOR00,$0000, $57df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5801,$fffe
	dc.w  $583f,$fffe, COLOR00,$0000, $58df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5901,$fffe
	dc.w  $593f,$fffe, COLOR00,$0000, $59df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5a01,$fffe
	dc.w  $5a3f,$fffe, COLOR00,$0000, $5adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5b01,$fffe
	dc.w  $5b3f,$fffe, COLOR00,$0000, $5bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5c01,$fffe
	dc.w  $5c3f,$fffe, COLOR00,$0000, $5cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5d01,$fffe
	dc.w  $5d3f,$fffe, COLOR00,$0000, $5ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $5e01,$fffe
	dc.w  $5e3f,$fffe, COLOR00,$0000, $5edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $5f01,$fffe
	dc.w  $5f3f,$fffe, COLOR00,$0000, $5fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6001,$fffe
	dc.w  $603f,$fffe, COLOR00,$0000, $60df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6101,$fffe
	dc.w  $613f,$fffe, COLOR00,$0000, $61df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6201,$fffe
	dc.w  $623f,$fffe, COLOR00,$0000, $62df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6301,$fffe
	dc.w  $633f,$fffe, COLOR00,$0000, $63df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6401,$fffe
	dc.w  $643f,$fffe, COLOR00,$0000, $64df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6501,$fffe
	dc.w  $653f,$fffe, COLOR00,$0000, $65df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6601,$fffe
	dc.w  $663f,$fffe, COLOR00,$0000, $66df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6701,$fffe
	dc.w  $673f,$fffe, COLOR00,$0000, $67df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6801,$fffe
	dc.w  $683f,$fffe, COLOR00,$0000, $68df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6901,$fffe
	dc.w  $693f,$fffe, COLOR00,$0000, $69df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6a01,$fffe
	dc.w  $6a3f,$fffe, COLOR00,$0000, $6adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6b01,$fffe
	dc.w  $6b3f,$fffe, COLOR00,$0000, $6bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6c01,$fffe
	dc.w  $6c3f,$fffe, COLOR00,$0000, $6cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6d01,$fffe
	dc.w  $6d3f,$fffe, COLOR00,$0000, $6ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $6e01,$fffe
	dc.w  $6e3f,$fffe, COLOR00,$0000, $6edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $6f01,$fffe
	dc.w  $6f3f,$fffe, COLOR00,$0000, $6fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7001,$fffe
	dc.w  $703f,$fffe, COLOR00,$0000, $70df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7101,$fffe
	dc.w  $713f,$fffe, COLOR00,$0000, $71df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7201,$fffe
	dc.w  $723f,$fffe, COLOR00,$0000, $72df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7301,$fffe
	dc.w  $733f,$fffe, COLOR00,$0000, $73df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7401,$fffe
	dc.w  $743f,$fffe, COLOR00,$0000, $74df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7501,$fffe
	dc.w  $753f,$fffe, COLOR00,$0000, $75df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7601,$fffe
	dc.w  $763f,$fffe, COLOR00,$0000, $76df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7701,$fffe
	dc.w  $773f,$fffe, COLOR00,$0000, $77df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7801,$fffe
	dc.w  $783f,$fffe, COLOR00,$0000, $78df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7901,$fffe
	dc.w  $793f,$fffe, COLOR00,$0000, $79df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7a01,$fffe
	dc.w  $7a3f,$fffe, COLOR00,$0000, $7adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7b01,$fffe
	dc.w  $7b3f,$fffe, COLOR00,$0000, $7bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7c01,$fffe
	dc.w  $7c3f,$fffe, COLOR00,$0000, $7cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7d01,$fffe
	dc.w  $7d3f,$fffe, COLOR00,$0000, $7ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $7e01,$fffe
	dc.w  $7e3f,$fffe, COLOR00,$0000, $7edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $7f01,$fffe
	dc.w  $7f3f,$fffe, COLOR00,$0000, $7fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8001,$fffe
	dc.w  $803f,$fffe, COLOR00,$0000, $80df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8101,$fffe
	dc.w  $813f,$fffe, COLOR00,$0000, $81df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8201,$fffe
	dc.w  $823f,$fffe, COLOR00,$0000, $82df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8301,$fffe
	dc.w  $833f,$fffe, COLOR00,$0000, $83df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8401,$fffe
	dc.w  $843f,$fffe, COLOR00,$0000, $84df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8501,$fffe
	dc.w  $853f,$fffe, COLOR00,$0000, $85df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8601,$fffe
	dc.w  $863f,$fffe, COLOR00,$0000, $86df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8701,$fffe
	dc.w  $873f,$fffe, COLOR00,$0000, $87df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8801,$fffe
	dc.w  $883f,$fffe, COLOR00,$0000, $88df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8901,$fffe
	dc.w  $893f,$fffe, COLOR00,$0000, $89df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8a01,$fffe
	dc.w  $8a3f,$fffe, COLOR00,$0000, $8adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8b01,$fffe
	dc.w  $8b3f,$fffe, COLOR00,$0000, $8bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8c01,$fffe
	dc.w  $8c3f,$fffe, COLOR00,$0000, $8cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8d01,$fffe
	dc.w  $8d3f,$fffe, COLOR00,$0000, $8ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $8e01,$fffe
	dc.w  $8e3f,$fffe, COLOR00,$0000, $8edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $8f01,$fffe
	dc.w  $8f3f,$fffe, COLOR00,$0000, $8fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9001,$fffe
	dc.w  $903f,$fffe, COLOR00,$0000, $90df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9101,$fffe
	dc.w  $913f,$fffe, COLOR00,$0000, $91df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9201,$fffe
	dc.w  $923f,$fffe, COLOR00,$0000, $92df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9301,$fffe
	dc.w  $933f,$fffe, COLOR00,$0000, $93df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9401,$fffe
	dc.w  $943f,$fffe, COLOR00,$0000, $94df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9501,$fffe
	dc.w  $953f,$fffe, COLOR00,$0000, $95df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9601,$fffe
	dc.w  $963f,$fffe, COLOR00,$0000, $96df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9701,$fffe
	dc.w  $973f,$fffe, COLOR00,$0000, $97df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9801,$fffe
	dc.w  $983f,$fffe, COLOR00,$0000, $98df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9901,$fffe
	dc.w  $993f,$fffe, COLOR00,$0000, $99df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9a01,$fffe
	dc.w  $9a3f,$fffe, COLOR00,$0000, $9adf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9b01,$fffe
	dc.w  $9b3f,$fffe, COLOR00,$0000, $9bdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9c01,$fffe
	dc.w  $9c3f,$fffe, COLOR00,$0000, $9cdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9d01,$fffe
	dc.w  $9d3f,$fffe, COLOR00,$0000, $9ddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $9e01,$fffe
	dc.w  $9e3f,$fffe, COLOR00,$0000, $9edf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $9f01,$fffe
	dc.w  $9f3f,$fffe, COLOR00,$0000, $9fdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $a001,$fffe
	dc.w  $a03f,$fffe, COLOR00,$0000, $a0df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $a101,$fffe
	dc.w  $a13f,$fffe, COLOR00,$0000, $a1df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $a201,$fffe
	dc.w  $a23f,$fffe, COLOR00,$0000, $a2df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $a301,$fffe
	dc.w  $a33f,$fffe, COLOR00,$0000, $a3df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $a401,$fffe
	dc.w  $a43f,$fffe, COLOR00,$0000, $a4df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $a501,$fffe
	dc.w  $a53f,$fffe, COLOR00,$0000, $a5df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $a601,$fffe
	dc.w  $a63f,$fffe, COLOR00,$0000, $a6df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $a701,$fffe
	dc.w  $a73f,$fffe, COLOR00,$0000, $a7df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $a801,$fffe
	dc.w  $a83f,$fffe, COLOR00,$0000, $a8df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $a901,$fffe
	dc.w  $a93f,$fffe, COLOR00,$0000, $a9df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $aa01,$fffe
	dc.w  $aa3f,$fffe, COLOR00,$0000, $aadf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $ab01,$fffe
	dc.w  $ab3f,$fffe, COLOR00,$0000, $abdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ac01,$fffe
	dc.w  $ac3f,$fffe, COLOR00,$0000, $acdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $ad01,$fffe
	dc.w  $ad3f,$fffe, COLOR00,$0000, $addf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ae01,$fffe
	dc.w  $ae3f,$fffe, COLOR00,$0000, $aedf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $af01,$fffe
	dc.w  $af3f,$fffe, COLOR00,$0000, $afdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $b001,$fffe
	dc.w  $b03f,$fffe, COLOR00,$0000, $b0df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $b101,$fffe
	dc.w  $b13f,$fffe, COLOR00,$0000, $b1df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $b201,$fffe
	dc.w  $b23f,$fffe, COLOR00,$0000, $b2df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $b301,$fffe
	dc.w  $b33f,$fffe, COLOR00,$0000, $b3df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $b401,$fffe
	dc.w  $b43f,$fffe, COLOR00,$0000, $b4df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $b501,$fffe
	dc.w  $b53f,$fffe, COLOR00,$0000, $b5df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $b601,$fffe
	dc.w  $b63f,$fffe, COLOR00,$0000, $b6df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $b701,$fffe
	dc.w  $b73f,$fffe, COLOR00,$0000, $b7df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $b801,$fffe
	dc.w  $b83f,$fffe, COLOR00,$0000, $b8df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $b901,$fffe
	dc.w  $b93f,$fffe, COLOR00,$0000, $b9df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ba01,$fffe
	dc.w  $ba3f,$fffe, COLOR00,$0000, $badf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $bb01,$fffe
	dc.w  $bb3f,$fffe, COLOR00,$0000, $bbdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $bc01,$fffe
	dc.w  $bc3f,$fffe, COLOR00,$0000, $bcdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $bd01,$fffe
	dc.w  $bd3f,$fffe, COLOR00,$0000, $bddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $be01,$fffe
	dc.w  $be3f,$fffe, COLOR00,$0000, $bedf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $bf01,$fffe
	dc.w  $bf3f,$fffe, COLOR00,$0000, $bfdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $c001,$fffe
	dc.w  $c03f,$fffe, COLOR00,$0000, $c0df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $c101,$fffe
	dc.w  $c13f,$fffe, COLOR00,$0000, $c1df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $c201,$fffe
	dc.w  $c23f,$fffe, COLOR00,$0000, $c2df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $c301,$fffe
	dc.w  $c33f,$fffe, COLOR00,$0000, $c3df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $c401,$fffe
	dc.w  $c43f,$fffe, COLOR00,$0000, $c4df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $c501,$fffe
	dc.w  $c53f,$fffe, COLOR00,$0000, $c5df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $c601,$fffe
	dc.w  $c63f,$fffe, COLOR00,$0000, $c6df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $c701,$fffe
	dc.w  $c73f,$fffe, COLOR00,$0000, $c7df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $c801,$fffe
	dc.w  $c83f,$fffe, COLOR00,$0000, $c8df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $c901,$fffe
	dc.w  $c93f,$fffe, COLOR00,$0000, $c9df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ca01,$fffe
	dc.w  $ca3f,$fffe, COLOR00,$0000, $cadf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $cb01,$fffe
	dc.w  $cb3f,$fffe, COLOR00,$0000, $cbdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $cc01,$fffe
	dc.w  $cc3f,$fffe, COLOR00,$0000, $ccdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $cd01,$fffe
	dc.w  $cd3f,$fffe, COLOR00,$0000, $cddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ce01,$fffe
	dc.w  $ce3f,$fffe, COLOR00,$0000, $cedf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $cf01,$fffe
	dc.w  $cf3f,$fffe, COLOR00,$0000, $cfdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $d001,$fffe
	dc.w  $d03f,$fffe, COLOR00,$0000, $d0df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $d101,$fffe
	dc.w  $d13f,$fffe, COLOR00,$0000, $d1df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $d201,$fffe
	dc.w  $d23f,$fffe, COLOR00,$0000, $d2df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $d301,$fffe
	dc.w  $d33f,$fffe, COLOR00,$0000, $d3df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $d401,$fffe
	dc.w  $d43f,$fffe, COLOR00,$0000, $d4df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $d501,$fffe
	dc.w  $d53f,$fffe, COLOR00,$0000, $d5df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $d601,$fffe
	dc.w  $d63f,$fffe, COLOR00,$0000, $d6df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $d701,$fffe
	dc.w  $d73f,$fffe, COLOR00,$0000, $d7df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $d801,$fffe
	dc.w  $d83f,$fffe, COLOR00,$0000, $d8df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $d901,$fffe
	dc.w  $d93f,$fffe, COLOR00,$0000, $d9df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $da01,$fffe
	dc.w  $da3f,$fffe, COLOR00,$0000, $dadf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $db01,$fffe
	dc.w  $db3f,$fffe, COLOR00,$0000, $dbdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $dc01,$fffe
	dc.w  $dc3f,$fffe, COLOR00,$0000, $dcdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $dd01,$fffe
	dc.w  $dd3f,$fffe, COLOR00,$0000, $dddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $de01,$fffe
	dc.w  $de3f,$fffe, COLOR00,$0000, $dedf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $df01,$fffe
	dc.w  $df3f,$fffe, COLOR00,$0000, $dfdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $e001,$fffe
	dc.w  $e03f,$fffe, COLOR00,$0000, $e0df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $e101,$fffe
	dc.w  $e13f,$fffe, COLOR00,$0000, $e1df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $e201,$fffe
	dc.w  $e23f,$fffe, COLOR00,$0000, $e2df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $e301,$fffe
	dc.w  $e33f,$fffe, COLOR00,$0000, $e3df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $e401,$fffe
	dc.w  $e43f,$fffe, COLOR00,$0000, $e4df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $e501,$fffe
	dc.w  $e53f,$fffe, COLOR00,$0000, $e5df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $e601,$fffe
	dc.w  $e63f,$fffe, COLOR00,$0000, $e6df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $e701,$fffe
	dc.w  $e73f,$fffe, COLOR00,$0000, $e7df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $e801,$fffe
	dc.w  $e83f,$fffe, COLOR00,$0000, $e8df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $e901,$fffe
	dc.w  $e93f,$fffe, COLOR00,$0000, $e9df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ea01,$fffe
	dc.w  $ea3f,$fffe, COLOR00,$0000, $eadf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $eb01,$fffe
	dc.w  $eb3f,$fffe, COLOR00,$0000, $ebdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ec01,$fffe
	dc.w  $ec3f,$fffe, COLOR00,$0000, $ecdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $ed01,$fffe
	dc.w  $ed3f,$fffe, COLOR00,$0000, $eddf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $ee01,$fffe
	dc.w  $ee3f,$fffe, COLOR00,$0000, $eedf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $ef01,$fffe
	dc.w  $ef3f,$fffe, COLOR00,$0000, $efdf,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $f001,$fffe
	dc.w  $f03f,$fffe, COLOR00,$0000, $f0df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $f101,$fffe
	dc.w  $f13f,$fffe, COLOR00,$0000, $f1df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo_repeat
	dc.w  BPL2MOD,screenBuffer_modulo_repeat
	dc.w $f201,$fffe
	dc.w  $f23f,$fffe, COLOR00,$0000, $f2df,$fffe,COLOR00,$0000
	dc.w  BPL1MOD,screenBuffer_modulo
	dc.w  BPL2MOD,screenBuffer_modulo
	dc.w $f301,$fffe
	dc.w  $f33f,$fffe, COLOR00,$0000, $f3df,$fffe,COLOR00,$0000


	


copper_footer:
                              dc.w      BPL1PTH,0
                              dc.w      BPL1PTL,0
                              dc.w      BPL2PTH,0
                              dc.w      BPL2PTL,0
                              dc.w      BPL3PTH,0
                              dc.w      BPL3PTL,0
                              dc.w      BPL4PTH,0
                              dc.w      BPL4PTL,0

							 dc.w  BPL1MOD,(screenBuffer_width_Byte*4)-(screen_width/8)-2
							 dc.w  BPL2MOD,(screenBuffer_width_Byte*4)-(screen_width/8)-2

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


copperSlot:
                              dc.w      $ffdf,$fffe                                                                ; wait($df,$ff) enables waits > $ff vertical
                              dc.w      $2c01,$fffe                                                                ; wait($01,$12c) - $2c is $12c
                              dc.w      BPLCON0,$0200                                                              ; BPLCON0 unset bitplanes, enable color burst; needed to support older PAL chips						
                              dc.w      $ffff,$fffe                                                                ; end of copper
                              



	

footer: 
	include "./data/background/bg_footer.asm"

	include "./data/assets/Amiga_CM_font_data.asm"


		
;bufferBefore			ds.b (160/8)*(100)
bufferMem				ds.b 160*100
bufferAfter				ds.b 160*50		;y clipping bottom still missing

buffer 					dc.l bufferMem


    ifnd BLITTER_C2P 
		include    "./code/c2p/c2p2x1_4_c5_bm.asm"
	else
		include    "./code/c2p/c2p2x1_4_Blitter_stretchedByte.asm"
		;include    "./code/c2p/c2p2x1_4_CPU_stretchedByte.asm"
	endif

sprites:
	dc.l s4
	dc.l s1
	dc.l s2
	dc.l s3
	dc.l s4
	dc.l -1

sprites_pointer	dc.l sprites
 
s0:
  include     "./data/sprites/sprites_weapon0_phase0.asm"
s1:
  include     "./data/sprites/sprites_weapon0_phase1.asm"
s2:
  include     "./data/sprites/sprites_weapon0_phase2.asm"
s3:
  include     "./data/sprites/sprites_weapon0_phase3.asm"
s4:
  include     "./data/sprites/sprites_weapon0_phase4.asm"