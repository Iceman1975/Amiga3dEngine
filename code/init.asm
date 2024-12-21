
		
init:
  LEA       CUSTOM,a6                           ;Point a0 at custom chips
  move.w    #$4000,$dff09a                      ; INTENA - clear external interrupt

  or.b      #%10000000,$bfd100                  ; CIABPRB stops drive motors
  and.b     #%10000111,$bfd100                  ; CIABPRB

  move.w    #$01a0,$dff096                      ; DMACON clear bitplane, copper, sprite

  move.w    #$4000,$dff100                      ; BPLCON0 one bitplane, color burst
  move.w    #$0000,$dff102                      ; BPLCON1 scroll
  move.w    #$003f,$dff104                      ; BPLCON2 video

  move.w    #screenBuffer_width_Byte,$dff108
  move.w    #screenBuffer_width_Byte,$dff10a

  ;move.w    #$2c81,$dff08e                      ; DIWSTRT upper left corner of display ($81,$2c)
  move.w    #$3081,$dff08e                      ; DIWSTRT upper left corner of display ($81,$2c)

  ;move.w    #$30c1,$dff090                      ; DIWSTOP enable PAL trick
  ;move.w    #$38c1,$dff090                      ; DIWSTOP lower right corner of display ($1c1,$12c)
  move.w    #$30c1,$dff090                      ; DIWSTOP lower right corner of display ($1c1,$12c)

  move.w    #$0030,$dff092                      ; DDFSTRT Data fetch start
  move.w    #$00d0,$dff094                      ; DDFSTOP Data fetch stop

 
  rts
	
	
destroy:
  move.w    #$0080,$dff096                      ; reestablish DMA's and copper
  LEA       CUSTOM,a6 
  move.l    $04,a6
  move.l    156(a6),a1
  move.l    38(a1),$dff080

  move.w    #$8080,$dff096

  move.w    #$c000,$dff09a
  rts

blanksprite:
  dc.w      $0000,$0000                         ; an empty sprite