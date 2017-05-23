REM: Dope Wars: Resurrection
REM: This software is released under the BSD license, see LICENSE for details
$RESIZE:SMOOTH
DECLARE SUB DRAWBACKGROUND ()
DECLARE SUB LEVEL0 ()
DECLARE SUB MAPLEVEL ()
DECLARE SUB COMMANDS ()
DECLARE SUB BANK ()
DECLARE SUB DEALS ()
DECLARE SUB PEOPLE ()
DECLARE SUB BUS ()
DECLARE SUB DEAL ()
DECLARE SUB NeatFont (txt$, sx%, sy%, clr%, sty%, size%)
DIM SHARED txt AS STRING, sx%, sy%, clr%, sty%, size%
DECLARE SUB ENDING ()
DECLARE SUB GAMEOVER ()

DopeStart:
CLS
CLEAR
PRINT "Loading..."
DIM SHARED A$
DIM SHARED LEVEL
LEVEL = 0
DIM SHARED MONEY
MONEY = 5000
DIM SHARED BALANCE
DIM SHARED POT
DIM SHARED ECSTACY
DIM SHARED CRACK
DIM SHARED ACID
DIM SHARED COKE
DIM SHARED HASH
DIM SHARED HEROIN
DIM SHARED MUSHROOMS
DIM SHARED PPRICE
DIM SHARED EPRICE
DIM SHARED CPRICE
DIM SHARED APRICE
DIM SHARED COPRICE
DIM SHARED HPRICE
DIM SHARED HEPRICE
DIM SHARED MPRICE
DIM SHARED PBPRICE
DIM SHARED EBPRICE
DIM SHARED CBPRICE
DIM SHARED ABPRICE
DIM SHARED COBPRICE
DIM SHARED HBPRICE
DIM SHARED HEBPRICE
DIM SHARED MBPRICE
REDIM SHARED MAP%(0 TO 15, 0 TO 7)
DIM SHARED x%, y%
DIM SHARED PlayerX%, PlayerY%
PlayerX% = 7
PlayerY% = 6
DIM SHARED P1X, P1Y
DIM SHARED P2X, P2Y
DIM SHARED P3X, P3Y
DIM SHARED P4X, P4Y
DIM SHARED dx, DP
DIM SHARED BPROX
DIM SHARED BANKPROX
DIM SHARED PROX
DIM SHARED DPROX
DIM SHARED C
DIM SHARED QUIT
DIM SHARED R
R = 0
DIM SHARED SKNC
SKNC = 12
DIM SHARED JC
JC = 6
DIM SHARED SC
SC = 15
DIM SHARED PC
PC = 1
DIM SHARED NAME$
NAME$ = ""
DIM SHARED DEALFIN
DEALFIN = 0
DIM SHARED DIF
DIF = 1
DIM SHARED JMF
JMF = 0
DIM SHARED FMV
FMV = 1
DIM SHARED ROC
ROC = 0
DIM SHARED HR
HR = 0
DIM SHARED SLEVEL
SLEVEL = 99
DIM SHARED BLEVEL
BLEVEL = 99
DIM SHARED GOVER
DIM SHARED INTRATE
DIM SHARED JND

REM: Traversable
DIM SHARED GRASS%(210)
DIM SHARED FOREST%(210)
DIM SHARED DESERT%(210)
DIM SHARED ROAD%(210)
DIM SHARED IROAD%(210)
DIM SHARED HROAD%(210)
DIM SHARED BSTOP%(210)
REM : Nontraversable
DIM SHARED BRIDGE%(210)
DIM SHARED WATER%(210)
DIM SHARED ROCK%(210)
DIM SHARED WALL%(210)
DIM SHARED BHOUSE%(210)
DIM SHARED GHOUSE%(210)
DIM SHARED RHOUSE%(210)
DIM SHARED BANKTILE%(210)

REM: Load graphic tiles
SCREEN 13
OPEN "DATA\TILES\GRASS.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), GRASS%()
OPEN "DATA\TILES\TREES.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), FOREST%()
OPEN "DATA\TILES\SAND.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), DESERT%()
OPEN "DATA\TILES\ROAD.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), ROAD%()
OPEN "DATA\TILES\IROAD.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), IROAD%()
OPEN "DATA\TILES\HROAD.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), HROAD%()
OPEN "DATA\TILES\BRIDGE.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), BRIDGE%()
OPEN "DATA\TILES\WATER.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), WATER%()
OPEN "DATA\TILES\ROCKS.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), ROCK%()
OPEN "DATA\TILES\BHOUSE.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), BHOUSE%()
OPEN "DATA\TILES\RHOUSE.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), RHOUSE%()
OPEN "DATA\TILES\GHOUSE.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), GHOUSE%()
OPEN "DATA\TILES\BSTOP.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), BSTOP%()
OPEN "DATA\TILES\BANK.TIL" FOR INPUT AS #2
FOR y = 1 TO 20
    FOR x = 1 TO 20
        INPUT #2, Z
        PSET (x, y), Z
    NEXT x
NEXT y
CLOSE #2
GET (1, 1)-(20, 20), BANKTILE%()

CLS
PRINT "LOADING..."

' Variables used in SUBs need to be defined shared
DIM SHARED street&
DIM SHARED buswindows&
DIM SHARED busnoise&
DIM SHARED savefile$

' Load config/save files
configfile$ = "DATA\DW.INI"
savefile$ = "DATA\DW.SAV"

' Load images for splash and menus
dwlogo& = _LOADIMAGE("DATA\IMG\LOGO.PNG")
menubg& = _LOADIMAGE("DATA\IMG\SPLASH.PNG")
credits& = _LOADIMAGE("DATA\IMG\CREDITS.PNG")

' Load bus animation images
buswindows& = _LOADIMAGE("DATA\IMG\BUS.PNG")
street& = _LOADIMAGE("DATA\IMG\STREET.PNG")

' Load menu font
menufont& = _LOADFONT("DATA\IMG\HW.TTF", 30)

' Load sounds for splash and menus
theme& = _SNDOPEN("DATA\SFX\THEME.MP3", "SYNC,VOL")
reloadsfx& = _SNDOPEN("DATA\SFX\RELOAD.MP3", "SYNC,VOL")
menubeep& = _SNDOPEN("DATA\SFX\BEEP.MP3", "SYNC,VOL")
chingsfx& = _SNDOPEN("DATA\SFX\CHING.MP3", "SYNC, VOL")

' Load ambient sound tracks
ambientcity& = _SNDOPEN("DATA\SFX\CITY.MP3", "SYNC,VOL")
ambientpark& = _SNDOPEN("DATA\SFX\PARK.MP3", "SYNC,VOL")
busnoise& = _SNDOPEN("DATA\SFX\BUS.MP3", "VOL")

' Default sound volumes
_SNDVOL theme&, 0.3
_SNDVOL ambientcity&, 0.2
_SNDVOL ambientpark&, 0.2

' Load saved game now so cheats can be applied
LOADGAME

' Title screen/menus
START:
CLS
' Start playing menu music
_SNDPLAY theme&

' Create screen
SCREEN _NEWIMAGE(800, 600, 32)

' Load font/color
_FONT menufont&
COLOR &HFFFCFCFC, &H000000FF

' Show splash screen
_PUTIMAGE (0, 0), menubg&
_PUTIMAGE (0, 0), dwlogo&

' Wait for user input
SLEEP

' Clear input buffer so it doesn't mess with menus
DO: KEY$ = INKEY$: LOOP UNTIL KEY$ = ""

' Play sound and animate logo
_SNDPLAY reloadsfx&
DO
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -FRAME), dwlogo&
    _DELAY .000001

    ' Update display and increment counter
    _DISPLAY
    FRAME = FRAME + 4
LOOP UNTIL FRAME = 200

' Main menu loop
MAINMENU:
CLS
SELECTION = 0
DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Write text, depending on SELECTION variable
    DRAW_MAIN_MENU (SELECTION)

    ' Update display
    _DISPLAY

    ' Handle input
    KEY$ = INKEY$
    IF KEY$ = CHR$(0) + CHR$(72) THEN SELECTION = SELECTION - 1: _SNDPLAY menubeep& ' Up arrow
    IF KEY$ = CHR$(0) + CHR$(80) THEN SELECTION = SELECTION + 1: _SNDPLAY menubeep& ' Down arrow

    ' Handle over/under conditions
    IF SELECTION = 3 THEN SELECTION = 0
    IF SELECTION = -1 THEN SELECTION = 2

LOOP UNTIL KEY$ = CHR$(13): _SNDPLAY menubeep&

' Handle selection
IF SELECTION = 0 THEN GOTO STARTGAME
IF SELECTION = 1 THEN GOTO OPTIONS
IF SELECTION = 2 THEN
    SYSTEM
END IF

' Start game menu loop
STARTGAME:
CLS
SELECTION = 0
DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Write Start Game text
    DRAW_MAIN_MENU (0)

    ' Selections
    IF SELECTION = 0 THEN
        LOCATE 12, 260
        COLOR &HFFFFF933
        PRINT "New Game"
        LOCATE 14, 250
        COLOR &HFFFCFCFC
        PRINT "Load Game"
        LOCATE 16, 250
        PRINT "Back"
    ELSEIF SELECTION = 1 THEN
        LOCATE 12, 250
        COLOR &HFFFCFCFC
        PRINT "New Game"
        LOCATE 14, 260
        COLOR &HFFFFF933
        PRINT "Load Game"
        LOCATE 16, 250
        COLOR &HFFFCFCFC
        PRINT "Back"
    ELSEIF SELECTION = 2 THEN
        LOCATE 12, 250
        COLOR &HFFFCFCFC
        PRINT "New Game"
        LOCATE 14, 250
        COLOR &HFFFCFCFC
        PRINT "Load Game"
        LOCATE 16, 260
        COLOR &HFFFFF933
        PRINT "Back"
    END IF

    ' Update display
    _DISPLAY

    ' Handle input
    KEY$ = INKEY$
    IF KEY$ = CHR$(0) + CHR$(72) THEN SELECTION = SELECTION - 1: _SNDPLAY menubeep& ' Up arrow
    IF KEY$ = CHR$(0) + CHR$(80) THEN SELECTION = SELECTION + 1: _SNDPLAY menubeep& ' Down arrow

    ' Handle over/under conditions
    IF SELECTION = 3 THEN SELECTION = 0
    IF SELECTION = -1 THEN SELECTION = 2

LOOP UNTIL KEY$ = CHR$(13): _SNDPLAY menubeep&

' Handle selection
IF SELECTION = 0 THEN GOTO PLAYERNAME
IF SELECTION = 2 THEN GOTO MAINMENU
IF SELECTION = 1 THEN
    LOADGAME
    GOTO DWSTART
END IF

' Play name entry
PLAYERNAME:
CLS

DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Write Start Game text
    DRAW_MAIN_MENU (0)

    ' Highlight new game
    LOCATE 12, 260
    COLOR &HFFFFF933
    PRINT "New Game"
    LOCATE 14, 250
    COLOR &HFFFCFCFC
    PRINT "Load Game"
    LOCATE 16, 250
    PRINT "Back"

    ' Prompt
    LOCATE 12, 480
    COLOR &HFFFCFCFC
    PRINT "Enter Name:"

    ' Get string
    LOCATE 14, 480, 1
    COLOR &HFFFCFCFC
    INPUT "", NAME$

    ' Update display
    _DISPLAY

    IF LEN(NAME$) >= 11 THEN
        LOCATE 14, 480
        PRINT "                                    "
        LOCATE 16, 480
        COLOR &HFFF70031
        PRINT "That name is too long!"

        ' Wait for user
        _DISPLAY
        SLEEP
    END IF
LOOP UNTIL LEN(NAME$) <= 10 AND LEN(NAME$) > 0

' Load default values before launching game
LOADDEFAULTS

' Jump to game start
GOTO DWSTART

' Options menu loop
OPTIONS:
CLS
SELECTION = 0
DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Highlight options
    DRAW_MAIN_MENU (1)

    ' Selections
    DRAW_OPTIONS_MENU (SELECTION)

    ' Update display
    _DISPLAY

    ' Handle input
    KEY$ = INKEY$
    IF KEY$ = CHR$(0) + CHR$(72) THEN SELECTION = SELECTION - 1: _SNDPLAY menubeep& ' Up arrow
    IF KEY$ = CHR$(0) + CHR$(80) THEN SELECTION = SELECTION + 1: _SNDPLAY menubeep& ' Down arrow

    ' Handle over/under conditions
    IF SELECTION = 5 THEN SELECTION = 0
    IF SELECTION = -1 THEN SELECTION = 4

LOOP UNTIL KEY$ = CHR$(13): _SNDPLAY menubeep&

' Handle selection
IF SELECTION = 0 THEN GOTO DIFFSELECT
IF SELECTION = 1 THEN GOTO ENTERCHEATS
IF SELECTION = 3 THEN GOTO DISPLAYOPTIONS
IF SELECTION = 2 THEN GOTO SWIPECREDITS
IF SELECTION = 4 THEN GOTO MAINMENU

'Difficult select menu loop
DIFFSELECT:
CLS
SELECTION = 0
DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Highlight options
    DRAW_MAIN_MENU (1)

    ' Highlight difficulty
    DRAW_OPTIONS_MENU (0)

    ' Selections
    IF SELECTION = 0 THEN
        LOCATE 12, 490
        COLOR &HFFFFF933
        PRINT "Easy"
        LOCATE 14, 480
        COLOR &HFFFCFCFC
        PRINT "Medium"
        LOCATE 16, 480
        PRINT "Hard"
    ELSEIF SELECTION = 1 THEN
        LOCATE 12, 480
        COLOR &HFFFCFCFC
        PRINT "Easy"
        LOCATE 14, 490
        COLOR &HFFFFF933
        PRINT "Medium"
        LOCATE 16, 480
        COLOR &HFFFCFCFC
        PRINT "Hard"
    ELSEIF SELECTION = 2 THEN
        LOCATE 12, 480
        COLOR &HFFFCFCFC
        PRINT "Easy"
        LOCATE 14, 480
        COLOR &HFFFCFCFC
        PRINT "Medium"
        LOCATE 16, 490
        COLOR &HFFFFF933
        PRINT "Hard"
    END IF

    ' Update display
    _DISPLAY

    ' Handle input
    KEY$ = INKEY$
    IF KEY$ = CHR$(0) + CHR$(72) THEN SELECTION = SELECTION - 1: _SNDPLAY menubeep& ' Up arrow
    IF KEY$ = CHR$(0) + CHR$(80) THEN SELECTION = SELECTION + 1: _SNDPLAY menubeep& ' Down arrow

    ' Handle over/under conditions
    IF SELECTION = 3 THEN SELECTION = 0
    IF SELECTION = -1 THEN SELECTION = 2

LOOP UNTIL KEY$ = CHR$(13): _SNDPLAY menubeep&

' Handle selection
IF SELECTION = 0 THEN DIFF = 1
IF SELECTION = 1 THEN DIFF = 2
IF SELECTION = 2 THEN DIFF = 3

' Jump back to options
GOTO OPTIONS

' Cheats menu loop
ENTERCHEATS:
CLS

' Draw BG
_PUTIMAGE (0, 0), menubg&
_PUTIMAGE (0, -200), dwlogo&

' Highlight options
DRAW_MAIN_MENU (1)

' Highlight cheats
DRAW_OPTIONS_MENU (1)

' Prompt
LOCATE 12, 480
COLOR &HFFFCFCFC
PRINT "Enter Cheat:"

' Get string
LOCATE 14, 480, 1
COLOR &HFFFCFCFC
INPUT "", CODE$

' Update display
_DISPLAY

' Check if it's a known code
CODEERROR = 0

' Convert to upper case
CODE$ = UCASE$(CODE$)

' CHEATLIST
IF CODE$ = "I NEED TO WIN" THEN
    MONEY = 1500000
    CRACK = 1000000
ELSEIF CODE$ = "CLEAN SLATE" THEN
    ' Reset game save to defaults
    NAME$ = ""
    LOADDEFAULTS
    SAVEGAME
ELSEIF CODE$ = "TUMBLEWEED" THEN
    POT = 10000
ELSEIF CODE$ = "XBOX" THEN
    LEVEL = 2
    PlayerX% = 6
    PlayerY% = 5
    MONEY = 1
    BALANCE = 1000000
    POT = 0
    ECSTACY = 0
    CRACK = 0
    ACID = 0
    COKE = 0
    HASH = 0
    HEROIN = 0
    MUSHROOMS = 0
ELSEIF CODE$ = "GAMECUBE" THEN
    POT = 1000
    ECSTACY = 1000
    CRACK = 1000
    ACID = 1000
    COKE = 1000
    HASH = 1000
    HEROIN = 1000
    MUSHROOMS = 1000
ELSEIF CODE$ = "PS2" THEN
    MONEY = 2000000
ELSEIF CODE$ = "JUNKIES" THEN
    JMF = 1
ELSEIF CODE$ = "FMV SUX" THEN
    FMV = 0
ELSEIF CODE$ = "EASYPASS" THEN
    ROC = 1
ELSEIF CODE$ = "SWISS BANK" THEN
    INTRATE = .27
ELSE
    CODEERROR = 1
END IF

' Print status
LOCATE 16, 480
COLOR &HFFFFF933
IF CODEERROR = 0 THEN
    ' Save game to apply the new vars
    SAVEGAME
    ' Print message and play sound
    PRINT "Cheat Activated"
    _SNDPLAY chingsfx&
ELSE
    PRINT "Invalid Cheat"
END IF

' Wait for input
_DISPLAY
SLEEP

' Clear input buffer so it doesn't mess with menus
DO: KEY$ = INKEY$: LOOP UNTIL KEY$ = ""

' Jump back to options
GOTO OPTIONS

' Credits animation
SWIPECREDITS:
CLS
FRAME = 0
DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Highlight options
    DRAW_MAIN_MENU (1)

    ' Highlight credits
    DRAW_OPTIONS_MENU (2)

    ' Slide in credits image
    _PUTIMAGE ((800 - FRAME), 0), credits&

    ' Update display and increment counter
    _DISPLAY
    FRAME = FRAME + 50

LOOP UNTIL FRAME = 850

SLEEP 1

' Animate vertically
FRAME = 0
DO
    ' Slide up credits image
    _PUTIMAGE (0, -FRAME), credits&
    _DELAY .03

    ' Update display and increment counter
    _DISPLAY
    FRAME = FRAME + 1

LOOP UNTIL FRAME = 600

' Clear input buffer so it doesn't mess with menus
DO: KEY$ = INKEY$: LOOP UNTIL KEY$ = ""

SLEEP 1

' Jump back to options
GOTO OPTIONS:

' Display menu loop
DISPLAYOPTIONS:
CLS
SELECTION = 0
DO
    ' Draw BG
    _PUTIMAGE (0, 0), menubg&
    _PUTIMAGE (0, -200), dwlogo&

    ' Highlight options
    DRAW_MAIN_MENU (1)

    ' Highlight display
    DRAW_OPTIONS_MENU (3)

    LOCATE 16, 470
    COLOR &HFFF70031
    PRINT "Restart required!"

    ' Selections
    IF SELECTION = 0 THEN
        LOCATE 12, 490
        COLOR &HFFFFF933
        PRINT "Windowed"
        LOCATE 14, 480
        COLOR &HFFFCFCFC
        PRINT "Full Screen"
    ELSEIF SELECTION = 1 THEN
        LOCATE 12, 480
        COLOR &HFFFCFCFC
        PRINT "Windowed"
        LOCATE 14, 490
        COLOR &HFFFFF933
        PRINT "Full Screen"
    END IF

    ' Update display
    _DISPLAY

    ' Handle input
    KEY$ = INKEY$
    IF KEY$ = CHR$(0) + CHR$(72) THEN SELECTION = SELECTION - 1: _SNDPLAY menubeep& ' Up arrow
    IF KEY$ = CHR$(0) + CHR$(80) THEN SELECTION = SELECTION + 1: _SNDPLAY menubeep& ' Down arrow

    ' Handle over/under conditions
    IF SELECTION = 2 THEN SELECTION = 0
    IF SELECTION = -1 THEN SELECTION = 1

LOOP UNTIL KEY$ = CHR$(13): _SNDPLAY menubeep&

' Open INI file and write option
OPEN configfile$ FOR OUTPUT AS #2
WRITE #2, SELECTION
CLOSE #2

' Jump back to options
GOTO OPTIONS

' Main game start
DWSTART:
' Stop menu music if it's still going
_SNDSTOP theme&

' Get SCREEN back into a usable state for main game
CLS
_AUTODISPLAY
SCREEN 13
DO
    REM: Play ambient loop depending on map
    IF LEVEL = 2 THEN
        _SNDSTOP ambientcity&
        _SNDLOOP ambientpark&
    ELSE
        _SNDSTOP ambientpark&
        _SNDLOOP ambientcity&
    END IF

    SELECT CASE LEVEL
        CASE 0
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\TRENTON.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 1
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\HAMILTON.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 2
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\PARK.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 3
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\EWING.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 4
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\PHILLY.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 5
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\NYC.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 6
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\PALMDALE.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
        CASE 7
            REDIM SHARED MAP%(0 TO 15, 0 TO 7)
            OPEN "DATA\LEVELS\LA.CTY" FOR INPUT AS #2
            FOR y = 0 TO 7
                FOR x = 0 TO 15
                    INPUT #2, MAP%(x, y)
                NEXT x
            NEXT y
            CLOSE #2
    END SELECT
    IF LEVEL = 99 THEN ENDING
    LEVEL0
LOOP UNTIL QUIT = 1
IF GOVER = 1 THEN
    ' Reset vars to default
    LOADDEFAULTS

    ' Save game
    SAVEGAME

END IF
' Attempt to restart game
IF R = 1 THEN
    GOTO DopeStart
END IF

END

SUB BANK

IF QUIT = 1 GOTO BANKDONE

LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT "Do you want to use the bank? (Y/N)"

LOCATE 23, 2
INPUT ANS$

BANKPROX = 0

IF ANS$ = "Y" THEN GOTO BANKYES
IF ANS$ = "y" THEN GOTO BANKYES
IF ANS$ = "N" THEN GOTO BANKDONE
IF ANS$ = "n" THEN GOTO BANKDONE

GOTO BANKDONE

BANKYES:

CLS

LOCATE 1, 10
PRINT "Welcome to the Bank"
PRINT ""
LINE (0, 25)-(320, 25)
PRINT ""
PRINT ""
PRINT "1.Deposit Money"
PRINT "2.Withdraw Money"
PRINT "3.Check Balance"
PRINT "4.Rob Bank"
PRINT "5.Done"
PRINT ""
INPUT "Your Selection?", ANS

IF ANS >= 5 THEN GOTO BANKDONE

IF ANS = 1 THEN GOTO DEPOSIT
IF ANS = 2 THEN GOTO WITHDRAW
IF ANS = 3 THEN GOTO BALANCE
IF ANS = 4 THEN GOTO ROB


DEPOSIT:

CLS

PRINT "Deposit Money"
PRINT ""
LINE (0, 25)-(320, 25)
PRINT ""
PRINT ""
PRINT "Your Money:"; INT(MONEY)
PRINT ""
PRINT "Your Balance:"; INT(BALANCE)
PRINT ""
PRINT "How much money to deposit?"
INPUT DEPOMONEY

IF MONEY - DEPOMONEY <= 0 THEN

    CLS

    PRINT "You ain't got enough paper foo!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

END IF



IF MONEY - DEPOMONEY > 0 THEN

    MONEY = MONEY - DEPOMONEY

    BALANCE = BALANCE + DEPOMONEY

    CLS

END IF

GOTO BANKYES


WITHDRAW:

CLS

PRINT "Withdraw Money"
PRINT ""
LINE (0, 25)-(320, 25)
PRINT ""
PRINT ""
PRINT "Your Money:"; INT(MONEY)
PRINT ""
PRINT "Your Balance:"; INT(BALANCE)
PRINT ""
PRINT "How much money to withdraw?"
INPUT WITHMONEY


IF BALANCE - WITHMONEY < 0 THEN

    CLS

    PRINT "You ain't got enough paper foo!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

END IF


IF BALANCE - WITHMONEY >= 0 THEN

    MONEY = MONEY + WITHMONEY

    BALANCE = BALANCE - WITHMONEY

    CLS

END IF

GOTO BANKYES



BALANCE:

CLS

PRINT "Balance"
PRINT ""
LINE (0, 25)-(320, 25)
PRINT ""
PRINT ""
PRINT "Your Balance:"; INT(BALANCE)
PRINT ""
PRINT "Your Money:"; INT(MONEY)

DO
    A$ = INKEY$
LOOP WHILE A$ = ""
    
CLS

GOTO BANKYES

ROB:

CLS

PRINT "This is some high-risk shit!"
PRINT ""
PRINT "They gonna shoot your junkie ass if you don't get them first!"
PRINT ""
PRINT "Are you sure you want to try this shit?"
INPUT "(Y/N)"; ANS$

IF ANS$ = "" THEN GOTO BANKDONE

IF ANS$ = "Y" OR ANS$ = "y" THEN

    CLS

    PRINT "Alright bitch, but your on your own on"
    PRINT "this one!"
    PRINT ""
    PRINT "You bust in the door..."
    PRINT ""
    PRINT "Get yo hands up, get them fuckers up!"
    PRINT ""
    PRINT "Gimme all the money bitch!"
    PRINT ""

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

    PRINT "The guard is runnin up!!"
    PRINT ""
    PRINT "Stay back mothafucka!!"
    PRINT ""
    PRINT "He's still comin!"
    PRINT ""
    PRINT "The bitch is pointin his gun at you!"
    PRINT ""
    PRINT "You point yo gun at that motherfucker..."


    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

    N = 10

    RANDOMIZE TIMER

    RAND = INT(RND * N) + 1

    IF RAND < 6 THEN

        IF DIF = 1 THEN

            RANDOMIZE TIMER
         
            RAND = INT(RND * N) + 1

            IF RAND <= 1 THEN

                ROB = 1
                BOOTY = 500000

            ELSEIF RAND < 6 AND RAND > 1 THEN

                ROB = 1
                BOOTY = 200000

            ELSE

                ROB = 1
                BOOTY = 350000

            END IF

        END IF


        IF DIF = 2 THEN

            RANDOMIZE TIMER

            RAND = INT(RND * N) + 1

            IF RAND <= 1 THEN

                ROB = 1
                BOOTY = 100000

            ELSEIF RAND < 6 AND RAND > 1 THEN

                ROB = 1
                BOOTY = 20000
            ELSE

                ROB = 1
                BOOTY = 50000

            END IF

        END IF

    ELSE

        ROB = 0

    END IF

END IF


IF ANS$ = "N" OR ANS$ = "n" GOTO ROBN
   
IF ROB = 1 THEN

    ROB = 0

    MONEY = MONEY + BOOTY

    CLS

    PRINT "Holy Shit!!"
    PRINT "You capped that bitch!"
    PRINT ""
    PRINT "You made it out with"; BOOTY; "dollars!"
    PRINT ""
    PRINT "You are one lucky motherfucker!"
    PRINT "Now just hope the cops dont pop yo ass!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

ELSE

    CLS

    PRINT "And you fuckin miss!!"
    PRINT ""
    PRINT "Damn bitch, you can't aim for shit!"
    PRINT ""
    PRINT "Well, they capped your ass. "
    PRINT "I guess you ain't so lucky after all..."
    PRINT ""
    PRINT "Oh well motherfucker, you know what thatmeans..."

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    GAMEOVER

END IF

ROBN:

IF ANS$ = "N" OR ANS$ = "n" THEN

    CLS

    PRINT "Good call motherfucker!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

END IF



BANKDONE:
END SUB

SUB BUS

IF QUIT = 1 GOTO BUSDONE

IF MONEY - 2 <= 0 THEN

    BPROX = 0

    LOCATE 22, 2
    PRINT "                                      "

    LOCATE 23, 2
    PRINT "                                      "

    LOCATE 22, 2
    PRINT "Your broke ass can't afford the bus!"

    LOCATE 23, 2
    PRINT "That shit is just sad...   "

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

END IF

IF BPROX = 0 GOTO BUSDONE

LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT "Do you want to use the bus? (Y/N)"

LOCATE 23, 2
INPUT ANS$

BPROX = 0

IF ANS$ = "Y" THEN GOTO BUSYES
IF ANS$ = "y" THEN GOTO BUSYES
IF ANS$ = "N" THEN GOTO BUSDONE
IF ANS$ = "n" THEN GOTO BUSDONE

GOTO BUSDONE

BUSYES:

CLS

PRINT "Locations"
PRINT ""
PRINT ""
PRINT "1.Trenton"
PRINT "2.Hamilton"
PRINT "3.The Park"
PRINT "4.Ewing"
PRINT "5.Philly"
PRINT "6.New York City"
PRINT "7.Palmdale"
PRINT "8.LA"
PRINT "9.Cancel"
PRINT ""
INPUT "Where you goin?", AREA

IF AREA >= 9 THEN GOTO BUSDONE

REM: Play bus driving animation
IF FMV = 1 THEN
    SCREEN _NEWIMAGE(800, 600, 32)

    FRAME = 0
    MOVEOFFSET = 32
    MOVELENGTH = 50

    REM: Start playing audio out of animation loop, stop ambient tracks first
    _SNDSTOP ambientpark&
    _SNDSTOP ambientcity&
    _SNDPLAY busnoise&
    DO
        _PUTIMAGE ((-1700 + (FRAME * MOVEOFFSET)), 0), street&
        _PUTIMAGE (0, 0), buswindows&

        REM: Hold first frame longer
        IF FRAME = 0 THEN
            _DELAY 1
        ELSE
            _DELAY .1
        END IF

        REM: Update display and increment counter
        _DISPLAY
        FRAME = FRAME + 1
    LOOP UNTIL FRAME = MOVELENGTH

    REM: End audio
    _SNDSTOP busnoise&

    REM: Turn auto redraw back on
    _AUTODISPLAY

    REM: Return to normal SCREEN
    SCREEN 13

END IF

IF ROC = 0 THEN

    MONEY = MONEY - 2

END IF

IF DIF = 1 THEN INTRATE = .1
IF DIF = 2 THEN INTRATE = .05
IF DIF = 3 THEN INTRATE = .02
BALDIF = BALANCE * INTRATE
BALANCE = BALANCE + BALDIF

IF AREA = 1 THEN PlayerX% = 8: PlayerY% = 5: LEVEL = 0
IF AREA = 2 THEN PlayerX% = 14: PlayerY% = 2: LEVEL = 1
IF AREA = 3 THEN PlayerX% = 6: PlayerY% = 5: LEVEL = 2
IF AREA = 4 THEN PlayerX% = 11: PlayerY% = 6: LEVEL = 3
IF AREA = 5 THEN PlayerX% = 6: PlayerY% = 1: LEVEL = 4
IF AREA = 6 THEN PlayerX% = 3: PlayerY% = 1: LEVEL = 5
IF AREA = 7 THEN PlayerX% = 8: PlayerY% = 5: LEVEL = 6
IF AREA = 8 THEN PlayerX% = 8: PlayerY% = 3: LEVEL = 7

JND = 0

BUSDONE:
END SUB

SUB COMMANDS

LINE (0, 160)-(319, 160)
LINE (0, 160)-(0, 195)
LINE (0, 195)-(319, 195)
LINE (319, 160)-(319, 195)


LOCATE 22, 2
PRINT "S - Sell   B - Buy   C - Check Status"

LOCATE 23, 2
PRINT "O - Option           V - Save Game   "


IF A$ = "S" THEN GOTO SELL
IF A$ = "s" THEN GOTO SELL
IF A$ = "B" THEN GOTO BUY
IF A$ = "b" THEN GOTO BUY
IF A$ = "C" THEN GOTO CHECK
IF A$ = "c" THEN GOTO CHECK
IF A$ = "O" THEN GOTO OPTIONS2
IF A$ = "o" THEN GOTO OPTIONS2

IF A$ = "V" OR A$ = "v" THEN
    ' Save the game
    SAVEGAME

    ' Print message
    LOCATE 22, 2
    PRINT "                                     "

    LOCATE 23, 2
    PRINT "                                     "

    LOCATE 22, 2
    PRINT NAME$; "'s game has been saved."

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

END IF


IF LEVEL = 0 AND x% = 168 AND y% = 105 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 1 AND x% = 294 AND y% = 42 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 2 AND x% = 126 AND y% = 105 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 3 AND x% = 231 AND y% = 126 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 4 AND x% = 126 AND y% = 21 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 5 AND x% = 63 AND y% = 21 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 6 AND x% = 168 AND y% = 105 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE
IF LEVEL = 7 AND x% = 168 AND y% = 63 THEN BPROX = 1 ELSE BPROX = 0
IF BPROX = 1 THEN GOTO DONE


IF LEVEL = 0 AND x% = 63 AND y% = 105 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 1 AND x% = 63 AND y% = 42 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 2 AND x% = 126 AND y% = 105 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 3 AND x% = 21 AND y% = 42 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 4 AND x% = 294 AND y% = 21 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 5 AND x% = 231 AND y% = 126 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 6 AND x% = 231 AND y% = 105 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE
IF LEVEL = 7 AND x% = 294 AND y% = 105 THEN BANKPROX = 1 ELSE BANKPROX = 0
IF BANKPROX = 1 THEN GOTO DONE



GOTO DONE


SELL:

IF PROX = 1 THEN DEAL
IF DEALFIN = 1 THEN GOTO DONE


LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT "There is nobody here to sell to!"

DO
    A$ = INKEY$
LOOP WHILE A$ = ""

GOTO DONE


BUY:

IF DPROX = 1 THEN DEAL
IF DEALFIN = 1 THEN GOTO DONE

LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT "You have to buy your drugs from a"

LOCATE 23, 2
PRINT "dealer!"

DO
    A$ = INKEY$
LOOP WHILE A$ = ""

GOTO DONE


OPTIONS2:

LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT "S - Save and Exit    E - Exit"

LOCATE 23, 2
PRINT "R - Restart game     C - Cancel"


DO
    A$ = INKEY$

    IF A$ = "S" OR A$ = "s" THEN
        ' save the game
        SAVEGAME

        QUIT = 1

    END IF

    IF A$ = "E" THEN QUIT = 1
    IF A$ = "e" THEN QUIT = 1
    IF A$ = "R" OR A$ = "r" THEN

        QUIT = 1
        R = 1

    END IF

LOOP WHILE A$ = ""

GOTO DONE


      

CHECK:

C = 1

CLS

PRINT "Name:"; NAME$
PRINT ""
PRINT "Money:"; INT(MONEY)
PRINT ""
PRINT "Balance:"; INT(BALANCE)
PRINT ""
PRINT ""
PRINT "Stash:"
PRINT ""
PRINT "Drug"; TAB(20); "In Stash"
LINE (0, 80)-(262, 80)
PRINT ""
PRINT "1.Pot"; TAB(20); POT
PRINT "2.Ecstacy"; TAB(20); ECSTACY
PRINT "3.Crack"; TAB(20); CRACK
PRINT "4.Acid"; TAB(20); ACID
PRINT "5.Coke"; TAB(20); COKE
PRINT "6.Hash"; TAB(20); HASH
PRINT "7.Heroin"; TAB(20); HEROIN
PRINT "8.Shrooms"; TAB(20); MUSHROOMS

DO
    A$ = INKEY$
LOOP WHILE A$ = ""


CLS


DONE:

DEALFIN = 0

END SUB

SUB DEAL

C = 1

IF DPROX = 1 THEN GOTO BUYDRUGS

LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT NAME$; ": You want to buy some shit?"

RANDOMIZE TIMER
R = INT(RND * 19)

IF JMF = 1 THEN R = 8

IF R > 6 AND JND = 0 THEN

    LOCATE 23, 2
    PRINT "Junkie: Hell yeah, bitch!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

    IF SLEVEL <> LEVEL THEN

        SLEVEL = LEVEL

        N = 10

        IF DIF = 1 THEN

            RANDOMIZE TIMER

            RAND = INT(RND * N) + 1

            IF RAND <= 1 THEN

                PPRICE = 100
                EPRICE = 220
                CPRICE = 740
                APRICE = 1100
                COPRICE = 30000
                HPRICE = 1200
                HEPRICE = 12000
                MPRICE = 2000

            ELSEIF RAND < 6 AND RAND > 1 THEN

                PPRICE = 50
                EPRICE = 110
                CPRICE = 440
                APRICE = 700
                COPRICE = 25000
                HPRICE = 980
                HEPRICE = 9500
                MPRICE = 1600

            ELSE

                PPRICE = 80
                EPRICE = 150
                CPRICE = 540
                APRICE = 820
                COPRICE = 20000
                HPRICE = 900
                HEPRICE = 8500
                MPRICE = 1000

            END IF
        END IF


        IF DIF = 2 THEN
         
            RANDOMIZE TIMER

            RAND = INT(RND * N) + 1

            IF RAND <= 1 THEN

                PPRICE = 80
                EPRICE = 200
                CPRICE = 700
                APRICE = 910
                COPRICE = 20000
                HPRICE = 900
                HEPRICE = 8200
                MPRICE = 1100

            ELSEIF RAND < 6 AND RAND > 1 THEN

                PPRICE = 30
                EPRICE = 95
                CPRICE = 400
                APRICE = 880
                COPRICE = 15000
                HPRICE = 800
                HEPRICE = 8000
                MPRICE = 900

            ELSE

                PPRICE = 70
                EPRICE = 125
                CPRICE = 480
                APRICE = 750
                COPRICE = 19500
                HPRICE = 950
                HEPRICE = 9000
                MPRICE = 1400

            END IF

        END IF


        IF DIF = 3 THEN

            RANDOMIZE TIMER

            RAND = INT(RND * N) + 1

            IF RAND <= 1 THEN

                PPRICE = 20
                EPRICE = 40
                CPRICE = 70
                APRICE = 190
                COPRICE = 1200
                HPRICE = 280
                HEPRICE = 950
                MPRICE = 260

            ELSEIF RAND < 6 AND RAND > 1 THEN

                PPRICE = 10
                EPRICE = 15
                CPRICE = 40
                APRICE = 80
                COPRICE = 1000
                HPRICE = 140
                HEPRICE = 800
                MPRICE = 200

            ELSE

                PPRICE = 15
                EPRICE = 25
                CPRICE = 60
                APRICE = 110
                COPRICE = 1100
                HPRICE = 145
                HEPRICE = 870
                MPRICE = 240

            END IF

        END IF

    END IF

    PRINT "Selling Drugs"
    PRINT ""
    PRINT "Drug"; TAB(15); "In Stash"; TAB(30); "Price"
    LINE (0, 25)-(290, 25)
    PRINT ""
    IF POT = 0 THEN COLOR 4
    PRINT "1.Pot"; TAB(15); POT; TAB(30); PPRICE
    COLOR 15
    PRINT ""
    IF ECSTACY = 0 THEN COLOR 4
    PRINT "2.Ecstacy"; TAB(15); ECSTACY; TAB(30); EPRICE
    COLOR 15
    PRINT ""
    IF CRACK = 0 THEN COLOR 4
    PRINT "3.Crack"; TAB(15); CRACK; TAB(30); CPRICE
    COLOR 15
    PRINT ""
    IF ACID = 0 THEN COLOR 4
    PRINT "4.Acid"; TAB(15); ACID; TAB(30); APRICE
    COLOR 15
    PRINT ""
    IF COKE = 0 THEN COLOR 4
    PRINT "5.Coke"; TAB(15); COKE; TAB(30); COPRICE
    COLOR 15
    PRINT ""
    IF HASH = 0 THEN COLOR 4
    PRINT "6.Hash"; TAB(15); HASH; TAB(30); HPRICE
    COLOR 15
    PRINT ""
    IF HEROIN = 0 THEN COLOR 4
    PRINT "7.Heroin"; TAB(15); HEROIN; TAB(30); HEPRICE
    COLOR 15
    PRINT ""
    IF MUSHROOMS = 0 THEN COLOR 4
    PRINT "8.Shrooms"; TAB(15); MUSHROOMS; TAB(30); MPRICE
    COLOR 15
    PRINT ""
    PRINT "9.Cancel"
    PRINT ""
    INPUT "What drug you gonna sell?", CHOICE

    IF CHOICE = 1 AND POT > 0 THEN DDEAL = 1
    IF CHOICE = 2 AND ECSTACY > 0 THEN DDEAL = 1
    IF CHOICE = 3 AND CRACK > 0 THEN DDEAL = 1
    IF CHOICE = 4 AND ACID > 0 THEN DDEAL = 1
    IF CHOICE = 5 AND COKE > 0 THEN DDEAL = 1
    IF CHOICE = 6 AND HASH > 0 THEN DDEAL = 1
    IF CHOICE = 7 AND HEROIN > 0 THEN DDEAL = 1
    IF CHOICE = 8 AND MUSHROOMS > 0 THEN DDEAL = 1
    IF DDEAL = 0 THEN AMOUNT = 1
    IF CHOICE = 1 THEN DRUG$ = "Pot"
    IF CHOICE = 2 THEN DRUG$ = "Ecstacy"
    IF CHOICE = 3 THEN DRUG$ = "Crack"
    IF CHOICE = 4 THEN DRUG$ = "Acid"
    IF CHOICE = 5 THEN DRUG$ = "Coke"
    IF CHOICE = 6 THEN DRUG$ = "Hash"
    IF CHOICE = 7 THEN DRUG$ = "Heroin"
    IF CHOICE = 8 THEN DRUG$ = "Shrooms"
    IF CHOICE >= 9 THEN GOTO DONEDEAL

ELSE
    JND = 1
    LOCATE 23, 2
    PRINT "Junkie: Naw, not today dogg!"
    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""
    DDEAL = -1
END IF


IF DDEAL = 1 THEN

    CLS

    PRINT "Selling "; DRUG$
    PRINT ""
    PRINT ""
    PRINT "How much "; DRUG$; " are you gonna sell?"
    PRINT ""
    INPUT "Amount to sell:", AMOUNT

    IF AMOUNT <= 0 THEN DDEAL = 0: CHOICE = 0
    IF CHOICE = 1 THEN

        DPRICE = AMOUNT * PPRICE

        IF POT - AMOUNT >= 0 THEN
         
            POT = POT - AMOUNT
            MONEY = MONEY + DPRICE
         
        ELSE

            DDEAL = 0

        END IF

    ELSEIF CHOICE = 2 THEN

        DPRICE = AMOUNT * EPRICE

        IF ECSTACY - AMOUNT >= 0 THEN

            ECSTACY = ECSTACY - AMOUNT
            MONEY = MONEY + DPRICE
        ELSE

            DDEAL = 0
         
        END IF

    ELSEIF CHOICE = 3 THEN

        DPRICE = AMOUNT * CPRICE

        IF CRACK - AMOUNT >= 0 THEN

            CRACK = CRACK - AMOUNT
            MONEY = MONEY + DPRICE
         
        ELSE

            DDEAL = 0

        END IF

    ELSEIF CHOICE = 4 THEN
     
        DPRICE = AMOUNT * APRICE

        IF ACID - AMOUNT >= 0 THEN

            ACID = ACID - AMOUNT
            MONEY = MONEY + DPRICE
         
        ELSE

            DDEAL = 0

        END IF

    ELSEIF CHOICE = 5 THEN

        DPRICE = AMOUNT * COPRICE
     
        IF COKE - AMOUNT >= 0 THEN

            COKE = COKE - AMOUNT
            MONEY = MONEY + DPRICE

        ELSE

            DDEAL = 0

        END IF
    ELSEIF CHOICE = 6 THEN

        DPRICE = AMOUNT * HPRICE

        IF HASH - AMOUNT >= 0 THEN

            HASH = HASH - AMOUNT
            MONEY = MONEY + DPRICE

        ELSE

            DDEAL = 0

        END IF
    ELSEIF CHOICE = 7 THEN

        DPRICE = AMOUNT * HEPRICE

        IF HEROIN - AMOUNT >= 0 THEN

            HEROIN = HEROIN - AMOUNT
            MONEY = MONEY + DPRICE

        ELSE

            DDEAL = 0

        END IF
    ELSEIF CHOICE = 8 THEN

        DPRICE = AMOUNT * MPRICE

        IF MUSHROOMS - AMOUNT >= 0 THEN

            MUSHROOMS = MUSHROOMS - AMOUNT
            MONEY = MONEY + DPRICE

        ELSE

            DDEAL = 0

        END IF

    END IF

END IF


IF DDEAL = 1 AND AMOUNT >= 1 THEN

    CLS

    PRINT "Hell Yeah!"
    PRINT ""
    PRINT "You sold"; AMOUNT; " "; DRUG$; " for"; DPRICE; "bucks!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

END IF


IF DDEAL = 0 AND AMOUNT >= 1 THEN

    CLS

    PRINT "You ain't got enough "; DRUG$; " foo!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

    DDEAL = 0

END IF


BUYDRUGS:

IF PROX = 1 THEN GOTO DONEDEAL

LOCATE 22, 2
PRINT "                                      "

LOCATE 23, 2
PRINT "                                      "

LOCATE 22, 2
PRINT NAME$; ": Yo, I need some shit!"

     
LOCATE 23, 2
PRINT "Dealer: Let me hook you up!"

DO
    A$ = INKEY$
LOOP WHILE A$ = ""

CLS

IF BLEVEL <> LEVEL THEN

    BLEVEL = LEVEL

    N = 10

    IF DIF = 1 THEN

        RANDOMIZE TIMER

        RAND = INT(RND * N) + 1

        IF RAND <= 1 THEN

            PBPRICE = 80
            EBPRICE = 195
            CBPRICE = 690
            ABPRICE = 940
            COBPRICE = 28000
            HBPRICE = 1400
            HEBPRICE = 18000
            MBPRICE = 1800

        ELSEIF RAND < 6 AND RAND > 1 THEN

            PBPRICE = 30
            EBPRICE = 90
            CBPRICE = 400
            ABPRICE = 620
            COBPRICE = 22000
            HBPRICE = 900
            HEBPRICE = 8900
            MBPRICE = 1200

        ELSE

            PBPRICE = 85
            EBPRICE = 145
            CBPRICE = 550
            ABPRICE = 820
            COBPRICE = 18000
            HBPRICE = 400
            HEBPRICE = 6000
            MBPRICE = 800

        END IF
    END IF


    IF DIF = 2 THEN

        RANDOMIZE TIMER

        RAND = INT(RND * N) + 1

        IF RAND <= 1 THEN

            PBPRICE = 70
            EBPRICE = 170
            CBPRICE = 680
            ABPRICE = 880
            COBPRICE = 28000
            HBPRICE = 800
            HEBPRICE = 8000
            MBPRICE = 1800

        ELSEIF RAND < 6 AND RAND > 1 THEN

            PBPRICE = 20
            EBPRICE = 90
            CBPRICE = 370
            ABPRICE = 810
            COBPRICE = 12000
            HBPRICE = 610
            HEBPRICE = 6500
            MBPRICE = 820

        ELSE

            PBPRICE = 75
            EBPRICE = 120
            CBPRICE = 470
            ABPRICE = 750
            COBPRICE = 16000
            HBPRICE = 760
            HEBPRICE = 8000
            MBPRICE = 1200

        END IF

    END IF


    IF DIF = 3 THEN

        RANDOMIZE TIMER

        RAND = INT(RND * N) + 1

        IF RAND <= 1 THEN

            PBPRICE = 20
            EBPRICE = 40
            CBPRICE = 70
            ABPRICE = 190
            COBPRICE = 1280
            HBPRICE = 270
            HEBPRICE = 940
            MBPRICE = 210

        ELSEIF RAND < 6 AND RAND > 1 THEN

            PBPRICE = 5
            EBPRICE = 10
            CBPRICE = 30
            ABPRICE = 65
            COBPRICE = 980
            HBPRICE = 120
            HEBPRICE = 740
            MBPRICE = 200

        ELSE

            PBPRICE = 25
            EBPRICE = 55
            CBPRICE = 65
            ABPRICE = 150
            COBPRICE = 1200
            HBPRICE = 140
            HEBPRICE = 810
            MBPRICE = 230

        END IF

    END IF

END IF

PRINT "Buying Drugs"
PRINT ""
PRINT "Drug"; TAB(15); "In Stash"; TAB(30); "Price"
LINE (0, 25)-(290, 25)
PRINT ""
PRINT "1.Pot"; TAB(15); POT; TAB(30); PBPRICE
PRINT ""
PRINT "2.Ecstacy"; TAB(15); ECSTACY; TAB(30); EBPRICE
PRINT ""
PRINT "3.Crack"; TAB(15); CRACK; TAB(30); CBPRICE
PRINT ""
PRINT "4.Acid"; TAB(15); ACID; TAB(30); ABPRICE
PRINT ""
PRINT "5.Coke"; TAB(15); COKE; TAB(30); COBPRICE
PRINT ""
PRINT "6.Hash"; TAB(15); HASH; TAB(30); HBPRICE
PRINT ""
PRINT "7.Heroin"; TAB(15); HEROIN; TAB(30); HEBPRICE
PRINT ""
PRINT "8.Shrooms"; TAB(15); MUSHROOMS; TAB(30); MBPRICE
PRINT ""
PRINT "9.Cancel"
PRINT ""
INPUT "What drug you gonna buy?", CHOICE

IF CHOICE = 1 THEN DRUG$ = "Pot"
IF CHOICE = 2 THEN DRUG$ = "Ecstacy"
IF CHOICE = 3 THEN DRUG$ = "Crack"
IF CHOICE = 4 THEN DRUG$ = "Acid"
IF CHOICE = 5 THEN DRUG$ = "Coke"
IF CHOICE = 6 THEN DRUG$ = "Hash"
IF CHOICE = 7 THEN DRUG$ = "Heroin"
IF CHOICE = 8 THEN DRUG$ = "Shrooms"
IF CHOICE >= 9 THEN GOTO DONEDEAL

CLS

PRINT "Buying "; DRUG$
PRINT ""
PRINT ""
PRINT "How much "; DRUG$; " are you gonna buy?"
PRINT ""
INPUT "Amount to buy:", AMOUNT

IF AMOUNT < 0 THEN DDEAL = 0: CHOICE = 0
       
IF CHOICE = 1 THEN

    DPRICE = AMOUNT * PBPRICE

    IF MONEY - DPRICE >= 0 THEN

        POT = POT + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF

ELSEIF CHOICE = 2 THEN

    DPRICE = AMOUNT * EBPRICE

    IF MONEY - DPRICE >= 0 THEN

        ECSTACY = ECSTACY + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF

ELSEIF CHOICE = 3 THEN

    DPRICE = AMOUNT * CBPRICE

    IF MONEY - DPRICE >= 0 THEN

        CRACK = CRACK + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF

ELSEIF CHOICE = 4 THEN

    DPRICE = AMOUNT * ABPRICE

    IF MONEY - DPRICE >= 0 THEN
     
        ACID = ACID + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF
ELSEIF CHOICE = 5 THEN

    DPRICE = AMOUNT * COBPRICE

    IF MONEY - DPRICE >= 0 THEN

        COKE = COKE + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF

ELSEIF CHOICE = 6 THEN

    DPRICE = AMOUNT * HBPRICE

    IF MONEY - DPRICE >= 0 THEN

        HASH = HASH + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF

ELSEIF CHOICE = 7 THEN

    DPRICE = AMOUNT * HEBPRICE

    IF MONEY - DPRICE >= 0 THEN
     
        HEROIN = HEROIN + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF

ELSEIF CHOICE = 8 THEN

    DPRICE = AMOUNT * MBPRICE

    IF MONEY - DPRICE >= 0 THEN

        MUSHROOMS = MUSHROOMS + AMOUNT
        MONEY = MONEY - DPRICE
        DDEAL = 1

    ELSE

        DDEAL = 0

    END IF


END IF


IF DDEAL = 1 AND AMOUNT >= 1 THEN

    CLS

    PRINT "Hell Yeah!"
    PRINT ""
    PRINT "You bought"; AMOUNT; " "; DRUG$; " for"; DPRICE; "bucks!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

END IF


IF DDEAL = 0 AND AMOUNT >= 1 THEN

    CLS

    PRINT "You ain't got enough paper foo!"

    DO
        A$ = INKEY$
    LOOP WHILE A$ = ""

    CLS

    DDEAL = 0

END IF
DONEDEAL:
CLS
DDEAL = 0
DEALFIN = 1

END SUB

SUB DRAWBACKGROUND

x = PlayerX%
y = PlayerY%
IF MAP%(x, y) = 0 THEN
    PUT (x * 20, y * 20), GRASS%(), PSET
ELSEIF MAP%(x, y) = 1 THEN
    PUT (x * 20, y * 20), FOREST%(), PSET
ELSEIF MAP%(x, y) = 2 THEN
    PUT (x * 20, y * 20), DESERT%(), PSET
ELSEIF MAP%(x, y) = 3 THEN
    PUT (x * 20, y * 20), ROAD%(), PSET
ELSEIF MAP%(x, y) = 4 THEN
    PUT (x * 20, y * 20), IROAD%(), PSET
ELSEIF MAP%(x, y) = 5 THEN
    PUT (x * 20, y * 20), BRIDGE%(), PSET
ELSEIF MAP%(x, y) = 6 THEN
    PUT (x * 20, y * 20), HROAD%(), PSET
ELSEIF MAP%(x, y) = 10 THEN
    PUT (x * 20, y * 20), WATER%(), PSET
ELSEIF MAP%(x, y) = 11 THEN
    PUT (x * 20, y * 20), ROCK%(), PSET
ELSEIF MAP%(x, y) = 12 THEN
    PUT (x * 20, y * 20), WALL%(), PSET
ELSEIF MAP%(x, y) = 13 THEN
    PUT (x * 20, y * 20), BANKTILE%(), PSET
ELSEIF MAP%(x, y) = 14 THEN
    PUT (x * 20, y * 20), BHOUSE%(), PSET
ELSEIF MAP%(x, y) = 15 THEN
    PUT (x * 20, y * 20), RHOUSE%(), PSET
ELSEIF MAP%(x, y) = 16 THEN
    PUT (x * 20, y * 20), GHOUSE%(), PSET
ELSEIF MAP%(x, y) = 17 THEN
    PUT (x * 20, y * 20), BSTOP%(), PSET
ELSEIF MAP%(x, y) = 18 THEN
    PUT (x * 20, y * 20), HROAD%(), PSET
ELSEIF MAP%(x, y) = 19 THEN
    PUT (x * 20, y * 20), ROAD%(), PSET
ELSEIF MAP%(x, y) = 20 THEN
    PUT (x * 20, y * 20), IROAD%(), PSET

END IF
END SUB

SUB ENDING

LOCATE 22, 2
PRINT "                                     "

LOCATE 23, 2
PRINT "                                     "

LOCATE 22, 2
PRINT "Holy shit, "; NAME$; "!!             "

LOCATE 23, 2
PRINT "You made"; INT(MONEY); "bucks!!      "

DO
    A$ = INKEY$
LOOP WHILE A$ = ""

LOCATE 22, 2
PRINT "                                     "

LOCATE 23, 2
PRINT "                                     "

LOCATE 22, 2
PRINT "Fuck drugs, you movin' to the        "

LOCATE 23, 2
PRINT "islands!!                            "

DO
    A$ = INKEY$
LOOP WHILE A$ = ""

CLS

SCREEN 12
IF SKNC = 12 THEN HC = 6
IF SKNC = 6 THEN HC = 0
PAINT (1, 1), 11
CIRCLE (160, 50), 50, 14
LINE (0, 390)-(640, 390), 14
PAINT (160, 40), 14
LINE (400, 50)-(405, 55), 0
LINE (405, 55)-(410, 50), 0
LINE (430, 30)-(435, 35), 0
LINE (435, 35)-(440, 30), 0
LINE (370, 30)-(375, 35), 0
LINE (375, 35)-(380, 30), 0
LINE (0, 200)-(420, 200), 9
LINE (420, 200)-(0, 300), 9
PAINT (0, 210), 9
LINE (421, 201)-(0, 301), 14
LINE (420, 200)-(640, 200), 14
PAINT (430, 210), 14
LINE (500, 320)-(518, 380), PC, BF
LINE (490, 378)-(518, 388), 15, BF
LINE (490, 386)-(518, 388), 7, BF
LINE (500, 260)-(518, 320), JC, BF
LINE (505, 310)-(515, 315), SKNC, BF
LINE (505, 310)-(515, 315), 0, B
LINE (505, 310)-(505, 270), 0
LINE (515, 310)-(515, 270), 0
LINE (503, 259)-(517, 255), SKNC, BF
LINE (500, 255)-(518, 235), SKNC, BF
LINE (500, 235)-(518, 238), HC, BF
LINE (514, 238)-(518, 255), HC, BF
LINE (501, 242)-(503, 244), 15, BF
PSET (501, 243), 1
LINE (514, 245)-(515, 247), SKNC, BF
LINE (500, 252)-(504, 252), 0
LINE (600, 160)-(640, 210), 6, BF
LINE (590, 165)-(640, 143), 6
PAINT (630, 155), 6
LINE (602, 170)-(612, 180), 0, BF
LINE (622, 175)-(638, 210), 0, BF
LINE (0, 390)-(640, 400), 15, BF
LINE (10, 400)-(640, 400), 0
LINE (0, 390)-(10, 480), 15, BF
LINE (10, 400)-(10, 470), 0
LINE (630, 390)-(640, 480), 15, BF
LINE (630, 400)-(630, 470), 0
LINE (0, 470)-(640, 480), 15, BF
LINE (10, 470)-(630, 470), 0
PAINT (12, 412), 0
LOCATE 26, 4
PRINT "Ahh, this is the life, "; NAME$; "!!"
LOCATE 28, 4
PRINT "See you in the next game, bitch!"
DO
    A$ = INKEY$
LOOP WHILE A$ = ""
SCREEN 13
CLS
LINE (0, 0)-(320, 10), 7, BF
LINE (0, 0)-(10, 200), 7, BF
LINE (310, 0)-(320, 200), 7, BF
LINE (0, 190)-(320, 200), 7, BF
LOCATE 12, 9
PRINT "To get Passcodes, go to:"
LOCATE 14, 10
PRINT "pub55.ezboard.com/brgc"
DO
    A$ = INKEY$
LOOP WHILE A$ = ""
CLS
GAMEOVER
END SUB

SUB GAMEOVER
CLS
SCREEN 9, 0, 1, 0
sx2% = 515
sx% = -20
FOR C = 1 TO 45
    sx% = sx% + 4
    sx2% = sx2% - 4
    CLS
    CALL NeatFont("Game", sx%, 140, 15, 9, 5)
    CALL NeatFont("Over", sx2%, 140, 15, 9, 5)
    PCOPY 1, 0
NEXT C
DO
    A$ = INKEY$
LOOP WHILE A$ = ""
GOVER = 1
QUIT = 1
END SUB

SUB LEVEL0
START0:

FOR y = 0 TO 7
    FOR x = 0 TO 15
        IF MAP%(x, y) = 0 THEN
            PUT (x * 20, y * 20), GRASS%(), PSET
        ELSEIF MAP%(x, y) = 1 THEN
            PUT (x * 20, y * 20), FOREST%(), PSET
        ELSEIF MAP%(x, y) = 2 THEN
            PUT (x * 20, y * 20), DESERT%(), PSET
        ELSEIF MAP%(x, y) = 3 THEN
            PUT (x * 20, y * 20), ROAD%(), PSET
        ELSEIF MAP%(x, y) = 4 THEN
            PUT (x * 20, y * 20), IROAD%(), PSET
        ELSEIF MAP%(x, y) = 5 THEN
            PUT (x * 20, y * 20), BRIDGE%(), PSET
        ELSEIF MAP%(x, y) = 6 THEN
            PUT (x * 20, y * 20), HROAD%(), PSET
        ELSEIF MAP%(x, y) = 10 THEN
            PUT (x * 20, y * 20), WATER%(), PSET
        ELSEIF MAP%(x, y) = 11 THEN
            PUT (x * 20, y * 20), ROCK%(), PSET
        ELSEIF MAP%(x, y) = 12 THEN
            PUT (x * 20, y * 20), WALL%(), PSET
        ELSEIF MAP%(x, y) = 13 THEN
            PUT (x * 20, y * 20), BANKTILE%(), PSET
        ELSEIF MAP%(x, y) = 14 THEN
            PUT (x * 20, y * 20), BHOUSE%(), PSET
        ELSEIF MAP%(x, y) = 15 THEN
            PUT (x * 20, y * 20), RHOUSE%(), PSET
        ELSEIF MAP%(x, y) = 16 THEN
            PUT (x * 20, y * 20), GHOUSE%(), PSET
        ELSEIF MAP%(x, y) = 17 THEN
            PUT (x * 20, y * 20), BSTOP%(), PSET
        ELSEIF MAP%(x, y) = 18 THEN
            PUT (x * 20, y * 20), HROAD%(), PSET
        ELSEIF MAP%(x, y) = 19 THEN
            PUT (x * 20, y * 20), ROAD%(), PSET
        ELSEIF MAP%(x, y) = 20 THEN
            PUT (x * 20, y * 20), IROAD%(), PSET

        END IF
    NEXT x
NEXT y


MOVED = 1

DO

    A$ = INKEY$

    IF A$ = CHR$(0) + CHR$(77) AND MAP%(PlayerX% + 1, PlayerY%) < 10 THEN
        DRAWBACKGROUND
        PlayerX% = PlayerX% + 1
        MOVED = 1
    END IF

    IF A$ = CHR$(0) + CHR$(75) AND MAP%(PlayerX% - 1, PlayerY%) < 10 THEN
        DRAWBACKGROUND
        PlayerX% = PlayerX% - 1
        MOVED = 1
    END IF

    IF A$ = CHR$(0) + CHR$(80) AND MAP%(PlayerX%, PlayerY% + 1) < 10 THEN
        DRAWBACKGROUND
        PlayerY% = PlayerY% + 1
        MOVED = 1
    END IF


    IF A$ = CHR$(0) + CHR$(72) AND BPROX = 1 THEN BUS: GOTO DONE0
    IF A$ = CHR$(0) + CHR$(72) AND BANKPROX = 1 THEN BANK: GOTO START0

    IF A$ = CHR$(0) + CHR$(72) AND MAP%(PlayerX%, PlayerY% - 1) < 10 THEN
        DRAWBACKGROUND
        PlayerY% = PlayerY% - 1
        MOVED = 1
    END IF

    COMMANDS

    IF C = 1 THEN C = 0: GOTO START0

    IF MOVED = 1 THEN
        x% = PlayerX% * 21
        y% = PlayerY% * 21

        LINE (x%, y% + 7)-(x%, y% + 8), SKNC
        LINE (x% - 1, y% + 8)-(x% + 1, y% + 8), JC
        PSET (x%, y% + 8), SC
        PSET (x%, y% + 9), PC
        PSET (x% + 1, y% + 10), PC
        PSET (x% - 1, y% + 10), PC

        PEOPLE

        IF DIF = 1 AND MONEY >= 2000000 THEN LEVEL = 99
        IF DIF = 2 AND MONEY >= 4000000 THEN LEVEL = 99
        IF DIF = 3 AND MONEY >= 6000000 THEN LEVEL = 99
        IF LEVEL = 99 THEN GOTO DONE0

        MOVED = 0
    END IF
LOOP UNTIL QUIT = 1

DONE0:
END SUB

SUB MAPLEVEL








END SUB

SUB NeatFont (txt$, sx%, sy%, clr%, sty%, size%)

lnh% = LEN(txt$)
IF sx% = -1 THEN sx% = (640 - ((lnh% * 8) * size%)) / 2
sx2% = sx%: l% = lnh% * 8
COLOR 8: LOCATE 1, 1: PRINT txt$

FOR y% = 0 TO 15
    FOR x% = 0 TO l%
        IF POINT(x%, y%) <> 0 THEN
            IF sty% = 1 THEN LINE (sx2% - size%, sy% - size%)-(sx2%, sy%), clr%, BF
            IF sty% = 2 THEN LINE (sx2% - size%, sy% - size%)-(sx2%, sy%), clr%, B
            IF sty% = 3 THEN CIRCLE (sx2% - (size% / 2), sy% - (size% / 2)), size% / 2, clr%
            IF sty% = 4 THEN
                CIRCLE (sx2% - (size% / 2), sy% - (size% / 2)), size% / 2, clr%
                PAINT (sx2% - (size% / 2), sy% - (size% / 2)), clr%
            END IF
            IF sty% = 5 THEN PSET (sx2% - (size% / 2), sy% - (size% / 2)), clr%
            IF sty% = 6 OR sty% = 7 THEN
                LINE (sx2% - (size% / 2), sy% - size%)-(sx2% - size%, sy%), clr%
                LINE (sx2% - (size% / 2), sy% - size%)-(sx2%, sy%), clr%
                LINE (sx2% - size%, sy%)-(sx2%, sy%), clr%
            END IF
            IF sty% = 7 THEN PAINT (sx2% - (size% / 2), sy% - (size% / 2)), clr%
            IF sty% = 8 THEN LINE (sx2%, sy% - size%)-(sx2% - size%, sy%), clr%

            IF sty% = 9 THEN LINE (sx2% - size%, sy% - size%)-(sx2%, sy%), clr%
        END IF
        sx2% = sx2% + size%
    NEXT x%
    sy% = sy% + size%: sx2% = sx%
NEXT y%
LOCATE 1, 1: COLOR 0: PRINT txt$



END SUB

SUB PEOPLE


IF LEVEL = 0 THEN P1X = 278: P1Y = 28
IF LEVEL = 1 THEN P1X = 21: P1Y = 126
IF LEVEL = 2 THEN P1X = 294: P1Y = 126
IF LEVEL = 3 THEN P1X = 273: P1Y = 42
IF LEVEL = 4 THEN P1X = 42: P1Y = 126
IF LEVEL = 5 THEN P1X = 21: P1Y = 21
IF LEVEL = 6 THEN P1X = 42: P1Y = 42
IF LEVEL = 7 THEN P1X = 147: P1Y = 21


IF LEVEL = 0 THEN P2X = 126: P2Y = 21
IF LEVEL = 1 THEN P2X = 231: P2Y = 21
IF LEVEL = 2 THEN P2X = 21: P2Y = 63
IF LEVEL = 3 THEN P2X = 147: P2Y = 21
IF LEVEL = 4 THEN P2X = 126: P2Y = 63
IF LEVEL = 5 THEN P2X = 105: P2Y = 84
IF LEVEL = 6 THEN P2X = 147: P2Y = 84
IF LEVEL = 7 THEN P2X = 168: P2Y = 105


IF LEVEL = 0 THEN P3X = 42: P3Y = 126
IF LEVEL = 1 THEN P3X = 294: P3Y = 126
IF LEVEL = 2 THEN P3X = 189: P3Y = 63
IF LEVEL = 3 THEN P3X = 21: P3Y = 84
IF LEVEL = 4 THEN P3X = 21: P3Y = 21
IF LEVEL = 5 THEN P3X = 294: P3Y = 126
IF LEVEL = 6 THEN P3X = 294: P3Y = 63
IF LEVEL = 7 THEN P3X = 273: P3Y = 126


IF LEVEL = 0 THEN P4X = 294: P4Y = 105
IF LEVEL = 1 THEN P4X = 42: P4Y = 42
IF LEVEL = 2 THEN P4X = 147: P4Y = 21
IF LEVEL = 3 THEN P4X = 168: P4Y = 126
IF LEVEL = 4 THEN P4X = 294: P4Y = 105
IF LEVEL = 5 THEN P4X = 231: P4Y = 21
IF LEVEL = 6 THEN P4X = 252: P4Y = 126
IF LEVEL = 7 THEN P4X = 294: P4Y = 63


IF LEVEL = 0 THEN dx = 21: DY = 42
IF LEVEL = 1 THEN dx = -10: DY = -10
IF LEVEL = 2 THEN dx = 294: DY = 21
IF LEVEL = 3 THEN dx = 21: DY = 126
IF LEVEL = 4 THEN dx = 168: DY = 21
IF LEVEL = 5 THEN dx = 21: DY = 126
IF LEVEL = 6 THEN dx = -10: DY = -10
IF LEVEL = 7 THEN dx = -10: DY = -10


PSET (P1X, P1Y), 6
PSET (P1X, P1Y + 1), 6
PSET (P1X - 1, P1Y + 1), 6
PSET (P1X + 1, P1Y + 1), 6
PSET (P1X, P1Y + 2), 15
PSET (P1X - 1, P1Y + 3), 15
PSET (P1X + 1, P1Y + 3), 15


PSET (P2X, P2Y), 6
PSET (P2X, P2Y + 1), 7
PSET (P2X - 1, P2Y + 1), 7
PSET (P2X + 1, P2Y + 1), 7
PSET (P2X, P2Y + 2), 14
PSET (P2X - 1, P2Y + 3), 14
PSET (P2X + 1, P2Y + 3), 14


PSET (P3X, P3Y), 12
PSET (P3X, P3Y + 1), 1
PSET (P3X - 1, P3Y + 1), 1
PSET (P3X + 1, P3Y + 1), 1
PSET (P3X, P3Y + 2), 15
PSET (P3X - 1, P3Y + 3), 15
PSET (P3X + 1, P3Y + 3), 15


PSET (P4X, P4Y), 6
PSET (P4X, P4Y + 1), 2
PSET (P4X - 1, P4Y + 1), 2
PSET (P4X + 1, P4Y + 1), 2
PSET (P4X, P4Y + 2), 11
PSET (P4X - 1, P4Y + 3), 11
PSET (P4X + 1, P4Y + 3), 11


PSET (dx, DY), 6
PSET (dx, DY + 1), 4
PSET (dx - 1, DY + 1), 6
PSET (dx + 1, DY + 1), 6
PSET (dx, DY + 2), 9
PSET (dx - 1, DY + 3), 9
PSET (dx + 1, DY + 3), 9


IF LEVEL = 0 AND x% = 273 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 0 AND x% = 126 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 0 AND x% = 42 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 0 AND x% = 294 AND y% = 105 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN




IF LEVEL = 1 AND x% = 21 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 1 AND x% = 231 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 1 AND x% = 294 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 1 AND x% = 42 AND y% = 42 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN



IF LEVEL = 2 AND x% = 294 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 2 AND x% = 21 AND y% = 63 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 2 AND x% = 189 AND y% = 63 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 2 AND x% = 147 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN

IF LEVEL = 3 AND x% = 273 AND y% = 42 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 3 AND x% = 147 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 3 AND x% = 21 AND y% = 84 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 3 AND x% = 168 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN

IF LEVEL = 4 AND x% = 42 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 4 AND x% = 126 AND y% = 63 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 4 AND x% = 21 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 4 AND x% = 294 AND y% = 105 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN

IF LEVEL = 5 AND x% = 21 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 5 AND x% = 105 AND y% = 84 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 5 AND x% = 294 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 5 AND x% = 231 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN

IF LEVEL = 6 AND x% = 42 AND y% = 42 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 6 AND x% = 147 AND y% = 84 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 6 AND x% = 294 AND y% = 63 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 6 AND x% = 252 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN

IF LEVEL = 7 AND x% = 147 AND y% = 21 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 7 AND x% = 168 AND y% = 105 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 7 AND x% = 273 AND y% = 126 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN
IF LEVEL = 7 AND x% = 294 AND y% = 63 THEN PROX = 1 ELSE PROX = 0
IF PROX = 1 THEN GOTO FIN

IF LEVEL = 0 AND x% = 21 AND y% = 42 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 1 AND x% = -10 AND y% = -10 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 2 AND x% = 294 AND y% = 21 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 3 AND x% = 21 AND y% = 126 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 4 AND x% = 168 AND y% = 21 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 5 AND x% = 21 AND y% = 126 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 6 AND x% = -10 AND y% = -10 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN
IF LEVEL = 7 AND x% = -10 AND y% = -10 THEN DPROX = 1 ELSE DPROX = 0
IF DPROX = 1 THEN GOTO FIN


FIN:

END SUB

' New functions start here

' Return game variables to default
SUB LOADDEFAULTS
LEVEL = 0
PlayerX% = 7
PlayerY% = 6
BALANCE = 0
IF DIF = 0 THEN DIF = 1
IF DIF = 1 THEN MONEY = 5000
IF DIF = 2 THEN MONEY = 2500
IF DIF = 3 THEN MONEY = 500
POT = 0
ECSTACY = 0
CRACK = 0
ACID = 0
COKE = 0
HASH = 0
HEROIN = 0
MUSHROOMS = 0
END SUB

' Function to load a saved game
SUB LOADGAME
IF _FILEEXISTS(savefile$) THEN
    OPEN savefile$ FOR INPUT AS #1
    INPUT #1, LEVEL
    INPUT #1, PlayerX%
    INPUT #1, PlayerY%
    INPUT #1, NAME$
    INPUT #1, MONEY
    INPUT #1, BALANCE
    INPUT #1, DIF
    INPUT #1, POT
    INPUT #1, ECSTACY
    INPUT #1, CRACK
    INPUT #1, ACID
    INPUT #1, COKE
    INPUT #1, HASH
    INPUT #1, HEROIN
    INPUT #1, MUSHROOMS
    CLOSE #1
END IF
END SUB

' Function to save game
SUB SAVEGAME
IF _FILEEXISTS(savefile$) THEN
    OPEN savefile$ FOR OUTPUT AS #1
    WRITE #1, LEVEL
    WRITE #1, PlayerX%
    WRITE #1, PlayerY%
    WRITE #1, NAME$
    WRITE #1, MONEY
    WRITE #1, BALANCE
    WRITE #1, DIF
    WRITE #1, POT
    WRITE #1, ECSTACY
    WRITE #1, CRACK
    WRITE #1, ACID
    WRITE #1, COKE
    WRITE #1, HASH
    WRITE #1, HEROIN
    WRITE #1, MUSHROOMS
    CLOSE #1
END IF
END SUB

' Draw text for main menu
SUB DRAW_MAIN_MENU (SELECTION)
IF SELECTION = 0 THEN
    ' Start
    LOCATE 12, 30
    COLOR &HFFFFF933
    PRINT "Start Game"
    LOCATE 14, 20
    COLOR &HFFFCFCFC
    PRINT "Options"
    LOCATE 16, 20
    PRINT "Quit"
ELSEIF SELECTION = 1 THEN
    ' Options
    LOCATE 12, 20
    COLOR &HFFFCFCFC
    PRINT "Start Game"
    LOCATE 14, 30
    COLOR &HFFFFF933
    PRINT "Options"
    LOCATE 16, 20
    COLOR &HFFFCFCFC
    PRINT "Quit"
ELSEIF SELECTION = 2 THEN
    ' Quit
    LOCATE 12, 20
    COLOR &HFFFCFCFC
    PRINT "Start Game"
    LOCATE 14, 20
    PRINT "Options"
    LOCATE 16, 30
    COLOR &HFFFFF933
    PRINT "Quit"
END IF
END SUB

SUB DRAW_OPTIONS_MENU (SELECTION)
IF SELECTION = 0 THEN
    LOCATE 10, 260
    COLOR &HFFFFF933
    PRINT "Difficulty"
    LOCATE 12, 250
    COLOR &HFFFCFCFC
    PRINT "Cheats"
    LOCATE 14, 250
    PRINT "Credits"
    LOCATE 16, 250
    PRINT "Display"
    LOCATE 18, 250
    PRINT "Back"
ELSEIF SELECTION = 1 THEN
    LOCATE 10, 250
    COLOR &HFFFCFCFC
    PRINT "Difficulty"
    LOCATE 12, 260
    COLOR &HFFFFF933
    PRINT "Cheats"
    LOCATE 14, 250
    COLOR &HFFFCFCFC
    PRINT "Credits"
    LOCATE 16, 250
    PRINT "Display"
    LOCATE 18, 250
    PRINT "Back"
ELSEIF SELECTION = 2 THEN
    LOCATE 10, 250
    COLOR &HFFFCFCFC
    PRINT "Difficulty"
    LOCATE 12, 250
    PRINT "Cheats"
    LOCATE 14, 260
    COLOR &HFFFFF933
    PRINT "Credits"
    LOCATE 16, 250
    COLOR &HFFFCFCFC
    PRINT "Display"
    LOCATE 18, 250
    PRINT "Back"
ELSEIF SELECTION = 3 THEN
    LOCATE 10, 250
    COLOR &HFFFCFCFC
    PRINT "Difficulty"
    LOCATE 12, 250
    PRINT "Cheats"
    LOCATE 14, 250
    PRINT "Credits"
    LOCATE 16, 260
    COLOR &HFFFFF933
    PRINT "Display"
    LOCATE 18, 250
    COLOR &HFFFCFCFC
    PRINT "Back"
ELSEIF SELECTION = 4 THEN
    LOCATE 10, 250
    COLOR &HFFFCFCFC
    PRINT "Difficulty"
    LOCATE 12, 250
    PRINT "Cheats"
    LOCATE 14, 250
    PRINT "Credits"
    LOCATE 16, 250
    PRINT "Display"
    LOCATE 18, 260
    COLOR &HFFFFF933
    PRINT "Back"
END IF
END SUB




