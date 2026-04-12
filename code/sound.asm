

sound_update:  

           lea.l     soundEventPrio0,a0 
           tst.l     (a0)
           beq       ss_done0
           
           move.l    (a0),a0         

           move.w    #$0001,$dff096        ; DMACON disable audio channel 0

           move.l    (a0),$dff0a0          ; AUD0LCH/AUD0LCL set audio channel 0 location to sample address                                           
           move.w    4(a0),$dff0a4         ; AUD0LEN set audio channel 0 length to 48452 words                                               
           move.w    6(a0),$dff0a6         ; AUD0PER set audio channel 0 period to 700 clocks (less is faster)                                 
           move.w    8(a0),$dff0a8         ; AUD0VOL set audio channel 0 volume to 0                                          
                            
           move.w    #$8001,$dff096        ; DMACON enable audio channel 0

ss_done0:           
           lea.l     soundEventPrio1,a0 
           tst.l     (a0)
           beq       ss_done1
           
           move.l    (a0),a0         

           move.w    #$0002,$dff096        ; DMACON disable audio channel 1

           move.l    (a0),$dff0b0          ; AUD1LCH/AUD1LCL set audio channel 0 location to sample address                                           
           move.w    4(a0),$dff0b4         ; AUD1LEN set audio channel 0 length to 48452 words                                               
           move.w    6(a0),$dff0b6         ; AUD1PER set audio channel 0 period to 700 clocks (less is faster)                                 
           move.w    8(a0),$dff0b8         ; AUD1VOL set audio channel 0 volume to 0                                          
                            
           move.w    #$8002,$dff096        ; DMACON enable audio channel 1
ss_done1:           
           lea.l     soundEventPrio2,a0 
           tst.l     (a0)
           beq       ss_done2
           
           move.l    (a0),a0         

           move.w    #$0004,$dff096        ; DMACON disable audio channel 2

           move.l    (a0),$dff0c0          ; AUD2LCH/AUD3LCL set audio channel 0 location to sample address                                           
           move.w    4(a0),$dff0c4         ; AUD2LEN set audio channel 0 length to 48452 words                                               
           move.w    6(a0),$dff0c6         ; AUD2PER set audio channel 0 period to 700 clocks (less is faster)                                 
           move.w    8(a0),$dff0c8         ; AUD2VOL set audio channel 0 volume to 0                                          
                            
           move.w    #$8004,$dff096        ; DMACON enable audio channel 2
ss_done2:    
           lea.l     soundEventPrio3,a0 
           tst.l     (a0)
           beq       ss_done3
           
           move.l    (a0),a0         

           move.w    #$0008,$dff096        ; DMACON disable audio channel 3

           move.l    (a0),$dff0d0          ; AUD3LCH/AUD3LCL set audio channel 0 location to sample address                                           
           move.w    4(a0),$dff0d4         ; AUD3LEN set audio channel 0 length to 48452 words                                               
           move.w    6(a0),$dff0d6         ; AUD3PER set audio channel 0 period to 700 clocks (less is faster)                                 
           move.w    8(a0),$dff0d8         ; AUD3VOL set audio channel 0 volume to 0                                          
                            
           move.w    #$8008,$dff096        ; DMACON enable audio channel 3
ss_done3:  

           rts
; and play


sound_cleanup:
           lea.l     soundEventPrio0,a0 
           tst.l     (a0)
           beq       ss_cu_done0

           move.l    #0,soundEventPrio0
           move.l    soundStop,$dff0a0     ; stop after play once
           move.w    #1,$dff0a4           
ss_cu_done0:      
           lea.l     soundEventPrio1,a0 
           tst.l     (a0)
           beq       ss_cu_done1

           move.l    #0,soundEventPrio1
           move.l    soundStop,$dff0b0     ; stop after play once
           move.w    #1,$dff0b4           
ss_cu_done1: 
           lea.l     soundEventPrio2,a0 
           tst.l     (a0)
           beq       ss_cu_done2

           move.l    #0,soundEventPrio2
           move.l    soundStop,$dff0c0     ; stop after play once
           move.w    #1,$dff0c4           
ss_cu_done2:       
           lea.l     soundEventPrio3,a0 
           tst.l     (a0)
           beq       ss_cu_done3

           move.l    #0,soundEventPrio3
           move.l    soundStop,$dff0d0     ; stop after play once
           move.w    #1,$dff0d4           
ss_cu_done3:  
           rts


sound_prepare:
           lea.l     soundEventPrio0,a0 
           tst.l     (a0)
           beq       ss_pr_done0
           move.w    #$0001,$dff096           
ss_pr_done0:           
           lea.l     soundEventPrio1,a0 
           tst.l     (a0)
           beq       ss_pr_done1
           move.w    #$0002,$dff096           
ss_pr_done1:           
           lea.l     soundEventPrio2,a0 
           tst.l     (a0)
           beq       ss_pr_done2
           move.w    #$0004,$dff096           
ss_pr_done2:         
           lea.l     soundEventPrio3,a0 
           tst.l     (a0)
           beq       ss_pr_done3
           move.w    #$0008,$dff096           
ss_pr_done3: 
           rts


soundStop  dc.w      0
