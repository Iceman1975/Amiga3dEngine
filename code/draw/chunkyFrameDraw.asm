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
	bsr ray_drawTexture
	bra.s .next
.isPoly:
	bsr ray_drawPoly
.next
	;lea MAP_ENTRY_SIZE(a1),a1
	adda.l    #8,a5		; next element in sorted list
	dbf d7,.loop
.done:
	rts



  include	"./code/draw/chunkyWallDraw.asm"
  include   "./code/draw/chunkyBitmapDraw.asm"