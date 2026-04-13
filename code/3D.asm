

global_x dc.w 85
global_z dc.w 240

global_yAngle dc.w 0;(360*2)-(PLAYER_ANGLE_SPEED*2*2);0;540 ; increase/decrease by 2; one step=10 degree

old_global_x dc.w 80
old_global_z dc.w 80

old_global_yAngle dc.w 0

;xSpeed = Math.cos(direction) * speed;
;zSpeed = Math.sin(direction) * speed;
; d1 = speed
world3d_movePlayer:
    lea SinusTable,a2
    lea CosinusTable,a3
    
    moveq   #0,d4
    moveq   #0,d6
    moveq   #0,d0
    move.w global_yAngle,d0
    
    move.w  (a3,d0),d4  ;cos(aY)
    move.w  (a2,d0),d6  ;sin(aY)

    move.l d1,d2
    muls    d4,d1	;cos*speed
    lsr.l   #7,d1
    lsr.l   #7,d1
    muls    d6,d2	;sin*speed
    lsr.l   #7,d2
    lsr.l   #7,d2
    sub.w d1,global_z
    sub.w d2,global_x

    rts

world3d_storePos:
    move.w global_x,old_global_x
    move.w global_z,old_global_z
    move.w global_yAngle,old_global_yAngle
    rts


world3D_restorePos:
    move.w old_global_x,global_x
    move.w old_global_z,global_z
    move.w old_global_yAngle,global_yAngle
    rts

world3d_doAll:
    move.l currentLevel,a1
    move.w 4(a1),d7
	move.l  (a1),a1
    bsr world3d_move

    move.l currentLevel,a1
    move.w 4(a1),d7
	move.l  (a1),a1
    bsr world3d_rotate


    move.l currentLevel,a1
    move.w 4(a1),d7
	move.l  (a1),a1
    bsr world3d_clip3D



    move.w #0,collision_wall
    ;move.w #$000,$dff180

    move.l currentLevel,a0
    move.w 4(a0),d7
	move.l  (a0),a0
    bsr world3d_calculate2DProjection

    move.w collision_wall,d0
    beq.s .noColl
    bsr world3D_restorePos
    bra.s world3d_doAll
    ;move.w #$00f,$dff180
.noColl

    rts

    ;set world position based on global_x and global_z    
world3d_move:

	;moveq #NO_WALLS-1,d7
.loop
    cmp.w #1,MAP_TYPE(a1)
    beq.s .bitmap
    cmp.w #2,MAP_TYPE(a1)
    beq.s .poly
    cmp.w #3,MAP_TYPE(a1)
    beq.s .poly
.wall
	move.w MAP_X0_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X0(a1)

	move.w MAP_X1_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X1(a1)

	move.w MAP_Z0_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z0(a1)

	move.w MAP_Z1_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z1(a1)
    bra .next

.bitmap
	move.w MAP_X0_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X0(a1)

	move.w MAP_Z0_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z0(a1)

    bra.s .next
.poly:
 	move.w MAP_X0_POLY_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X0_POLY(a1)

	move.w MAP_Z0_POLY_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z0_POLY(a1)

 	move.w MAP_X1_POLY_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X1_POLY(a1)

	move.w MAP_Z1_POLY_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z1_POLY(a1)

 	move.w MAP_X2_POLY_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X2_POLY(a1)

	move.w MAP_Z2_POLY_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z2_POLY(a1)

 	move.w MAP_X3_POLY_INIT(a1),d0
	sub.w global_x,d0
	move.w d0,MAP_X3_POLY(a1)

	move.w MAP_Z3_POLY_INIT(a1),d0
	add.w global_z,d0
	move.w d0,MAP_Z3_POLY(a1)

    move.w MAP_Y0_POLY_INIT(a1),MAP_Y0_POLY(a1)
    move.w MAP_Y1_POLY_INIT(a1),MAP_Y1_POLY(a1)
    move.w MAP_Y2_POLY_INIT(a1),MAP_Y2_POLY(a1)
    move.w MAP_Y3_POLY_INIT(a1),MAP_Y3_POLY(a1)

.next:  
    lea MAP_ENTRY_SIZE(a1),a1
	dbf d7,.loop

	rts

world3d_rotate:
    move.w global_yAngle,d0

    lea CosinusTable,A2
    lea SinusTable,A3
.loop
    cmp.w #1,MAP_TYPE(a1)
    beq.s .bitmap
    cmp.w #2,MAP_TYPE(a1)
    beq.s .poly
    cmp.w #3,MAP_TYPE(a1)
    beq.s .poly
.wall:
    move.w MAP_X0(a1),d5
    move.w MAP_Z0(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X0(a1)
    move.w d1,MAP_Z0(a1)

    move.w MAP_X1(a1),d5
    move.w MAP_Z1(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X1(a1)
    move.w d1,MAP_Z1(a1)
    bra .next
    
.bitmap:
    move.w MAP_X0(a1),d5
    move.w MAP_Z0(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X0(a1)
    move.w d1,MAP_Z0(a1)
    bra .next

.poly:
    move.w MAP_X0_POLY(a1),d5
    move.w MAP_Z0_POLY(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X0_POLY(a1)
    move.w d1,MAP_Z0_POLY(a1)

    move.w MAP_X1_POLY(a1),d5
    move.w MAP_Z1_POLY(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X1_POLY(a1)
    move.w d1,MAP_Z1_POLY(a1)

    move.w MAP_X2_POLY(a1),d5
    move.w MAP_Z2_POLY(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X2_POLY(a1)
    move.w d1,MAP_Z2_POLY(a1)

    move.w MAP_X3_POLY(a1),d5
    move.w MAP_Z3_POLY(a1),d3
    bsr world3d_internalRotate
    move.w d4,MAP_X3_POLY(a1)
    move.w d1,MAP_Z3_POLY(a1)
.next:
    lea MAP_ENTRY_SIZE(a1),a1
	dbf d7,.loop
    rts

world3d_internalRotate:
    ;rotation axe Y (plan ZX)   ;d6=cos(A5), d4=sin(A5)
    ;z'=z*cos(aY)-x*sin(aY)   ,d1=d6, d1=d3*d1, d2=d4, d2=d5*d2, d1=d1-d2 
    ;x'=z*sin(aY)+x*cos(aY)   ;d6=d5*d6, d4=d3*d4, d4=d6+d4
    moveq   #0,d4
    moveq   #0,d6
    
    move.w  (a2,d0),d6  ;cos(aY)
    move.w  (a3,d0),d4  ;sin(aY)
    
    move.w  d6,d1
    move.w  d4,d2
    
    muls    d3,d1	;z1*cos
    muls    d5,d2	;x1*sin
    sub.l   d2,d1   ;z2=z1*cos-x1*sin
    lsr.l   #7,d1
    lsr.l   #7,d1
    
    muls    d3,d4	;z1*sin
    muls    d5,d6	;x1*cos
    add.l   d6,d4   ;x2=x1*cos+z1*sin
    lsr.l   #7,d4
    lsr.l   #7,d4
    rts

    ;all walls outside POV are flagged 0; z-clipping is done
world3d_clip3D:
.loop
    move.w #1,MAP_STATUS(a1) 
    cmp.w #2,MAP_TYPE(a1)
    beq .next   ; not skip, do next
    cmp.w #3,MAP_TYPE(a1)
    beq .next   ; not skip, do next    
    move.w #0,(MAP_POINTER2D+MAP_ISCLIPPED)(a1)
    move.w #0,MAP_STATUS(a1) 
.skip:
    cmp.w #Z_CLIPPING,MAP_Z0(a1)
    bgt.s .isIn

.checkZ1
    cmp.w #1,MAP_TYPE(a1) ; if no wall, done
    beq .next

    cmp.w #Z_CLIPPING,MAP_Z1(a1)
    ble .next                     ; ok; z0 and z1 >clip layer

    ;wall is in; Clipping needed?
.isIn
    cmp.w #Z_CLIPPING,MAP_Z0(a1)
    bgt.s .noZ0clip

    ;set length
    move.w MAP_LENGTH(a1),MAP_Z0_CLIPPING(a1)

    ;x0	 - d0.w
	;x1	 - d1.w
	;y0	 - d2.w
	;y1	 - d3.w
	;x   - d4.w
	;-> res d3.w
    move.w MAP_Z0(a1),d0
    move.w MAP_Z1(a1),d1
    move.w MAP_X0(a1),d2
    move.w MAP_X1(a1),d3
    move.w #Z_CLIPPING,d4
    cmp.w d0,d1
    bne.s .doClipZ0
    move.w MAP_X0(a1),d3 ;if z0=z1 -> x0 is unchanged
    move.w #0,MAP_Z0_CLIPPING(a1)
    bra.s .setZ0
.doClipZ0:
    bsr world3d_clipLine


.setZ0
    move.w #Z_CLIPPING,MAP_Z0(a1)
    move.w d3,MAP_X0(a1)

    tst.w MAP_Z0_CLIPPING(a1)   ; clipping?
    beq.s .noZ0clip

    ;if clippling calculate length again
	;x0	 - d0.w
	;x1	 - d1.w
	;z0	 - d2.w
	;z1	 - d3.w
    ;-> res d3.w
    move.w MAP_X0(a1),d0
    move.w MAP_X1(a1),d1
    move.w MAP_Z0(a1),d2
    move.w MAP_Z1(a1),d3
    bsr world3d_lineLength
    lsl.w #7,d3 ; *128
    move.w MAP_Z0_CLIPPING(a1),d1   ;store length in d1
    divu MAP_Z0_CLIPPING(a1),d3     ; shorten length/length
    move.w MAP_LENGTH(a1),d0
    sub.w d3,d0
    mulu d1,d0
    lsr.w #7,d0
    move.w d0,MAP_Z0_CLIPPING(a1)


.noZ0clip
    cmp.w #Z_CLIPPING,MAP_Z1(a1)
    bgt.s .noClip

    ;set length
	
    move.w MAP_LENGTH(a1),MAP_Z1_CLIPPING(a1)
    ;x0	 - d0.w
	;x1	 - d1.w
	;y0	 - d2.w
	;y1	 - d3.w
	;x   - d4.w
	;-> res d3.w
    move.w MAP_Z0(a1),d0
    move.w MAP_Z1(a1),d1
    move.w MAP_X0(a1),d2
    move.w MAP_X1(a1),d3
    move.w #Z_CLIPPING,d4
    cmp.w d0,d1
    bne.s .doClipZ1
    move.w MAP_X1(a1),d3 ;if z0=z1 -> x0 is unchanged
    move.w #0,MAP_Z1_CLIPPING(a1)
    bra.s .setZ1
.doClipZ1:
    bsr world3d_clipLine
.setZ1
    move.w #Z_CLIPPING,MAP_Z1(a1)
    move.w d3,MAP_X1(a1)    
    
    tst.w MAP_Z1_CLIPPING(a1)   ; clipping?
    beq.s .noClip

    ;if clippling calculate length again
	;x0	 - d0.w
	;x1	 - d1.w
	;z0	 - d2.w
	;z1	 - d3.w
    ;-> res d3.w
    move.w MAP_X0(a1),d0
    move.w MAP_X1(a1),d1
    move.w MAP_Z0(a1),d2
    move.w MAP_Z1(a1),d3
    bsr world3d_lineLength

    lsl.w #7,d3 ; *128
    move.w MAP_Z1_CLIPPING(a1),d1   ;store length in d1
    divu MAP_Z1_CLIPPING(a1),d3     ; shorten length/length
    move.w MAP_LENGTH(a1),d0
    sub.w d3,d0
    mulu d1,d0
    lsr.w #7,d0
    move.w d0,MAP_Z1_CLIPPING(a1)

.noClip    
    move.w #1,MAP_STATUS(a1) 
.next
   	lea MAP_ENTRY_SIZE(a1),a1
	dbf d7,.loop 
    rts


world3d_calculate2DProjection:
    bsr object_resetPointer

.loop
    cmp.w #0,MAP_STATUS(a0)  ; is alreay  0 -> skip because out of sight
    beq .next
    cmp.w  #2,MAP_TYPE(a0)
    beq.s .isPoly
    cmp.w  #3,MAP_TYPE(a0)
    beq.s .isPoly
    cmp.w  #1,MAP_TYPE(a0)
    beq.s .isBitmap
    bsr _world3d_calculate2DProjection_wall
    bra.s .next
.isBitmap
    bsr _world3d_calculate2DProjection_bitmap
    bra.s .next
.isPoly:
    bsr _world3d_calculate2DProjection_poly
    ;drawWall(g,xx0,yy0,(yy0-yy2)  ,xx1,yy1,(yy1-yy3));
.next
	lea MAP_ENTRY_SIZE(a0),a0
	dbf d7,.loop

	rts


_world3d_calculate2DProjection_wall:
	move.w #0,MAP_STATUS(a0)
	lea MAP_POINTER2D(a0),a1
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
    move.w #PFR,d2
	
	        ;int xx0=(PFR*(wall.x0)/((wall.z0)+PFR))+centerX;

	move.w MAP_X0(a0),d0 	; x0
	move.w MAP_Z0(a0),d1 ; z0

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0

	;res:
	move.w d0,MAP_XX0(a1)

	cmp.w #SCREEN_CLIP_X1,d0
	bgt .next

			;int xx1=(PFR*(wall.x1)/((wall.z1)+PFR))+centerX;
	move.w MAP_X1(a0),d0 	; x1
	move.w MAP_Z1(a0),d1 	; z1

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0

	;res:
	move.w d0,MAP_XX1(a1)

	cmp.w #SCREEN_CLIP_X0,d0
	blt .next

	;do check
	;move.w MAP_XX1(a1),d0
	sub.w MAP_XX0(a1),d0
	cmp.w #1,d0
	ble .next
	move.w #1,MAP_STATUS(a0)

    moveq #0,d0
    move.w MAP_Z0(a0),d0    ;set sort value
    cmp.w MAP_Z1(a0),d0
    bge.s .addPointer
    move.w MAP_Z1(a0),d0
.addPointer:    
    bsr object_addPointer
	;check done

        	;int yy0=-(PFR*(wall.ystart)/((wall.z0)+PFR))+centerY;
	move.w MAP_Y0(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z0(a0),d1 	; z0

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0

	;res:
	move.w d0,MAP_YY0(a1)

        	;int yy2=-(PFR*((wall.ystart+wall.height))/((wall.z0)+PFR))+centerY;
	move.w MAP_Y0(a0),d0 	; ystart
	add.w  MAP_HEIGHT(a0),d0
	neg.w d0
	move.w MAP_Z0(a0),d1 	; z0
	;move.w #PFR,d2

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0

	;res:
	sub.w  MAP_YY0(a1),d0
	neg.w d0
	move.w d0,MAP_HEIGHT0(a1)

        	
        	;int yy1=-(PFR*((wall.ystart))/((wall.z1)+PFR))+centerY;

	move.w MAP_Y0(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z1(a0),d1 	; z1

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0

	;res:
	move.w d0,MAP_YY1(a1)
	

        	;int yy3=-(PFR*(((wall.ystart+wall.height)))/((wall.z1)+PFR))+centerY;
	move.w MAP_Y0(a0),d0 	; ystart
	add.w  MAP_HEIGHT(a0),d0
	neg.w d0
	move.w MAP_Z1(a0),d1 	; z1
	;move.w #PFR,d2

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0

	;res:
	sub.w  MAP_YY1(a1),d0
	neg.w d0
	move.w d0,MAP_HEIGHT1(a1)
.next:
    tst.w MAP_STATUS(a0)
    beq.s .done 

    tst.w MAP_ISCLIPPED(a1)
    beq.s .done             ;no clipping=no coll

    tst.w MAP_XX0(a1)         ;clipping on screen
    blt.s .checkXX1         ;not XX0
    move.w MAP_Z0(a0),d6
    tst.w MAP_Z0(a0)
    beq.s .coll

 .checkXX1:
    cmp.w #159,MAP_XX1(a1)         ;clipping on screen
    bgt.s .done         ;not XX1
    tst.w MAP_Z1(a0)
    beq.s .coll
    bra.s .done
.coll
    move.w #1,collision_wall
.done
    rts


_world3d_calculate2DProjection_bitmap:
	move.w #0,MAP_STATUS(a0)
	lea MAP_POINTER2D(a0),a1
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
    move.w #PFR,d2
	
	        ;int xx0=(PFR*(wall.x0)/((wall.z0)+PFR))+centerX;

	move.w MAP_X0(a0),d0 	; x0
	move.w MAP_Z0(a0),d1 ; z0

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0

	;res:
	move.w d0,MAP_XX0(a1)


        	;int yy0=-(PFR*(wall.ystart)/((wall.z0)+PFR))+centerY;
	move.w MAP_Y0(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z0(a0),d1 	; z0

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0

	;res:
	move.w d0,MAP_YY0(a1)


        	;int height=(PFR*((wall.height))/((wall.z0)+PFR));
	move.w MAP_HEIGHT(a0),d0
	move.w MAP_Z0(a0),d1 	; z0

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit

	;res:
	move.w d0,MAP_YY1(a1)

        	
        	;int width=(PFR*((wall.length))/((wall.z1)+PFR));

	move.w MAP_LENGTH(a0),d0 	; width
	move.w MAP_Z0(a0),d1 	; z0

	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	;res:
	move.w d0,MAP_XX1(a1)

    lsr.w #1,d0 ; width/2
    move.w MAP_XX0(a1),d1
    move.w d1,d2
    add.w d0,d1
    cmp.w #SCREEN_CLIP_X0,d1
    ble.s .next
    sub.w d0,d2
    ;move.w MAP_XX0(a1),d1
    cmp.w #SCREEN_CLIP_X1,d2
    bge.s .next
	
   	move.w #1,MAP_STATUS(a0)

    ;a0 pointer to object
    ;d0 z-sort value
    moveq #0,d0
    move.w MAP_Z0(a0),d0
    bsr object_addPointer

.next:
    rts


_world3d_calculate2DProjection_poly:
	move.w #0,MAP_STATUS(a0)

	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
    move.w #PFR,d2
	
	        ;int xx0=(PFR*(wall.x0)/((wall.z0)+PFR))+centerX;

	move.w MAP_X0_POLY(a0),d0 	; x0
	move.w MAP_Z0_POLY(a0),d1 ; z0
    move.w d1,d3
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
    beq .next
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0
	move.w d0,MAP_XX0_POLY(a0)

	move.w MAP_X1_POLY(a0),d0 	; x0
	move.w MAP_Z1_POLY(a0),d1 ; z0

    cmp.w d1,d3
    bge.s .toX2
    move.w d1,d3
.toX2:
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
    beq .next
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0
	move.w d0,MAP_XX1_POLY(a0)

	move.w MAP_X2_POLY(a0),d0 	; x0
	move.w MAP_Z2_POLY(a0),d1 ; z0
    cmp.w d1,d3
    bge.s .toX3
    move.w d1,d3
.toX3:
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
    beq .next
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0
	move.w d0,MAP_XX2_POLY(a0)

	move.w MAP_X3_POLY(a0),d0 	; x0
	move.w MAP_Z3_POLY(a0),d1 ; z0

    cmp.w d1,d3
    bge.s .toX4
    move.w d1,d3
.toX4:
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
    beq .next
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_X,d0
	move.w d0,MAP_XX3_POLY(a0)

    ; calc YY
	move.w MAP_Y0_POLY(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z0_POLY(a0),d1 	; z0
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0
	move.w d0,MAP_YY0_POLY(a0)

	move.w MAP_Y1_POLY(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z1_POLY(a0),d1 	; z0
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0
	move.w d0,MAP_YY1_POLY(a0)

    move.w MAP_Y2_POLY(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z2_POLY(a0),d1 	; z0
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0
	move.w d0,MAP_YY2_POLY(a0)

    move.w MAP_Y3_POLY(a0),d0 	; ystart
	neg.w d0
	move.w MAP_Z3_POLY(a0),d1 	; z0
	muls d2,d0 ; check if result 32 bit
	add.w #PFR_DIV,d1
	divs d1,d0 ; check if 32 bit
	add.w #CENTER_Y,d0
	move.w d0,MAP_YY3_POLY(a0)

    tst.w d3
    ble .next   ; z<0 skip

    ; more clipping here

	move.w #1,MAP_STATUS(a0)

    moveq #0,d0
    move.w d3,d0    ;set sort value
  
    bsr object_addPointer
	;check done

  
.next:
    tst.w MAP_STATUS(a0)
    beq.s .done 

    ;tst.w MAP_ISCLIPPED(a1)
    ;beq.s .done             ;no clipping=no coll


.done
    rts



	;x0	 - d0.w
	;x1	 - d1.w
	;y0	 - d2.w
	;y1	 - d3.w
	;x   - d4.w
	;-> res d3.w
world3d_clipLine:
    move.w #1,(MAP_POINTER2D+MAP_ISCLIPPED)(a1)
  	;(((x-x0)*(y1-y0))/(x1-x0))+y0
    sub.w d0,d4  ;(x-x0)
	sub.w d0,d1  ;(x1-x0)
	sub.w d2,d3  ;(y1-y0)
	muls d4,d3
	divs d1,d3
	add d2,d3
	rts




; simple length; works only for 90 degree walls
	;x0	 - d0.w
	;x1	 - d1.w
	;z0	 - d2.w
	;z1	 - d3.w
    ;-> res d3.w
world3d_lineLength:
    sub.w d2,d3
    beq.s .xlenght  ;z1-z0 = 0
    bgt.s .done
    neg.w d3  ; <0 do absolut |d3|
    bra.s .done
.xlenght:
    move.w d0,d3
    sub.w d1,d3
    bgt.s .done
    neg.w d3  ; <0 do absolut |d3|
.done:
    rts

world3d_doorTest:
    ;move.l  currrentMap,a0
    move.l  currentLevel,a0
    move.l (a0),a0
    sub.w #16,MAP_X1_INIT(a0)
    tst.w MAP_X1_INIT(a0)
    bne.s .done
    move.w #160,MAP_X1_INIT(a0)
.done:
    rts


world3d_doorClipping:
    ;move.l  currrentMap,a1
    move.l  currentLevel,a1
    move.l (a1),a1

    move.w #0,MAP_Z0_CLIPPING(a1)
    

    move.w MAP_X0_INIT(a1),d0
    move.w MAP_X1_INIT(a1),d1
    move.w MAP_Z0_INIT(a1),d2
    move.w MAP_Z1_INIT(a1),d3
    bsr world3d_lineLength
    cmp.w MAP_LENGTH(a1),d3   ;still closed?
    beq.s .done
  
    lea MAP_POINTER2D(a1),a2
    moveq #0,d0
    move.w MAP_XX1(a2),d0
    sub.w MAP_XX0(a2),d0
    move.w d0,d2    ; 2D lenght
    
    move.w MAP_LENGTH(a1),d1   ;initial length in d1
    lsl.w #7,d1 ; *128
    divu d3,d1     ; length/shorten length

    mulu   d1,d0
 
    lsr.w #7,d0
    sub.w d2,d0
 
    move.w d0,MAP_CLIP_DOOR(a2)
.done
    rts

    include    "./code/game/objects.asm"

SinusTable:
   dc.w   0,285,571,857,1142,1427,1712,1996,2280,2563   ;Sin(0) ou Cos(-90)
   dc.w   2845,3126,3406,3685,3963,4240,4516,4790,5062,5334   ;Sin(10) ou Cos(-80)
   dc.w   5603,5871,6137,6401,6663,6924,7182,7438,7691,7943   ;Sin(20) ou Cos(-70)
   dc.w   8191,8438,8682,8923,9161,9397,9630,9860,10086,10310   ;Sin(30) ou Cos(-60)
   dc.w   10531,10748,10963,11173,11381,11585,11785,11982,12175,12365   ;Sin(40) ou Cos(-50)
   dc.w   12550,12732,12910,13084,13254,13420,13582,13740,13894,14043   ;Sin(50) ou Cos(-40)
   dc.w   14188,14329,14466,14598,14725,14848,14967,15081,15190,15295   ;Sin(60) ou Cos(-30)
   dc.w   15395,15491,15582,15668,15749,15825,15897,15964,16025,16082   ;Sin(70) ou Cos(-20)
   dc.w   16135,16182,16224,16261,16294,16321,16344,16361,16374,16381   ;Sin(80) ou Cos(-10)
CosinusTable:
   dc.w   16384,16381,16374,16361,16344,16321,16294,16261,16224,16182   ;Sin(90) ou Cos(0)
   dc.w   16135,16082,16025,15964,15897,15825,15749,15668,15582,15491   ;Sin(100) ou Cos(10)
   dc.w   15395,15295,15190,15081,14967,14848,14725,14598,14466,14329   ;Sin(110) ou Cos(20)
   dc.w   14188,14043,13894,13740,13582,13420,13254,13084,12910,12732   ;Sin(120) ou Cos(30)
   dc.w   12550,12365,12175,11982,11785,11585,11381,11173,10963,10748   ;Sin(130) ou Cos(40)
   dc.w   10531,10310,10086,9860,9630,9397,9161,8923,8682,8438   ;Sin(140) ou Cos(50)
   dc.w   8191,7943,7691,7438,7182,6924,6663,6401,6137,5871   ;Sin(150) ou Cos(60)
   dc.w   5603,5334,5062,4790,4516,4240,3963,3685,3406,3126   ;Sin(160) ou Cos(70)
   dc.w   2845,2563,2280,1996,1712,1427,1142,857,571,285   ;Sin(170) ou Cos(80)
   dc.w   0,-286,-572,-858,-1143,-1428,-1713,-1997,-2281,-2564   ;Sin(180) ou Cos(90)
   dc.w   -2846,-3127,-3407,-3686,-3964,-4241,-4517,-4791,-5063,-5335   ;Sin(190) ou Cos(100)
   dc.w   -5604,-5872,-6138,-6402,-6664,-6925,-7183,-7439,-7692,-7944   ;Sin(200) ou Cos(110)
   dc.w   -8193,-8439,-8683,-8924,-9162,-9398,-9631,-9861,-10087,-10311   ;Sin(210) ou Cos(120)
   dc.w   -10532,-10749,-10964,-11174,-11382,-11586,-11786,-11983,-12176,-12366   ;Sin(220) ou Cos(130)
   dc.w   -12551,-12733,-12911,-13085,-13255,-13421,-13583,-13741,-13895,-14044   ;Sin(230) ou Cos(140)
   dc.w   -14189,-14330,-14467,-14599,-14726,-14849,-14968,-15082,-15191,-15296   ;Sin(240) ou Cos(150)
   dc.w   -15396,-15492,-15583,-15669,-15750,-15826,-15898,-15965,-16026,-16083   ;Sin(250) ou Cos(160)
   dc.w   -16136,-16183,-16225,-16262,-16295,-16322,-16345,-16362,-16375,-16382   ;Sin(260) ou Cos(170)
   dc.w   -16384,-16382,-16375,-16362,-16345,-16322,-16295,-16262,-16225,-16183   ;Sin(270) ou Cos(180)
   dc.w   -16136,-16083,-16026,-15965,-15898,-15826,-15750,-15669,-15583,-15492   ;Sin(280) ou Cos(190)
   dc.w   -15396,-15296,-15191,-15082,-14968,-14849,-14726,-14599,-14467,-14330   ;Sin(290) ou Cos(200)
   dc.w   -14189,-14044,-13895,-13741,-13583,-13421,-13255,-13085,-12911,-12733   ;Sin(300) ou Cos(210)
   dc.w   -12551,-12366,-12176,-11983,-11786,-11586,-11382,-11174,-10964,-10749   ;Sin(310) ou Cos(220)
   dc.w   -10532,-10311,-10087,-9861,-9631,-9398,-9162,-8924,-8683,-8439   ;Sin(320) ou Cos(230)
   dc.w   -8193,-7944,-7692,-7439,-7183,-6925,-6664,-6402,-6138,-5872   ;Sin(330) ou Cos(240)
   dc.w   -5604,-5335,-5063,-4791,-4517,-4241,-3964,-3686,-3407,-3127   ;Sin(340) ou Cos(250)
   dc.w   -2846,-2564,-2281,-1997,-1713,-1428,-1143,-858,-572,-286   ;Sin(350) ou Cos(260)
   dc.w   -1,285,571,857,1142,1427,1712,1996,2280,2563   ;Sin(360) ou Cos(270)
   dc.w   2845,3126,3406,3685,3963,4240,4516,4790,5062,5334   ;Sin(370) ou Cos(280)
   dc.w   5603,5871,6137,6401,6663,6924,7182,7438,7691,7943   ;Sin(380) ou Cos(290)
   dc.w   8191,8438,8682,8923,9161,9397,9630,9860,10086,10310   ;Sin(390) ou Cos(300)
   dc.w   10531,10748,10963,11173,11381,11585,11785,11982,12175,12365   ;Sin(400) ou Cos(310)
   dc.w   12550,12732,12910,13084,13254,13420,13582,13740,13894,14043   ;Sin(410) ou Cos(320)
   dc.w   14188,14329,14466,14598,14725,14848,14967,15081,15190,15295   ;Sin(420) ou Cos(330)
   dc.w   15395,15491,15582,15668,15749,15825,15897,15964,16025,16082   ;Sin(430) ou Cos(340)
   dc.w   16135,16182,16224,16261,16294,16321,16344,16361,16374,16381   ;Sin(440) ou Cos(350)