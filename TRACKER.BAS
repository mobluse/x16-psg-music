10 N0=ASC("@"):' TRACKER INSPIRED BY LINUS AKESSON'S FOR C64 EDITOR IN BASIC&MC.
20 FOR I=8 TO 79:' CODE IS PURE GWBASIC. ONE CAN BREAK EARLY USING CTRL+SCRLK.
30 N=SCREEN(6,I):C=SCREEN(3,I)
40 N$=CHR$(N):C$=CHR$(C):LOCATE 3,I:COLOR 15:PRINT C$;
50 IF N$<>" " AND N$<>":" THEN PLAY "N"+STR$(N-N0) ELSE PLAY "N0"
60 LOCATE 3,I:COLOR 7:PRINT C$;
70 NEXT:GOTO 20
80 COLOR 7:CLS:PRINT "RUN 80":PRINT:LIST 90-:' ONLY ONE CHANNEL
90 REM +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---
91 REM :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :
92 REM :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :
93 REM AEFH:AEFH AEFH E:A E:C EECA AE H:HF EFH E A C  A    :   :   :   :QSU:ZX
98 REM   B D   G I K   N P   S U W   Z
99 REM  A C E F H J L M O Q R T V X Y
