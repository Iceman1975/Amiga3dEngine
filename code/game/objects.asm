OBJECT_LIST_LENGTH = 35

objectPointerStart    dc.l      -1,0
objectPointerList     ds.l      OBJECT_LIST_LENGTH*2
objectPointerListNum  dc.w      0


object_resetPointer:
                      move.w    #0,objectPointerListNum
                      rts

;a0 pointer to object
;d0 z-sort value
object_addPointer:
                      movem.l    d0-d7/a0-a6,-(sp)  
                      lea       objectPointerList(pc),a2
                      move.l    a0,d1
                      moveq     #0,d2
                      move.w    objectPointerListNum(pc),d2
                      lsl.w     #3,d2                                  ; *8 
                      add.l     d2,a2
                      move.l    d0,(a2)+                               ; set y-value
                      move.l    d1,(a2)+                               ; set pointer
                      add.w     #1,objectPointerListNum

.endCheck:            cmp.l     #-1,-16(a2)
                      beq.s     .done

.swap:                move.l    -8(a2),d2 
                      cmp.l     -16(a2),d2
                      ble.s     .done

                      move.l    -4(a2),d3
                      move.l    -16(a2),-8(a2)
                      move.l    -12(a2),-4(a2)
                      move.l    d2,-16(a2)
                      move.l    d3,-12(a2)
                      suba.l    #8,a2
                      bra.s     .endCheck
.done:
                      movem.l    (sp)+,d0-d7/a0-a6
                      rts