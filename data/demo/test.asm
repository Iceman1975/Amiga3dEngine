test_map_colors:
	dc.w  COLOR00, $0aa9
	dc.w  COLOR01, $0553
	dc.w  COLOR02, $0775
	dc.w  COLOR03, $0897
	dc.w  COLOR04, $0bba
	dc.w  COLOR05, $09b9
	dc.w  COLOR06, $0ddb
	dc.w  COLOR07, $0966
	dc.w  COLOR08, $0443
	dc.w  COLOR09, $0752
	dc.w  COLOR10, $0a87
	dc.w  COLOR11, $0656
	dc.w  COLOR12, $0ffe
	dc.w  COLOR13, $0d9b
	dc.w  COLOR14, $0332
	dc.w  COLOR15, $0111

test_map:

	dc.w 216,-2,64			;0
	dc.w 216,-168,32		;1	
	dc.w 216,-138,-48		;2	
	dc.w 216,-2,-64			;3
	
	dc.w 0
	dc.w 2
	dc.b %11001111,%11001111,%11001111,%11001111
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0


	dc.w 216,-168,32		;1	
	dc.w 216,-130,-48		;2
	dc.w 216,-2,-32			;3
	dc.w 216,-2,64			;0


	dc.w 0
	dc.w 2
	dc.b %11001111,%11001111,%11001111,%11001111
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

	dc.w 216,-130,-48		;2
	dc.w 216,-2,-32			;3
	dc.w 216,-2,64			;0
	dc.w 216,-168,32		;1	
		

	dc.w 0
	dc.w 2
	dc.b %11001111,%11001111,%11001111,%11001111
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0





	
	dc.w 216,-2,-32			;3
	dc.w 216,-2,64			;0
	dc.w 216,-168,32		;1	
	dc.w 216,-130,-48		;2	

	dc.w 0
	dc.w 2
	dc.b %11001111,%11001111,%11001111,%11001111
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0


























	dc.w 360,-2,-32
	dc.w 360,-168,-32
	dc.w 216,-168,-32
	dc.w 216,-2,-32
	dc.w 0
	dc.w 2
	dc.b %11001100,%11001100,%11001100,%11001100
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0




