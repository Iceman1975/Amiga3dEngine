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
; =====================================================================
; ED-209 - LOW POLY STRUKTUR (Amiga 68k Format)
; Format: dc.w X, Z, Y
; Wicklung: Gegen den Uhrzeigersinn (CCW)
; Boden: Y = -64
; =====================================================================

; ==========================================
; 1. KOPF / TORSO (Schmal, vorne abgeschrägt)
; ==========================================

; Kopf Front (Abgeschrägtes Visier)
    dc.w -15,-20, 40        ;0 Oben Links
    dc.w -15,-40, 20        ;1 Unten Links
    dc.w  15,-40, 20        ;2 Unten Rechts
    dc.w  15,-20, 40        ;3 Oben Rechts
    dc.w 0
    dc.w 3
    dc.b %11111111,%11111111,%11111111,%11111111 ; Visier Farbe
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Kopf Hinten
    dc.w  15, 10, 40        ;0 Oben Rechts
    dc.w  15, 10, 20        ;1 Unten Rechts
    dc.w -15, 10, 20        ;2 Unten Links
    dc.w -15, 10, 40        ;3 Oben Links
    dc.w 0
    dc.w 3
    dc.b %11001100,%11001100,%11001100,%11001100
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Kopf Oben
    dc.w -15, 10, 40        ;0 Hinten Links
    dc.w -15,-20, 40        ;1 Vorne Links
    dc.w  15,-20, 40        ;2 Vorne Rechts
    dc.w  15, 10, 40        ;3 Hinten Rechts
    dc.w 0
    dc.w 3
    dc.b %11001100,%11001100,%11001100,%11001100
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0



; Kopf Links
    dc.w -15, 10, 40        ;0 Hinten Oben
    dc.w -15, 10, 20        ;1 Hinten Unten
    dc.w -15,-40, 20        ;2 Vorne Unten
    dc.w -15,-20, 40        ;3 Vorne Oben
    dc.w 0
    dc.w 3
    dc.b %11001100,%11001100,%11001100,%11001100
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Kopf Rechts
    dc.w  15,-20, 40        ;0 Vorne Oben
    dc.w  15,-40, 20        ;1 Vorne Unten
    dc.w  15, 10, 20        ;2 Hinten Unten
    dc.w  15, 10, 40        ;3 Hinten Oben
    dc.w 0
    dc.w 3
    dc.b %11001100,%11001100,%11001100,%11001100
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 2. LINKE WAFFEN-HALTERUNG (Lang)
; ==========================================

; Waffenarm Links Front
    dc.w -45,-50, 25
    dc.w -45,-50, 15
    dc.w -20,-50, 15
    dc.w -20,-50, 25
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Waffenarm Links Hinten
    dc.w -20,-10, 25
    dc.w -20,-10, 15
    dc.w -45,-10, 15
    dc.w -45,-10, 25
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Waffenarm Links Aussen
    dc.w -45,-10, 25
    dc.w -45,-10, 15
    dc.w -45,-50, 15
    dc.w -45,-50, 25
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 3. RECHTE WAFFEN-HALTERUNG (Lang)
; ==========================================

; Waffenarm Rechts Front
    dc.w  20,-50, 25
    dc.w  20,-50, 15
    dc.w  45,-50, 15
    dc.w  45,-50, 25
    dc.w 0
    dc.w 2
    dc.b %11001100,%11001100,%11001100,%11001100
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Waffenarm Rechts Hinten
    dc.w  45,-10, 25
    dc.w  45,-10, 15
    dc.w  20,-10, 15
    dc.w  20,-10, 25
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Waffenarm Rechts Aussen
    dc.w  45,-50, 25
    dc.w  45,-50, 15
    dc.w  45,-10, 15
    dc.w  45,-10, 25
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 4. SCHERENMECHANIK: LINKES BEIN
; ==========================================

; Linker Oberschenkel Front (Geht nach Vorne)
    dc.w -30,  0, 20        ; Oben (Hüfte)
    dc.w -30, 20,-10        ; Unten (Knie)
    dc.w -20, 20,-10        ; Unten (Knie)
    dc.w -20,  0, 20        ; Oben (Hüfte)
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Linker Oberschenkel Hinten
    dc.w -20, 10, 20
    dc.w -20, 30,-10
    dc.w -30, 30,-10
    dc.w -30, 10, 20
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Linker Unterschenkel Front (Geht nach Hinten)
    dc.w -30, 20,-10        ; Oben (Knie)
    dc.w -30,  0,-50        ; Unten (Knöchel)
    dc.w -20,  0,-50        ; Unten (Knöchel)
    dc.w -20, 20,-10        ; Oben (Knie)
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Linker Unterschenkel Hinten
    dc.w -20, 30,-10
    dc.w -20, 10,-50
    dc.w -30, 10,-50
    dc.w -30, 30,-10
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 5. SCHERENMECHANIK: RECHTES BEIN
; ==========================================

; Rechter Oberschenkel Front (Geht nach Vorne)
    dc.w  20,  0, 20
    dc.w  20, 20,-10
    dc.w  30, 20,-10
    dc.w  30,  0, 20
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechter Oberschenkel Hinten
    dc.w  30, 10, 20
    dc.w  30, 30,-10
    dc.w  20, 30,-10
    dc.w  20, 10, 20
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechter Unterschenkel Front (Geht nach Hinten)
    dc.w  20, 20,-10
    dc.w  20,  0,-50
    dc.w  30,  0,-50
    dc.w  30, 20,-10
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechter Unterschenkel Hinten
    dc.w  30, 30,-10
    dc.w  30, 10,-50
    dc.w  20, 10,-50
    dc.w  20, 30,-10
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 6. FÜSSE (Gerade nach Vorne, auf Y=-64)
; ==========================================

; Linker Fuß Front (Zeigt nach vorne auf Z=-20)
    dc.w -35,-20,-50
    dc.w -35,-20,-64        ; Bodenkontakt
    dc.w -15,-20,-64        ; Bodenkontakt
    dc.w -15,-20,-50
    dc.w 0
    dc.w 2
    dc.b %11001100,%11001100,%11001100,%11001100
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Linker Fuß Oben (Langer Fuß nach hinten bis Z=20)
    dc.w -35, 20,-50
    dc.w -35,-20,-50
    dc.w -15,-20,-50
    dc.w -15, 20,-50
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Linker Fuß Aussen
    dc.w -35, 20,-50
    dc.w -35, 20,-64
    dc.w -35,-20,-64
    dc.w -35,-20,-50
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechter Fuß Front
    dc.w  15,-20,-50
    dc.w  15,-20,-64        ; Bodenkontakt
    dc.w  35,-20,-64        ; Bodenkontakt
    dc.w  35,-20,-50
    dc.w 0
    dc.w 2
    dc.b %11001100,%11001100,%11001100,%11001100
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechter Fuß Oben
    dc.w  15, 20,-50
    dc.w  15,-20,-50
    dc.w  35,-20,-50
    dc.w  35, 20,-50
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechter Fuß Aussen
    dc.w  35,-20,-50
    dc.w  35,-20,-64
    dc.w  35, 20,-64
    dc.w  35, 20,-50
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0



;******************
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




