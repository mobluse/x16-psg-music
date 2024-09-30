' TRACKER INSPIRED BY LINUS AKESSON'S FOR C64 EDITOR IN BASIC&MC.
' CODE IS PURE QBASIC 1.1. ONE CAN BREAK EARLY USING CTRL+SCRLK.
' THIS CAN BE RUN ON QBJS.ORG IF YOU REPLACE SCREEN & PLAY.
DECLARE SUB PLAY2 (s AS STRING)
DECLARE FUNCTION SCREEN2% (r AS INTEGER, c AS INTEGER)
DECLARE SUB show ()
DIM nS AS STRING, cS AS STRING
DIM n0Z AS INTEGER, iZ AS INTEGER, nZ AS INTEGER, cZ AS INTEGER
show
n0Z = ASC("@")
DO
FOR iZ = 8 TO 79
nZ = SCREEN(6, iZ): cZ = SCREEN(3, iZ)
nS = CHR$(nZ): cS = CHR$(cZ)
LOCATE 3, iZ: COLOR 15: PRINT cS;
IF "A" <= nS AND nS <= "Z" THEN PLAY "N" + STR$(nZ - n0Z) ELSE PLAY "N0"
LOCATE 3, iZ: COLOR 7: PRINT cS;
NEXT
LOOP

SUB PLAY2 (s AS STRING)
  PLAY s
END SUB

FUNCTION SCREEN2% (r AS INTEGER, c AS INTEGER)
  SCREEN2 = 65'SCREEN(r, c)
END FUNCTION

SUB show
COLOR 7: CLS : PRINT "QTRAKR": PRINT : ' ONLY ONE CHANNEL
PRINT "       +---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---+---"
PRINT "       :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :"
PRINT "       :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :   :"
PRINT "       AEFH:AEFH AEFH E:A E:C EECA AE H:HF EFH E A C  A    :   :   :   :QSU:ZX"
PRINT "         B D   G I K   N P   S U W   Z"
PRINT "        A C E F H J L M O Q R T V X Y"
END SUB
