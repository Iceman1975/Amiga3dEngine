
screen_width                  = 320
screen_height                 = 256
screen_bitplanesize           = (screen_width/8)*screen_height

screen_bitplanesizeGame           = (screen_width/8)*100


screen_colorDepth             = 4
screenBuffer_width            = screen_width
screenBuffer_height           = screen_height
screenBuffer_bitplanesize     = (screenBuffer_width/8)*screenBuffer_height
screenBuffer_size             = screenBuffer_bitplanesize*screen_colorDepth

screen_size                   = (screenBuffer_width/8)*100*screen_colorDepth

    ifnd BLITTER_C2P 
screenBuffer_modulo           = (screenBuffer_width_Byte*4)-(screen_width/8)-2
screenBuffer_modulo_repeat    =  -(screen_width/8)-2
    else
screenBuffer_modulo           = -2
screenBuffer_modulo_repeat    =  -(screen_width/8)-2
    endif

screenBuffer_width_Byte       = screenBuffer_width/8
screenBuffer_lineSize         = screenBuffer_width_Byte*screen_colorDepth

GAME_SCREEN_HEIGHT            = 90 ; because of scanline doubling

SCREEN_CLIP_X0 = 0
SCREEN_CLIP_Y0 = 0
SCREEN_CLIP_X1 = 160
SCREEN_CLIP_Y1 = 200

Z_CLIPPING = 0

CENTER_X	=	80
CENTER_Y	=	50
PFR 		= 	128  ;64
PFR_DIV		= 	128
PFR_IN_SHIFTS = 8

PLAYER_SPEED = 16
PLAYER_ANGLE_SPEED = 15 ; degree

NO_WALLS = 17