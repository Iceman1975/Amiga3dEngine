rocketSound:
	dc.l rocketSound_data					;0| pointer to sound data 
	dc.w 4993				;4| sample length
	dc.w 447				;6| sample period
	dc.w 64											;8| volume
	dc.b -1											;9| channel (-1= best)
	dc.b 2					;10| prio *4 

soundExtra:
	dc.l soundExtra_data					;0| pointer to sound data 
	dc.w 355				;4| sample length
	dc.w 447				;6| sample period
	dc.w 64											;8| volume
	dc.b -1											;9| channel (-1= best)
	dc.b 2					;10| prio *4 

soundExplosion:
	dc.l soundExplosion_data					;0| pointer to sound data 
	dc.w 1928				;4| sample length
	dc.w 324				;6| sample period
	dc.w 64											;8| volume
	dc.b -1											;9| channel (-1= best)
	dc.b 2					;10| prio *4 

soundGun:
	dc.l gunSound_data					;0| pointer to sound data 
	dc.w 628				;4| sample length
	dc.w 5512				;6| sample period
	dc.w 64											;8| volume
	dc.b -1											;9| channel (-1= best)
	dc.b 2					;10| prio *4 