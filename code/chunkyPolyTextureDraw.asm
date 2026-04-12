
tray_drawPoly:
    movem.l    d0-d7/a0-a6,-(sp)  
    move.l a1,a4
    lea  trect,a0
    
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
    move.l #$02030001,textureOrder
    bra.s .draw
    
.c00
    ;3012
    exg  d0,d1
    exg  d1,d2
    exg  d2,d3
    move.l #$03000102,textureOrder
    bra.s .draw
.c0
    cmp.w d2,d1     ;d1<d2   y1<y2
    ble.s .c1
    cmp.w d3,d2     ;d2<d3  y2<y3
    bge.s .c10
    ;2301
    exg  d1,d3  ;2103
    exg  d2,d0  ;0123
    move.l #$02030001,textureOrder
    bra.s .draw
.c10
    ;1230
    exg  d0,d3  ;0231
    exg  d1,d3  ;0132
    exg  d2,d3  ;0123
    move.l #$01020300,textureOrder
    bra.s .draw
.c1
    cmp.w d3,d2     ;d2<d3   y2<y3
    ble.s .c2
    ;1230
   ; exg  d0,d3  ;0231
   ; exg  d1,d3  ;0132
   ; exg  d2,d3  ;0123
.c2
    move.l #$00010203,textureOrder
.draw

    cmp.w d2,d0 ;y0>y2
    bgt.s .done

    tst.w d1    ;x1<0
    blt.s .done 


    move.l d0,(a0)+
    move.l d1,(a0)+
    move.l d2,(a0)+
    move.l d3,(a0)+
    
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

    bsr tdraw_poly
.done:
    movem.l    (sp)+,d0-d7/a0-a6
    rts


tinit_value dc.w 0

tdraw_poly:    
    lea  trect,a0
    lea tline_r,a1
 
    lea u1,a4
    lea v1,a5
    moveq #0,d7

    lea tinit_value,a6
    move.w #0,tline_dy

    ;move.l #$00010203,textureOrder
    lea textureOrder,a3

    move.w (a0)+,d0
    move.w (a0)+,d1
    move.w (a0)+,d2
    move.w (a0)+,d3
    cmp.w d3,d1 ; d1>d3
    bgt .done


    move.w #0,(a6)  ; init value for u or v
    cmp.b #0,(a3)   ; check if u or v is calculated
    beq.s .l0
    cmp.b #2,(a3)
    beq.s .l0

; init first right line u,v
    lea v1,a4
    lea u1,a5
.l0
    cmp.b #0,(a3)   ; set init value 0 or 255 (texture width)
    beq.s .l1
    cmp.b #3,(a3)
    beq.s .l1
    move.w #255,(a6)
.l1
    cmp.b #0,(a3) ; check if 0 or 1 a first -> nothing todo
    beq.s .l1_
    cmp.b #1,(a3)
    beq.s .l1_
    move.w #255,d7
.l1_
    bsr tdpi_line
    moveq #0,d7

    lea  trect,a0
    adda.l #4,a0
    move.w (a0)+,d0
    move.w (a0)+,d1
    move.w (a0)+,d2
    move.w (a0)+,d3
    cmp.w d3,d1 ; d1>d3
    bgt .skip

;next right line:
    lea u1,a4                       ; reinit + pointer
    lea v1,a5
    moveq #0,d4
    move.w tline_dy,d4   
    lsl.w #1,d4
    add.l d4,a4
    add.l d4,a5

    move.w #0,(a6)  ; init value for u or v
    cmp.b #0,1(a3)   ; check if u or v is calculated
    beq.s .l2
    cmp.b #2,1(a3)
    beq.s .l2
    move.l a4,a2    ; exchange u and v
    move.l a5,a4
    move.l a2,a5
  
.l2
    cmp.b #0,1(a3)   ; set init value 0 or 256 (texture width)
    beq.s .l3
    cmp.b #3,1(a3)
    beq.s .l3
    move.w #255,(a6)
.l3
    cmp.b #0,1(a3) ; check if 0 or 1 a first -> nothing todo
    beq.s .l3_
    cmp.b #1,1(a3)
    beq.s .l3_
    move.w #255,d7
.l3_

    
    bsr tdpi_line
    moveq #0,d7

    lea  trect,a0
    adda.l #8,a0
    move.w (a0)+,d0
    move.w (a0)+,d1
    move.w (a0)+,d2
    move.w (a0)+,d3
    cmp.w d3,d1 ; d1>d3
    bgt .skip
;next right line (last):
    lea u1,a4                       ; reinit + pointer
    lea v1,a5
    moveq #0,d4
    move.w tline_dy,d4   
    lsl.w #1,d4
    add.l d4,a4
    add.l d4,a5

    move.w #0,(a6)  ; init value for u or v
    cmp.b #0,2(a3)   ; check if u or v is calculated
    beq.s .l22
    cmp.b #2,2(a3)
    beq.s .l22
    move.l a4,a2    ; exchange u and v
    move.l a5,a4
    move.l a2,a5
  
.l22
    cmp.b #0,2(a3)   ; set init value 0 or 256 (texture width)
    beq.s .l33
    cmp.b #3,2(a3)
    beq.s .l33
    move.w #255,(a6)
.l33
    
    bsr tdpi_line
    moveq #0,d7

.skip
    lea  trect,a0
    lea tline_l,a1

    move.w (a0),d0
    move.w 2(a0),d1
    move.w 12(a0),d2
    move.w 14(a0),d3
    cmp.w d3,d1 ; d1>d3
    bgt .done

; init first left line u,v
    move.w #0,tline_dy
    lea u0,a4
    lea v0,a5
    move.w #0,(a6)
    cmp.b #0,3(a3)   ; check if u or v is calculated
    beq.s .luv2
    cmp.b #2,3(a3)
    beq.s .luv2

    lea v0,a4
    lea u0,a5
.luv2

    cmp.b #0,3(a3)   ; set init value 0 or 256 (texture width)
    beq.s .luv3
    cmp.b #3,3(a3)
    beq.s .luv3
    move.w #255,(a6)
.luv3:

    cmp.b #2,3(a3) ; check if 0 or 1 a first -> nothing todo
    beq.s .luv3_
    cmp.b #3,3(a3)
    beq.s .luv3_
    move.w #255,d7
.luv3_
    bsr tdpi_line
    moveq #0,d7


    lea  trect,a0
    move.w 12(a0),d0
    move.w 14(a0),d1
    move.w 8(a0),d2
    move.w 10(a0),d3
    cmp.w d3,d1 ; d1>d3
    bgt .skip2

;next left line:

    lea u0,a4                       ; reinit + pointer
    lea v0,a5
    moveq #0,d4
    move.w tline_dy,d4   
    lsl.w #1,d4
    add.l d4,a4
    add.l d4,a5

    move.w #0,(a6)  ; init value for u or v
    cmp.b #0,2(a3)   ; check if u or v is calculated
    beq.s .luv4
    cmp.b #2,2(a3)
    beq.s .luv4
    move.l a4,a2    ; exchange u and v
    move.l a5,a4
    move.l a2,a5
  
.luv4:
    cmp.b #0,2(a3)   ; set init value 0 or 256 (texture width)
    beq.s .luv5
    cmp.b #3,2(a3)
    beq.s .luv5
    move.w #255,(a6)
.luv5

    cmp.b #2,2(a3) ; check if 0 or 1 a first -> nothing todo
    beq.s .l5_
    cmp.b #3,2(a3)
    beq.s .l5_
    move.w #255,d7
.l5_

    bsr tdpi_line
    moveq #0,d7

    lea  trect,a0
    move.w 8(a0),d0
    move.w 10(a0),d1
    move.w 4(a0),d2
    move.w 6(a0),d3
    cmp.w d3,d1 ; d1>d3
    bgt .skip2

;last left line:

    lea u0,a4                       ; reinit + pointer
    lea v0,a5
    moveq #0,d4
    move.w tline_dy,d4   
    lsl.w #1,d4
    add.l d4,a4
    add.l d4,a5

    move.w #0,(a6)  ; init value for u or v
    cmp.b #0,2(a3)   ; check if u or v is calculated
    beq.s .luv4_
    cmp.b #2,2(a3)
    beq.s .luv4_
    move.l a4,a2    ; exchange u and v
    move.l a5,a4
    move.l a2,a5
  
.luv4_:
    cmp.b #0,2(a3)   ; set init value 0 or 256 (texture width)
    beq.s .luv5_
    cmp.b #3,2(a3)
    beq.s .luv5_
    move.w #255,(a6)
.luv5_

    cmp.b #2,2(a3) ; check if 0 or 1 a first -> nothing todo
    beq.s .l5x_
    cmp.b #3,2(a3)
    beq.s .l5x_
    move.w #255,d7
.l5x_

    bsr tdpi_line


.skip2:
    ;d1 dy
    ;a0 Pointer to texture 
    ;a1 pointer line_l
    ;a2 pointer line_r
    lea  trect,a0
    move.w 10(a0),d1
    move.w 2(a0),d0
    sub.w d0,d1
    lea tline_l,a1
    lea tline_r,a2
    lea imagetest,a0
    ;bsr dpi_calculateUV
    bsr dpi_calculateUV_nosign
    ;d0 y start
    ;d1 dy
    ;a0 buffer
    ;a1 pointer line_l
    ;a2 pointer line_r

    lea  trect,a0
    move.w 10(a0),d1
    move.w 2(a0),d0

    cmp.w 14(a0),d1
    bge.s .dyok
    move.w 14(a0),d1
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
    sub.w #1,d1  (dy-1 for loop)
    ble.s .done  ;dy<=0? -> nothing todo
    move.l buffer,a0
    lea tline_l,a1
    lea tline_r,a2
    
    bsr tdpi_fill
.done
    rts


 



;d0 x0
;d1 y0
;d2 x1
;d3 y1
;a1 line pointer

tline_dy dc.w 0

tdpi_line:
   
    lea     q_y,a2    ; q_y  ;initinit
    move.w #0,(a2)
    move.w  d7,2(a2)

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
    move.l #$FF00,d2    ; texture width 255
    divu d5,d2      ;d2=q
   
    move.w d5,d3
    add.w d5,tline_dy  ; store dy
    subq.w #1,d3    ; loop init
    moveq #0,d6

    
.loop:
    addq.w #1,d1    ; y1++
    blt.s .dontStore    ; is outside screen
    move.w d0,(a1)+    ; store only x


    ; caculate u and v
    move.b #0,(a4)      ; clear upper byte
    move.b (a2),1(a4)   ; set value q*y
    adda.l #2,a4        ; increase pointer
    move.w (a6),(a5)+   ; set v or u with 0 or 256
    
    cmp.w #0,2(a2)      ; check direction
    bne.s .subValue
    add.w d2,(a2)      ; add y*q
    bra.s .dontStore
.subValue:
    sub.w d2,(a2)       ; sub y*q

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


q_y     dc.w 0,0

;d0 y start
;d1 dy
;a0 buffer
;a1 pointer line_l
;a2 pointer line_r

tdpi_fill
    ;move.l MAP_COLOR(a4),d5
    lea texture_signs_u_v,a4
    lea.l texture_pointers,a6
    mulu #160,d0
    add.l d0,a0

    moveq #0,d0
    moveq #0,d2
    moveq #0,d3
    moveq #0,d5
    moveq #0,d6
    moveq #0,d7

.loop:
    move.l (a6)+,a5

    move.w (a4)+,d6    ;signs
    move.w (a4)+,d0     ;du
    move.w  (a4)+,d7    ;dv
  
    moveq #0,d3
    moveq #0,d5

    ext.l d0
    ext.l d7

    moveq #0,d2
    move.l a0,a3    ; buffer pointer
    move.w (a1)+,d2 ; start x
    tst.w d2
    bge.s .clip0

    neg.w d2        ; correct u pointer
    move.l d2,d4
    muls d0,d2  
    move.l d2,d3  

    muls d7,d4      ; correct v pointer
    move.l d4,d5

    moveq #0,d2

.clip0
    add.l d2,a3     ; add to pointer
    move.w (a2)+,d4  ; sub end x
    blt.s .next
    cmp.w #160,d4
    blt.s .clip1
    move.w #160-1,d4
.clip1
    sub.w d2,d4        ; end x is bigger so invert
    blt.s .next
    

.hloop:
    move.l d3,d2
    lsr.l	#8,d2	; maybe .w is Ok
    
    move.l d5,d6
    move.b d2,d6

    move.b (a5,d6.l),(a3)+
    add.l d0,d3         ; +u/dx
    add.l d7,d5         ; +v/dy
    dbf d4,.hloop
    


.next:
    adda.l #160,a0

    
    ;lea.l imagetest,a5

    dbf d1,.loop    
    rts




;d1 dy
;a0 Pointer to texture 
;a1 pointer line_l
;a2 pointer line_r

tdpi_calculateUV
    lea  texture_pointers,a4
    lea  u0,a3
    lea  u1,a5
    lea  texture_signs_u_v,a6
    moveq #0,d3
    moveq #0,d5
    moveq #0,d6

.loop_y:
    moveq #0,d0
    move.w #0,(a6) ; init
    move.w (a1)+,d0 ; start x

;dx
    move.w (a2)+,d2  ; sub end x
    sub.w d0,d2      ; d2=dx
    beq.s .next
;texture pointer
    move.l a0,(a4)                      ;init with texture pointer
    move.w (a3),d0                      ;fetch u0
    add.l d0,(a4)                       ;add u0
    move.w 2*TEXTURE_MAX_HEIGHT(a3),d0    ;fetch v0    
    lsl.w #8,d0                         ;v0*texture width (256)
    add.l d0,(a4)+                      ;add v0 to pointer

;du
    moveq #0,d0
    move.w (a5),d0  ;u1
    sub.w  (a3),d0  ;u1-u0
    tst.w d0
    bge.s .nosign0
    neg  d0
    move.b #1,(a6)  ; set sign for u        
.nosign0:
    lsl.w #8,d0       ;8:8
    divu  d2,d0     ; (u1-u0)/dx
    move.w d0,2(a6)  ; store value

;dv
    moveq #0,d0
    move.w 2*TEXTURE_MAX_HEIGHT(a5),d0  ;v1
    sub.w  2*TEXTURE_MAX_HEIGHT(a3),d0  ;v1-v0
    tst.w d0
    bge.s .nosign1
    neg  d0
    move.b #1,1(a6)  ; set sign for v        
.nosign1:
    lsl.w #8,d0       ;8:8
    divu  d2,d0     ; (v1-v0)/dx
    move.w d0,4(a6)  ; store value


    adda.l #2,a3    ;next values u0,v0
    adda.l #2,a5    ;next values u1,v1
    adda.l #6,a6    ;next values sign,du,dv
.next
    dbf d1,.loop_y    
    rts



;d1 dy
;a0 Pointer to texture 
;a1 pointer line_l
;a2 pointer line_r

dpi_calculateUV_nosign
    lea  texture_pointers,a4
    lea  u0,a3
    lea  u1,a5
    lea  texture_signs_u_v,a6
    moveq #0,d3
    moveq #0,d5
    moveq #0,d6

.loop_y:
    moveq #0,d0
    move.w #0,(a6) ; init
    move.w (a1)+,d0 ; start x

;dx
    move.w (a2)+,d2  ; sub end x
    sub.w d0,d2      ; d2=dx
    beq.s .next
;texture pointer
    move.l a0,(a4)                      ;init with texture pointer
    move.w (a3),d0                      ;fetch u0
    add.l d0,(a4)                       ;add u0
    move.w 2*TEXTURE_MAX_HEIGHT(a3),d0    ;fetch v0    
    lsl.w #8,d0                         ;v0*texture width (256)
    add.l d0,(a4)+                      ;add v0 to pointer

;du
    moveq #0,d0
    move.w (a5),d0  ;u1
    sub.w  (a3),d0  ;u1-u0
   ; tst.w d0
   ; bge.s .nosign0
   ; neg  d0
   ; move.b #1,(a6)  ; set sign for u        
.nosign0:
    ext.l d0
    lsl.l #8,d0       ;8:8
    divs  d2,d0     ; (u1-u0)/dx
    move.w d0,2(a6)  ; store value

;dv
    moveq #0,d0
    move.w 2*TEXTURE_MAX_HEIGHT(a5),d0  ;v1
    sub.w  2*TEXTURE_MAX_HEIGHT(a3),d0  ;v1-v0
   ; tst.w d0
   ; bge.s .nosign1
   ; neg  d0
   ; move.b #1,1(a6)  ; set sign for v        
.nosign1:
    ext.l d0
    lsl.l #8,d0       ;8:8
    divs  d2,d0     ; (v1-v0)/dx
    move.w d0,4(a6)  ; store value


    adda.l #2,a3    ;next values u0,v0
    adda.l #2,a5    ;next values u1,v1
    adda.l #6,a6    ;next values sign,du,dv
.next
    dbf d1,.loop_y    
    rts







trect:
    dc.w    80,30
    dc.w    120,60
    dc.w    80,80
    dc.w    40,60
trect_end:

tline_y_start:  
    dc.w 0
tline_y_end:
    dc.w 0
tline_l ds.w 400
tline_r ds.w 400

textureOrder:
    dc.l    0

texture_lines:
    ds.w  (2+1+1)*400 ; pointer,u/dx,v/dy


TEXTURE_MAX_HEIGHT =400        
u0      ds.w TEXTURE_MAX_HEIGHT ;u
v0      ds.w TEXTURE_MAX_HEIGHT ;v

u1      ds.w TEXTURE_MAX_HEIGHT ;u
v1      ds.w TEXTURE_MAX_HEIGHT ;v


texture_pointers    ds.l TEXTURE_MAX_HEIGHT
texture_signs_u_v   ds.w TEXTURE_MAX_HEIGHT*3





imagetest: 
  ;include   "./data/demo/castleFloor.asm"
  include   "./data/demo/demoimage.asm"
  