
ray_drawPoly:
    movem.l    d0-d7/a0-a6,-(sp)  
    move.l a1,a4
    lea  rect,a0
    
    move.l MAP_XX0_POLY(a1),d0
    move.l MAP_XX1_POLY(a1),d1
    move.l MAP_XX2_POLY(a1),d2
    move.l MAP_XX3_POLY(a1),d3

    cmp.w d1,d0     ;d0<d1   y0<y1 
    ble.s .c0
    cmp.w d2,d1     ;d1<d2   y1<y2 
    ble.s .c00
    ;2301
    exg  d0,d2
    exg  d1,d3
    bra.s .draw
    
.c00
    ;3012
    exg  d0,d1
    exg  d1,d2
    exg  d2,d3
    bra.s .draw
.c0
    cmp.w d2,d1     ;d1<d2   y1<y2
    ble.s .c1
    cmp.w d3,d2     ;d2<d3  y2<y3
    bge.s .c10
    ;2301
    exg  d1,d3  ;2103
    exg  d2,d0  ;0123
    bra.s .draw
.c10
    ;1230
    exg  d0,d3  ;0231
    exg  d1,d3  ;0132
    exg  d2,d3  ;0123
    bra.s .draw
.c1
    cmp.w d3,d2     ;d2<d3   y2<y3
    ble.s .c2
    ;1230
   ; exg  d0,d3  ;0231
   ; exg  d1,d3  ;0132
   ; exg  d2,d3  ;0123
.c2
.draw

    cmp.w d2,d0 ;y0>y2
    bgt.s .done

    tst.w d1    ;x1<0
    blt.s .done 

    move.l d0,(a0)+
    move.l d1,(a0)+
    move.l d2,(a0)+
    move.l d3,(a0)+

  ;  swap d3 ; load x
  ;  swap d1
  ;  cmp.w d1,d3 ;x3>x1 ?  
  ;  bgt.s .done 

   ; swap d3 ; correct again
   ; swap d1
    
    tst.w d3    ; y_bottom < screen start
    ble.s .done

    cmp.w #100,d0 ; y_top < screen end
    bge.s .done

    swap    d3
    cmp.w #160,d3
    bge.s .done

    swap    d1
    tst.w d1
    blt.s .done

    bsr draw_poly
.done:
    movem.l    (sp)+,d0-d7/a0-a6
    rts

draw_poly:
    lea  rect,a0
    lea line_r,a1

    move.w (a0)+,d0
    move.w (a0)+,d1
    move.w (a0)+,d2
    move.w (a0)+,d3
    cmp.w d3,d1 ; d1>d3
    bgt .done
    bsr dpi_line

    lea  rect,a0
    adda.l #4,a0
    move.w (a0)+,d0
    move.w (a0)+,d1
    move.w (a0)+,d2
    move.w (a0)+,d3
    cmp.w d3,d1 ; d1>d3
    bgt .skipr1:
    bsr dpi_line

.skipr1:
    lea  rect,a0
    adda.l #8,a0
    move.w (a0)+,d0
    move.w (a0)+,d1
    move.w (a0)+,d2
    move.w (a0)+,d3
    cmp.w d3,d1 ; d1>d3
    bgt.s .skipr2
    bsr dpi_line

.skipr2:

    lea  rect,a0
    lea line_l,a1

    move.w (a0),d0
    move.w 2(a0),d1
    move.w 12(a0),d2
    move.w 14(a0),d3
    cmp.w d3,d1 ; d1>d3
    bgt.s .skipl1
    bsr dpi_line

.skipl1:
    lea  rect,a0
    move.w 12(a0),d0
    move.w 14(a0),d1
    move.w 8(a0),d2
    move.w 10(a0),d3
    cmp.w d3,d1 ; d1>d3
    bgt.s .skipl2
    bsr dpi_line

.skipl2:
    lea  rect,a0
    move.w 8(a0),d0
    move.w 10(a0),d1
    move.w 4(a0),d2
    move.w 6(a0),d3
    cmp.w d3,d1 ; d1>d3
    bgt.s .skipl3
    bsr dpi_line

.skipl3:


    lea  rect,a0
    
    move.w 2(a0),d0     ;start y
    move.w 10(a0),d1    ;end y

    cmp.w 14(a0),d1
    bge.s .dyok
    move.w 14(a0),d1    ;set if bigger
.dyok:
    cmp.w 6(a0),d1
    bge.s .dyok2
    move.w 6(a0),d1    ;set if bigger
.dyok2:

    cmp.w #100,d1
    blt.s .noClip
    move.w #100-1,d1
.noClip:
    tst d0
    bge.s .noClip0
    moveq #0,d0
.noClip0:
    sub.w d0,d1
    move.l buffer,a0
    lea line_l,a1
    lea line_r,a2
    
    bsr dpi_fill
.done
    rts


 
drawLine:
    move.l buffer,a0
    lea  rect,a1
    
    move.w 10(a1),d7
    sub.w  2(a1),d7
    ;subq.w #1,d7
    move.w 2(a1),d0 ;y start
    moveq #0,d1
.loop:
    
    move.w d0,d1
    
    ;mulu.w #160,d1  ;y  
    move.w d1,d6
    lsl.w #5,d1     ; *32
    lsl.w #7,d6     ; *128  
    add.w d6,d1     ; *160 = *128 + *32

    add.w (a2)+,d1 ;x
    move.b #%1111,(a0,d1)

    addq.w #1,d0
    dbf d7,.loop
    rts


;d0 x0
;d1 y0
;d2 x1
;d3 y1
;a1 line pointer
dpi_line:
    moveq #-1,d7
    move.w d0,d4
    sub.w d2,d4    ; dx
    tst.w d4
    bge.s .noneg
    neg.w d4
    moveq #1,d7
.noneg:
    move.w d1,d5
    sub.w d3,d5    ; dy
    beq.s .done
    bge.s .noneg2
    neg.w d5
.noneg2:

    move.w d5,d3
    ;subq.w #1,d3    ; loop init
    moveq #0,d6

.loop:
    addq.w #1,d1    ; y1++
    blt.s .dontStore    ; is outside screen
    move.w d0,(a1)+    ; store only x

.dontStore:
    add.w d4,d6
.add:
    cmp.w d6,d5 ;d5<=d6
    bgt.s .noAdd

    add.w d7,d0 
    sub.w d5,d6
    bra.s .add

.noAdd
    dbf d3,.loop
    rts
.done:
    ;? correct?
    move.w d0,(a1)+ 
    rts

;d0 y start
;d1 dy
;a0 buffer
;a1 pointer line_l
;a2 pointer line_r

dpi_fill
    move.l MAP_COLOR(a4),d5
    
    mulu #160,d0
    add.l d0,a0
    moveq #0,d2

.loop:
    move.l a0,a3    ; buffer pointer
    lea drl_list,a5 ; pointer to draw instructions

    move.w (a1)+,d2 ; start x
    tst.w d2
    bge.s .clip0
    move.w #0,d2
.clip0
    add.l d2,a3     ; add to pointer
    move.w (a2)+,d4  ; sub end x
    blt.s .next
    cmp.w #160,d4
    blt.s .clip1
    move.w #160-1,d4
.clip1
    sub.w d2,d4        ; end x is bigger so invert
    ble.s .next

    move.l a3,d7
    btst #0,d7
    beq.s .hloop
    move.b d5,(a3)+     ; correction if odd address
    sub.w #1,d4 

    ;tst.w d4
    ;beq.s .hloop    ; only one pixel?
    ;sub.w #1,d4     ; -1 for loop

.hloop:
    lsl.w #2,d4
    ext.l d4
    adda.l d4,a5
    move.l (a5),a5
    jsr (a5)
;.hloop:
    ;move.b d5,(a3)+
    ;dbf d4,.hloop

.next:
    adda.l #160,a0
    dbf d1,.loop    
    rts










rect:
    dc.w    80,30
    dc.w    120,60
    dc.w    80,80
    dc.w    40,60
rect_end:

line_y_start:  
    dc.w 0
line_y_end:
    dc.w 0
line_l ds.w 400
line_r ds.w 400


test_polyX
	dc.w 170,-200,-30, 170,-300,-30 ;x0,z0,y0   x1,z1,y1
    dc.w 30,-300,-30,30,-200,-30    ;x2,z2,y2   x3,z3,y3
    dc.w 0
	dc.w 2
    dc.l $0f0f0f0f
	dc.w 0,0,0,0,0,0
	dc.w 0,0,0,0,0,0

MAP_X0_POLY_INIT=0
MAP_Z0_POLY_INIT=2
MAP_Y0_POLY_INIT=4
MAP_X1_POLY_INIT=6
MAP_Z1_POLY_INIT=8
MAP_Y1_POLY_INIT=10
MAP_X2_POLY_INIT=12
MAP_Z2_POLY_INIT=14
MAP_Y2_POLY_INIT=16
MAP_X3_POLY_INIT=18
MAP_Z3_POLY_INIT=20
MAP_Y3_POLY_INIT=22

;MAP_STATUS  = 24
;MAP_TYPE  = 26

MAP_COLOR=28

MAP_X0_POLY=32
MAP_Z0_POLY=34
MAP_Y0_POLY=36
MAP_X1_POLY=38
MAP_Z1_POLY=40
MAP_Y1_POLY=42
MAP_X2_POLY=44
MAP_Z2_POLY=46
MAP_Y2_POLY=48
MAP_X3_POLY=50
MAP_Z3_POLY=52
MAP_Y3_POLY=54


MAP_XX0_POLY=32
MAP_YY0_POLY=34
MAP_XX1_POLY=38
MAP_YY1_POLY=40
MAP_XX2_POLY=44
MAP_YY2_POLY=46
MAP_XX3_POLY=50
MAP_YY3_POLY=52

    include "code/draw/generated/chunkyPolyDrawGeneratedLineDraws.asm"