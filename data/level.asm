 currentLevel:
        dc.l upper



level0:     
        dc.l    upper_map ; pointer
        dc.w    37-1  ; size-1
        dc.w    0   ;sky flag
        dc.w    0   ;floor flag
        dc.l    upper_map_colors ; pointer to colors
        dc.l    0; pointer to gradient 



upper
	dc.l    upper_map ;		0|  pointer
	dc.w    38  ; 				4| size-1
	dc.w    1		; 6| sky flag
	dc.w    1		;8| floor flag
	dc.l    upper_map_colors ; 	10| pointer to colors
	dc.l    upper_gradient;	14| pointer to gradient
	dc.l     fileSkyupper;	18 | 
	dc.l    fileImagesupper;				22| 
	dc.l    fileFloorupper;				26| 
	dc.l    53632;		30| 
	dc.w    85		;		34| player start x
	dc.w    85		;		36| player start z
	dc.w    360		;		38| player start yAngle
	dc.l    0		;		40|animation pointer
	dc.l    upper_enemies		;		44|enemies pointer
fileSkyupper:
	dc.b "upperSky.raw",0
	even
fileImagesupper:
	dc.b "upperAssets.raw",0
	even
fileFloorupper:
	dc.b "upperFloor.raw",0
	even
upper_animation:
	dc.l -1
upper_enemies:
e0:
	dc.l y_down_speed_2			;0| path pointer
	dc.w 10			;4| hit_points
	dc.w 10			;6| score_points
	dc.w 0			;8| shoot_count_max
	dc.w 0			;10| shoot_count
	dc.l e0_animation			;12| pointer to animation
	dc.l 0			;16| pointer to bullet
	dc.l 0			;20| pointer to explosion
	dc.l 0			;24| pointer to extra
	dc.l 0			;28| pointer to script
	dc.l 0			;32| pointer to object 
	dc.l 37*MAP_ENTRY_SIZE  ;36| pointer to map	

	dc.l -1

e0_animation:
	dc.l 37*MAP_ENTRY_SIZE,0
	dc.w 42112,45952,49792,-1

y_down_speed_2:
  dc.w    0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,0,2,512



upper_gradient:
	dc.w 100,$004b,$004b,$004b,$004b,$004b,$004b,$004b,$004b,$004b,$004b,$004b,$004b,$005b,$005b,$005b,$005b,$005b,$005b,$005b,$005b,$005b,$005b,$006b,$006b,$006b,$006b,$006b,$006b,$006b,$006b,$007b,$007b,$007b,$007b,$007b,$007b,$009b,$009b,$009b,$009b,$009b,$009b,$00ab,$00ab,$00ab,$00ab,$00bb,$00bb,$00bb,$00bb,$02cc,$02cc,$04dd,$04dd,$04dd,$04dd,$05ee,$05ee,$06ff,$06ff,$06ff,$06ff,$07ff,$07ff,$09ff,$09ff,$0aff,$0aff,$0bff,$0bff,$0cff,$0cff,$0dff,$0dff,$0eff,$0eff,$0fff,$0fff,$0eee,$0eee,$0ddd,$0ddd,$0ccc,$0ccc,$0bbb,$0bbb,$0aaa,$0aaa,$0999,$0999,$0999,$0999,$0777,$0777,$0777,$0777,$0666,$0666,$0665,$0665,$0564,$0564,$0563,$0563,$0562,$0562,$0461,$0461,$0461,$0461,$0461,$0461,$0461,$0461,$0461,$0461,$0461,$0461


dungeon0
	dc.l    dungeon0_map ;		0|  pointer
	dc.w    18  ; 				4| size-1
	dc.w    0		; 6| sky flag
	dc.w    1		;8| floor flag
	dc.l    dungeon0_map_colors ; 	10| pointer to colors
	dc.l    0;	14| pointer to gradient
	dc.l    0;	18 | 
	dc.l    fileImagesdungeon0;				22| 
	dc.l    fileFloordungeon0;				26| 
	dc.l    46848;		30| 
	dc.w    85		;		34| player start x
	dc.w    85		;		36| player start z
	dc.w    360		;		38| player start yAngle
	dc.l    dungeon0_animation		;		40|animation pointer
	dc.l    dungeon0_enemies		;		44|enemies pointer

dungeon0_enemies:
	dc.l -1

fileImagesdungeon0:
	dc.b "dungeon0Assets.raw",0
	even
fileFloordungeon0:
	dc.b "dungeon0Floor.raw",0
	even
f0_ani:
	dc.l 14*MAP_ENTRY_SIZE,0
	dc.w 40960,41536,42112,42688,43264,43840,44416,44992,-1
dungeon0_animation:
	dc.l f0_ani
	dc.l -1


castle
	dc.l    castle_map ;		0|  pointer
	dc.w    44  ; 				4| size-1
	dc.w    0		; 6| sky flag
	dc.w    1		;8| floor flag
	dc.l    castle_map_colors ; 	10| pointer to colors
	dc.l    0;	14| pointer to gradient
	dc.l    0;	18 | 
	dc.l    fileImagescastle;				22| 
	dc.l    fileFloorcastle;				26| 
	dc.l    25664;		30| 
	dc.w    85		;		34| player start x
	dc.w    1000		;		36| player start z
	dc.w    360		;		38| player start yAngle
	dc.l    castle_animation		;		40|animation pointer
	dc.l    castle_enemies		;		44|enemies pointer
fileImagescastle:
	dc.b "castleAssets.raw",0
	even
fileFloorcastle:
	dc.b "castleFloor.raw",0
	even
f00_ani:
	dc.l 48*MAP_ENTRY_SIZE,0
	dc.w 21056,21632,22208,22784,23360,23936,24512,25088,-1
castle_animation:
	dc.l f00_ani
	dc.l -1
castle_enemies:
	dc.l -1

test
	dc.l    test_map ;		0|  pointer
	dc.w    8  ;27 				4| size-1
	dc.w    0		; 6| sky flag
	dc.w    1		;8| floor flag
	dc.l    test_map_colors ; 	10| pointer to colors
	dc.l    0;	14| pointer to gradient
	dc.l    0;	18 | 
	dc.l    fileImagestest;				22| 
	dc.l    fileFloortest;				26| 
	dc.l    25664;		30| 
	dc.w    85		;		34| player start x
	dc.w    85		;		36| player start z
	dc.w    360		;		38| player start yAngle
	dc.l    test_animation		;		40|animation pointer
	dc.l    test_enemies		;		44|enemies pointer
fileImagestest:
	dc.b "castleAssets.raw",0
	even
fileFloortest:
	dc.b "castleFloor.raw",0
	even
f000_ani:
	dc.l 48*MAP_ENTRY_SIZE,0
	dc.w 21056,21632,22208,22784,23360,23936,24512,25088,-1
test_animation:
	dc.l f00_ani
	dc.l -1
test_enemies:
	dc.l -1
