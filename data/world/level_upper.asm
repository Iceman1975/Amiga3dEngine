map_colors:

	dc.w  COLOR00, $0000
	dc.w  COLOR01, $0222
	dc.w  COLOR02, $0eb0
	dc.w  COLOR03, $0d90
	dc.w  COLOR04, $0692
	dc.w  COLOR05, $0260
	dc.w  COLOR06, $0bbb
	dc.w  COLOR07, $0940
	dc.w  COLOR08, $0b60
	dc.w  COLOR09, $0444
	dc.w  COLOR10, $0999
	dc.w  COLOR11, $0ddd
	dc.w  COLOR12, $0666
	dc.w  COLOR13, $0b00
	dc.w  COLOR14, $0533
	dc.w  COLOR15, $0f72



;MAP_X0_INIT = 0
;MAP_Z0_INIT = 2
;MAP_X1_INIT = 4
;MAP_Z1_INIT = 6
;MAP_Y0_INIT = 8
;MAP_HEIGHT  = 10
;MAP_LENGTH  = 12

;MAP_X0 = 14
;MAP_Z0 = 16
;MAP_X1 = 18
;MAP_Z1 = 20
;MAP_Y0 = 22

;MAP_STATUS  = 24
;MAP_TYPE  = 26
;MAP_Z0_CLIPPING =28
;MAP_Z1_CLIPPING =30

;MAP_IMAGE = 32

map:
	dc.w 480,160,320,160,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 320,160,196,60,-64,128,159
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 606,60,480,160,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 196,60,196,-100,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 606,-100,606,60,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 196,-100,320,-202,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 320,-202,480,-202,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 479,-202,606,-101,-64,128,162
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 390,-463,464,-428,-64,60,81
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l doorImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 429,-354,355,-389,-64,60,81
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l doorImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 355,-389,389,-462,-64,60,80
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l doorImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 464,-428,430,-355,-64,60,80
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l doorImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 320,307,480,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 0,307,160,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 160,307,320,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 480,307,640,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 640,307,800,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 800,307,960,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 6,-656,6,-496,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 6,147,6,307,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 6,-14,6,146,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 6,-175,6,-15,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 6,-335,6,-175,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 6,-495,6,-335,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 966,-657,806,-657,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 166,-657,6,-657,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 327,-657,167,-657,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 485,-657,325,-657,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 645,-657,485,-657,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 805,-657,645,-657,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 960,308,960,148,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 960,-496,960,-656,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 960,148,960,-12,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 960,-12,960,-172,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 960,-172,960,-332,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 960,-342,960,-502,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l fence
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0





enemy_data:
	; x,z,blank,blank,height,width 
	dc.w 480,0,128,0,-64,96,64
	; x,z,blank,blank,y,status
	dc.w 0,0,0,0,-64,0
	;type,clipping_z0,clipping_z1
	dc.w 1,0,0
	dc.l enemyType0
	;x,y,height,width
	dc.w 0,0,0,0,0
	dc.l hlink48Table
	dc.l hvlink__48_80Table

