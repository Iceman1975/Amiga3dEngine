
animations_update:
    move.l currentLevel,a0
    move.l (a0),a3          ; pointer to map
    move.l a3,a5            ; store pointer
    move.l 40(a0),a0        ; pointer to animations
    cmp.l #0,a0
    beq.s .exit             ; 0= no animations
.loop:
    move.l (a0),a1            ; pointer to current animation
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

    move.l a5,a3
    add.l #4,a0
    cmp.l #-1,(a0)
    bne.s .loop
.exit
    rts