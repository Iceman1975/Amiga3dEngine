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

scaleBuffer 	ds.b 128*128
scaleMaskBuffer ds.b 128*128