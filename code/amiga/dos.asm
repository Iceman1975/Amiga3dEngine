SysBase			= 4
    
    include 'exec/funcdef.i'
	include 'exec/types.i'
	include 'exec/exec.i'
	include 'exec/exec_lib.i'		; include these because we use the exec lib
	include 'libraries/dos.i'
	include 'libraries/dos_lib.i'	; include these because we use the dos lib

; Error return codes for handles.
ERROR_HANDLE_FILE_OPEN:		equ	-1
ERROR_HANDLE_HEADER_NOT_FOUND:	equ	-2
ERROR_HANDLE_ALLOCATE_FAIL:	equ	-3
ERROR_HANDLE_FILE_READ:		equ	-4
ERROR_HANDLE_GENERIC:		equ	-5

; Offsets of system functions in respective jumptables of library bases.
; Loading proper system includes would be more elegant.

OpenLibrary		= -552
CloseLibrary		= -414
PutStr			= -948

; Note: the program lacks proper startup code, so it will not run from Workbench
dos_writeText
			LEA	DosName,A1		;dos.library name string
			MOVEQ	#36,D0			;minimum required version (36 = Kick 2.0)
			MOVEA.L	SysBase,A6
			JSR	OpenLibrary(A6)

			TST.L	D0			;zero if OpenLibrary() failed
			BEQ.S	NoDos			;if failed, skip to exit

			MOVE.L	#Hello,D1		;string to print
			MOVEA.L	D0,A6			;moving DOSBase to A6
			JSR	PutStr(A6)

			MOVEA.L	A6,A1			;DOSBase, library to close
			MOVEA.L	SysBase,A6
			JSR	CloseLibrary(A6)

NoDos			CLR.L	D0			;return 0 to the system
			RTS





dos_loadSky:
	move.l currentLevel,a0
	move.l 18(a0),a0
	beq.s .done
    lea skyDataPointer,a2
	move.l #0,d0
	move.l #MEMF_CHIP,d1
    move.l #19200,d3    ; size

	bsr doc_LoadFile
	tst.l d0
.done
    ;move.l d5,skyDataPointer
    rts

dos_loadImages:
	move.l currentLevel,a0
	move.l 30(a0),d3
	move.l 22(a0),a0

	;lea fileImages,a0
    lea imageDataPointer,a2
	move.l #0,d0
	move.l #MEMF_ANY,d1
    ;move.l #42112,d3    ; size

	bsr doc_LoadFile
	tst.l d0
    ;move.l d5,skyDataPointer
    rts

dos_loadFloor:
	move.l currentLevel,a0
	move.l 26(a0),a0
	beq.s .done

	;lea fileFloor,a0
    lea floorDataPointer,a2
	move.l #0,d0
	move.l #MEMF_ANY,d1
    move.l #65536,d3    ; size

	bsr doc_LoadFile
	tst.l d0
.done:
    ;move.l d5,skyDataPointer
    rts

dos_loadFloorLib:
	lea fileFloor0,a0
    lea floors,a2
	move.l #MEMF_ANY,d1
    move.l #24962,d3    ; size
	bsr doc_LoadFile

	lea fileFloor15,a0
    lea floors+4,a2
	bsr doc_LoadFile

	lea fileFloor30,a0
    lea floors+8,a2
	bsr doc_LoadFile

	lea fileFloor45,a0
    lea floors+12,a2
	bsr doc_LoadFile

	lea fileFloor60,a0
    lea floors+16,a2
	bsr doc_LoadFile

	lea fileFloor75,a0
    lea floors+20,a2
	bsr doc_LoadFile
    rts

; rawHandle = tecLoadFile(*filename, memtype)
;    d0                      a0        d1
doc_LoadFile:
	movem.l	d1-d7/a0-a1,-(a7)	; save registers
	move.l	d1,d5				; save requested memory type
	
	; open the file for reading
	move.l	a0,d1				      
    move.l  #MODE_OLDFILE,d2
	move.l  BASELIB_DOS,a6 
    jsr     _LVOOpen(a6)        ; handle[d0] = LVOOpenFile(filename[d1],mode[d2])
	tst.l	d0				
	beq	.open_error
	move.l	d0,d4				; save the file handle for later use.
	
	; allocate ram based	
	;move.l	#4096,d0			; get file length
    ;move.l #19200,d0    ;sky size
    move.l d3,d0
	move.l	d5,d1				
    move.l  SysBase,a6
    jsr     _LVOAllocMem(a6)
	tst.l	d0
	bmi.s	.alloc_error
	move.l	d0,d5				; save the allocated buffer origin into d5
    move.l  d0,(a2)
	
	move.l	d4,d1				; get file handle for seek 
	move.l	#0,d2				; to 0 byte offset
	move.l	#OFFSET_BEGINNING,d3		; return to start of file
	move.l  BASELIB_DOS,a6 
	jsr	_LVOSeek(a6)			
	
	; read the entire file	
	move.l	d4,d1				; get file handle for seek 
	move.l	d5,d2				; buffer to read into
	move.l	#$ffffff,d3			; read entire file
    jsr     _LVORead(a6)        ; bytes[d0] = LVORead(handle[d1],buffer[d2],size[d3]) 	
	tst.l	d0
	bmi.s	.read_error
	move.l	d0,d3
	
	; close the file
	move.l	d4,d1				; result = LVOClose(handle[d1])      
    jsr     _LVOClose(a6)        
	
	;movem.l (a7)+,a0-a1
	move.l	d3,d0				; return number of bytes read.
	bra	.exit					; all done.
	        	
.open_error:
	moveq	#ERROR_HANDLE_FILE_OPEN,d0
	bra.s	.exit
.header_error:
	moveq	#ERROR_HANDLE_HEADER_NOT_FOUND,d0
	bra.s	.exit
.alloc_error:
	moveq	#ERROR_HANDLE_ALLOCATE_FAIL,d0
	bra.s	.exit
.read_error:
	moveq	#ERROR_HANDLE_FILE_READ,d0
	bra.s	.exit
.exit:	
	movem.l	(a7)+,d1-d7/a0-a1
	rts

; Data
dos_init:
	; load dos.library and store handle in BASELIB_DOS
	move.l SysBase,a6
	lea LIBRARY_DOS,a1
	move.l #0,d0
	jsr _LVOOpenLibrary(a6)
	tst.l d0
	beq .error
	move.l d0,BASELIB_DOS
	rts
	
.error:
	; todo some useful error handling

BASELIB_DOS:
	dc.l 0

LIBRARY_DOS:
	dc.b "dos.library",0
	even

DosName			DC.B		"dos.library",0
Hello			DC.B		"Welcome to the AmberDoom-Demo! Please enter level disk to any drive and click mouse button.",10,0

fileFloor0 dc.b "ray_floor0_generated.raw",0
	even

fileFloor15 dc.b "ray_floor15_generated.raw",0
	even

fileFloor30 dc.b "ray_floor30_generated.raw",0
	even

fileFloor45 dc.b "ray_floor45_generated.raw",0
	even

fileFloor60 dc.b "ray_floor60_generated.raw",0
	even

fileFloor75 dc.b "ray_floor75_generated.raw",0
	even
