player_update:
                          lea.l      joystick1_left,a0
                          tst.b      (a0)
                          beq        spu_noLeft

                          ;test
                          ;add.w #PLAYER_SPEED,global_x
                          ;bra.s spu_update_done
                          ;test
                          
                          add.w #(PLAYER_ANGLE_SPEED*2),global_yAngle
                          move.w global_yAngle,d0
                          cmp.w #360*2,d0
                          blt.s .noCorrectionL
                          sub.w #360*2,global_yAngle
.noCorrectionL
spu_noLeft:
                          lea.l      joystick1_right,a0
                          tst.b      (a0)
                          beq        spu_noRight
                          ;test
                          ;add.w #-PLAYER_SPEED,global_x
                          ;bra.s spu_update_done
                          ;test

                          add.w #-(PLAYER_ANGLE_SPEED*2),global_yAngle
                          move.w global_yAngle,d0
                          tst.w d0
                          bge.s .noCorrectionR
                          add.w #360*2,global_yAngle
.noCorrectionR:

spu_noRight:
                          lea.l      joystick1_up,a0
                          tst.b      (a0)
                          beq        spu_noUp
                          moveq #PLAYER_SPEED,d1
                          bsr world3d_movePlayer
                          ;add.w #-PLAYER_SPEED,global_z
spu_noUp:
                          lea.l      joystick1_down,a0
                          tst.b      (a0)
                          beq        spu_noDown
                          moveq #-PLAYER_SPEED,d1
                          bsr world3d_movePlayer
                          ;add.w #PLAYER_SPEED,global_z
spu_noDown:

  
spu_xMovement_done:

                          lea.l      joystick1_button_automatic,a0                     ; shoot?
                          cmp.w      #1,(a0)
                          bne        spu_update_done
  				
spu_update_done:
                          rts