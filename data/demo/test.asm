test_map_colors:
	dc.w  COLOR00, $0000
	dc.w  COLOR01, $0444
	dc.w  COLOR02, $0222
	dc.w  COLOR03, $0666
	dc.w  COLOR04, $0b60
	dc.w  COLOR05, $0d90
	dc.w  COLOR06, $0940
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
; HAUS - LOW POLY MODELL (Amiga 68k Format)
; Format: dc.w X, Z, Y
; Wicklung: Gegen den Uhrzeigersinn (CCW)
; Boden: Y = -64, Dachkante: Y = 0, Dachfirst: Y = 40
; =====================================================================

; ==========================================
; 1. WÄNDE (Das Erdgeschoss)
; ==========================================

; Frontwand (Z = -40)
    dc.w -40,-40,   0   ; 0 Oben Links
    dc.w  40,-40,   0   ; 1 Oben Rechts
    dc.w  40,-40,-64    ; 2 Unten Rechts (Boden)
    dc.w -40,-40,-64    ; 3 Unten Links (Boden)
    dc.w 0
    dc.w 2
    dc.b %00111111,%00111111,%00111111,%00111111 
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rückwand (Z = 40)
    dc.w  40, 40,   0   ; 0 Oben Links (von hinten betrachtet)
    dc.w -40, 40,   0   ; 3 Oben Rechts
    dc.w -40, 40,-64    ; 2 Unten Rechts
    dc.w  40, 40,-64    ; 1 Unten Links
    dc.w 0
    dc.w 2
    dc.b %00111111,%00111111,%00111111,%00111111
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Linke Seitenwand (X = -40)
    dc.w -40, 40,   0   ; 0 Oben Links
    dc.w -40,-40,   0   ; 3 Oben Rechts
    dc.w -40,-40,-64    ; 2 Unten Rechts
    dc.w -40, 40,-64    ; 1 Unten Links
    dc.w 0
    dc.w 2
    dc.b %00001100,%00001100,%00001100,%00001100
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechte Seitenwand (X = 40)
    dc.w  40,-40,   0   ; 0 Oben Links
    dc.w  40, 40,   0   ; 3 Oben Rechts
    dc.w  40, 40,-64    ; 2 Unten Rechts
    dc.w  40,-40,-64    ; 1 Unten Links
    dc.w 0
    dc.w 2
    dc.b %00001100,%00001100,%00001100,%00001100
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 2. GIEBEL (Die Dreiecke unterm Dach - als Trapez)
; ==========================================

; Vorderer Giebel
    dc.w  -5,-40,  40   ; 0 Oben Links (Schmaler First)
    dc.w   5,-40,  40   ; 3 Oben Rechts
    dc.w  40,-40,   0   ; 2 Unten Rechts
    dc.w -40,-40,   0   ; 1 Unten Links (Dachkante)
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Hinterer Giebel
    dc.w   5, 40,  40   ; 0 Oben Links
    dc.w  -5, 40,  40   ; 3 Oben Rechts
    dc.w -40, 40,   0   ; 2 Unten Rechts
    dc.w  40, 40,   0   ; 1 Unten Links
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; ==========================================
; 3. DACH 
; ==========================================

; Linke Dachhälfte
    dc.w  -5,-40,  40   ; 0 Oben links (First)
    dc.w -40,-40,  0   ; 1 Unten Links (Traufe/Überhang)
    dc.w  -40, 40,  0   ; 2 Unten Rechts
    dc.w  -5, 40,  40   ; 3 Oben Rechts

    dc.w 0
    dc.w 3
    dc.b %11001111,%11001111,%11001111,%11001111 ; Dunkler/Rötlich für Dach
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0

; Rechte Dachhälfte
    dc.w   5, 40,  40   ; 0 Oben Links
    dc.w   40, 40,  0   ; 1 Unten Links    
    dc.w  40,-40,  0   ; 2 Unten Rechts
    dc.w   5,-40,  40   ; 3 Oben Rechts
    
  
    dc.w 0
    dc.w 2
    dc.b %11001100,%11001100,%11001100,%11001100
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0



; ==========================================
; 4. DETAILS (Tür)
; ==========================================

; Eingangstür (Z = -41 um Clipping/Z-Fighting zu verhindern)
    dc.w -10,-41, -20   ; 0 Oben Links
    dc.w  10,-41, -20   ; 3 Oben Rechts
    dc.w  10,-41,-64    ; 2 Unten Rechts (Boden)
    dc.w -10,-41,-64    ; 1 Unten Links (Boden)
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011 ; Andere Farbe für Tür
    dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0
	dc.w 0,0,0



;***********************************************************************************

; Amiga polygon export
; 2 object(s), 28 poly(s) total
; point order = x, z, y   (editor Y and Z swapped)
; color byte = each bit of color number doubled

; ====== object: sphere_24_1  (sphere_24, 24 polys) ======
; --- poly 0  (color 0) ---
    dc.w -591, 61,279    ; 0
    dc.w -591, 61,279    ; 1
    dc.w -555,  0,279    ; 2
    dc.w -626,  0,308    ; 3
    dc.w 0
    dc.w 2
    dc.b %00000000,%00000000,%00000000,%00000000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 1  (color 1) ---
    dc.w -661, 61,279    ; 0
    dc.w -661, 61,279    ; 1
    dc.w -591, 61,279    ; 2
    dc.w -626,  0,308    ; 3
    dc.w 0
    dc.w 2
    dc.b %00000011,%00000011,%00000011,%00000011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 2  (color 2) ---
    dc.w -697,  0,279    ; 0
    dc.w -697,  0,279    ; 1
    dc.w -661, 61,279    ; 2
    dc.w -626,  0,308    ; 3
    dc.w 0
    dc.w 2
    dc.b %00001100,%00001100,%00001100,%00001100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 3  (color 3) ---
    dc.w -661,-61,279    ; 0
    dc.w -661,-61,279    ; 1
    dc.w -697,  0,279    ; 2
    dc.w -626,  0,308    ; 3
    dc.w 0
    dc.w 2
    dc.b %00001111,%00001111,%00001111,%00001111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 4  (color 4) ---
    dc.w -591,-61,279    ; 0
    dc.w -591,-61,279    ; 1
    dc.w -661,-61,279    ; 2
    dc.w -626,  0,308    ; 3
    dc.w 0
    dc.w 2
    dc.b %00110000,%00110000,%00110000,%00110000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 5  (color 5) ---
    dc.w -555,  0,279    ; 0
    dc.w -555,  0,279    ; 1
    dc.w -591,-61,279    ; 2
    dc.w -626,  0,308    ; 3
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 6  (color 6) ---
    dc.w -555,  0,279    ; 0
    dc.w -591, 61,279    ; 1
    dc.w -576, 87,208    ; 2
    dc.w -526,  0,208    ; 3
    dc.w 0
    dc.w 2
    dc.b %00111100,%00111100,%00111100,%00111100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 7  (color 7) ---
    dc.w -591, 61,279    ; 0
    dc.w -661, 61,279    ; 1
    dc.w -676, 87,208    ; 2
    dc.w -576, 87,208    ; 3
    dc.w 0
    dc.w 2
    dc.b %00111111,%00111111,%00111111,%00111111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 8  (color 8) ---
    dc.w -661, 61,279    ; 0
    dc.w -697,  0,279    ; 1
    dc.w -726,  0,208    ; 2
    dc.w -676, 87,208    ; 3
    dc.w 0
    dc.w 2
    dc.b %11000000,%11000000,%11000000,%11000000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 9  (color 9) ---
    dc.w -697,  0,279    ; 0
    dc.w -661,-61,279    ; 1
    dc.w -676,-87,208    ; 2
    dc.w -726,  0,208    ; 3
    dc.w 0
    dc.w 2
    dc.b %11000011,%11000011,%11000011,%11000011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 10  (color 10) ---
    dc.w -661,-61,279    ; 0
    dc.w -591,-61,279    ; 1
    dc.w -576,-87,208    ; 2
    dc.w -676,-87,208    ; 3
    dc.w 0
    dc.w 2
    dc.b %11001100,%11001100,%11001100,%11001100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 11  (color 11) ---
    dc.w -591,-61,279    ; 0
    dc.w -555,  0,279    ; 1
    dc.w -526,  0,208    ; 2
    dc.w -576,-87,208    ; 3
    dc.w 0
    dc.w 2
    dc.b %11001111,%11001111,%11001111,%11001111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 12  (color 12) ---
    dc.w -526,  0,208    ; 0
    dc.w -576, 87,208    ; 1
    dc.w -591, 61,137    ; 2
    dc.w -555,  0,137    ; 3
    dc.w 0
    dc.w 2
    dc.b %11110000,%11110000,%11110000,%11110000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 13  (color 13) ---
    dc.w -576, 87,208    ; 0
    dc.w -676, 87,208    ; 1
    dc.w -661, 61,137    ; 2
    dc.w -591, 61,137    ; 3
    dc.w 0
    dc.w 2
    dc.b %11110011,%11110011,%11110011,%11110011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 14  (color 14) ---
    dc.w -676, 87,208    ; 0
    dc.w -726,  0,208    ; 1
    dc.w -697,  0,137    ; 2
    dc.w -661, 61,137    ; 3
    dc.w 0
    dc.w 2
    dc.b %11111100,%11111100,%11111100,%11111100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 15  (color 15) ---
    dc.w -726,  0,208    ; 0
    dc.w -676,-87,208    ; 1
    dc.w -661,-61,137    ; 2
    dc.w -697,  0,137    ; 3
    dc.w 0
    dc.w 2
    dc.b %11111111,%11111111,%11111111,%11111111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 16  (color 0) ---
    dc.w -676,-87,208    ; 0
    dc.w -576,-87,208    ; 1
    dc.w -591,-61,137    ; 2
    dc.w -661,-61,137    ; 3
    dc.w 0
    dc.w 2
    dc.b %00000000,%00000000,%00000000,%00000000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 17  (color 1) ---
    dc.w -576,-87,208    ; 0
    dc.w -526,  0,208    ; 1
    dc.w -555,  0,137    ; 2
    dc.w -591,-61,137    ; 3
    dc.w 0
    dc.w 2
    dc.b %00000011,%00000011,%00000011,%00000011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 18  (color 2) ---
    dc.w -555,  0,137    ; 0
    dc.w -555,  0,137    ; 1
    dc.w -591, 61,137    ; 2
    dc.w -626,  0,108    ; 3
    dc.w 0
    dc.w 2
    dc.b %00001100,%00001100,%00001100,%00001100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 19  (color 3) ---
    dc.w -591, 61,137    ; 0
    dc.w -591, 61,137    ; 1
    dc.w -661, 61,137    ; 2
    dc.w -626,  0,108    ; 3
    dc.w 0
    dc.w 2
    dc.b %00001111,%00001111,%00001111,%00001111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 20  (color 4) ---
    dc.w -661, 61,137    ; 0
    dc.w -661, 61,137    ; 1
    dc.w -697,  0,137    ; 2
    dc.w -626,  0,108    ; 3
    dc.w 0
    dc.w 2
    dc.b %00110000,%00110000,%00110000,%00110000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 21  (color 5) ---
    dc.w -697,  0,137    ; 0
    dc.w -697,  0,137    ; 1
    dc.w -661,-61,137    ; 2
    dc.w -626,  0,108    ; 3
    dc.w 0
    dc.w 2
    dc.b %00110011,%00110011,%00110011,%00110011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 22  (color 6) ---
    dc.w -661,-61,137    ; 0
    dc.w -661,-61,137    ; 1
    dc.w -591,-61,137    ; 2
    dc.w -626,  0,108    ; 3
    dc.w 0
    dc.w 2
    dc.b %00111100,%00111100,%00111100,%00111100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 23  (color 7) ---
    dc.w -591,-61,137    ; 0
    dc.w -591,-61,137    ; 1
    dc.w -555,  0,137    ; 2
    dc.w -626,  0,108    ; 3
    dc.w 0
    dc.w 2
    dc.b %00111111,%00111111,%00111111,%00111111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; ====== object: box_2  (box, 4 polys) ======
; --- poly 0  (color 0) ---
    dc.w -650,-23,108    ; 0
    dc.w -602,-23,108    ; 1
    dc.w -602,-23,-92    ; 2
    dc.w -650,-23,-92    ; 3
    dc.w 0
    dc.w 2
    dc.b %00000000,%00000000,%00000000,%00000000
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 1  (color 1) ---
    dc.w -602, 23,108    ; 0
    dc.w -650, 23,108    ; 1
    dc.w -650, 23,-92    ; 2
    dc.w -602, 23,-92    ; 3
    dc.w 0
    dc.w 2
    dc.b %00000011,%00000011,%00000011,%00000011
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 2  (color 2) ---
    dc.w -650, 23,108    ; 0
    dc.w -650,-23,108    ; 1
    dc.w -650,-23,-92    ; 2
    dc.w -650, 23,-92    ; 3
    dc.w 0
    dc.w 2
    dc.b %00001100,%00001100,%00001100,%00001100
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
; --- poly 3  (color 3) ---
    dc.w -602,-23,108    ; 0
    dc.w -602, 23,108    ; 1
    dc.w -602, 23,-92    ; 2
    dc.w -602,-23,-92    ; 3
    dc.w 0
    dc.w 2
    dc.b %00001111,%00001111,%00001111,%00001111
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0
    dc.w 0,0,0







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
    dc.w 2
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
    dc.w 2
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
    dc.w 2
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
    dc.w 2
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
    dc.w 2
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




