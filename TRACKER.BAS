10 N0=ASC("@"):' TRACKER INSPIRED BY LINUS AKESSON'S FOR C64 EDITOR IN BASIC&MC.
20 FOR I=8 TO 79:' CODE IS PURE GWBASIC. ONE CAN BREAK EARLY USING CTRL+SCRLK.
30 N=SCREEN(3,I):C=SCREEN(2,I)
40 N$=CHR$(N):C$=CHR$(C):LOCATE 2,I:COLOR 15:PRINT C$;
50 IF N$<>" " AND N$<>":" THEN PLAY "N"+STR$(N-N0) ELSE PLAY "N0"
60 LOCATE 2,I:COLOR 7:PRINT C$;
70 NEXT
80 CLS:PRINT "LIST 90-":LIST 90-:' RUN 80. THIS TRACKER ONLY HAS ONE TRACK.
90 REM +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---
91 REM AEFH:AEFH AEFH E:A E:C EECA AE H:HF EFH E A :C  A   :   :   :   :QSU:ZX
92 REM :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :
93 REM :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :
98 REM   B D   G I K   N P   S U W   Z
99 REM  A C E F H J L M O Q R T V X Y
