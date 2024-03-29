0 REM DECPS (C) 2022 MIKAEL BONNIER, LUND, SWEDEN; LICENSE: GPLV3
1 SP=.:SD=.:SV=.:GOSUB 400:S0=OS:F2=-1E3:F3=F2:GOTO 1000
2 COLOR 5:PRINT 100*SD,SP;:GET K$:IF K$<>"" THEN IF(ASC(K$) AND $1F)=17 GOTO 8
3 OS=S0+4:GOSUB 4:SP=SP+F2:OS=S0+8:GOSUB 4:SP=SP+F3:GOSUB 4:GOSUB 440:?:RETURN
4 GOSUB 410:PRINT TAB(1-(SP>10)*(SP-30))
5 COLOR 2:PRINT CHR$(115);:COLOR 1:RETURN
6 PRINT "PITCH (0-127, 60=C4), DURATION (0.1 S), AND VOLUME (0-15): SP,SD,SV";
7 INPUT SP,SD,SV
8 FOR I=1 TO 15:OS=S0+4*I:GOSUB 444:NEXT:GOTO 1200
9 END
400 REM SOUND/BEEP/PLAY TONE FOR BASICODE-3 AND -3C FOR COMMANDER X16
402 REM SP=60:C4, 69:A4, 72:C5. SP RANGE 0-127.
404 REM SD IS THE DURATION IN TENTH OF A SECOND.
406 REM SV=15:MAX VOLUME, 7:NORMAL VOL, 0:SILENCE.
407 OS=$F9C0:REM PSG FIRST CHANNEL/VOICE
408 GOSUB 410:GOSUB 440:RETURN
410 REM OF=440*2^((SP-69)/12)
411 REM PRINT SP,OF,
412 REM OW=OF/(48828.125/2^17)
414 REM PRINT OW,
416 OW=9.0112E-03*2^((SP-69)/12+17)
417 REM PRINT OW
418 OH=INT(OW/256)
420 REM OL=INT(OW-256*OH)
422 VPOKE 1,OS,OW-256*OH
424 VPOKE 1,OS+1,OH
426 VPOKE 1,OS+3,63
428 IF SP<=10 OR SV=. THEN OV=.:GOTO 432
430 OV=$C0+4*SV+3
432 REM PRINT OV
434 VPOKE 1,OS+2,OV
436 RETURN
440 OT=TI:OD=6*SD
442 IF TI-OT<OD GOTO 442
444 VPOKE 1,OS+2,.
446 RETURN
1000 REM DECPS DIGITAL EQUIPMENT CORPORATION PLAY SOUND VT520-VT525
1010 COLOR 10:PRINT "Q TO QUIT"
1020 READ T$:COLOR 7:PRINT T$
1024 COLOR 5:PRINT "DURA.(MS)","MIDI"
1030 READ SV,SD
1040 SD=(10*SD)/32:SV=SV+12:REM TODO:FORMULA FOR SV MAY NEED TO CHANGE
1060 READ SP
1070 IF SP=1E4 GOTO 1030
1075 IF SP=2E4 GOTO 8
1080 SP=SP+71:IF SP=71 THEN SP=0
1090 GOSUB 2
1100 GOTO 1060
1200 REM MENU
1202 RESTORE
1204 COLOR 1:PRINT
1206 FOR I=1 TO 10:REM CHANGE UPPER LIMIT TO NUMBER OF SONGS
1208 READ T$:PRINT STR$(I)". "T$:PRINT
1210 READ SV
1220 IF SV<>2E4 GOTO 1210
1230 NEXT
1234 PRINT " 0. EXIT TO CHORDS MENU":PRINT
1240 INPUT "DECPS SONG";SO
1250 RESTORE
1254 IF SO=0 GOTO 1400
1256 IF SO=1 GOTO 1000
1260 FOR I=1 TO SO-1
1270 READ T$
1280 READ SV
1290 IF SV<>2E4 GOTO 1280
1300 NEXT
1310 GOTO 1000
1400 REM CHOORDS MENU
1404 PRINT
1410 PRINT " 1. MONOPHONIC":PRINT
1420 PRINT " 2. MINOR CHORDS":PRINT
1430 PRINT " 3. MAJOR CHORDS":PRINT
1440 PRINT " 0. EXIT":PRINT
1450 INPUT "1, 2, 3, OR 0";CD
1454 IF CD=0 THEN END
1460 IF CD=1 THEN F2=-1E3:F3=F2
1470 IF CD=2 THEN F2=3:F3=4
1480 IF CD=3 THEN F2=4:F3=3
1490 GOTO 1200
1999 REM GPL LICENSE DOES NOT APPLY FOR THE SONGS. SONGS FROM J4JAMES@GITHUB
2000 DATA "MS PAC-MAN THEME"
2010 DATA 3,2,1,3,5,1E4,3,8,6,10,8,11,1E4,3,4,10,11,13,10,1E4,3,8,8,11,1E4
2020 DATA 3,4,10,11,13,10,11,13,15,17,1E4,3,8,18,17,18,2E4
2030 DATA "HALL OF THE MOUNTAIN KING"
2040 DATA 3,8,1,3,4,6,8,4,1E4,3,16,8,1E4,3,8,7,3,1E4,3,16,7,1E4,3,8,6,2,1E4
2050 DATA 3,16,6,1E4,3,8,1,3,4,6,8,4,8,13,11,8,4,8,1E4,3,32,11,1E4,3,8,8,10
2060 DATA 12,13,15,12,1E4,3,16,15,1E4,3,8,16,12,1E4,3,16,16,1E4,3,8,15,12
2062 DATA 1E4
2070 DATA 3,16,15,1E4,3,8,8,10,12,13,15,12,1E4,3,16,15,1E4,3,8,16,12,1E4
2072 DATA 3,16,16,1E4
2080 DATA 3,32,15,1E4,3,8,13,15,16,18,20,16,1E4,3,16,20,1E4,3,8,19,15
2090 DATA 1E4,3,16,19,1E4,3,8,18,14,1E4,3,16,18,1E4,3,8,13,15,16,18,20,16
2100 DATA 20,25,23,20,16,20,1E4,3,32,23,2E4
2110 DATA "JINGLE BELLS"
2120 DATA 3,8,12,12,1E4,3,16,12,1E4,3,8,12,12,1E4,3,16,12,1E4,3,8,12,15,1E4
2130 DATA 3,12,8,1E4,3,4,10,1E4,3,24,12,1E4,3,8,0,13,13,1E4,3,12,13,1E4
2140 DATA 3,4,13,1E4,3,8,13,12,12,1E4,3,4,12,12,1E4,3,8,15,15,13,10,1E4
2150 DATA 3,24,8,1E4,3,8,0,2E4
2160 DATA "HAPPY BIRTHDAY"
2170 DATA 3,10,8,1E4,3,5,8,1E4,3,15,10,8,13,1E4,3,30,12,1E4,3,10,8,1E4,3,5
2180 DATA 8,1E4,3,15,10,8,15,1E4,3,30,13,1E4,3,10,8,1E4,3,5,8,1E4,3,15,20
2190 DATA 17,13,12,1E4,3,30,10,1E4,3,10,18,1E4,3,5,18,1E4,3,15,17,13,15,1E4
2200 DATA 3,30,13,2E4
2210 DATA "HARRY POTTER THEME"
2220 DATA 3,12,3,1E4,3,18,8,1E4,3,6,11,1E4,3,12,10,1E4,3,24,8,1E4,3,12,15
2230 DATA 1E4,3,36,13,10,1E4,3,18,8,1E4,3,6,11,1E4,3,12,10,1E4,3,24,7,1E4
2240 DATA 3,12,9,1E4,3,60,3,1E4,3,12,3,1E4,3,18,8,1E4,3,6,11,1E4,3,12,10
2250 DATA 1E4,3,24,8,1E4,3,12,15,1E4,3,24,18,1E4,3,12,17,1E4,3,24,16,1E4
2260 DATA 3,12,12,1E4,3,18,16,1E4,3,6,15,1E4,3,12,14,1E4,3,24,2,1E4,3,12
2270 DATA 11,1E4,3,60,8,2E4
2280 DATA "INDIANA JONES THEME"
2290 DATA 3,9,5,1E4,3,3,6,1E4,3,6,8,1E4,3,30,13,1E4,3,9,3,1E4,3,3,5,1E4,3
2300 DATA 36,6,1E4,3,9,8,1E4,3,3,10,1E4,3,6,12,1E4,3,30,18,1E4,3,9,10,1E4
2310 DATA 3,3,12,1E4,3,12,13,15,17,1E4,3,9,5,1E4,3,3,6,1E4,3,6,8,1E4,3,30
2320 DATA 13,1E4,3,9,15,1E4,3,3,17,1E4,3,36,18,1E4,3,9,8,1E4,3,3,8,1E4,3
2330 DATA 12,17,1E4,3,9,15,1E4,3,3,8,1E4,3,12,17,1E4,3,9,15,1E4,3,3,8,1E4
2340 DATA 3,12,17,1E4,3,9,15,1E4,3,3,8,1E4,3,12,18,1E4,3,9,17,1E4,3,3,15
2350 DATA 1E4,3,48,13,2E4
2360 DATA "STAR WARS: IMPERIAL MARCH"
2370 DATA 3,20,7,7,7,1E4,3,15,3,1E4,3,5,10,1E4,3,20,7,1E4,3,15,3,1E4,3,5
2380 DATA 10,1E4,3,40,7,1E4,3,20,14,14,14,1E4,3,15,15,1E4,3,5,10,1E4,3,20
2390 DATA 6,1E4,3,15,3,1E4,3,5,10,1E4,3,40,7,1E4,3,20,19,7,19,1E4,3,10,18
2400 DATA 17,1E4,3,5,16,15,1E4,3,10,16,0,8,1E4,3,20,13,1E4,3,10,12,11,1E4
2410 DATA 3,5,10,9,1E4,3,10,10,0,3,1E4,3,20,6,1E4,3,15,3,1E4,3,5,10,1E4,3
2420 DATA 20,7,1E4,3,15,3,1E4,3,5,10,1E4,3,40,7,2E4
2430 DATA "CAVALRY CHARGE (BUGLE CALL)"
2440 DATA 3,6,1,1E4,3,3,0,1,1E4,3,6,1,1E4,3,3,0,1,1E4,3,6,1,1E4,3,3,0,1,1E4
2450 DATA 3,6,1,1E4,3,3,0,1,1E4,3,6,1,1E4,3,3,0,1,1E4,3,6,1,1E4,3,3,0,1,1E4
2460 DATA 3,6,8,1E4,3,3,0,5,1E4,3,6,8,1E4,3,3,0,5,1E4,3,6,8,1E4,3,3,0,5,1E4
2470 DATA 3,6,1,1E4,3,3,0,1,1E4,3,6,1,1E4,3,3,0,1,1E4,3,6,1,1E4,3,3,0,1,1E4
2480 DATA 3,6,8,1E4,3,3,0,5,1E4,3,6,8,1E4,3,3,0,5,1E4,3,6,8,1E4,3,3,0,5,1E4
2490 DATA 3,36,1,2E4
2500 DATA "REVEILLE (BUGLE CALL)"
2510 DATA 3,8,1,6,1E4,3,4,10,6,1E4,3,8,1,10,6,1E4,3,4,10,6,1E4,3,8,1,10,6
2520 DATA 1E4,3,4,10,6,1E4,3,8,1,6,1E4,3,16,10,1E4,3,8,6,1,6,1E4,3,4,10,6
2530 DATA 1E4,3,8,1,10,6,1E4,3,4,10,6,1E4,3,8,1,10,6,1E4,3,4,10,6,1E4,3,8
2540 DATA 1,1,1E4,3,24,6,1E4,3,8,10,10,10,10,10,1E4,3,16,13,1E4,3,8,10,6
2550 DATA 10,6,10,6,1E4,3,16,10,1E4,3,8,6,10,10,10,10,10,1E4,3,16,13,1E4,3
2560 DATA 8,10,6,10,6,1,1,1E4,3,24,6,2E4
2570 DATA "GOD SAVE THE QUEEN"
2580 DATA 3,18,6,6,8,1E4,3,27,5,1E4,3,9,6,1E4,3,18,8,10,10,11,1E4,3,27,10
2590 DATA 1E4,3,9,8,1E4,3,18,6,8,6,5,1E4,3,54,6,1E4,3,18,13,13,13,1E4,3,27
2600 DATA 13,1E4,3,9,11,1E4,3,18,10,11,11,11,1E4,3,27,11,1E4,3,9,10,1E4,3
2610 DATA 18,8,10,1E4,3,9,11,10,8,6,1E4,3,27,10,1E4,3,9,11,1E4,3,18,13,1E4
2620 DATA 3,9,15,11,1E4,3,18,10,8,1E4,3,54,6,2E4
