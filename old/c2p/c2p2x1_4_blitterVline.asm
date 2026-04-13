
rotate:
    ;lea       RENDER,a0
    move.l    Screen_RENDER,a0                                                    ; zu bearbeitende Bitplane
    add.l     d0,a0
	
    ;lea       brush,a2                                                   ; zu drehender Brush
    add.l     d1,a2
	
    lea       sin(pc),a3                                                 ; Sinus-Tabelle
    ;moveq     #brushy-1,d7                                               ; 128 Zeilen
    move      #128*160,XPOS+2                                            ; BildMitte * 128
    move      #128*128,YPOS+2
sinpos:
    move      #0,d4                                                      ; -> Winkel (0*2 bis 63*2)
    move      (a3,d4.w),d5                                               ; Sin-Wert
    asr       #2,d5
    sub       d5,XPOS+2                                                  ; zentrieren
    asr       #8,d5
    move      d5,XPOS2+2                                                 ; Richtungsvektor der Linie


    add       #(endsin-sin)/4,d4                                         ; Cosinus
    and       #endsin-sin-2,d4
    move      (a3,d4.w),d5
    asr       #2,d5
    sub       d5,YPOS+2
    asr       #8,d5
    move      d5,YPOS2+2                                                 ; Richtungsvektor der Linie
    sub       #(endsin-sin)/2,d4                                         ; Vektor, um auf die
    and       #endsin-sin-2,d4                                           ; naechste Linie zu kommen.

    move      (a3,d4.w),d5                                               ; Vektor
    asr       #2,d5
    sub       d5,XPOS+2                                                  ; zentrieren
    asr       #6,d5
    move      d5,XSTEP+2
    add       #(endsin-sin)/4,d4                                         ; Cosinus
    and       #endsin-sin-2,d4
    move      (a3,d4.w),d5
    asr       #2,d5
    sub       d5,YPOS+2
    ;asr        #6,d5
    ;move       d5,YSTEP+2

XPOS:
    move      #0,d0                                                      ; Startpunkt der Linie
YPOS:
    move      #0,d1
    lsr       #7,d0
    lsr       #7,d1
    move      d0,d2
    move      d1,d3
XPOS2:
    add       #0,d2                                                      ; Endpunkt der Linie
YPOS2:
    add       #0,d3

    bsr       LINE
XSTEP:
    add       #0,XPOS+2                                                  ; Koordinaten naechste Linie
YSTEP:
    add       #0,YPOS+2
    dbf       d7,XPOS                                                    ; alle anderen Linien ziehen
    ;add        #2,sinpos+2                                                    ; Winkel aendern	
    ;and        #endsin-sin-2,sinpos+2
    rts
	

    
vx dc.w 0 

drawLine:
    move.w #160-1,d7
    lea.l        image,a2
.loop: 
    move.l       Screen_RENDER,a0
    
.XPOS_:
    move      vx,d0                                                      ; Startpunkt der Linie
.YPOS_:
    move      #0,d1
.XPOS2_:
    move      vx,d2                                                      ; Endpunkt der Linie
.YPOS2_:
    move      #100*4,d3
    bsr       vertical_line 
    add.w #2,vx
    dbf d7,.loop
    rts
	
clearbild:
w3  btst      #14,$dff002
    bne.s     w3
	
    move.l     Screen_RENDER,a5
    move.l    (a5),$dff054                                               ; D poth
    clr       $dff066                                                    ; D
    move      #%0000000100000000,$dff040
    clr       $dff042
	;move       #screensize+16,$dff058
    move      #160*256+16,$dff058

    rts



tabeile: 
    dc.b      1,17,9,21,5,25,13,29                                       ; Himmelsrichtungs-Bits




LINE:
    move.l     #screenBuffer_lineSize,d4                                                     ; Breite einer Bildschirmzeile
    mulu      d1,d4                                                      ; Y*Breite einer Zeile
    move      d0,d5
    lsr.w     #3,d5                                                      ; X/8
    add.w     d5,d4
    add.l     a0,d4                                                      ;+Startadr. Bild = erstes Zielwort
   ; cmp       #64-1,d7
   ; bne       SHORT                                                      ; andere Parameter initialisiert
    moveq     #0,d5
    sub       d1,d3                                                      ; Delta Y
    roxl.b    #1,d5
    tst       d3

    bge.s     .ll
    neg       d3                                                         ; Betrag Delta Y

.ll:
    sub       d0,d2                                                      ; Delta X
    roxl.b    #1,d5
    tst       d2
    bge.s     .l2
    neg       d2                                                         ; Betrag Delta X
.l2:
    move      d3,d1
    sub       d2,d1
    bge.s     .l3
    exg       d2,d3                                                      ; Delta Y < Delta X (A,B)
.l3:
    roxl.b    #1,d5
    move.b    tabeile(pc,d5),d5                                          ; Himmelsrichtung
    add       d2,d2                                                      ; 2*A
	
.w2  btst      #14,$dff002
    bne.s     .w2
	
    move.w    #$8000,$dff074
    move.w    #$ffff,$dff044
    move.w    #screenBuffer_lineSize,$dff060                                                ; Breite der Plane
    move.w    #screenBuffer_lineSize,$dff066
    move.w    d2,$dff062                                                 ; 2*A
    sub.w     d3,d2                                                      ; 2*A-B
    bge.s     .l4
    or.b      #$40,d5                                                    ; 2*A<B => Sign Bit in Blitconl * 1

.l4:
    move      d2,d6
    sub.w     d3,d2                                                      ; 2*B-2*B
    move.w    d2,$dff064
    or        #$f000,d5
    move.w    d5,$dff042                                                 ; bltconl
.SHORT:
.w1  btst      #14,$dff002
    bne.s     .w1
	
    move      d6,$dff052                                                 ; 2*A-B
    and.w     #$f,d0                                                     ; X*$f
    ror.w     #4,d0
    or.w      #%0000101111001010,d0
    move.w    d0,$dff040                                                 ; blitconO
    move.l    d4,$dff048                                                 ; C-poth
    move.l    d4,$dff054                                                 ; D-poth
    move      #16*64+2,d3                                                ; Laenge = 16 Punkte
    moveq     #64/16-1,d6
.l5:
    btst      #14,$dff002
    bne.s     .l5
    ;move.w    (a2)+,$dff072                                              ; B-DAT
    move.w   #$FFFF,$dff072
    move.w    d3,$dff058                                                 ; bltisize
    dbf       d6,.l5
    rts

tabeileV: 
    dc.b      1,17,9,21,5,25,13,29                                       ; Himmelsrichtungs-Bits

vertical_line:
    move.l     #screenBuffer_lineSize,d4                                                     ; Breite einer Bildschirmzeile
    mulu      d1,d4                                                      ; Y*Breite einer Zeile
    move      d0,d5
    lsr.w     #3,d5                                                      ; X/8
    add.w     d5,d4
    add.l     a0,d4                                                      ;+Startadr. Bild = erstes Zielwort
   ; cmp       #64-1,d7
   ; bne       SHORT                                                      ; andere Parameter initialisiert
    moveq     #0,d5
    sub       d1,d3                                                      ; Delta Y
    roxl.b    #1,d5
    tst       d3

    bge.s     .ll
    neg       d3                                                         ; Betrag Delta Y

.ll:
    sub       d0,d2                                                      ; Delta X
    roxl.b    #1,d5
    tst       d2
    bge.s     .l2
    neg       d2                                                         ; Betrag Delta X
.l2:
    move      d3,d1
    sub       d2,d1
    bge.s     .l3
    exg       d2,d3                                                      ; Delta Y < Delta X (A,B)
.l3:
    roxl.b    #1,d5
    move.b    tabeileV(pc,d5),d5                                          ; Himmelsrichtung
    add       d2,d2                                                      ; 2*A
	
.w2  btst      #14,$dff002
    bne.s     .w2
	
    ;move.w    #$8000,$dff074
    move.w    #$C000,$dff074
    move.w    #$ffff,$dff044
    move.w    #screenBuffer_width_Byte,$dff060                                                ; Breite der Plane
    move.w    #screenBuffer_width_Byte,$dff066
    move.w    d2,$dff062                                                 ; 2*A
    sub.w     d3,d2                                                      ; 2*A-B
    bge.s     .l4
    or.b      #$40,d5                                                    ; 2*A<B => Sign Bit in Blitconl * 1

.l4:
    move      d2,d6
    sub.w     d3,d2                                                      ; 2*B-2*B
    move.w    d2,$dff064
    or        #$f000,d5
    move.w    d5,$dff042                                                 ; bltconl
.SHORT:
.w1  btst      #14,$dff002
    bne.s     .w1
	
    move      d6,$dff052                                                 ; 2*A-B
    and.w     #$f,d0                                                     ; X*$f
    ror.w     #4,d0
    or.w      #%0000101111001010,d0
    move.w    d0,$dff040                                                 ; blitconO
    move.l    d4,$dff048                                                 ; C-poth
    move.l    d4,$dff054                                                 ; D-poth
    move      #8*64+2,d3                                                ; Laenge = 16 Punkte
    moveq     #400/8-1,d6
.l5:
    ;btst      #14,$dff002
    ;bne.s     .l5
    move.w    (a2)+,$dff072                                              ; B-DAT
    ;move.w   #$FFFF,$dff072
    move.w    d3,$dff058                                                 ; bltisize
    dbf       d6,.l5
    rts

sin:							; 64 werte bis $7f00
    dc.w      0,3187,6343,9438,12442,15326,18063,20625
    dc.w      22989,25132,27033,28673,30037,31112,31887,32355
    dc.w      32512,32355,31887,31112,30037,28673,27033,25132
    dc.w      22989,20625,18063,15326,12442,9438,6343,3187
    dc.w      0,-3187,-6343,-9438,-12442,-15326,-18063,-20625
    dc.w      -22989,-25132,-27033,-28673,-30037,-31112,-31887,-32355
    dc.w      -32512,-32355,-31887,-31112,-30037,-28673,-27033,-25132
    dc.w      -22989,-20625,-18063,-15326,-12442,-9438,-6343,-3187
endsin: