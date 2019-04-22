#ifndef FALSE
#define FALSE          0
#endif
#ifndef TRUE
#define TRUE          !FALSE
#endif

#define INITIALWIDTH        500             // Fenstergrî·e
#define INITIALHEIGHT       600

#define MSTM_FILL             0
#define MSTM_NOFILL           1

#define MARKRADIUS          8               // Radii fÅr Markierungskreise
#define DROPMARKRADIUS      8

#define TITLELENGTH         50              // LÑnge der Titel fÅr Highscore

#define ID_MAIN 1                           // Fenster

#define DLG_MSGBOX    5

#define DLG_PINSELECTION  10
#define IDT_SELECTPIN1    11

#define DLG_ABOUT     20
#define IDB_LOGO      21
#define IDT_ABOUT1    22
#define IDT_ABOUT2    23
#define IDT_ABOUT3    24
#define IDT_ABOUT4    25
#define IDT_ABOUT5    26
#define IDT_ABOUT6    27
#define IDT_ABOUT7    28

#define DLG_HIGHSCORE 30
#define IDT_HIGHSCORETITLES    31
#define ID_LISTBOX    32

#define DLG_QUERYNAME  40
#define IDT_QNT1      41
#define IDT_QNT2      42
#define IDT_QNT3      43
#define IDT_QNT4      44
#define IDE_QN        45

#define COLOR_OFFSET  50                    // Bitmaps fÅr Farben
#define IDB_RED     50
#define IDB_GREEN   51
#define IDB_BLUE    52
#define IDB_YELLOW  53
#define IDB_CYAN    54
#define IDB_PINK    55
#define IDB_DARKRED 56
#define IDB_DARKGREEN 57
#define IDB_VIOLET  58
#define IDB_ORANGE  59
#define IDB_BLACK   60
#define IDB_WHITE   61

#define PIN_OFFSET    68                    // Bitmaps fÅr Signalpins
#define IDB_WHITEPIN  68
#define IDB_BLACKPIN  69
#define BOTHRIGHT     68
#define RIGHTPLACE    69

#define COLOR2PTR_OFFSET 20

#define PTR_OFFSET   70                     // Mauszeiger
#define COLOR_TO_POINTER_OFFSET 20
#define IDP_RED      70
#define IDP_GREEN    71
#define IDP_BLUE     72
#define IDP_YELLOW   73
#define IDP_CYAN     74
#define IDP_PINK     75
#define IDP_DARKRED  76
#define IDP_DARKGREEN 77
#define IDP_VIOLET   78
#define IDP_ORANGE   79
#define IDP_BLACK    80
#define IDP_WHITE    81

#define IDM_MASTERMIND 100                  // MenÅs
#define IDM_START      101
#define IDM_HIGHSCORE  102
#define IDM_PAUSE      103
#define IDM_CANCEL     104
#define IDM_MULTIPLE   105
#define IDM_PINSELECTION 106
#define IDM_SOUND      107
#define IDM_EXIT       110
#define IDM_SEPARATOR1 120
#define IDM_SEPARATOR2 121
#define IDM_SEPARATOR3 122
#define IDM_SEPARATOR4 123
#define IDM_SEPARATOR5 124
#define IDM_LANGUAGE   150

#define IDM_HELP       200
#define IDM_RULES      201
#define IDM_ABOUT      202
#define IDM_HOWTOPLAY  203
#define IDM_LICENSE    204
#define IDM_GENERALHELP 205
#define IDM_SOUNDSTATUS 206

#define IDPB_TAKEOVER   300                 // Pushbuttons

#define CID_HIGHSCORE   350                 // Container for Highscore

#define MASTERMIND_HELP_TABLE            398
#define SUBTABLE_MAIN                    399
#define PANEL_WELCOME                    400   // Helppanels
#define PANEL_RULES                      401
#define PANEL_HOWTOPLAY                  402
#define PANEL_MENUS                      403
#define PANEL_MENUMASTERMIND             404
#define PANEL_MENUSTART                  405
#define PANEL_MENUPAUSE                  406
#define PANEL_MENUCANCEL                 407
#define PANEL_MENUHIGHSCORE              408
#define PANEL_MENUMULTIPLE               409
#define PANEL_MENUEXIT                   410
#define PANEL_MENUHELP                   411
#define PANEL_MENURULES                  412
#define PANEL_MENUABOUT                  413
#define PANEL_LICENSE                    414
#define PANEL_MENUHOWTOPLAY              415
#define PANEL_MENULICENSE                416
#define PANEL_MENUGENERALHELP            417
#define PANEL_MENULANGUAGE               418
#define PANEL_MENUPINS                   419
#define PANEL_HOMEPAGE                   420

// Strings
#define IDS_TITLE                        500
#define IDS_STARTNEWGAME                 501
#define IDS_TIMERERROR                   502
#define IDS_NOTSTARTED                   503
#define IDS_GUESS                        504
#define IDS_AVAILABLE                    505
#define IDS_DROPHERE                     506
#define IDS_RIGHTCOLOR                   507
#define IDS_WRONGPLACE                   508
#define IDS_RIGHTPLACE                   509
#define IDS_GAMEPAUSED                   510
#define IDS_EXIT                         511
#define IDS_REALLYQUIT                   512
#define IDS_FIRSTTRY                     513
#define IDS_SECONDTRY                    514
#define IDS_THIRDTRY                     515
#define IDS_FOURTHTRY                    516
#define IDS_FIFTHTRY                     517
#define IDS_SIXTHTRY                     518
#define IDS_SEVENTHTRY                   519
#define IDS_EIGHTTHTRY                   520
#define IDS_NINETHTRY                    521
#define IDS_TENTHTRY                     522
#define IDS_START                        523
#define IDS_REALLYSTART                  524
#define IDS_CANCEL                       525
#define IDS_REALLYCANCEL                 526
#define IDS_PAUSE                        527
#define IDS_UNPAUSE                      528
#define IDS_NOHIGHSCORE                  529
#define IDS_OHNO                         530
#define IDS_MINUTESANDLOOSE              531
#define IDS_SECONDSTOWASTE               532
#define IDS_DAMN                         534
#define IDS_TIME                         535
#define IDS_YOUNEEDED                    536
#define IDS_TRIES                        537
#define IDS_MINUTESANDWIN                538
#define IDS_SECONDS                      539
#define IDS_THATSRANK                    540
#define IDS_OFTHEHIGHSCORES              541
#define IDS_YOUONLYNEEDED                542
#define IDS_MINUTESANDONE                543
#define IDS_SECONDSONE                   544
#define IDS_CASINO                       545
#define IDS_AFTERRANK                    546
#define IDS_OPENERROR                    547
#define IDS_ERRORTITLE                   548
#define IDS_HELPTITLE                    549
#define IDS_HELPERROR                    550
#define IDS_HELPERROR2                   551
#define IDS_WRITEINIERROR                552
#define IDS_OKBUTTON                     553
#define IDS_CANCELBUTTON                 554
#define IDS_HIGHSCORENAME                555
#define IDS_HIGHSCORERANK                556
#define IDS_HIGHSCORETIME                557
#define IDS_HIGHSCORETRIES               558

#define IDS_VERSION                      600
#define IDS_REVISION                     601

#define IDS_LANGUAGE                     610
