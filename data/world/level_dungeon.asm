map_colors:
	dc.w  COLOR00, $0222
	dc.w  COLOR01, $0444
	dc.w  COLOR02, $0620
	dc.w  COLOR03, $0260
	dc.w  COLOR04, $0666
	dc.w  COLOR05, $0940
	dc.w  COLOR06, $0999
	dc.w  COLOR07, $0692
	dc.w  COLOR08, $0b60
	dc.w  COLOR09, $0bbb
	dc.w  COLOR10, $0ddd
	dc.w  COLOR11, $0d90
	dc.w  COLOR12, $0b74
	dc.w  COLOR13, $0452
	dc.w  COLOR14, $0d40
	dc.w  COLOR15, $0a00

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

	dc.w 0,0,160,0,-64,128,160
	dc.w 0,0,160,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	;TOP Level
	;dc.w 0,0,160,0,64,128,160
	;dc.w 0,0,160,0,64,0
	;dc.w 0,0,0
	;dc.l wallImage
	;dc.w 0,0,0,0,0,0,0
	;dc.w 0,0
	;TOP Level-end

	dc.w 0,-160,0,0,-64,128,160
	dc.w 0,-160,0,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0


	
	dc.w 160,-160,0,-160,-64,128,160
	dc.w 160,-160,0,-160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0




	

	dc.w 160,0,320,0,-64,128,160
	dc.w 160,0,320,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 320,-160,160,-160,-64,128,160
	dc.w 320,-160,160,-160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0
;left corner:
	dc.w 320,0,320,160,-64,128,160
	dc.w 320,0,320,160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 320,160,480,160,-64,128,160
	dc.w 320,160,480,160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 480,160,640,160,-64,128,160
	dc.w 480,160,640,160,-64,0
	dc.w 0,0,0
	dc.l doorImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 640,160,640,0,-64,128,160
	dc.w 640,160,640,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 640,0,800,0,-64,128,160
	dc.w 640,0,800,0,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 800,0,800,-160,-64,128,160
	dc.w 800,0,800,-160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 800,-160,640,-160,-64,128,160
	dc.w 800,-160,640,-160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 320,-320,320,-160,-64,128,160
	dc.w 320,-320,320,-160,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 480,-320,320,-320,-64,128,160
	dc.w 480,-320,320,-320,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 640,-320,480,-320,-64,128,160
	dc.w 640,-320,480,-320,-64,0
	dc.w 0,0,0
	dc.l wallImage
	dc.w 0,0,0,0,0,0,0
	dc.w 0,0

	dc.w 640,-160,640,-320,-64,128,160
	dc.w 640,-160,640,-320,-64,0
	dc.w 0,0,0
	dc.l wallImage
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

t1:
	; x,z,blank,blank,height,width 
	dc.w 200,-10,0,0,-10,36,16
	; x,z,blank,blank,y,status
	dc.w 0,0,0,0,-10,0
	;type,clipping_z0,clipping_z1
	dc.w 1,0,0
	dc.l torch
	;x,y,height,width
	dc.w 0,0,0,0,0
	dc.l hlink16Table
	dc.l hvlink__16_36Table

f1:
	; x,z,blank,blank,height,width 
	dc.w 200,-10,0,0,26,36,16
	; x,z,blank,blank,y,status
	dc.w 0,0,0,0,26,0
	;type,clipping_z0,clipping_z1
	dc.w 1,0,0
	dc.l flames
	;x,y,height,width
	dc.w 0,0,0,0,0
	dc.l hlink16Table
	dc.l hvlink__16_36Table

b1:
	; x,z,blank,blank,height,width 
	dc.w 300,-80,0,0,-64,36,32
	; x,z,blank,blank,y,status
	dc.w 0,0,0,0,-64,0
	;type,clipping_z0,clipping_z1
	dc.w 1,0,0
	dc.l barrel
	;x,y,height,width
	dc.w 0,0,0,0,0
	dc.l hlink32Table
	dc.l hvlink__32_36Table