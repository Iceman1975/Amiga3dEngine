; joystick status
joystick1_changed            dc.w    0
joystick1_left:              dc.b    0
joystick1_right:             dc.b    0
joystick1_up:                dc.b    0
joystick1_down:              dc.b    0
joystick1_button             dc.w    0
joystick1_button_automatic   dc.w    0


sky_position                 dc.w 0

collision_wall    dc.w 0

imageDataPointer  dc.l 0
floorDataPointer  dc.l 0
skyDataPointer    dc.l 0          ; Must be pointing to chipMem

screenPointerX  dc.w 80
screenPointerY  dc.w 50
screenPointer_element dc.l 0
screenPointer_collision_z dc.w 0

soundEventPrio0             dc.l    0
soundEventPrio1             dc.l    0
soundEventPrio2             dc.l    0
soundEventPrio3             dc.l    0