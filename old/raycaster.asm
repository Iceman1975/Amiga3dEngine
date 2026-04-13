  include    "./code/3D.asm"




ray_drawFrame:
	lea map,a1
	moveq #NO_WALLS-1,d7
.loop
	lea MAP_POINTER2D(a1),a2

	tst.w MAP_STATUS(a1)
	beq .next

	move.l MAP_IMAGE(a1),a6

	move.l Screen_RENDER,a0

	moveq #0,d0
	move.w MAP_XX0(a2),d0

	;clip x0
	moveq #0,d3
	cmp.w #SCREEN_CLIP_X0,d0
	bge.s .clipX0Done
	move.w #SCREEN_CLIP_X0,d3
	sub.w d0,d3
	add.w d3,d0  
	cmp.w MAP_XX1(a2),d0
	beq .next

	movem.l    d0-d7,-(sp)
	move.w d0,d5
	;adapt yy0
	;x0	 - d0.w
	;x1	 - d1.w
	;y0	 - d2.w
	;y1	 - d3.w
	;x   - d4.w
	;-> res d3.w
	move.w d0,d4
	move.w MAP_XX0(a2),d0
	move.w MAP_XX1(a2),d1
	move.w MAP_YY0(a2),d2
	move.w MAP_YY1(a2),d3
	bsr world3d_clipLine
	move.w d3,MAP_YY0(a2)

	;height0
	move.w d5,d4
	move.w MAP_XX0(a2),d0
	move.w MAP_XX1(a2),d1
	move.w MAP_HEIGHT0(a2),d2
	move.w MAP_HEIGHT1(a2),d3
	bsr world3d_clipLine
	move.w d3,MAP_HEIGHT0(a2)

	movem.l    (sp)+,d0-d7
.clipX0Done:	
	;clip done

	moveq #0,d1
	move.w MAP_YY0(a2),d1
	mulu.w #screenBuffer_lineSize,d1
	add.l d1,a0

	move.w d0,d1
	and.w  #%1110,d1
	lsr #4,d0
	lsl #1,d0
	add.l d0,a0
	;add.l #((screenBuffer_lineSize*200)),a0 ; startPos
	;d3 clip X0
	;d4 clip x1
	;d1 shifts
	moveq #0,d4
	move.w MAP_XX1(a2),d2
	cmp.w #SCREEN_CLIP_X1,d2
	ble .draw
	sub.w #SCREEN_CLIP_X1,d2
	move.w d2,d4
.draw
	;bsr ray_drawWallWithMask
	bsr ray_drawWall
.next
	lea MAP_ENTRY_SIZE(a1),a1
	dbf d7,.loop
	rts


	



	
	;a0 screen startpointer
	;a2 wall pointer
	;a6 pointer to wall teture (64*64)
	;d1 x shifts
	;d3 x0 clip
ray_drawWall:
    movem.l    d0-d7/a0-a6,-(sp)  

	moveq #0,d2
	move.w d3,d2 ; store x0 clipping in d2
	beq.s .noCorrection
	sub.w #1,d2
	lsr.w #1,d2	; half resolution
.noCorrection:

	move.l a0,a1 ; store screen startpointer
	move.w #%1100000000000000,d5 ; brush
	ror.w d1,d5
	
	move.l yDownInstruction,.yInstructionPointer
	move.w heightDownInstruction,.heightInstructionPointer

	moveq #0,d1
	move.w 6(a2),d1
	sub.w (a2),d1 ;deltaX


	;****
	add.w #1,d1 ; correction
	lsr #1,d1 ; half resolution
	;****
	moveq #0,d0
	move.w d1,d0
	lsl #2,d0
	lea stepTable,a5		; find correct texture line
	adda.l d0,a5
	move.l (a5),a5 ; steptable texX

	

	tst d2
	ble .countSkip
	moveq #0,d0
.countClipsX0:
	move.w (a5)+,d0
	lsl.w #6,d0		;* Texture width (64 pixel=6 left shifts)
	adda.l d0,a6
	dbf d2,.countClipsX0
.countSkip	

	lsr #1,d3	; half resolution
	sub.w d3,d1  ; clip


	move.w d1,d6 ; h loop
	subq.w #1,d6
	lsr d4 ;clip x1 only half
	sub.w d4,d6 ; clip x1
	
	move.w 8(a2),d4
	sub.w 2(a2),d4 deltaY

	tst.w d4
	bge.s .noNegDeltaY
	neg.w d4
	move.l yUpInstruction,.yInstructionPointer
	moveq #0,d2
.noNegDeltaY:	
	
	move.w 10(a2),d3
	sub.w 4(a2),d3 deltaHeight
	
	tst.w d3
	bge.s .noNegDeltaHeight
	neg.w d3
	move.w heightUpInstruction,.heightInstructionPointer
.noNegDeltaHeight:


	move.w #0,deltaHCount ; init
	move.w #0,deltaHeightCount ; init


	
	move.w 4(a2),d2 ; init height
	subq.w #1,d2
	moveq #0,d7

	;move.l #$FFFFFFFF,d6	; create mask
	;eor.w d5,d6	
.hLoop:
	
	move.w (a5)+,d7
	lsl #6,d7
	adda.l d7,a6

	lea stepTable,a4 ; stepTable texY
	move d2,d7
	adda.l d2,a4
	adda.l d2,a4
	adda.l d2,a4
	adda.l d2,a4
	move.l (a4),a4
	move.l a6,a3 ;pointer to image column
	;bsr ray_draw_vLine
	bsr ray_draw_vLineGenerated
	;bsr ray_draw_vLineWithMask
	;bsr ray_draw_vLineTest
	;mask only
	;ror.w #2,d0
	;mask only

	ror.w #2,d5
	bcc.s .increaseAddress
	addq.w #2,a1
.increaseAddress:	
	
	;c+=deltaY;
    ;while (c>=deltaX) {
	;	c-=deltaX;
	;	v+=changeValue;
    ;}

	add.w d4,deltaHCount
.vCalc:
	cmp.w deltaHCount,d1	;deltaX>deltaHCount
	bgt.s .vCalcDone
	sub.w d1,deltaHCount
.yInstructionPointer:
	lea  -screenBuffer_lineSize(a1),a1
	bra.s .vCalc
.vCalcDone:	

    ;cc+=deltaHeight;
    ;while (cc>=deltaX) {
    ;cc-=deltaX;
    ;he+=changeValueHeight;
    ;}	
	add.w d3,deltaHeightCount
.heightCalc:
	cmp.w deltaHeightCount,d1
	bgt.s  .heightCalcDone
	sub.w d1,deltaHeightCount
.heightInstructionPointer
	subq.w #1,d2
	bra.s .heightCalc
.heightCalcDone:	
	
	
	move.l a1,a0
	dbf d6,.hLoop
	 movem.l    (sp)+,d0-d7/a0-a6
	rts

	
	;d7 height-1;
	;a0 startPos address	
ray_draw_vLine:	
	move.b (a3),d0
	adda.w (a4)+,a3

.vline:
	add.b d0,d0
	bcc.s .no0Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0Bitplane
	add.b d0,d0
	bcc.s .no1Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1Bitplane
	add.b d0,d0
	bcc.s .no2Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2Bitplane
	add.b d0,d0
	bcc.s .no3Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3Bitplane
	
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
	dbf d7,.vline
	rts
	




	;a0 screen startpointer
	;a2 wall pointer
	;a6 pointer to wall teture (64*64)
	;d1 x shifts
	;d3 x0 clip
ray_drawWallWithMask:
    movem.l    d0-d7/a0-a6,-(sp)  

	moveq #0,d2
	move.w d3,d2 ; store x0 clipping in d2
	beq.s .noCorrection
	sub.w #1,d2
	lsr.w #1,d2	; half resolution
.noCorrection:

	move.l a0,a1 ; store screen startpointer
	move.w #%1100000000000000,d5 ; brush
	ror.w d1,d5
	
	move.l yDownInstruction,.yInstructionPointer
	move.w heightDownInstruction,.heightInstructionPointer

	moveq #0,d1
	move.w 6(a2),d1
	sub.w (a2),d1 ;deltaX


	;****
	add.w #1,d1 ; correction
	lsr #1,d1 ; half resolution
	;****
	moveq #0,d0
	move.w d1,d0
	lsl #2,d0
	lea stepTable,a5		; find correct texture line
	adda.l d0,a5
	move.l (a5),a5 ; steptable texX

	

	tst d2
	ble .countSkip
	moveq #0,d0
.countClipsX0:
	move.w (a5)+,d0
	lsl.w #6,d0		;* Texture width (64 pixel=6 left shifts)
	adda.l d0,a6
	dbf d2,.countClipsX0
.countSkip	

	lsr #1,d3	; half resolution
	sub.w d3,d1  ; clip


	move.w d1,d6 ; h loop
	subq.w #1,d6
	lsr d4 ;clip x1 only half
	sub.w d4,d6 ; clip x1
	
	move.w 8(a2),d4
	sub.w 2(a2),d4 deltaY

	tst.w d4
	bge.s .noNegDeltaY
	neg.w d4
	move.l yUpInstruction,.yInstructionPointer
	moveq #0,d2
.noNegDeltaY:	
	
	move.w 10(a2),d3
	sub.w 4(a2),d3 deltaHeight
	
	tst.w d3
	bge.s .noNegDeltaHeight
	neg.w d3
	move.w heightUpInstruction,.heightInstructionPointer
.noNegDeltaHeight:


	move.w #0,deltaHCount ; init
	move.w #0,deltaHeightCount ; init


	
	move.w 4(a2),d2 ; init height
	subq.w #1,d2
	moveq #0,d7


.hLoop:
	
	move.w (a5)+,d7
	lsl #6,d7
	adda.l d7,a6

	lea stepTable,a4 ; stepTable texY
	move d2,d7
	adda.l d2,a4
	adda.l d2,a4
	adda.l d2,a4
	adda.l d2,a4
	move.l (a4),a4
	move.l a6,a3 ;pointer to image column
	;bsr ray_draw_vLine

	movem.l    d0-d7/a0-a6,-(sp)  
	;move.l #$FFFFFFFF,d6	; create mask
	moveq #-1,d6
	eor.w d5,d6	
	bsr ray_draw_vLineWithMask
	movem.l    (sp)+,d0-d7/a0-a6

	;mask only
	;ror.w #2,d0
	;mask only

	ror.w #2,d5
	bcc.s .increaseAddress
	addq.w #2,a1
.increaseAddress:	
	
	;c+=deltaY;
    ;while (c>=deltaX) {
	;	c-=deltaX;
	;	v+=changeValue;
    ;}

	add.w d4,deltaHCount
.vCalc:
	cmp.w deltaHCount,d1	;deltaX>deltaHCount
	bgt.s .vCalcDone
	sub.w d1,deltaHCount
.yInstructionPointer:
	lea  -screenBuffer_lineSize(a1),a1
	bra.s .vCalc
.vCalcDone:	

    ;cc+=deltaHeight;
    ;while (cc>=deltaX) {
    ;cc-=deltaX;
    ;he+=changeValueHeight;
    ;}	
	add.w d3,deltaHeightCount
.heightCalc:
	cmp.w deltaHeightCount,d1
	bgt.s  .heightCalcDone
	sub.w d1,deltaHeightCount
.heightInstructionPointer
	subq.w #1,d2
	bra.s .heightCalc
.heightCalcDone:	
	
	
	move.l a1,a0
	dbf d6,.hLoop
	 movem.l    (sp)+,d0-d7/a0-a6
	rts


	;d7 height-1;
	;a0 startPos address	
ray_draw_vLineWithMask:	
	move.b (a3),d0
	adda.w (a4)+,a3

.vline:
	and.w d6,3*screenBuffer_width_Byte(a0)
	add.b d0,d0
	bcc.s .no0Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0Bitplane
	and.w d6,2*screenBuffer_width_Byte(a0)
	add.b d0,d0
	bcc.s .no1Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1Bitplane
	and.w d6,1*screenBuffer_width_Byte(a0)
	add.b d0,d0
	bcc.s .no2Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2Bitplane
	and.w d6,(a0) ;0*screenBuffer_width_Byte
	add.b d0,d0
	bcc.s .no3Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3Bitplane
	
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
	dbf d7,.vline
	rts


	;d7 height-1;
	;a0 startPos address	
ray_draw_vLineGenerated:	
	move.b (a3),d0
	adda.w (a4)+,a3

	lsl.w #2,d7	; *4 (longword table)
	lea.l vlinkTable,a2
	add.l d7.w,a2
	move.l (a2),a2

	move.w (a2),d7
	move.w #$4E75,(a2) ; write RTS
	bsr vline0	 ;jsr scale_x_y
	
	move.w d7,(a2)  

	rts
	

clipX0 dc.w 0
clipX1 dc.w 0

deltaHCount dc.w 0

deltaHeightCount dc.w 0

yUpInstruction:
	    lea  -screenBuffer_lineSize(a1),a1
yDownInstruction:
		lea  screenBuffer_lineSize(a1),a1

heightUpInstruction:
		subq.w #1,d2
heightDownInstruction:
       	addq.w #1,d2


MAP_ENTRY_SIZE = 24+4+(6*2)
MAP_POINTER2D = 24+4


MAP_X0_INIT = 0
MAP_Z0_INIT = 2
MAP_X1_INIT = 4
MAP_Z1_INIT = 6
MAP_Y0_INIT = 8
MAP_HEIGHT  = 10


MAP_X0 = 12
MAP_Z0 = 14
MAP_X1 = 16
MAP_Z1 = 18
MAP_Y0 = 20

MAP_STATUS  = 22

MAP_IMAGE = 24

MAP_XX0		= 0
MAP_YY0		= 2
MAP_HEIGHT0  = 4

MAP_XX1		= 6
MAP_YY1		= 8
MAP_HEIGHT1  = 10

 include    "./code/steptables.asm"	
vlineX:
 include    "./code/ray_vLines_generated.asm"

 include    "./data/worldData.asm"