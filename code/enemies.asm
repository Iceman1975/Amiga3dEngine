ENEMY_ENTRY_SIZE=40

enemies_update:
  move.l currentLevel,a0
  move.l 44(a0),a1         ; pointer to enemies
  bpl     e_move     ; empty
  bra.s e_move_end            

e_move:
 
  cmp.w      #-1,(a1)                                        ; no ememy anymore?
  beq        e_move_end                             

  ifd        SCRIPTS_ENABLE
  tst.l      30(a2)
  beq        e_move_by_path                                 ; no script; use path instead
  move.l     30(a2),a5                                      ; get script
  tst.l      (a5)
  beq        e_move_by_path                                 ; no script for this method; use path instead

  movem.l    d0-d7/a0-a4,-(sp)                    
  move.l     34(a2),a3                                      ; get object

                    ; script entry point:
                    ; a0 - enemy active list pointer
                    ; a2 - enemy data
                    ; a3 - enemy object instance
                    ; a5 - pointer to class implementation
                    
  ;move.l     player_current,a4
  move.l     (a5),a5
  jsr        (a5)
  movem.l    (sp)+,d0-d7/a0-a4
                    ;bra        e_move_update_animation
  bra        e_move_page_check
  endif
                    
                    ; **** move by path **** Start
e_move_by_path:
	
  bsr        enimies_moveOnPath

                    ; **** move by path **** end

e_move_update_animation:


  bsr        enemy_animation



e_move_next:
  adda.l       #ENEMY_ENTRY_SIZE,a1
  bra e_move

e_move_end:
  rts

;a0 currentLevel
;a1 enemy pointer
;a3 pointer to map
enemy_animation:
  movem.l    d0-d7/a0-a6,-(sp)  
   move.l currentLevel,a0
    move.l (a0),a3          ; pointer to map
    move.l a3,a5            ; store pointer
    
    move.l 12(a1),a0        ; pointer to animation
    cmp.l #0,a0
    beq.s .exit             ; 0= no animations
.loop:
    move.l a0,a1            ; pointer to current animation

    add.l (a1),a3           ; move to object in map

    move.l a1,a2            ;lea torch_ani_pointer,a2
    add.l #4,a2

    move.l (a2),d0
    add.l #4,a2
    add.l d0,a2     ; pointer to animation frame

    cmp.w #-1,(a2)
    bne.s .done

    move.l a1,a2
    add.l #8,a2

    move.l #0,4(a1)
.done:
    moveq #0,d0
    move.w (a2),d0
    move.l d0,MAP_IMAGE(a3)
    add.l #2,4(a1)  ; increase pointer

.exit
    movem.l    (sp)+,d0-d7/a0-a6
    rts


enimies_moveOnPath:
; a1 = pointer enemy
; a0 = pointer to level
; d0,a1  working register

              move.l    (a1),a2                   ; get path

              move.l currentLevel,a0
              move.l (a0),a3          ; pointer to map              
              add.l  36(a1),a3                     ; pointer to map

              move.w    (a2),d0                                        ; add xSpeed
              add.w     d0,MAP_X0_INIT(a3)                              ; 
	
              move.w    2(a2),d0                                       ; add ySpeed
              add.w     d0,MAP_Z0_INIT(a3)                              ; add ySpeed

              add.l     #4,(a1)                   ; increase enemy.path

              move.l    (a1),a2                   ; get current path pointer
              move.w    (a2),d0                                        ; check if path ends
              cmp.w     #10,d0
              blt       .move_done 
              and.l     #$FFFF,d0                                      ; remove upper word
              sub.l     d0,(a1)                   ; back to th start
.move_done:
              rts