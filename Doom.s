  incdir  "include/"

MODE = 1  ; 1= 1x1; 2= 2x2
;FLOOR = 1
;CEILING = 1 ; ceilling or sky


BLITTER_C2P=1

WALL_TEXTURE_HEIGHT = 80 

;SCREEN_SIZE_X:		equ	320
;SCREEN_SIZE_Y:		equ	200
;SCREEN_BITPLANES:	equ	4

;ZOOM_MIN:		equ	1
;ZOOM_MAX:		equ	16

INTF_SETCLR	=	1<<15
INTF_INTEN	=	1<<14
INTF_VERTB	=	1<<5

  SECTION    ChipData,  DATA_C

  include    "include/hw.i"
 
start:
  jsr dos_init

  lea.l test,a0
  move.l a0,currentLevel

  jsr init_level

  jsr dos_loadFloorLib
  ;jsr dos_writeText
;.s 	btst.b	#6,$bfe001
;	bne.s	.s

  bsr        init                                          ;
  jsr        screen_init

  jsr sprites_init

  
.gameLoop:	
 
  ;move.w #$FF0,$dff180
  ;jsr enemies_update

  jsr animations_update
  jsr enemies_update

  jsr world3d_doAll
  jsr sound_cleanup
 
  
  ;jsr world3d_doorTest 
  ;jsr world3d_doorClipping

  ifd FLOOR
    jsr ray_drawFloor  
  else
    jsr screen_buffer
  endif
  jsr ray_drawFrame

  jsr sound_prepare
  jsr screen_buffer2screen 
  jsr screen_swapToNewScreen

  move.w screen_fps,d0
  swap d0
  move.w screen_fps_rest,d0

  move.w global_yAngle,d1
  ifd MODE
    jsr screen_drawFPS
  endif


  bsr world3d_storePos
  bsr joystick_update
  bsr player_update
  jsr sound_update

	;btst.b	#6,$bfe001
	;bne.s	.mouse
  bra.s .gameLoop


	bra.s	.exit
	
; d0 = Pointer to handle information
	nop
	
.error:	moveq	#-1,d0
	bra	.rts
	
.exit:	moveq	#0,d0
.rts:	rts



  include    "./code/const.asm"
  include    "./code/global.asm"
  include    "./code/joystick.asm"
  include    "./code/player.asm"

  include    "./data/level.asm"
  include    "./code/enemies.asm"
  include    "./code/animations.asm"
  
  include    "./code/init.asm"
  include    "./code/dos.asm"

  include   "./data/Amiga_CM_sound_data.asm"
  include   "./data/Amiga_FM_sound_config.asm"
  include   "./code/sound.asm"
  include   "./code/chunkyPolyTextureDraw.asm"
  include   "./code/chunkyPolyDraw.asm"
  ifd MODE
      include    "./code/c2pByte/screen.asm"
  else
    include    "./code/c2pByte/screen1x1.asm"	
  endif


    include    "./code/c2pByte/raycaster_c2p.asm"
    include    "./code/c2pByte/ray_vLines_c2p_generated.asm"
    include    "./code/c2pByte/raycaster_floor_c2p.asm"


 
  SECTION    Data,  DATA
  ; walls abd scaling
  include    "./code/c2pByte/steptables.asm"	
  include    "./code/c2pByte/ray_hlines_c2p_scaling_generated.asm"
  include    "./code/c2pByte/ray_floor_generated_raw.asm"
    

  include    "./data/demo/upper.asm"
  include    "./data/demo/dungeon0.asm"
  include    "./data/demo/castle.asm"
  include    "./data/demo/test.asm"


   
  

	
	