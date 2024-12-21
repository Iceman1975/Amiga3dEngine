enemies_update:
    lea enemy_data,a0
    lea enemyType0_ani,a1
    lea enemyType0_ani_pointer,a2

    adda.l (a2),a1
    cmp.w #-1,(a1)
    bne.s .done
    lea enemyType0_ani,a1
    move.l #0,(a2)
.done:

    
    moveq #0,d0
    move.w (a1),d0

    lea enemyType0,a3
    move.l a3,MAP_IMAGE(a0)
    add.l d0,MAP_IMAGE(a0)
    add.l #2,(a2)

    rts
