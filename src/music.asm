; Clinkster music converted from sunspire_-_blue_morpho_RC1.xrns 2016-10-19 14:34:52

%define USES_SINE 1
%define USES_SAWTOOTH 1
%define USES_SQUARE 1
%define USES_PARABOLA 1
%define USES_TRIANGLE 1
%define USES_NOISE 1
%define USES_VELOCITY 1
%define USES_LONG_NOTES 0
%define USES_DELAY 1
%define USES_PANNING 0
%define USES_INDEXDECAY 1
%define USES_GAIN 1

%define SUBSAMPLES_PER_TICK 16536
%define MAX_INSTRUMENT_SUBSAMPLES 2752512
%define MAX_TOTAL_INSTRUMENT_SAMPLES 6225920
%define MAX_RELEASE_SUBSAMPLES 851968
%define TOTAL_SAMPLES 8978432
%define MAX_TRACK_INSTRUMENT_RENDERS 52

%define MAX_DELAY_LENGTH 16493
%define LEFT_DELAY_LENGTH 16493
%define RIGHT_DELAY_LENGTH 16493
%define DELAY_STRENGTH 0.55426236

%define NUMTRACKS 25
%define LOGNUMTICKS 12
%define MUSIC_LENGTH 2112
%define TICKS_PER_SECOND 10.66666667


	section instdata data align=1

_InstrumentData:
	; 00:  Track 03 / 0C|
	db	0,0,3,6,2,10,24,70,4,41,80,89,0,0,0,38,-51,-14,0
	db	40,48,2,127,6,127,4,127,3,127,2,0,-1
	; 01:  Track 03 / 11|
	db	0,0,100,100,0,8,8,0,0,41,-120,-120,-128,-128,32,-28,-94,18,0
	db	91,80,1,127,1,0,-1
	; 02:  Track 03 / 0D|
	db	4,0,12,13,3,16,9,0,-6,41,82,36,0,0,-18,-14,-43,14,0
	db	40,127,10,127,6,0,-1
	; 03:  Track 08 / 05|
	db	0,1,11,2,29,0,16,64,12,41,0,19,0,0,-22,-41,-78,16,28
	db	62,80,2,0,2,80,2,0,1,80,2,0,4,80,4,80,2,0,1,80,2,127,12,0,0,80,2,127,16,0,1,127,12,0,1,127,18,0,2,80,2,127,18,127,2,0,1,127,16,0,1,80,2,127,12,127,10,127,2,0,0,127,14,0,1,127,18,0,1,127,12,0,-1
	; 04:  Track 08 / 08|
	db	3,0,5,0,15,6,16,0,16,41,0,12,0,-128,0,-40,-80,-2,28
	db	57,127,4,0,0,127,4,127,2,0,3,127,2,0,-1
	; 05:  Track 08 / 09|
	db	3,0,5,0,15,12,16,0,16,41,0,12,0,-128,0,-40,-80,-2,28
	db	62,127,6,0,4,127,4,0,2,127,2,0,3,127,6,0,-1
	; 06:  Track 08 / 0A|
	db	3,0,5,0,15,60,16,0,16,41,0,12,0,-128,0,-40,-80,-2,28
	db	57,127,4,127,2,0,0,127,4,0,3,127,6,127,2,0,-1
	; 07:  Track 08 / 10|
	db	2,4,2,2,11,0,7,48,8,41,10,0,-32,-128,-104,-56,-48,3,0
	db	27,127,16,0,6,127,2,0,2,127,3,0,4,127,3,0,-1
	; 08:  Track 09 / 06|
	db	1,0,8,0,0,0,16,0,22,41,12,-120,-128,-128,0,-39,28,0,30
	db	75,127,30,0,3,127,30,127,24,0,0,127,34,0,1,127,34,127,2,0,1,127,34,127,30,0,1,127,34,0,0,127,34,0,-1
	; 09:  Track 09 / 11|
	db	0,0,100,100,0,8,8,0,0,41,-120,-120,-128,-128,32,-28,-94,18,0
	db	91,127,1,0,-1
	; 10:  Track 09 / 06|
	db	1,0,8,0,0,0,16,0,22,41,12,-120,-128,-128,0,-39,28,0,30
	db	72,127,30,0,1,127,30,127,24,0,0,127,34,0,3,127,34,127,30,127,2,0,2,127,34,0,1,127,34,0,-1
	; 11:  Track 09 / 06|
	db	1,0,8,0,0,0,16,0,22,41,12,-120,-128,-128,0,-39,28,0,30
	db	67,127,30,0,2,127,30,127,24,0,1,127,34,0,1,127,34,127,2,0,0,127,34,127,30,0,3,127,34,0,0,127,34,0,-1
	; 12:  Track 10 / 07|
	db	0,0,14,45,8,0,24,67,-2,41,-24,-79,8,-114,0,-18,-120,12,6
	db	68,48,1,127,6,127,2,127,1,0,-1
	; 13:  Track 10 / 07|
	db	0,0,14,45,8,0,24,67,-2,41,-24,-79,8,-114,0,-18,-120,12,6
	db	86,64,6,64,2,0,-1
	; 14:  Track 11 / 0B|
	db	4,5,11,0,62,21,3,30,10,41,-2,0,10,0,-98,-26,-22,-8,28
	db	64,127,4,0,0,127,4,0,6,127,6,0,1,127,6,127,2,0,0,127,1,0,0,127,6,127,1,0,0,127,16,127,14,127,4,0,1,127,4,127,2,0,1,127,8,127,2,0,0,127,3,0,1,127,6,127,4,127,2,0,1,127,6,127,4,127,3,127,2,0,1,127,6,127,4,127,3,127,2,127,1,0,0,127,3,127,2,127,1,0,1,127,10,127,4,127,2,127,1,0,1,127,6,127,3,127,2,127,1,0,1,127,8,127,6,0,0,127,8,127,6,127,4,127,2,0,1,127,6,127,2,0,1,127,8,127,6,127,1,0,0,127,6,127,2,0,-1
	db	-1
	; 15:  Track 01 / 00|
	db	3,0,5,5,5,5,8,5,16,41,0,0,0,0,0,-13,16,12,30
	db	31,127,84,127,64,127,16,0,0,127,16,127,1,0,0,127,32,0,2,127,64,0,2,127,16,0,-1
	; 16:  Track 01 / 09|
	db	3,0,5,0,15,12,16,0,16,41,0,12,0,-128,0,-40,-80,-2,28
	db	29,127,2,0,1,127,4,127,2,0,0,127,4,127,2,0,0,127,4,127,2,0,0,127,2,0,1,127,4,127,2,0,2,127,4,127,2,0,-1
	; 17:  Track 01 / 0A|
	db	3,0,5,0,15,60,16,0,16,41,0,12,0,-128,0,-40,-80,-2,28
	db	31,127,4,127,2,0,0,127,4,127,2,0,0,127,4,127,2,0,5,127,4,127,2,0,-1
	; 18:  Track 02 / 01|
	db	1,0,13,23,0,7,12,37,0,41,55,22,0,0,0,8,-67,-14,0
	db	70,48,1,127,1,0,-1
	; 19:  Track 04 / 02|
	db	0,2,7,5,36,5,16,4,11,41,12,0,4,0,0,-42,-98,-6,20
	db	56,127,2,0,1,80,4,80,2,0,1,80,2,127,2,0,1,80,2,0,0,80,2,0,4,127,2,0,1,80,4,80,2,0,1,80,2,127,4,127,2,0,1,80,2,127,2,0,0,80,2,127,2,0,3,127,2,0,4,127,4,127,2,0,1,127,2,0,0,127,2,0,3,127,2,0,-1
	; 20:  Track 04 / 02|
	db	0,2,7,5,36,5,16,4,11,41,12,0,4,0,0,-42,-98,-6,20
	db	70,80,4,80,2,0,1,80,2,0,1,80,2,0,0,80,2,0,6,80,4,80,2,0,1,80,4,80,2,0,1,80,2,127,2,0,0,80,2,0,3,80,2,0,4,80,4,80,2,0,1,80,2,127,2,0,0,80,2,0,3,80,2,0,-1
	; 21:  Track 05 / 03|
	db	4,1,8,4,60,50,16,11,-8,41,26,72,-128,0,0,4,-110,-2,0
	db	65,127,2,0,1,127,2,0,2,127,2,0,1,127,2,0,1,127,4,0,0,127,4,0,3,127,4,0,-1
	; 22:  Track 05 / 04|
	db	4,1,8,4,60,50,16,13,-8,41,26,72,-128,0,0,4,-110,-2,0
	db	65,127,2,0,1,127,2,0,2,127,2,0,1,127,2,0,1,127,4,0,0,127,4,0,3,127,4,0,-1
	; 23:  Track 06 / 0E|
	db	0,5,2,3,0,100,12,127,0,41,29,120,-74,-128,-128,-6,-78,0,0
	db	30,80,1,127,1,0,-1
	; 24:  Track 07 / 0F|
	db	4,5,5,14,0,35,50,0,0,41,10,-96,-108,52,-30,16,-120,-4,0
	db	54,127,1,0,-1
	db	-1,-1

	section notepos data align=1

_NotePositions:
	; 00:  Track 03 / 0C|
	; position 12 - pattern 12
	db	-4,6,2,16,2,12,2,16,2
	; position 13 - pattern 13
	db	12,2,16,2,12,2,16,2
	; position 14 - pattern 14
	db	12,2,16,2,12,2,16,2
	; position 15 - pattern 15
	db	12,2,16,2,12,2,16,2
	; position 24 - pattern 24
	db	-3,12,2,16,2,12,2,16,2
	; position 25 - pattern 25
	db	12,2,16,2,12,2,16,2
	; position 26 - pattern 26
	db	12,2,16,2,12,2,16,2
	; position 27 - pattern 27
	db	12,2,16,2,12,2,16,2
	; position 28 - pattern 28
	db	12,2,16,2,12,2,16,2
	; position 29 - pattern 29
	db	12,2,16,2,12,2,16,2
	; position 30 - pattern 30
	db	12,2,16,2,12,2,16,2
	; position 31 - pattern 31
	db	12,2,16,2,12,2,16,2
	; position 32 - pattern 32
	db	10,2

	; 01:  Track 03 / 11|
	; position 20 - pattern 20
	db	-6,0
	; position 24 - pattern 24
	db	-2,0
	; position 25 - pattern 25
	db	64
	; position 26 - pattern 26
	db	64,62
	; position 27 - pattern 27
	db	2
	; position 28 - pattern 28
	db	64
	; position 29 - pattern 29
	db	64,62
	; position 30 - pattern 30
	db	2
	; position 31 - pattern 31
	db	64
	; position 32 - pattern 32
	db	64

	; 02:  Track 03 / 0D|
	; position 24 - pattern 24
	db	-7,14,18,14
	; position 25 - pattern 25
	db	32,18,14
	; position 26 - pattern 26
	db	32,18,14
	; position 27 - pattern 27
	db	32,18,14
	; position 28 - pattern 28
	db	32,18,14
	; position 29 - pattern 29
	db	32,18,14
	; position 30 - pattern 30
	db	32,18,14
	; position 31 - pattern 31
	db	32,18,14

	; 03:  Track 08 / 05|
	; position 4 - pattern 4
	db	-2,0,10,2,2,18,12,2
	; position 5 - pattern 5
	db	18,12,2,16,2,12,2
	; position 6 - pattern 6
	db	18,10,2,2,16,2,12,2
	; position 7 - pattern 7
	db	18,12,2,14,4,12,2
	; position 20 - pattern 20
	db	-4,18,10,2,2,18,12,2
	; position 21 - pattern 21
	db	18,12,2,16,2,12,2
	; position 22 - pattern 22
	db	18,10,2,2,16,2,12,2
	; position 23 - pattern 23
	db	18,12,2,14,4,12,2

	; 04:  Track 08 / 08|
	; position 8 - pattern 8
	db	-3,0,4,2,4
	; position 9 - pattern 9
	db	54,4,2,4
	; position 10 - pattern 10
	db	54,4,2,4
	; position 11 - pattern 11
	db	54,4,2,4
	; position 12 - pattern 12
	db	54,4,2,4
	; position 13 - pattern 13
	db	54,4,2,4
	; position 14 - pattern 14
	db	54,4,2,4
	; position 15 - pattern 15
	db	54,4,2,4
	; position 24 - pattern 24
	db	-3,54,4,2,4
	; position 25 - pattern 25
	db	54,4,2,4
	; position 26 - pattern 26
	db	54,4,2,4
	; position 27 - pattern 27
	db	54,4,2,4
	; position 28 - pattern 28
	db	54,4,2,4
	; position 29 - pattern 29
	db	54,4,2,4
	; position 30 - pattern 30
	db	54,4,2,4
	; position 31 - pattern 31
	db	54,4,2,4
	; position 32 - pattern 32
	db	54

	; 05:  Track 08 / 09|
	; position 8 - pattern 8
	db	-3,14,6,4,2,26,4,2
	; position 9 - pattern 9
	db	20,6,4,2,26,4,2
	; position 10 - pattern 10
	db	20,6,4,2,26,4,2
	; position 11 - pattern 11
	db	20,6,4,2,26,4,2
	; position 12 - pattern 12
	db	20,6,4,2,26,4,2
	; position 13 - pattern 13
	db	20,6,4,2,26,4,2
	; position 14 - pattern 14
	db	20,6,4,2,26,4,2
	; position 15 - pattern 15
	db	20,6,4,2,26,4,2
	; position 24 - pattern 24
	db	-3,20,6,4,2,26,4,2
	; position 25 - pattern 25
	db	20,6,4,2,26,4,2
	; position 26 - pattern 26
	db	20,6,4,2,26,4,2
	; position 27 - pattern 27
	db	20,6,4,2,26,4,2
	; position 28 - pattern 28
	db	20,6,4,2,26,4,2
	; position 29 - pattern 29
	db	20,6,4,2,26,4,2
	; position 30 - pattern 30
	db	20,6,4,2,26,4,2
	; position 31 - pattern 31
	db	20,6,4,2

	; 06:  Track 08 / 0A|
	; position 8 - pattern 8
	db	-3,32,4,2,4,4
	; position 9 - pattern 9
	db	50,4,2,4,4
	; position 10 - pattern 10
	db	50,4,2,4,4
	; position 11 - pattern 11
	db	50,4,2,4,4
	; position 12 - pattern 12
	db	50,4,2,4,4
	; position 13 - pattern 13
	db	50,4,2,4,4
	; position 14 - pattern 14
	db	50,4,2,4,4
	; position 15 - pattern 15
	db	50,4,2,4,4
	; position 24 - pattern 24
	db	-3,50,4,2,4,4
	; position 25 - pattern 25
	db	50,4,2,4,4
	; position 26 - pattern 26
	db	50,4,2,4,4
	; position 27 - pattern 27
	db	50,4,2,4,4
	; position 28 - pattern 28
	db	50,4,2,4,4
	; position 29 - pattern 29
	db	50,4,2,4,4
	; position 30 - pattern 30
	db	50,4,2,4,4
	; position 31 - pattern 31
	db	50,4,2

	; 07:  Track 08 / 10|
	; position 31 - pattern 31
	db	-8,232,3,3,2

	; 08:  Track 09 / 06|
	; position 8 - pattern 8
	db	-3,0,30
	; position 9 - pattern 9
	db	34,30
	; position 10 - pattern 10
	db	34,30
	; position 11 - pattern 11
	db	34,30
	; position 12 - pattern 12
	db	34,30
	; position 13 - pattern 13
	db	34,30
	; position 14 - pattern 14
	db	34,30
	; position 15 - pattern 15
	db	34,30
	; position 24 - pattern 24
	db	-3,34,30
	; position 25 - pattern 25
	db	34,30
	; position 26 - pattern 26
	db	34,30
	; position 27 - pattern 27
	db	34,30
	; position 28 - pattern 28
	db	34,30
	; position 29 - pattern 29
	db	34,30
	; position 30 - pattern 30
	db	34,30
	; position 31 - pattern 31
	db	34,30
	; position 32 - pattern 32
	db	34,12

	; 09:  Track 09 / 11|
	; position 16 - pattern 16
	db	-5,0

	; 10:  Track 09 / 06|
	; position 8 - pattern 8
	db	-3,0,30
	; position 9 - pattern 9
	db	34,30
	; position 10 - pattern 10
	db	34,30
	; position 11 - pattern 11
	db	34,30
	; position 12 - pattern 12
	db	34,30
	; position 13 - pattern 13
	db	34,30
	; position 14 - pattern 14
	db	34,30
	; position 15 - pattern 15
	db	34,30
	; position 24 - pattern 24
	db	-3,34,30
	; position 25 - pattern 25
	db	34,30
	; position 26 - pattern 26
	db	34,30
	; position 27 - pattern 27
	db	34,30
	; position 28 - pattern 28
	db	34,30
	; position 29 - pattern 29
	db	34,30
	; position 30 - pattern 30
	db	34,30
	; position 31 - pattern 31
	db	34,30
	; position 32 - pattern 32
	db	34,12

	; 11:  Track 09 / 06|
	; position 8 - pattern 8
	db	-3,0,30
	; position 9 - pattern 9
	db	34,30
	; position 10 - pattern 10
	db	34,30
	; position 11 - pattern 11
	db	34,30
	; position 12 - pattern 12
	db	34,30
	; position 13 - pattern 13
	db	34,30
	; position 14 - pattern 14
	db	34,30
	; position 15 - pattern 15
	db	34,30
	; position 24 - pattern 24
	db	-3,34,30
	; position 25 - pattern 25
	db	34,30
	; position 26 - pattern 26
	db	34,30
	; position 27 - pattern 27
	db	34,30
	; position 28 - pattern 28
	db	34,30
	; position 29 - pattern 29
	db	34,30
	; position 30 - pattern 30
	db	34,30
	; position 31 - pattern 31
	db	34,30
	; position 32 - pattern 32
	db	34,12

	; 12:  Track 10 / 07|
	; position 8 - pattern 8
	db	-3,0,6
	; position 10 - pattern 10
	db	122,6
	; position 12 - pattern 12
	db	122,6
	; position 14 - pattern 14
	db	122,6
	; position 15 - pattern 15
	db	116,1,1,1,1,1
	; position 16 - pattern 16
	db	1,6
	; position 24 - pattern 24
	db	-2,250,6
	; position 26 - pattern 26
	db	122,6
	; position 28 - pattern 28
	db	122,6
	; position 30 - pattern 30
	db	122,6
	; position 32 - pattern 32
	db	122,6

	; 13:  Track 10 / 07|
	; position 8 - pattern 8
	db	-3,0,6
	; position 10 - pattern 10
	db	122,6
	; position 12 - pattern 12
	db	122,6
	; position 14 - pattern 14
	db	122,6
	; position 16 - pattern 16
	db	122,6
	; position 24 - pattern 24
	db	-2,250,6
	; position 26 - pattern 26
	db	122,6
	; position 28 - pattern 28
	db	122,6
	; position 30 - pattern 30
	db	122,6
	; position 32 - pattern 32
	db	122,6

	; 14:  Track 11 / 0B|
	; position 12 - pattern 12
	db	-4,0,6,6,2,10,4,4,6,1,1,6,6,2,4
	; position 13 - pattern 13
	db	6,6,6,2,8,6,4,2,2,8,2,8,6
	; position 14 - pattern 14
	db	4,6,2,1,1,4,2,1,1,4,6,4,4,2,8,6,6
	; position 15 - pattern 15
	db	6,3,2,3,4,2,8,6,4,3,3,3,3,2,2
	; position 28 - pattern 28
	db	-4,16,6,6,2,10,4,4,6,1,1,6,6,2,4
	; position 29 - pattern 29
	db	6,6,6,2,8,6,4,2,2,8,2,8,6
	; position 30 - pattern 30
	db	4,6,2,1,1,4,2,1,1,4,6,4,4,2,8,6,6
	; position 31 - pattern 31
	db	6,3,2,3,4,2,8,6,4,3,3,3,3,2,2,14,1
	; position 32 - pattern 32
	db	1

	; 15:  Track 01 / 00|
	; position 2 - pattern 2
	db	-1,128
	; position 3 - pattern 3
	db	64,32,16
	; position 4 - pattern 4
	db	16
	; position 6 - pattern 6
	db	-1,128
	; position 7 - pattern 7
	db	64,32,16
	; position 8 - pattern 8
	db	16
	; position 10 - pattern 10
	db	-1,128
	; position 11 - pattern 11
	db	64,32,16
	; position 12 - pattern 12
	db	16
	; position 14 - pattern 14
	db	-1,128
	; position 15 - pattern 15
	db	64,32
	; position 18 - pattern 18
	db	-1,160
	; position 19 - pattern 19
	db	64,32,16
	; position 20 - pattern 20
	db	16
	; position 22 - pattern 22
	db	-1,128
	; position 23 - pattern 23
	db	64,32,16
	; position 24 - pattern 24
	db	16
	; position 26 - pattern 26
	db	-1,128
	; position 27 - pattern 27
	db	64,32,16
	; position 28 - pattern 28
	db	16
	; position 30 - pattern 30
	db	-1,128
	; position 31 - pattern 31
	db	64,32
	; position 32 - pattern 32
	db	32

	; 16:  Track 01 / 09|
	; position 19 - pattern 19
	db	-5,194,4,2,10,2,10,2,2,16,2,10
	; position 20 - pattern 20
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 21 - pattern 21
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 22 - pattern 22
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 23 - pattern 23
	db	2,2,4,2,10,2,10,2,2,16,2,10
	; position 24 - pattern 24
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 25 - pattern 25
	db	2,2,4,2,10,2,10,2,2,4,2,4,2,16
	; position 26 - pattern 26
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 27 - pattern 27
	db	2,2,4,2,10,2,10,2,2,16,2,10
	; position 28 - pattern 28
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 29 - pattern 29
	db	2,2,4,2,10,2,10,2,2,4,2,4,2,16
	; position 30 - pattern 30
	db	2,2,4,2,4,2,4,2,4,2,4,2,2,4,2,4,2,4,2,4,2,4
	; position 31 - pattern 31
	db	2,2,4,2,10,2,10,2,2

	; 17:  Track 01 / 0A|
	; position 19 - pattern 19
	db	-5,204,2,10,2,12,2,4,2,10,2
	; position 23 - pattern 23
	db	-1,210,2,10,2,12,2,4,2,10,2
	; position 25 - pattern 25
	db	82,2,10,2,24,2,4,2
	; position 27 - pattern 27
	db	82,2,10,2,12,2,4,2,10,2
	; position 29 - pattern 29
	db	82,2,10,2,24,2,4,2
	; position 31 - pattern 31
	db	82,2,10,2,12

	; 18:  Track 02 / 01|
	; position 0 - pattern 0
	db	0,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 1 - pattern 1
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 2 - pattern 2
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 3 - pattern 3
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 4 - pattern 4
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 5 - pattern 5
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 6 - pattern 6
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 7 - pattern 7
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 8 - pattern 8
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 9 - pattern 9
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 10 - pattern 10
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 11 - pattern 11
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 12 - pattern 12
	db	6,2,8,6,2,4,10,2,8,6,2,4
	; position 13 - pattern 13
	db	10,2,8,6,2,4,10,2,8,6,2,4
	; position 14 - pattern 14
	db	10,2,8,6,2,4,10,2,8,6,2,4
	; position 15 - pattern 15
	db	10,2,8,6,2,4,10,2,8,6,2,4
	; position 16 - pattern 16
	db	10,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 17 - pattern 17
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 18 - pattern 18
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 19 - pattern 19
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 20 - pattern 20
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 21 - pattern 21
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 22 - pattern 22
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 23 - pattern 23
	db	6,2,4,2,2,6,2,4,2,2,6,2,4,2,2,6,2,4,2,2
	; position 24 - pattern 24
	db	8,8,6,2,4,12,8,6,2,4
	; position 25 - pattern 25
	db	12,8,6,2,4,12,8,6,2,4
	; position 26 - pattern 26
	db	12,8,6,2,4,12,8,6,2,4
	; position 27 - pattern 27
	db	12,8,6,2,4,12,8,6,2,4
	; position 28 - pattern 28
	db	12,8,6,2,4,12,8,6,2,4
	; position 29 - pattern 29
	db	12,8,6,2,4,12,8,6,2,4
	; position 30 - pattern 30
	db	12,8,6,2,4,12,8,6,2,4
	; position 31 - pattern 31
	db	12,8,6,2,4,12,8,6,2,4
	; position 32 - pattern 32
	db	10

	; 19:  Track 04 / 02|
	; position 0 - pattern 0
	db	0,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 1 - pattern 1
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 2 - pattern 2
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 3 - pattern 3
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 4 - pattern 4
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 5 - pattern 5
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 6 - pattern 6
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 7 - pattern 7
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 8 - pattern 8
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 9 - pattern 9
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 10 - pattern 10
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 11 - pattern 11
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 12 - pattern 12
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 13 - pattern 13
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 14 - pattern 14
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 15 - pattern 15
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 16 - pattern 16
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 17 - pattern 17
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 18 - pattern 18
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 19 - pattern 19
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 20 - pattern 20
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 21 - pattern 21
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 22 - pattern 22
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 23 - pattern 23
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 24 - pattern 24
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 25 - pattern 25
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 26 - pattern 26
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 27 - pattern 27
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 28 - pattern 28
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 29 - pattern 29
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 30 - pattern 30
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 31 - pattern 31
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2,2
	; position 32 - pattern 32
	db	2

	; 20:  Track 04 / 02|
	; position 0 - pattern 0
	db	2,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 1 - pattern 1
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 2 - pattern 2
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 3 - pattern 3
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 4 - pattern 4
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 5 - pattern 5
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 6 - pattern 6
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 7 - pattern 7
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 8 - pattern 8
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 9 - pattern 9
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 10 - pattern 10
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 11 - pattern 11
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 12 - pattern 12
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 13 - pattern 13
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 14 - pattern 14
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 15 - pattern 15
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 16 - pattern 16
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 17 - pattern 17
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 18 - pattern 18
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 19 - pattern 19
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 20 - pattern 20
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 21 - pattern 21
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 22 - pattern 22
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 23 - pattern 23
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 24 - pattern 24
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 25 - pattern 25
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 26 - pattern 26
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 27 - pattern 27
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 28 - pattern 28
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 29 - pattern 29
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 30 - pattern 30
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2
	; position 31 - pattern 31
	db	4,2,2,2,2,2,2,2,4,4,2,2,2,2,2,2,2,2,2,2,2,2,4,4,2,2,2

	; 21:  Track 05 / 03|
	; position 0 - pattern 0
	db	0,4,2,4,2,2,4,2,2,4,2,2
	; position 1 - pattern 1
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 2 - pattern 2
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 3 - pattern 3
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 4 - pattern 4
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 5 - pattern 5
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 6 - pattern 6
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 7 - pattern 7
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 8 - pattern 8
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 9 - pattern 9
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 10 - pattern 10
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 11 - pattern 11
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 16 - pattern 16
	db	-2,2,4,2,4,2,2,4,2,2,4,2,2
	; position 17 - pattern 17
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 18 - pattern 18
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 19 - pattern 19
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 20 - pattern 20
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 21 - pattern 21
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 22 - pattern 22
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 23 - pattern 23
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 24 - pattern 24
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 25 - pattern 25
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 26 - pattern 26
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 27 - pattern 27
	db	34,4,2,4,2,2,4,2,2,4,2,2

	; 22:  Track 05 / 04|
	; position 0 - pattern 0
	db	32,4,2,4,2,2,4,2,2,4,2,2
	; position 1 - pattern 1
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 2 - pattern 2
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 3 - pattern 3
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 4 - pattern 4
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 5 - pattern 5
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 6 - pattern 6
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 7 - pattern 7
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 8 - pattern 8
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 9 - pattern 9
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 10 - pattern 10
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 11 - pattern 11
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 16 - pattern 16
	db	-2,66,4,2,4,2,2,4,2,2,4,2,2
	; position 17 - pattern 17
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 18 - pattern 18
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 19 - pattern 19
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 20 - pattern 20
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 21 - pattern 21
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 22 - pattern 22
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 23 - pattern 23
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 24 - pattern 24
	db	66,4,2,4,2,2,4,2,2,4,2,2
	; position 25 - pattern 25
	db	2,4,2,4,2,2,4,2,2,4,2,2
	; position 26 - pattern 26
	db	34,4,2,4,2,2,4,2,2,4,2,2
	; position 27 - pattern 27
	db	34,4,2,4,2,2,4,2,2,4,2,2

	; 23:  Track 06 / 0E|
	; position 17 - pattern 17
	db	-5,126
	; position 18 - pattern 18
	db	2,6,8,6,2,10,6,6,2,4,4
	; position 19 - pattern 19
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 20 - pattern 20
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 21 - pattern 21
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 22 - pattern 22
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 23 - pattern 23
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 24 - pattern 24
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 25 - pattern 25
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 26 - pattern 26
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 27 - pattern 27
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 28 - pattern 28
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 29 - pattern 29
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 30 - pattern 30
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 31 - pattern 31
	db	10,6,8,6,2,10,6,6,2,4,4
	; position 32 - pattern 32
	db	10

	; 24:  Track 07 / 0F|
	; position 18 - pattern 18
	db	-5,136,16,6,10,16,4,2
	; position 19 - pattern 19
	db	10,16,6,10,16,4,2
	; position 20 - pattern 20
	db	10,16,6,10,16,4,2
	; position 21 - pattern 21
	db	10,16,6,10,16,4,2
	; position 22 - pattern 22
	db	10,16,6,10,16,4,2
	; position 23 - pattern 23
	db	10,16,6,10,16,4,2
	; position 24 - pattern 24
	db	10,16,6,10,16,4,2
	; position 25 - pattern 25
	db	10,16,6,10,16,4,2
	; position 26 - pattern 26
	db	10,16,6,10,16,4,2
	; position 27 - pattern 27
	db	10,16,6,10,16,4,2
	; position 28 - pattern 28
	db	10,16,6,10,16,4,2
	; position 29 - pattern 29
	db	10,16,6,10,16,4,2
	; position 30 - pattern 30
	db	10,16,6,10,16,4,2
	; position 31 - pattern 31
	db	10,16,6,5,5,18,1,3,1


	section notesamp data align=1

_NoteSamples:
	; 00:  Track 03 / 0C|
	; position 12 - pattern 12
	db	0,3,0,3,0,4,0,3
	; position 13 - pattern 13
	db	0,3,0,3,0,4,0,3
	; position 14 - pattern 14
	db	0,3,0,3,0,4,0,3
	; position 15 - pattern 15
	db	0,3,0,3,0,4,0,3
	; position 24 - pattern 24
	db	0,1,0,1,0,1,0,1
	; position 25 - pattern 25
	db	0,1,0,1,0,1,0,1
	; position 26 - pattern 26
	db	0,1,0,1,0,1,0,2
	; position 27 - pattern 27
	db	0,1,0,1,0,1,0,1
	; position 28 - pattern 28
	db	0,1,0,1,0,1,0,1
	; position 29 - pattern 29
	db	0,1,0,1,0,1,0,2
	; position 30 - pattern 30
	db	0,1,0,1,0,1,0,1
	; position 31 - pattern 31
	db	0,1,0,1,0,1,0,1
	; position 32 - pattern 32
	db	0,3
	db	-1

	; 01:  Track 03 / 11|
	; position 20 - pattern 20
	db	0
	; position 24 - pattern 24
	db	1
	; position 25 - pattern 25
	db	1
	; position 26 - pattern 26
	db	1,0
	; position 27 - pattern 27
	db	1
	; position 28 - pattern 28
	db	1
	; position 29 - pattern 29
	db	1,0
	; position 30 - pattern 30
	db	1
	; position 31 - pattern 31
	db	1
	; position 32 - pattern 32
	db	1
	db	-1

	; 02:  Track 03 / 0D|
	; position 24 - pattern 24
	db	0,1,0
	; position 25 - pattern 25
	db	0,1,0
	; position 26 - pattern 26
	db	0,1,0
	; position 27 - pattern 27
	db	0,1,0
	; position 28 - pattern 28
	db	0,1,0
	; position 29 - pattern 29
	db	0,1,0
	; position 30 - pattern 30
	db	0,1,0
	; position 31 - pattern 31
	db	0,1,0
	db	-1

	; 03:  Track 08 / 05|
	; position 4 - pattern 4
	db	17,5,18,12,6,4,10
	; position 5 - pattern 5
	db	9,1,8,0,6,2,12
	; position 6 - pattern 6
	db	17,15,11,14,4,21,15,20
	; position 7 - pattern 7
	db	16,13,19,3,6,7,12
	; position 20 - pattern 20
	db	17,5,18,12,6,4,10
	; position 21 - pattern 21
	db	9,1,8,0,6,2,12
	; position 22 - pattern 22
	db	17,15,11,14,4,21,15,20
	; position 23 - pattern 23
	db	16,13,19,3,6,7,12
	db	-1

	; 04:  Track 08 / 08|
	; position 8 - pattern 8
	db	1,3,0,1
	; position 9 - pattern 9
	db	1,3,0,1
	; position 10 - pattern 10
	db	1,3,0,1
	; position 11 - pattern 11
	db	1,3,0,1
	; position 12 - pattern 12
	db	1,3,0,1
	; position 13 - pattern 13
	db	1,3,0,1
	; position 14 - pattern 14
	db	1,3,0,1
	; position 15 - pattern 15
	db	1,3,0,1
	; position 24 - pattern 24
	db	1,3,0,1
	; position 25 - pattern 25
	db	1,3,0,1
	; position 26 - pattern 26
	db	1,3,0,1
	; position 27 - pattern 27
	db	1,3,0,1
	; position 28 - pattern 28
	db	1,3,0,1
	; position 29 - pattern 29
	db	1,3,0,1
	; position 30 - pattern 30
	db	1,3,0,1
	; position 31 - pattern 31
	db	1,3,0,1
	; position 32 - pattern 32
	db	2
	db	-1

	; 05:  Track 08 / 09|
	; position 8 - pattern 8
	db	0,1,2,3,1,2,3
	; position 9 - pattern 9
	db	0,1,2,3,1,2,3
	; position 10 - pattern 10
	db	0,1,2,3,1,2,3
	; position 11 - pattern 11
	db	0,1,2,3,1,2,3
	; position 12 - pattern 12
	db	0,1,2,3,1,2,3
	; position 13 - pattern 13
	db	0,1,2,3,1,2,3
	; position 14 - pattern 14
	db	0,1,2,3,1,2,3
	; position 15 - pattern 15
	db	0,1,2,3,1,2,3
	; position 24 - pattern 24
	db	0,1,2,3,1,2,3
	; position 25 - pattern 25
	db	0,1,2,3,1,2,3
	; position 26 - pattern 26
	db	0,1,2,3,1,2,3
	; position 27 - pattern 27
	db	0,1,2,3,1,2,3
	; position 28 - pattern 28
	db	0,1,2,3,1,2,3
	; position 29 - pattern 29
	db	0,1,2,3,1,2,3
	; position 30 - pattern 30
	db	0,1,2,3,1,2,3
	; position 31 - pattern 31
	db	0,1,2,3
	db	-1

	; 06:  Track 08 / 0A|
	; position 8 - pattern 8
	db	2,4,0,2,3
	; position 9 - pattern 9
	db	2,4,0,2,3
	; position 10 - pattern 10
	db	2,4,0,2,3
	; position 11 - pattern 11
	db	2,4,0,2,3
	; position 12 - pattern 12
	db	2,4,0,2,3
	; position 13 - pattern 13
	db	2,4,0,2,3
	; position 14 - pattern 14
	db	2,4,0,2,3
	; position 15 - pattern 15
	db	2,4,0,2,3
	; position 24 - pattern 24
	db	2,4,0,2,3
	; position 25 - pattern 25
	db	2,4,0,2,3
	; position 26 - pattern 26
	db	2,4,0,2,3
	; position 27 - pattern 27
	db	2,4,0,2,3
	; position 28 - pattern 28
	db	2,4,0,2,3
	; position 29 - pattern 29
	db	2,4,0,2,3
	; position 30 - pattern 30
	db	2,4,0,2,3
	; position 31 - pattern 31
	db	2,4,1
	db	-1

	; 07:  Track 08 / 10|
	; position 31 - pattern 31
	db	3,2,1,0
	db	-1

	; 08:  Track 09 / 06|
	; position 8 - pattern 8
	db	1,4
	; position 9 - pattern 9
	db	0,6
	; position 10 - pattern 10
	db	7,8
	; position 11 - pattern 11
	db	7,3
	; position 12 - pattern 12
	db	1,4
	; position 13 - pattern 13
	db	0,6
	; position 14 - pattern 14
	db	7,8
	; position 15 - pattern 15
	db	7,9
	; position 24 - pattern 24
	db	1,4
	; position 25 - pattern 25
	db	0,6
	; position 26 - pattern 26
	db	7,8
	; position 27 - pattern 27
	db	7,3
	; position 28 - pattern 28
	db	1,4
	; position 29 - pattern 29
	db	0,6
	; position 30 - pattern 30
	db	7,8
	; position 31 - pattern 31
	db	7,9
	; position 32 - pattern 32
	db	5,2
	db	-1

	; 09:  Track 09 / 11|
	; position 16 - pattern 16
	db	0
	db	-1

	; 10:  Track 09 / 06|
	; position 8 - pattern 8
	db	1,4
	; position 9 - pattern 9
	db	0,4
	; position 10 - pattern 10
	db	5,7
	; position 11 - pattern 11
	db	5,3
	; position 12 - pattern 12
	db	1,4
	; position 13 - pattern 13
	db	0,4
	; position 14 - pattern 14
	db	5,7
	; position 15 - pattern 15
	db	5,8
	; position 24 - pattern 24
	db	1,4
	; position 25 - pattern 25
	db	0,4
	; position 26 - pattern 26
	db	5,7
	; position 27 - pattern 27
	db	5,3
	; position 28 - pattern 28
	db	1,4
	; position 29 - pattern 29
	db	0,4
	; position 30 - pattern 30
	db	5,7
	; position 31 - pattern 31
	db	5,8
	; position 32 - pattern 32
	db	6,2
	db	-1

	; 11:  Track 09 / 06|
	; position 8 - pattern 8
	db	1,4
	; position 9 - pattern 9
	db	0,6
	; position 10 - pattern 10
	db	7,8
	; position 11 - pattern 11
	db	7,3
	; position 12 - pattern 12
	db	1,4
	; position 13 - pattern 13
	db	0,6
	; position 14 - pattern 14
	db	7,8
	; position 15 - pattern 15
	db	7,9
	; position 24 - pattern 24
	db	1,4
	; position 25 - pattern 25
	db	0,6
	; position 26 - pattern 26
	db	7,8
	; position 27 - pattern 27
	db	7,3
	; position 28 - pattern 28
	db	1,4
	; position 29 - pattern 29
	db	0,6
	; position 30 - pattern 30
	db	7,8
	; position 31 - pattern 31
	db	7,9
	; position 32 - pattern 32
	db	5,2
	db	-1

	; 12:  Track 10 / 07|
	; position 8 - pattern 8
	db	1,2
	; position 10 - pattern 10
	db	1,2
	; position 12 - pattern 12
	db	1,2
	; position 14 - pattern 14
	db	1,2
	; position 15 - pattern 15
	db	0,0,0,3,3,3
	; position 16 - pattern 16
	db	1,2
	; position 24 - pattern 24
	db	1,2
	; position 26 - pattern 26
	db	1,2
	; position 28 - pattern 28
	db	1,2
	; position 30 - pattern 30
	db	1,2
	; position 32 - pattern 32
	db	1,2
	db	-1

	; 13:  Track 10 / 07|
	; position 8 - pattern 8
	db	0,1
	; position 10 - pattern 10
	db	0,1
	; position 12 - pattern 12
	db	0,1
	; position 14 - pattern 14
	db	0,1
	; position 16 - pattern 16
	db	0,1
	; position 24 - pattern 24
	db	0,1
	; position 26 - pattern 26
	db	0,1
	; position 28 - pattern 28
	db	0,1
	; position 30 - pattern 30
	db	0,1
	; position 32 - pattern 32
	db	0,1
	db	-1

	; 14:  Track 11 / 0B|
	; position 12 - pattern 12
	db	23,16,37,31,0,1,6,7,5,3,19,26,43,40
	; position 13 - pattern 13
	db	35,2,4,13,16,32,44,46,41,51,47,23,32
	; position 14 - pattern 14
	db	45,29,34,38,32,22,27,30,24,42,10,11,18,13,50,48,42
	; position 15 - pattern 15
	db	28,33,36,20,44,39,35,17,28,25,21,15,14,12,8
	; position 28 - pattern 28
	db	23,16,37,31,0,1,6,7,5,3,19,26,43,40
	; position 29 - pattern 29
	db	35,2,4,13,16,32,44,46,41,51,47,23,32
	; position 30 - pattern 30
	db	45,29,34,38,32,22,27,30,24,42,10,11,18,13,50,48,42
	; position 31 - pattern 31
	db	28,33,36,20,44,39,35,17,28,25,21,15,14,12,9,27,38
	; position 32 - pattern 32
	db	49
	db	-1

	; 15:  Track 01 / 00|
	; position 2 - pattern 2
	db	6
	; position 3 - pattern 3
	db	5,3,7
	; position 4 - pattern 4
	db	0
	; position 6 - pattern 6
	db	6
	; position 7 - pattern 7
	db	5,3,7
	; position 8 - pattern 8
	db	0
	; position 10 - pattern 10
	db	6
	; position 11 - pattern 11
	db	5,3,7
	; position 12 - pattern 12
	db	0
	; position 14 - pattern 14
	db	6
	; position 15 - pattern 15
	db	5,4
	; position 18 - pattern 18
	db	6
	; position 19 - pattern 19
	db	5,3,7
	; position 20 - pattern 20
	db	0
	; position 22 - pattern 22
	db	6
	; position 23 - pattern 23
	db	5,3,7
	; position 24 - pattern 24
	db	0
	; position 26 - pattern 26
	db	6
	; position 27 - pattern 27
	db	5,3,7
	; position 28 - pattern 28
	db	1
	; position 30 - pattern 30
	db	6
	; position 31 - pattern 31
	db	5,4
	; position 32 - pattern 32
	db	2
	db	-1

	; 16:  Track 01 / 09|
	; position 19 - pattern 19
	db	5,6,5,6,5,9,4,3,11,10,7
	; position 20 - pattern 20
	db	2,1,2,1,2,1,2,1,2,1,0,2,1,2,1,2,1,2,1,2,1,2
	; position 21 - pattern 21
	db	2,1,2,1,2,1,2,1,2,1,0,2,1,2,1,2,1,2,1,2,1,7
	; position 22 - pattern 22
	db	9,8,9,8,9,8,9,8,9,8,7,9,8,9,8,9,8,9,8,9,8,9
	; position 23 - pattern 23
	db	6,5,6,5,6,5,9,4,3,11,10,7
	; position 24 - pattern 24
	db	2,1,2,1,2,1,2,1,2,1,0,2,1,2,1,2,1,2,1,2,1,2
	; position 25 - pattern 25
	db	2,1,2,1,2,1,0,2,1,2,1,2,1,7
	; position 26 - pattern 26
	db	9,8,9,8,9,8,9,8,9,8,7,9,8,9,8,9,8,9,8,9,8,9
	; position 27 - pattern 27
	db	6,5,6,5,6,5,9,4,3,11,10,7
	; position 28 - pattern 28
	db	2,1,2,1,2,1,2,1,2,1,0,2,1,2,1,2,1,2,1,2,1,2
	; position 29 - pattern 29
	db	2,1,2,1,2,1,0,2,1,2,1,2,1,7
	; position 30 - pattern 30
	db	9,8,9,8,9,8,9,8,9,8,7,9,8,9,8,9,8,9,8,9,8,9
	; position 31 - pattern 31
	db	6,5,6,5,6,5,9,4,3
	db	-1

	; 17:  Track 01 / 0A|
	; position 19 - pattern 19
	db	5,4,5,4,3,2,3,6,7,6
	; position 23 - pattern 23
	db	5,4,5,4,3,2,3,6,7,6
	; position 25 - pattern 25
	db	1,0,1,0,1,0,1,0
	; position 27 - pattern 27
	db	5,4,5,4,3,2,3,6,7,6
	; position 29 - pattern 29
	db	1,0,1,0,1,0,1,0
	; position 31 - pattern 31
	db	5,4,5,4,3
	db	-1

	; 18:  Track 02 / 01|
	; position 0 - pattern 0
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 1 - pattern 1
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 2 - pattern 2
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 3 - pattern 3
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 4 - pattern 4
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 5 - pattern 5
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 6 - pattern 6
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 7 - pattern 7
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 8 - pattern 8
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 9 - pattern 9
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 10 - pattern 10
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 11 - pattern 11
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 12 - pattern 12
	db	0,0,0,0,0,0,0,0,0,0,0,0
	; position 13 - pattern 13
	db	0,0,0,0,0,0,0,0,0,0,0,0
	; position 14 - pattern 14
	db	0,0,0,0,0,0,0,0,0,0,0,0
	; position 15 - pattern 15
	db	0,0,0,0,0,0,0,0,0,0,0,0
	; position 16 - pattern 16
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 17 - pattern 17
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 18 - pattern 18
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 19 - pattern 19
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 20 - pattern 20
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 21 - pattern 21
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 22 - pattern 22
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 23 - pattern 23
	db	0,0,0,1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1,0
	; position 24 - pattern 24
	db	0,0,0,0,0,0,0,0,0,0
	; position 25 - pattern 25
	db	0,0,0,0,0,0,0,0,0,0
	; position 26 - pattern 26
	db	0,0,0,0,0,0,0,0,0,0
	; position 27 - pattern 27
	db	0,0,0,0,0,0,0,0,0,0
	; position 28 - pattern 28
	db	0,0,0,0,0,0,0,0,0,0
	; position 29 - pattern 29
	db	0,0,0,0,0,0,0,0,0,0
	; position 30 - pattern 30
	db	0,0,0,0,0,0,0,0,0,0
	; position 31 - pattern 31
	db	0,0,0,0,0,0,0,0,0,0
	; position 32 - pattern 32
	db	0
	db	-1

	; 19:  Track 04 / 02|
	; position 0 - pattern 0
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 1 - pattern 1
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 2 - pattern 2
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 3 - pattern 3
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 4 - pattern 4
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 5 - pattern 5
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 6 - pattern 6
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 7 - pattern 7
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 8 - pattern 8
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 9 - pattern 9
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 10 - pattern 10
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 11 - pattern 11
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 12 - pattern 12
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 13 - pattern 13
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 14 - pattern 14
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 15 - pattern 15
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 16 - pattern 16
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 17 - pattern 17
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 18 - pattern 18
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 19 - pattern 19
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 20 - pattern 20
	db	13,19,22,21,10,15,20,8,18,10,19,19,9,15,13,19,22,21,10,15,20,8,18,10,19,19,9,15
	; position 21 - pattern 21
	db	13,19,22,21,10,15,20,8,18,10,19,19,9,15,13,19,22,21,10,15,20,8,18,10,19,19,9,15
	; position 22 - pattern 22
	db	13,19,22,21,10,15,20,8,18,10,19,19,9,15,13,19,22,21,10,15,20,8,18,10,19,19,9,15
	; position 23 - pattern 23
	db	13,19,22,21,10,15,20,8,18,10,19,19,9,10,15,12,7,21,15,10,20,8,18,10,19,19,9,15
	; position 24 - pattern 24
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 25 - pattern 25
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 26 - pattern 26
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 27 - pattern 27
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 28 - pattern 28
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 29 - pattern 29
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 30 - pattern 30
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,6,5,12,17,16,3,6,14,1,11,3,12,12,2,6
	; position 31 - pattern 31
	db	5,12,17,16,3,6,14,1,11,3,12,12,2,3,6,4,0,16,6,3,14,1,11,3,12,12,2,6
	; position 32 - pattern 32
	db	5
	db	-1

	; 20:  Track 04 / 02|
	; position 0 - pattern 0
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 1 - pattern 1
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 2 - pattern 2
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 3 - pattern 3
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 4 - pattern 4
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 5 - pattern 5
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 6 - pattern 6
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 7 - pattern 7
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 8 - pattern 8
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 9 - pattern 9
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 10 - pattern 10
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 11 - pattern 11
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 12 - pattern 12
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 13 - pattern 13
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 14 - pattern 14
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 15 - pattern 15
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 16 - pattern 16
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 17 - pattern 17
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 18 - pattern 18
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 19 - pattern 19
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 20 - pattern 20
	db	9,14,18,17,8,11,16,5,13,8,14,14,6,11,9,14,18,17,8,11,15,5,13,8,14,14,5
	; position 21 - pattern 21
	db	9,14,18,17,8,11,16,5,13,8,14,14,6,11,9,14,18,17,8,11,15,5,13,8,14,14,5
	; position 22 - pattern 22
	db	9,14,18,17,8,11,16,5,13,8,14,14,6,11,9,14,18,17,8,11,15,5,13,8,14,14,5
	; position 23 - pattern 23
	db	9,14,18,17,8,11,16,5,13,8,14,14,6,11,9,14,18,17,8,11,15,5,13,8,14,14,5
	; position 24 - pattern 24
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 25 - pattern 25
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 26 - pattern 26
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 27 - pattern 27
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 28 - pattern 28
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 29 - pattern 29
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 30 - pattern 30
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,0
	; position 31 - pattern 31
	db	3,8,12,11,2,4,10,0,7,2,8,8,1,4,3,8,12,11,2,4,9,0,7,2,8,8,1
	db	-1

	; 21:  Track 05 / 03|
	; position 0 - pattern 0
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 1 - pattern 1
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 2 - pattern 2
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 3 - pattern 3
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 4 - pattern 4
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 5 - pattern 5
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 6 - pattern 6
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 7 - pattern 7
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 8 - pattern 8
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 9 - pattern 9
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 10 - pattern 10
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 11 - pattern 11
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 16 - pattern 16
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 17 - pattern 17
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 18 - pattern 18
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 19 - pattern 19
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 20 - pattern 20
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 21 - pattern 21
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 22 - pattern 22
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 23 - pattern 23
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 24 - pattern 24
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 25 - pattern 25
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 26 - pattern 26
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 27 - pattern 27
	db	6,3,4,2,3,5,1,3,4,0,2,1
	db	-1

	; 22:  Track 05 / 04|
	; position 0 - pattern 0
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 1 - pattern 1
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 2 - pattern 2
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 3 - pattern 3
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 4 - pattern 4
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 5 - pattern 5
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 6 - pattern 6
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 7 - pattern 7
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 8 - pattern 8
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 9 - pattern 9
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 10 - pattern 10
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 11 - pattern 11
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 16 - pattern 16
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 17 - pattern 17
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 18 - pattern 18
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 19 - pattern 19
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 20 - pattern 20
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 21 - pattern 21
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 22 - pattern 22
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 23 - pattern 23
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 24 - pattern 24
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 25 - pattern 25
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 26 - pattern 26
	db	6,3,4,2,3,5,1,3,4,0,2,1
	; position 27 - pattern 27
	db	6,3,4,2,3,5,1,3,4,0,2,1
	db	-1

	; 23:  Track 06 / 0E|
	; position 17 - pattern 17
	db	0
	; position 18 - pattern 18
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 19 - pattern 19
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 20 - pattern 20
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 21 - pattern 21
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 22 - pattern 22
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 23 - pattern 23
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 24 - pattern 24
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 25 - pattern 25
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 26 - pattern 26
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 27 - pattern 27
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 28 - pattern 28
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 29 - pattern 29
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 30 - pattern 30
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 31 - pattern 31
	db	1,1,1,0,1,1,1,1,0,0,1
	; position 32 - pattern 32
	db	1
	db	-1

	; 24:  Track 07 / 0F|
	; position 18 - pattern 18
	db	0,0,0,0,0,0,0
	; position 19 - pattern 19
	db	0,0,0,0,0,0,0
	; position 20 - pattern 20
	db	0,0,0,0,0,0,0
	; position 21 - pattern 21
	db	0,0,0,0,0,0,0
	; position 22 - pattern 22
	db	0,0,0,0,0,0,0
	; position 23 - pattern 23
	db	0,0,0,0,0,0,0
	; position 24 - pattern 24
	db	0,0,0,0,0,0,0
	; position 25 - pattern 25
	db	0,0,0,0,0,0,0
	; position 26 - pattern 26
	db	0,0,0,0,0,0,0
	; position 27 - pattern 27
	db	0,0,0,0,0,0,0
	; position 28 - pattern 28
	db	0,0,0,0,0,0,0
	; position 29 - pattern 29
	db	0,0,0,0,0,0,0
	; position 30 - pattern 30
	db	0,0,0,0,0,0,0
	; position 31 - pattern 31
	db	0,0,0,0,0,0,0,0,0
	db	-1

