vline0:
	add.b d0,d0
	bcc.s .no00Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no00Bitplane
	add.b d0,d0
	bcc.s .no10Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no10Bitplane
	add.b d0,d0
	bcc.s .no20Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no20Bitplane
	add.b d0,d0
	bcc.s .no30Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no30Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
    
vline1:
	add.b d0,d0
	bcc.s .no01Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no01Bitplane
	add.b d0,d0
	bcc.s .no11Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no11Bitplane
	add.b d0,d0
	bcc.s .no21Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no21Bitplane
	add.b d0,d0
	bcc.s .no31Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no31Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3

    
vline2:
	add.b d0,d0
	bcc.s .no02Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no02Bitplane
	add.b d0,d0
	bcc.s .no12Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no12Bitplane
	add.b d0,d0
	bcc.s .no22Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no22Bitplane
	add.b d0,d0
	bcc.s .no32Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no32Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline3:
	add.b d0,d0
	bcc.s .no03Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no03Bitplane
	add.b d0,d0
	bcc.s .no13Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no13Bitplane
	add.b d0,d0
	bcc.s .no23Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no23Bitplane
	add.b d0,d0
	bcc.s .no33Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no33Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline4:
	add.b d0,d0
	bcc.s .no04Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no04Bitplane
	add.b d0,d0
	bcc.s .no14Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no14Bitplane
	add.b d0,d0
	bcc.s .no24Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no24Bitplane
	add.b d0,d0
	bcc.s .no34Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no34Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline5:
	add.b d0,d0
	bcc.s .no05Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no05Bitplane
	add.b d0,d0
	bcc.s .no15Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no15Bitplane
	add.b d0,d0
	bcc.s .no25Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no25Bitplane
	add.b d0,d0
	bcc.s .no35Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no35Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline6:
	add.b d0,d0
	bcc.s .no06Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no06Bitplane
	add.b d0,d0
	bcc.s .no16Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no16Bitplane
	add.b d0,d0
	bcc.s .no26Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no26Bitplane
	add.b d0,d0
	bcc.s .no36Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no36Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline7:
	add.b d0,d0
	bcc.s .no07Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no07Bitplane
	add.b d0,d0
	bcc.s .no17Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no17Bitplane
	add.b d0,d0
	bcc.s .no27Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no27Bitplane
	add.b d0,d0
	bcc.s .no37Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no37Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline8:
	add.b d0,d0
	bcc.s .no08Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no08Bitplane
	add.b d0,d0
	bcc.s .no18Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no18Bitplane
	add.b d0,d0
	bcc.s .no28Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no28Bitplane
	add.b d0,d0
	bcc.s .no38Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no38Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline9:
	add.b d0,d0
	bcc.s .no09Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no09Bitplane
	add.b d0,d0
	bcc.s .no19Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no19Bitplane
	add.b d0,d0
	bcc.s .no29Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no29Bitplane
	add.b d0,d0
	bcc.s .no39Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no39Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline10:
	add.b d0,d0
	bcc.s .no010Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no010Bitplane
	add.b d0,d0
	bcc.s .no110Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no110Bitplane
	add.b d0,d0
	bcc.s .no210Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no210Bitplane
	add.b d0,d0
	bcc.s .no310Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no310Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline11:
	add.b d0,d0
	bcc.s .no011Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no011Bitplane
	add.b d0,d0
	bcc.s .no111Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no111Bitplane
	add.b d0,d0
	bcc.s .no211Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no211Bitplane
	add.b d0,d0
	bcc.s .no311Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no311Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline12:
	add.b d0,d0
	bcc.s .no012Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no012Bitplane
	add.b d0,d0
	bcc.s .no112Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no112Bitplane
	add.b d0,d0
	bcc.s .no212Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no212Bitplane
	add.b d0,d0
	bcc.s .no312Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no312Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline13:
	add.b d0,d0
	bcc.s .no013Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no013Bitplane
	add.b d0,d0
	bcc.s .no113Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no113Bitplane
	add.b d0,d0
	bcc.s .no213Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no213Bitplane
	add.b d0,d0
	bcc.s .no313Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no313Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline14:
	add.b d0,d0
	bcc.s .no014Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no014Bitplane
	add.b d0,d0
	bcc.s .no114Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no114Bitplane
	add.b d0,d0
	bcc.s .no214Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no214Bitplane
	add.b d0,d0
	bcc.s .no314Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no314Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline15:
	add.b d0,d0
	bcc.s .no015Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no015Bitplane
	add.b d0,d0
	bcc.s .no115Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no115Bitplane
	add.b d0,d0
	bcc.s .no215Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no215Bitplane
	add.b d0,d0
	bcc.s .no315Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no315Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline16:
	add.b d0,d0
	bcc.s .no016Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no016Bitplane
	add.b d0,d0
	bcc.s .no116Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no116Bitplane
	add.b d0,d0
	bcc.s .no216Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no216Bitplane
	add.b d0,d0
	bcc.s .no316Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no316Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline17:
	add.b d0,d0
	bcc.s .no017Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no017Bitplane
	add.b d0,d0
	bcc.s .no117Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no117Bitplane
	add.b d0,d0
	bcc.s .no217Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no217Bitplane
	add.b d0,d0
	bcc.s .no317Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no317Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline18:
	add.b d0,d0
	bcc.s .no018Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no018Bitplane
	add.b d0,d0
	bcc.s .no118Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no118Bitplane
	add.b d0,d0
	bcc.s .no218Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no218Bitplane
	add.b d0,d0
	bcc.s .no318Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no318Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline19:
	add.b d0,d0
	bcc.s .no019Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no019Bitplane
	add.b d0,d0
	bcc.s .no119Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no119Bitplane
	add.b d0,d0
	bcc.s .no219Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no219Bitplane
	add.b d0,d0
	bcc.s .no319Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no319Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline20:
	add.b d0,d0
	bcc.s .no020Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no020Bitplane
	add.b d0,d0
	bcc.s .no120Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no120Bitplane
	add.b d0,d0
	bcc.s .no220Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no220Bitplane
	add.b d0,d0
	bcc.s .no320Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no320Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline21:
	add.b d0,d0
	bcc.s .no021Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no021Bitplane
	add.b d0,d0
	bcc.s .no121Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no121Bitplane
	add.b d0,d0
	bcc.s .no221Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no221Bitplane
	add.b d0,d0
	bcc.s .no321Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no321Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline22:
	add.b d0,d0
	bcc.s .no022Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no022Bitplane
	add.b d0,d0
	bcc.s .no122Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no122Bitplane
	add.b d0,d0
	bcc.s .no222Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no222Bitplane
	add.b d0,d0
	bcc.s .no322Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no322Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline23:
	add.b d0,d0
	bcc.s .no023Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no023Bitplane
	add.b d0,d0
	bcc.s .no123Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no123Bitplane
	add.b d0,d0
	bcc.s .no223Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no223Bitplane
	add.b d0,d0
	bcc.s .no323Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no323Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline24:
	add.b d0,d0
	bcc.s .no024Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no024Bitplane
	add.b d0,d0
	bcc.s .no124Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no124Bitplane
	add.b d0,d0
	bcc.s .no224Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no224Bitplane
	add.b d0,d0
	bcc.s .no324Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no324Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline25:
	add.b d0,d0
	bcc.s .no025Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no025Bitplane
	add.b d0,d0
	bcc.s .no125Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no125Bitplane
	add.b d0,d0
	bcc.s .no225Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no225Bitplane
	add.b d0,d0
	bcc.s .no325Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no325Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline26:
	add.b d0,d0
	bcc.s .no026Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no026Bitplane
	add.b d0,d0
	bcc.s .no126Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no126Bitplane
	add.b d0,d0
	bcc.s .no226Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no226Bitplane
	add.b d0,d0
	bcc.s .no326Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no326Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline27:
	add.b d0,d0
	bcc.s .no027Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no027Bitplane
	add.b d0,d0
	bcc.s .no127Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no127Bitplane
	add.b d0,d0
	bcc.s .no227Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no227Bitplane
	add.b d0,d0
	bcc.s .no327Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no327Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline28:
	add.b d0,d0
	bcc.s .no028Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no028Bitplane
	add.b d0,d0
	bcc.s .no128Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no128Bitplane
	add.b d0,d0
	bcc.s .no228Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no228Bitplane
	add.b d0,d0
	bcc.s .no328Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no328Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline29:
	add.b d0,d0
	bcc.s .no029Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no029Bitplane
	add.b d0,d0
	bcc.s .no129Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no129Bitplane
	add.b d0,d0
	bcc.s .no229Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no229Bitplane
	add.b d0,d0
	bcc.s .no329Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no329Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline30:
	add.b d0,d0
	bcc.s .no030Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no030Bitplane
	add.b d0,d0
	bcc.s .no130Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no130Bitplane
	add.b d0,d0
	bcc.s .no230Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no230Bitplane
	add.b d0,d0
	bcc.s .no330Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no330Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline31:
	add.b d0,d0
	bcc.s .no031Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no031Bitplane
	add.b d0,d0
	bcc.s .no131Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no131Bitplane
	add.b d0,d0
	bcc.s .no231Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no231Bitplane
	add.b d0,d0
	bcc.s .no331Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no331Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline32:
	add.b d0,d0
	bcc.s .no032Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no032Bitplane
	add.b d0,d0
	bcc.s .no132Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no132Bitplane
	add.b d0,d0
	bcc.s .no232Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no232Bitplane
	add.b d0,d0
	bcc.s .no332Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no332Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline33:
	add.b d0,d0
	bcc.s .no033Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no033Bitplane
	add.b d0,d0
	bcc.s .no133Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no133Bitplane
	add.b d0,d0
	bcc.s .no233Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no233Bitplane
	add.b d0,d0
	bcc.s .no333Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no333Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline34:
	add.b d0,d0
	bcc.s .no034Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no034Bitplane
	add.b d0,d0
	bcc.s .no134Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no134Bitplane
	add.b d0,d0
	bcc.s .no234Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no234Bitplane
	add.b d0,d0
	bcc.s .no334Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no334Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline35:
	add.b d0,d0
	bcc.s .no035Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no035Bitplane
	add.b d0,d0
	bcc.s .no135Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no135Bitplane
	add.b d0,d0
	bcc.s .no235Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no235Bitplane
	add.b d0,d0
	bcc.s .no335Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no335Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline36:
	add.b d0,d0
	bcc.s .no036Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no036Bitplane
	add.b d0,d0
	bcc.s .no136Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no136Bitplane
	add.b d0,d0
	bcc.s .no236Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no236Bitplane
	add.b d0,d0
	bcc.s .no336Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no336Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline37:
	add.b d0,d0
	bcc.s .no037Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no037Bitplane
	add.b d0,d0
	bcc.s .no137Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no137Bitplane
	add.b d0,d0
	bcc.s .no237Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no237Bitplane
	add.b d0,d0
	bcc.s .no337Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no337Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline38:
	add.b d0,d0
	bcc.s .no038Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no038Bitplane
	add.b d0,d0
	bcc.s .no138Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no138Bitplane
	add.b d0,d0
	bcc.s .no238Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no238Bitplane
	add.b d0,d0
	bcc.s .no338Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no338Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline39:
	add.b d0,d0
	bcc.s .no039Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no039Bitplane
	add.b d0,d0
	bcc.s .no139Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no139Bitplane
	add.b d0,d0
	bcc.s .no239Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no239Bitplane
	add.b d0,d0
	bcc.s .no339Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no339Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline40:
	add.b d0,d0
	bcc.s .no040Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no040Bitplane
	add.b d0,d0
	bcc.s .no140Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no140Bitplane
	add.b d0,d0
	bcc.s .no240Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no240Bitplane
	add.b d0,d0
	bcc.s .no340Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no340Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline41:
	add.b d0,d0
	bcc.s .no041Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no041Bitplane
	add.b d0,d0
	bcc.s .no141Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no141Bitplane
	add.b d0,d0
	bcc.s .no241Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no241Bitplane
	add.b d0,d0
	bcc.s .no341Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no341Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline42:
	add.b d0,d0
	bcc.s .no042Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no042Bitplane
	add.b d0,d0
	bcc.s .no142Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no142Bitplane
	add.b d0,d0
	bcc.s .no242Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no242Bitplane
	add.b d0,d0
	bcc.s .no342Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no342Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline43:
	add.b d0,d0
	bcc.s .no043Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no043Bitplane
	add.b d0,d0
	bcc.s .no143Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no143Bitplane
	add.b d0,d0
	bcc.s .no243Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no243Bitplane
	add.b d0,d0
	bcc.s .no343Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no343Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline44:
	add.b d0,d0
	bcc.s .no044Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no044Bitplane
	add.b d0,d0
	bcc.s .no144Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no144Bitplane
	add.b d0,d0
	bcc.s .no244Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no244Bitplane
	add.b d0,d0
	bcc.s .no344Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no344Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline45:
	add.b d0,d0
	bcc.s .no045Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no045Bitplane
	add.b d0,d0
	bcc.s .no145Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no145Bitplane
	add.b d0,d0
	bcc.s .no245Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no245Bitplane
	add.b d0,d0
	bcc.s .no345Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no345Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline46:
	add.b d0,d0
	bcc.s .no046Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no046Bitplane
	add.b d0,d0
	bcc.s .no146Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no146Bitplane
	add.b d0,d0
	bcc.s .no246Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no246Bitplane
	add.b d0,d0
	bcc.s .no346Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no346Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline47:
	add.b d0,d0
	bcc.s .no047Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no047Bitplane
	add.b d0,d0
	bcc.s .no147Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no147Bitplane
	add.b d0,d0
	bcc.s .no247Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no247Bitplane
	add.b d0,d0
	bcc.s .no347Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no347Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline48:
	add.b d0,d0
	bcc.s .no048Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no048Bitplane
	add.b d0,d0
	bcc.s .no148Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no148Bitplane
	add.b d0,d0
	bcc.s .no248Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no248Bitplane
	add.b d0,d0
	bcc.s .no348Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no348Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline49:
	add.b d0,d0
	bcc.s .no049Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no049Bitplane
	add.b d0,d0
	bcc.s .no149Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no149Bitplane
	add.b d0,d0
	bcc.s .no249Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no249Bitplane
	add.b d0,d0
	bcc.s .no349Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no349Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline50:
	add.b d0,d0
	bcc.s .no050Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no050Bitplane
	add.b d0,d0
	bcc.s .no150Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no150Bitplane
	add.b d0,d0
	bcc.s .no250Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no250Bitplane
	add.b d0,d0
	bcc.s .no350Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no350Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline51:
	add.b d0,d0
	bcc.s .no051Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no051Bitplane
	add.b d0,d0
	bcc.s .no151Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no151Bitplane
	add.b d0,d0
	bcc.s .no251Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no251Bitplane
	add.b d0,d0
	bcc.s .no351Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no351Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline52:
	add.b d0,d0
	bcc.s .no052Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no052Bitplane
	add.b d0,d0
	bcc.s .no152Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no152Bitplane
	add.b d0,d0
	bcc.s .no252Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no252Bitplane
	add.b d0,d0
	bcc.s .no352Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no352Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline53:
	add.b d0,d0
	bcc.s .no053Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no053Bitplane
	add.b d0,d0
	bcc.s .no153Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no153Bitplane
	add.b d0,d0
	bcc.s .no253Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no253Bitplane
	add.b d0,d0
	bcc.s .no353Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no353Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline54:
	add.b d0,d0
	bcc.s .no054Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no054Bitplane
	add.b d0,d0
	bcc.s .no154Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no154Bitplane
	add.b d0,d0
	bcc.s .no254Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no254Bitplane
	add.b d0,d0
	bcc.s .no354Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no354Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline55:
	add.b d0,d0
	bcc.s .no055Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no055Bitplane
	add.b d0,d0
	bcc.s .no155Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no155Bitplane
	add.b d0,d0
	bcc.s .no255Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no255Bitplane
	add.b d0,d0
	bcc.s .no355Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no355Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline56:
	add.b d0,d0
	bcc.s .no056Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no056Bitplane
	add.b d0,d0
	bcc.s .no156Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no156Bitplane
	add.b d0,d0
	bcc.s .no256Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no256Bitplane
	add.b d0,d0
	bcc.s .no356Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no356Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline57:
	add.b d0,d0
	bcc.s .no057Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no057Bitplane
	add.b d0,d0
	bcc.s .no157Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no157Bitplane
	add.b d0,d0
	bcc.s .no257Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no257Bitplane
	add.b d0,d0
	bcc.s .no357Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no357Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline58:
	add.b d0,d0
	bcc.s .no058Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no058Bitplane
	add.b d0,d0
	bcc.s .no158Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no158Bitplane
	add.b d0,d0
	bcc.s .no258Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no258Bitplane
	add.b d0,d0
	bcc.s .no358Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no358Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline59:
	add.b d0,d0
	bcc.s .no059Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no059Bitplane
	add.b d0,d0
	bcc.s .no159Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no159Bitplane
	add.b d0,d0
	bcc.s .no259Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no259Bitplane
	add.b d0,d0
	bcc.s .no359Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no359Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline60:
	add.b d0,d0
	bcc.s .no060Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no060Bitplane
	add.b d0,d0
	bcc.s .no160Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no160Bitplane
	add.b d0,d0
	bcc.s .no260Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no260Bitplane
	add.b d0,d0
	bcc.s .no360Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no360Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline61:
	add.b d0,d0
	bcc.s .no061Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no061Bitplane
	add.b d0,d0
	bcc.s .no161Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no161Bitplane
	add.b d0,d0
	bcc.s .no261Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no261Bitplane
	add.b d0,d0
	bcc.s .no361Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no361Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline62:
	add.b d0,d0
	bcc.s .no062Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no062Bitplane
	add.b d0,d0
	bcc.s .no162Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no162Bitplane
	add.b d0,d0
	bcc.s .no262Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no262Bitplane
	add.b d0,d0
	bcc.s .no362Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no362Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline63:
	add.b d0,d0
	bcc.s .no063Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no063Bitplane
	add.b d0,d0
	bcc.s .no163Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no163Bitplane
	add.b d0,d0
	bcc.s .no263Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no263Bitplane
	add.b d0,d0
	bcc.s .no363Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no363Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline64:
	add.b d0,d0
	bcc.s .no064Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no064Bitplane
	add.b d0,d0
	bcc.s .no164Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no164Bitplane
	add.b d0,d0
	bcc.s .no264Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no264Bitplane
	add.b d0,d0
	bcc.s .no364Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no364Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline65:
	add.b d0,d0
	bcc.s .no065Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no065Bitplane
	add.b d0,d0
	bcc.s .no165Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no165Bitplane
	add.b d0,d0
	bcc.s .no265Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no265Bitplane
	add.b d0,d0
	bcc.s .no365Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no365Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline66:
	add.b d0,d0
	bcc.s .no066Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no066Bitplane
	add.b d0,d0
	bcc.s .no166Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no166Bitplane
	add.b d0,d0
	bcc.s .no266Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no266Bitplane
	add.b d0,d0
	bcc.s .no366Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no366Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline67:
	add.b d0,d0
	bcc.s .no067Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no067Bitplane
	add.b d0,d0
	bcc.s .no167Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no167Bitplane
	add.b d0,d0
	bcc.s .no267Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no267Bitplane
	add.b d0,d0
	bcc.s .no367Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no367Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline68:
	add.b d0,d0
	bcc.s .no068Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no068Bitplane
	add.b d0,d0
	bcc.s .no168Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no168Bitplane
	add.b d0,d0
	bcc.s .no268Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no268Bitplane
	add.b d0,d0
	bcc.s .no368Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no368Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline69:
	add.b d0,d0
	bcc.s .no069Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no069Bitplane
	add.b d0,d0
	bcc.s .no169Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no169Bitplane
	add.b d0,d0
	bcc.s .no269Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no269Bitplane
	add.b d0,d0
	bcc.s .no369Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no369Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline70:
	add.b d0,d0
	bcc.s .no070Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no070Bitplane
	add.b d0,d0
	bcc.s .no170Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no170Bitplane
	add.b d0,d0
	bcc.s .no270Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no270Bitplane
	add.b d0,d0
	bcc.s .no370Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no370Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline71:
	add.b d0,d0
	bcc.s .no071Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no071Bitplane
	add.b d0,d0
	bcc.s .no171Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no171Bitplane
	add.b d0,d0
	bcc.s .no271Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no271Bitplane
	add.b d0,d0
	bcc.s .no371Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no371Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline72:
	add.b d0,d0
	bcc.s .no072Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no072Bitplane
	add.b d0,d0
	bcc.s .no172Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no172Bitplane
	add.b d0,d0
	bcc.s .no272Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no272Bitplane
	add.b d0,d0
	bcc.s .no372Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no372Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline73:
	add.b d0,d0
	bcc.s .no073Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no073Bitplane
	add.b d0,d0
	bcc.s .no173Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no173Bitplane
	add.b d0,d0
	bcc.s .no273Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no273Bitplane
	add.b d0,d0
	bcc.s .no373Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no373Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline74:
	add.b d0,d0
	bcc.s .no074Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no074Bitplane
	add.b d0,d0
	bcc.s .no174Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no174Bitplane
	add.b d0,d0
	bcc.s .no274Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no274Bitplane
	add.b d0,d0
	bcc.s .no374Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no374Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline75:
	add.b d0,d0
	bcc.s .no075Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no075Bitplane
	add.b d0,d0
	bcc.s .no175Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no175Bitplane
	add.b d0,d0
	bcc.s .no275Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no275Bitplane
	add.b d0,d0
	bcc.s .no375Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no375Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline76:
	add.b d0,d0
	bcc.s .no076Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no076Bitplane
	add.b d0,d0
	bcc.s .no176Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no176Bitplane
	add.b d0,d0
	bcc.s .no276Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no276Bitplane
	add.b d0,d0
	bcc.s .no376Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no376Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline77:
	add.b d0,d0
	bcc.s .no077Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no077Bitplane
	add.b d0,d0
	bcc.s .no177Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no177Bitplane
	add.b d0,d0
	bcc.s .no277Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no277Bitplane
	add.b d0,d0
	bcc.s .no377Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no377Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline78:
	add.b d0,d0
	bcc.s .no078Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no078Bitplane
	add.b d0,d0
	bcc.s .no178Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no178Bitplane
	add.b d0,d0
	bcc.s .no278Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no278Bitplane
	add.b d0,d0
	bcc.s .no378Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no378Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline79:
	add.b d0,d0
	bcc.s .no079Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no079Bitplane
	add.b d0,d0
	bcc.s .no179Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no179Bitplane
	add.b d0,d0
	bcc.s .no279Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no279Bitplane
	add.b d0,d0
	bcc.s .no379Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no379Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline80:
	add.b d0,d0
	bcc.s .no080Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no080Bitplane
	add.b d0,d0
	bcc.s .no180Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no180Bitplane
	add.b d0,d0
	bcc.s .no280Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no280Bitplane
	add.b d0,d0
	bcc.s .no380Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no380Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline81:
	add.b d0,d0
	bcc.s .no081Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no081Bitplane
	add.b d0,d0
	bcc.s .no181Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no181Bitplane
	add.b d0,d0
	bcc.s .no281Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no281Bitplane
	add.b d0,d0
	bcc.s .no381Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no381Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline82:
	add.b d0,d0
	bcc.s .no082Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no082Bitplane
	add.b d0,d0
	bcc.s .no182Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no182Bitplane
	add.b d0,d0
	bcc.s .no282Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no282Bitplane
	add.b d0,d0
	bcc.s .no382Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no382Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline83:
	add.b d0,d0
	bcc.s .no083Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no083Bitplane
	add.b d0,d0
	bcc.s .no183Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no183Bitplane
	add.b d0,d0
	bcc.s .no283Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no283Bitplane
	add.b d0,d0
	bcc.s .no383Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no383Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline84:
	add.b d0,d0
	bcc.s .no084Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no084Bitplane
	add.b d0,d0
	bcc.s .no184Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no184Bitplane
	add.b d0,d0
	bcc.s .no284Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no284Bitplane
	add.b d0,d0
	bcc.s .no384Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no384Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline85:
	add.b d0,d0
	bcc.s .no085Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no085Bitplane
	add.b d0,d0
	bcc.s .no185Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no185Bitplane
	add.b d0,d0
	bcc.s .no285Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no285Bitplane
	add.b d0,d0
	bcc.s .no385Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no385Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline86:
	add.b d0,d0
	bcc.s .no086Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no086Bitplane
	add.b d0,d0
	bcc.s .no186Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no186Bitplane
	add.b d0,d0
	bcc.s .no286Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no286Bitplane
	add.b d0,d0
	bcc.s .no386Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no386Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline87:
	add.b d0,d0
	bcc.s .no087Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no087Bitplane
	add.b d0,d0
	bcc.s .no187Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no187Bitplane
	add.b d0,d0
	bcc.s .no287Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no287Bitplane
	add.b d0,d0
	bcc.s .no387Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no387Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline88:
	add.b d0,d0
	bcc.s .no088Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no088Bitplane
	add.b d0,d0
	bcc.s .no188Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no188Bitplane
	add.b d0,d0
	bcc.s .no288Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no288Bitplane
	add.b d0,d0
	bcc.s .no388Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no388Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline89:
	add.b d0,d0
	bcc.s .no089Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no089Bitplane
	add.b d0,d0
	bcc.s .no189Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no189Bitplane
	add.b d0,d0
	bcc.s .no289Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no289Bitplane
	add.b d0,d0
	bcc.s .no389Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no389Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline90:
	add.b d0,d0
	bcc.s .no090Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no090Bitplane
	add.b d0,d0
	bcc.s .no190Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no190Bitplane
	add.b d0,d0
	bcc.s .no290Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no290Bitplane
	add.b d0,d0
	bcc.s .no390Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no390Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline91:
	add.b d0,d0
	bcc.s .no091Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no091Bitplane
	add.b d0,d0
	bcc.s .no191Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no191Bitplane
	add.b d0,d0
	bcc.s .no291Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no291Bitplane
	add.b d0,d0
	bcc.s .no391Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no391Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline92:
	add.b d0,d0
	bcc.s .no092Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no092Bitplane
	add.b d0,d0
	bcc.s .no192Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no192Bitplane
	add.b d0,d0
	bcc.s .no292Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no292Bitplane
	add.b d0,d0
	bcc.s .no392Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no392Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline93:
	add.b d0,d0
	bcc.s .no093Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no093Bitplane
	add.b d0,d0
	bcc.s .no193Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no193Bitplane
	add.b d0,d0
	bcc.s .no293Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no293Bitplane
	add.b d0,d0
	bcc.s .no393Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no393Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline94:
	add.b d0,d0
	bcc.s .no094Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no094Bitplane
	add.b d0,d0
	bcc.s .no194Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no194Bitplane
	add.b d0,d0
	bcc.s .no294Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no294Bitplane
	add.b d0,d0
	bcc.s .no394Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no394Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline95:
	add.b d0,d0
	bcc.s .no095Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no095Bitplane
	add.b d0,d0
	bcc.s .no195Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no195Bitplane
	add.b d0,d0
	bcc.s .no295Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no295Bitplane
	add.b d0,d0
	bcc.s .no395Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no395Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline96:
	add.b d0,d0
	bcc.s .no096Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no096Bitplane
	add.b d0,d0
	bcc.s .no196Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no196Bitplane
	add.b d0,d0
	bcc.s .no296Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no296Bitplane
	add.b d0,d0
	bcc.s .no396Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no396Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline97:
	add.b d0,d0
	bcc.s .no097Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no097Bitplane
	add.b d0,d0
	bcc.s .no197Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no197Bitplane
	add.b d0,d0
	bcc.s .no297Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no297Bitplane
	add.b d0,d0
	bcc.s .no397Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no397Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline98:
	add.b d0,d0
	bcc.s .no098Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no098Bitplane
	add.b d0,d0
	bcc.s .no198Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no198Bitplane
	add.b d0,d0
	bcc.s .no298Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no298Bitplane
	add.b d0,d0
	bcc.s .no398Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no398Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline99:
	add.b d0,d0
	bcc.s .no099Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no099Bitplane
	add.b d0,d0
	bcc.s .no199Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no199Bitplane
	add.b d0,d0
	bcc.s .no299Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no299Bitplane
	add.b d0,d0
	bcc.s .no399Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no399Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline100:
	add.b d0,d0
	bcc.s .no0100Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0100Bitplane
	add.b d0,d0
	bcc.s .no1100Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1100Bitplane
	add.b d0,d0
	bcc.s .no2100Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2100Bitplane
	add.b d0,d0
	bcc.s .no3100Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3100Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline101:
	add.b d0,d0
	bcc.s .no0101Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0101Bitplane
	add.b d0,d0
	bcc.s .no1101Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1101Bitplane
	add.b d0,d0
	bcc.s .no2101Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2101Bitplane
	add.b d0,d0
	bcc.s .no3101Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3101Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline102:
	add.b d0,d0
	bcc.s .no0102Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0102Bitplane
	add.b d0,d0
	bcc.s .no1102Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1102Bitplane
	add.b d0,d0
	bcc.s .no2102Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2102Bitplane
	add.b d0,d0
	bcc.s .no3102Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3102Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline103:
	add.b d0,d0
	bcc.s .no0103Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0103Bitplane
	add.b d0,d0
	bcc.s .no1103Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1103Bitplane
	add.b d0,d0
	bcc.s .no2103Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2103Bitplane
	add.b d0,d0
	bcc.s .no3103Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3103Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline104:
	add.b d0,d0
	bcc.s .no0104Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0104Bitplane
	add.b d0,d0
	bcc.s .no1104Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1104Bitplane
	add.b d0,d0
	bcc.s .no2104Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2104Bitplane
	add.b d0,d0
	bcc.s .no3104Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3104Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline105:
	add.b d0,d0
	bcc.s .no0105Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0105Bitplane
	add.b d0,d0
	bcc.s .no1105Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1105Bitplane
	add.b d0,d0
	bcc.s .no2105Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2105Bitplane
	add.b d0,d0
	bcc.s .no3105Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3105Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline106:
	add.b d0,d0
	bcc.s .no0106Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0106Bitplane
	add.b d0,d0
	bcc.s .no1106Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1106Bitplane
	add.b d0,d0
	bcc.s .no2106Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2106Bitplane
	add.b d0,d0
	bcc.s .no3106Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3106Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline107:
	add.b d0,d0
	bcc.s .no0107Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0107Bitplane
	add.b d0,d0
	bcc.s .no1107Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1107Bitplane
	add.b d0,d0
	bcc.s .no2107Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2107Bitplane
	add.b d0,d0
	bcc.s .no3107Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3107Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline108:
	add.b d0,d0
	bcc.s .no0108Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0108Bitplane
	add.b d0,d0
	bcc.s .no1108Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1108Bitplane
	add.b d0,d0
	bcc.s .no2108Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2108Bitplane
	add.b d0,d0
	bcc.s .no3108Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3108Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline109:
	add.b d0,d0
	bcc.s .no0109Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0109Bitplane
	add.b d0,d0
	bcc.s .no1109Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1109Bitplane
	add.b d0,d0
	bcc.s .no2109Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2109Bitplane
	add.b d0,d0
	bcc.s .no3109Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3109Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline110:
	add.b d0,d0
	bcc.s .no0110Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0110Bitplane
	add.b d0,d0
	bcc.s .no1110Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1110Bitplane
	add.b d0,d0
	bcc.s .no2110Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2110Bitplane
	add.b d0,d0
	bcc.s .no3110Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3110Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline111:
	add.b d0,d0
	bcc.s .no0111Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0111Bitplane
	add.b d0,d0
	bcc.s .no1111Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1111Bitplane
	add.b d0,d0
	bcc.s .no2111Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2111Bitplane
	add.b d0,d0
	bcc.s .no3111Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3111Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline112:
	add.b d0,d0
	bcc.s .no0112Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0112Bitplane
	add.b d0,d0
	bcc.s .no1112Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1112Bitplane
	add.b d0,d0
	bcc.s .no2112Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2112Bitplane
	add.b d0,d0
	bcc.s .no3112Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3112Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline113:
	add.b d0,d0
	bcc.s .no0113Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0113Bitplane
	add.b d0,d0
	bcc.s .no1113Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1113Bitplane
	add.b d0,d0
	bcc.s .no2113Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2113Bitplane
	add.b d0,d0
	bcc.s .no3113Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3113Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline114:
	add.b d0,d0
	bcc.s .no0114Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0114Bitplane
	add.b d0,d0
	bcc.s .no1114Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1114Bitplane
	add.b d0,d0
	bcc.s .no2114Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2114Bitplane
	add.b d0,d0
	bcc.s .no3114Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3114Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline115:
	add.b d0,d0
	bcc.s .no0115Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0115Bitplane
	add.b d0,d0
	bcc.s .no1115Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1115Bitplane
	add.b d0,d0
	bcc.s .no2115Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2115Bitplane
	add.b d0,d0
	bcc.s .no3115Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3115Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline116:
	add.b d0,d0
	bcc.s .no0116Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0116Bitplane
	add.b d0,d0
	bcc.s .no1116Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1116Bitplane
	add.b d0,d0
	bcc.s .no2116Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2116Bitplane
	add.b d0,d0
	bcc.s .no3116Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3116Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline117:
	add.b d0,d0
	bcc.s .no0117Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0117Bitplane
	add.b d0,d0
	bcc.s .no1117Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1117Bitplane
	add.b d0,d0
	bcc.s .no2117Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2117Bitplane
	add.b d0,d0
	bcc.s .no3117Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3117Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline118:
	add.b d0,d0
	bcc.s .no0118Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0118Bitplane
	add.b d0,d0
	bcc.s .no1118Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1118Bitplane
	add.b d0,d0
	bcc.s .no2118Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2118Bitplane
	add.b d0,d0
	bcc.s .no3118Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3118Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline119:
	add.b d0,d0
	bcc.s .no0119Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0119Bitplane
	add.b d0,d0
	bcc.s .no1119Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1119Bitplane
	add.b d0,d0
	bcc.s .no2119Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2119Bitplane
	add.b d0,d0
	bcc.s .no3119Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3119Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline120:
	add.b d0,d0
	bcc.s .no0120Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0120Bitplane
	add.b d0,d0
	bcc.s .no1120Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1120Bitplane
	add.b d0,d0
	bcc.s .no2120Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2120Bitplane
	add.b d0,d0
	bcc.s .no3120Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3120Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline121:
	add.b d0,d0
	bcc.s .no0121Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0121Bitplane
	add.b d0,d0
	bcc.s .no1121Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1121Bitplane
	add.b d0,d0
	bcc.s .no2121Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2121Bitplane
	add.b d0,d0
	bcc.s .no3121Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3121Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline122:
	add.b d0,d0
	bcc.s .no0122Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0122Bitplane
	add.b d0,d0
	bcc.s .no1122Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1122Bitplane
	add.b d0,d0
	bcc.s .no2122Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2122Bitplane
	add.b d0,d0
	bcc.s .no3122Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3122Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline123:
	add.b d0,d0
	bcc.s .no0123Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0123Bitplane
	add.b d0,d0
	bcc.s .no1123Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1123Bitplane
	add.b d0,d0
	bcc.s .no2123Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2123Bitplane
	add.b d0,d0
	bcc.s .no3123Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3123Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline124:
	add.b d0,d0
	bcc.s .no0124Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0124Bitplane
	add.b d0,d0
	bcc.s .no1124Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1124Bitplane
	add.b d0,d0
	bcc.s .no2124Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2124Bitplane
	add.b d0,d0
	bcc.s .no3124Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3124Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline125:
	add.b d0,d0
	bcc.s .no0125Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0125Bitplane
	add.b d0,d0
	bcc.s .no1125Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1125Bitplane
	add.b d0,d0
	bcc.s .no2125Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2125Bitplane
	add.b d0,d0
	bcc.s .no3125Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3125Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline126:
	add.b d0,d0
	bcc.s .no0126Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0126Bitplane
	add.b d0,d0
	bcc.s .no1126Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1126Bitplane
	add.b d0,d0
	bcc.s .no2126Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2126Bitplane
	add.b d0,d0
	bcc.s .no3126Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3126Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline127:
	add.b d0,d0
	bcc.s .no0127Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0127Bitplane
	add.b d0,d0
	bcc.s .no1127Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1127Bitplane
	add.b d0,d0
	bcc.s .no2127Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2127Bitplane
	add.b d0,d0
	bcc.s .no3127Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3127Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline128:
	add.b d0,d0
	bcc.s .no0128Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0128Bitplane
	add.b d0,d0
	bcc.s .no1128Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1128Bitplane
	add.b d0,d0
	bcc.s .no2128Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2128Bitplane
	add.b d0,d0
	bcc.s .no3128Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3128Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline129:
	add.b d0,d0
	bcc.s .no0129Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0129Bitplane
	add.b d0,d0
	bcc.s .no1129Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1129Bitplane
	add.b d0,d0
	bcc.s .no2129Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2129Bitplane
	add.b d0,d0
	bcc.s .no3129Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3129Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline130:
	add.b d0,d0
	bcc.s .no0130Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0130Bitplane
	add.b d0,d0
	bcc.s .no1130Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1130Bitplane
	add.b d0,d0
	bcc.s .no2130Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2130Bitplane
	add.b d0,d0
	bcc.s .no3130Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3130Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline131:
	add.b d0,d0
	bcc.s .no0131Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0131Bitplane
	add.b d0,d0
	bcc.s .no1131Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1131Bitplane
	add.b d0,d0
	bcc.s .no2131Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2131Bitplane
	add.b d0,d0
	bcc.s .no3131Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3131Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline132:
	add.b d0,d0
	bcc.s .no0132Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0132Bitplane
	add.b d0,d0
	bcc.s .no1132Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1132Bitplane
	add.b d0,d0
	bcc.s .no2132Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2132Bitplane
	add.b d0,d0
	bcc.s .no3132Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3132Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline133:
	add.b d0,d0
	bcc.s .no0133Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0133Bitplane
	add.b d0,d0
	bcc.s .no1133Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1133Bitplane
	add.b d0,d0
	bcc.s .no2133Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2133Bitplane
	add.b d0,d0
	bcc.s .no3133Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3133Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline134:
	add.b d0,d0
	bcc.s .no0134Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0134Bitplane
	add.b d0,d0
	bcc.s .no1134Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1134Bitplane
	add.b d0,d0
	bcc.s .no2134Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2134Bitplane
	add.b d0,d0
	bcc.s .no3134Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3134Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline135:
	add.b d0,d0
	bcc.s .no0135Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0135Bitplane
	add.b d0,d0
	bcc.s .no1135Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1135Bitplane
	add.b d0,d0
	bcc.s .no2135Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2135Bitplane
	add.b d0,d0
	bcc.s .no3135Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3135Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline136:
	add.b d0,d0
	bcc.s .no0136Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0136Bitplane
	add.b d0,d0
	bcc.s .no1136Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1136Bitplane
	add.b d0,d0
	bcc.s .no2136Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2136Bitplane
	add.b d0,d0
	bcc.s .no3136Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3136Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline137:
	add.b d0,d0
	bcc.s .no0137Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0137Bitplane
	add.b d0,d0
	bcc.s .no1137Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1137Bitplane
	add.b d0,d0
	bcc.s .no2137Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2137Bitplane
	add.b d0,d0
	bcc.s .no3137Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3137Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline138:
	add.b d0,d0
	bcc.s .no0138Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0138Bitplane
	add.b d0,d0
	bcc.s .no1138Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1138Bitplane
	add.b d0,d0
	bcc.s .no2138Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2138Bitplane
	add.b d0,d0
	bcc.s .no3138Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3138Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline139:
	add.b d0,d0
	bcc.s .no0139Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0139Bitplane
	add.b d0,d0
	bcc.s .no1139Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1139Bitplane
	add.b d0,d0
	bcc.s .no2139Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2139Bitplane
	add.b d0,d0
	bcc.s .no3139Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3139Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline140:
	add.b d0,d0
	bcc.s .no0140Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0140Bitplane
	add.b d0,d0
	bcc.s .no1140Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1140Bitplane
	add.b d0,d0
	bcc.s .no2140Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2140Bitplane
	add.b d0,d0
	bcc.s .no3140Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3140Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline141:
	add.b d0,d0
	bcc.s .no0141Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0141Bitplane
	add.b d0,d0
	bcc.s .no1141Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1141Bitplane
	add.b d0,d0
	bcc.s .no2141Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2141Bitplane
	add.b d0,d0
	bcc.s .no3141Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3141Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline142:
	add.b d0,d0
	bcc.s .no0142Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0142Bitplane
	add.b d0,d0
	bcc.s .no1142Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1142Bitplane
	add.b d0,d0
	bcc.s .no2142Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2142Bitplane
	add.b d0,d0
	bcc.s .no3142Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3142Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline143:
	add.b d0,d0
	bcc.s .no0143Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0143Bitplane
	add.b d0,d0
	bcc.s .no1143Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1143Bitplane
	add.b d0,d0
	bcc.s .no2143Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2143Bitplane
	add.b d0,d0
	bcc.s .no3143Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3143Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline144:
	add.b d0,d0
	bcc.s .no0144Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0144Bitplane
	add.b d0,d0
	bcc.s .no1144Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1144Bitplane
	add.b d0,d0
	bcc.s .no2144Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2144Bitplane
	add.b d0,d0
	bcc.s .no3144Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3144Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline145:
	add.b d0,d0
	bcc.s .no0145Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0145Bitplane
	add.b d0,d0
	bcc.s .no1145Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1145Bitplane
	add.b d0,d0
	bcc.s .no2145Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2145Bitplane
	add.b d0,d0
	bcc.s .no3145Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3145Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline146:
	add.b d0,d0
	bcc.s .no0146Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0146Bitplane
	add.b d0,d0
	bcc.s .no1146Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1146Bitplane
	add.b d0,d0
	bcc.s .no2146Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2146Bitplane
	add.b d0,d0
	bcc.s .no3146Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3146Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline147:
	add.b d0,d0
	bcc.s .no0147Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0147Bitplane
	add.b d0,d0
	bcc.s .no1147Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1147Bitplane
	add.b d0,d0
	bcc.s .no2147Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2147Bitplane
	add.b d0,d0
	bcc.s .no3147Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3147Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline148:
	add.b d0,d0
	bcc.s .no0148Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0148Bitplane
	add.b d0,d0
	bcc.s .no1148Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1148Bitplane
	add.b d0,d0
	bcc.s .no2148Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2148Bitplane
	add.b d0,d0
	bcc.s .no3148Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3148Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline149:
	add.b d0,d0
	bcc.s .no0149Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0149Bitplane
	add.b d0,d0
	bcc.s .no1149Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1149Bitplane
	add.b d0,d0
	bcc.s .no2149Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2149Bitplane
	add.b d0,d0
	bcc.s .no3149Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3149Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline150:
	add.b d0,d0
	bcc.s .no0150Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0150Bitplane
	add.b d0,d0
	bcc.s .no1150Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1150Bitplane
	add.b d0,d0
	bcc.s .no2150Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2150Bitplane
	add.b d0,d0
	bcc.s .no3150Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3150Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline151:
	add.b d0,d0
	bcc.s .no0151Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0151Bitplane
	add.b d0,d0
	bcc.s .no1151Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1151Bitplane
	add.b d0,d0
	bcc.s .no2151Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2151Bitplane
	add.b d0,d0
	bcc.s .no3151Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3151Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline152:
	add.b d0,d0
	bcc.s .no0152Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0152Bitplane
	add.b d0,d0
	bcc.s .no1152Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1152Bitplane
	add.b d0,d0
	bcc.s .no2152Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2152Bitplane
	add.b d0,d0
	bcc.s .no3152Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3152Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline153:
	add.b d0,d0
	bcc.s .no0153Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0153Bitplane
	add.b d0,d0
	bcc.s .no1153Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1153Bitplane
	add.b d0,d0
	bcc.s .no2153Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2153Bitplane
	add.b d0,d0
	bcc.s .no3153Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3153Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline154:
	add.b d0,d0
	bcc.s .no0154Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0154Bitplane
	add.b d0,d0
	bcc.s .no1154Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1154Bitplane
	add.b d0,d0
	bcc.s .no2154Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2154Bitplane
	add.b d0,d0
	bcc.s .no3154Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3154Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline155:
	add.b d0,d0
	bcc.s .no0155Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0155Bitplane
	add.b d0,d0
	bcc.s .no1155Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1155Bitplane
	add.b d0,d0
	bcc.s .no2155Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2155Bitplane
	add.b d0,d0
	bcc.s .no3155Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3155Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline156:
	add.b d0,d0
	bcc.s .no0156Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0156Bitplane
	add.b d0,d0
	bcc.s .no1156Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1156Bitplane
	add.b d0,d0
	bcc.s .no2156Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2156Bitplane
	add.b d0,d0
	bcc.s .no3156Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3156Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline157:
	add.b d0,d0
	bcc.s .no0157Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0157Bitplane
	add.b d0,d0
	bcc.s .no1157Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1157Bitplane
	add.b d0,d0
	bcc.s .no2157Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2157Bitplane
	add.b d0,d0
	bcc.s .no3157Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3157Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline158:
	add.b d0,d0
	bcc.s .no0158Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0158Bitplane
	add.b d0,d0
	bcc.s .no1158Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1158Bitplane
	add.b d0,d0
	bcc.s .no2158Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2158Bitplane
	add.b d0,d0
	bcc.s .no3158Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3158Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline159:
	add.b d0,d0
	bcc.s .no0159Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0159Bitplane
	add.b d0,d0
	bcc.s .no1159Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1159Bitplane
	add.b d0,d0
	bcc.s .no2159Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2159Bitplane
	add.b d0,d0
	bcc.s .no3159Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3159Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline160:
	add.b d0,d0
	bcc.s .no0160Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0160Bitplane
	add.b d0,d0
	bcc.s .no1160Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1160Bitplane
	add.b d0,d0
	bcc.s .no2160Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2160Bitplane
	add.b d0,d0
	bcc.s .no3160Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3160Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline161:
	add.b d0,d0
	bcc.s .no0161Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0161Bitplane
	add.b d0,d0
	bcc.s .no1161Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1161Bitplane
	add.b d0,d0
	bcc.s .no2161Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2161Bitplane
	add.b d0,d0
	bcc.s .no3161Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3161Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline162:
	add.b d0,d0
	bcc.s .no0162Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0162Bitplane
	add.b d0,d0
	bcc.s .no1162Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1162Bitplane
	add.b d0,d0
	bcc.s .no2162Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2162Bitplane
	add.b d0,d0
	bcc.s .no3162Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3162Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline163:
	add.b d0,d0
	bcc.s .no0163Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0163Bitplane
	add.b d0,d0
	bcc.s .no1163Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1163Bitplane
	add.b d0,d0
	bcc.s .no2163Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2163Bitplane
	add.b d0,d0
	bcc.s .no3163Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3163Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline164:
	add.b d0,d0
	bcc.s .no0164Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0164Bitplane
	add.b d0,d0
	bcc.s .no1164Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1164Bitplane
	add.b d0,d0
	bcc.s .no2164Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2164Bitplane
	add.b d0,d0
	bcc.s .no3164Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3164Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline165:
	add.b d0,d0
	bcc.s .no0165Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0165Bitplane
	add.b d0,d0
	bcc.s .no1165Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1165Bitplane
	add.b d0,d0
	bcc.s .no2165Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2165Bitplane
	add.b d0,d0
	bcc.s .no3165Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3165Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline166:
	add.b d0,d0
	bcc.s .no0166Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0166Bitplane
	add.b d0,d0
	bcc.s .no1166Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1166Bitplane
	add.b d0,d0
	bcc.s .no2166Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2166Bitplane
	add.b d0,d0
	bcc.s .no3166Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3166Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline167:
	add.b d0,d0
	bcc.s .no0167Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0167Bitplane
	add.b d0,d0
	bcc.s .no1167Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1167Bitplane
	add.b d0,d0
	bcc.s .no2167Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2167Bitplane
	add.b d0,d0
	bcc.s .no3167Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3167Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline168:
	add.b d0,d0
	bcc.s .no0168Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0168Bitplane
	add.b d0,d0
	bcc.s .no1168Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1168Bitplane
	add.b d0,d0
	bcc.s .no2168Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2168Bitplane
	add.b d0,d0
	bcc.s .no3168Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3168Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline169:
	add.b d0,d0
	bcc.s .no0169Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0169Bitplane
	add.b d0,d0
	bcc.s .no1169Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1169Bitplane
	add.b d0,d0
	bcc.s .no2169Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2169Bitplane
	add.b d0,d0
	bcc.s .no3169Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3169Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline170:
	add.b d0,d0
	bcc.s .no0170Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0170Bitplane
	add.b d0,d0
	bcc.s .no1170Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1170Bitplane
	add.b d0,d0
	bcc.s .no2170Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2170Bitplane
	add.b d0,d0
	bcc.s .no3170Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3170Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline171:
	add.b d0,d0
	bcc.s .no0171Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0171Bitplane
	add.b d0,d0
	bcc.s .no1171Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1171Bitplane
	add.b d0,d0
	bcc.s .no2171Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2171Bitplane
	add.b d0,d0
	bcc.s .no3171Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3171Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline172:
	add.b d0,d0
	bcc.s .no0172Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0172Bitplane
	add.b d0,d0
	bcc.s .no1172Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1172Bitplane
	add.b d0,d0
	bcc.s .no2172Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2172Bitplane
	add.b d0,d0
	bcc.s .no3172Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3172Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline173:
	add.b d0,d0
	bcc.s .no0173Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0173Bitplane
	add.b d0,d0
	bcc.s .no1173Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1173Bitplane
	add.b d0,d0
	bcc.s .no2173Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2173Bitplane
	add.b d0,d0
	bcc.s .no3173Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3173Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline174:
	add.b d0,d0
	bcc.s .no0174Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0174Bitplane
	add.b d0,d0
	bcc.s .no1174Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1174Bitplane
	add.b d0,d0
	bcc.s .no2174Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2174Bitplane
	add.b d0,d0
	bcc.s .no3174Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3174Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline175:
	add.b d0,d0
	bcc.s .no0175Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0175Bitplane
	add.b d0,d0
	bcc.s .no1175Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1175Bitplane
	add.b d0,d0
	bcc.s .no2175Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2175Bitplane
	add.b d0,d0
	bcc.s .no3175Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3175Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline176:
	add.b d0,d0
	bcc.s .no0176Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0176Bitplane
	add.b d0,d0
	bcc.s .no1176Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1176Bitplane
	add.b d0,d0
	bcc.s .no2176Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2176Bitplane
	add.b d0,d0
	bcc.s .no3176Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3176Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline177:
	add.b d0,d0
	bcc.s .no0177Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0177Bitplane
	add.b d0,d0
	bcc.s .no1177Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1177Bitplane
	add.b d0,d0
	bcc.s .no2177Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2177Bitplane
	add.b d0,d0
	bcc.s .no3177Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3177Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline178:
	add.b d0,d0
	bcc.s .no0178Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0178Bitplane
	add.b d0,d0
	bcc.s .no1178Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1178Bitplane
	add.b d0,d0
	bcc.s .no2178Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2178Bitplane
	add.b d0,d0
	bcc.s .no3178Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3178Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline179:
	add.b d0,d0
	bcc.s .no0179Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0179Bitplane
	add.b d0,d0
	bcc.s .no1179Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1179Bitplane
	add.b d0,d0
	bcc.s .no2179Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2179Bitplane
	add.b d0,d0
	bcc.s .no3179Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3179Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline180:
	add.b d0,d0
	bcc.s .no0180Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0180Bitplane
	add.b d0,d0
	bcc.s .no1180Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1180Bitplane
	add.b d0,d0
	bcc.s .no2180Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2180Bitplane
	add.b d0,d0
	bcc.s .no3180Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3180Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline181:
	add.b d0,d0
	bcc.s .no0181Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0181Bitplane
	add.b d0,d0
	bcc.s .no1181Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1181Bitplane
	add.b d0,d0
	bcc.s .no2181Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2181Bitplane
	add.b d0,d0
	bcc.s .no3181Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3181Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline182:
	add.b d0,d0
	bcc.s .no0182Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0182Bitplane
	add.b d0,d0
	bcc.s .no1182Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1182Bitplane
	add.b d0,d0
	bcc.s .no2182Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2182Bitplane
	add.b d0,d0
	bcc.s .no3182Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3182Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline183:
	add.b d0,d0
	bcc.s .no0183Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0183Bitplane
	add.b d0,d0
	bcc.s .no1183Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1183Bitplane
	add.b d0,d0
	bcc.s .no2183Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2183Bitplane
	add.b d0,d0
	bcc.s .no3183Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3183Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline184:
	add.b d0,d0
	bcc.s .no0184Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0184Bitplane
	add.b d0,d0
	bcc.s .no1184Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1184Bitplane
	add.b d0,d0
	bcc.s .no2184Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2184Bitplane
	add.b d0,d0
	bcc.s .no3184Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3184Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline185:
	add.b d0,d0
	bcc.s .no0185Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0185Bitplane
	add.b d0,d0
	bcc.s .no1185Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1185Bitplane
	add.b d0,d0
	bcc.s .no2185Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2185Bitplane
	add.b d0,d0
	bcc.s .no3185Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3185Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline186:
	add.b d0,d0
	bcc.s .no0186Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0186Bitplane
	add.b d0,d0
	bcc.s .no1186Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1186Bitplane
	add.b d0,d0
	bcc.s .no2186Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2186Bitplane
	add.b d0,d0
	bcc.s .no3186Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3186Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline187:
	add.b d0,d0
	bcc.s .no0187Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0187Bitplane
	add.b d0,d0
	bcc.s .no1187Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1187Bitplane
	add.b d0,d0
	bcc.s .no2187Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2187Bitplane
	add.b d0,d0
	bcc.s .no3187Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3187Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline188:
	add.b d0,d0
	bcc.s .no0188Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0188Bitplane
	add.b d0,d0
	bcc.s .no1188Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1188Bitplane
	add.b d0,d0
	bcc.s .no2188Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2188Bitplane
	add.b d0,d0
	bcc.s .no3188Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3188Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline189:
	add.b d0,d0
	bcc.s .no0189Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0189Bitplane
	add.b d0,d0
	bcc.s .no1189Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1189Bitplane
	add.b d0,d0
	bcc.s .no2189Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2189Bitplane
	add.b d0,d0
	bcc.s .no3189Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3189Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline190:
	add.b d0,d0
	bcc.s .no0190Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0190Bitplane
	add.b d0,d0
	bcc.s .no1190Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1190Bitplane
	add.b d0,d0
	bcc.s .no2190Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2190Bitplane
	add.b d0,d0
	bcc.s .no3190Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3190Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline191:
	add.b d0,d0
	bcc.s .no0191Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0191Bitplane
	add.b d0,d0
	bcc.s .no1191Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1191Bitplane
	add.b d0,d0
	bcc.s .no2191Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2191Bitplane
	add.b d0,d0
	bcc.s .no3191Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3191Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline192:
	add.b d0,d0
	bcc.s .no0192Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0192Bitplane
	add.b d0,d0
	bcc.s .no1192Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1192Bitplane
	add.b d0,d0
	bcc.s .no2192Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2192Bitplane
	add.b d0,d0
	bcc.s .no3192Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3192Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline193:
	add.b d0,d0
	bcc.s .no0193Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0193Bitplane
	add.b d0,d0
	bcc.s .no1193Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1193Bitplane
	add.b d0,d0
	bcc.s .no2193Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2193Bitplane
	add.b d0,d0
	bcc.s .no3193Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3193Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline194:
	add.b d0,d0
	bcc.s .no0194Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0194Bitplane
	add.b d0,d0
	bcc.s .no1194Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1194Bitplane
	add.b d0,d0
	bcc.s .no2194Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2194Bitplane
	add.b d0,d0
	bcc.s .no3194Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3194Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline195:
	add.b d0,d0
	bcc.s .no0195Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0195Bitplane
	add.b d0,d0
	bcc.s .no1195Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1195Bitplane
	add.b d0,d0
	bcc.s .no2195Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2195Bitplane
	add.b d0,d0
	bcc.s .no3195Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3195Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline196:
	add.b d0,d0
	bcc.s .no0196Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0196Bitplane
	add.b d0,d0
	bcc.s .no1196Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1196Bitplane
	add.b d0,d0
	bcc.s .no2196Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2196Bitplane
	add.b d0,d0
	bcc.s .no3196Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3196Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline197:
	add.b d0,d0
	bcc.s .no0197Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0197Bitplane
	add.b d0,d0
	bcc.s .no1197Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1197Bitplane
	add.b d0,d0
	bcc.s .no2197Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2197Bitplane
	add.b d0,d0
	bcc.s .no3197Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3197Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline198:
	add.b d0,d0
	bcc.s .no0198Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0198Bitplane
	add.b d0,d0
	bcc.s .no1198Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1198Bitplane
	add.b d0,d0
	bcc.s .no2198Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2198Bitplane
	add.b d0,d0
	bcc.s .no3198Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3198Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3
vline199:
	add.b d0,d0
	bcc.s .no0199Bitplane
	or.w d5,3*screenBuffer_width_Byte(a0)
.no0199Bitplane
	add.b d0,d0
	bcc.s .no1199Bitplane
	or.w d5,2*screenBuffer_width_Byte(a0)
.no1199Bitplane
	add.b d0,d0
	bcc.s .no2199Bitplane
	or.w d5,1*screenBuffer_width_Byte(a0)
.no2199Bitplane
	add.b d0,d0
	bcc.s .no3199Bitplane
	or.w d5,(a0) ;0*screenBuffer_width_Byte
.no3199Bitplane
	lea  -screenBuffer_lineSize(a0),a0
	move.b (a3),d0
	adda.w (a4)+,a3

vlinkTable
	dc.l vline0
	dc.l vline1
	dc.l vline2
	dc.l vline3
	dc.l vline4
	dc.l vline5
	dc.l vline6
	dc.l vline7
	dc.l vline8
	dc.l vline9
	dc.l vline10
	dc.l vline11
	dc.l vline12
	dc.l vline13
	dc.l vline14
	dc.l vline15
	dc.l vline16
	dc.l vline17
	dc.l vline18
	dc.l vline19
	dc.l vline20
	dc.l vline21
	dc.l vline22
	dc.l vline23
	dc.l vline24
	dc.l vline25
	dc.l vline26
	dc.l vline27
	dc.l vline28
	dc.l vline29
	dc.l vline30
	dc.l vline31
	dc.l vline32
	dc.l vline33
	dc.l vline34
	dc.l vline35
	dc.l vline36
	dc.l vline37
	dc.l vline38
	dc.l vline39
	dc.l vline40
	dc.l vline41
	dc.l vline42
	dc.l vline43
	dc.l vline44
	dc.l vline45
	dc.l vline46
	dc.l vline47
	dc.l vline48
	dc.l vline49
	dc.l vline50
	dc.l vline51
	dc.l vline52
	dc.l vline53
	dc.l vline54
	dc.l vline55
	dc.l vline56
	dc.l vline57
	dc.l vline58
	dc.l vline59
	dc.l vline60
	dc.l vline61
	dc.l vline62
	dc.l vline63
	dc.l vline64
	dc.l vline65
	dc.l vline66
	dc.l vline67
	dc.l vline68
	dc.l vline69
	dc.l vline70
	dc.l vline71
	dc.l vline72
	dc.l vline73
	dc.l vline74
	dc.l vline75
	dc.l vline76
	dc.l vline77
	dc.l vline78
	dc.l vline79
	dc.l vline80
	dc.l vline81
	dc.l vline82
	dc.l vline83
	dc.l vline84
	dc.l vline85
	dc.l vline86
	dc.l vline87
	dc.l vline88
	dc.l vline89
	dc.l vline90
	dc.l vline91
	dc.l vline92
	dc.l vline93
	dc.l vline94
	dc.l vline95
	dc.l vline96
	dc.l vline97
	dc.l vline98
	dc.l vline99
	dc.l vline100
	dc.l vline101
	dc.l vline102
	dc.l vline103
	dc.l vline104
	dc.l vline105
	dc.l vline106
	dc.l vline107
	dc.l vline108
	dc.l vline109
	dc.l vline110
	dc.l vline111
	dc.l vline112
	dc.l vline113
	dc.l vline114
	dc.l vline115
	dc.l vline116
	dc.l vline117
	dc.l vline118
	dc.l vline119
	dc.l vline120
	dc.l vline121
	dc.l vline122
	dc.l vline123
	dc.l vline124
	dc.l vline125
	dc.l vline126
	dc.l vline127
	dc.l vline128
	dc.l vline129
	dc.l vline130
	dc.l vline131
	dc.l vline132
	dc.l vline133
	dc.l vline134
	dc.l vline135
	dc.l vline136
	dc.l vline137
	dc.l vline138
	dc.l vline139
	dc.l vline140
	dc.l vline141
	dc.l vline142
	dc.l vline143
	dc.l vline144
	dc.l vline145
	dc.l vline146
	dc.l vline147
	dc.l vline148
	dc.l vline149
	dc.l vline150
	dc.l vline151
	dc.l vline152
	dc.l vline153
	dc.l vline154
	dc.l vline155
	dc.l vline156
	dc.l vline157
	dc.l vline158
	dc.l vline159
	dc.l vline160
	dc.l vline161
	dc.l vline162
	dc.l vline163
	dc.l vline164
	dc.l vline165
	dc.l vline166
	dc.l vline167
	dc.l vline168
	dc.l vline169
	dc.l vline170
	dc.l vline171
	dc.l vline172
	dc.l vline173
	dc.l vline174
	dc.l vline175
	dc.l vline176
	dc.l vline177
	dc.l vline178
	dc.l vline179
	dc.l vline180
	dc.l vline181
	dc.l vline182
	dc.l vline183
	dc.l vline184
	dc.l vline185
	dc.l vline186
	dc.l vline187
	dc.l vline188
	dc.l vline189
	dc.l vline190
	dc.l vline191
	dc.l vline192
	dc.l vline193
	dc.l vline194
	dc.l vline195
	dc.l vline196
	dc.l vline197
	dc.l vline198
	dc.l vline199

