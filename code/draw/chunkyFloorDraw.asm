FLOOR_TEXTURE_SIZE = 128*128

ray_drawFloor:
	move.l buffer,a0
	add.l #160*60,a0


	;lea    floorImageMid,a1
 
  move.l  floorDataPointer,a1
  adda.l #128*64,a1 

	moveq #0,d3
	move.w global_z,d3
	bge .skip

  neg.w d3
  and.w #%01111111,d3
 	
  move.w #128,d0
  sub.w  d3,d0
  move.w d0,d3
  bra.s .zPos
.skip:
  and.w #%01111111,d3

.zPos:


; x value
	moveq #0,d4
	move.w global_x,d4
	bge .skip2

  neg.w d4
  and.w #%01111111,d4
 	
  move.w #128,d0
  sub.w  d4,d0
  move.w d0,d4
  bra.s .xPos
.skip2:	
	and.w #%01111111,d4
.xPos:


	;d3=y; d4=x
	moveq #0,d0
	move.w global_yAngle,d0
	;beq.s correctionDone ;=0 nothing to do
	cmp.w #90*2,d0
	blt.s set_0_80
	cmp.w #180*2,d0
	blt.s set_90_170
	cmp.w #270*2,d0
	blt.s set_180_260
	bra.s set_270_350
	

correctionDone:
	;y
	muls #10,d3
	divs  #20,d3

	cmp.w #0,d3
	ble.s .ok
	sub.w #64,d3
.ok
	muls #128,d3  ; floor imgae width (*2)

	;x
	muls #10,d4
	divs  #20,d4

	ext.l d3
	ext.l d4
	;suba.l d3,a1 ; y texture pos
	adda.l d3,a1 ; y texture pos
	adda.l d4,a1	; x texture pos

	lea  floors,a2
	divu #PLAYER_ANGLE_SPEED*2,d0
	mulu #4,d0
	adda.l d0,a2
	move.l (a2),a2
	jsr (a2)
  
  ifd CEILING
  move.l currentLevel,a3
  cmp.w #0,6(a3)
  beq.s .noSky
  bsr ray_drawSky
	bra.s .done
.noSky
	bsr ray_drawCeiling

.done		
	endif

	rts

;d0: angle
;a1 pointer to texture
;d3=y; d4=x
;return d0: new angle
;return a1: corrected texture  
set_0_80:
	add.l #FLOOR_TEXTURE_SIZE*0,a1
	neg.w d3
	bra.s correctionDone

set_90_170:	
	add.l #FLOOR_TEXTURE_SIZE*3,a1
	sub.w #90*2,d0
	exg.l d3,d4
	neg.w d3
	neg.w d4
	bra.s correctionDone

set_180_260:
	add.l #FLOOR_TEXTURE_SIZE*2,a1
	sub.w #180*2,d0
	neg.w d4
	bra.s correctionDone
set_270_350:
	add.l #FLOOR_TEXTURE_SIZE*1,a1
	sub.w #270*2,d0
	exg.l d3,d4

	bra.s correctionDone



ray_drawCeiling:
	
.e_draw_init_blitter
  btst       #14,$dff002
  bne.s      .e_draw_init_blitter
					
					; set by table:
  move       #(80)-2,$dff064           ;A Modulo
  move       #(-80)-2-160,$dff066           ;D Address
  clr        $dff042
  move.l     #$ffff0000,$dff044
	


  move.l      buffer,a1   
  add.l 	#160*60,a1                  ; pointer to floor rendering                      

	
  move.l     buffer,a2 ; destination
  add.l 	#160*40,a2 ; go to bottom of destination
  moveq      #0,d0	; x POS
  moveq      #0,d1	 ; y POS


.e_waitblit_1
  btst       #14,$dff002
  bne.s      .e_waitblit_1
	
  move       d1,$dff042 
  or         #%0000100111110000,d1 ; no B; onyl copy A to C
  move       d1,$dff040 

.e_waitblit_2
  btst       #14,$dff002
  bne.s      .e_waitblit_2
	
  move.l     a1,$dff050               ;A=Maske
  move.l     a2,$dff054               ;D=Dest write
                    ;blisize (bitplanes*height*64)+((width_in_pixel+16)/16)
  move       #(40*64)+(((80*8)+16)/16),$dff058
	
.e_waitblit_3
  btst       #14,$dff002
  bne.s      .e_waitblit_3

  move.l      buffer,a1   
  add.l 	#(160*60)+80,a1                  ; pointer to floor rendering 
  move.l     buffer,a2 ; destination
  add.l 	#(160*40)+80,a2 ; go to bottom of destination

.e_waitblit_4
  btst       #14,$dff002
  bne.s      .e_waitblit_4
	
  move.l     a1,$dff050               ;A=Maske
  move.l     a2,$dff054               ;D=Dest write
                    ;blisize (bitplanes*height*64)+((width_in_pixel+16)/16)
  move       #(40*64)+(((80*8)+16)/16),$dff058
  rts	



ray_drawSky:
	moveq #0,d3
	move.w sky_position,d3
.done
	and.w #$fffe,d3
	
.e_draw_init_blitter
  btst       #14,$dff002
  bne.s      .e_draw_init_blitter
					
					; set by table:
  move       #(80+160)-2,$dff064           ;A Modulo
  move       #(80)-2,$dff066           ;D Address
  clr        $dff042
  move.l     #$ffff0000,$dff044
	


  ;lea.l      sky,a1   
  move.l  skyDataPointer,a1
  add.l      d3,a1 ; add angle

  move.l     buffer,a2 ; destination
  ;sub.l  #2,a2			;correction
  ;add.l 	#(160*40),a2
  moveq      #0,d0	; x POS
  moveq      #0,d1	 ; y POS


.e_waitblit_1
  btst       #14,$dff002
  bne.s      .e_waitblit_1
	
  move       d1,$dff042 
  or         #%0000100111110000,d1 ; no B; onyl copy A to C
  move       d1,$dff040 

.e_waitblit_2
  btst       #14,$dff002
  bne.s      .e_waitblit_2
	
  move.l     a1,$dff050               ;A=Maske
  move.l     a2,$dff054               ;D=Dest write
                    ;blisize (bitplanes*height*64)+((width_in_pixel+16)/16)
  move       #(60*64)+(((80*8)+16)/16),$dff058

.e_waitblit_3
  btst       #14,$dff002
  bne.s      .e_waitblit_3

  move       #(80+160)-2,$dff064           ;A Modulo
  move       #(80-2),$dff066           ;D Address
  ;lea.l      sky,a1   
  move.l  skyDataPointer,a1
  add.l      d3,a1 ; add angle
  add.l 	#80,a1                  ; pointer to floor rendering 
  move.l     buffer,a2 ; destination
  ;sub.l  #2,a2			;correction
 ; add.l 	#(160*40)+80,a2
  add.l 	#80,a2
 
.e_waitblit_4
  btst       #14,$dff002
  bne.s      .e_waitblit_4
	
  move.l     a1,$dff050               ;A=Maske
  move.l     a2,$dff054               ;D=Dest write
                    ;blisize (bitplanes*height*64)+((width_in_pixel+16)/16)
  move       #(60*64)+(((80*8+16))/16),$dff058
  rts	