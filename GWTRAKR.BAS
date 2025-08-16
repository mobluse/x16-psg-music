10 GOTO 90 'TRACKER INSPIRED BY LTFKRYO'S FOR C64 EDITOR IN BASIC&MC.
20 N0=ASC("@") 'CODE IS PURE GWBASIC. BREAK EARLY USING CTRL+SCRLK!
30 FOR I=8 TO 79
40 N=SCREEN(7,I):C=SCREEN(4,I)
50 N$=CHR$(N):C$=CHR$(C):LOCATE 4,I:COLOR 15:PRINT C$;
60 IF N$<>" " AND N$<>":" THEN PLAY "N"+STR$(N-N0) ELSE PLAY "N0"
70 LOCATE 4,I:COLOR 7:PRINT C$;
80 NEXT:GOTO 30
90 COLOR 7:CLS:PRINT "RUN 20":PRINT TAB(8)"GWTRAKR":LIST 91- 'ONLY ONE CHANNEL
91 REM
92 REM +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---
93 REM :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :
94 REM :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :
95 REM AEFH:AEFH AEFH E:A E:C EECA AE H:HF EFH E A C  A:   :   :   :   :QSU:ZX
96 REM
97 REM   B D   G I K   N P   S U W   Z
98 REM  A C E F H J L M O Q R T V X Y
