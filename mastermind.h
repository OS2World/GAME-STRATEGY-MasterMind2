/* Strukturen */
typedef struct _CNRITEM               // CONTAINER RECORD STRUCTURE
{
  MINIRECORDCORE rc;                  // Base information
  ULONG          Rank;                // Rank of item in highscore
  ULONG          Tries;               // Number of tries needed
  PSZ            pszName;             // Pointer to name
  PSZ            pszTime;             // Pointer to time
  CHAR           szTime[6 + 1];       // time
} CNRITEM, *PCNRITEM;

#define EXTRA_RECORD_BYTES (sizeof( CNRITEM ) - sizeof( MINIRECORDCORE ))

typedef struct _Hscr {
         char Name[100];
         int  Minutes;
         int  Seconds;
         int  Tries;
         struct _Hscr* Next;
         struct _Hscr* Prev;
         } Hscr;

typedef struct _HscrBuffer {
         char Name[100];
         int  Minutes;
         int  Seconds;
         int  Tries;
         } HscrBuffer;

typedef struct _DllList {
         char Filename[50+256];
         char Language[50];
         struct _DllList* Next;
         struct _DllList* Prev;
         } DllList;


/* Standardfunktionen fÅr PM-Programmierung */
MRESULT EXPENTRY Fensterhauptfunktion(HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
VOID ControlProg(HWND hwnd,ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY ProdInfoDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY HighscoreDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY QueryNameDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT EXPENTRY PinSelectionDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
void InitHelp(HWND hwnd);
VOID DestroyHelpInstance(VOID);

/* Zeichenfunktionen */
int DrawBitmap(HPS hps, int BitmapID, int height, int width, int posx, int posy);
int Draw3DBox(HPS hps, int posx, int posy, int width, int height, COLOR lBackground, int iFillmode);
int DrawColors(HPS hps, int BitmapID, int column, int row);
int DrawMasterColors(HPS hps);
int DrawGuessedColors(HPS hps);
int DrawRowNumbers(HPS hps);
int DrawActualMarks(HPS hps, int all);
int DrawFutureMarks(HPS hps);
int DrawPins(HPS hps);
int DrawTime(HPS hps);
void clearPin(HPS hps, short pos);
void clearDoubleColor(HPS hps, short pos);

/* Mastermindfunktionen */
void CreateColors(void);
int CheckColors(HPS hps, HWND hwnd);
void Loose(HWND hwnd);
void Win(HWND hwnd);
Hscr* Eintragen(Hscr* NextPos, Hscr* PrevPos, Hscr* Anchor, int Pos, HWND hwnd);

/* Hilfsfunktionen */
void init(void);
FIXED MakeFixed(int a, int b);
Hscr* ReadHighscore(void);
void FreeHighscore(Hscr* Highscore);
void WriteHighscore(Hscr* Highscore);
void ReadSettings(void);
void WriteSettings(void);
void error(char *text, int close);
void SetSystemMenu(HWND hwnd);
int GetLanguageDlls(void);
PSZ GetModuleName(void);
void clearup(void);
void SetLanguageMenu(HWND hwndMenu);
void FillContainer(HWND hwnd, Hscr *Highscore, char *triesTitle, char* nameTitle, char *rankTitle, char *timeTitle);


