MODE = 2  ; 1= 1x1; 2= 2x2
FLOOR = 1
CEILING = 1
;SKY = 1

;WORD = 1
BLITTER_C2P=1

WALL_TEXTURE_HEIGHT = 80 

SCREEN_SIZE_X:		equ	320
SCREEN_SIZE_Y:		equ	200
SCREEN_BITPLANES:	equ	4

ZOOM_MIN:		equ	1
ZOOM_MAX:		equ	16

INTF_SETCLR	=	1<<15
INTF_INTEN	=	1<<14
INTF_VERTB	=	1<<5

  SECTION    ChipData,  DATA_C

  include    "include/hw.i"
 
  bsr        init                                          ;
  jsr        screen_init
  ifd SKY
    jsr       screen_setGradient
  endif
  jsr sprites_init
 ; bsr screen_swap


  move.w #$7fff,$dff09a ; intena all bit off

  lea VBL_Handler(pc),a1
  move.l a1,$6c.w ; new interrupt - or $6c(a0) with a0=vbrbase
  move.w #$20,$dff09c ; intreq vbi off
  move.w #$20,$dff09c ; twice

  move.w #$c020,$dff09a ; intena bit set and 5 (vbl) 


; d0.w	chunkyx [chunky-pixels]
; d1.w	chunkyy [chunky-pixels]
; d2.w	(scroffsx) [screen-pixels]
; d3.w	scroffsy [screen-pixels]
; d4.w	(rowlen) [bytes] -- offset between one row and the next in a bpl
; d5.l	bplsize [bytes] -- offset between one row in one bpl and the next bpl

  move.w #160,d0
  move.w #100,d1
  move.w #16,d2
  move.w #0,d3
  move.l #screenBuffer_lineSize,d4
 
  move.l #screenBuffer_width_Byte,d5
  ;bsr c2p2x1_cpu4blit1_init



.mouse:	
 
  ;move.w #$FF0,$dff180
  jsr enemies_update
  jsr world3d_move
  jsr world3d_rotate
  jsr world3d_clip3D
  
  ;jsr world3d_doorTest
  
  jsr world3d_calculate2DProjection
  jsr world3d_doorClipping

  ;move.w #$FF0,$dff180

  ;move.w #$0FF,$dff180
  jsr screen_buffer ; only if no floor
  ;move.w #$00F,$dff180

  ifd FLOOR
    jsr ray_drawFloor
  endif
  jsr ray_drawFrame

  jsr screen_buffer2screen 
  jsr screen_swapToNewScreen

  move.w screen_fps,d0
  swap d0
  move.w screen_fps_rest,d0

  move.w global_yAngle,d1
  ifd MODE
    jsr screen_drawFPS
  endif

  bsr joystick_update
  bsr player_update

	btst.b	#6,$bfe001
	bne.s	.mouse

	bra.s	.exit
	
; d0 = Pointer to handle information
	nop
	
.error:	moveq	#-1,d0
	bra	.rts
	
.exit:	moveq	#0,d0
.rts:	rts


WaitEOF:				;wait for end of frame
	bsr	WaitBlitter
	move.w	#312,d0
WaitRaster:				;Wait for scanline d0. Trashes d1.
.l:	move.l 	VPOSR(a5),d1
	lsr.l	#1,d1
	lsr.w	#7,d1
	cmp.w	d0,d1
	bne.s 	.l			;wait until it matches (eq)
	rts

WaitBlitter:				;wait until blitter is finished
	tst.w	(a5)			;for compatibility with A1000
.loop:	btst	#6,2(a5)
	bne.s	.loop
	rts

VBL_Handler:
    movem.l	d0-d7/a0-a6,-(sp)		; Stack
    ;move.w #$fff,$dff180 
    jsr screen_swap
  		; End of interrupt
    move.w #$0020,$dff09c ; Intreq = interrupt processed.
    move.w #$0020,$dff09c ; twice for compatibility

		movem.l	(sp)+,d0-d7/a0-a6		; Stack
		rte
	


vbr_ptr dc.l 0	

	




  include    "./code/const.asm"
  include    "./code/global.asm"
  include    "./code/joystick.asm"
  include    "./code/player.asm"
  include    "./code/enemies.asm"
  
  include    "./code/init.asm"

  ;chipram
  include "./data/c2pByte/sky.asm"
 
  ifd MODE
    ifd WORD 
      include    "./code/c2pWord/screen.asm"	
    else
      include    "./code/c2pByte/screen.asm"
    endif
  else
    include    "./code/c2pByte/screen1x1.asm"	
  endif

  ifd WORD 
    include    "./code/c2pWord/raycaster_c2p.asm"
    include    "./code/c2pWord/ray_vLines_c2p_generated.asm"
    ifd FLOOR
      include    "./code/c2pWord/raycaster_floor_c2p.asm"
    endif
  else
    include    "./code/c2pByte/raycaster_c2p.asm"
    include    "./code/c2pByte/ray_vLines_c2p_generated.asm"
    ifd FLOOR
      include    "./code/c2pByte/raycaster_floor_c2p.asm"
    endif
  endif


 
  SECTION    Data,  DATA
  ; walls abd scaling
  include    "./code/c2pByte/steptables.asm"	
  
  include    "./code/c2pByte/ray_hlines_c2p_scaling_generated.asm"

  SECTION    Data,  DATA

 

  ; world data (3d+textures)
   ifd WORD 
    include    "./data/c2pWord/worldData.asm"
    ifd FLOOR
     include    "./code/c2pWord/ray_floor_generated.asm"
    endif
  else
    ifd BLITTER_C2P
    include    "./data/c2pByte/worldDataByte.asm"
    else
    include    "./data/c2pByte/worldData.asm"
    endif

    ifd FLOOR
     include    "./code/c2pByte/ray_floor_generated.asm"
    endif   
  endif
  

	
	