
; If set to 1, timing information is generated during music generation
; which is needed for Clinkster_GetInstrumentTrigger.
; Set it to 0 if you don't need this functionality.
%define CLINKSTER_GENERATE_TIMING_DATA 0

; Offset applied by Clinkster_GetPosition to compensate for graphics latency.
; Measured in samples (44100ths of a second).
; The default value of 2048 (corresponding to about 46 milliseconds) is
; appropriate for typical display latencies for high-framerate effects.
%define CLINKSTER_TIMER_OFFSET 0

%include "music.asm"


;; ********** Definitions **********

global Clinkster_GenerateMusic
global _Clinkster_GenerateMusic@0
global Clinkster_StartMusic
global _Clinkster_StartMusic@0
global Clinkster_GetPosition
global _Clinkster_GetPosition@0
global Clinkster_GetInstrumentTrigger
global _Clinkster_GetInstrumentTrigger@8

global Clinkster_MusicBuffer
global _Clinkster_MusicBuffer
global Clinkster_TicksPerSecond
global _Clinkster_TicksPerSecond
global Clinkster_MusicLength
global _Clinkster_MusicLength
global Clinkster_NumTracks
global _Clinkster_NumTracks
%if CLINKSTER_GENERATE_TIMING_DATA
global Clinkster_NoteTiming
global _Clinkster_NoteTiming
%endif
global Clinkster_WavFileHeader
global _Clinkster_WavFileHeader

extern __imp__waveOutOpen@24
extern __imp__waveOutPrepareHeader@12
extern __imp__waveOutWrite@12
extern __imp__waveOutGetPosition@12

extern __imp__CreateThread@24
extern __imp__WaitForSingleObject@8

%define SAMPLE_RATE 44100
%define WAVE_SIZE 65536


;; ********** Public variables **********

section MusBuf bss align=4
Clinkster_MusicBuffer:
_Clinkster_MusicBuffer:
.align24
	resw (TOTAL_SAMPLES*2)
	resw 2 ; padding to catch extra write in conversion

section tps rdata align=4
Clinkster_TicksPerSecond:
_Clinkster_TicksPerSecond:
	dd TICKS_PER_SECOND

section muslen rdata align=4
Clinkster_MusicLength:
_Clinkster_MusicLength:
	dd MUSIC_LENGTH

section numtr rdata align=4
Clinkster_NumTracks:
_Clinkster_NumTracks:
	dd NUMTRACKS

%if CLINKSTER_GENERATE_TIMING_DATA
section musdat bss align=4
Clinkster_NoteTiming:
_Clinkster_NoteTiming:
.align16
	resd 2*(NUMTRACKS<<LOGNUMTICKS)

section timing data align=4
timing_ptr: dd Clinkster_NoteTiming
%endif

section WavFile rdata align=4
Clinkster_WavFileHeader:
_Clinkster_WavFileHeader:
	db	"RIFF"
	dd	36+TOTAL_SAMPLES*4
	db	"WAVE"
	db	"fmt "
	dd	16
	dw	1,2
	dd	SAMPLE_RATE
	dd	SAMPLE_RATE*4
	dw	4,16
	db	"data"
	dd	TOTAL_SAMPLES*4


;; ********** System structures **********

section	WaveForm rdata align=1
_WaveFormat:
	dw	1,2
	dd	SAMPLE_RATE
	dd	SAMPLE_RATE*4
	dw	4,16,0

section WaveHdr data align=4
_WaveHdr:
	dd	Clinkster_MusicBuffer
	dd	(TOTAL_SAMPLES*4)
	dd	0,0,0,0,0,0

section wavehand bss align=4
_WaveOutHandle:
.align16
	resd 1

section WaveTime data align=4
_WaveTime:
	dd	4,0,0,0,0,0,0,0


;; ********** Internal buffers **********

section wforms bss align=4
waveforms:
.align16
	resd	6*WAVE_SIZE


;; ********** Instrument parameter access **********

section paramw rdata align=4
param_weights:
	dd 0.125					; Release
	dd 0.125					; Decay
	dd 0.125					; Attack
%if USES_GAIN
	dd 0.125					; Gain
%endif
%if USES_INDEXDECAY
	dd 0.0009765625				; IndexDecay
%endif
	dd 0.0009765625				; M PitchDecay
	dd 0.0009765625				; B PitchDecay
	dd 0.083333333333			; M Pitch
	dd 0.083333333333			; B Pitch
	dd 0.0000152587890625		; Volume
%if USES_PANNING
	dd 0.0000152587890625		; Volume
%endif
	dd 0.03125					; Sustain
	dd 16307					; RandomSeed
	dd 1						; Layers
	dd 4096.0					; Index
	dd 0.125					; Index Spread
	dd 0.0009765625				; M Detune
	dd 0.0009765625				; B Detune
	dd 65536					; ModWave
	dd 65536					; BaseWave

struc instr_params
	ip_basewave:	resd 1
	ip_modwave:		resd 1
	ip_bdetune:		resd 1
	ip_mdetune:		resd 1
	ip_indexspr:	resd 1
	ip_index:		resd 1
	ip_layers:		resd 1
	ip_randomseed:	resd 1
	ip_sustain:		resd 1
	ip_volume:		resd 1+USES_PANNING
	ip_bpitch:		resd 1
	ip_mpitch:		resd 1
	ip_bpitchd:		resd 1
	ip_mpitchd:		resd 1
%if USES_INDEXDECAY
	ip_indexd:		resd 1
%endif
%if USES_GAIN
	ip_gain:		resd 1
%endif
	ip_attack:		resd 1
	ip_decay:		resd 1
	ip_release:		resd 1
endstruc

%define ip_INT 0
%define ip_FLOAT 0
%define IP(f,t) dword [dword ebx + g_instrparams + ip_ %+ f + ip_ %+ t]
%define IPI(f,i,t) dword [dword ebx + g_instrparams + ip_ %+ f + ip_ %+ t + i]


;; ********** Internal constants and tables **********

section resamp rdata align=4
resamplefilter:
	db -1,-2,-4,-4,-2,3,14,30,51,98,116,126
	db 126,116,98,51,30,14,3,-2,-4,-4,-2,-1
resamplefilter_end:
FILTER_SIZE equ (resamplefilter_end-resamplefilter)

section wavestep rdata align=4
c_wavestep:		dd 0.000030517578125
section basefreq rdata align=4
c_basefreq:		dd 2.86698696365342
section halfnote rdata align=4
c_halfnote:		dd 1.05946309435929
section finalamp rdata align=4
c_finalamp:		dd 32767
section velfac rdata align=4
c_velocityfac:	dd 0.007874015748031496
section delaystr rdata align=4
c_delaystr:		dd DELAY_STRENGTH
section offset rdata align=4
c_timeoffset:	dd CLINKSTER_TIMER_OFFSET*4
section tempo rdata align=4
c_ticklength:	dd SUBSAMPLES_PER_TICK/4*4
section half rdata align=4
c_onehalf:		dd 0.5


;; ********** Internal global variables **********

struc globalvars
g_phasetemp:		resd	1
g_layer_random:		resd	1
g_stereo:			resd	1	; 0 for left channel, 2 for right channel
g_noteposptr:		resd	1
g_notesamptr:		resd	1
g_instrparams:		resb	instr_params_size
g_layerparams:		resq	0
g_layer_bfreq:		resq	1
g_layer_mfreq:		resq	1
g_layer_index:		resq	1
g_layer_bpitch:		resq	1
g_layer_mpitch:		resq	1
g_layer_bpitchd:	resq	1
g_layer_mpitchd:	resq	1
%if USES_INDEXDECAY
g_layer_indexd:		resq	1
%endif
%if USES_GAIN
g_layer_gain:		resq	1
%endif
g_layer_attack:		resq	1
g_layer_decay:		resq	1
g_layer_release:	resq	1

	alignb	256
g_InstrumentPointers:
	resd MAX_TRACK_INSTRUMENT_RENDERS+1

	resd MAX_DELAY_LENGTH
	alignb	16777216
g_MixingBuffer:
	resd TOTAL_SAMPLES

	alignb	16777216
g_InstrumentBuffer:
	resd MAX_INSTRUMENT_SUBSAMPLES

	resd 256
	alignb	16777216
g_InstrumentRender:
	resd MAX_INSTRUMENT_SUBSAMPLES

	alignb	16777216
g_InstrumentStore:
	resd MAX_TOTAL_INSTRUMENT_SAMPLES

endstruc

section vars bss align=8
vars_align16
globals:
		resb	globalvars_size
		resb	globalvars_size


;; ********** Generate the sound for one layer **********

section mklayer text align=1
makelayer:
	lea		edx, [dword ebx + g_layerparams]

	; Init random variables for layer
	fild	word [dword ebx + g_layer_random]
	mov		ecx, dword [dword ebx + g_layer_random]
	ror		ecx, cl
	dec		ecx
	mov		dword [dword ebx + g_layer_random], ecx

	fld		IP(bdetune, FLOAT)
	fmul	st0, st0
	fmulp	st1, st0
	fadd	st0, st1
	fstp	qword [edx]
	add		edx, byte 8

	fild	word [dword ebx + g_layer_random]
	mov		ecx, dword [dword ebx + g_layer_random]
	ror		ecx, cl
	dec		ecx
	mov		dword [dword ebx + g_layer_random], ecx

	fld		IP(mdetune, FLOAT)
	fmul	st0, st0
	fmulp	st1, st0
	fadd	st0, st1
	fstp	qword [edx]
	add		edx, byte 8

	fild	word [dword ebx + g_layer_random]
	mov		ecx, dword [dword ebx + g_layer_random]
	ror		ecx, cl
	dec		ecx
	mov		dword [dword ebx + g_layer_random], ecx

	fmul	IP(indexspr, FLOAT)
	fadd	IP(index, FLOAT)
	fstp	qword [edx]
	add		edx, byte 8

	; Init exponentiated variables for layer
	lea		edi, [dword ebx + g_instrparams+ip_bpitch]
	mov		ecx, 7+USES_INDEXDECAY+USES_GAIN
.powloop:
	fld		dword [edi]

	fld1
	fld		st1
	fprem
	fstp	st1
	f2xm1
	fld1
	faddp	st1, st0
	fscale

	fstp	qword [edx]
	add		edx, byte 8
	fstp	st0
	scasd
	loop	.powloop

	; Loop over samples
	fldz	; b phase
	fldz	; m phase
	lea		edi, [dword ebx + g_InstrumentBuffer]

	; Calculate max note size
	xor		eax, eax
%if USES_VELOCITY
	lodsb	; Skip velocity
%endif
%if USES_LONG_NOTES
	cmp		[esi], byte 0
	jge		near .short_notelen
	lodsb
	not		al
	shl		eax, 8
.short_notelen:
%endif
	lodsb	; Length of longest note with this tone
	mov		edx, SUBSAMPLES_PER_TICK
	mul		edx
	add		eax, MAX_RELEASE_SUBSAMPLES
	xchg	ecx, eax

.sampleloop:
	lea		edx, [dword ebx + g_layerparams]

	; Look up and normalize mod wave
	fist	dword [ebx]
	mov		eax, IP(modwave,INT)
	mov		ax, [ebx]
	fld		dword [waveforms + eax*4]

	; Adjust by index
	fmul	qword [edx + 2*8] ; layer_index
	fadd	st0, st2

	; Look up base wave
	fistp	dword [ebx]
	mov		eax, IP(basewave,INT)
	mov		ax, [ebx]
	fld		dword [waveforms + eax*4]

	; Update phases
	fld		qword [edx] ; layer_bfreq
	add		edx, byte 8
	fmul	qword [edx + 2*8] ; layer_bpitch
	faddp	st3, st0

	fld		qword [edx] ; layer_mfreq
	add		edx, byte 8
	fmul	qword [edx + 2*8] ; layer_mpitch
	faddp	st2, st0

%if USES_INDEXDECAY
	fld		qword [edx] ; layer_index
	fld1
	fadd	st1, st0
	fsubp	st1, st0
%endif
	add		edx, byte 8

	; Update pitches: p := (p-1)*d+1 
.update:
	fld1
	fld		qword [edx] ; layer_(b/m)pitch
	fsub	st0, st1
	fmul	qword [edx + 2*8] ; layer_(b/m)pitchd
	faddp	st1, st0
	fstp	qword [edx] ; layer_(b/m)pitch
	add		edx, byte 8

	neg		ecx
	js		.update

%if USES_INDEXDECAY
	fmul	qword [edx + 2*8] ; layer_indexd
	fstp	qword [edx - 3*8] ; layer_index
%endif

	; Add to existing layers
	fadd	dword [edi]
	fstp	dword [edi]
	scasd

	loop	.sampleloop

	fstp	st0
	fstp	st0
	ret


;; ********** Interpolate one section of amplitude envelope **********

section adsr text align=1
apply_adsr:
	; On condition g:
	;   st0 = amplitude target
	;   st1 = amplitude
	;	st2 = velocity / nlayers
	;   eax = number of samples
	;   ecx = sample index
	; On condition le:
	;   st0 = number of samples
	;   st1 = amplitude target
	;   st2 = amplitude
	;	st3 = velocity / nlayers
	;   ecx = sample index

	push	eax
	jg		.integer_length
	fimul	dword [c_finalamp]
	fistp	dword [esp]
.integer_length:
	fsub	st0, st1
	fild	dword [esp]
	pop		eax
	add		eax, ecx
	fdivp	st1, st0

.adsrloop:
	fld		dword [dword ebx + g_InstrumentBuffer + ecx*4]
	fmul	st0, st3	; velocity / nlayers
	fmul	st0, st2	; envelope value

%if USES_GAIN
	fld1
	fsubr	qword [dword ebx + g_layer_gain]
	fmul	st0, st1
	fmul	st0, st1
	fld1
	faddp	st1, st0
	fdivr	qword [dword ebx + g_layer_gain]
	fsqrt
	fmulp	st1, st0
%endif

	fstp	dword [dword ebx + g_InstrumentRender + ecx*4]

	fadd	st1, st0
	inc		ecx

	cmp		ecx, eax
	jl		.adsrloop

	fstp	st0
	ret


;; ********** Main music generation **********

section genMus text align=1
Clinkster_GenerateMusic:
_Clinkster_GenerateMusic@0:
	pusha
	fninit

	; Make waveforms
	mov		edi, waveforms
%if USES_SINE
	fldz
	mov		ecx, WAVE_SIZE
.sineloop:
	fadd	dword [c_wavestep]
	fld		st0
	fldpi
	fmulp	st1, st0
	fsin
	fstp	dword [edi]
	scasd
	loop	.sineloop
	fstp	st0
%endif

%if USES_SAWTOOTH
	fld1
	fchs
	mov		ecx, WAVE_SIZE
.sawtoothloop:
	fadd	dword [c_wavestep]
	fst		dword [edi]
	scasd
	loop	.sawtoothloop
	fstp	st0
%endif

%if USES_SQUARE
	fld1
	fchs
	mov		ecx, WAVE_SIZE
.squareloop:
	cmp		ecx, WAVE_SIZE/2
	jne		.notflipsq
	fabs
.notflipsq:
	fst		dword [edi]
	scasd
	loop	.squareloop
	fstp	st0
%endif

%if USES_PARABOLA
	fld1
	fchs
	mov		ecx, WAVE_SIZE
.parabolaloop:
	fadd	dword [c_wavestep]
	fld		st0
	fmul	st0, st1
	fadd	st0, st0
	fld1
	fsubp	st1, st0
	fstp	dword [edi]
	scasd
	loop	.parabolaloop
	fstp	st0
%endif

%if USES_TRIANGLE
	fld1
	fchs
	mov ecx, WAVE_SIZE
.triangleloop:
	fadd	dword [c_wavestep]
	fld		st0
	fadd	st0, st1
	fabs
	fld1
	fsubp	st1, st0
	fstp	dword [edi]
	scasd
	loop	.triangleloop
	fstp st0
%endif

%if USES_NOISE
	fld1
	fchs
	mov		ecx, WAVE_SIZE
.noiseloop:
	fadd	dword [c_wavestep]
	fldpi
	fmulp	st1, st0
	fsin
	fst		dword [edi]
	scasd
	loop	.noiseloop
	fstp	st0
%endif

	push	byte 0 ; lpThreadId
	push	byte 0 ; dwCreationFlags
	push	byte 0 ; lpParameter
	push	makechannel
	push	byte 0 ; dwStackSize
	push	byte 0 ; lpThreadAttributes
	call	[__imp__CreateThread@24]

	push	byte -1
	push	eax

	push	byte 2
	call	makechannel

	call	[__imp__WaitForSingleObject@8]

	popa
	ret

makechannel:
	; eax = channel (0 or 2)
	mov		eax, [esp + 4]
	mov		edx, globalvars_size/2
	mul		edx
	mov		ebx, globals
	add		ebx, eax
	mov		eax, [esp + 4]
	mov		[dword ebx + g_stereo], eax

	mov		dword [dword ebx + g_noteposptr], _NotePositions
	mov		dword [dword ebx + g_notesamptr], _NoteSamples

	mov		esi, _InstrumentData
%if USES_DELAY
	jmp		short .trackloop

.delay:
	mov		eax, dword [dword ebx + g_stereo]
	mov		edx, (LEFT_DELAY_LENGTH-RIGHT_DELAY_LENGTH)*4/2
	mul		edx
	sub		eax, LEFT_DELAY_LENGTH*4
	lea		edi, [dword ebx + g_MixingBuffer]
	mov		ecx, TOTAL_SAMPLES
.delayloop:
	fld		dword [edi+eax]
	fmul	dword [c_delaystr]
	fadd	dword [edi]
	fstp	dword [edi]
	scasd
	loop	.delayloop
%endif

.trackloop:
	; ESI = instr data
	lea		edi, [dword ebx + g_instrparams]
	mov		ecx, instr_params_size/4
.ploop:
	lodsb
	movsx	eax, al
	push	eax
	fild	dword [esp]
	pop		eax
	fmul	dword [param_weights-4+ecx*4]
	
	fstp	dword [edi]
	scasd
	loop	.ploop

	lea		edi, [dword ebx + g_instrparams+ip_bpitchd]
	mov		ecx, 2+USES_INDEXDECAY
.cubeloop:
	fld		dword [edi]
	fld		st0
	fmul	st0, st0
	fmulp	st1, st0
	fstp	dword [edi]
	scasd
	loop	.cubeloop

	lea		ebp, [dword ebx + g_InstrumentPointers]
	lea		edi, [dword ebx + g_InstrumentStore]
	mov		dword [ebp], edi	; store first instrument instance address
	fld		dword [c_basefreq]

	; Loop over instrument tones
.toneloop:
	xor		eax, eax
	lodsb			; Tone
.freqloop:
	fmul	dword [c_halfnote]
	dec		eax
	jge		.freqloop

	; random seed for channel = RandomSeed * 16307 + channel * 12042
	mov		eax, dword [dword ebx + g_stereo]
	mov		edx, 12042/2
	mul		edx
	add		eax, IP(randomseed,INT)
	xchg	ecx, eax
	mov		dword [dword ebx + g_layer_random], ecx

	xor		eax, eax
	lea		edi, [dword ebx + g_InstrumentBuffer]
	mov		ecx, MAX_INSTRUMENT_SUBSAMPLES
	rep stosd

	; Loop over layers
	mov		ecx, IP(layers,INT)
.layerloop:
	pusha

	call	makelayer

	popa
	loop	.layerloop

.lengthloop:
%if USES_VELOCITY
	lodsb
	movsx	eax, al
	push	eax
	fild	dword [esp]
	pop		eax
	fmul	dword [c_velocityfac]
%else
	fld1
%endif
	fidiv	IP(layers,INT)

	xor		ecx, ecx			; sample index	
	fldz						; amplitude level

	fld1						; attack amplitude target
	fld		qword [dword ebx + g_layer_attack]; attack length
	call	apply_adsr
	
	fld		IP(sustain,FLOAT)	; decay amplitude target
	fld		qword [dword ebx + g_layer_decay]	; decay length
	call	apply_adsr
	
	xor		eax, eax
%if USES_LONG_NOTES
	cmp		[esi], byte 0
	jge		near .short_notelen
	lodsb
	not		al
	shl		eax, 8
.short_notelen:
%endif
	lodsb						; note length in ticks
	mov		edx, SUBSAMPLES_PER_TICK
	mul		edx
	sub		eax, ecx			; note length exclusing attack and decay
	jle		.nosustain			; attack + decay overflows note length
	fld		IP(sustain,FLOAT)	; sustain amplitude target
	call	apply_adsr
.nosustain:

	fldz						; release amplitude target
	fld		qword [dword ebx + g_layer_release];release length
	call	apply_adsr
	
	fldz						; padding amplitude
	fld1						; padding length
	call	apply_adsr

	fstp	st0
	fstp	st0

	; Resampling
	push	esi
	mov		edi, [ebp]	; instrument instance address
	add		ebp, byte 4

	xchg	edx, eax
	lea		esi, [dword ebx + g_InstrumentRender - FILTER_SIZE*4]
.resampleloop:
	fldz
	mov		ecx, FILTER_SIZE
.filterloop:
	movsx	eax, byte [resamplefilter + ecx - 1]
	push	eax
	fild	dword [esp]
	pop		eax
	fmul	dword [esi + ecx*4]
	faddp	st1, st0
	loop	.filterloop

%if USES_PANNING
	mov		eax, dword [dword ebx + g_stereo]
	fmul	IPI(volume,eax*2,FLOAT)
%else
	fmul	IP(volume,FLOAT)
%endif
	fstp	dword [edi]
	scasd
	add		esi, byte 4*4

	sub		edx, byte 4
	jg		.resampleloop

	mov		[ebp], edi	; store instrument instance address
	pop		esi

	cmp		[esi], byte 0
	jne		near .lengthloop
	lodsb

	cmp		[esi], byte 0
	jge		near .toneloop
	lodsb
	fstp	st0

	; Mixing
	lea		ebp, [dword ebx + g_MixingBuffer]
	xchg	esi, dword [dword ebx + g_notesamptr]
.noteloop:
	xchg	esi, dword [dword ebx + g_noteposptr]
	xor		eax, eax
	cmp		[esi], byte 0
	jge		near .short_notepos
	lodsb
	not		al
	shl		eax, 8
.short_notepos:
	lodsb
	mov		edx, SUBSAMPLES_PER_TICK/4*4
	mul		edx
	add		ebp, eax

%if CLINKSTER_GENERATE_TIMING_DATA
	mov		ecx, SUBSAMPLES_PER_TICK/4*4
	div		ecx
	xchg	edx, eax
	mov		edi, [timing_ptr]
	mov		eax, [edi]
	mov		ecx, edx
	rep stosd
	mov		[timing_ptr], edi
	add		eax, edx
	stosd
%endif

	xchg	esi, dword [dword ebx + g_noteposptr]
	xor		eax, eax
	lodsb
	mov		edx, dword [dword ebx + g_InstrumentPointers + eax*4] ; Instrument instance ptr
	mov		edi, ebp
	
.mixloop:
	fld		dword [edx]
	fadd	dword [edi]
	fstp	dword [edi]
	scasd
	add		edx, byte 4

	cmp		edx, dword [dword ebx + g_InstrumentPointers + eax*4 + 4]
	jl		.mixloop

	cmp		[esi], byte 0
	jge		near .noteloop
	lodsb
	xchg	esi, dword [dword ebx + g_notesamptr]

%if CLINKSTER_GENERATE_TIMING_DATA
	mov		ecx, 1<<LOGNUMTICKS
	mov		edi, [timing_ptr]
	mov		eax, [edi]
	sub		ecx, eax
	rep		stosd
	mov		[timing_ptr], edi
%endif

	cmp		[esi], byte 0
	jge		near .trackloop
	lodsb

%if USES_DELAY
	cmp		[esi], byte 0
	jge		near .delay
%endif

	; Clamp and convert to shorts
	fld1
	mov		edi, Clinkster_MusicBuffer
	mov		ecx, TOTAL_SAMPLES
	add		edi, dword [dword ebx + g_stereo]
.sloop:
	fld		dword [dword ebx + g_MixingBuffer + ecx*4]
	fcomi	st0, st1
	fcmovnb	st0, st1
	fchs
	fcomi	st0, st1
	fcmovnb	st0, st1
	fchs

	fimul	dword [c_finalamp]
	fistp	word [edi + ecx*4]
	loop	.sloop
	fstp	st0
	ret		4


;; ********** Start music **********

section startmus text align=1
Clinkster_StartMusic:
_Clinkster_StartMusic@0:
	; Start music
	push	byte 0
	push	byte 0
	push	byte 0
	push	_WaveFormat
	push	byte -1
	push	_WaveOutHandle
	call	[__imp__waveOutOpen@24]

	push	byte 32					; sizeof(WAVEHDR)
	push	_WaveHdr
	push	dword [_WaveOutHandle]					; waveOutHandle
	call	[__imp__waveOutPrepareHeader@12]

	push	byte 32					; sizeof(WAVEHDR)
	push	_WaveHdr
	push	dword [_WaveOutHandle]
	call	[__imp__waveOutWrite@12]
	ret


;; ********** Get current play position **********

section getpos text align=1
Clinkster_GetPosition:
_Clinkster_GetPosition@0:
	push	byte 32					; sizeof(MMTIME)
	push	_WaveTime
	push	dword [_WaveOutHandle]
	call	[__imp__waveOutGetPosition@12]

	fild	dword [_WaveTime+4]
%if CLINKSTER_TIMER_OFFSET>0
	fiadd	dword [c_timeoffset]
%endif
	fidiv	dword [c_ticklength]
	ret


;; ********** Get time since instrument trigger **********

%if CLINKSTER_GENERATE_TIMING_DATA
section insttrig text align=1
Clinkster_GetInstrumentTrigger:
_Clinkster_GetInstrumentTrigger@8:
	cvttss2si eax, [esp+8]
	mov		ecx, [esp+4]
	shl		ecx, LOGNUMTICKS+2
	fld		dword [esp+8]
	fisub	dword [Clinkster_NoteTiming+ecx+eax*4]
	ret		8
%endif
