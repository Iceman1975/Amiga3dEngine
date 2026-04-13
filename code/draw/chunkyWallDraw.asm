

	
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
	;lsr.w #1,d2	; half resolution
.noCorrection:

	move.l a0,a1 ; store screen startpointer
	;move.w #%1100000000000000,d5 ; brush
	;ror.w d1,d5
	
	move.l yDownInstruction,.yInstructionPointer
	move.w yDownInstruction+4,.yInstructionPointer+4
	move.w heightDownInstruction,.heightInstructionPointer

	moveq #0,d1
	move.w 6(a2),d1
	sub.w (a2),d1 ;deltaX


	;****
	add.w #1,d1 ; correction
	;lsr #1,d1 ; half resolution
	;****
	moveq #0,d0
	move.w d1,d0
	add.w MAP_CLIP_DOOR(a2),d0	; correct texture pointer (z0 clipping)
	;add.w MAP_2D_Z1_CLIPPING(a2),d0 ; correct texture pointer (z1 clipping) TODO: Bug
	lsl #2,d0
	lea stepTable,a5		; find correct texture line
	adda.l d0,a5
	move.l (a5),a5 ; steptable texX

	;correct texture pointer
	add.w MAP_CLIP_DOOR(a2),d2

	tst d2
	ble .countSkip
	moveq #0,d0
.countClipsX0:
	move.w (a5)+,d0
	ifd WALL_TEXTURE_HEIGHT
		mulu.w #WALL_TEXTURE_HEIGHT,d0
	else
		lsl.w #6,d0		;* Texture width (64 pixel=6 left shifts)
	endif
	adda.l d0,a6
	dbf d2,.countClipsX0
.countSkip	

	;lsr #1,d3	; half resolution
	sub.w d3,d1  ; clip


	move.w d1,d6 ; h loop
	subq.w #1,d6
	;lsr d4 ;clip x1 only half
	sub.w d4,d6 ; clip x1
	
	move.w 8(a2),d4
	sub.w 2(a2),d4 ;deltaY

	tst.w d4
	bge.s .noNegDeltaY
	neg.w d4
	move.l yUpInstruction,.yInstructionPointer
	move.w yUpInstruction+4,.yInstructionPointer+4
	moveq #0,d2
.noNegDeltaY:	
	
	move.w 10(a2),d3
	sub.w 4(a2),d3 ;deltaHeight
	
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

	move.w MAP_YY0(a2),d5  	; start Y needed for clipping
.hLoop:
	
	move.w (a5)+,d7
	ifd WALL_TEXTURE_HEIGHT
		mulu.w #WALL_TEXTURE_HEIGHT,d7
	else
		lsl #6,d7	; *64 pixel texture height
	endif
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

	;ror.w #2,d5
	;bcc.s .increaseAddress
	addq.l #1,a1
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
	lea  -160(a1),a1
	subq.w #1,d5		; for clipping
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
	;d5 y start pos
	;a0 startPos address	
ray_draw_vLineGenerated:	
	tst  d5			; line out of screen?
	ble  .end
	move.w d5,d0	
	sub.w d7,d0		y start - y -> overlapping y pixel

	lsl.w #2,d7	; *4 (longword table)
	lea.l vlinkTable,a2
	add.l d7,a2
	move.l (a2),a2
	tst.w d0
	bge.s .draw
.drawClip
	;move.w #-50*4,d7
	;bra.s .end
	;lsr.w #2,d7	
	add.w d0,d7			; d0 <0 -> height-oberlapping pixel
	add.w d0,d7	
	add.w d0,d7	
	add.w d0,d7	

	neg.w d7
	;lsl.w #2,d7	

	;move.l d5,d0  	; save value
	move.l a2,d0	
	move.l 0(a2,d7.w),a2
	move.w (a2),clipValue
	move.w #$4e75,(a2)		;write rts
	move.l d0,a2
	jsr (a2)
	move.l 0(a2,d7.w),a2
	move.w clipValue,(a2)

	;move.l d0,d5  	; save value back
	;move.w d0,0(a2,d7)
	bra.s .end
.draw
	jsr (a2)	
.end
	rts

clipValue dc.w 0

ray_drawRect
	move.l buffer,a0
	add.w #20,a0  ; x start
	add.w #160*20,a0 ; y start
	moveq #10,d7
	moveq #10,d6
.loop:
	move.b #7,(a0)
	move.b #7,2(a0)
	move.b #7,3(a0)

	dbf d7,.loop
	adda.l #160,a0
	moveq #10,d7
	dbf d6,.loop	
	rts






deltaHCount dc.w 0

deltaHeightCount dc.w 0

yUpInstruction:
	    lea  -160(a1),a1
		subq.w #1,d5
yDownInstruction:
		lea  160(a1),a1
		addq.w #1,d5

heightUpInstruction:
		subq.w #1,d2
heightDownInstruction:
       	addq.w #1,d2

rtsInstruction
		rts

MAP_ENTRY_SIZE = 32+4+(7*2)+4+2
MAP_POINTER2D = 32+4


MAP_X0_INIT = 0
MAP_Z0_INIT = 2
MAP_X1_INIT = 4
MAP_Z1_INIT = 6
MAP_Y0_INIT = 8
MAP_HEIGHT  = 10
MAP_LENGTH  = 12

MAP_X0 = 14
MAP_Z0 = 16
MAP_X1 = 18
MAP_Z1 = 20
MAP_Y0 = 22

MAP_STATUS  = 24
MAP_TYPE  = 26
MAP_Z0_CLIPPING =28
MAP_Z1_CLIPPING =30

MAP_IMAGE = 32


;MAP_2D_Z0_CLIPPING =-8
;MAP_2D_Z1_CLIPPING =-6
MAP_XX0		= 0
MAP_YY0		= 2
MAP_HEIGHT0  = 4

MAP_XX1		= 6
MAP_YY1		= 8
MAP_HEIGHT1  = 10
MAP_CLIP_DOOR  = 12
	
MAP_HLINK  		= 10	
MAP_HVLINK		= 14
MAP_ISCLIPPED   = 18
