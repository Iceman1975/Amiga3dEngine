  include    "./code/3D.asm"




ray_drawFrame:
	move.w #0,screenPointer_collision_z
	;lea map,a1
	;moveq #NO_WALLS-1,d7
	lea.l     objectPointerList,a5
    move.w    objectPointerListNum,d7
	tst.w d7
	beq .done ; nothing to draw
	sub.w     #1,d7	; correct loop
.loop
	move.l    4(a5),a1  	; get pointer form sorted list 

	lea MAP_POINTER2D(a1),a2

	tst.w MAP_STATUS(a1)
	beq .next

	cmp.w #1,MAP_TYPE(a1)
	beq .isBitmap

	cmp.w #2,MAP_TYPE(a1)
	beq .isPoly

	cmp.w #3,MAP_TYPE(a1)
	beq .isTexture

	move.l  imageDataPointer,a6
	add.l MAP_IMAGE(a1),a6

	move.l buffer,a0

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
	muls.w #160,d1
	add.l d1,a0

	add.l d0,a0

	;move.w d0,d1
	;and.w  #%1110,d1
	;lsr #4,d0
	;lsl #1,d0
	;add.l d0,a0

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
	move.w screenPointerX,d2
	move.w MAP_XX0(a2),d5
	cmp.w d2,d5
	bgt.s .drawAfterCollCheck
	move.w MAP_XX1(a2),d5
	cmp.w d2,d5
	blt.s .drawAfterCollCheck
	move.w 2(a5),screenPointer_collision_z
	move.l a1,screenPointer_element
.drawAfterCollCheck:	
	bsr ray_drawWall
	bra.s .next
.isBitmap:
	bsr ray_drawBitmap
	bra.s .next
.isTexture:
	bsr tray_drawPoly
	bra.s .next
.isPoly:
	bsr ray_drawPoly
.next
	;lea MAP_ENTRY_SIZE(a1),a1
	adda.l    #8,a5		; next element in sorted list
	dbf d7,.loop
.done:
	rts

;a1 map
;a2 2d
ray_drawBitmap:
	;d0 destination width
	;d1 destination height
	;d2 source width
	;d3 source height
	;a3 c2p image
	moveq #0,d0
	move.w MAP_XX1(a2),d0 ;width
	moveq #0,d1
	move.w MAP_YY1(a2),d1 ;height

	move.l	imageDataPointer,a3
	add.l MAP_IMAGE(a1),a3

	bsr ray_scaleObject

	;d0 width
	;d1 height
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	move.w MAP_YY1(a2),d1 ;height

	move.w MAP_XX1(a2),d0 ;width
	move.w MAP_XX0(a2),d2 ;x
	lsr.w #1,d0
	sub.w d0,d2	;x pos - width/2
	move.w MAP_XX1(a2),d0 ;width

	move.w MAP_YY0(a2),d3 ;y
	sub.w  d1,d3 ; y- height =start y

	move.w screenPointerX,d4
	cmp.w d4,d2					; compare with xx0
	bgt.s .drawAfterCollCheck
	move.w d2,d5
	add.w  d0,d5				; compare with xx1
	cmp.w d4,d5
	blt.s .drawAfterCollCheck
	move.w 2(a5),screenPointer_collision_z
	move.l a1,screenPointer_element

.drawAfterCollCheck
 	bsr ray_drawObject
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
;d0 destination width
;d1 destination height
;d2 source width
;d3 source height
;a1 map
;a2 2d map
;a3 c2p image
ray_scaleObject:
	movem.l    d0-d7/a0-a6,-(sp)  

	lea.l  hvlink__48_80Table,a4
	lea.l  hlink48Table,a5
	move.l MAP_HVLINK(a2),a4
	move.l MAP_HLINK(a2),a5

	move.l #128,d6
	sub.w  d0,d6 ; buffer modulo

	lea.l scaleBuffer,a0
	lea.l scaleMaskBuffer,a1
	
	;lea.l hvlink__48_80Table,a4
	moveq #0,d4
	move.w d1,d4
	lsl.w #2,d4
	adda.l d4,a4
	move.l (a4),a4

	;test
	;lea.l hvline48_32_48,a4
	;test done

	subq.w #1,d1  ; destination scale height -1

	;lea.l  hlink48Table,a5
	lsl.w #2,d0 ; destination width*4
	adda.l d0,a5
	;adda.l #4*32,a5
	move.l (a5),a5
	moveq #0,d0
.loop
	jsr (a5);hline32_32	
	move.b 	(a4)+,d0		;
	add.w d0,a3	; add v line to source image

	add.l d6,a0
	add.l d6,a1

	dbf d1,.loop
	movem.l    (sp)+,d0-d7/a0-a6
	rts

; simple mask copy
;d0 width
;d1 height
;d2 x
;d3 y
ray_drawObject:
	movem.l    d0-d7/a0-a6,-(sp)  

	moveq #0,d7
	move.w d2,d7  ; x->d7
	moveq #0,d4
	

	move.l #160,d6
	mulu  d6,d3
	add.w d3,d2	;calculate screen pos
	
	
	add.w d0,d7		;width+x
	cmp.w #SCREEN_CLIP_X1,d7
	blt.s .noX1Clip
	sub.w #SCREEN_CLIP_X1,d7

	bra.s .clipDone
.noX1Clip:
	sub.w d0,d7		;only x
	cmp.w #SCREEN_CLIP_X0,d7
	bgt.s .noX0Clip
	sub.w #SCREEN_CLIP_X0,d7
	neg.w d7  ; overlapping width
	;sub.w d7,d0  ; correct width
	add.w d7,d2	 ; correct pos on screen buffer
	move.w d7,d4
	bra.s .clipDone
.noX0Clip:
	moveq #0,d7
.clipDone:

	sub.w d0,d6
	move.l #128,d5
	sub.w d0,d5

	;clip:
	sub.w d7,d0
	add.w d7,d5
	add.w d7,d6
	
	move.l buffer,a0
	add.l d2,a0

	lea scaleBuffer,a1
	lea scaleMaskBuffer,a2

	adda.l d4,a1
	adda.l d4,a2
	
	subq.w #1,d0
	subq.w #1,d1
	move.l d0,d4 ;store for loop

.loop
	move.b (a2)+,d2
	not.b d2
	and.b d2,(a0)
	move.b (a1)+,d2
	or.b d2,(a0)+

	;move.b (a1)+,(a0)+
	dbf d0,.loop
	add.l d6,a0
	add.l d5,a1
	add.l d5,a2
	move.w d4,d0
	dbf d1,.loop
	movem.l    (sp)+,d0-d7/a0-a6
	rts

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




scaleBuffer 	ds.b 128*128
scaleMaskBuffer ds.b 128*128

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
