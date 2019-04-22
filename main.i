#line 14 "F:\IBMCPP\INCLUDE\OS2\os2.h"
#pragma info( none )

      #pragma info( none )

#pragma info( restore )
#line 20 "F:\IBMCPP\INCLUDE\OS2\os2def.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 69
typedef unsigned long  APIRET;
typedef unsigned short APIRET16;
typedef unsigned long  APIRET32;
#line 89
typedef unsigned short   SHANDLE;
typedef unsigned long    LHANDLE;
#line 105
typedef unsigned char  UCHAR;    
typedef unsigned short USHORT;   
typedef unsigned long  ULONG;    
#line 110
   typedef unsigned int UINT;    
#line 113
typedef UCHAR     * _Seg16 PUCHAR16;
typedef char      * _Seg16 PCHAR16;

typedef char BYTE;      

typedef char *PSZ;
typedef char *NPSZ;

typedef char *PCH;
typedef char *NPCH;
typedef const char *PCSZ;

typedef int ( _System _PFN)  ();
typedef _PFN    *PFN;
typedef int ( _System _NPFN)  ();
typedef _NPFN   *NPFN;
#line 131
typedef BYTE *PBYTE;
typedef BYTE *NPBYTE;

typedef char *PCHAR;
typedef short *PSHORT;
typedef long *PLONG;
#line 139
   typedef int *PINT;
#line 142
typedef UCHAR *PUCHAR;
typedef USHORT *PUSHORT;
typedef ULONG *PULONG;
#line 147
   typedef UINT *PUINT;
#line 150
typedef void   *PVOID;
typedef PVOID  *PPVOID;
typedef void   * _Seg16  PVOID16;

typedef unsigned long BOOL;      
typedef BOOL *PBOOL;

typedef unsigned short  BOOL16;
typedef BOOL16     * _Seg16 PBOOL16;
#line 167
typedef struct _QWORD           
{
   ULONG   ulLo;
   ULONG   ulHi;
} QWORD;
typedef QWORD *PQWORD;
#line 176
   typedef unsigned short SEL;      
   typedef SEL *PSEL;
#line 216
typedef ULONG ERRORID;   
typedef ERRORID *PERRORID;
#line 246
typedef LHANDLE HMODULE;         
typedef LHANDLE PID;             
typedef LHANDLE TID;             
#line 251
   typedef USHORT  SGID;         
#line 254
typedef HMODULE *PHMODULE;
typedef PID *PPID;
typedef TID *PTID;
#line 263
       typedef void *HSEM;       
       typedef HSEM *PHSEM;
#line 270
typedef LHANDLE   HAB;          
typedef HAB *PHAB;
#line 275
typedef LHANDLE   HPS;          
typedef HPS *PHPS;

typedef LHANDLE   HDC;          
typedef HDC *PHDC;

typedef LHANDLE   HRGN;         
typedef HRGN *PHRGN;

typedef LHANDLE   HBITMAP;      
typedef HBITMAP *PHBITMAP;

typedef LHANDLE   HMF;          
typedef HMF *PHMF;

typedef LHANDLE   HPAL;         
typedef HPAL *PHPAL;

typedef long     COLOR;         
typedef COLOR *PCOLOR;

typedef struct _POINTL          
{
   long  x;
   long  y;
} POINTL;
typedef POINTL *PPOINTL;
typedef POINTL *NPPOINTL;

typedef struct _POINTS          
{
   short x;
   short y;
} POINTS;
typedef POINTS *PPOINTS;

typedef struct _RECTL           
{
   long  xLeft;
   long  yBottom;
   long  xRight;
   long  yTop;
} RECTL;
typedef RECTL *PRECTL;
typedef RECTL *NPRECTL;

typedef char STR8[8];           
typedef STR8 *PSTR8;
#line 328
typedef struct _DRIVDATA        
{
   long    cb;
   long    lVersion;
   char    szDeviceName[32];
   char    abGeneralData[1];
} DRIVDATA;
typedef DRIVDATA *PDRIVDATA;
#line 339
typedef PSZ *PDEVOPENDATA;
#line 356
   typedef struct _DEVOPENSTRUC       
   {
      PSZ        pszLogAddress;
      PSZ        pszDriverName;
      PDRIVDATA  pdriv;
      PSZ        pszDataType;
      PSZ        pszComment;
      PSZ        pszQueueProcName;
      PSZ        pszQueueProcParams;
      PSZ        pszSpoolerParams;
      PSZ        pszNetworkParams;
   } DEVOPENSTRUC;
   typedef DEVOPENSTRUC *PDEVOPENSTRUC;
#line 373
typedef struct _PRINTDEST      
{
   ULONG        cb;
   long         lType;
   PSZ          pszToken;
   long         lCount;
   PDEVOPENDATA pdopData;
   ULONG        fl;
   PSZ          pszPrinter;
} PRINTDEST;
typedef PRINTDEST *PPRINTDEST;
#line 412
typedef struct _FATTRS             
{
   USHORT  usRecordLength;
   USHORT  fsSelection;
   long    lMatch;
   char    szFacename[32];
   USHORT  idRegistry;
   USHORT  usCodePage;
   long    lMaxBaselineExt;
   long    lAveCharWidth;
   USHORT  fsType;
   USHORT  fsFontUse;
} FATTRS;
typedef FATTRS *PFATTRS;
#line 477
typedef struct _PANOSE    
{
   BYTE    bFamilyType;
   BYTE    bSerifStyle;
   BYTE    bWeight;
   BYTE    bProportion;
   BYTE    bContrast;
   BYTE    bStrokeVariation;
   BYTE    bArmStyle;
   BYTE    bLetterform;
   BYTE    bMidline;
   BYTE    bXHeight;
   BYTE    fbPassedISO;
   BYTE    fbFailedISO;
} PANOSE;

typedef struct _FONTMETRICS      
{
   char    szFamilyname[32];
   char    szFacename[32];
   USHORT  idRegistry;
   USHORT  usCodePage;
   long    lEmHeight;
   long    lXHeight;
   long    lMaxAscender;
   long    lMaxDescender;
   long    lLowerCaseAscent;
   long    lLowerCaseDescent;
   long    lInternalLeading;
   long    lExternalLeading;
   long    lAveCharWidth;
   long    lMaxCharInc;
   long    lEmInc;
   long    lMaxBaselineExt;
   short   sCharSlope;
   short   sInlineDir;
   short   sCharRot;
   USHORT  usWeightClass;
   USHORT  usWidthClass;
   short   sXDeviceRes;
   short   sYDeviceRes;
   short   sFirstChar;
   short   sLastChar;
   short   sDefaultChar;
   short   sBreakChar;
   short   sNominalPointSize;
   short   sMinimumPointSize;
   short   sMaximumPointSize;
   USHORT  fsType;
   USHORT  fsDefn;
   USHORT  fsSelection;
   USHORT  fsCapabilities;
   long    lSubscriptXSize;
   long    lSubscriptYSize;
   long    lSubscriptXOffset;
   long    lSubscriptYOffset;
   long    lSuperscriptXSize;
   long    lSuperscriptYSize;
   long    lSuperscriptXOffset;
   long    lSuperscriptYOffset;
   long    lUnderscoreSize;
   long    lUnderscorePosition;
   long    lStrikeoutSize;
   long    lStrikeoutPosition;
   short   sKerningPairs;
   short   sFamilyClass;
   long    lMatch;
   long    FamilyNameAtom;
   long    FaceNameAtom;
   PANOSE  panose;
} FONTMETRICS;
typedef FONTMETRICS *PFONTMETRICS;
#line 552
typedef LHANDLE HWND;       
typedef HWND *PHWND;

typedef LHANDLE HMQ;        
typedef LHANDLE *PHMQ;
#line 568
typedef struct _ICONINFO {   
   ULONG   cb;                   
   ULONG   fFormat;
   PSZ     pszFileName;          
   HMODULE hmod;                 
   ULONG   resid;                
   ULONG   cbIconData;           
   PVOID   pIconData;            
} ICONINFO;
typedef ICONINFO  *PICONINFO;
#line 590
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 24 "F:\IBMCPP\INCLUDE\OS2\bse.h"
#pragma info( none )

      #pragma info( none )

#pragma info( restore )
#line 49 "F:\IBMCPP\INCLUDE\OS2\bsedos.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 94
   APIRET _System DosBeep(ULONG freq,
                           ULONG dur);
#line 98
   void _System DosExit(ULONG action,
                         ULONG result);
#line 14 "F:\IBMCPP\INCLUDE\OS2\bsetib.h"
#pragma info( none )

      #pragma info( none )

#pragma info( restore )
#line 33
struct tib2_s
       {
       ULONG   tib2_ultid;              
       ULONG   tib2_ulpri;              
       ULONG   tib2_version;            
       USHORT  tib2_usMCCount;          
       USHORT  tib2_fMCForceFlag;       
       };

typedef struct tib2_s TIB2;
typedef struct tib2_s *PTIB2;

struct tib_s                            
       {
        PVOID   tib_pexchain;            
        PVOID   tib_pstack;              
        PVOID   tib_pstacklimit;         
        PTIB2   tib_ptib2;               
        ULONG   tib_version;             
        ULONG   tib_ordinal;             
       };
#line 56
typedef struct tib_s    tib_t;
typedef struct tib_s    TIB;
typedef struct tib_s    *PTIB;
#line 66
struct pib_s {                          
       ULONG   pib_ulpid;               
       ULONG   pib_ulppid;              
       ULONG   pib_hmte;                
       PCHAR   pib_pchcmd;              
       PCHAR   pib_pchenv;              
       ULONG   pib_flstatus;            
       ULONG   pib_ultype;              
       };
#line 77
typedef struct pib_s    pib_t;
typedef struct pib_s    PIB;
typedef struct pib_s    *PPIB;
#line 87
#pragma info( none )

      #pragma info( restore )

#pragma info( restore )
#line 114 "F:\IBMCPP\INCLUDE\OS2\bsedos.h"
   typedef  void _System FNTHREAD(ULONG);
   typedef FNTHREAD *PFNTHREAD;

   APIRET _System DosCreateThread(PTID ptid,
                                   PFNTHREAD pfn,
                                   ULONG param,
                                   ULONG flag,
                                   ULONG cbStack);

   APIRET _System DosResumeThread(TID tid);

   APIRET _System DosSuspendThread(TID tid);

   APIRET _System DosGetInfoBlocks(PTIB *pptib,
                                    PPIB *pppib);

   APIRET _System DosKillThread(TID tid);

   APIRET _System DosAllocThreadLocalMemory(ULONG cb, PULONG *p);

   APIRET _System DosFreeThreadLocalMemory(ULONG *p);
#line 153
   typedef struct _RESULTCODES        
   {
      ULONG codeTerminate;
      ULONG codeResult;
   } RESULTCODES;
   typedef RESULTCODES *PRESULTCODES;

   APIRET _System DosWaitChild(ULONG action,
                                ULONG option,
                                PRESULTCODES pres,
                                PPID ppid,
                                PID pid);

   APIRET _System DosWaitThread(PTID ptid,
                                 ULONG option);

   APIRET _System DosSleep(ULONG msec);
#line 184
typedef struct _uDB {            
        unsigned long   Pid;             
        unsigned long   Tid;             
        long            Cmd;             
        long            Value;           
        unsigned long   Addr;            
        unsigned long   Buffer;          
        unsigned long   Len;             
        unsigned long   Index;           
        unsigned long   MTE;             
        unsigned long   EAX;             
        unsigned long   ECX;
        unsigned long   EDX;
        unsigned long   EBX;
        unsigned long   ESP;
        unsigned long   EBP;
        unsigned long   ESI;
        unsigned long   EDI;
        unsigned long   EFlags;
        unsigned long   EIP;
        unsigned long   CSLim;
        unsigned long   CSBase;
        unsigned char   CSAcc;
        unsigned char   CSAtr;
        unsigned short  CS;
        unsigned long   DSLim;
        unsigned long   DSBase;
        unsigned char   DSAcc;
        unsigned char   DSAtr;
        unsigned short  DS;
        unsigned long   ESLim;
        unsigned long   ESBase;
        unsigned char   ESAcc;
        unsigned char   ESAtr;
        unsigned short  ES;
        unsigned long   FSLim;
        unsigned long   FSBase;
        unsigned char   FSAcc;
        unsigned char   FSAtr;
        unsigned short  FS;
        unsigned long   GSLim;
        unsigned long   GSBase;
        unsigned char   GSAcc;
        unsigned char   GSAtr;
        unsigned short  GS;
        unsigned long   SSLim;
        unsigned long   SSBase;
        unsigned char   SSAcc;
        unsigned char   SSAtr;
        unsigned short  SS;
} uDB_t;
#line 332
typedef struct _TStat {          
        unsigned char   DbgState;        
        unsigned char   TState;          
        unsigned short  TPriority;       
} TStat_t;
#line 461
   APIRET _System DosDebug(PVOID pdbgbuf);
#line 472
   typedef void _System FNEXITLIST(ULONG);
   typedef FNEXITLIST *PFNEXITLIST;

   APIRET _System DosEnterCritSec(void);

   APIRET _System DosExitCritSec(void);

   APIRET _System DosExitList(ULONG ordercode,
                               PFNEXITLIST pfn);
#line 497
   APIRET _System DosExecPgm(PCHAR pObjname,
                              long cbObjname,
                              ULONG execFlag,
                              PSZ pArg,
                              PSZ pEnv,
                              PRESULTCODES pRes,
                              PSZ pName);
#line 517
   APIRET _System  DosSetPriority(ULONG scope,
                                   ULONG ulClass,
                                   long  delta,
                                   ULONG PorTid);
#line 541
   APIRET _System DosKillProcess(ULONG action,
                                  PID pid);
#line 680
   typedef struct  _EASIZEBUF        
   {
      USHORT  cbMaxEASize;         
      ULONG   cbMaxEAListSize;     
   } EASIZEBUF;
   typedef EASIZEBUF  *PEASIZEBUF;
#line 701
   typedef struct  _FSQBUFFER        
   {
      USHORT  iType;               
      USHORT  cbName;              
      UCHAR   szName[1];           
      USHORT  cbFSDName;           
      UCHAR   szFSDName[1];        
      USHORT  cbFSAData;           
      UCHAR   rgFSAData[1];        
   } FSQBUFFER;
   typedef FSQBUFFER  *PFSQBUFFER;
#line 714
   typedef struct _FSQBUFFER2        
   {
      USHORT  iType;
      USHORT  cbName;
      USHORT  cbFSDName;
      USHORT  cbFSAData;
      UCHAR   szName[1];
      UCHAR   szFSDName[1];
      UCHAR   rgFSAData[1];
   } FSQBUFFER2;
   typedef FSQBUFFER2 *PFSQBUFFER2;

   typedef struct _SPOOLATTACH       
   {
      USHORT  hNmPipe;             
      ULONG   ulKey;               
   } SPOOLATTACH;
   typedef SPOOLATTACH  *PSPOOLATTACH;
#line 758
         typedef struct _FTIME            
         {
            UINT   twosecs : 5;
            UINT   minutes : 6;
            UINT   hours   : 5;
         } FTIME;
         typedef FTIME *PFTIME;
#line 776
         typedef struct _FDATE            
         {
            UINT   day     : 5;
            UINT   month   : 4;
            UINT   year    : 7;
         } FDATE;
         typedef FDATE   *PFDATE;
#line 795
   typedef struct _VOLUMELABEL       
   {
      BYTE cch;
      char szVolLabel[12];
   } VOLUMELABEL;
   typedef VOLUMELABEL  *PVOLUMELABEL;

   typedef struct _FSINFO       
   {
      FDATE fdateCreation;
      FTIME ftimeCreation;
      VOLUMELABEL vol;
   } FSINFO;
   typedef FSINFO *PFSINFO;
#line 817
   typedef struct _FILELOCK       
   {
      long lOffset;
      long lRange;
   } FILELOCK;
   typedef FILELOCK  *PFILELOCK;

   typedef LHANDLE HFILE;      
   typedef HFILE   *PHFILE;
#line 829
      typedef  ULONG    HEV;              
      typedef  HEV      *PHEV;
#line 833
   typedef  ULONG  FHLOCK;
   typedef  PULONG  PFHLOCK;

   APIRET _System DosSetFileLocks(HFILE hFile,
                                   PFILELOCK pflUnlock,
                                   PFILELOCK pflLock,
                                   ULONG timeout,
                                   ULONG flags);
   APIRET _System DosProtectSetFileLocks(HFILE hFile,
                                          PFILELOCK pflUnlock,
                                          PFILELOCK pflLock,
                                          ULONG timeout, ULONG flags,
                                          FHLOCK fhFileHandleLockID);

   APIRET _System DosCancelLockRequest(HFILE hFile,
                                        PFILELOCK pflLock);
#line 853
      typedef struct _FILEFINDBUF      
      {
         FDATE  fdateCreation;
         FTIME  ftimeCreation;
         FDATE  fdateLastAccess;
         FTIME  ftimeLastAccess;
         FDATE  fdateLastWrite;
         FTIME  ftimeLastWrite;
         ULONG  cbFile;
         ULONG  cbFileAlloc;
         USHORT attrFile;
         UCHAR  cchName;
         char   achName[256];
      } FILEFINDBUF;

      typedef FILEFINDBUF *PFILEFINDBUF;
#line 871
      #pragma pack(2)

      typedef struct _FILEFINDBUF2     
      {
         FDATE  fdateCreation;
         FTIME  ftimeCreation;
         FDATE  fdateLastAccess;
         FTIME  ftimeLastAccess;
         FDATE  fdateLastWrite;
         FTIME  ftimeLastWrite;
         ULONG  cbFile;
         ULONG  cbFileAlloc;
         USHORT attrFile;
         ULONG  cbList;
         UCHAR  cchName;
         char   achName[256];
      } FILEFINDBUF2;
      typedef FILEFINDBUF2 *PFILEFINDBUF2;

      typedef struct _FILEFINDBUF3                  
      {
         ULONG   oNextEntryOffset;             
         FDATE   fdateCreation;
         FTIME   ftimeCreation;
         FDATE   fdateLastAccess;
         FTIME   ftimeLastAccess;
         FDATE   fdateLastWrite;
         FTIME   ftimeLastWrite;
         ULONG   cbFile;
         ULONG   cbFileAlloc;
         ULONG   attrFile;                     
         UCHAR   cchName;
         char    achName[256];
      } FILEFINDBUF3;
      typedef FILEFINDBUF3 *PFILEFINDBUF3;

      typedef struct _FILEFINDBUF4                  
      {
         ULONG   oNextEntryOffset;             
         FDATE   fdateCreation;
         FTIME   ftimeCreation;
         FDATE   fdateLastAccess;
         FTIME   ftimeLastAccess;
         FDATE   fdateLastWrite;
         FTIME   ftimeLastWrite;
         ULONG   cbFile;
         ULONG   cbFileAlloc;
         ULONG   attrFile;                     
         ULONG   cbList;
         UCHAR   cchName;
         char    achName[256];
      } FILEFINDBUF4;
      typedef FILEFINDBUF4  *PFILEFINDBUF4;
#line 927
      typedef struct _GEA          
      {
         BYTE cbName;         
         char szName[1];      
      } GEA;
      typedef GEA *PGEA;

      typedef struct _GEALIST      
      {
         ULONG cbList;        
         GEA list[1];         
      } GEALIST;
      typedef GEALIST  *PGEALIST;

      typedef struct _FEA          
      {
         BYTE fEA;            
         BYTE cbName;         
         USHORT cbValue;      
      } FEA;
      typedef FEA *PFEA;
#line 952
      typedef struct _FEALIST      
      {
         ULONG cbList;        
         FEA list[1];         
      } FEALIST;
      typedef FEALIST *PFEALIST;

      typedef struct _EAOP         
      {
         PGEALIST fpGEAList;  
         PFEALIST fpFEAList;  
         ULONG oError;
      } EAOP;
      typedef EAOP *PEAOP;
#line 968
      #pragma pack(1)
#line 971
      typedef struct _FEA2          
      {
         ULONG   oNextEntryOffset;     
         BYTE    fEA;
         BYTE    cbName;
         USHORT  cbValue;
         char    szName[1];            
      } FEA2;
      typedef FEA2 *PFEA2;
#line 982
      typedef struct _FEA2LIST      
      {
         ULONG   cbList;
         FEA2    list[1];
      } FEA2LIST;
      typedef FEA2LIST *PFEA2LIST;

      typedef struct _GEA2           
      {
         ULONG   oNextEntryOffset;      
         BYTE    cbName;
         char    szName[1];             
      } GEA2;
      typedef GEA2 *PGEA2;

      typedef struct _GEA2LIST       
      {
         ULONG   cbList;
         GEA2    list[1];
      } GEA2LIST;
      typedef GEA2LIST *PGEA2LIST;

      typedef struct _EAOP2          
      {
         PGEA2LIST   fpGEA2List;        
         PFEA2LIST   fpFEA2List;        
         ULONG       oError;            
      } EAOP2;
      typedef EAOP2 *PEAOP2;
#line 1035
   #pragma pack()
#line 1050
   APIRET _System  DosOpen(PSZ    pszFileName,
                            PHFILE pHf,
                            PULONG pulAction,
                            ULONG  cbFile,
                            ULONG  ulAttribute,
                            ULONG  fsOpenFlags,
                            ULONG  fsOpenMode,
                            PEAOP2 peaop2);
#line 1071
   APIRET _System  DosProtectOpen(PSZ pszFileName,
                                   PHFILE phf,
                                   PULONG pulAction,
                                   ULONG cbFile,
                                   ULONG ulAttribute,
                                   ULONG fsOpenFlags,
                                   ULONG fsOpenMode,
                                   PEAOP2 peaop2,
                                   PFHLOCK pfhFileHandleLockID);
#line 1082
   APIRET _System  DosClose(HFILE hFile);

   APIRET _System  DosProtectClose(HFILE hFile,
                                    FHLOCK fhFileHandleLockID);

   APIRET _System  DosRead(HFILE hFile,
                            PVOID pBuffer,
                            ULONG cbRead,
                            PULONG pcbActual);

   APIRET _System  DosProtectRead(HFILE hFile,
                                   PVOID pBuffer,
                                   ULONG cbRead,
                                   PULONG pcbActual,
                                   FHLOCK fhFileHandleLockID);

   APIRET _System  DosWrite(HFILE hFile,
                             PVOID pBuffer,
                             ULONG cbWrite,
                             PULONG pcbActual);

   APIRET _System  DosProtectWrite(HFILE hFile,
                                    PVOID pBuffer,
                                    ULONG cbWrite,
                                    PULONG pcbActual,
                                    FHLOCK fhFileHandleLockID);
#line 1111
   typedef struct _FILESTATUS       
   {
      FDATE  fdateCreation;
      FTIME  ftimeCreation;
      FDATE  fdateLastAccess;
      FTIME  ftimeLastAccess;
      FDATE  fdateLastWrite;
      FTIME  ftimeLastWrite;
      ULONG  cbFile;
      ULONG  cbFileAlloc;
      USHORT attrFile;
   } FILESTATUS;
   typedef FILESTATUS *PFILESTATUS;

   typedef struct _FILESTATUS2      
   {
      FDATE  fdateCreation;
      FTIME  ftimeCreation;
      FDATE  fdateLastAccess;
      FTIME  ftimeLastAccess;
      FDATE  fdateLastWrite;
      FTIME  ftimeLastWrite;
      ULONG  cbFile;
      ULONG  cbFileAlloc;
      USHORT attrFile;
      ULONG  cbList;
   } FILESTATUS2;
   typedef FILESTATUS2 *PFILESTATUS2;

   typedef struct _FILESTATUS3      
   {
      FDATE  fdateCreation;
      FTIME  ftimeCreation;
      FDATE  fdateLastAccess;
      FTIME  ftimeLastAccess;
      FDATE  fdateLastWrite;
      FTIME  ftimeLastWrite;
      ULONG  cbFile;
      ULONG  cbFileAlloc;
      ULONG  attrFile;
   } FILESTATUS3;
   typedef FILESTATUS3 *PFILESTATUS3;

   typedef struct _FILESTATUS4       
   {
      FDATE  fdateCreation;
      FTIME  ftimeCreation;
      FDATE  fdateLastAccess;
      FTIME  ftimeLastAccess;
      FDATE  fdateLastWrite;
      FTIME  ftimeLastWrite;
      ULONG  cbFile;
      ULONG  cbFileAlloc;
      ULONG  attrFile;
      ULONG  cbList;
   } FILESTATUS4;
   typedef FILESTATUS4  *PFILESTATUS4;
#line 1170
   typedef struct _FSALLOCATE       
   {
      ULONG  idFileSystem;
      ULONG  cSectorUnit;
      ULONG  cUnit;
      ULONG  cUnitAvail;
      USHORT cbSector;
   } FSALLOCATE;
   typedef FSALLOCATE *PFSALLOCATE;

   typedef LHANDLE HDIR;         
   typedef HDIR    *PHDIR;
#line 1212
   APIRET _System  DosDelete(PSZ pszFile);
#line 1218
   APIRET _System  DosForceDelete(PSZ pszFile);
#line 1221
   APIRET _System  DosDupHandle(HFILE hFile,
                                 PHFILE pHfile);

   APIRET _System  DosQueryFHState(HFILE hFile,
                                    PULONG pMode);
   APIRET _System  DosProtectQueryFHState(HFILE hFile,
                                           PULONG pMode,
                                           FHLOCK fhFileHandleLockID);

   APIRET _System  DosSetFHState(HFILE hFile,
                                  ULONG mode);

   APIRET _System  DosProtectSetFHState(HFILE hFile,
                                         ULONG mode,
                                         FHLOCK fhFileHandleLockID);

   APIRET _System  DosQueryHType(HFILE hFile,
                                  PULONG pType,
                                  PULONG pAttr);
#line 1250
   APIRET _System  DosFindFirst(PSZ    pszFileSpec,
                                 PHDIR  phdir,
                                 ULONG  flAttribute,
                                 PVOID  pfindbuf,
                                 ULONG  cbBuf,
                                 PULONG pcFileNames,
                                 ULONG  ulInfoLevel);
#line 1259
   APIRET _System  DosFindNext(HDIR   hDir,
                                PVOID  pfindbuf,
                                ULONG  cbfindbuf,
                                PULONG pcFilenames);

   APIRET _System  DosFindClose(HDIR hDir);
#line 1273
   APIRET _System  DosFSAttach(PSZ pszDevice,
                                PSZ pszFilesystem,
                                PVOID pData,
                                ULONG cbData,
                                ULONG flag);
#line 1287
   APIRET _System  DosQueryFSAttach(PSZ    pszDeviceName,
                                     ULONG  ulOrdinal,
                                     ULONG  ulFSAInfoLevel,
                                     PFSQBUFFER2 pfsqb,
                                     PULONG pcbBuffLength);
#line 1306
   APIRET _System  DosFSCtl(PVOID pData,
                             ULONG cbData,
                             PULONG pcbData,
                             PVOID pParms,
                             ULONG cbParms,
                             PULONG pcbParms,
                             ULONG function,
                             PSZ pszRoute,
                             HFILE hFile,
                             ULONG method);
#line 1318
   APIRET _System  DosSetFileSize(HFILE hFile,
                                   ULONG cbSize);

   APIRET _System  DosProtectSetFileSize(HFILE hFile,
                                          ULONG cbSize,
                                          FHLOCK fhFileHandleLockID);

   APIRET _System  DosResetBuffer(HFILE hFile);

   APIRET _System  DosSetFilePtr(HFILE hFile,
                                  long ib,
                                  ULONG method,
                                  PULONG ibActual);

   APIRET _System  DosProtectSetFilePtr(HFILE hFile,
                                         long ib,
                                         ULONG method,
                                         PULONG ibActual,
                                         FHLOCK fhFileHandleLockID);
#line 1342
   APIRET _System  DosMove(PSZ pszOld,
                            PSZ pszNew);
#line 1351
   APIRET _System  DosCopy(PSZ pszOld,
                            PSZ pszNew,
                            ULONG option);
#line 1363
   APIRET _System  DosEditName(ULONG metalevel,
                                PSZ pszSource,
                                PSZ pszEdit,
                                PBYTE pszTarget,
                                ULONG cbTarget);
#line 1374
   APIRET _System  DosCreateDir(PSZ pszDirName,
                                 PEAOP2 peaop2);
#line 1381
   APIRET _System  DosDeleteDir(PSZ pszDir);
#line 1384
   APIRET _System  DosSetDefaultDisk(ULONG disknum);

   APIRET _System  DosQueryCurrentDisk(PULONG pdisknum,
                                        PULONG plogical);
#line 1392
   APIRET _System  DosSetCurrentDir(PSZ pszDir);
#line 1395
   APIRET _System  DosQueryCurrentDir(ULONG disknum,
                                       PBYTE pBuf,
                                       PULONG pcbBuf);

   APIRET _System  DosQueryFSInfo(ULONG disknum,
                                   ULONG infolevel,
                                   PVOID pBuf,
                                   ULONG cbBuf);

   APIRET _System  DosSetFSInfo(ULONG disknum,
                                 ULONG infolevel,
                                 PVOID pBuf,
                                 ULONG cbBuf);

   APIRET _System  DosQueryVerify(PBOOL pBool);

   APIRET _System  DosSetVerify(BOOL);

   APIRET _System  DosSetMaxFH(ULONG cFH);

   APIRET _System  DosSetRelMaxFH(PLONG pcbReqCount,
                                   PULONG pcbCurMaxFH);

   APIRET _System  DosQueryFileInfo(HFILE hf,
                                     ULONG ulInfoLevel,
                                     PVOID pInfo,
                                     ULONG cbInfoBuf);

   APIRET _System  DosProtectQueryFileInfo(HFILE hf,
                                            ULONG ulInfoLevel,
                                            PVOID pInfo,
                                            ULONG cbInfoBuf,
                                            FHLOCK fhFileHandleLockID);

   APIRET _System  DosSetFileInfo(HFILE hf,
                                   ULONG ulInfoLevel,
                                   PVOID pInfoBuf,
                                   ULONG cbInfoBuf);

   APIRET _System  DosProtectSetFileInfo(HFILE hf,
                                          ULONG ulInfoLevel,
                                          PVOID pInfoBuf,
                                          ULONG cbInfoBuf,
                                          FHLOCK fhFileHandleLockID);
#line 1446
   APIRET _System  DosQueryPathInfo(PSZ   pszPathName,
                                     ULONG ulInfoLevel,
                                     PVOID pInfoBuf,
                                     ULONG cbInfoBuf);
#line 1459
   APIRET _System  DosSetPathInfo(PSZ   pszPathName,
                                   ULONG ulInfoLevel,
                                   PVOID pInfoBuf,
                                   ULONG cbInfoBuf,
                                   ULONG flOptions);
#line 1469
   APIRET _System  DosShutdown(ULONG ulReserved);

   APIRET _System  DosEnumAttribute(ULONG  ulRefType,
                                     PVOID  pvFile,
                                     ULONG  ulEntry,
                                     PVOID  pvBuf,
                                     ULONG  cbBuf,
                                     PULONG pulCount,
                                     ULONG  ulInfoLevel);

   APIRET _System  DosProtectEnumAttribute(ULONG ulRefType,
                                            PVOID pvFile,
                                            ULONG ulEntry,
                                            PVOID pvBuf,
                                            ULONG cbBuf,
                                            PULONG pulCount,
                                            ULONG ulInfoLevel,
                                            FHLOCK fhFileHandleLockID );
#line 1489
   #pragma pack(1)
#line 1492
   typedef struct _DENA1  
   {
      UCHAR       reserved;        
      UCHAR       cbName;          
      USHORT      cbValue;         
      UCHAR       szName[1];       
   } DENA1;
   typedef DENA1 *PDENA1;

   typedef FEA2  DENA2;
   typedef PFEA2 PDENA2;
#line 1505
   #pragma pack()
#line 1519
   APIRET _System  DosAllocMem(PPVOID ppb,
                                ULONG cb,
                                ULONG flag);

   APIRET _System  DosFreeMem(PVOID pb);

   APIRET _System  DosSetMem(PVOID pb,
                              ULONG cb,
                              ULONG flag);

   APIRET _System  DosGiveSharedMem(PVOID pb,
                                     PID pid,
                                     ULONG flag);

   APIRET _System  DosGetSharedMem(PVOID pb,
                                    ULONG flag);
#line 1541
   APIRET _System  DosGetNamedSharedMem(PPVOID ppb,
                                         PSZ pszName,
                                         ULONG flag);
#line 1552
   APIRET _System  DosAllocSharedMem(PPVOID ppb,
                                      PSZ pszName,
                                      ULONG cb,
                                      ULONG flag);
#line 1558
   APIRET _System  DosQueryMem(PVOID pb,
                                PULONG pcb,
                                PULONG pFlag);
#line 1564
   APIRET _System  DosSubAllocMem(PVOID pbBase,
                                   PPVOID ppb,
                                   ULONG cb);
#line 1570
   APIRET _System  DosSubFreeMem(PVOID pbBase,
                                  PVOID pb,
                                  ULONG cb);
#line 1576
   APIRET _System  DosSubSetMem(PVOID pbBase,
                                 ULONG flag,
                                 ULONG cb);
#line 1582
   APIRET _System  DosSubUnsetMem(PVOID pbBase);
#line 14 "F:\IBMCPP\INCLUDE\OS2\bsememf.h"
#pragma info( none )

      #pragma info( none )

#pragma info( restore )
#line 149
#pragma info( none )

      #pragma info( restore )

#pragma info( restore )
#line 1618 "F:\IBMCPP\INCLUDE\OS2\bsedos.h"
   typedef struct _PSEMRECORD       
   {
      HSEM        hsemCur;
      ULONG       ulUser;
   } SEMRECORD;
   typedef SEMRECORD *PSEMRECORD;
#line 1637
   typedef  ULONG    HMTX;             
   typedef  HMTX     *PHMTX;
   typedef  ULONG    HMUX;             
   typedef  HMUX     *PHMUX;
#line 1648
   APIRET _System  DosCreateEventSem (PSZ pszName,
                                       PHEV phev,
                                       ULONG flAttr,
                                       BOOL fState);
#line 1658
   APIRET _System  DosOpenEventSem (PSZ pszName,
                                     PHEV phev);
#line 1662
   APIRET _System  DosCloseEventSem (HEV hev);

   APIRET _System  DosResetEventSem (HEV hev,
                                      PULONG pulPostCt);

   APIRET _System  DosPostEventSem (HEV hev);

   APIRET _System  DosWaitEventSem (HEV hev,
                                     ULONG ulTimeout);

   APIRET _System  DosQueryEventSem (HEV hev,
                                      PULONG pulPostCt);
#line 1681
   APIRET _System  DosCreateMutexSem (PSZ pszName,
                                       PHMTX phmtx,
                                       ULONG flAttr,
                                       BOOL fState);
#line 1691
   APIRET _System  DosOpenMutexSem (PSZ pszName,
                                     PHMTX phmtx);
#line 1695
   APIRET _System  DosCloseMutexSem (HMTX hmtx);

   APIRET _System  DosRequestMutexSem (HMTX hmtx,
                                        ULONG ulTimeout);

   APIRET _System  DosReleaseMutexSem (HMTX hmtx);

   APIRET _System  DosQueryMutexSem (HMTX hmtx,
                                      PID *ppid,
                                      TID *ptid,
                                      PULONG pulCount);
#line 1714
   APIRET _System  DosCreateMuxWaitSem (PSZ pszName,
                                         PHMUX phmux,
                                         ULONG cSemRec,
                                         PSEMRECORD pSemRec,
                                         ULONG flAttr);
#line 1725
   APIRET _System  DosOpenMuxWaitSem (PSZ pszName,
                                       PHMUX phmux);
#line 1729
   APIRET _System  DosCloseMuxWaitSem (HMUX hmux);

   APIRET _System  DosWaitMuxWaitSem (HMUX hmux,
                                       ULONG ulTimeout,
                                       PULONG pulUser);

   APIRET _System  DosAddMuxWaitSem (HMUX hmux,
                                      PSEMRECORD pSemRec);

   APIRET _System  DosDeleteMuxWaitSem (HMUX hmux,
                                         HSEM hSem);

   APIRET _System  DosQueryMuxWaitSem (HMUX hmux,
                                        PULONG pcSemRec,
                                        PSEMRECORD pSemRec,
                                        PULONG pflAttr);
#line 1754
   typedef struct _DATETIME       
   {
      UCHAR   hours;
      UCHAR   minutes;
      UCHAR   seconds;
      UCHAR   hundredths;
      UCHAR   day;
      UCHAR   month;
      USHORT  year;
      short   timezone;
      UCHAR   weekday;
   } DATETIME;
   typedef DATETIME *PDATETIME;

   APIRET _System   DosGetDateTime(PDATETIME pdt);

   APIRET _System   DosSetDateTime(PDATETIME pdt);
#line 1782
   typedef LHANDLE HTIMER;
   typedef HTIMER  *PHTIMER;

   APIRET _System   DosAsyncTimer(ULONG msec,
                                   HSEM hsem,
                                   PHTIMER phtimer);

   APIRET _System   DosStartTimer(ULONG msec,
                                   HSEM hsem,
                                   PHTIMER phtimer);

   APIRET _System   DosStopTimer(HTIMER htimer);
#line 1811
   APIRET _System  DosLoadModule(PSZ pszName,
                                  ULONG cbName,
                                  PSZ pszModname,
                                  PHMODULE phmod);
#line 1817
   APIRET _System  DosFreeModule(HMODULE hmod);
#line 1825
   APIRET _System  DosQueryProcAddr(HMODULE hmod,
                                     ULONG ordinal,
                                     PSZ pszName,
                                     PFN* ppfn);
#line 1835
   APIRET _System  DosQueryModuleHandle(PSZ pszModname,
                                         PHMODULE phmod);
#line 1839
   APIRET _System  DosQueryModuleName(HMODULE hmod,
                                       ULONG cbName,
                                       PCHAR pch);
#line 1852
   APIRET _System  DosQueryProcType(HMODULE hmod,
                                     ULONG ordinal,
                                     PSZ pszName,
                                     PULONG pulproctype);
#line 1907
   APIRET _System  DosGetResource(HMODULE hmod,
                                   ULONG idType,
                                   ULONG idName,
                                   PPVOID ppb);

   APIRET _System  DosFreeResource(PVOID pb);

   APIRET _System  DosQueryResourceSize(HMODULE hmod,
                                         ULONG idt,
                                         ULONG idn,
                                         PULONG pulsize);
#line 1928
   typedef struct _COUNTRYCODE    
   {
      ULONG       country;
      ULONG       codepage;
   } COUNTRYCODE;
   typedef COUNTRYCODE *PCOUNTRYCODE;

   typedef struct _COUNTRYINFO    
   {
      ULONG       country;
      ULONG       codepage;
      ULONG       fsDateFmt;
      char        szCurrency[5];
      char        szThousandsSeparator[2];
      char        szDecimal[2];
      char        szDateSeparator[2];
      char        szTimeSeparator[2];
      UCHAR       fsCurrencyFmt;
      UCHAR       cDecimalPlace;
      UCHAR       fsTimeFmt;
      USHORT      abReserved1[2];
      char        szDataSeparator[2];
      USHORT      abReserved2[5];
   } COUNTRYINFO, *PCOUNTRYINFO;
#line 1960
   APIRET _System  DosQueryCtryInfo(ULONG cb,
                                     PCOUNTRYCODE pcc,
                                     PCOUNTRYINFO pci,
                                     PULONG pcbActual);

   APIRET _System  DosQueryDBCSEnv(ULONG cb,
                                    PCOUNTRYCODE pcc,
                                    PCHAR pBuf);

   APIRET _System  DosMapCase(ULONG cb,
                               PCOUNTRYCODE pcc,
                               PCHAR pch);

   APIRET _System  DosQueryCollate(ULONG cb,
                                    PCOUNTRYCODE pcc,
                                    PCHAR pch,
                                    PULONG pcch);

   APIRET _System  DosQueryCp(ULONG cb,
                               PULONG arCP,
                               PULONG pcCP);

   APIRET _System  DosSetProcessCp(ULONG cp);
#line 20 "F:\IBMCPP\INCLUDE\OS2\bsexcpt.h"
#pragma info( none )

      #pragma info( none )

#pragma info( restore )
#line 212
#pragma pack(1)

typedef struct  _fpreg       
   {
   ULONG losig;
   ULONG hisig;
   USHORT signexp;
   } FPREG , *PFPREG ;
#pragma pack()

struct _CONTEXT
   {
#line 240
   ULONG ContextFlags;
#line 247
   ULONG   ctx_env[7];
   FPREG   ctx_stack[8];
#line 255
   ULONG ctx_SegGs;
   ULONG ctx_SegFs;
   ULONG ctx_SegEs;
   ULONG ctx_SegDs;
#line 265
   ULONG ctx_RegEdi;
   ULONG ctx_RegEsi;
   ULONG ctx_RegEax;
   ULONG ctx_RegEbx;
   ULONG ctx_RegEcx;
   ULONG ctx_RegEdx;
#line 277
   ULONG ctx_RegEbp;
   ULONG ctx_RegEip;
   ULONG ctx_SegCs;
   ULONG ctx_EFlags;
   ULONG ctx_RegEsp;
   ULONG ctx_SegSs;

   };

typedef struct _CONTEXT CONTEXTRECORD;
typedef struct _CONTEXT *PCONTEXTRECORD;
#line 302
struct _EXCEPTIONREPORTRECORD
   {
   ULONG   ExceptionNum;                 
   ULONG   fHandlerFlags;
   struct  _EXCEPTIONREPORTRECORD    *NestedExceptionReportRecord;
   PVOID   ExceptionAddress;
   ULONG   cParameters;                  
   ULONG   ExceptionInfo[4];

   };

typedef struct _EXCEPTIONREPORTRECORD EXCEPTIONREPORTRECORD;
typedef struct _EXCEPTIONREPORTRECORD *PEXCEPTIONREPORTRECORD;
#line 324
struct _EXCEPTIONREGISTRATIONRECORD;

typedef ULONG _System _ERR(PEXCEPTIONREPORTRECORD,
                            struct _EXCEPTIONREGISTRATIONRECORD *,
                            PCONTEXTRECORD,
                            PVOID);

typedef _ERR  *ERR;

struct _EXCEPTIONREGISTRATIONRECORD
   {
   struct _EXCEPTIONREGISTRATIONRECORD * volatile prev_structure;
   _ERR * volatile ExceptionHandler;
   };

typedef struct _EXCEPTIONREGISTRATIONRECORD EXCEPTIONREGISTRATIONRECORD;
typedef struct _EXCEPTIONREGISTRATIONRECORD *PEXCEPTIONREGISTRATIONRECORD;
#line 345
#pragma pack()
#line 353
#pragma info( none )

      #pragma info( restore )

#pragma info( restore )
#line 2000 "F:\IBMCPP\INCLUDE\OS2\bsedos.h"
   APIRET _System  DosSetExceptionHandler(PEXCEPTIONREGISTRATIONRECORD pERegRec);

   APIRET _System  DosUnsetExceptionHandler(PEXCEPTIONREGISTRATIONRECORD pERegRec);

   APIRET _System  DosRaiseException(PEXCEPTIONREPORTRECORD pexcept);

   APIRET _System  DosSendSignalException(PID pid,
                                           ULONG exception);

   APIRET _System  DosUnwindException(PEXCEPTIONREGISTRATIONRECORD phandler,
                                       PVOID pTargetIP,
                                       PEXCEPTIONREPORTRECORD pERepRec);

   APIRET _System  DosSetSignalExceptionFocus(BOOL flag,
                                               PULONG pulTimes);

   APIRET _System  DosEnterMustComplete(PULONG pulNesting);

   APIRET _System  DosExitMustComplete(PULONG pulNesting);

   APIRET _System  DosAcknowledgeSignalException(ULONG ulSignalNum);
#line 2030
      typedef LHANDLE HQUEUE;   
      typedef HQUEUE  *PHQUEUE;
      typedef struct _REQUESTDATA      
      {
         PID         pid;
         ULONG       ulData;
      } REQUESTDATA;
      typedef REQUESTDATA *PREQUESTDATA;
#line 2046
      APIRET _System  DosCreatePipe(PHFILE phfRead,
                                     PHFILE phfWrite,
                                     ULONG cb);

      APIRET _System  DosCloseQueue(HQUEUE hq);
#line 2057
      APIRET _System  DosCreateQueue(PHQUEUE phq,
                                      ULONG priority,
                                      PSZ pszName);
#line 2067
      APIRET _System  DosOpenQueue(PPID ppid,
                                    PHQUEUE phq,
                                    PSZ pszName);
#line 2072
      APIRET _System  DosPeekQueue(HQUEUE hq,
                                    PREQUESTDATA pRequest,
                                    PULONG pcbData,
                                    PPVOID ppbuf,
                                    PULONG element,
                                    BOOL nowait,
                                    PBYTE ppriority,
                                    HEV hsem);

      APIRET _System  DosPurgeQueue(HQUEUE hq);

      APIRET _System  DosQueryQueue(HQUEUE hq,
                                     PULONG pcbEntries);

      APIRET _System  DosReadQueue(HQUEUE hq,
                                    PREQUESTDATA pRequest,
                                    PULONG pcbData,
                                    PPVOID ppbuf,
                                    ULONG element,
                                    BOOL wait,
                                    PBYTE ppriority,
                                    HEV hsem);

      APIRET _System  DosWriteQueue(HQUEUE hq,
                                     ULONG request,
                                     ULONG cbData,
                                     PVOID pbData,
                                     ULONG priority);
#line 2162
   APIRET _System  DosError(ULONG error);
#line 2173
   APIRET _System  DosGetMessage(PCHAR* pTable,
                                  ULONG cTable,
                                  PCHAR pBuf,
                                  ULONG cbBuf,
                                  ULONG msgnumber,
                                  PSZ pszFile,
                                  PULONG pcbMsg);
#line 2182
   APIRET _System  DosErrClass(ULONG code,
                                PULONG pClass,
                                PULONG pAction,
                                PULONG pLocus);
#line 2196
   APIRET _System  DosInsertMessage(PCHAR* pTable,
                                     ULONG cTable,
                                     PSZ pszMsg,
                                     ULONG cbMsg,
                                     PCHAR pBuf,
                                     ULONG cbBuf,
                                     PULONG pcbMsg);
#line 2205
   APIRET _System  DosPutMessage(HFILE hfile,
                                  ULONG cbMsg,
                                  PCHAR pBuf);

   APIRET _System  DosQuerySysInfo(ULONG iStart,
                                    ULONG iLast,
                                    PVOID pBuf,
                                    ULONG cbBuf);
#line 2218
   APIRET _System  DosScanEnv(PSZ pszName,
                               PSZ *ppszValue);
#line 2229
   APIRET _System  DosSearchPath(ULONG flag,
                                  PSZ pszPathOrName,
                                  PSZ pszFilename,
                                  PBYTE pBuf,
                                  ULONG cbBuf);
#line 2242
   APIRET _System  DosQueryMessageCP(PCHAR pb,
                                      ULONG cb,
                                      PSZ pszFilename,
                                      PULONG cbBuf);
#line 2248
   APIRET _System  DosQueryRASInfo(ULONG Index,
                                    PPVOID Addr);
#line 2254
   APIRET  _System DosSetExtLIBPATH( PSZ pszExtLIBPATH, ULONG flags);
#line 2260
   APIRET  _System DosQueryExtLIBPATH( PSZ pszExtLIBPATH, ULONG flags);
#line 2270
   typedef struct _STARTDATA      
   {
      USHORT  Length;
      USHORT  Related;
      USHORT  FgBg;
      USHORT  TraceOpt;
      PSZ     PgmTitle;
      PSZ     PgmName;
      PBYTE   PgmInputs;
      PBYTE   TermQ;
      PBYTE   Environment;
      USHORT  InheritOpt;
      USHORT  SessionType;
      PSZ     IconFile;
      ULONG   PgmHandle;
      USHORT  PgmControl;
      USHORT  InitXPos;
      USHORT  InitYPos;
      USHORT  InitXSize;
      USHORT  InitYSize;
      USHORT  Reserved;
      PSZ     ObjectBuffer;
      ULONG   ObjectBuffLen;
   } STARTDATA;
   typedef STARTDATA *PSTARTDATA;
#line 2329
   typedef struct _STATUSDATA    
   {
      USHORT Length;
      USHORT SelectInd;
      USHORT BondInd;
   } STATUSDATA;
   typedef STATUSDATA *PSTATUSDATA;
#line 2353
   APIRET _System  DosStartSession(PSTARTDATA psd,
                                    PULONG pidSession,
                                    PPID ppid);

   APIRET _System  DosSetSession(ULONG idSession,
                                  PSTATUSDATA psd);

   APIRET _System  DosSelectSession(ULONG idSession);

   APIRET _System  DosStopSession(ULONG scope,
                                   ULONG idSession);
#line 2369
   APIRET _System DosQueryAppType(PSZ pszName,
                                   PULONG pFlags);
#line 2420
   APIRET _System  DosDevConfig(PVOID pdevinfo,
                                 ULONG item);
#line 2431
   APIRET _System  DosDevIOCtl(HFILE hDevice,
                                ULONG category,
                                ULONG function,
                                PVOID pParams,
                                ULONG cbParmLenMax,
                                PULONG pcbParmLen,
                                PVOID pData,
                                ULONG cbDataLenMax,
                                PULONG pcbDataLen);
#line 2442
   APIRET _System  DosPhysicalDisk(ULONG function,
                                    PVOID pBuf,
                                    ULONG cbBuf,
                                    PVOID pParams,
                                    ULONG cbParams);
#line 2461
   typedef LHANDLE HPIPE;      
   typedef HPIPE   *PHPIPE;

   typedef struct _AVAILDATA               
   {
      USHORT      cbpipe;             
      USHORT      cbmessage;          
   } AVAILDATA;
   typedef AVAILDATA *PAVAILDATA;

   typedef struct _PIPEINFO                
   {
      USHORT cbOut;                   
      USHORT cbIn;                    
      BYTE   cbMaxInst;               
      BYTE   cbCurInst;               
      BYTE   cbName;                  
      char   szName[1];               
   } PIPEINFO;
   typedef PIPEINFO  *PPIPEINFO;

   typedef struct _PIPESEMSTATE     
   {
      BYTE   fStatus;          

      BYTE   fFlag;            
      USHORT usKey;            
      USHORT usAvail;          
   } PIPESEMSTATE;
   typedef PIPESEMSTATE *PPIPESEMSTATE;
#line 2534
   APIRET _System  DosCallNPipe(PSZ pszName,
                                 PVOID pInbuf,
                                 ULONG cbIn,
                                 PVOID pOutbuf,
                                 ULONG cbOut,
                                 PULONG pcbActual,
                                 ULONG msec);
#line 2543
   APIRET _System  DosConnectNPipe(HPIPE hpipe);

   APIRET _System  DosDisConnectNPipe(HPIPE hpipe);
#line 2556
   APIRET _System  DosCreateNPipe(PSZ pszName,
                                   PHPIPE pHpipe,
                                   ULONG openmode,
                                   ULONG pipemode,
                                   ULONG cbInbuf,
                                   ULONG cbOutbuf,
                                   ULONG msec);
#line 2565
   APIRET _System  DosPeekNPipe(HPIPE hpipe,
                                 PVOID pBuf,
                                 ULONG cbBuf,
                                 PULONG pcbActual,
                                 PAVAILDATA pAvail,
                                 PULONG pState);

   APIRET _System  DosQueryNPHState(HPIPE hpipe,
                                     PULONG pState);

   APIRET _System  DosQueryNPipeInfo(HPIPE hpipe,
                                      ULONG infolevel,
                                      PVOID pBuf,
                                      ULONG cbBuf);

   APIRET _System  DosQueryNPipeSemState(HSEM hsem,
                                          PPIPESEMSTATE pnpss,
                                          ULONG cbBuf);
#line 2590
   APIRET _System  DosRawReadNPipe(PSZ pszName,
                                    ULONG cb,
                                    PULONG pLen,
                                    PVOID pBuf);
#line 2600
   APIRET _System  DosRawWriteNPipe(PSZ pszName,
                                     ULONG cb);
#line 2604
   APIRET _System  DosSetNPHState(HPIPE hpipe,
                                   ULONG state);

   APIRET _System  DosSetNPipeSem(HPIPE hpipe,
                                   HSEM hsem,
                                   ULONG key);

   APIRET _System  DosTransactNPipe(HPIPE hpipe,
                                     PVOID pOutbuf,
                                     ULONG cbOut,
                                     PVOID pInbuf,
                                     ULONG cbIn,
                                     PULONG pcbRead);
#line 2622
   APIRET _System  DosWaitNPipe(PSZ pszName,
                                 ULONG msec);
#line 2683
   APIRET _System DosTmrQueryFreq(PULONG pulTmrFreq);

   APIRET _System DosTmrQueryTime(PQWORD pqwTmrTime);

   APIRET _System DosRegisterPerfCtrs(PBYTE pbDataBlk,
                                       PBYTE pbTextBlk,
                                       ULONG flFlags);
#line 2732
   typedef LHANDLE   HVDD;      
   typedef HVDD     *PHVDD;     
#line 2739
   APIRET _System  DosOpenVDD(PSZ pszVDD,
                               PHVDD phvdd);
#line 2743
   APIRET _System  DosRequestVDD(HVDD hvdd,
                                  SGID sgid,
                                  ULONG cmd,
                                  ULONG cbInput,
                                  PVOID pInput,
                                  ULONG cbOutput,
                                  PVOID pOutput);

   APIRET _System  DosCloseVDD(HVDD hvdd);
#line 2759
   APIRET _System  DosQueryDOSProperty(SGID sgid,
                                        PSZ pszName,
                                        ULONG cb,
                                        PSZ pch);
#line 2771
   APIRET _System  DosSetDOSProperty(SGID sgid,
                                      PSZ pszName,
                                      ULONG cb,
                                      PSZ pch);
#line 2792
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 33 "F:\IBMCPP\INCLUDE\OS2\bsesub.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 100
   typedef unsigned short  HKBD;
   typedef HKBD        *   PHKBD;

   APIRET16 _Far16 _Pascal KBD16REGISTER (PSZ pszModName,
                                    PSZ pszEntryPt,
                                    ULONG FunMask);
#line 125
   APIRET16 _Far16 _Pascal KBD16DEREGISTER (void);
#line 128
   #pragma pack(2)
#line 131
   typedef  struct _KBDKEYINFO       
   {
      UCHAR    chChar;
      UCHAR    chScan;
      UCHAR    fbStatus;
      UCHAR    bNlsShift;
      USHORT   fsState;
      ULONG    time;
   }KBDKEYINFO;
   typedef KBDKEYINFO *PKBDKEYINFO;

   APIRET16 _Far16 _Pascal  KBD16CHARIN(PKBDKEYINFO pkbci,
                                  USHORT fWait,
                                  HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16PEEK (PKBDKEYINFO pkbci,
                                 HKBD hkbd);
#line 151
   typedef struct _STRINGINBUF      
   {
      USHORT cb;
      USHORT cchIn;
   } STRINGINBUF;
   typedef STRINGINBUF  *PSTRINGINBUF;

   APIRET16 _Far16 _Pascal  KBD16STRINGIN (PCH pch,
                                     PSTRINGINBUF pchIn,
                                     USHORT fsWait,
                                     HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16FLUSHBUFFER (HKBD hkbd);
#line 198
   typedef struct _KBDINFO          
   {
      USHORT cb;
      USHORT fsMask;
      USHORT chTurnAround;
      USHORT fsInterim;
      USHORT fsState;
   }KBDINFO;
   typedef KBDINFO *PKBDINFO;
#line 209
   APIRET16 _Far16 _Pascal  KBD16SETSTATUS (PKBDINFO pkbdinfo,
                                      HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16GETSTATUS (PKBDINFO pkbdinfo,
                                      HKBD hdbd);

   APIRET16 _Far16 _Pascal  KBD16SETCP (USHORT usReserved,
                                  USHORT pidCP,
                                  HKBD hdbd);

   APIRET16 _Far16 _Pascal  KBD16GETCP (ULONG ulReserved,
                                  PUSHORT pidCP,
                                  HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16OPEN (PHKBD phkbd);

   APIRET16 _Far16 _Pascal  KBD16CLOSE (HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16GETFOCUS (USHORT fWait,
                                     HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16FREEFOCUS (HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16SYNCH (USHORT fsWait);

   APIRET16 _Far16 _Pascal  KBD16SETFGND(void);
#line 237
   typedef struct _KBDHWID          
   {
      USHORT cb;
      USHORT idKbd;
      USHORT usReserved1;
      USHORT usReserved2;
   } KBDHWID;
   typedef KBDHWID  *PKBDHWID;

   APIRET16 _Far16 _Pascal  KBD16GETHWID (PKBDHWID pkbdhwid,
                                    HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16SETHWID (PKBDHWID pkbdhwid,
                                    HKBD hkbd);
#line 261
   #pragma pack(2)

   typedef  struct _KBDTRANS         
   {
      UCHAR      chChar;
      UCHAR      chScan;
      UCHAR      fbStatus;
      UCHAR      bNlsShift;
      USHORT     fsState;
      ULONG      time;
      USHORT     fsDD;
      USHORT     fsXlate;
      USHORT     fsShift;
      USHORT     sZero;
   } KBDTRANS;
   typedef KBDTRANS *PKBDTRANS;

   APIRET16 _Far16 _Pascal  KBD16XLATE (PKBDTRANS pkbdtrans,
                                  HKBD hkbd);

   APIRET16 _Far16 _Pascal  KBD16SETCUSTXT (PUSHORT usCodePage,
                                      HKBD hkbd);
#line 381
   typedef unsigned short  HVIO;
   typedef HVIO        *   PHVIO;

   APIRET16 _Far16 _Pascal  VIO16REGISTER (PSZ pszModName,
                                     PSZ pszEntryName,
                                     ULONG flFun1,
                                     ULONG flFun2);

   APIRET16 _Far16 _Pascal  VioGlobalReg(PSZ pszModName,
                                     PSZ pszEntryName,
                                     ULONG flFun1,
                                     ULONG flFun2,
                                     USHORT usReturn);
#line 441
   APIRET16 _Far16 _Pascal  VIO16DEREGISTER (void);

   APIRET16 _Far16 _Pascal  VIO16GETBUF (PULONG pLVB,
                                   PUSHORT pcbLVB,
                                   HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16GETCURPOS (PUSHORT pusRow,
                                      PUSHORT pusColumn,
                                      HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SETCURPOS (USHORT usRow,
                                      USHORT usColumn,
                                      HVIO hvio);
#line 456
   typedef struct _VIOCURSORINFO    
   {
      USHORT   yStart;
      USHORT   cEnd;
      USHORT   cx;
      USHORT   attr;
   } VIOCURSORINFO;

   typedef VIOCURSORINFO *PVIOCURSORINFO;

   APIRET16 _Far16 _Pascal  VIO16GETCURTYPE (PVIOCURSORINFO pvioCursorInfo,
                                       HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SETCURTYPE (PVIOCURSORINFO pvioCursorInfo,
                                       HVIO hvio);
#line 480
   #pragma pack(1)
#line 483
   typedef  struct _VIOMODEINFO      
   {
      USHORT cb;
      UCHAR  fbType;
      UCHAR  color;
      USHORT col;
      USHORT row;
      USHORT hres;
      USHORT vres;
      UCHAR  fmt_ID;
      UCHAR  attrib;
      ULONG  buf_addr;
      ULONG  buf_length;
      ULONG  full_length;
      ULONG  partial_length;
      PCH    ext_data_addr;
   } VIOMODEINFO;
   typedef VIOMODEINFO *PVIOMODEINFO;
#line 506
   APIRET16 _Far16 _Pascal  VIO16GETMODE (PVIOMODEINFO pvioModeInfo,
                                    HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SETMODE (PVIOMODEINFO pvioModeInfo,
                                    HVIO hvio);
#line 513
   typedef struct _VIOPHYSBUF       
   {
      PBYTE    pBuf;
      ULONG    cb;
      SEL      asel[1];
   } VIOPHYSBUF;

   typedef VIOPHYSBUF  *PVIOPHYSBUF;

   APIRET16 _Far16 _Pascal  VIO16GETPHYSBUF (PVIOPHYSBUF pvioPhysBuf,
                                       USHORT usReserved);

   APIRET16 _Far16 _Pascal  VIO16READCELLSTR (PCH pchCellStr,
                                        PUSHORT pcb,
                                        USHORT usRow,
                                        USHORT usColumn,
                                        HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16READCHARSTR (PCH pchCellStr,
                                        PUSHORT pcb,
                                        USHORT usRow,
                                        USHORT usColumn,
                                        HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16WRTCELLSTR (PCH pchCellStr,
                                       USHORT cb,
                                       USHORT usRow,
                                       USHORT usColumn,
                                       HVIO hvio);

   APIRET16  _Far16 _Pascal VIO16WRTCHARSTR (PCH pchStr,
                                       USHORT cb,
                                       USHORT usRow,
                                       USHORT usColumn,
                                       HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SCROLLDN (USHORT usTopRow,
                                     USHORT usLeftCol,
                                     USHORT usBotRow,
                                     USHORT usRightCol,
                                     USHORT cbLines,
                                     PBYTE pCell,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SCROLLUP (USHORT usTopRow,
                                     USHORT usLeftCol,
                                     USHORT usBotRow,
                                     USHORT usRightCol,
                                     USHORT cbLines,
                                     PBYTE pCell,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SCROLLLF (USHORT usTopRow,
                                     USHORT usLeftCol,
                                     USHORT usBotRow,
                                     USHORT usRightCol,
                                     USHORT cbCol,
                                     PBYTE pCell,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SCROLLRT (USHORT usTopRow,
                                     USHORT usLeftCol,
                                     USHORT usBotRow,
                                     USHORT usRightCol,
                                     USHORT cbCol,
                                     PBYTE pCell,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16WRTNATTR (PBYTE pAttr,
                                     USHORT cb,
                                     USHORT usRow,
                                     USHORT usColumn,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16WRTNCELL (PBYTE pCell,
                                     USHORT cb,
                                     USHORT usRow,
                                     USHORT usColumn,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16WRTNCHAR (PCH pchChar,
                                     USHORT cb,
                                     USHORT usRow,
                                     USHORT usColumn,
                                     HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16WRTTTY (PCH pch,
                                   USHORT cb,
                                   HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16WRTCHARSTRATT (PCH pch,
                                          USHORT cb,
                                          USHORT usRow,
                                          USHORT usColumn,
                                          PBYTE pAttr,
                                          HVIO hvio);
#line 615
   APIRET16 _Far16 _Pascal  VIO16CHECKCHARTYPE (PUSHORT pType,
                                          USHORT usRow,
                                          USHORT usColumn,
                                          HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SHOWBUF (USHORT offLVB,
                                    USHORT cb,
                                    HVIO hvio);
#line 628
   APIRET16 _Far16 _Pascal  VIO16SETANSI (USHORT fAnsi,
                                    HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16GETANSI (PUSHORT pfAnsi,
                                    HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16PRTSC (HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16PRTSCTOGGLE (HVIO hvio);
#line 650
   APIRET16 _Far16 _Pascal  VIO16REDRAWSIZE (PULONG pcbRedraw);

   APIRET16 _Far16 _Pascal  VIO16SAVREDRAWWAIT (USHORT usRedrawInd,
                                          PUSHORT pNotifyType,
                                          USHORT usReserved);

   APIRET16 _Far16 _Pascal  VIO16SAVREDRAWUNDO (USHORT usOwnerInd,
                                          USHORT usKillInd,
                                          USHORT usReserved);
#line 663
   APIRET16 _Far16 _Pascal  VIO16MODEWAIT (USHORT usReqType,
                                     PUSHORT pNotifyType,
                                     USHORT usReserved);

   APIRET16 _Far16 _Pascal  VIO16MODEUNDO (USHORT usOwnerInd,
                                     USHORT usKillInd,
                                     USHORT usReserved);
#line 677
   APIRET16 _Far16 _Pascal  VIO16SCRLOCK (USHORT fWait,
                                    PUCHAR pfNotLocked,
                                    HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SCRUNLOCK (HVIO hvio);
#line 688
   APIRET16 _Far16 _Pascal  VIO16POPUP (PUSHORT pfWait,
                                  HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16ENDPOPUP (HVIO hvio);
#line 720
   #pragma pack(2)

   typedef  struct _VIOCONFIGINFO    
   {
      USHORT  cb;
      USHORT  adapter;
      USHORT  display;
      ULONG   cbMemory;
      USHORT  Configuration;
      USHORT  VDHVersion;
      USHORT  Flags;
      ULONG   HWBufferSize;
      ULONG   FullSaveSize;
      ULONG   PartSaveSize;
      USHORT  EMAdaptersOFF;
      USHORT  EMDisplaysOFF;
   } VIOCONFIGINFO;

   typedef VIOCONFIGINFO *PVIOCONFIGINFO;
#line 745
   APIRET16 _Far16 _Pascal  VIO16GETCONFIG (USHORT usConfigId,
                                      PVIOCONFIGINFO pvioin,
                                      HVIO hvio);
#line 750
   typedef struct _VIOFONTINFO      
   {
      USHORT  cb;
      USHORT  type;
      USHORT  cxCell;
      USHORT  cyCell;
      PVOID16 pbData;
      USHORT  cbData;
   } VIOFONTINFO;
   typedef VIOFONTINFO *PVIOFONTINFO;
#line 764
   APIRET16 _Far16 _Pascal  VIO16GETFONT (PVIOFONTINFO pviofi,
                                    HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SETFONT (PVIOFONTINFO pviofi,
                                    HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16GETCP (USHORT usReserved,
                                  PUSHORT pIdCodePage,
                                  HVIO hvio);

   APIRET16 _Far16 _Pascal  VIO16SETCP (USHORT usReserved,
                                  USHORT idCodePage,
                                  HVIO hvio);

   typedef struct _VIOPALSTATE      
   {
      USHORT  cb;
      USHORT  type;
      USHORT  iFirst;
      USHORT  acolor[1];
   } VIOPALSTATE;
   typedef VIOPALSTATE *PVIOPALSTATE;

   typedef struct _VIOOVERSCAN      
   {
      USHORT  cb;
      USHORT  type;
      USHORT  color;
   } VIOOVERSCAN;
   typedef VIOOVERSCAN *PVIOOVERSCAN;

   typedef struct _VIOINTENSITY     
   {
      USHORT  cb;
      USHORT  type;
      USHORT  fs;
   } VIOINTENSITY;
   typedef VIOINTENSITY *PVIOINTENSITY;

   typedef struct _VIOCOLORREG     
   {
      USHORT  cb;
      USHORT  type;
      USHORT  firstcolorreg;
      USHORT  numcolorregs;
      PCH     colorregaddr;
   } VIOCOLORREG;
   typedef VIOCOLORREG *PVIOCOLORREG;

   typedef struct _VIOSETULINELOC     
   {
      USHORT  cb;
      USHORT  type;
      USHORT  scanline;
   } VIOSETULINELOC;
   typedef VIOSETULINELOC *PVIOSETULINELOC;

   typedef struct _VIOSETTARGET     
   {
      USHORT  cb;
      USHORT  type;
      USHORT  defaultalgorithm;
   } VIOSETTARGET;
   typedef VIOSETTARGET *PVIOSETTARGET;

   APIRET16 _Far16 _Pascal  VIO16GETSTATE (PVOID pState,
                                     HVIO hvio);
   APIRET16 _Far16 _Pascal  VIO16SETSTATE (PVOID pState,
                                     HVIO hvio);
#line 893
   typedef unsigned short  HMOU;
   typedef HMOU           *PHMOU;

   APIRET16 _Far16 _Pascal  MOU16REGISTER (PSZ pszModName,
                                     PSZ pszEntryName,
                                     ULONG flFuns);
#line 920
   APIRET16 _Far16 _Pascal  MOU16DEREGISTER (void);

   APIRET16 _Far16 _Pascal  MOU16FLUSHQUE (HMOU hmou);
#line 929
   typedef struct _PTRLOC       
   {
      USHORT row;
      USHORT col;
   } PTRLOC;
   typedef PTRLOC *PPTRLOC;

   APIRET16 _Far16 _Pascal  MOU16GETPTRPOS (PPTRLOC pmouLoc,
                                      HMOU hmou);
   APIRET16 _Far16 _Pascal  MOU16SETPTRPOS (PPTRLOC pmouLoc,
                                      HMOU hmou);
#line 942
   typedef struct _PTRSHAPE     
   {
      USHORT cb;
      USHORT col;
      USHORT row;
      USHORT colHot;
      USHORT rowHot;
   } PTRSHAPE;
   typedef PTRSHAPE *PPTRSHAPE;

   APIRET16 _Far16 _Pascal  MOU16SETPTRSHAPE (PBYTE pBuf,
                                        PPTRSHAPE pmoupsInfo,
                                        HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16GETPTRSHAPE (PBYTE pBuf,
                                        PPTRSHAPE pmoupsInfo,
                                        HMOU hmou);
#line 970
   APIRET16 _Far16 _Pascal  MOU16GETDEVSTATUS (PUSHORT pfsDevStatus,
                                         HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16GETNUMBUTTONS (PUSHORT pcButtons,
                                          HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16GETNUMMICKEYS (PUSHORT pcMickeys,
                                          HMOU hmou);
#line 985
   #pragma pack(2)

   typedef  struct _MOUEVENTINFO     
   {
      USHORT fs;
      ULONG  time;
      short  row;
      short  col;
   } MOUEVENTINFO;
   typedef MOUEVENTINFO *PMOUEVENTINFO;

   APIRET16 _Far16 _Pascal  MOU16READEVENTQUE (PMOUEVENTINFO pmouevEvent,
                                         PUSHORT pfWait,
                                         HMOU hmou);
#line 1001
   typedef struct _MOUQUEINFO       
   {
      USHORT cEvents;
      USHORT cmaxEvents;
   } MOUQUEINFO;
   typedef MOUQUEINFO *PMOUQUEINFO;

   APIRET16 _Far16 _Pascal  MOU16GETNUMQUEEL (PMOUQUEINFO qmouqi,
                                        HMOU hmou);
#line 1021
   APIRET16 _Far16 _Pascal  MOU16GETEVENTMASK (PUSHORT pfsEvents,
                                         HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16SETEVENTMASK (PUSHORT pfsEvents,
                                         HMOU hmou);
#line 1028
   typedef  struct _SCALEFACT    
   {
      USHORT rowScale;
      USHORT colScale;
   } SCALEFACT;
   typedef SCALEFACT *PSCALEFACT;

   APIRET16 _Far16 _Pascal  MOU16GETSCALEFACT (PSCALEFACT pmouscFactors,
                                         HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16SETSCALEFACT (PSCALEFACT pmouscFactors,
                                         HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16OPEN (PSZ pszDvrName,
                                 PHMOU phmou);

   APIRET16 _Far16 _Pascal  MOU16CLOSE (HMOU hmou);
#line 1047
   typedef struct _NOPTRRECT    
   {
      USHORT row;
      USHORT col;
      USHORT cRow;
      USHORT cCol;
   } NOPTRRECT;
   typedef NOPTRRECT *PNOPTRRECT;

   APIRET16 _Far16 _Pascal  MOU16REMOVEPTR (PNOPTRRECT pmourtRect,
                                      HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16DRAWPTR (HMOU hmou);
#line 1066
   APIRET16 _Far16 _Pascal  MOU16SETDEVSTATUS (PUSHORT pfsDevStatus,
                                         HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16INITREAL (PSZ);

   APIRET16 _Far16 _Pascal  MOU16SYNCH(USHORT pszDvrName);

   typedef struct _THRESHOLD        
   {
      USHORT Length;           
      USHORT Level1;           
      USHORT Lev1Mult;         
      USHORT Level2;           
      USHORT lev2Mult;         
   } THRESHOLD;
   typedef THRESHOLD *PTHRESHOLD;

   APIRET16 _Far16 _Pascal  MOU16GETTHRESHOLD(PTHRESHOLD pthreshold,
                                        HMOU hmou);

   APIRET16 _Far16 _Pascal  MOU16SETTHRESHOLD(PTHRESHOLD pthreshold,
                                        HMOU hmou);
#line 1092
#pragma pack()
#line 1101
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 69 "F:\IBMCPP\INCLUDE\OS2\bse.h"
#pragma info( none )

      #pragma info( restore )

#pragma info( restore )
#line 41 "F:\IBMCPP\INCLUDE\OS2\pm.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 68 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 168
typedef void *MPARAM;     
typedef MPARAM *PMPARAM;    
typedef void *MRESULT;    
typedef MRESULT *PMRESULT;   
#line 226
typedef MRESULT (_System FNWP)(HWND, ULONG, MPARAM, MPARAM);
typedef FNWP *PFNWP;
#line 321
   BOOL    _System WinRegisterClass(HAB hab,
                                     PSZ pszClassName,
                                     PFNWP pfnWndProc,
                                     ULONG flStyle,
                                     ULONG cbWindowData);
#line 328
   MRESULT _System WinDefWindowProc(HWND hwnd,
                                     ULONG msg,
                                     MPARAM mp1,
                                     MPARAM mp2);

   BOOL    _System WinDestroyWindow(HWND hwnd);

   BOOL    _System WinShowWindow(HWND hwnd,
                                  BOOL fShow);

   BOOL    _System WinQueryWindowRect(HWND hwnd,
                                       PRECTL prclDest);

   HPS     _System WinGetPS(HWND hwnd);

   BOOL    _System WinReleasePS(HPS hps);

   BOOL    _System WinEndPaint(HPS hps);
#line 349
      HPS   _System WinGetClipPS(HWND hwnd,
                                  HWND hwndClip,
                                  ULONG fl);

      BOOL  _System WinIsWindowShowing(HWND hwnd);
#line 357
   HPS   _System WinBeginPaint(HWND hwnd,
                                HPS hps,
                                PRECTL prclPaint);
   HDC   _System WinOpenWindowDC(HWND hwnd);

   long _System WinScrollWindow(HWND hwnd,
                                 long dx,
                                 long dy,
                                 PRECTL prclScroll,
                                 PRECTL prclClip,
                                 HRGN hrgnUpdate,
                                 PRECTL prclUpdate,
                                 ULONG rgfsw);
#line 387
   BOOL  _System WinFillRect(HPS hps,
                              PRECTL prcl,
                              long lColor);
#line 393
   typedef struct _QVERSDATA     
   {
      USHORT   environment;
      USHORT   version;
   } QVERSDATA;
   typedef QVERSDATA *PQVERSDATA;
#line 407
   ULONG  _System WinQueryVersion(HAB hab);

   HAB    _System WinInitialize(ULONG flOptions);

   BOOL   _System WinTerminate(HAB hab);

   HAB    _System WinQueryAnchorBlock(HWND hwnd);
#line 437
HWND    _System WinCreateWindow(HWND hwndParent,
                                 PSZ pszClass,
                                 PSZ pszName,
                                 ULONG flStyle,
                                 long x,
                                 long y,
                                 long cx,
                                 long cy,
                                 HWND hwndOwner,
                                 HWND hwndInsertBehind,
                                 ULONG id,
                                 PVOID pCtlData,
                                 PVOID pPresParams);
#line 452
BOOL    _System WinEnableWindow(HWND hwnd,
                                 BOOL fEnable);

BOOL    _System WinIsWindowEnabled(HWND hwnd);

BOOL    _System WinEnableWindowUpdate(HWND hwnd,
                                       BOOL fEnable);

BOOL    _System WinIsWindowVisible(HWND hwnd);

long    _System WinQueryWindowText(HWND hwnd,
                                    long cchBufferMax,
                                    PCH pchBuffer);
#line 470
BOOL    _System WinSetWindowText(HWND hwnd,
                                  PSZ pszText);
#line 474
long    _System WinQueryWindowTextLength(HWND hwnd);

HWND    _System WinWindowFromID(HWND hwndParent,
                                 ULONG id);

BOOL    _System WinIsWindow(HAB hab,
                             HWND hwnd);

HWND    _System WinQueryWindow(HWND hwnd,
                                long cmd);

long    _System WinMultWindowFromIDs(HWND hwndParent,
                                      PHWND prghwnd,
                                      ULONG idFirst,
                                      ULONG idLast);
#line 502
BOOL   _System WinSetParent(HWND hwnd,
                             HWND hwndNewParent,
                             BOOL fRedraw);

BOOL   _System WinIsChild(HWND hwnd,
                           HWND hwndParent);
BOOL   _System WinSetOwner(HWND hwnd,
                            HWND hwndNewOwner);

   BOOL   _System WinQueryWindowProcess(HWND hwnd,
                                         PPID ppid,
                                         PTID ptid);
#line 516
HWND   _System WinQueryObjectWindow(HWND hwndDesktop);
HWND   _System WinQueryDesktopWindow(HAB hab,
                                      HDC hdc);
#line 524
typedef struct _SWP     
{
   ULONG   fl;
   long    cy;
   long    cx;
   long    y;
   long    x;
   HWND    hwndInsertBehind;
   HWND    hwnd;
   ULONG   ulReserved1;
   ULONG   ulReserved2;
} SWP;
typedef SWP *PSWP;

BOOL   _System WinSetWindowPos(HWND hwnd,
                                HWND hwndInsertBehind,
                                long x,
                                long y,
                                long cx,
                                long cy,
                                ULONG fl);
BOOL   _System WinSetMultWindowPos(HAB hab,
                                    PSWP pswp,
                                    ULONG cswp);
BOOL   _System WinQueryWindowPos(HWND hwnd,
                                  PSWP pswp);
#line 580
BOOL  _System WinUpdateWindow(HWND hwnd);

BOOL  _System WinInvalidateRect(HWND hwnd,
                                 PRECTL pwrc,
                                 BOOL fIncludeChildren);

BOOL  _System WinInvalidateRegion(HWND hwnd,
                                   HRGN hrgn,
                                   BOOL fIncludeChildren);
#line 593
BOOL  _System WinInvertRect(HPS hps,
                             PRECTL prcl);
BOOL  _System WinDrawBitmap(HPS hpsDst,
                             HBITMAP hbm,
                             PRECTL pwrcSrc,
                             PPOINTL pptlDst,
                             long clrFore,
                             long clrBack,
                             ULONG fl);
#line 613
long    _System WinDrawText(HPS hps,
                             long cchText,
                             PCH lpchText,
                             PRECTL prcl,
                             long clrFore,
                             long clrBack,
                             ULONG flCmd);
#line 645
BOOL _System WinDrawBorder(HPS hps,
                            PRECTL prcl,
                            long cx,
                            long cy,
                            long clrFore,
                            long clrBack,
                            ULONG flCmd);
#line 678
long    _System WinLoadString(HAB hab,
                               HMODULE hmod,
                               ULONG id,
                               long cchMax,
                               PSZ pchBuffer);
#line 692
   long    _System WinLoadMessage(HAB hab,
                                   HMODULE hmod,
                                   ULONG id,
                                   long cchMax,
                                   PSZ pchBuffer);
#line 706
   BOOL _System WinSetActiveWindow(HWND hwndDesktop,
                                    HWND hwnd);
#line 714
   typedef struct _CREATESTRUCT     
   {
      PVOID   pPresParams;
      PVOID   pCtlData;
      ULONG   id;
      HWND    hwndInsertBehind;
      HWND    hwndOwner;
      long    cy;
      long    cx;
      long    y;
      long    x;
      ULONG   flStyle;
      PSZ     pszText;
      PSZ     pszClass;
      HWND    hwndParent;
   } CREATESTRUCT;
   typedef CREATESTRUCT *PCREATESTRUCT;
#line 734
   typedef struct _CLASSINFO     
   {
      ULONG   flClassStyle;
      PFNWP   pfnWindowProc;
      ULONG   cbWindowData;
   } CLASSINFO;
   typedef CLASSINFO *PCLASSINFO;
#line 743
      PFNWP  _System WinSubclassWindow(HWND hwnd,
                                        PFNWP pfnwp);
#line 747
   long    _System WinQueryClassName(HWND hwnd,
                                      long cchMax,
                                      PCH pch);
#line 755
   BOOL   _System WinQueryClassInfo(HAB hab,
                                     PSZ pszClassName,
                                     PCLASSINFO pClassInfo);
#line 760
   HWND   _System WinQueryActiveWindow(HWND hwndDesktop);
#line 763
      BOOL   _System WinIsThreadActive(HAB hab);

   HWND   _System WinQuerySysModalWindow(HWND hwndDesktop);
#line 768
   BOOL   _System WinSetSysModalWindow(HWND hwndDesktop,
                                        HWND hwnd);
#line 773
      USHORT _System WinQueryWindowUShort(HWND hwnd,
                                           long index);
      BOOL   _System WinSetWindowUShort(HWND hwnd,
                                         long index,
                                         USHORT us);
      ULONG  _System WinQueryWindowULong(HWND hwnd,
                                          long index);
      BOOL   _System WinSetWindowULong(HWND hwnd,
                                        long index,
                                        ULONG ul);
      PVOID  _System WinQueryWindowPtr(HWND hwnd,
                                        long index);
      BOOL   _System WinSetWindowPtr(HWND hwnd,
                                      long index,
                                      PVOID p);
      BOOL   _System WinSetWindowBits(HWND hwnd,
                                       long index,
                                       ULONG flData,
                                       ULONG flMask);
#line 826
      typedef LHANDLE HENUM;   

      HENUM _System WinBeginEnumWindows(HWND hwnd);
      HWND  _System WinGetNextWindow(HENUM henum);
      BOOL  _System WinEndEnumWindows(HENUM henum);
#line 834
   HWND  _System WinWindowFromPoint(HWND hwnd,
                                     PPOINTL pptl,
                                     BOOL fChildren);

   BOOL  _System WinMapWindowPoints(HWND hwndFrom,
                                     HWND hwndTo,
                                     PPOINTL prgptl,
                                     long cwpt);
#line 846
   BOOL  _System WinValidateRect(HWND hwnd,
                                  PRECTL prcl,
                                  BOOL fIncludeChildren);

   BOOL  _System WinValidateRegion(HWND hwnd,
                                    HRGN hrgn,
                                    BOOL fIncludeChildren);
#line 855
      HWND  _System WinWindowFromDC(HDC hdc);

      HDC   _System WinQueryWindowDC(HWND hwnd);

      HPS   _System WinGetScreenPS(HWND hwndDesktop);

      BOOL  _System WinLockWindowUpdate(HWND hwndDesktop,
                                         HWND hwndLockUpdate);

      BOOL  _System WinLockVisRegions(HWND hwndDesktop,
                                       BOOL fLock);
#line 868
   BOOL  _System WinQueryUpdateRect(HWND hwnd,
                                     PRECTL prcl);

   long _System WinQueryUpdateRegion(HWND hwnd,
                                      HRGN hrgn);

   long _System WinExcludeUpdateRegion(HPS hps,
                                        HWND hwnd);
#line 882
   typedef struct _QMSG     
   {
      HWND    hwnd;
      ULONG   msg;
      MPARAM  mp1;
      MPARAM  mp2;
      ULONG   time;
      POINTL  ptl;
      ULONG   reserved;
   } QMSG;
   typedef QMSG *PQMSG;
#line 983
   #pragma pack(1)  
#line 989
   typedef struct _COMMANDMSG     
   {
      USHORT  cmd;               
      USHORT  unused;
      USHORT  source;            
      USHORT  fMouse;
   } CMDMSG;
   typedef CMDMSG *PCMDMSG;
#line 1001
   #pragma pack()   
#line 1004
   typedef struct _MQINFO     
   {
      ULONG   cb;
      PID     pid;
      TID     tid;
      ULONG   cmsgs;
      PVOID   pReserved;
   } MQINFO;
   typedef MQINFO *PMQINFO;

   MRESULT _System WinSendMsg(HWND hwnd,
                               ULONG msg,
                               MPARAM mp1,
                               MPARAM mp2);

   HMQ     _System WinCreateMsgQueue(HAB hab,
                                      long cmsg);

   BOOL    _System WinDestroyMsgQueue(HMQ hmq);

   BOOL    _System WinQueryQueueInfo(HMQ hmq,
                                      PMQINFO pmqi,
                                      ULONG cbCopy);
#line 1029
      BOOL    _System WinCancelShutdown(HMQ hmq,
                                         BOOL fCancelAlways);
#line 1033
   BOOL    _System WinGetMsg(HAB hab,
                              PQMSG pqmsg,
                              HWND hwndFilter,
                              ULONG msgFilterFirst,
                              ULONG msgFilterLast);

   BOOL    _System WinPeekMsg(HAB hab,
                               PQMSG pqmsg,
                               HWND hwndFilter,
                               ULONG msgFilterFirst,
                               ULONG msgFilterLast,
                               ULONG fl);

   MRESULT _System WinDispatchMsg(HAB hab,
                                   PQMSG pqmsg);

   BOOL    _System WinPostMsg(HWND hwnd,
                               ULONG msg,
                               MPARAM mp1,
                               MPARAM mp2);

   BOOL    _System WinRegisterUserMsg(HAB hab,
                                       ULONG msgid,
                                       long datatype1,
                                       long dir1,
                                       long datatype2,
                                       long dir2,
                                       long datatyper);

   BOOL    _System WinRegisterUserDatatype(HAB hab,
                                            long datatype,
                                            long count,
                                            PLONG types);
#line 1071
   BOOL    _System WinSetMsgMode(HAB hab,
                                  PSZ classname,
                                  long control);
#line 1076
   BOOL    _System WinSetSynchroMode(HAB hab,
                                      long mode);
#line 21 "F:\IBMCPP\INCLUDE\OS2\pmtypes.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 292
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 1120 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
   typedef struct _WNDPARAMS     
   {
      ULONG   fsStatus;
      ULONG   cchText;
      PSZ     pszText;
      ULONG   cbPresParams;
      PVOID   pPresParams;
      ULONG   cbCtlData;
      PVOID   pCtlData;
   } WNDPARAMS;
   typedef WNDPARAMS *PWNDPARAMS;
#line 1140
      BOOL    _System WinInSendMsg(HAB hab);
#line 1143
   BOOL    _System WinBroadcastMsg(HWND hwnd,
                                    ULONG msg,
                                    MPARAM mp1,
                                    MPARAM mp2,
                                    ULONG rgf);
#line 1156
   BOOL  _System WinWaitMsg(HAB hab,
                             ULONG msgFirst,
                             ULONG msgLast);
#line 1161
      ULONG _System WinQueryQueueStatus(HWND hwndDesktop);
#line 1178
      BOOL  _System WinQueryMsgPos(HAB hab,
                                    PPOINTL pptl);

      ULONG _System WinQueryMsgTime(HAB hab);
#line 1192
      APIRET _System WinWaitEventSem(HEV hev,
                                      ULONG ulTimeout);

      APIRET _System WinRequestMutexSem(HMTX hmtx,
                                         ULONG ulTimeout);

      APIRET _System WinWaitMuxWaitSem(HMUX hmux,
                                        ULONG ulTimeout,
                                        PULONG pulUser);
#line 1205
   BOOL  _System WinPostQueueMsg(HMQ hmq,
                                  ULONG msg,
                                  MPARAM mp1,
                                  MPARAM mp2);
#line 1217
   BOOL  _System WinSetMsgInterest(HWND hwnd,
                                    ULONG msg_class,
                                    long control);
#line 1227
   BOOL  _System WinSetClassMsgInterest(HAB hab,
                                         PSZ pszClassName,
                                         ULONG msg_class,
                                         long control);
#line 1240
   BOOL  _System WinSetFocus(HWND hwndDesktop,
                              HWND hwndSetFocus);

   BOOL  _System WinFocusChange(HWND hwndDesktop,
                                 HWND hwndSetFocus,
                                 ULONG flFocusChange);

   BOOL  _System WinLockupSystem(HAB hab);

   BOOL  _System WinUnlockSystem(HAB hab, PSZ pszPassword);
#line 1275
BOOL _System WinSetVisibleRegionNotify( HWND hwnd,
                                        BOOL fEnable);

ULONG _System WinQueryVisibleRegion( HWND hwnd,
                                     HRGN hrgn);
#line 1284
      BOOL  _System WinSetCapture(HWND hwndDesktop,
                                   HWND hwnd);
#line 1288
   HWND  _System WinQueryCapture(HWND hwndDesktop);

   BOOL  _System WinCheckInput(HAB hab);
#line 1358
   HWND  _System WinQueryFocus(HWND hwndDesktop);
#line 1388
   #pragma pack(1)  
#line 1394
   typedef struct _MOUSEMSG     
   {
      short   x;              
      short   y;
      USHORT  codeHitTest;    
      USHORT  fsInp;          
   } MSEMSG;
   typedef MSEMSG *PMSEMSG;
#line 1406
   typedef struct _CHARMSG     
   {
      USHORT  fs;            
      UCHAR   cRepeat;
      UCHAR   scancode;
      USHORT  chr;           
      USHORT  vkey;
   } CHRMSG;
   typedef CHRMSG *PCHRMSG;
#line 1419
   #pragma pack()   
#line 1518
      long _System WinGetKeyState(HWND hwndDesktop,
                                   long vkey);
      long _System WinGetPhysKeyState(HWND hwndDesktop,
                                       long sc);
      BOOL  _System WinEnablePhysInput(HWND hwndDesktop,
                                        BOOL fEnable);
      BOOL  _System WinIsPhysInputEnabled(HWND hwndDesktop);
      BOOL  _System WinSetKeyboardStateTable(HWND hwndDesktop,
                                              PBYTE pKeyStateTable,
                                              BOOL fSet);
#line 1540
typedef LHANDLE HPOINTER;    
#line 1548
   BOOL    _System WinGetDlgMsg(HWND hwndDlg,
                                 PQMSG pqmsg);

   HWND    _System WinLoadDlg(HWND hwndParent,
                               HWND hwndOwner,
                               PFNWP pfnDlgProc,
                               HMODULE hmod,
                               ULONG idDlg,
                               PVOID pCreateParams);
   ULONG  _System WinDlgBox(HWND hwndParent,
                             HWND hwndOwner,
                             PFNWP pfnDlgProc,
                             HMODULE hmod,
                             ULONG idDlg,
                             PVOID pCreateParams);

   BOOL    _System WinDismissDlg(HWND hwndDlg,
                                  ULONG usResult);

   BOOL    _System WinQueryDlgItemShort(HWND hwndDlg,
                                         ULONG idItem,
                                         PSHORT pResult,
                                         BOOL fSigned);
   BOOL    _System WinSetDlgItemShort(HWND hwndDlg,
                                       ULONG idItem,
                                       USHORT usValue,
                                       BOOL fSigned);
#line 1580
   BOOL    _System WinSetDlgItemText(HWND hwndDlg,
                                      ULONG idItem,
                                      PSZ pszText);
#line 1590
   ULONG  _System WinQueryDlgItemText(HWND hwndDlg,
                                       ULONG idItem,
                                       long cchBufferMax,
                                       PSZ pchBuffer);

   long   _System WinQueryDlgItemTextLength(HWND hwndDlg,
                                             ULONG idItem);

   MRESULT _System WinDefDlgProc(HWND hwndDlg,
                                  ULONG msg,
                                  MPARAM mp1,
                                  MPARAM mp2);
#line 1611
   BOOL _System WinAlarm(HWND hwndDesktop,
                          ULONG rgfType);
#line 1630
   ULONG _System WinMessageBox(HWND hwndParent,
                                HWND hwndOwner,
                                PSZ pszText,
                                PSZ pszCaption,
                                ULONG idWindow,
                                ULONG flStyle);
#line 1644
   #pragma pack(4)

   typedef struct _MB2D
   {
      char   achText[70 + 1];  
      ULONG  idButton;                   

      long   flStyle;                    

   } MB2D;

   typedef MB2D * PMB2D;

   typedef struct _MB2INFO
   {
      ULONG    cb;                   
      HPOINTER hIcon;                
      ULONG    cButtons;             
      ULONG    flStyle;              
      HWND     hwndNotify;           
      MB2D     mb2d[1];              
   } MB2INFO;

   typedef MB2INFO * PMB2INFO;

   #pragma pack()
#line 1681
   ULONG  _System  WinMessageBox2(HWND     hwndParent,
   HWND     hwndOwner,
   PSZ      pszText,
   PSZ      pszCaption,
   ULONG    idWindow,
   PMB2INFO pmb2info);
#line 1798
   ULONG  _System WinProcessDlg(HWND hwndDlg);
   MRESULT _System WinSendDlgItemMsg(HWND hwndDlg,
                                      ULONG idItem,
                                      ULONG msg,
                                      MPARAM mp1,
                                      MPARAM mp2);
   BOOL    _System WinMapDlgPoints(HWND hwndDlg,
                                    PPOINTL prgwptl,
                                    ULONG cwpt,
                                    BOOL fCalcWindowCoords);
   HWND    _System WinEnumDlgItem(HWND hwndDlg,
                                   HWND hwnd,
                                   ULONG code);
#line 1817
   long   _System WinSubstituteStrings(HWND hwnd,
                                        PSZ pszSrc,
                                        long cchDstMax,
                                        PSZ pszDst);
#line 1839
   #pragma pack(2)  
#line 1854
   typedef struct _DLGTITEM     
   {
      USHORT  fsItemStatus;
      USHORT  cChildren;
      USHORT  cchClassName;
      USHORT  offClassName;
      USHORT  cchText;
      USHORT  offText;
      ULONG   flStyle;
      short   x;
      short   y;
      short   cx;
      short   cy;
      USHORT  id;
      USHORT  offPresParams;
      USHORT  offCtlData;
   } DLGTITEM;
   typedef DLGTITEM *PDLGTITEM;
#line 1879
   typedef struct _DLGTEMPLATE     
   {
      USHORT   cbTemplate;
      USHORT   type;
      USHORT   codepage;
      USHORT   offadlgti;
      USHORT   fsTemplateStatus;
      USHORT   iItemFocus;
      USHORT   coffPresParams;
      DLGTITEM adlgti[1];
   } DLGTEMPLATE;
   typedef DLGTEMPLATE *PDLGTEMPLATE;

   #pragma pack()   

   HWND   _System WinCreateDlg(HWND hwndParent,
                                HWND hwndOwner,
                                PFNWP pfnDlgProc,
                                PDLGTEMPLATE pdlgt,
                                PVOID pCreateParams);
#line 1979
      #pragma pack(2)  
#line 1985
      typedef struct _BTNCDATA     
      {
         USHORT  cb;
         USHORT  fsCheckState;
         USHORT  fsHiliteState;
         LHANDLE hImage;
      } BTNCDATA;
      typedef BTNCDATA *PBTNCDATA;

      #pragma pack()   
#line 2001
      typedef struct _USERBUTTON     
      {
         HWND    hwnd;
         HPS     hps;
         ULONG   fsState;
         ULONG   fsStateOld;
      } USERBUTTON;
      typedef USERBUTTON *PUSERBUTTON;
#line 2108
      #pragma pack(2)  
#line 2118
      typedef struct _COMBOCDATA           
      {
         ULONG   cbSize;              
         ULONG   reserved;            
         PVOID   pHWXCtlData;         
      } COMBOCDATA;
      typedef COMBOCDATA *PCOMBOCDATA;

      typedef struct _ENTRYFDATA     
      {
         USHORT  cb;
         USHORT  cchEditLimit;
         USHORT  ichMinSel;
         USHORT  ichMaxSel;
         PVOID   pHWXCtlData;     
      } ENTRYFDATA;
      typedef ENTRYFDATA *PENTRYFDATA;

      #pragma pack()   
#line 29 "F:\IBMCPP\INCLUDE\OS2\pmmle.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 57
   typedef long    IPT;         
   typedef PLONG   PIPT;        
   typedef long    PIX;         
   typedef ULONG   LINE;        

   typedef struct _FORMATRECT     
   {
      long cxFormat;            
      long cyFormat;            
   } MLEFORMATRECT;
   typedef MLEFORMATRECT *PFORMATRECT;

   typedef struct _MLECTLDATA     
   {
      USHORT   cbCtlData;       
      USHORT   afIEFormat;      
      ULONG    cchText;         
      IPT      iptAnchor;       
      IPT      iptCursor;       
      long     cxFormat;        
      long     cyFormat;        
      ULONG    afFormatFlags;   
      PVOID    pHWXCtlData;     
   } MLECTLDATA;
   typedef MLECTLDATA *PMLECTLDATA;
#line 102
   typedef struct _MLEOVERFLOW     
   {
      ULONG afErrInd;             
      long nBytesOver;            
      long pixHorzOver;           
      long pixVertOver;           
   }  MLEOVERFLOW;
   typedef MLEOVERFLOW *POVERFLOW;
#line 124
   typedef struct _MLEMARGSTRUCT     
   {
      USHORT afMargins;       
      USHORT usMouMsg;        
      IPT    iptNear;         
   } MLEMARGSTRUCT;
   typedef MLEMARGSTRUCT *PMARGSTRUCT;
#line 158
   typedef struct _SEARCH     
   {
      USHORT cb;             
      PCHAR  pchFind;        
      PCHAR  pchReplace;     
      short  cchFind;        
      short  cchReplace;     
      IPT    iptStart;       
#line 168
      IPT    iptStop;        

      USHORT cchFound;       
   } MLE_SEARCHDATA;
   typedef MLE_SEARCHDATA *PMLE_SEARCHDATA;
#line 274
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 2254 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
   typedef struct _LBOXINFO          
   {
      long  lItemIndex;             
      ULONG ulItemCount;            
      ULONG reserved;               
      ULONG reserved2;              
   } LBOXINFO;

   typedef LBOXINFO * PLBOXINFO;
#line 2344
   HWND _System WinLoadMenu(HWND hwndFrame,
                             HMODULE hmod,
                             ULONG idMenu);
#line 2378
      typedef struct _mti      
      {
         USHORT afStyle;       
         USHORT pad;           
         USHORT idItem;        
         char   c[2];          
      } MTI;

      typedef struct _mt       
      {
         ULONG  len;           
         USHORT codepage;      
         USHORT reserved;      
         USHORT cMti;          
         MTI    rgMti[1];      
      } MT;
      typedef MT *LPMT;
#line 2398
   HWND _System WinCreateMenu(HWND hwndParent,
                               PVOID lpmt);
#line 2404
      typedef struct _OWNERITEM     
      {
         HWND    hwnd;
         HPS     hps;
         ULONG   fsState;
         ULONG   fsAttribute;
         ULONG   fsStateOld;
         ULONG   fsAttributeOld;
         RECTL   rclItem;
         long    idItem;  
         ULONG   hItem;
      } OWNERITEM;
      typedef OWNERITEM *POWNERITEM;
#line 2421
   #pragma pack(2)  
#line 2427
   typedef struct _MENUITEM     
   {
      short   iPosition;
      USHORT  afStyle;
      USHORT  afAttribute;
      USHORT  id;
      HWND    hwndSubMenu;
      ULONG   hItem;
   } MENUITEM;
   typedef MENUITEM *PMENUITEM;

   #pragma pack()   
#line 2482
   BOOL _System WinPopupMenu(HWND hwndParent,
                              HWND hwndOwner,
                              HWND hwndMenu,
                              long x,
                              long y,
                              long idItem,
                              ULONG fs);
#line 2610
      #pragma pack(2)  
#line 2616
      typedef struct _SBCDATA     
      {
         USHORT  cb;
         USHORT  sHilite;       
         short   posFirst;
         short   posLast;
         short   posThumb;
         short   cVisible;
         short   cTotal;
      } SBCDATA;
      typedef SBCDATA *PSBCDATA;

      #pragma pack()   
#line 2637
   #pragma pack(2)  
#line 2643
   typedef struct _FRAMECDATA     
   {
      USHORT  cb;
      ULONG   flCreateFlags;
      USHORT  hmodResources;
      USHORT  idResources;
   } FRAMECDATA;
   typedef FRAMECDATA *PFRAMECDATA;

   #pragma pack()   
#line 2740
   HWND  _System WinCreateStdWindow(HWND hwndParent,
                                     ULONG flStyle,
                                     PULONG pflCreateFlags,
                                     PSZ pszClientClass,
                                     PSZ pszTitle,
                                     ULONG styleClient,
                                     HMODULE hmod,
                                     ULONG idResources,
                                     PHWND phwndClient);
#line 2757
   BOOL  _System WinFlashWindow(HWND hwndFrame,
                                 BOOL fFlash);
#line 2811
   BOOL  _System WinCreateFrameControls(HWND hwndFrame,
                                         PFRAMECDATA pfcdata,
                                         PSZ pszTitle);
#line 2816
   BOOL  _System WinCalcFrameRect(HWND hwndFrame,
                                   PRECTL prcl,
                                   BOOL fClient);

   BOOL  _System WinGetMinPosition(HWND hwnd,
                                    PSWP pswp,
                                    PPOINTL pptl);

      BOOL  _System WinGetMaxPosition(HWND hwnd,
                                       PSWP pswp);
#line 2828
   typedef LHANDLE HSAVEWP;       

   BOOL _System WinSaveWindowPos(HSAVEWP hsvwp,
                                  PSWP pswp,
                                  ULONG cswp);
#line 2907
   BOOL _System WinCopyRect(HAB hab,
                             PRECTL prclDst,
                             PRECTL prclSrc);
#line 2912
      BOOL _System WinSetRect(HAB hab,
                               PRECTL prcl,
                               long xLeft,
                               long yBottom,
                               long xRight,
                               long yTop);
      BOOL _System WinIsRectEmpty(HAB hab,
                                   PRECTL prcl);
      BOOL _System WinEqualRect(HAB hab,
                                 PRECTL prcl1,
                                 PRECTL prcl2);
      BOOL _System WinSetRectEmpty(HAB hab,
                                    PRECTL prcl);
      BOOL _System WinOffsetRect(HAB hab,
                                  PRECTL prcl,
                                  long cx,
                                  long cy);
      BOOL _System WinInflateRect(HAB hab,
                                   PRECTL prcl,
                                   long cx,
                                   long cy);
      BOOL _System WinPtInRect(HAB hab,
                                PRECTL prcl,
                                PPOINTL pptl);
      BOOL _System WinIntersectRect(HAB hab,
                                     PRECTL prclDst,
                                     PRECTL prclSrc1,
                                     PRECTL prclSrc2);
      BOOL _System WinUnionRect(HAB hab,
                                 PRECTL prclDst,
                                 PRECTL prclSrc1,
                                 PRECTL prclSrc2);
      BOOL _System WinSubtractRect(HAB hab,
                                    PRECTL prclDst,
                                    PRECTL prclSrc1,
                                    PRECTL prclSrc2);
      BOOL _System WinMakeRect(HAB hab,
                                PRECTL pwrc);
      BOOL _System WinMakePoints(HAB hab,
                                  PPOINTL pwpt,
                                  ULONG cwpt);
#line 2962
   long _System WinQuerySysValue(HWND hwndDesktop,
                                  long iSysValue);
   BOOL  _System WinSetSysValue(HWND hwndDesktop,
                                 long iSysValue,
                                 long lValue);
#line 3102
   typedef struct _PARAM     
   {
      ULONG   id;
      ULONG   cb;
      BYTE    ab[1];
   } PARAM;
   typedef PARAM *NPPARAM;
   typedef PARAM *PPARAM;

   typedef struct _PRESPARAMS     
   {
      ULONG   cb;
      PARAM   aparam[1];
   } PRESPARAMS;
   typedef PRESPARAMS *NPPRESPARAMS;
   typedef PRESPARAMS *PPRESPARAMS;
#line 3122
   BOOL  _System WinSetPresParam(HWND hwnd,
                                  ULONG id,
                                  ULONG cbParam,
                                  PVOID pbParam);
   ULONG _System WinQueryPresParam(HWND hwnd,
                                    ULONG id1,
                                    ULONG id2,
                                    PULONG pulId,
                                    ULONG cbBuf,
                                    PVOID pbBuf,
                                    ULONG fs);
   BOOL  _System WinRemovePresParam(HWND hwnd,
                                     ULONG id);
#line 3210
   long _System WinQuerySysColor(HWND hwndDesktop,
                                  long clr,
                                  long lReserved);
   BOOL _System WinSetSysColors(HWND hwndDesktop,
                                 ULONG flOptions,
                                 ULONG flFormat,
                                 long clrFirst,
                                 ULONG cclr,
                                 PLONG pclr);
#line 3273
      ULONG _System WinStartTimer(HAB hab,
                                   HWND hwnd,
                                   ULONG idTimer,
                                   ULONG dtTimeout);
      BOOL   _System WinStopTimer(HAB hab,
                                   HWND hwnd,
                                   ULONG idTimer);
#line 3282
      ULONG  _System WinGetCurrentTime(HAB hab);
#line 3292
typedef LHANDLE HACCEL;  
#line 3314
   #pragma pack(2)  
#line 3320
   typedef struct _ACCEL     
   {
      USHORT  fs;
      USHORT  key;
      USHORT  cmd;
   } ACCEL;
   typedef ACCEL *PACCEL;
#line 3332
   typedef struct _ACCELTABLE     
   {
      USHORT  cAccel;
      USHORT  codepage;
      ACCEL   aaccel[1];
   } ACCELTABLE;
   typedef ACCELTABLE *PACCELTABLE;

   #pragma pack()   

   HACCEL _System WinLoadAccelTable(HAB hab,
                                     HMODULE hmod,
                                     ULONG idAccelTable);
   ULONG _System WinCopyAccelTable(HACCEL haccel,
                                    PACCELTABLE pAccelTable,
                                    ULONG cbCopyMax);
   HACCEL _System WinCreateAccelTable(HAB hab,
                                       PACCELTABLE pAccelTable);
   BOOL   _System WinDestroyAccelTable(HACCEL haccel);
   BOOL   _System WinTranslateAccel(HAB hab,
                                     HWND hwnd,
                                     HACCEL haccel,
                                     PQMSG pqmsg);
   BOOL   _System WinSetAccelTable(HAB hab,
                                    HACCEL haccel,
                                    HWND hwndFrame);
   HACCEL _System WinQueryAccelTable(HAB hab,
                                      HWND hwndFrame);
#line 3375
   typedef struct _TRACKINFO     
   {
      long    cxBorder;
      long    cyBorder;
      long    cxGrid;
      long    cyGrid;
      long    cxKeyboard;
      long    cyKeyboard;
      RECTL   rclTrack;
      RECTL   rclBoundary;
      POINTL  ptlMinTrackSize;
      POINTL  ptlMaxTrackSize;
      ULONG   fs;
   } TRACKINFO;
   typedef TRACKINFO *PTRACKINFO;
#line 3392
      BOOL _System WinTrackRect(HWND hwnd,
                                 HPS hps,
                                 PTRACKINFO pti);
      BOOL _System WinShowTrackRect(HWND hwnd,
                                     BOOL fShow);
#line 3470
      #pragma pack(2)  
#line 3476
      typedef struct _MFP     
      {
         POINTL sizeBounds;   
         POINTL sizeMM;       
         ULONG  cbLength;     
         USHORT mapMode;      
         USHORT reserved;
         BYTE   abData[1];    
      } MFP;
      typedef MFP *PMFP;
#line 3491
      typedef struct _CPTEXT     
      {
         USHORT idCountry;
         USHORT usCodepage;
         USHORT usLangID;
         USHORT usSubLangID;
         BYTE   abText[1];    
      } CPTEXT;
      typedef CPTEXT *PCPTEXT;

      #pragma pack()   
#line 3508
      BOOL   _System WinSetClipbrdOwner(HAB hab,
                                         HWND hwnd);
      BOOL   _System WinSetClipbrdData(HAB hab,
                                        ULONG ulData,
                                        ULONG fmt,
                                        ULONG rgfFmtInfo);
      ULONG  _System WinQueryClipbrdData(HAB hab,
                                          ULONG fmt);
      BOOL   _System WinQueryClipbrdFmtInfo(HAB hab,
                                             ULONG fmt,
                                             PULONG prgfFmtInfo);
      BOOL   _System WinSetClipbrdViewer(HAB hab,
                                          HWND hwndNewClipViewer);
#line 3531
   ULONG _System WinEnumClipbrdFmts(HAB hab,
                                     ULONG fmt);
   BOOL   _System WinEmptyClipbrd(HAB hab);
   BOOL   _System WinOpenClipbrd(HAB hab);
   BOOL   _System WinCloseClipbrd(HAB hab);

   HWND   _System WinQueryClipbrdOwner(HAB hab);
   HWND   _System WinQueryClipbrdViewer(HAB hab);
#line 3546
   BOOL _System WinDestroyCursor(HWND hwnd);
   BOOL _System WinShowCursor(HWND hwnd,
                               BOOL fShow);
   BOOL _System WinCreateCursor(HWND hwnd,
                                 long x,
                                 long y,
                                 long cx,
                                 long cy,
                                 ULONG fs,
                                 PRECTL prclClip);
#line 3576
   typedef struct _CURSORINFO     
   {
      HWND    hwnd;
      long    x;
      long    y;
      long    cx;
      long    cy;
      ULONG   fs;
      RECTL   rclClip;
   } CURSORINFO;
   typedef CURSORINFO *PCURSORINFO;

   BOOL _System WinQueryCursorInfo(HWND hwndDesktop,
                                    PCURSORINFO pCursorInfo);
#line 3597
   BOOL     _System WinSetPointer(HWND hwndDesktop,
                                   HPOINTER hptrNew);
   BOOL     _System WinSetPointerOwner(HPOINTER hptr,
                                        PID pid,
                                        BOOL fDestroy);
   BOOL     _System WinShowPointer(HWND hwndDesktop,
                                    BOOL fShow);
   BOOL     _System WinLockPointerUpdate(HWND hwndDesktop,
                                          HPOINTER hptrNew,
                                          ULONG ulTimeInterval);
   HPOINTER _System WinQuerySysPointer(HWND hwndDesktop,
                                        long iptr,
                                        BOOL fLoad);

   BOOL _System WinQuerySysPointerData(HWND hwndDesktop,
                                        ULONG iptr,
                                        PICONINFO pIconInfo);
   BOOL _System WinSetSysPointerData(HWND hwndDesktop,
                                      ULONG iptr,
                                      PICONINFO pIconInfo);
#line 3653
   HPOINTER _System WinLoadPointer(HWND hwndDesktop,
                                    HMODULE hmod,
                                    ULONG idres);
   HPOINTER _System WinCreatePointer(HWND hwndDesktop,
                                      HBITMAP hbmPointer,
                                      BOOL fPointer,
                                      long xHotspot,
                                      long yHotspot);
   BOOL     _System WinSetPointerPos(HWND hwndDesktop,
                                      long x,
                                      long y);
   BOOL     _System WinDestroyPointer(HPOINTER hptr);

   HPOINTER _System WinQueryPointer(HWND hwndDesktop);
   BOOL     _System WinQueryPointerPos(HWND hwndDesktop,
                                        PPOINTL pptl);

   typedef struct _POINTERINFO     
   {
      ULONG   fPointer;
      long    xHotspot;
      long    yHotspot;
      HBITMAP hbmPointer;
      HBITMAP hbmColor;
      HBITMAP hbmMiniPointer;
      HBITMAP hbmMiniColor;
   } POINTERINFO;
   typedef POINTERINFO *PPOINTERINFO;

   HPOINTER _System WinCreatePointerIndirect(HWND hwndDesktop,
                                              PPOINTERINFO pptri);
   BOOL     _System WinQueryPointerInfo(HPOINTER hptr,
                                         PPOINTERINFO pPointerInfo);
   BOOL     _System WinDrawPointer(HPS hps,
                                    long x,
                                    long y,
                                    HPOINTER hptr,
                                    ULONG fs);
#line 3702
   HBITMAP _System WinGetSysBitmap(HWND hwndDesktop,
                                    ULONG ibm);
#line 3761
      BOOL _System WinSetHook(HAB hab,
                               HMQ hmq,
                               long iHook,
                               PFN pfnHook,
                               HMODULE hmod);
      BOOL _System WinReleaseHook(HAB hab,
                                   HMQ hmq,
                                   long iHook,
                                   PFN pfnHook,
                                   HMODULE hmod);
      BOOL _System WinCallMsgFilter(HAB hab,
                                     PQMSG pqmsg,
                                     ULONG msgf);
#line 3911
      typedef struct _SMHSTRUCT       
      {
         MPARAM mp2;
         MPARAM mp1;
         ULONG  msg;
         HWND   hwnd;
         ULONG  model;
      } SMHSTRUCT;
      typedef SMHSTRUCT *PSMHSTRUCT;
#line 3951
   BOOL    _System WinSetClassThunkProc(PSZ pszClassname,
                                         PFN pfnThunkProc);
#line 3957
   PFN     _System WinQueryClassThunkProc(PSZ pszClassname);

   BOOL    _System WinSetWindowThunkProc(HWND hwnd,
                                          PFN pfnThunkProc);
   PFN     _System WinQueryWindowThunkProc(HWND hwnd);
   long   _System WinQueryWindowModel(HWND hwnd);
#line 31 "F:\IBMCPP\INCLUDE\OS2\pmshl.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 60
   typedef LHANDLE HPROGRAM;        
   typedef HPROGRAM *PHPROGRAM;
   typedef LHANDLE HAPP;
#line 66
   typedef LHANDLE HINI;            
   typedef HINI *PHINI;
#line 77
   typedef struct _PRFPROFILE     
   {
      ULONG  cchUserName;
      PSZ    pszUserName;
      ULONG  cchSysName;
      PSZ    pszSysName;
   } PRFPROFILE;
   typedef PRFPROFILE *PPRFPROFILE;
#line 98
      typedef struct _HPROGARRAY        
      {
         HPROGRAM ahprog[1];
      } HPROGARRAY;
      typedef HPROGARRAY *PHPROGARRAY;
#line 106
   typedef ULONG PROGCATEGORY;        

   typedef PROGCATEGORY *PPROGCATEGORY;
#line 140
      typedef struct _PROGTYPE          
      {
         PROGCATEGORY progc;
         ULONG        fbVisible;
      } PROGTYPE;
      typedef PROGTYPE *PPROGTYPE;
#line 160
      typedef struct _PROGDETAILS     
      {
         ULONG     Length;          
         PROGTYPE  progt;
         PSZ       pszTitle;        
         PSZ       pszExecutable;
         PSZ       pszParameters;
         PSZ       pszStartupDir;
         PSZ       pszIcon;
         PSZ       pszEnvironment;  
         SWP       swpInitial;      
      } PROGDETAILS;
      typedef  PROGDETAILS *PPROGDETAILS;

      typedef struct _PROGTITLE              
      {
         HPROGRAM hprog;
         PROGTYPE progt;
         PSZ      pszTitle;
      } PROGTITLE;
      typedef PROGTITLE *PPROGTITLE;
#line 187
      ULONG _System PrfQueryProgramTitles(HINI hini,
                                           HPROGRAM hprogGroup,
                                           PPROGTITLE pTitles,
                                           ULONG cchBufferMax,
                                           PULONG pulCount);
#line 212
      HPROGRAM _System PrfAddProgram(HINI hini,
                                      PPROGDETAILS pDetails,
                                      HPROGRAM hprogGroup);

      BOOL     _System PrfChangeProgram(HINI hini,
                                         HPROGRAM hprog,
                                         PPROGDETAILS pDetails);

      ULONG    _System PrfQueryDefinition(HINI hini,
                                           HPROGRAM hprog,
                                           PPROGDETAILS pDetails,
                                           ULONG cchBufferMax);
#line 243
      BOOL     _System PrfRemoveProgram(HINI hini,
                                         HPROGRAM hprog);
#line 253
      ULONG    _System PrfQueryProgramHandle(HINI hini,
                                              PSZ pszExe,
                                              PHPROGARRAY phprogArray,
                                              ULONG cchBufferMax,
                                              PULONG pulCount);
#line 265
      HPROGRAM _System PrfCreateGroup(HINI hini,
                                       PSZ pszTitle,
                                       UCHAR chVisibility);
#line 270
      BOOL     _System PrfDestroyGroup(HINI hini,
                                        HPROGRAM hprogGroup);
#line 277
      PROGCATEGORY  _System PrfQueryProgramCategory(HINI hini,
                                                     PSZ pszExe);
#line 288
      HAPP _System WinStartApp(HWND hwndNotify,
                                PPROGDETAILS pDetails,
                                PSZ pszParams,
                                PVOID Reserved,
                                ULONG fbOptions);
#line 305
      BOOL _System WinTerminateApp(HAPP happ);
#line 313
typedef LHANDLE HSWITCH;         
typedef HSWITCH *PHSWITCH;
#line 319
      typedef struct _SWCNTRL           
      {
         HWND     hwnd;
         HWND     hwndIcon;
         HPROGRAM hprog;
         PID      idProcess;
         ULONG    idSession;
         ULONG    uchVisibility;
         ULONG    fbJump;
         char     szSwtitle[60+4];
         ULONG    bProgType;
      } SWCNTRL;

      typedef SWCNTRL *PSWCNTRL;
#line 345
      HSWITCH _System WinAddSwitchEntry(PSWCNTRL);
      ULONG   _System WinRemoveSwitchEntry(HSWITCH);
#line 352
      typedef struct _SWENTRY           
      {
         HSWITCH hswitch;
         SWCNTRL swctl;
      } SWENTRY;
      typedef SWENTRY *PSWENTRY;

      typedef struct _SWBLOCK           
      {
         ULONG    cswentry;
         SWENTRY aswentry[1];
      } SWBLOCK;
      typedef SWBLOCK *PSWBLOCK;
#line 368
      ULONG   _System WinChangeSwitchEntry(HSWITCH hswitchSwitch,
                                            PSWCNTRL pswctlSwitchData);

      HSWITCH  _System WinCreateSwitchEntry(HAB hab,
                                             PSWCNTRL pswctlSwitchData);
#line 380
      ULONG   _System WinQuerySessionTitle(HAB hab,
                                            ULONG usSession,
                                            PSZ pszTitle,
                                            ULONG usTitlelen);
#line 386
      ULONG   _System WinQuerySwitchEntry(HSWITCH hswitchSwitch,
                                           PSWCNTRL pswctlSwitchData);

      HSWITCH  _System WinQuerySwitchHandle(HWND hwnd,
                                             PID pidProcess);
      ULONG   _System WinQuerySwitchList(HAB hab,
                                          PSWBLOCK pswblkSwitchEntries,
                                          ULONG usDataLength);

      ULONG   _System WinQueryTaskSizePos(HAB hab,
                                           ULONG usScreenGroup,
                                           PSWP pswpPositionData);
#line 404
      ULONG   _System WinQueryTaskTitle(ULONG usSession,
                                         PSZ pszTitle,
                                         ULONG usTitlelen);
#line 409
      ULONG   _System WinSwitchToProgram(HSWITCH hswitchSwHandle);
#line 424
      long   _System PrfQueryProfileInt(HINI hini,
                                         PSZ pszApp,
                                         PSZ pszKey,
                                         long  sDefault);
#line 438
      ULONG  _System PrfQueryProfileString(HINI hini,
                                            PSZ pszApp,
                                            PSZ pszKey,
                                            PSZ pszDefault,
                                            PVOID pBuffer,
                                            ULONG cchBufferMax);
#line 452
      BOOL   _System PrfWriteProfileString(HINI hini,
                                            PSZ pszApp,
                                            PSZ pszKey,
                                            PSZ pszData);
#line 464
      BOOL   _System PrfQueryProfileSize(HINI hini,
                                          PSZ pszApp,
                                          PSZ pszKey,
                                          PULONG pulReqLen);
#line 477
      BOOL   _System PrfQueryProfileData(HINI hini,
                                          PSZ pszApp,
                                          PSZ pszKey,
                                          PVOID pBuffer,
                                          PULONG pulBuffLen);
#line 491
      BOOL   _System PrfWriteProfileData(HINI hini,
                                          PSZ pszApp,
                                          PSZ pszKey,
                                          PVOID pData,
                                          ULONG cchDataLen);
#line 502
      HINI   _System PrfOpenProfile(HAB hab,
                                     PSZ pszFileName);
#line 506
      BOOL   _System PrfCloseProfile(HINI hini);

      BOOL   _System PrfReset(HAB hab,
                               PPRFPROFILE pPrfProfile);

      BOOL   _System PrfQueryProfile(HAB hab,
                                      PPRFPROFILE pPrfProfile);
#line 24 "F:\IBMCPP\INCLUDE\OS2\pmerr.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 901
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 530 "F:\IBMCPP\INCLUDE\OS2\pmshl.h"
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 3975 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
   ULONG  _System WinQueryCp(HMQ hmq);
#line 3978
      BOOL    _System WinSetCp(HMQ hmq,
                                ULONG idCodePage);

      ULONG  _System WinQueryCpList(HAB hab,
                                     ULONG ccpMax,
                                     PULONG prgcp);
#line 3993
      BOOL    _System WinCpTranslateString(HAB hab,
                                            ULONG cpSrc,
                                            PSZ pszSrc,
                                            ULONG cpDst,
                                            ULONG cchDestMax,
                                            PSZ pchDest);
#line 4001
      UCHAR   _System WinCpTranslateChar(HAB hab,
                                          ULONG cpSrc,
                                          UCHAR chSrc,
                                          ULONG cpDst);
#line 4012
      ULONG  _System WinUpper(HAB hab,
                               ULONG idcp,
                               ULONG idcc,
                               PSZ psz);
#line 4018
      ULONG  _System WinUpperChar(HAB hab,
                                   ULONG idcp,
                                   ULONG idcc,
                                   ULONG c);
#line 4029
      PSZ     _System WinNextChar(HAB hab,
                                   ULONG idcp,
                                   ULONG idcc,
                                   PSZ psz);
#line 4042
      PSZ     _System WinPrevChar(HAB hab,
                                   ULONG idcp,
                                   ULONG idcc,
                                   PSZ pszStart,
                                   PSZ psz);
#line 4057
      ULONG  _System WinCompareStrings(HAB hab,
                                        ULONG idcp,
                                        ULONG idcc,
                                        PSZ psz1,
                                        PSZ psz2,
                                        ULONG reserved);
#line 4089
      typedef LHANDLE  HATOMTBL;
      typedef ULONG   ATOM;

      HATOMTBL _System WinQuerySystemAtomTable(void);
      HATOMTBL _System WinCreateAtomTable(ULONG cbInitial,
                                           ULONG cBuckets);
      HATOMTBL _System WinDestroyAtomTable(HATOMTBL hAtomTbl);
#line 4100
      ATOM     _System WinAddAtom(HATOMTBL hAtomTbl,
                                   PSZ pszAtomName);
#line 4107
      ATOM     _System WinFindAtom(HATOMTBL hAtomTbl,
                                    PSZ pszAtomName);

      ATOM     _System WinDeleteAtom(HATOMTBL hAtomTbl,
                                      ATOM atom);
      ULONG   _System WinQueryAtomUsage(HATOMTBL hAtomTbl,
                                         ATOM atom);
      ULONG   _System WinQueryAtomLength(HATOMTBL hAtomTbl,
                                          ATOM atom);
#line 4122
      ULONG   _System WinQueryAtomName(HATOMTBL hAtomTbl,
                                        ATOM atom,
                                        PSZ pchBuffer,
                                        ULONG cchBufferMax);
#line 24 "F:\IBMCPP\INCLUDE\OS2\pmerr.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 901
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 4162 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
   typedef struct _ERRINFO     
   {
      ULONG   cbFixedErrInfo;
      ERRORID idError;
      ULONG   cDetailLevel;
      ULONG   offaoffszMsg;
      ULONG   offBinaryData;
   } ERRINFO;
   typedef ERRINFO *PERRINFO;

   ERRORID     _System    WinGetLastError(HAB hab);
   PERRINFO    _System    WinGetErrorInfo(HAB hab);
   BOOL        _System    WinFreeErrorInfo(PERRINFO perrinfo);
#line 25 "F:\IBMCPP\INCLUDE\OS2\pmsei.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 38
ERRORID _System WinSetErrorInfo(ERRORID,
                                 ULONG,
                                 ...);
#line 71
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 4209 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
      typedef struct _CONVCONTEXT     
      {
         ULONG  cb;           
         ULONG fsContext;
         ULONG idCountry;
         ULONG usCodepage;
         ULONG usLangID;
         ULONG usSubLangID;
      } CONVCONTEXT;
      typedef CONVCONTEXT *PCONVCONTEXT;
#line 4222
      typedef struct _DDEINIT     
      {
         ULONG   cb;          
         PSZ     pszAppName;
         PSZ     pszTopic;
         ULONG   offConvContext;
      } DDEINIT;
      typedef DDEINIT *PDDEINIT;

      typedef struct _DDESTRUCT     
      {
         ULONG   cbData;
         USHORT  fsStatus;
         USHORT  usFormat;
         USHORT  offszItemName;
         USHORT  offabData;
      } DDESTRUCT;
      typedef DDESTRUCT *PDDESTRUCT;
#line 4263
      BOOL    _System WinDdeInitiate(HWND hwndClient,
                                      PSZ pszAppName,
                                      PSZ pszTopicName,
                                      PCONVCONTEXT pcctxt);
#line 4276
      MRESULT _System WinDdeRespond(HWND hwndClient,
                                     HWND hwndServer,
                                     PSZ pszAppName,
                                     PSZ pszTopicName,
                                     PCONVCONTEXT pcctxt);
#line 4283
      BOOL    _System WinDdePostMsg(HWND hwndTo,
                                     HWND hwndFrom,
                                     ULONG wm,
                                     PDDESTRUCT pddest,
                                     ULONG flOptions);
#line 31 "F:\IBMCPP\INCLUDE\OS2\pmhelp.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 52
   typedef USHORT HELPSUBTABLE;
   typedef HELPSUBTABLE *PHELPSUBTABLE;
#line 64
   #pragma pack(2)    
#line 67
   typedef struct _HELPTABLE        
   {
      USHORT          idAppWindow;
      PHELPSUBTABLE   phstHelpSubTable;
      USHORT          idExtPanel;
   } HELPTABLE;
   typedef HELPTABLE *PHELPTABLE;
#line 76
   #pragma pack()     
#line 85
   typedef struct _HELPINIT       
   {
      ULONG        cb;
      ULONG        ulReturnCode;
      PSZ          pszTutorialName;
      PHELPTABLE   phtHelpTable;
      HMODULE      hmodHelpTableModule;
      HMODULE      hmodAccelActionBarModule;
      ULONG        idAccelTable;
      ULONG        idActionBar;
      PSZ          pszHelpWindowTitle;
      ULONG        fShowPanelId;
      PSZ          pszHelpLibraryName;
   } HELPINIT;
   typedef HELPINIT *PHELPINIT;
#line 128
   BOOL _System  WinDestroyHelpInstance(HWND hwndHelpInstance);

   HWND _System  WinCreateHelpInstance(HAB hab,
                                        PHELPINIT phinitHMInitStructure);

   BOOL _System  WinAssociateHelpInstance(HWND hwndHelpInstance,
                                           HWND hwndApp);

   HWND _System  WinQueryHelpInstance(HWND hwndApp);

   BOOL _System  WinLoadHelpTable(HWND hwndHelpInstance,
                                   ULONG idHelpTable,
                                   HMODULE Module);

   BOOL _System  WinCreateHelpTable(HWND hwndHelpInstance,
                                     PHELPTABLE phtHelpTable);
#line 372
   typedef struct _ACVP         
   {
      ULONG  cb;
      HAB    hAB;
      HMQ    hmq;
      ULONG  ObjectID;             
      HWND   hWndParent;           
      HWND   hWndOwner;            
      HWND   hWndACVP;             
   } ACVP, *PACVP;
#line 541
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 4337 "F:\IBMCPP\INCLUDE\OS2\pmwin.h"
typedef HMODULE HLIB;
typedef PHMODULE PHLIB;
#line 4341
   BOOL    _System WinDeleteProcedure(HAB hab,
                                       PFNWP wndproc);
   BOOL    _System WinDeleteLibrary(HAB hab,
                                     HLIB libhandle);
#line 4350
   PFNWP   _System WinLoadProcedure(HAB hab,
                                     HLIB libhandle,
                                     PSZ procname);
#line 4358
   HLIB    _System WinLoadLibrary(HAB hab,
                                   PSZ libname);
#line 4368
      typedef struct _DESKTOP           
      {
         ULONG    cbSize;
         HBITMAP  hbm;
         long     x;
         long     y;
         ULONG    fl;
         long     lTileCount;
         char     szFile[260];
      } DESKTOP;
      typedef DESKTOP *PDESKTOP;   

      HBITMAP _System WinSetDesktopBkgnd(HWND hwndDesktop,
                                          PDESKTOP pdskNew);
      BOOL    _System WinQueryDesktopBkgnd(HWND hwndDesktop,
                                            PDESKTOP pdsk);
#line 4402
      long _System WinRealizePalette(HWND hwnd,
                                      HPS hps,
                                      PULONG pcclr);
#line 4426
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 52 "F:\IBMCPP\INCLUDE\OS2\pmgpi.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 125
typedef  long FIXED;      
typedef  FIXED *PFIXED;
#line 129
typedef  USHORT FIXED88;   
#line 135
typedef  USHORT FIXED114;  
#line 145
typedef struct _SIZEL             
{
   long cx;
   long cy;
} SIZEL;
typedef SIZEL *PSIZEL;
#line 192
   HPS   _System GpiCreatePS(HAB hab,
                              HDC hdc,
                              PSIZEL psizlSize,
                              ULONG flOptions);

   BOOL  _System GpiDestroyPS(HPS hps);

   BOOL  _System GpiAssociate(HPS hps,
                               HDC hdc);

   BOOL  _System GpiRestorePS(HPS hps,
                               long lPSid);

   long  _System GpiSavePS(HPS hps);

   BOOL  _System GpiErase(HPS hps);
#line 211
      HDC  _System GpiQueryDevice(HPS);
#line 265
   BOOL  _System GpiResetPS(HPS hps,
                             ULONG flOptions);
#line 271
      BOOL  _System GpiSetPS(HPS hps,
                              PSIZEL psizlsize,
                              ULONG flOptions);
#line 278
   ULONG  _System GpiQueryPS(HPS hps,
                              PSIZEL psizlSize);

   long   _System GpiErrorSegmentData(HPS hps,
                                       PLONG plSegment,
                                       PLONG plContext);
#line 288
      long  _System GpiQueryDrawControl(HPS hps,
                                         long lControl);

      BOOL  _System GpiSetDrawControl(HPS hps,
                                       long lControl,
                                       long lValue);
#line 298
   long  _System GpiQueryDrawingMode(HPS hps);

   BOOL  _System GpiSetDrawingMode(HPS hps,
                                    long lMode);
#line 306
      long  _System GpiQueryStopDraw(HPS hps);

      BOOL  _System GpiSetStopDraw(HPS hps,
                                    long lValue);
#line 329
   long  _System GpiCorrelateChain(HPS hps,
                                    long lType,
                                    PPOINTL pptlPick,
                                    long lMaxHits,
                                    long lMaxDepth,
                                    PLONG pl2);

   BOOL  _System GpiQueryTag(HPS hps,
                              PLONG plTag);

   BOOL  _System GpiSetTag(HPS hps,
                            long lTag);

   BOOL  _System GpiQueryPickApertureSize(HPS hps,
                                           PSIZEL psizlSize);

   BOOL  _System GpiSetPickApertureSize(HPS hps,
                                         long lOptions,
                                         PSIZEL psizlSize);
#line 351
      BOOL  _System GpiQueryPickAperturePosition(HPS hps,
                                                  PPOINTL pptlPoint);

      BOOL  _System GpiSetPickAperturePosition(HPS hps,
                                                PPOINTL pptlPick);

      BOOL  _System GpiQueryBoundaryData(HPS hps,
                                          PRECTL prclBoundary);

      BOOL  _System GpiResetBoundaryData(HPS hps);
#line 365
   long _System GpiCorrelateFrom(HPS hps,
                                  long lFirstSegment,
                                  long lLastSegment,
                                  long lType,
                                  PPOINTL pptlPick,
                                  long lMaxHits,
                                  long lMaxDepth,
                                  PLONG plSegTag);

   long _System GpiCorrelateSegment(HPS hps,
                                     long lSegment,
                                     long lType,
                                     PPOINTL pptlPick,
                                     long lMaxHits,
                                     long lMaxDepth,
                                     PLONG alSegTag);
#line 422
   BOOL _System GpiOpenSegment(HPS hps,
                                long lSegment);

   BOOL _System GpiCloseSegment(HPS hps);

   BOOL _System GpiDeleteSegment(HPS hps,
                                  long lSegid);

   long _System GpiQueryInitialSegmentAttrs(HPS hps,
                                             long lAttribute);

   BOOL _System GpiSetInitialSegmentAttrs(HPS hps,
                                           long lAttribute,
                                           long lValue);

   long _System GpiQuerySegmentAttrs(HPS hps,
                                      long lSegid,
                                      long lAttribute);

   BOOL _System GpiSetSegmentAttrs(HPS hps,
                                    long lSegid,
                                    long lAttribute,
                                    long lValue);

   long _System GpiQuerySegmentPriority(HPS hps,
                                         long lRefSegid,
                                         long lOrder);

   BOOL _System GpiSetSegmentPriority(HPS hps,
                                       long lSegid,
                                       long lRefSegid,
                                       long lOrder);

   BOOL _System GpiDeleteSegments(HPS hps,
                                   long lFirstSegment,
                                   long lLastSegment);

   long _System GpiQuerySegmentNames(HPS hps,
                                      long lFirstSegid,
                                      long lLastSegid,
                                      long lMax,
                                      PLONG alSegids);
#line 466
   long _System GpiGetData(HPS hps,
                            long lSegid,
                            PLONG plOffset,
                            long lFormat,
                            long lLength,
                            PBYTE pbData);

   long _System GpiPutData(HPS hps,
                            long lFormat,
                            PLONG plCount,
                            PBYTE pbData);

   BOOL _System GpiDrawChain(HPS hps);

   BOOL _System GpiDrawFrom(HPS hps,
                             long lFirstSegment,
                             long lLastSegment);

   BOOL _System GpiDrawSegment(HPS hps,
                                long lSegment);
#line 490
      BOOL _System GpiDrawDynamics(HPS hps);

      BOOL _System GpiRemoveDynamics(HPS hps,
                                      long lFirstSegid,
                                      long lLastSegid);
#line 513
   BOOL  _System GpiBeginElement(HPS hps,
                                  long lType,
                                  PSZ pszDesc);
#line 518
   BOOL  _System GpiEndElement(HPS hps);

   BOOL  _System GpiLabel(HPS hps,
                           long lLabel);
#line 530
   long  _System GpiElement(HPS hps,
                             long lType,
                             PSZ pszDesc,
                             long lLength,
                             PBYTE pbData);
#line 537
   long  _System GpiQueryElement(HPS hps,
                                  long lOff,
                                  long lMaxLength,
                                  PBYTE pbData);

   BOOL  _System GpiDeleteElement(HPS hps);

   BOOL  _System GpiDeleteElementRange(HPS hps,
                                        long lFirstElement,
                                        long lLastElement);

   BOOL  _System GpiDeleteElementsBetweenLabels(HPS hps,
                                                 long lFirstLabel,
                                                 long lLastLabel);

   long  _System GpiQueryEditMode(HPS hps);

   BOOL  _System GpiSetEditMode(HPS hps,
                                 long lMode);

   long  _System GpiQueryElementPointer(HPS hps);

   BOOL  _System GpiSetElementPointer(HPS hps,
                                       long lElement);

   BOOL  _System GpiOffsetElementPointer(HPS hps,
                                          long loffset);
#line 571
   long  _System GpiQueryElementType(HPS hps,
                                      PLONG plType,
                                      long lLength,
                                      PSZ pszData);
#line 577
   BOOL  _System GpiSetElementPointerAtLabel(HPS hps,
                                              long lLabel);
#line 596
   typedef struct _MATRIXLF         
   {
      FIXED fxM11;
      FIXED fxM12;
      long  lM13;
      FIXED fxM21;
      FIXED fxM22;
      long  lM23;
      long  lM31;
      long  lM32;
      long  lM33;
   } MATRIXLF;
   typedef MATRIXLF *PMATRIXLF;
#line 614
      BOOL  _System GpiQuerySegmentTransformMatrix(HPS hps,
                                                    long lSegid,
                                                    long lCount,
                                                    PMATRIXLF pmatlfArray);

      BOOL  _System GpiSetSegmentTransformMatrix(HPS hps,
                                                  long lSegid,
                                                  long lCount,
                                                  PMATRIXLF pmatlfarray,
                                                  long lOptions);

      BOOL  _System GpiConvert(HPS hps,
                                long lSrc,
                                long lTarg,
                                long lCount,
                                PPOINTL aptlPoints);

      BOOL  _System GpiConvertWithMatrix(HPS hps,
                                          long lCountp,
                                          PPOINTL aptlPoints,
                                          long lCount,
                                          PMATRIXLF pmatlfArray);

      BOOL  _System GpiQueryModelTransformMatrix(HPS hps,
                                                  long lCount,
                                                  PMATRIXLF pmatlfArray);

      BOOL  _System GpiSetModelTransformMatrix(HPS hps,
                                                long lCount,
                                                PMATRIXLF pmatlfArray,
                                                long lOptions);

      long  _System GpiCallSegmentMatrix(HPS hps,
                                          long lSegment,
                                          long lCount,
                                          PMATRIXLF pmatlfArray,
                                          long lOptions);

      BOOL  _System GpiQueryDefaultViewMatrix(HPS hps,
                                               long lCount,
                                               PMATRIXLF pmatlfArray);

      BOOL  _System GpiSetDefaultViewMatrix(HPS hps,
                                             long lCount,
                                             PMATRIXLF pmatlfarray,
                                             long lOptions);

      BOOL  _System GpiQueryPageViewport(HPS hps,
                                          PRECTL prclViewport);

      BOOL  _System GpiSetPageViewport(HPS hps,
                                        PRECTL prclViewport);

      BOOL  _System GpiQueryViewingTransformMatrix(HPS hps,
                                                    long lCount,
                                                    PMATRIXLF pmatlfArray);

      BOOL  _System GpiSetViewingTransformMatrix(HPS hps,
                                                  long lCount,
                                                  PMATRIXLF pmatlfArray,
                                                  long lOptions);
#line 677
      BOOL _System GpiTranslate(HPS,
                                 PMATRIXLF,
                                 long,
                                 PPOINTL);

      BOOL _System GpiScale(HPS,
                             PMATRIXLF,
                             long,
                             PFIXED,
                             PPOINTL);

      BOOL _System GpiRotate(HPS,
                              PMATRIXLF,
                              long,
                              FIXED,
                              PPOINTL);
#line 695
      BOOL _System GpiSetGraphicsField(HPS hps,
                                        PRECTL prclField);

      BOOL _System GpiQueryGraphicsField(HPS hps,
                                          PRECTL prclField);

      BOOL _System GpiSetViewingLimits(HPS hps,
                                        PRECTL prclLimits);

      BOOL _System GpiQueryViewingLimits(HPS hps,
                                          PRECTL prclLimits);
#line 733
      BOOL  _System GpiBeginPath(HPS hps,
                                  long lPath);

      BOOL  _System GpiEndPath(HPS hps);

      BOOL  _System GpiCloseFigure(HPS hps);

      BOOL  _System GpiModifyPath(HPS hps,
                                   long lPath,
                                   long lMode);

      long  _System GpiFillPath(HPS hps,
                                 long lPath,
                                 long lOptions);

      BOOL  _System GpiSetClipPath(HPS hps,
                                    long lPath,
                                    long lOptions);

      long  _System GpiOutlinePath(HPS hps,
                                    long lPath,
                                    long lOptions);

      HRGN  _System GpiPathToRegion(HPS GpiH,
                                     long lPath,
                                     long lOptions);
#line 763
         long  _System GpiStrokePath(HPS hps,
                                      long lPath,
                                      ULONG flOptions);
#line 825
      BOOL  _System GpiCreateLogColorTable(HPS hps,
                                            ULONG flOptions,
                                            long lFormat,
                                            long lStart,
                                            long lCount,
                                            PLONG alTable);

      BOOL  _System GpiQueryColorData(HPS hps,
                                       long lCount,
                                       PLONG alArray);
#line 839
         long  _System GpiQueryLogColorTable(HPS hps,
                                              ULONG flOptions,
                                              long lStart,
                                              long lCount,
                                              PLONG alArray);
#line 848
      long  _System GpiQueryRealColors(HPS hps,
                                        ULONG flOptions,
                                        long lStart,
                                        long lCount,
                                        PLONG alColors);

      long  _System GpiQueryNearestColor(HPS hps,
                                          ULONG flOptions,
                                          long lRgbIn);

      long  _System GpiQueryColorIndex(HPS hps,
                                        ULONG flOptions,
                                        long lRgbColor);

      long  _System GpiQueryRGBColor(HPS hps,
                                      ULONG flOptions,
                                      long lColorIndex);
#line 870
         HPAL _System GpiCreatePalette(HAB hab,
                                        ULONG flOptions,
                                        ULONG ulFormat,
                                        ULONG ulCount,
                                        PULONG aulTable);

         BOOL _System GpiDeletePalette(HPAL hpal);

         HPAL _System GpiSelectPalette(HPS hps,
                                        HPAL hpal);

         long _System GpiAnimatePalette(HPAL hpal,
                                         ULONG ulFormat,
                                         ULONG ulStart,
                                         ULONG ulCount,
                                         PULONG aulTable);

         BOOL _System GpiSetPaletteEntries(HPAL hpal,
                                            ULONG ulFormat,
                                            ULONG ulStart,
                                            ULONG ulCount,
                                            PULONG aulTable);

         HPAL _System GpiQueryPalette(HPS hps);

         long _System GpiQueryPaletteInfo(HPAL hpal,
                                           HPS  hps,
                                           ULONG flOptions,
                                           ULONG ulStart,
                                           ULONG ulCount,
                                           PULONG aulArray);
#line 998
      BOOL  _System GpiSetColor(HPS hps,
                                 long lColor);

      long  _System GpiQueryColor(HPS hps);
#line 1005
      long  _System GpiBox(HPS hps,
                            long lControl,
                            PPOINTL pptlPoint,
                            long lHRound,
                            long lVRound);

      BOOL  _System GpiMove(HPS hps,
                             PPOINTL pptlPoint);

      long  _System GpiLine(HPS hps,
                             PPOINTL pptlEndPoint);

      long  _System GpiPolyLine(HPS hps,
                                 long lCount,
                                 PPOINTL aptlPoints);

      long  _System GpiPolyLineDisjoint(HPS hps,
                                         long lCount,
                                         PPOINTL aptlPoints);
#line 1026
      BOOL  _System GpiSetPattern(HPS hps,
                                   long lPatternSymbol);

      long  _System GpiQueryPattern(HPS hps);

      BOOL  _System GpiBeginArea(HPS hps,
                                  ULONG flOptions);

      long  _System GpiEndArea(HPS hps);
#line 1037
      long  _System GpiCharString(HPS hps,
                                   long lCount,
                                   PCH pchString);

      long  _System GpiCharStringAt(HPS hps,
                                     PPOINTL pptlPoint,
                                     long lCount,
                                     PCH pchString);
#line 1250
   typedef struct _ARCPARAMS        
   {
      long lP;
      long lQ;
      long lR;
      long lS;
   } ARCPARAMS;
   typedef ARCPARAMS *PARCPARAMS;
#line 1260
   typedef struct _SIZEF           
   {
      FIXED cx;
      FIXED cy;
   } SIZEF;
   typedef SIZEF *PSIZEF;
#line 1268
   typedef struct _GRADIENTL         
   {
      long x;
      long y;
   } GRADIENTL;
   typedef GRADIENTL *PGRADIENTL;
#line 1276
   typedef struct _LINEBUNDLE        
   {
      long    lColor;
      long    lBackColor;
      USHORT  usMixMode;
      USHORT  usBackMixMode;
      FIXED   fxWidth;
      long    lGeomWidth;
      USHORT  usType;
      USHORT  usEnd;
      USHORT  usJoin;
      USHORT  usReserved;
   } LINEBUNDLE;
   typedef LINEBUNDLE *PLINEBUNDLE;
#line 1292
   typedef struct _CHARBUNDLE        
   {
      long      lColor;
      long      lBackColor;
      USHORT    usMixMode;
      USHORT    usBackMixMode;
      USHORT    usSet;
      USHORT    usPrecision;
      SIZEF     sizfxCell;
      POINTL    ptlAngle;
      POINTL    ptlShear;
      USHORT    usDirection;
      USHORT    usTextAlign;
      FIXED     fxExtra;
      FIXED     fxBreakExtra;
   } CHARBUNDLE;
   typedef CHARBUNDLE *PCHARBUNDLE;
#line 1311
   typedef struct _MARKERBUNDLE      
   {
      long   lColor;
      long   lBackColor;
      USHORT usMixMode;
      USHORT usBackMixMode;
      USHORT usSet;
      USHORT usSymbol;
      SIZEF  sizfxCell;
   } MARKERBUNDLE;
   typedef MARKERBUNDLE *PMARKERBUNDLE;
#line 1324
   typedef struct _AREABUNDLE     
   {
      long   lColor;
      long   lBackColor;
      USHORT usMixMode;
      USHORT usBackMixMode;
      USHORT usSet;
      USHORT usSymbol;
      POINTL ptlRefPoint ;
   } AREABUNDLE;
   typedef AREABUNDLE *PAREABUNDLE;
#line 1337
   typedef struct _IMAGEBUNDLE       
   {
      long   lColor;
      long   lBackColor;
      USHORT usMixMode;
      USHORT usBackMixMode;
   } IMAGEBUNDLE;
   typedef IMAGEBUNDLE *PIMAGEBUNDLE;
#line 1347
   typedef PVOID PBUNDLE;
#line 1373
      BOOL  _System GpiSetAttrMode(HPS hps,
                                    long lMode);

      long  _System GpiQueryAttrMode(HPS hps);

      BOOL  _System GpiSetAttrs(HPS hps,
                                 long lPrimType,
                                 ULONG flAttrMask,
                                 ULONG flDefMask,
                                 PBUNDLE ppbunAttrs);
#line 1386
         long  _System GpiQueryAttrs(HPS hps,
                                      long lPrimType,
                                      ULONG flAttrMask,
                                      PBUNDLE ppbunAttrs);
#line 1395
      BOOL  _System GpiSetBackColor(HPS hps,
                                     long lColor);

      long  _System GpiQueryBackColor(HPS hps);

      BOOL  _System GpiSetMix(HPS hps,
                               long lMixMode);

      long  _System GpiQueryMix(HPS hps);

      BOOL  _System GpiSetBackMix(HPS hps,
                                   long lMixMode);

      long  _System GpiQueryBackMix(HPS hps);
#line 1411
      BOOL  _System GpiSetLineType(HPS hps,
                                    long lLineType);

      long  _System GpiQueryLineType(HPS hps);

      BOOL  _System GpiSetLineWidth(HPS hps,
                                     FIXED fxLineWidth);

      FIXED _System GpiQueryLineWidth(HPS hps);

      BOOL  _System GpiSetLineWidthGeom(HPS hps,
                                         long lLineWidth);

      long  _System GpiQueryLineWidthGeom(HPS hps);

      BOOL  _System GpiSetLineEnd(HPS hps,
                                   long lLineEnd);

      long  _System GpiQueryLineEnd(HPS hps);

      BOOL  _System GpiSetLineJoin(HPS hps,
                                    long lLineJoin);

      long  _System GpiQueryLineJoin(HPS hps);

      BOOL  _System GpiSetCurrentPosition(HPS hps,
                                           PPOINTL pptlPoint);

      BOOL  _System GpiQueryCurrentPosition(HPS hps,
                                             PPOINTL pptlPoint);
#line 1443
      BOOL  _System GpiSetArcParams(HPS hps,
                                     PARCPARAMS parcpArcParams);

      BOOL  _System GpiQueryArcParams(HPS hps,
                                       PARCPARAMS parcpArcParams);

      long  _System GpiPointArc(HPS hps,
                                 PPOINTL pptl2);

      long  _System GpiFullArc(HPS hps,
                                long lControl,
                                FIXED fxMultiplier);

      long  _System GpiPartialArc(HPS hps,
                                   PPOINTL pptlCenter,
                                   FIXED fxMultiplier,
                                   FIXED fxStartAngle,
                                   FIXED fxSweepAngle);

      long  _System GpiPolyFillet(HPS hps,
                                   long lCount,
                                   PPOINTL aptlPoints);

      long  _System GpiPolySpline(HPS hps,
                                   long lCount,
                                   PPOINTL aptlPoints);

      long  _System GpiPolyFilletSharp(HPS hps,
                                        long lCount,
                                        PPOINTL aptlPoints,
                                        PFIXED afxPoints);
#line 1476
      BOOL  _System GpiSetPatternSet(HPS hps,
                                      long lSet);

      long  _System GpiQueryPatternSet(HPS hps);

      BOOL  _System GpiSetPatternRefPoint(HPS hps,
                                           PPOINTL pptlRefPoint);

      BOOL  _System GpiQueryPatternRefPoint(HPS hps,
                                             PPOINTL pptlRefPoint);
#line 1488
      BOOL  _System GpiQueryCharStringPos(HPS hps,
                                           ULONG flOptions,
                                           long lCount,
                                           PCH pchString,
                                           PLONG alXincrements,
                                           PPOINTL aptlPositions);

      BOOL  _System GpiQueryCharStringPosAt(HPS hps,
                                             PPOINTL pptlStart,
                                             ULONG flOptions,
                                             long lCount,
                                             PCH pchString,
                                             PLONG alXincrements,
                                             PPOINTL aptlPositions);

      BOOL  _System GpiQueryTextBox(HPS hps,
                                     long lCount1,
                                     PCH pchString,
                                     long lCount2,
                                     PPOINTL aptlPoints);

      BOOL  _System GpiQueryDefCharBox(HPS hps,
                                        PSIZEL psizlSize);

      BOOL  _System GpiSetCharSet(HPS hps,
                                   long llcid);

      long  _System GpiQueryCharSet(HPS hps);

      BOOL  _System GpiSetCharBox(HPS hps,
                                   PSIZEF psizfxBox);

      BOOL  _System GpiQueryCharBox(HPS hps,
                                     PSIZEF psizfxSize);

      BOOL  _System GpiSetCharAngle(HPS hps,
                                     PGRADIENTL pgradlAngle);

      BOOL  _System GpiQueryCharAngle(HPS hps,
                                       PGRADIENTL pgradlAngle);

      BOOL  _System GpiSetCharShear(HPS hps,
                                     PPOINTL pptlAngle);

      BOOL  _System GpiQueryCharShear(HPS hps,
                                       PPOINTL pptlShear);

      BOOL  _System GpiSetCharDirection(HPS hps,
                                         long lDirection);

      long  _System GpiQueryCharDirection(HPS hps);

      BOOL  _System GpiSetCharMode(HPS hps,
                                    long lMode);

      long  _System GpiQueryCharMode(HPS hps);

      BOOL  _System GpiSetTextAlignment(HPS hps,
                                         long lHoriz,
                                         long lVert);

      BOOL  _System GpiQueryTextAlignment(HPS hps,
                                           PLONG plHoriz,
                                           PLONG plVert);

      long  _System GpiCharStringPos(HPS hps,
                                      PRECTL prclRect,
                                      ULONG flOptions,
                                      long lCount,
                                      PCH pchString,
                                      PLONG alAdx);

      long  _System GpiCharStringPosAt(HPS hps,
                                        PPOINTL pptlStart,
                                        PRECTL prclRect,
                                        ULONG flOptions,
                                        long lCount,
                                        PCH pchString,
                                        PLONG alAdx);

      BOOL  _System GpiSetCharExtra(HPS hps,
                                     FIXED  Extra);

      BOOL  _System GpiSetCharBreakExtra(HPS hps,
                                          FIXED  BreakExtra);

      BOOL  _System GpiQueryCharExtra(HPS hps,
                                       PFIXED Extra);

      BOOL  _System GpiQueryCharBreakExtra(HPS hps,
                                            PFIXED BreakExtra);
#line 1581
      long  _System GpiMarker(HPS hps,
                               PPOINTL pptlPoint);

      long  _System GpiPolyMarker(HPS hps,
                                   long lCount,
                                   PPOINTL aptlPoints);

      BOOL  _System GpiSetMarker(HPS hps,
                                  long lSymbol);

      BOOL  _System GpiSetMarkerBox(HPS hps,
                                     PSIZEF psizfxSize);

      BOOL  _System GpiSetMarkerSet(HPS hps,
                                     long lSet);

      long  _System GpiQueryMarker(HPS hps);

      BOOL  _System GpiQueryMarkerBox(HPS hps,
                                       PSIZEF psizfxSize);

      long  _System GpiQueryMarkerSet(HPS hps);
#line 1605
      long  _System GpiImage(HPS hps,
                              long lFormat,
                              PSIZEL psizlImageSize,
                              long lLength,
                              PBYTE pbData);
#line 1612
      BOOL  _System GpiPop(HPS hps,
                            long lCount);

      long  _System GpiPtVisible(HPS hps,
                                  PPOINTL pptlPoint);

      long  _System GpiRectVisible(HPS hps,
                                    PRECTL prclRectangle);

      BOOL  _System GpiComment(HPS hps,
                                long lLength,
                                PBYTE pbData);
#line 1643
   typedef struct _KERNINGPAIRS      
   {
      short sFirstChar;
      short sSecondChar;
      long  lKerningAmount;
   } KERNINGPAIRS;
   typedef KERNINGPAIRS *PKERNINGPAIRS;
#line 1652
   typedef struct _FACENAMEDESC      
   {
      USHORT usSize;
      USHORT usWeightClass;
      USHORT usWidthClass;
      USHORT usReserved;
      ULONG  flOptions;
   } FACENAMEDESC;
   typedef FACENAMEDESC *PFACENAMEDESC;
#line 1708
      typedef char FFDESCS[2][32];  
      typedef FFDESCS *PFFDESCS;
      typedef struct _FFDESCS2     
      {
         ULONG  cbLength;
         ULONG  cbFacenameOffset;
         BYTE   abFamilyName[1];
      } FFDESCS2;
      typedef FFDESCS2 *PFFDESCS2;
#line 1724
      long  _System GpiCreateLogFont(HPS hps,
                                      PSTR8 pName,
                                      long lLcid,
                                      PFATTRS pfatAttrs);

      BOOL  _System GpiDeleteSetId(HPS hps,
                                    long lLcid);
#line 1736
      BOOL  _System GpiLoadFonts(HAB hab,
                                  PSZ pszFilename);
#line 1744
      BOOL  _System GpiUnloadFonts(HAB hab,
                                    PSZ pszFilename);
#line 1756
      long  _System GpiQueryFonts(HPS hps,
                                   ULONG flOptions,
                                   PSZ pszFacename,
                                   PLONG plReqFonts,
                                   long lMetricsLength,
                                   PFONTMETRICS afmMetrics);
#line 1764
      BOOL  _System GpiQueryFontMetrics(HPS hps,
                                         long lMetricsLength,
                                         PFONTMETRICS pfmMetrics);

      long  _System GpiQueryKerningPairs(HPS hps,
                                          long lCount,
                                          PKERNINGPAIRS akrnprData);

      BOOL  _System GpiQueryWidthTable(HPS hps,
                                        long lFirstChar,
                                        long lCount,
                                        PLONG alData);

      long  _System GpiQueryNumberSetIds(HPS hps);

      BOOL  _System GpiQuerySetIds(HPS hps,
                                    long lCount,
                                    PLONG alTypes,
                                    PSTR8 aNames,
                                    PLONG allcids);
#line 1792
      ULONG _System GpiQueryFaceString(HPS PS,
                                        PSZ FamilyName,
                                        PFACENAMEDESC attrs,
                                        long length,
                                        PSZ CompoundFaceName);
#line 1799
      BOOL  _System GpiQueryLogicalFont(HPS PS,
                                         long lcid,
                                         PSTR8 name,
                                         PFATTRS attrs,
                                         long length);

      ULONG _System GpiQueryFontAction(HAB anchor,
                                        ULONG options);
#line 1812
      BOOL  _System GpiLoadPublicFonts(HAB,
                                        PSZ);
#line 1820
      BOOL  _System GpiUnloadPublicFonts(HAB,
                                          PSZ);
#line 1826
         BOOL    _System GpiSetCp(HPS hps,
                                   ULONG ulCodePage);

         ULONG   _System GpiQueryCp(HPS hps);
#line 1838
         long    _System GpiQueryFullFontFileDescs(HAB hab,
                                                    PSZ pszFilename,
                                                    PLONG plCount,
                                                    PVOID pNames,
                                                    PLONG plNamesBuffLength);
#line 1851
         long    _System GpiQueryFontFileDescriptions(HAB hab,
                                                       PSZ pszFilename,
                                                       PLONG plCount,
                                                       PFFDESCS affdescsNames);
#line 1898
      long     _System GpiBitBlt(HPS hpsTarget,
                                  HPS hpsSource,
                                  long lCount,
                                  PPOINTL aptlPoints,
                                  long lRop,
                                  ULONG flOptions);

      BOOL     _System GpiDeleteBitmap(HBITMAP hbm);

      HBITMAP  _System GpiLoadBitmap(HPS hps,
                                      HMODULE Resource,
                                      ULONG idBitmap,
                                      long lWidth,
                                      long lHeight);

      HBITMAP  _System GpiSetBitmap(HPS hps,
                                     HBITMAP hbm);

      long     _System GpiWCBitBlt(HPS hpsTarget,
                                    HBITMAP hbmSource,
                                    long lCount,
                                    PPOINTL aptlPoints,
                                    long lRop,
                                    ULONG flOptions);
#line 38 "F:\IBMCPP\INCLUDE\OS2\pmbitmap.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 55
   #pragma pack(1)           
#line 59
   typedef struct _BITMAPINFOHEADER          
   {
      ULONG  cbFix;
      USHORT cx;
      USHORT cy;
      USHORT cPlanes;
      USHORT cBitCount;
   } BITMAPINFOHEADER;
   typedef BITMAPINFOHEADER *PBITMAPINFOHEADER;
#line 70
   typedef struct _RGB               
   {
      BYTE bBlue;
      BYTE bGreen;
      BYTE bRed;
   } RGB;
#line 78
   typedef struct _BITMAPINFO        
   {
      ULONG  cbFix;
      USHORT cx;
      USHORT cy;
      USHORT cPlanes;
      USHORT cBitCount;
      RGB    argbColor[1];
   } BITMAPINFO;
   typedef BITMAPINFO *PBITMAPINFO;
#line 119
   typedef struct _BITMAPINFOHEADER2         
   {
      ULONG  cbFix;             
      ULONG  cx;                
      ULONG  cy;                
      USHORT cPlanes;           
      USHORT cBitCount;         
      ULONG  ulCompression;     
      ULONG  cbImage;           
      ULONG  cxResolution;      
      ULONG  cyResolution;      
      ULONG  cclrUsed;          
      ULONG  cclrImportant;     
      USHORT usUnits;           
      USHORT usReserved;        
      USHORT usRecording;       
      USHORT usRendering;       
      ULONG  cSize1;            
      ULONG  cSize2;            
      ULONG  ulColorEncoding;   
      ULONG  ulIdentifier;      
   } BITMAPINFOHEADER2;
   typedef BITMAPINFOHEADER2 *PBITMAPINFOHEADER2;

   typedef struct _RGB2          
   {
      BYTE bBlue;               
      BYTE bGreen;              
      BYTE bRed;                
      BYTE fcOptions;           
   } RGB2;
   typedef RGB2 *PRGB2;

   typedef struct _BITMAPINFO2       
   {
      ULONG  cbFix;             
      ULONG  cx;                
      ULONG  cy;                
      USHORT cPlanes;           
      USHORT cBitCount;         
      ULONG  ulCompression;     
      ULONG  cbImage;           
      ULONG  cxResolution;      
      ULONG  cyResolution;      
      ULONG  cclrUsed;          
      ULONG  cclrImportant;     
      USHORT usUnits;           
      USHORT usReserved;        
      USHORT usRecording;       
      USHORT usRendering;       
      ULONG  cSize1;            
      ULONG  cSize2;            
      ULONG  ulColorEncoding;   
      ULONG  ulIdentifier;      
      RGB2   argbColor[1];      
   } BITMAPINFO2;
   typedef BITMAPINFO2 *PBITMAPINFO2;

   typedef struct _BITMAPFILEHEADER     
   {
      USHORT    usType;
      ULONG     cbSize;
      short     xHotspot;
      short     yHotspot;
      ULONG     offBits;
      BITMAPINFOHEADER bmp;
   } BITMAPFILEHEADER;
   typedef BITMAPFILEHEADER *PBITMAPFILEHEADER;

   typedef struct _BITMAPARRAYFILEHEADER        
   {
      USHORT    usType;
      ULONG     cbSize;
      ULONG     offNext;
      USHORT    cxDisplay;
      USHORT    cyDisplay;
      BITMAPFILEHEADER bfh;
   } BITMAPARRAYFILEHEADER;
   typedef BITMAPARRAYFILEHEADER *PBITMAPARRAYFILEHEADER;

   typedef struct _BITMAPFILEHEADER2     
   {
      USHORT    usType;
      ULONG     cbSize;
      short     xHotspot;
      short     yHotspot;
      ULONG     offBits;
      BITMAPINFOHEADER2 bmp2;
   } BITMAPFILEHEADER2;
   typedef BITMAPFILEHEADER2 *PBITMAPFILEHEADER2;

   typedef struct _BITMAPARRAYFILEHEADER2     
   {
      USHORT    usType;
      ULONG     cbSize;
      ULONG     offNext;
      USHORT    cxDisplay;
      USHORT    cyDisplay;
      BITMAPFILEHEADER2 bfh2;
   } BITMAPARRAYFILEHEADER2;
   typedef BITMAPARRAYFILEHEADER2 *PBITMAPARRAYFILEHEADER2;
#line 234
   #pragma pack()          
#line 246
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 1942 "F:\IBMCPP\INCLUDE\OS2\pmgpi.h"
      HBITMAP _System GpiCreateBitmap(HPS hps,
                                       PBITMAPINFOHEADER2 pbmpNew,
                                       ULONG flOptions,
                                       PBYTE pbInitData,
                                       PBITMAPINFO2 pbmiInfoTable);

      long    _System GpiSetBitmapBits(HPS hps,
                                        long lScanStart,
                                        long lScans,
                                        PBYTE pbBuffer,
                                        PBITMAPINFO2 pbmiInfoTable);

      BOOL    _System GpiSetBitmapDimension(HBITMAP hbm,
                                             PSIZEL psizlBitmapDimension);

      BOOL    _System GpiSetBitmapId(HPS hps,
                                      HBITMAP hbm,
                                      long lLcid);

      long    _System GpiQueryBitmapBits(HPS hps,
                                          long lScanStart,
                                          long lScans,
                                          PBYTE pbBuffer,
                                          PBITMAPINFO2 pbmiInfoTable);

      BOOL    _System GpiQueryBitmapDimension(HBITMAP hbm,
                                               PSIZEL psizlBitmapDimension);

      HBITMAP _System GpiQueryBitmapHandle(HPS hps,
                                            long lLcid);

      BOOL    _System GpiQueryBitmapParameters(HBITMAP hbm,
                                                PBITMAPINFOHEADER pbmpData);

      BOOL    _System GpiQueryBitmapInfoHeader(HBITMAP hbm,
                                                PBITMAPINFOHEADER2 pbmpData);

      BOOL    _System GpiQueryDeviceBitmapFormats(HPS hps,
                                                   long lCount,
                                                   PLONG alArray);

      long    _System GpiSetPel(HPS hps,
                                 PPOINTL pptlPoint);

      long    _System GpiQueryPel(HPS hps,
                                   PPOINTL pptlPoint);

      long    _System GpiFloodFill(HPS hps,
                                    long lOptions,
                                    long lColor);

      long    _System GpiDrawBits(HPS hps,
                                   PVOID pBits,
                                   PBITMAPINFO2 pbmiInfoTable,
                                   long lCount,
                                   PPOINTL aptlPoints,
                                   long lRop,
                                   ULONG flOptions);
#line 2022
   typedef struct _RGNRECT           
   {
      ULONG  ircStart;
      ULONG  crc;
      ULONG  crcReturned;
      ULONG  ulDirection;
   } RGNRECT;
   typedef RGNRECT *PRGNRECT;
#line 2060
      long  _System GpiCombineRegion(HPS hps,
                                      HRGN hrgnDest,
                                      HRGN hrgnSrc1,
                                      HRGN hrgnSrc2,
                                      long lMode);

      HRGN  _System GpiCreateRegion(HPS hps,
                                     long lCount,
                                     PRECTL arclRectangles);

      BOOL  _System GpiDestroyRegion(HPS hps,
                                      HRGN hrgn);

      long  _System GpiEqualRegion(HPS hps,
                                    HRGN hrgnSrc1,
                                    HRGN hrgnSrc2);

      BOOL  _System GpiOffsetRegion(HPS hps,
                                     HRGN Hrgn,
                                     PPOINTL pptlOffset);

      long  _System GpiPaintRegion(HPS hps,
                                    HRGN hrgn);

      long  _System GpiFrameRegion(HPS hps,
                                    HRGN hrgn,
                                    PSIZEL thickness);

      long  _System GpiPtInRegion(HPS hps,
                                   HRGN hrgn,
                                   PPOINTL pptlPoint);

      long  _System GpiQueryRegionBox(HPS hps,
                                       HRGN hrgn,
                                       PRECTL prclBound);

      BOOL  _System GpiQueryRegionRects(HPS hps,
                                         HRGN hrgn,
                                         PRECTL prclBound,
                                         PRGNRECT prgnrcControl,
                                         PRECTL prclRect);

      long  _System GpiRectInRegion(HPS hps,
                                     HRGN hrgn,
                                     PRECTL prclRect);

      BOOL  _System GpiSetRegion(HPS hps,
                                  HRGN hrgn,
                                  long lcount,
                                  PRECTL arclRectangles);
#line 2112
      long  _System GpiSetClipRegion(HPS hps,
                                      HRGN hrgn,
                                      PHRGN phrgnOld);
#line 2119
         HRGN  _System GpiQueryClipRegion(HPS hps);

         long  _System GpiQueryClipBox(HPS hps,
                                        PRECTL prclBound);
#line 2127
      long  _System GpiExcludeClipRectangle(HPS hps,
                                             PRECTL prclRectangle);

      long  _System GpiIntersectClipRectangle(HPS hps,
                                               PRECTL prclRectangle);
#line 2136
         long  _System GpiOffsetClipRegion(HPS hps,
                                            PPOINTL pptlPoint);
#line 2199
      HMF   _System GpiCopyMetaFile(HMF hmf);

      BOOL  _System GpiDeleteMetaFile(HMF hmf);
#line 2207
      HMF   _System GpiLoadMetaFile(HAB hab,
                                     PSZ pszFilename);
#line 2220
      long  _System GpiPlayMetaFile(HPS hps,
                                     HMF hmf,
                                     long lCount1,
                                     PLONG alOptarray,
                                     PLONG plSegCount,
                                     long lCount2,
                                     PSZ pszDesc);
#line 2229
      BOOL  _System GpiQueryMetaFileBits(HMF hmf,
                                          long lOffset,
                                          long lLength,
                                          PBYTE pbData);

      long  _System GpiQueryMetaFileLength(HMF hmf);
#line 2240
      BOOL  _System GpiSaveMetaFile(HMF hmf,
                                     PSZ pszFilename);
#line 2246
         BOOL  _System GpiSetMetaFileBits(HMF hmf,
                                           long lOffset,
                                           long lLength,
                                           PBYTE pbBuffer);
#line 2260
   BOOL  _System GpiQueryDefArcParams(HPS hps,
                                       PARCPARAMS parcpArcParams);

   BOOL  _System GpiQueryDefAttrs(HPS hps,
                                   long lPrimType,
                                   ULONG flAttrMask,
                                   PBUNDLE ppbunAttrs);

   BOOL  _System GpiQueryDefTag(HPS hps,
                                 PLONG plTag);

   BOOL  _System GpiQueryDefViewingLimits(HPS hps,
                                           PRECTL prclLimits);

   BOOL  _System GpiSetDefArcParams(HPS hps,
                                     PARCPARAMS parcpArcParams);

   BOOL  _System GpiSetDefAttrs(HPS hps,
                                 long lPrimType,
                                 ULONG flAttrMask,
                                 PBUNDLE ppbunAttrs);

   BOOL  _System GpiSetDefTag(HPS hps,
                               long lTag);

   BOOL  _System GpiSetDefViewingLimits(HPS hps,
                                         PRECTL prclLimits);
#line 2292
   typedef struct _POLYGON    
   {
      ULONG       ulPoints;
      PPOINTL     aPointl;
   } POLYGON;
   typedef POLYGON *PPOLYGON;

   typedef struct _POLYSET    
   {
      ULONG       ulPolys;
      POLYGON     aPolygon[1];
   } POLYSET;
   typedef POLYSET *PPOLYSET;
#line 2318
      long _System GpiPolygons(HPS hps,
                                ULONG ulCount,
                                PPOLYGON paplgn,
                                ULONG flOptions,
                                ULONG flModel);
#line 24 "F:\IBMCPP\INCLUDE\OS2\pmerr.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 901
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 2337 "F:\IBMCPP\INCLUDE\OS2\pmgpi.h"
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 38 "F:\IBMCPP\INCLUDE\OS2\pmdev.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 211
      HDC  _System DevOpenDC(HAB hab,
                              long lType,
                              PSZ pszToken,
                              long lCount,
                              PDEVOPENDATA pdopData,
                              HDC hdcComp);
#line 219
      HMF  _System DevCloseDC(HDC hdc);

      BOOL  _System DevQueryCaps(HDC hdc,
                                  long lStart,
                                  long lCount,
                                  PLONG alArray);
#line 234
      typedef struct _VIOSIZECOUNT     
      {
         long maxcount;
         long count;
      } VIOSIZECOUNT;
      typedef VIOSIZECOUNT *PVIOSIZECOUNT;

      typedef struct _VIOFONTCELLSIZE     
      {
         long cx;
         long cy;
      } VIOFONTCELLSIZE;
      typedef VIOFONTCELLSIZE *PVIOFONTCELLSIZE;
#line 249
      typedef struct _SFACTORS     
      {
         long x;
         long y;
      } SFACTORS;
      typedef SFACTORS *PSFACTORS;
#line 257
      typedef struct _BANDRECT     
      {
         long  xleft;
         long  ybottom;
         long  xright;
         long  ytop;
      } BANDRECT;
      typedef BANDRECT *PBANDRECT;
#line 298
      typedef struct _ESCMODE      
      {
         ULONG mode;
         BYTE  modedata[1];
      } ESCMODE;
      typedef ESCMODE *PESCMODE;
#line 315
      typedef char STR16[16];      
      typedef STR16 *PSTR16;
      typedef char STR32[32];      
      typedef STR32 *PSTR32;
      typedef char STR64[64];      
      typedef STR64 *PSTR64;
#line 330
      typedef struct _HCINFO            
      {
         char   szFormname[32];
         long   cx;
         long   cy;
         long   xLeftClip;
         long   yBottomClip;
         long   xRightClip;
         long   yTopClip;
         long   xPels;
         long   yPels;
         long   flAttributes;
      } HCINFO;
      typedef HCINFO *PHCINFO;
#line 348
         long  _System DevEscape(HDC hdc,
                                  long lCode,
                                  long lInCount,
                                  PBYTE pbInData,
                                  PLONG plOutCount,
                                  PBYTE pbOutData);
#line 364
         BOOL  _System DevQueryDeviceNames(HAB hab,
                                            PSZ pszDriverName,
                                            PLONG pldn,
                                            PSTR32 aDeviceName,
                                            PSTR64 aDeviceDesc,
                                            PLONG pldt,
                                            PSTR16 aDataType);
#line 373
         long  _System DevQueryHardcopyCaps(HDC hdc,
                                             long lStartForm,
                                             long lForms,
                                             PHCINFO phciHcInfo);
#line 386
         long  _System DevPostDeviceModes(HAB hab,
                                           PDRIVDATA pdrivDriverData ,
                                           PSZ pszDriverName,
                                           PSZ pszDeviceName,
                                           PSZ pszName,
                                           ULONG flOptions);
#line 406
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 29 "F:\IBMCPP\INCLUDE\OS2\pmwp.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 50
   typedef LHANDLE HOBJECT;
#line 73
      typedef struct _OBJECTIMAGE      
      {
         HPOINTER hptrObject;
      } OBJECTIMAGE;
      typedef OBJECTIMAGE *POBJECTIMAGE;
#line 80
      typedef struct _OBJCLASS          
      {
         struct _OBJCLASS *pNext;          
         PSZ               pszClassName;   
         PSZ               pszModName;     
      } OBJCLASS;
      typedef OBJCLASS *POBJCLASS;
#line 95
      BOOL _System WinRegisterObjectClass(PSZ pszClassName,
                                           PSZ pszModName);
#line 102
      BOOL _System WinDeregisterObjectClass(PSZ pszClassName);
#line 110
      BOOL _System WinReplaceObjectClass(PSZ pszOldClassName,
                                          PSZ pszNewClassName,
                                          BOOL fReplace);
#line 115
      BOOL _System WinEnumObjectClasses(POBJCLASS pObjClass,
                                         PULONG pulSize);
#line 125
      HOBJECT _System WinCreateObject(PSZ pszClassName,
                                       PSZ pszTitle,
                                       PSZ pszSetupString,
                                       PSZ pszLocation,
                                       ULONG ulFlags );
#line 139
      BOOL _System WinSetObjectData(HOBJECT hObject,
                                     PSZ pszSetupString);
#line 143
      BOOL _System WinDestroyObject(HOBJECT hObject);
#line 148
      HOBJECT _System WinQueryObject(PSZ pszObjectID);
#line 151
      BOOL _System WinSaveObject(HOBJECT hObject,
                                  BOOL    fAsync);

      BOOL _System WinOpenObject(HOBJECT hObject,
                                  ULONG   ulView,
                                  BOOL    Flag);

      HOBJECT _System WinMoveObject(HOBJECT hObjectofObject,
                                     HOBJECT hObjectofDest,
                                     ULONG   ulReserved);

      HOBJECT _System WinCopyObject(HOBJECT hObjectofObject,
                                     HOBJECT hObjectofDest,
                                     ULONG   ulReserved);

      HOBJECT _System WinCreateShadow(HOBJECT hObjectofObject,
                                       HOBJECT hObjectofDest,
                                       ULONG   ulReserved);
#line 173
      BOOL _System WinQueryActiveDesktopPathname(PSZ pszPathName,
                                                  ULONG ulSize);
#line 181
      BOOL _System WinQueryObjectPath(HOBJECT hobject,
                                       PSZ pszPathName,
                                       ULONG ulSize);
#line 186
      APIRET  _System WinRestartWPDServer( BOOL fState );
      BOOL    _System WinIsWPDServerReady( void );
      APIRET  _System WinRestartSOMDD( BOOL fState );
      BOOL    _System WinIsSOMDDReady( void );
#line 24 "F:\IBMCPP\INCLUDE\OS2\pmerr.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 901
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 199 "F:\IBMCPP\INCLUDE\OS2\pmwp.h"
   typedef struct _PAGEINFO      
   {
      ULONG   cb;
      HWND    hwndPage;
      PFNWP   pfnwp;
      ULONG   resid;
      PVOID   pCreateParams;
      USHORT  dlgid;
      USHORT  usPageStyleFlags;
      USHORT  usPageInsertFlags;
      USHORT  usSettingsFlags;
      PSZ     pszName;
      USHORT  idDefaultHelpPanel;
      USHORT  usReserved2;
      PSZ     pszHelpLibraryName;
      PUSHORT pHelpSubtable;    
      HMODULE hmodHelpSubtable;
      ULONG   ulPageInsertId;
   } PAGEINFO;
   typedef PAGEINFO *PPAGEINFO;
#line 225
      typedef struct _ICONPOS      
      {
         POINTL  ptlIcon;                     
         char    szIdentity[1];               
      } ICONPOS;
      typedef ICONPOS *PICONPOS;
#line 238
         BOOL _System WinSetFileIcon(PSZ pszFileName,
                                      PICONINFO pIcnInfo);
#line 247
         BOOL _System WinSetFileIconN(PSZ pszFileName,
                                       PICONINFO pIcnInfo,
                                       ULONG ulIconIndex);
#line 252
      BOOL _System WinFreeFileIcon(HPOINTER hptr);
#line 258
      HPOINTER _System WinLoadFileIcon(PSZ pszFileName,
                                        BOOL fPrivate);
#line 267
      HPOINTER _System WinLoadFileIconN(PSZ pszFileName,
                                         BOOL fPrivate,
                                         ULONG ulIconIndex);
#line 277
      BOOL _System WinStoreWindowPos(PSZ pszAppName,
                                      PSZ pszKeyName,
                                      HWND hwnd);
#line 287
      BOOL _System WinRestoreWindowPos(PSZ pszAppName,
                                        PSZ pszKeyName,
                                        HWND hwnd);
#line 292
      BOOL _System WinShutdownSystem(HAB hab,
                                      HMQ hmq);
#line 304
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 21 "F:\IBMCPP\INCLUDE\OS2\pmavio.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 66
typedef USHORT HVPS;         
typedef HVPS *PHVPS;     

USHORT  _Far16 _Pascal VIO16ASSOCIATE(HDC hdc,
                                HVPS hvps);

USHORT  _Far16 _Pascal VIO16CREATELOGFONT(PFATTRS pfatattrs,
                                    long llcid,
                                    PSTR8 pName,
                                    HVPS hvps);

USHORT  _Far16 _Pascal VIO16CREATEPS(PHVPS phvps,
                               short sdepth,
                               short swidth,
                               short sFormat,
                               short sAttrs,
                               HVPS hvpsReserved);

USHORT  _Far16 _Pascal VIO16DELETESETID(long llcid,
                                  HVPS hvps);

USHORT  _Far16 _Pascal VIO16DESTROYPS(HVPS hvps);

USHORT  _Far16 _Pascal VIO16GETDEVICECELLSIZE(PSHORT psHeight,
                                        PSHORT psWidth,
                                        HVPS hvps);

USHORT  _Far16 _Pascal VIO16GETORG(PSHORT psRow,
                             PSHORT psColumn,
                             HVPS hvps);

USHORT  _Far16 _Pascal VIO16QUERYFONTS(PLONG plRemfonts,
                                 PFONTMETRICS afmMetrics,
                                 long lMetricsLength,
                                 PLONG plFonts,
                                 PSZ pszFacename,
                                 ULONG flOptions,
                                 HVPS hvps);

USHORT  _Far16 _Pascal VIO16QUERYSETIDS(PLONG allcids,
                                  PSTR8 pNames,
                                  PLONG alTypes,
                                  long lcount,
                                  HVPS hvps);

USHORT  _Far16 _Pascal VIO16SETDEVICECELLSIZE(short sHeight,
                                        short sWidth,
                                        HVPS hvps);

USHORT  _Far16 _Pascal VIO16SETORG(short sRow,
                             short sColumn,
                             HVPS hvps);

USHORT  _Far16 _Pascal VIO16SHOWPS(short sDepth,
                             short sWidth,
                             short soffCell,
                             HVPS hvps);
#line 132
MRESULT _Far16 _Pascal WIN16DEFAVIOWINDOWPROC(HWND hwnd,
                                        USHORT msg,
                                        ULONG mp1,
                                        ULONG mp2);
#line 142
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 31 "F:\IBMCPP\INCLUDE\OS2\pmspl.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 95
   typedef LHANDLE HSPL;                
#line 98
   typedef LHANDLE HSTD;                
   typedef HSTD *PHSTD;
#line 102
   typedef PSZ *PQMOPENDATA;        
#line 119
   typedef LHANDLE HPROC;               
#line 122
   typedef PSZ *PQPOPENDATA;        
#line 126
   HPROC _System SplQpOpen(long        cData,
   PQPOPENDATA pQPDataIn);

   BOOL  _System SplQpPrint(HPROC hproc,
   PSZ   pszFileName);

   BOOL  _System SplQpClose(HPROC hproc);

   BOOL  _System SplQpControl(HPROC hproc,
   long  cmdCode);

   BOOL  _System SplQpQueryDt(PLONG    pcDataType,
   PSZ *paszDataTypes);

   BOOL  _System SplQpInstall(HWND hwnd);
#line 147
   BOOL  _System SplQpQueryFlags(PULONG pulFlags);
#line 177
   typedef struct _SQPOPENDATA        
   {
      PSZ       pszLogAddress;      
      PSZ       pszDriverName;      
      PDRIVDATA pdriv;              
      PSZ       pszDataType;        
      PSZ       pszComment;         
      PSZ       pszProcParams;      
      PSZ       pszSpoolParams;     
      PSZ       pszNetworkParams;   
      PSZ       pszDocName;         
      PSZ       pszQueueName;       
      PSZ       pszToken;           
      USHORT    idJobId;            
   } SQPOPENDATA;                    
   typedef SQPOPENDATA *PSQPOPENDATA;  
#line 24 "F:\IBMCPP\INCLUDE\OS2\pmerr.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 901
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 226 "F:\IBMCPP\INCLUDE\OS2\pmspl.h"
   typedef unsigned long SPLERR;
#line 588
   HSPL _System SplQmOpen(PSZ         pszToken,
                           long        lCount,
                           PQMOPENDATA pqmdopData);
#line 597
   BOOL _System SplQmStartDoc(HSPL  hspl,
                               PSZ pszDocName);

   BOOL _System SplQmWrite(HSPL    hspl,
                            long  lCount,
                            PVOID pData);

   BOOL _System SplQmEndDoc(HSPL hspl);

   BOOL _System SplQmClose(HSPL hspl);

   BOOL _System SplQmAbort(HSPL hspl);

   BOOL _System SplQmAbortDoc(HSPL hspl);
#line 621
   ULONG  _System SplMessageBox(PSZ   pszLogAddr,
                                 ULONG fErrInfo,
                                 ULONG fErrData,
                                 PSZ   pszText,
                                 PSZ   pszCaption,
                                 ULONG idWindow,
                                 ULONG fStyle);
#line 668
   BOOL _System SplStdOpen(HDC hdc);

   BOOL _System SplStdClose(HDC hdc);

   BOOL _System SplStdStart(HDC hdc);

   HSTD _System SplStdStop(HDC hdc);

   BOOL _System SplStdDelete(HSTD hMetaFile);

   BOOL _System SplStdGetBits(HSTD hMetaFile,
                               long offData,
                               long cbData,
                               PCH  pchData);

   long _System SplStdQueryLength(HSTD hMetaFile);
#line 693
   SPLERR _System SplCreateDevice(PSZ   pszComputerName,
                                   ULONG ulLevel,
                                   PVOID pBuf,
                                   ULONG cbBuf);
#line 705
   SPLERR _System SplControlDevice(PSZ   pszComputerName,
                                    PSZ   pszPortName,
                                    ULONG ulControl);
#line 715
   SPLERR _System SplDeleteDevice(PSZ pszComputerName,
                                   PSZ pszPrintDeviceName);
#line 731
   SPLERR _System SplEnumDevice(PSZ    pszComputerName,
                                 ULONG  ulLevel,
                                 PVOID  pBuf,
                                 ULONG  cbBuf,
                                 PULONG pcReturned,
                                 PULONG pcTotal,
                                 PULONG pcbNeeded,
                                 PVOID  pReserved);
#line 750
   SPLERR _System SplQueryDevice(PSZ    pszComputerName,
                                  PSZ    pszPrintDeviceName,
                                  ULONG  ulLevel,
                                  PVOID  pBuf,
                                  ULONG  cbBuf,
                                  PULONG pcbNeeded);
#line 767
   SPLERR _System SplSetDevice(PSZ   pszComputerName,
                                PSZ   pszPrintDeviceName,
                                ULONG ulLevel,
                                PVOID pBuf,
                                ULONG cbBuf,
                                ULONG ulParmNum);
#line 781
   SPLERR _System SplReleaseJob(PSZ   pszComputerName,
                                 PSZ   pszQueueName,
                                 ULONG ulJob);
#line 792
   SPLERR _System SplDeleteJob(PSZ   pszComputerName,
                                PSZ   pszQueueName,
                                ULONG ulJob);
#line 809
   SPLERR _System SplEnumJob(PSZ    pszComputerName,
                              PSZ    pszQueueName,
                              ULONG  ulLevel,
                              PVOID  pBuf,
                              ULONG  cbBuf,
                              PULONG pcReturned,
                              PULONG pcTotal,
                              PULONG pcbNeeded,
                              PVOID  pReserved);
#line 832
   SPLERR _System SplQueryJob(PSZ    pszComputerName,
                               PSZ    pszQueueName,
                               ULONG  ulJob,
                               ULONG  ulLevel,
                               PVOID  pBuf,
                               ULONG  cbBuf,
                               PULONG pcbNeeded);
#line 847
   SPLERR _System SplHoldJob(PSZ   pszComputerName,
                              PSZ   pszQueueName,
                              ULONG ulJob);
#line 862
   SPLERR _System SplSetJob(PSZ   pszComputerName,
                             PSZ   pszQueueName,
                             ULONG ulJob,
                             ULONG ulLevel,
                             PVOID pBuf,
                             ULONG cbBuf,
                             ULONG ulParmNum);
#line 878
   SPLERR _System SplCreateQueue(PSZ   pszComputerName,
                                  ULONG ulLevel,
                                  PVOID pBuf,
                                  ULONG cbBuf);
#line 889
   SPLERR _System SplReleaseQueue(PSZ pszComputerName,
                                   PSZ pszQueueName);
#line 899
   SPLERR _System SplDeleteQueue(PSZ pszComputerName,
                                  PSZ pszQueueName);
#line 915
   SPLERR _System SplEnumQueue(PSZ    pszComputerName,
                                ULONG  ulLevel,
                                PVOID  pBuf,
                                ULONG  cbBuf,
                                PULONG pcReturned,
                                PULONG pcTotal,
                                PULONG pcbNeeded,
                                PVOID  pReserved);
#line 934
   SPLERR _System  SplQueryQueue(PSZ    pszComputerName,
                                  PSZ    pszQueueName,
                                  ULONG  ulLevel,
                                  PVOID  pBuf,
                                  ULONG  cbBuf,
                                  PULONG pcbNeeded);
#line 947
   SPLERR _System SplHoldQueue(PSZ pszComputerName,
                                PSZ pszQueueName);
#line 957
   SPLERR _System SplPurgeQueue(PSZ pszComputerName,
                                 PSZ pszQueueName);
#line 971
   SPLERR _System  SplSetQueue(PSZ   pszComputerName,
                                PSZ   pszQueueName,
                                ULONG ulLevel,
                                PVOID pBuf,
                                ULONG cbBuf,
                                ULONG ulParmNum);
#line 990
   SPLERR _System  SplEnumDriver(PSZ    pszComputerName,
                                  ULONG  ulLevel,
                                  PVOID  pBuf,
                                  ULONG  cbBuf,
                                  PULONG pcReturned,
                                  PULONG pcTotal,
                                  PULONG pcbNeeded,
                                  PVOID  pReserved);
#line 1011
   SPLERR _System  SplEnumPort(PSZ    pszComputerName,
                                ULONG  ulLevel,
                                PVOID  pBuf,
                                ULONG  cbBuf,
                                PULONG pcReturned,
                                PULONG pcTotal,
                                PULONG pcbNeeded,
                                PVOID  pReserved);
#line 1032
   SPLERR _System  SplEnumQueueProcessor(PSZ    pszComputerName,
                                          ULONG  ulLevel,
                                          PVOID  pBuf,
                                          ULONG  cbBuf,
                                          PULONG pcReturned,
                                          PULONG pcTotal,
                                          PULONG pcbNeeded,
                                          PVOID  pReserved);
#line 1054
   SPLERR _System SplEnumPrinter(PSZ    pszComputerName,
                                  ULONG  uLevel,
                                  ULONG  flType,
                                  PVOID  pBuf,
                                  ULONG  cbbuf,
                                  PULONG pcReturned,
                                  PULONG pcTotal,
                                  PULONG pcbNeeded,
                                  PVOID  pReserved);
#line 1073
   SPLERR _System SplCopyJob(PSZ    pszSrcComputerName,
                              PSZ    pszSrcQueueName,
                              ULONG  ulSrcJob,
                              PSZ    pszTrgComputerName,
                              PSZ    pszTrgQueueName,
                              PULONG pulTrgJob);
#line 1091
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 21 "F:\IBMCPP\INCLUDE\OS2\pmpic.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 51
BOOL _System PicPrint(HAB hab,
                       PSZ pszFilename,
                       long lType,
                       PSZ pszParams);
#line 63
BOOL _System PicIchg(HAB hab,
                      PSZ pszFilename1,
                      PSZ pszFilename2,
                      long lType);
#line 75
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 36 "F:\IBMCPP\INCLUDE\OS2\pmord.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 50
#pragma pack(1)       
#line 60
typedef struct _RECT1S          
{
   short xLeft;
   short yBottom;
   short xRight;
   short yTop;
} RECT1S;
#line 69
typedef struct _ODPOINT           
{
   char   dx;
   char   dy;
} ODPOINT;
#line 76
typedef struct _SIZES             
{
   short  cx;
   short  cy;
} SIZES;
#line 84
typedef struct _SWPUSHORT         
{
   UCHAR  HiByte;
   UCHAR  LoByte;
} SWPUSHORT;
#line 116
typedef struct _ORDER             
{
   UCHAR  idCode;
   UCHAR  uchData;
} ORDER;
#line 186
typedef struct _LORDER            
{
   UCHAR  idCode;
   UCHAR  uchLength;
   UCHAR  uchData[253];
} LORDER;
#line 315
typedef struct _ORDERS_GCARC      
{
   POINTS ptInter;
   POINTS ptEnd;
} ORDERS_GCARC;

typedef struct _ORDERL_GCARC      
{
   POINTL ptInter;
   POINTL ptEnd;
} ORDERL_GCARC;
#line 331
typedef struct _ORDER_GBEL        
{
   long   lElementType;
   char   achDesc[251];
} ORDER_GBEL;
#line 341
typedef struct _ORDER_GCBIMG      
{
   UCHAR     uchFormat;
   UCHAR     uchReserved;
   SWPUSHORT cx;
   SWPUSHORT cy;
} ORDER_GCBIMG;
#line 352
typedef struct _ORDER_GBPTH       
{
   USHORT usReserved;
   long   idPath;
} ORDER_GBPTH;
#line 362
typedef struct _ORDERS_GCBOX      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   POINTS ptCorner;
   short  hAxis;
   short  vAxis;
} ORDERS_GCBOX;

typedef struct _ORDERL_GCBOX      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   POINTL ptCorner;
   long   hAxis;
   long   vAxis;
} ORDERL_GCBOX;
#line 386
typedef struct _ORDER_GCALLS      
{
   USHORT sReserved;
   long   idSegment;
} ORDER_GCALLS;
#line 394
typedef struct _ORDER_GFPTH      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   long   idPath;
} ORDER_GFPTH;
#line 407
typedef struct _ORDER_GOPTH      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   long   idPath;
} ORDER_GOPTH;
#line 417
typedef struct _ORDER_GMPTH       
{
   UCHAR  uchMode;
   UCHAR  uchReserved;
   long   idPath;
} ORDER_GMPTH;
#line 430
typedef struct _ORDERS_GCPARC     
{
   POINTS   ptCenter;
   FIXED88  ufx88Multiplier;
   long     usStartAngle;
   long     usSweepAngle;
} ORDERS_GCPARC;

typedef struct _ORDERL_GCPARC     
{
   POINTL   ptCenter;
   FIXED    ufxMultiplier;
   long     usStartAngle;
   long     usSweepAngle;
} ORDERL_GCPARC;
#line 449
typedef struct _ORDER_GSCPTH      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   long   idPath;
} ORDER_GSCPTH;
#line 465
typedef struct _ORDERS_GSAP       
{
   short  p;
   short  q;
   short  r;
   short  s;
} ORDERS_GSAP;

typedef struct _ORDERL_GSAP       
{
   long   p;
   long   q;
   long   r;
   long   s;
} ORDERL_GSAP;
#line 487
typedef struct _ORDER_GSBICOL     
{
   UCHAR  fbFlags;
   UCHAR  auchColor[3];
} ORDER_GSBICOL;
#line 505
typedef struct _ORDERS_GSCC       
{
   short  cxInt;
   short  cyInt;
   USHORT cxFract;
   USHORT cyFract;
   UCHAR  fbFlags;
   UCHAR  uchReserved;
} ORDERS_GSCC;

typedef struct _ORDERL_GSCC       
{
   long   cxInt;
   long   cyInt;
   USHORT cxFract;
   USHORT cyFract;
   UCHAR  fbFlags;
   UCHAR  uchReserved;
} ORDERL_GSCC;
#line 532
typedef struct _ORDERS_GSMC       
{
   short  cx;
   short  cy;
   UCHAR  fbFlags;
   UCHAR  uchReserved;
} ORDERS_GSMC;

typedef struct _ORDERL_GSMC       
{
   long   cx;
   long   cy;
   UCHAR  fbFlags;
   UCHAR  uchReserved;
} ORDERL_GSMC;
#line 555
typedef struct _ORDERS_GSPRP      
{
   UCHAR fbFlags;
   UCHAR uchReserved;
   POINTS ptPos;
} ORDERS_GSPRP;

typedef struct _ORDERL_GSPRP      
{
   UCHAR fbFlags;
   UCHAR uchReserved;
   POINTL ptPos;
} ORDERL_GSPRP;
#line 578
typedef struct _ORDER_GSIA        
{
   UCHAR  uchAttrType;
   UCHAR  uchPrimType;
   UCHAR  fbFlags;
   UCHAR  auchValue[3];
} ORDER_GSIA;
#line 611
typedef struct _ORDERS_GSTM        
{
   UCHAR  uchReserved;
   UCHAR  fbFlags;
   USHORT fsMask;
   short  asMatrix[16];
} ORDERS_GSTM;

typedef struct _ORDERL_GSTM        
{
   UCHAR  uchReserved;
   UCHAR  fbFlags;
   USHORT fsMask;
   long   alMatrix[16];
} ORDERL_GSTM;
#line 659
typedef struct _ORDERS_GSSB       
{
   UCHAR  fbFlags;
   UCHAR  fbMask;
   short  alMatrix[4];
} ORDERS_GSSB;

typedef struct _ORDERL_GSSB       
{
   UCHAR  fbFLags;
   UCHAR  fbMask;
   long   alMatrix[4];
} ORDERL_GSSB;
#line 685
typedef struct _ORDER_GSGCH       
{
   UCHAR  uchIdent;
   UCHAR  auchData[254];
} ORDER_GSGCH;
#line 695
typedef struct _ORDERS_GSSLW      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   short  LineWidth;
} ORDERS_GSSLW;

typedef struct _ORDERL_GSSLW      
{
   UCHAR  fbFlags;
   UCHAR  uchReserved;
   long   LineWidth;
} ORDERL_GSSLW;
#line 719
typedef struct _ORDERS_GCSFLT     
{
   POINTS apt[2*21];
   FIXED  afxSharpness[21];
} ORDERS_GCSFLT;
#line 728
typedef struct _ORDERL_GCSFLT     
{
   POINTL apt[2*21];
   FIXED  afxSharpness[21];
} ORDERL_GCSFLT;
#line 737
typedef struct _ORDERS_GBBLT       
{
   USHORT  fsFlags;
   USHORT  usMix;
   HBITMAP hbmSrc;
   long    lOptions;
   RECT1S  rcsTargetRect;
   RECTL   rclSourceRect;
} ORDERS_GBBLT;

typedef struct _ORDERL_GBBLT       
{
   USHORT  fsFlags;
   USHORT  usMix;
   HBITMAP hbmSrc;
   long    lOptions;
   RECTL   rclTargetRect;
   RECTL   rclSourceRect;
} ORDERL_GBBLT;
#line 763
typedef struct _ORDER_GSCBE        
{
   UCHAR   fbFlags;
   UCHAR   uchReserved;
   FIXED   ufxextra;
} ORDER_GSCE, ORDER_GPSCE, ORDER_GSCBE, ORDER_GPSCBE;
#line 778
typedef struct _ORDER_GESCP       
{
   UCHAR  uchType;
   UCHAR  uchIdent;
   UCHAR  auchData[253];            
} ORDER_GESCP;
#line 793
typedef struct _ORDERL_GEBB       
{
   UCHAR   fbFlags;
   USHORT  usMix;
   UCHAR   cPoints;
   HBITMAP hbmSrc;
   long    lReserved;
   long    lOptions;
   POINTL  aptPoints[29];
} ORDERL_GEBB;
#line 814
typedef struct _ORDERL_GEDB       
{
   USHORT      fsFlags;
   USHORT      usMix;
   PVOID       pBits;
   PBITMAPINFO2 pbmi;
   long        lOptions;
   RECTL       rclTargetRect;
   RECTL       rclSourceRect;
} ORDERL_GEDB;
#line 831
typedef struct _ORDERL_GEFF       
{
   UCHAR       fsFlags;
   UCHAR       auchColor[3];
} ORDERL_GEFF;
#line 857
typedef struct _VORDER            
{
   UCHAR     idCode;
   UCHAR     uchQualifier;
   SWPUSHORT uchLength;
   UCHAR     uchData[65531];
} VORDER;
#line 872
typedef struct _ORDERS_GCCHSTE     
{
   UCHAR     fbFlags;
   UCHAR     uchReserved;
   POINTS    ptRect[2];
   SWPUSHORT cchString;
   char      achString[1];
   short     adx[1];
} ORDERS_GCCHSTE;

typedef struct _ORDERL_GCCHSTE     
{
   UCHAR     fbFlags;
   UCHAR     uchReserved;
   POINTL    ptRect[2];
   SWPUSHORT cchString;
   char      achString[1];
   long      adx[1];
} ORDERL_GCCHSTE;
#line 909
typedef struct _ORDER_GEESCP      
{
   UCHAR  uchType;
   UCHAR  uchIdent;
   UCHAR  auchData[65533];
} ORDER_GEESCP;
#line 917
#pragma pack()     
#line 925
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 19 "F:\IBMCPP\INCLUDE\OS2\pmfont.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 35
   typedef struct _FOCAMETRICS     
   {
      ULONG   ulIdentity;
      ULONG   ulSize;
      char    szFamilyname[32];
      char    szFacename[32];
      short   usRegistryId;
      short   usCodePage;
      short   yEmHeight;
      short   yXHeight;
      short   yMaxAscender;
      short   yMaxDescender;
      short   yLowerCaseAscent;
      short   yLowerCaseDescent;
      short   yInternalLeading;
      short   yExternalLeading;
      short   xAveCharWidth;
      short   xMaxCharInc;
      short   xEmInc;
      short   yMaxBaselineExt;
      short   sCharSlope;
      short   sInlineDir;
      short   sCharRot;
      USHORT  usWeightClass;
      USHORT  usWidthClass;
      short   xDeviceRes;
      short   yDeviceRes;
      short   usFirstChar;
      short   usLastChar;
      short   usDefaultChar;
      short   usBreakChar;
      short   usNominalPointSize;
      short   usMinimumPointSize;
      short   usMaximumPointSize;
      short   fsTypeFlags;
      short   fsDefn;
      short   fsSelectionFlags;
      short   fsCapabilities;
      short   ySubscriptXSize;
      short   ySubscriptYSize;
      short   ySubscriptXOffset;
      short   ySubscriptYOffset;
      short   ySuperscriptXSize;
      short   ySuperscriptYSize;
      short   ySuperscriptXOffset;
      short   ySuperscriptYOffset;
      short   yUnderscoreSize;
      short   yUnderscorePosition;
      short   yStrikeoutSize;
      short   yStrikeoutPosition;
      short   usKerningPairs;
      short   sFamilyClass;
      PSZ      pszDeviceNameOffset;
   } FOCAMETRICS;
   typedef FOCAMETRICS *PFOCAMETRICS;

   typedef struct _FONTFILEMETRICS     
   {
      ULONG   ulIdentity;
      ULONG   ulSize;
      char    szFamilyname[32];
      char    szFacename[32];
      short   usRegistryId;
      short   usCodePage;
      short   yEmHeight;
      short   yXHeight;
      short   yMaxAscender;
      short   yMaxDescender;
      short   yLowerCaseAscent;
      short   yLowerCaseDescent;
      short   yInternalLeading;
      short   yExternalLeading;
      short   xAveCharWidth;
      short   xMaxCharInc;
      short   xEmInc;
      short   yMaxBaselineExt;
      short   sCharSlope;
      short   sInlineDir;
      short   sCharRot;
      USHORT  usWeightClass;
      USHORT  usWidthClass;
      short   xDeviceRes;
      short   yDeviceRes;
      short   usFirstChar;
      short   usLastChar;
      short   usDefaultChar;
      short   usBreakChar;
      short   usNominalPointSize;
      short   usMinimumPointSize;
      short   usMaximumPointSize;
      short   fsTypeFlags;
      short   fsDefn;
      short   fsSelectionFlags;
      short   fsCapabilities;
      short   ySubscriptXSize;
      short   ySubscriptYSize;
      short   ySubscriptXOffset;
      short   ySubscriptYOffset;
      short   ySuperscriptXSize;
      short   ySuperscriptYSize;
      short   ySuperscriptXOffset;
      short   ySuperscriptYOffset;
      short   yUnderscoreSize;
      short   yUnderscorePosition;
      short   yStrikeoutSize;
      short   yStrikeoutPosition;
      short   usKerningPairs;
      short   sFamilyClass;
      ULONG   ulReserved;
      PANOSE  panose;
   } FONTFILEMETRICS;
   typedef FONTFILEMETRICS *PFONTFILEMETRICS;

   typedef struct _FONTDEFINITIONHEADER     
   {
      ULONG   ulIdentity;
      ULONG   ulSize;
      short   fsFontdef;
      short   fsChardef;
      short   usCellSize;
      short   xCellWidth;
      short   yCellHeight;
      short   xCellIncrement;
      short   xCellA;
      short   xCellB;
      short   xCellC;
      short   pCellBaseOffset;
   } FONTDEFINITIONHEADER;
   typedef FONTDEFINITIONHEADER *PFONTDEFINITIONHEADER;
#line 173
   typedef struct _FONTSIGNATURE     
   {
      ULONG   ulIdentity;
      ULONG   ulSize;
      char    achSignature[12];
   } FONTSIGNATURE;
   typedef FONTSIGNATURE *PFONTSIGNATURE;

   typedef struct _ADDITIONALMETRICS     
   {
      ULONG   ulIdentity;
      ULONG   ulSize;
      PANOSE  panose;
   } ADDITIONALMETRICS;
   typedef ADDITIONALMETRICS *PADDITIONALMETRICS;

   typedef struct _FOCAFONT     
   {
      FONTSIGNATURE     fsSignature;
      FOCAMETRICS       fmMetrics;
      FONTDEFINITIONHEADER fdDefinitions;
   } FOCAFONT;
   typedef FOCAFONT *PFOCAFONT;
#line 225
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 37 "F:\IBMCPP\INCLUDE\OS2\pmstddlg.h"
   #pragma info( none )

      #pragma info( none )

   #pragma info( restore )
#line 133
   typedef  PSZ       APSZ[1];
   typedef  APSZ *PAPSZ;           
#line 139
   typedef struct _FILEDLG      
   {
      ULONG    cbSize;             
      ULONG    fl;                 
      ULONG    ulUser;             
      long     lReturn;            
      long     lSRC;               
      PSZ      pszTitle;           
      PSZ      pszOKButton;        
      PFNWP    pfnDlgProc;         
      PSZ      pszIType;           
#line 152
      PAPSZ    papszITypeList;     
#line 156
      PSZ      pszIDrive;          
#line 159
      PAPSZ    papszIDriveList;    
#line 163
      HMODULE  hMod;               
      char     szFullFile[260];  

      PAPSZ    papszFQFilename;    
#line 170
      ULONG    ulFQFCount;         
      USHORT   usDlgId;            
      short    x;                  
      short    y;                  
      short    sEAType;            
   } FILEDLG;
   typedef FILEDLG *PFILEDLG;
#line 181
   HWND    _System WinFileDlg(HWND hwndP,
                               HWND hwndO,
                               PFILEDLG pfild);
   MRESULT _System WinDefFileDlgProc(HWND hwnd,
                                      ULONG msg,
                                      MPARAM mp1,
                                      MPARAM mp2);

   BOOL    _System WinFreeFileDlgList(PAPSZ papszFQFilename);
#line 274
   typedef struct _FONTDLG      
   {
      ULONG   cbSize;                 
      HPS     hpsScreen;              
      HPS     hpsPrinter;             
      PSZ     pszTitle;               
      PSZ     pszPreview;             
      PSZ     pszPtSizeList;          
      PFNWP   pfnDlgProc;             
      PSZ     pszFamilyname;          
      FIXED   fxPointSize;            
      ULONG   fl;                     
      ULONG   flFlags;                
      ULONG   flType;                 
      ULONG   flTypeMask;             
      ULONG   flStyle;                
      ULONG   flStyleMask;            
      long    clrFore;                
      long    clrBack;                
      ULONG   ulUser;                 
      long    lReturn;                
      long    lSRC;                   
      long    lEmHeight;              
      long    lXHeight;               
      long    lExternalLeading;       
      HMODULE hMod;                   
      FATTRS  fAttrs;                 
      short   sNominalPointSize;      
      USHORT  usWeight;               
      USHORT  usWidth;                
      short   x;                      
      short   y;                      
      USHORT  usDlgId;                
      USHORT  usFamilyBufLen;         
      USHORT  usReserved;             
   } FONTDLG;
   typedef FONTDLG *PFONTDLG;
#line 386
   typedef struct _STYLECHANGE      
   {
      USHORT      usWeight;
      USHORT      usWeightOld;
      USHORT      usWidth;
      USHORT      usWidthOld;
      ULONG       flType;
      ULONG       flTypeOld;
      ULONG       flTypeMask;
      ULONG       flTypeMaskOld;
      ULONG       flStyle;
      ULONG       flStyleOld;
      ULONG       flStyleMask;
      ULONG       flStyleMaskOld;
   } STYLECHANGE;
   typedef STYLECHANGE *PSTYLECHANGE;
#line 406
   HWND    _System WinFontDlg(HWND hwndP,
                               HWND hwndO,
                               PFONTDLG pfntd);
   MRESULT _System WinDefFontDlgProc(HWND hwnd,
                                      ULONG msg,
                                      MPARAM mp1,
                                      MPARAM mp2);
#line 577
   typedef struct _SPBCDATA      
   {
      ULONG   cbSize;                 
      ULONG   ulTextLimit;            
      long    lLowerLimit;            
      long    lUpperLimit;            
      ULONG   idMasterSpb;            
      PVOID   pHWXCtlData;            
   } SPBCDATA;
   typedef SPBCDATA *PSPBCDATA;
#line 707
   typedef LHANDLE HSTR;   

   typedef struct _DRAGITEM      
   {
      HWND    hwndItem;                   
      ULONG   ulItemID;                   
      HSTR    hstrType;                   
      HSTR    hstrRMF;                    
      HSTR    hstrContainerName;          
      HSTR    hstrSourceName;             
      HSTR    hstrTargetName;             
      short   cxOffset;                   

      short   cyOffset;                   

      USHORT  fsControl;                  
      USHORT  fsSupportedOps;             
   } DRAGITEM;
   typedef DRAGITEM *PDRAGITEM;

   typedef struct _DRAGINFO      
   {
      ULONG    cbDraginfo;                
      USHORT   cbDragitem;                
      USHORT   usOperation;               
      HWND     hwndSource;                
      short    xDrop;                     
      short    yDrop;                     
      USHORT   cditem;                    
      USHORT   usReserved;                
   } DRAGINFO;
   typedef DRAGINFO *PDRAGINFO;

   typedef struct _DRAGIMAGE      
   {
      USHORT  cb;                         
      USHORT  cptl;                       
      LHANDLE hImage;                     
      SIZEL   sizlStretch;                
      ULONG   fl;                         
      short   cxOffset;                   

      short   cyOffset;                   

   } DRAGIMAGE;
   typedef DRAGIMAGE *PDRAGIMAGE;

   typedef struct _DRAGTRANSFER      
   {
      ULONG      cb;                      
      HWND       hwndClient;              
      PDRAGITEM  pditem;                  
      HSTR       hstrSelectedRMF;         
      HSTR       hstrRenderToName;        
      ULONG      ulTargetInfo;            
      USHORT     usOperation;             
      USHORT     fsReply;                 
   } DRAGTRANSFER;
   typedef DRAGTRANSFER *PDRAGTRANSFER;

   typedef struct _RENDERFILE      
   {
      HWND   hwndDragFiles;               
      HSTR   hstrSource;                  
      HSTR   hstrTarget;                  
      USHORT fMove;                       
      USHORT usRsvd;                      
   } RENDERFILE;
   typedef RENDERFILE *PRENDERFILE;
#line 784
   BOOL      _System DrgAcceptDroppedFiles(HWND hwnd,
                                            PSZ pszPath,
                                            PSZ pszTypes,
                                            ULONG ulDefaultOp,
                                            ULONG ulRsvd);
#line 791
   PDRAGINFO _System DrgAllocDraginfo(ULONG cditem);

   PDRAGTRANSFER _System DrgAllocDragtransfer(ULONG cdxfer);

   HWND      _System DrgDrag(HWND hwndSource,
                              PDRAGINFO pdinfo,
                              PDRAGIMAGE pdimg,
                              ULONG cdimg,
                              long vkTerminate,
                              PVOID pRsvd);
#line 813
   BOOL      _System DrgDragFiles(HWND hwnd,
                                   PSZ *apszFiles,
                                   PSZ *apszTypes,
                                   PSZ *apszTargets,
                                   ULONG cFiles,
                                   HPOINTER hptrDrag,
                                   ULONG vkTerm,
                                   BOOL fSourceRender,
                                   ULONG ulRsvd);
#line 824
   BOOL      _System DrgPostTransferMsg(HWND hwnd,
                                         ULONG msg,
                                         PDRAGTRANSFER pdxfer,
                                         ULONG fl,
                                         ULONG ulRsvd,
                                         BOOL fRetry);

   BOOL      _System DrgQueryDragitem(PDRAGINFO pdinfo,
                                       ULONG cbBuffer,
                                       PDRAGITEM pditem,
                                       ULONG iItem);

   ULONG     _System DrgQueryDragitemCount(PDRAGINFO pdinfo);

   PDRAGITEM _System DrgQueryDragitemPtr(PDRAGINFO pdinfo,
                                          ULONG i);

   BOOL      _System DrgQueryNativeRMF(PDRAGITEM pditem,
                                        ULONG cbBuffer,
                                        PCHAR pBuffer);

   ULONG     _System DrgQueryNativeRMFLen(PDRAGITEM pditem);
#line 852
   ULONG     _System DrgQueryStrName(HSTR hstr,
                                      ULONG cbBuffer,
                                      PSZ pBuffer);
#line 857
   ULONG     _System DrgQueryStrNameLen(HSTR hstr);
#line 864
   BOOL      _System DrgQueryTrueType(PDRAGITEM pditem,
                                       ULONG cbBuffer,
                                       PSZ pBuffer);
#line 869
   ULONG     _System DrgQueryTrueTypeLen(PDRAGITEM pditem);

   MRESULT   _System DrgSendTransferMsg(HWND hwnd,
                                         ULONG msg,
                                         MPARAM mp1,
                                         MPARAM mp2);

   BOOL      _System DrgSetDragitem(PDRAGINFO pdinfo,
                                     PDRAGITEM pditem,
                                     ULONG cbBuffer,
                                     ULONG iItem);

   BOOL      _System DrgSetDragImage(PDRAGINFO pdinfo,
                                      PDRAGIMAGE pdimg,
                                      ULONG cdimg,
                                      PVOID pRsvd);
#line 892
   BOOL      _System DrgVerifyTypeSet(PDRAGITEM pditem,
                                       PSZ pszType,
                                       ULONG cbMatch,
                                       PSZ pszMatch);
#line 898
   BOOL      _System DrgAccessDraginfo(PDRAGINFO pdinfo);
#line 903
   HSTR      _System DrgAddStrHandle(PSZ psz);
#line 906
   BOOL      _System DrgDeleteDraginfoStrHandles(PDRAGINFO pdinfo);

   BOOL      _System DrgDeleteStrHandle(HSTR hstr);

   BOOL      _System DrgFreeDraginfo(PDRAGINFO pdinfo);

   BOOL      _System DrgFreeDragtransfer(PDRAGTRANSFER pdxfer);

   HPS       _System DrgGetPS(HWND hwnd);

   BOOL      _System DrgPushDraginfo(PDRAGINFO pdinfo,
                                      HWND hwndDest);

   BOOL      _System DrgReleasePS(HPS hps);

   BOOL      _System DrgSetDragPointer(PDRAGINFO pdinfo,
                                        HPOINTER hptr);
#line 928
   BOOL      _System DrgVerifyNativeRMF(PDRAGITEM pditem,
                                         PSZ pszRMF);
#line 937
   BOOL      _System DrgVerifyRMF(PDRAGITEM pditem,
                                   PSZ pszMech,
                                   PSZ pszFmt);
#line 946
   BOOL      _System DrgVerifyTrueType(PDRAGITEM pditem,
                                        PSZ pszType);
#line 954
   BOOL      _System DrgVerifyType(PDRAGITEM pditem,
                                    PSZ pszType);
#line 961
   BOOL _System DrgLazyDrag( HWND hwndSource,
                             PDRAGINFO pdinfo,
                             PDRAGIMAGE pdimg,
                             ULONG cdimg,
                             PVOID pRsvd );

   BOOL _System DrgCancelLazyDrag( void );

   BOOL _System DrgLazyDrop( HWND hwndTarget,
                             ULONG ulOperation,
                             PPOINTL pptlDrop );

   PDRAGINFO _System DrgQueryDraginfoPtr( PDRAGINFO pRsvd );

   PDRAGINFO _System DrgQueryDraginfoPtrFromHwnd( HWND hwndSource );

   PDRAGINFO _System DrgQueryDraginfoPtrFromDragitem( PDRAGITEM pditem );

   ULONG _System DrgQueryDragStatus(void);

   PDRAGINFO _System DrgReallocDraginfo (PDRAGINFO pdinfoOld,
                                          ULONG cditem);
#line 1085
   typedef struct _TREEITEMDESC      
   {
      HBITMAP       hbmExpanded;
      HBITMAP       hbmCollapsed;
      HPOINTER      hptrExpanded;
      HPOINTER      hptrCollapsed;
   } TREEITEMDESC;
   typedef TREEITEMDESC *PTREEITEMDESC;
#line 1097
   typedef struct _FIELDINFO       
   {
      ULONG      cb;                   
      ULONG      flData;               
      ULONG      flTitle;              
      PVOID      pTitleData;           

      ULONG      offStruct;            
      PVOID      pUserData;            
      struct _FIELDINFO *pNextFieldInfo;  

      ULONG      cxWidth;              
   } FIELDINFO;
   typedef FIELDINFO *PFIELDINFO;
#line 1115
   typedef struct _RECORDCORE      
   {
      ULONG       cb;
      ULONG       flRecordAttr;         
      POINTL      ptlIcon;              
      struct _RECORDCORE *preccNextRecord;    
      PSZ         pszIcon;              
      HPOINTER    hptrIcon;             
      HPOINTER    hptrMiniIcon;         
      HBITMAP     hbmBitmap;            
      HBITMAP     hbmMiniBitmap;        
      PTREEITEMDESC pTreeItemDesc;      
      PSZ         pszText;              
      PSZ         pszName;              
      PSZ         pszTree;              
   } RECORDCORE;
   typedef RECORDCORE *PRECORDCORE;
#line 1136
   typedef struct _MINIRECORDCORE      
   {
      ULONG       cb;
      ULONG       flRecordAttr;         
      POINTL      ptlIcon;              
      struct _MINIRECORDCORE *preccNextRecord;  
      PSZ         pszIcon;              
      HPOINTER    hptrIcon;             
   } MINIRECORDCORE;
   typedef MINIRECORDCORE *PMINIRECORDCORE;
#line 1150
   typedef struct _TREEMOVE           
   {
      PRECORDCORE preccMove;          
      PRECORDCORE preccNewParent;     
      PRECORDCORE pRecordOrder;       
      BOOL        flMoveSiblings;     

   } TREEMOVE;
   typedef TREEMOVE *PTREEMOVE;
#line 1163
   typedef struct _CNRINFO      
   {
      ULONG       cb;                   
      PVOID       pSortRecord;          

      PFIELDINFO  pFieldInfoLast;       

      PFIELDINFO  pFieldInfoObject;     
#line 1174
      PSZ         pszCnrTitle;          
#line 1177
      ULONG       flWindowAttr;         
      POINTL      ptlOrigin;            

      ULONG       cDelta;               
#line 1183
      ULONG       cRecords;             
      SIZEL       slBitmapOrIcon;       
      SIZEL       slTreeBitmapOrIcon;   
      HBITMAP     hbmExpanded;          
      HBITMAP     hbmCollapsed;         
      HPOINTER    hptrExpanded;         
      HPOINTER    hptrCollapsed;        
      long        cyLineSpacing;        
      long        cxTreeIndent;         
      long        cxTreeLine;           
      ULONG       cFields;              
      long        xVertSplitbar;        
#line 1197
   } CNRINFO;
   typedef CNRINFO *PCNRINFO;

   typedef struct _CDATE      
   {
      UCHAR   day;                          
      UCHAR   month;                        
      USHORT  year;                         
   } CDATE;
   typedef CDATE *PCDATE;

   typedef struct _CTIME      
   {
      UCHAR   hours;                        
      UCHAR   minutes;                      
      UCHAR   seconds;                      
      UCHAR   ucReserved;                   
   } CTIME;
   typedef CTIME *PCTIME;
#line 1335
   typedef struct _CNRDRAGINIT      
   {
      HWND        hwndCnr;                  
      PRECORDCORE pRecord;                  
      long        x;                        
      long        y;                        
      long        cx;                       
      long        cy;                       
   } CNRDRAGINIT;
   typedef CNRDRAGINIT *PCNRDRAGINIT;
#line 1351
   typedef struct _FIELDINFOINSERT      
   {
      ULONG       cb;                   
      PFIELDINFO  pFieldInfoOrder;      

      ULONG       fInvalidateFieldInfo; 
      ULONG       cFieldInfoInsert;     

   } FIELDINFOINSERT;
   typedef FIELDINFOINSERT *PFIELDINFOINSERT;
#line 1365
   typedef struct _RECORDINSERT      
   {
      ULONG       cb;
      PRECORDCORE pRecordOrder;
      PRECORDCORE pRecordParent;
      ULONG       fInvalidateRecord;
      ULONG       zOrder;
      ULONG       cRecordsInsert;
   } RECORDINSERT;
   typedef RECORDINSERT *PRECORDINSERT;
#line 1379
   typedef struct _QUERYRECFROMRECT      
   {
      ULONG   cb;
      RECTL   rect;
      ULONG   fsSearch;
   } QUERYRECFROMRECT;
   typedef QUERYRECFROMRECT *PQUERYRECFROMRECT;
#line 1390
   typedef struct _QUERYRECORDRECT      
   {
      ULONG        cb;
      PRECORDCORE  pRecord;
      ULONG        fRightSplitWindow;
      ULONG        fsExtent;
   } QUERYRECORDRECT;
   typedef QUERYRECORDRECT *PQUERYRECORDRECT;
#line 1402
   typedef struct _SEARCHSTRING      
   {
      ULONG  cb;
      PSZ    pszSearch;
      ULONG  fsPrefix;
      ULONG  fsCaseSensitive;
      ULONG  usView;
   } SEARCHSTRING;
   typedef SEARCHSTRING *PSEARCHSTRING;
#line 1416
      typedef struct _CNRDRAGINFO      
      {
         PDRAGINFO   pDragInfo;
         PRECORDCORE pRecord;
      } CNRDRAGINFO;
      typedef CNRDRAGINFO *PCNRDRAGINFO;
#line 1426
      typedef struct _CNRLAZYDRAGINFO      
      {
         PDRAGINFO pDragInfo;
         PRECORDCORE pRecord;
         HWND hwndTarget;
      } CNRLAZYDRAGINFO;
      typedef CNRLAZYDRAGINFO *PCNRLAZYDRAGINFO;
#line 1439
   typedef struct _NOTIFYRECORDEMPHASIS      
   {
      HWND        hwndCnr;
      PRECORDCORE pRecord;
      ULONG       fEmphasisMask;
   } NOTIFYRECORDEMPHASIS;
   typedef NOTIFYRECORDEMPHASIS *PNOTIFYRECORDEMPHASIS;
#line 1450
   typedef struct _NOTIFYRECORDENTER      
   {
      HWND        hwndCnr;
      ULONG       fKey;
      PRECORDCORE pRecord;
   } NOTIFYRECORDENTER;
   typedef NOTIFYRECORDENTER *PNOTIFYRECORDENTER;
#line 1461
   typedef struct _NOTIFYDELTA      
   {
      HWND        hwndCnr;
      ULONG       fDelta;
   } NOTIFYDELTA;
   typedef NOTIFYDELTA *PNOTIFYDELTA;
#line 1471
   typedef struct _NOTIFYSCROLL      
   {
      HWND        hwndCnr;
      long        lScrollInc;
      ULONG       fScroll;
   } NOTIFYSCROLL;
   typedef NOTIFYSCROLL *PNOTIFYSCROLL;
#line 1482
   typedef struct _CNREDITDATA      
   {
      ULONG        cb;
      HWND         hwndCnr;
      PRECORDCORE  pRecord;
      PFIELDINFO   pFieldInfo;
      PSZ *ppszText;                    
      ULONG        cbText;                      
      ULONG        id;
   } CNREDITDATA;
   typedef CNREDITDATA *PCNREDITDATA;
#line 1497
   typedef struct _OWNERBACKGROUND      
   {
      HWND    hwnd;
      HPS     hps;
      RECTL   rclBackground;
      long    idWindow;
   } OWNERBACKGROUND;
   typedef OWNERBACKGROUND *POWNERBACKGROUND;
#line 1509
   typedef struct _CNRDRAWITEMINFO      
   {
      PRECORDCORE  pRecord;
      PFIELDINFO   pFieldInfo;
   } CNRDRAWITEMINFO;
   typedef CNRDRAWITEMINFO *PCNRDRAWITEMINFO;
#line 1611
   typedef struct _SLDCDATA      
   {
      ULONG   cbSize;                 
      USHORT  usScale1Increments;     
      USHORT  usScale1Spacing;        
      USHORT  usScale2Increments;     
      USHORT  usScale2Spacing;        
   } SLDCDATA;
   typedef SLDCDATA *PSLDCDATA;
#line 1707
   typedef struct _CSBITMAPDATA    
   {
      HBITMAP hbmLeftUp;
      HBITMAP hbmLeftDown;
      HBITMAP hbmRightUp;
      HBITMAP hbmRightDown;
   } CSBITMAPDATA;
   typedef CSBITMAPDATA *PCSBITMAPDATA;
#line 1765
   typedef struct _VSCDATA      
   {
      ULONG   cbSize;                 
      USHORT  usRowCount;             
      USHORT  usColumnCount;          
   } VSCDATA;
   typedef VSCDATA *PVSCDATA;
#line 1776
   typedef struct _VSDRAGINIT      
   {
      HWND    hwnd;                   
      long    x;                      
      long    y;                      
      long    cx;                     
      long    cy;                     
      USHORT  usRow;                  
      USHORT  usColumn;               
   } VSDRAGINIT;
   typedef VSDRAGINIT *PVSDRAGINIT;
#line 1792
      typedef struct _VSDRAGINFO      
      {
         PDRAGINFO pDragInfo;          
         USHORT    usRow;              
         USHORT    usColumn;           
      } VSDRAGINFO;
      typedef VSDRAGINFO *PVSDRAGINFO;
#line 1804
   typedef struct _VSTEXT      
   {
      PSZ       pszItemText;       
      ULONG     ulBufLen;          
   } VSTEXT;
   typedef VSTEXT *PVSTEXT;
#line 2023
   typedef struct _BOOKPAGEINFO      
   {
      ULONG     cb;                          
      ULONG     fl;                          
      BOOL      bLoadDlg;                    

      ULONG     ulPageData;                  
      HWND      hwndPage;                    
      PFN       pfnPageDlgProc;              
      ULONG     idPageDlg;                   
      HMODULE   hmodPageDlg;                 
      PVOID     pPageDlgCreateParams;
      PDLGTEMPLATE pdlgtPage;
      ULONG     cbStatusLine;                
      PSZ       pszStatusLine;               
      HBITMAP   hbmMajorTab;                 
      HBITMAP   hbmMinorTab;                 
      ULONG     cbMajorTab;                  
      PSZ       pszMajorTab;                 
      ULONG     cbMinorTab;                  
      PSZ       pszMinorTab;                 
      PVOID     pBidiInfo;                   

   } BOOKPAGEINFO;
   typedef BOOKPAGEINFO *PBOOKPAGEINFO;
#line 2052
   typedef struct _BOOKTEXT      
   {
      PSZ    pString;                         
      ULONG  textLen;                         
   } BOOKTEXT;
   typedef BOOKTEXT *PBOOKTEXT;
#line 2062
   typedef struct _DELETENOTIFY      
   {
      HWND    hwndBook;                       
      HWND    hwndPage;                       
      ULONG   ulAppPageData;                  
      HBITMAP hbmTab;                         
   } DELETENOTIFY;
   typedef DELETENOTIFY *PDELETENOTIFY;
#line 2074
   typedef struct _PAGESELECTNOTIFY      
   {
      HWND    hwndBook;                       
      ULONG   ulPageIdCur;                    
      ULONG   ulPageIdNew;                    
   } PAGESELECTNOTIFY;
   typedef PAGESELECTNOTIFY *PPAGESELECTNOTIFY;
#line 2095
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 104 "F:\IBMCPP\INCLUDE\OS2\pm.h"
   #pragma info( none )

      #pragma info( restore )

   #pragma info( restore )
#line 51 "F:\IBMCPP\INCLUDE\OS2\os2.h"
#pragma info( none )

      #pragma info( restore )

#pragma info( restore )
#line 2 "F:\IBMCPP\INCLUDE\stdio.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 44
      typedef unsigned int size_t;
#line 47
   enum _OPERATIONS { _IOINIT, _IOREAD, _IOWRITE, _IOREPOSITION,
                      _IOFLUSH, _IOUNDEFOP };
#line 53
   #pragma pack( 1 )
   typedef struct __file        
      {
      unsigned char     *_bufPtr;
      unsigned long int  _count;
      unsigned long int  _userFlags;
      unsigned long int  _bufLen;
      unsigned long int  _ungetCount;
      int                _tempStore;
      unsigned char      _ungetBuf[2];
      enum _OPERATIONS   _lastOp;
      char               _filler;
      } FILE;
   #pragma pack( )
#line 82
   typedef struct __fpos_t       
      {
      long int __fpos_elem[2];
      } fpos_t;
#line 112
   typedef char *__va_list;
#line 121
   extern FILE * const  stdin;
   extern FILE * const  stdout;
   extern FILE * const  stderr;
#line 131
   int       _Optlink fprintf( FILE *, const char *, ... );
   int       _Optlink fscanf( FILE *, const char *, ... );
   int       _Optlink printf( const char *, ... );
   int       _Optlink scanf( const char *, ... );
   int       _Optlink sprintf( char *, const char *, ... );
   int       _Optlink sscanf( const char *, const char *, ... );
   void      _Optlink clearerr( FILE * );
   int       _Optlink fclose( FILE * );
   int       _Optlink feof( FILE * );
   int       _Optlink ferror( FILE * );
   int       _Optlink fflush( FILE * );
   int       _Optlink fgetc( FILE * );
   int       _Optlink fgetpos( FILE *, fpos_t * );
   char   *  _Optlink fgets( char *, int, FILE * );
   FILE   *  _Optlink fopen( const char *, const char * );
   int       _Optlink fputc( int, FILE * );
   int       _Optlink fputs( const char *, FILE * );
   size_t    _Optlink fread( void *, size_t, size_t, FILE * );
   FILE   *  _Optlink freopen( const char *, const char *, FILE * );
   int       _Optlink fseek( FILE *, long int, int );
   int       _Optlink fsetpos( FILE *, const fpos_t * );
   long int  _Optlink ftell( FILE * );
   size_t    _Optlink fwrite( const void *, size_t, size_t, FILE * );
   int              _Optlink getc( FILE * );
   int              _Optlink getchar( void );
   char   *  _Optlink gets( char * );
   void      _Optlink perror( const char * );
   int              _Optlink putc( int, FILE * );
   int              _Optlink putchar( int );
   int       _Optlink puts( const char * );
   int       _Optlink remove( const char * );
   int       _Optlink rename( const char *, const char * );
   void      _Optlink rewind( FILE * );
   void      _Optlink setbuf( FILE *, char * );
   int       _Optlink setvbuf( FILE *, char *, int, size_t );
   FILE   *  _Optlink tmpfile( void );
   char   *  _Optlink tmpnam( char * );
   int       _Optlink ungetc( int, FILE * );
   int       _Optlink vfprintf( FILE *, const char *, __va_list );
   int       _Optlink vprintf( const char *, __va_list );
   int       _Optlink vsprintf( char *, const char *, __va_list );
#line 224
       #pragma map( fprintf, "_fprintfieee" )
       #pragma map( printf , "_printfieee"  )
       #pragma map( sprintf, "_sprintfieee" )
       #pragma map( fscanf , "_fscanfieee"  )
       #pragma map( scanf  , "_scanfieee"   )
       #pragma map( sscanf , "_sscanfieee"  )
#line 232
      #pragma map( vfprintf, "_vfprintfieee" )
      #pragma map( vprintf , "_vprintfieee"  )
      #pragma map( vsprintf, "_vsprintfieee" )
#line 250
      int _Optlink _fcloseall( void );
      int _Optlink _rmtmp( void );
#line 254
      FILE * _Optlink fdopen( int, const char *);
      int    _Optlink fgetchar( void );
      int    _Optlink fileno( FILE * );
      int    _Optlink flushall( void );
      int    _Optlink fputchar( int );
      char * _Optlink tempnam( char *, char * );
      int    _Optlink unlink( const char * );

      FILE * _Optlink _fdopen( int, const char *);
      int    _Optlink _fgetchar( void );
      int    _Optlink _fileno( FILE * );
      int    _Optlink _flushall( void );
      int    _Optlink _fputchar( int );
      char * _Optlink _tempnam( char *, char * );
      int    _Optlink _unlink( const char * );

      int    _Optlink _set_crt_msg_handle( int );
#line 273
      #pragma map( fdopen  , "_fdopen"   )
      #pragma map( fgetchar, "_fgetchar" )
      #pragma map( fileno  , "_fileno"   )
      #pragma map( flushall, "_flushall" )
      #pragma map( fputchar, "_fputchar" )
      #pragma map( tempnam , "_tempnam"  )
#line 281
         #pragma map( unlink  , "_unlink"   )
#line 327
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 2 "F:\IBMCPP\INCLUDE\stdlib.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 49
     typedef unsigned short wchar_t;
#line 52
   typedef struct _div_t
       {
       int quot;         
       int rem;          
       } div_t;

   typedef struct _ldiv_t
       {
       long int quot;    
       long int rem;     
       } ldiv_t;
#line 76
   extern int  _mb_cur_max;
#line 82
   int      _Builtin __abs( int );
   long int _Builtin __labs( long int );
#line 86
   double    _Optlink atof( const char * );
   int       _Optlink atoi( const char * );
   long int  _Optlink atol( const char * );
   double    _Optlink strtod( const char *, char ** );
   long int  _Optlink strtol( const char *, char **, int );
   unsigned long int  _Optlink strtoul( const char *, char **, int );
   int       _Optlink rand( void );
   void      _Optlink srand( unsigned int );
   void *   ( _Optlink calloc)( size_t, size_t );
   void     ( _Optlink free)( void * );
   void *   ( _Optlink malloc)( size_t );
   void *   ( _Optlink realloc)( void *, size_t );
   void      _Optlink abort( void );
   int       _Optlink atexit( void ( * )( void ) );
   void      _Optlink exit( int );
   char *    _Optlink getenv( const char * );
   int       _Optlink system( const char * );
   void *    _Optlink bsearch( const void *, const void *, size_t, size_t,
                              int ( * _Optlink __compare )( const void *, const void * ) );
   void      _Optlink qsort( void *, size_t, size_t,
                            int ( * _Optlink __compare )( const void *, const void * ) );
   div_t     _Optlink div( int, int );
   ldiv_t    _Optlink ldiv( long int, long int );
   int       _Optlink mblen( const char *, size_t );
   int       _Optlink mbtowc( wchar_t *, const char *, size_t );
   int       _Optlink wctomb( char *, wchar_t );
   size_t    _Optlink mbstowcs( wchar_t *, const char *, size_t );
   size_t    _Optlink wcstombs( char *, const wchar_t *, size_t );
#line 120
      int       _Optlink abs ( int );
      long int  _Optlink labs( long int );

      #pragma info( none )
#line 126
      #pragma info( restore )
#line 139
         void * _Builtin __alloca( size_t );
         #pragma info( none )
#line 143
         #pragma info( restore )
#line 146
      unsigned char _Builtin __parmdwords( void );
#line 149
      long double  _Optlink _atold( const char * );
      char *  _Optlink  ecvt( double, int, int *, int * );
      char *  _Optlink _ecvt( double, int, int *, int * );
      char *  _Optlink  fcvt( double, int, int *, int * );
      char *  _Optlink _fcvt( double, int, int *, int * );
      int     _Optlink _freemod( unsigned long );
      char *  _Optlink _fullpath(char *, char *, size_t);
      char *  _Optlink  gcvt( double, int, char * );
      char *  _Optlink _gcvt( double, int, char * );
      int    ( _Optlink _heapmin)( void );
      char *  _Optlink  itoa( int, char *, int );
      char *  _Optlink _itoa( int, char *, int );
      int     _Optlink _loadmod( char *, unsigned long * );
      char *  _Optlink  ltoa( long, char *, int );
      char *  _Optlink _ltoa( long, char *, int );
      size_t  _Optlink _msize(void *);
      int     _Optlink  putenv( const char * );
      int     _Optlink _putenv( const char * );
      long double  _Optlink  strtold( const char *, char ** );
      long double  _Optlink _strtold( const char *, char ** );
      char *  _Optlink  ultoa( unsigned long, char *, int );
      char *  _Optlink _ultoa( unsigned long, char *, int );
#line 173
      #pragma map( ecvt    , "_ecvt"    )
      #pragma map( fcvt    , "_fcvt"    )
      #pragma map( gcvt    , "_gcvt"    )
      #pragma map( itoa    , "_itoa"    )
      #pragma map( ltoa    , "_ltoa"    )
      #pragma map( ultoa   , "_ultoa"   )
      #pragma map( putenv  , "_putenv"  )
      #pragma map( _strtold, "strtold"  )
#line 290
      #pragma map( atof  , "_atofieee"   )
      #pragma map( strtod, "_strtodieee" )
#line 300
         void  _Builtin __enable( void );
         void  _Builtin __disable( void );
#line 318
               extern int  errno;

               #pragma info( none )
#line 324
               #pragma info( restore )
#line 340
               extern int  _doserrno;

               #pragma info( none )
#line 346
               #pragma info( restore )
#line 351
         extern char **  _environ;
         extern unsigned char  _osmajor;
         extern unsigned char  _osminor;
         extern unsigned char  _osmode;
#line 361
         typedef int ( __onexit_t )( void );
         typedef __onexit_t * onexit_t;
#line 373
         void            _Optlink _exit( int );
         onexit_t        _Optlink  onexit( onexit_t );
         onexit_t        _Optlink _onexit( onexit_t );
#line 378
         unsigned long  _Builtin  __lrotl(unsigned long, int);
         unsigned long  _Builtin  __lrotr(unsigned long, int);
         unsigned short _Builtin  __srotl(unsigned short, int);
         unsigned short _Builtin  __srotr(unsigned short, int);
         unsigned char  _Builtin  __crotl(unsigned char, int);
         unsigned char  _Builtin  __crotr(unsigned char, int);
#line 403
         void            _Optlink _makepath( char *, char *, char *, char *, char * );
         void            _Optlink _splitpath( char *, char *, char *, char *, char * );
         void            _Optlink _searchenv( char *, char *, char *);
         void            _Optlink  swab( char *, char *, int );
         void            _Optlink _swab( char *, char *, int );
#line 410
         #pragma map( onexit , "_onexit"  )
         #pragma map( swab   , "_swab"    )
#line 417
         int            _Optlink rpmatch(const char *);
         int            _Optlink csid(const char *);
         int            _Optlink wcsid(const wchar_t);
#line 422
         #pragma map( rpmatch, "_rpmatch" )
         #pragma map( csid   , "_csid"    )
         #pragma map( wcsid  , "_wcsid"   )
#line 457
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 2 "F:\IBMCPP\INCLUDE\math.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 42
   extern const double _infinity;
#line 47
   double  _Optlink atan2( double, double );
   double  _Optlink ceil( double );
   double  _Optlink cosh( double );
   double  _Optlink exp( double );
   double  _Optlink floor( double );
   double  _Optlink fmod( double, double );
   double  _Optlink frexp( double, int * );
   double  _Optlink ldexp( double, int );
   double  _Optlink log( double );
   double  _Optlink log10( double );
   double  _Optlink modf( double, double * );
   double  _Optlink pow( double, double );
   double  _Optlink sinh( double );
   double  _Optlink tanh( double );
#line 94
      double  _Optlink fabs( double );
      double  _Optlink asin( double );
      double  _Optlink acos( double );
      double  _Optlink atan( double );
      double  _Optlink sin( double );
      double  _Optlink cos( double );
      double  _Optlink tan( double );
      double  _Optlink sqrt( double );
#line 106
      double  _Optlink _erf( double );
      double  _Optlink _erfc( double );
      double  _Optlink _gamma( double );
      double  _Optlink _hypot( double, double );
      double  _Optlink _j0( double );
      double  _Optlink _j1( double );
      double  _Optlink _jn( int, double );
      double  _Optlink _y0( double );
      double  _Optlink _y1( double );
      double  _Optlink _yn( int, double );
      double  _Optlink erf( double );
      double  _Optlink erfc( double );
      double  _Optlink gamma( double );
      double  _Optlink hypot( double, double );
      double  _Optlink j0( double );
      double  _Optlink j1( double );
      double  _Optlink jn( int, double );
      double  _Optlink y0( double );
      double  _Optlink y1( double );
      double  _Optlink yn( int, double );
#line 128
      #pragma map( erf, "_erf" )
      #pragma map( erfc, "_erfc" )
      #pragma map( gamma, "_gamma" )
      #pragma map( hypot, "_hypot" )
      #pragma map( j0, "_j0" )
      #pragma map( j1, "_j1" )
      #pragma map( jn, "_jn" )
      #pragma map( y0, "_y0" )
      #pragma map( y1, "_y1" )
      #pragma map( yn, "_yn" )
#line 152
         extern const long double _LHUGE_VAL;
#line 170
           struct complex
               {
               double x,y;              
               };

           double       _Optlink _cabs( struct complex );
#line 178
          #pragma info( none )
#line 181
          #pragma info( restore )

         struct exception
            {
            int type;                
            char *name;              
            double arg1;             
            double arg2;             
            double retval;           
            };
#line 194
         int _matherr( struct exception * );
         int  matherr( struct exception * );

         #pragma map( matherr, "_matherr" )

         long double _Optlink _atold( const char * );
#line 212
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 2 "F:\IBMCPP\INCLUDE\string.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 56
   char * _Builtin __strcat( char *, const char * );
   char * _Builtin __strchr( const char *, int );
   int    _Builtin __strcmp( const char *, const char * );
   char * _Builtin __strcpy( char*, const char * );
   size_t _Builtin __strlen( const char * );
   char * _Builtin __strncat( char *, const char *, size_t );
   int    _Builtin __strncmp( const char *, const char *, size_t );
   char * _Builtin __strncpy( char *, const char *, size_t );
   char * _Builtin __strrchr( const char *, int );
#line 67
   int     _Optlink strcoll( const char *, const char * );
   size_t  _Optlink strcspn( const char *, const char * );
   char *  _Optlink strerror( int );
   char *  _Optlink strpbrk( const char *, const char * );
   size_t  _Optlink strspn( const char *, const char * );
   char *  _Optlink strstr( const char *, const char * );
   char *  _Optlink strtok( char*, const char * );
   size_t  _Optlink strxfrm( char *, const char *, size_t );
#line 97
      char *  _Optlink strcat( char *, const char * );
      char *  _Optlink strchr( const char *, int );
      int     _Optlink strcmp( const char *, const char * );
      char *  _Optlink strcpy( char *, const char * );
      size_t  _Optlink strlen( const char * );
      char *  _Optlink strncat( char *, const char *, size_t );
      int     _Optlink strncmp( const char *, const char *, size_t );
      char *  _Optlink strncpy( char *, const char *, size_t );
      char *  _Optlink strrchr( const char *, int );

      #pragma info( none )
#line 117
      #pragma info( restore )
#line 137
      void * _Builtin __memcpy( void *, const void *, size_t );
      void * _Builtin __memchr( const void *, int, size_t );
      int    _Builtin __memcmp( const void *, const void *, size_t );
      void * _Builtin __memset( void *, int, size_t );
      void * _Builtin __memmove( void *, const void *, size_t );
#line 157
         void *  _Optlink memcpy( void *, const void *, size_t );
         void *  _Optlink memchr( const void *, int, size_t );
         int     _Optlink memcmp( const void *, const void *, size_t );
         void *  _Optlink memset( void *, int, size_t );
         void *  _Optlink memmove( void *, const void *, size_t );

         #pragma info( none )
#line 169
         #pragma info( restore )
#line 183
         void *  _Optlink memccpy( void *, void *, int, unsigned int );
         int     _Optlink memicmp( void *, void *, unsigned int );
#line 199
      char *  _Optlink strdup( const char * );
      int     _Optlink stricmp( const char *, const char * );
      char *  _Optlink strlwr( char * );
      int     _Optlink strnicmp( const char *, const char *, size_t );
      char *  _Optlink strupr( char * );

      int     _Optlink strcmpi( const char *, const char * );
      char *  _Optlink strrev( char * );
      char *  _Optlink strset( char *, int );
      char *  _Optlink strnset( char *, int, size_t );
      char *  _Optlink _strerror( char * );
#line 222
      size_t  _Optlink _fstrcspn( const char *, const char * );
      char *  _Optlink _fstrdup( const char * );
      char *  _Optlink _nstrdup( const char * );
      int     _Optlink _fstricmp( const char *, const char * );
      char *  _Optlink _fstrlwr( char * );
      int     _Optlink _fstrnicmp( const char *, const char *, size_t );
      char *  _Optlink _fstrnset( char *, int, size_t );
      char *  _Optlink _fstrpbrk( const char *, const char * );
      char *  _Optlink _fstrrev( char * );
      char *  _Optlink _fstrset( char *, int );
      size_t  _Optlink _fstrspn( const char *, const char * );
      char *  _Optlink _fstrstr( const char *, const char * );
      char *  _Optlink _fstrtok( char*, const char * );
      char *  _Optlink _fstrupr( char * );
#line 238
      #pragma map( _fstrcspn , "strcspn"  )
      #pragma map( _fstrdup  , "strdup"   )
      #pragma map( _nstrdup  , "strdup"   )
      #pragma map( _fstricmp , "stricmp"  )
      #pragma map( _fstrlwr  , "strlwr"   )
      #pragma map( _fstrnicmp, "strnicmp" )
      #pragma map( _fstrnset , "strnset"  )
      #pragma map( _fstrpbrk , "strpbrk"  )
      #pragma map( _fstrrev  , "strrev"   )
      #pragma map( _fstrset  , "strset"   )
      #pragma map( _fstrspn  , "strspn"   )
      #pragma map( _fstrstr  , "strstr"   )
      #pragma map( _fstrtok  , "strtok"   )
      #pragma map( _fstrupr  , "strupr"   )
#line 278
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 2 "F:\IBMCPP\INCLUDE\time.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 57
   typedef unsigned long clock_t;
#line 61
      typedef long time_t;
#line 66
      struct tm
         {
         int tm_sec;       
         int tm_min;       
         int tm_hour;      
         int tm_mday;      
         int tm_mon;       
         int tm_year;      
         int tm_wday;      
         int tm_yday;      
         int tm_isdst;     
      };
#line 80
   clock_t      _Optlink clock( void );
   double       _Optlink difftime( time_t, time_t );
   time_t       _Optlink mktime( struct tm * );
   time_t       _Optlink time( time_t * );
   char *       _Optlink asctime( const struct tm * );
   char *       _Optlink ctime( const time_t * );
   struct tm *  _Optlink gmtime( const time_t * );
   struct tm *  _Optlink localtime( const time_t * );
   size_t       _Optlink strftime( char *, size_t, const char *, const struct tm * );
   void         _Optlink _tzset( void );
   char *       _Optlink _strdate( char * );
   char *       _Optlink _strtime( char * );
#line 94
     char *     _Optlink strptime(const char *, const char *, struct tm *);
#line 97
   extern int   _daylight;  
   extern long  _timezone;  
   extern char *  _tzname[2];  
#line 102
  #pragma info( none )
#line 107
  #pragma info( restore )
#line 135
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 1 "F:\IBMCPP\INCLUDE\sys\types.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 39
            typedef unsigned short ino_t;
#line 49
            typedef short dev_t;
#line 54
            typedef long off_t;
#line 70
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 1 "F:\IBMCPP\INCLUDE\sys\timeb.h"
#pragma info( none )

   #pragma info( none )

#pragma info( restore )
#line 39
      #pragma pack( 2 )
      struct timeb
         {
         time_t time;
         unsigned short millitm;
         short timezone;
         short dstflag;
         };
      #pragma pack( )

      void _Optlink _ftime( struct timeb * );
#line 61
#pragma info( none )

   #pragma info( restore )

#pragma info( restore )
#line 2 "mastermind.h"
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
#line 20
MRESULT _System Fensterhauptfunktion(HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
void ControlProg(HWND hwnd,ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT _System ProdInfoDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT _System HighscoreDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
MRESULT _System QueryNameDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2);
void InitHelp(HWND hwnd);
void DestroyHelpInstance(void);
#line 29
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
#line 41
void CreateColors(void);
int CheckColors(HPS hps, HWND hwnd);
void Loose(HWND hwnd);
void Win(HWND hwnd);
Hscr* Eintragen(Hscr* NextPos, Hscr* PrevPos, Hscr* Anchor, int Pos, HWND hwnd);
#line 48
void init(void);
FIXED MakeFixed(int a, int b);
Hscr* ReadHighscore(void);
void FreeHighscore(Hscr* Highscore);
void WriteHighscore(Hscr* Highscore);
void ReadSettings(void);
void WriteSettings(void);
void error(char *text, int close);
#line 17 "main.c"
HAB  hab;                   
int screenx=0,screeny=0;    
int iActualRow;             
int MasterColors[4];        
int guessed;                
int NumTries;               
int GuessedColors[40];      
int Pins[40];               
HWND hwndButton=0L;         
HWND hwndHelpInstance=0L;   
HPOINTER hptrRed, hptrGreen, hptrBlue, hptrYellow, hptrCyan, hptrPink;  
HPOINTER hptrDefault;       
int iDragColor;             
int Playing=0;          
int Paused=0;           
int dragging;               
long seconds;               
int circle=0;               
int Multiple=1;          
int AboutAtStart=1;      
int HelpEnabled=0;      
HMODULE hmodDLL=( (LHANDLE) 0); 
#line 43
void main(void)
#line 50
{
   HWND hwndRahmen=0L;          
   HWND hwndAnwendung=0L;       
   HWND hwndAbout=0L;           
   HWND hwndMenu=0L;            
   HMQ  hmq;
   QMSG qmsg;
   ULONG fensterstil;
   ULONG idTimer;
   char ressourceText[150];
#line 62
   init();
   ReadSettings();
#line 66
   hab = WinInitialize(0);
   hmq = WinCreateMsgQueue(hab,0);
#line 70
   hwndAbout = WinLoadDlg( (HWND)1,     
                       (HWND)1,     
                       (PFNWP)ProdInfoDlgProc,    
                       (HMODULE)0,       
                       20,        
                       ((void *)0));            
   WinSetWindowPos(hwndAbout, (HWND)3,
                    (WinQuerySysValue((HWND)1, 20)-390)/2,
                    (WinQuerySysValue((HWND)1, 21)-330)/2,
                    366, 330,
                    0x0001 | 0x0002 | 0x0080 | 0x0008);
   idTimer = WinStartTimer(hab, hwndAbout, 43, 7500);
   WinProcessDlg(hwndAbout);
   WinDestroyWindow(hwndAbout);
   WinStopTimer(hab, hwndAbout, idTimer);
   AboutAtStart = 0;
#line 88
   WinRegisterClass( hab,(PSZ)"Fenster",(PFNWP)Fensterhauptfunktion,
                     0x00000004L, 0 );

   fensterstil = 0x00000001L      | 0x00000002L | 0x00000030L | 0x00000004L |
                 0x00000400L | 0x00000008L | 0x00000800L | 0x00004000L;

   if (!WinLoadString(hab, hmodDLL, 501, sizeof(ressourceText), ressourceText))
      error("Could not load title text. Program will end.", 1);

   hwndRahmen = WinCreateStdWindow(
                  (HWND)1,
                 0L,
                 &fensterstil,
                 "Fenster",
                 ressourceText,
                 0,
                 (HMODULE)0L,
                 1,
                 &hwndAnwendung );
#line 109
   WinSetWindowPos(hwndRahmen, (HWND)3,
                    (WinQuerySysValue((HWND)1, 20)-500)/2,
                    (WinQuerySysValue((HWND)1, 21)-600)/2,
                    500, 600,
                    0x0001 | 0x0002 | 0x0080 | 0x0008);

   if (!WinLoadString(hab, hmodDLL, 501, sizeof(ressourceText), ressourceText))
      error("Could not load text for button. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);

   hwndButton = WinCreateWindow(hwndAnwendung,
                                ((PSZ)0xffff0003L),
                                ressourceText,
                                0x80000000L |
                                0L | 0x0400L,
                                284, 25,
                                150, 36,
                                hwndAnwendung,
                                (HWND)3,
                                300,
                                ((void *)0),
                                ((void *)0));
#line 132
   hwndMenu = WinWindowFromID(hwndRahmen, 0x8005);
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x2000)) | ((ULONG)((USHORT)((USHORT)(Multiple) ? 0x2000 : 0))) << 16))))));

   idTimer = WinStartTimer(hab, hwndAnwendung, 42, 1000);
   if (idTimer == 0)
      {
      if (!WinLoadString(hab, hmodDLL, 502, sizeof(ressourceText), ressourceText))
         error("Could not load errormessage. Program will end.", 1);
      error(ressourceText, 1);
      }

   InitHelp(hwndAnwendung);

   while(WinGetMsg(hab,&qmsg,0L,0,0)) WinDispatchMsg(hab, &qmsg);

   DestroyHelpInstance();
   WinDestroyWindow(hwndRahmen);
   WinDestroyMsgQueue(hmq);
   WinTerminate(hab);

   exit;
}
#line 156
MRESULT _System Fensterhauptfunktion(HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
#line 160
{
   RECTL rcl;
   HPS   hps;
   int   i,j;
   long  lHits, lHRound, lVRound, lControl;
   POINTL ptlStart, ptlEdge;
   POINTL ptlDrawPosition;
   char  cNumber[4];
   POINTS ptsPointerPos;
   DRAGIMAGE dimg;
   PDRAGINFO pDinfo;
   PDRAGITEM pDitem;
   DRAGITEM ditem;
   RECTL rect;
   ULONG rc;
   ARCPARAMS arcp={1,1,0,0};
   char ressourceText[70];
   char title[30];

  switch(msg)
  {
    case 0x0023  : hps = WinBeginPaint(hwnd,
                           ( (LHANDLE) 0),
                           &rcl);

                     WinFillRect(hps, &rcl, 15L);
#line 189
                     Draw3DBox(hps, 50, 90, 168, 320, 8L, 0);

                     Draw3DBox(hps, 50, 25, 168, 36, 8L, 0);

                     Draw3DBox(hps, 50, 440, 168, 36, 8L, 0);

                     if (Playing == 1)
                        for (i=0; i<=5; i++)
                            DrawBitmap(hps, 50+i, 16L, 19L, 57+i*27, 35);
                     else
                        {
                        ptlDrawPosition.x = 57;
                        ptlDrawPosition.y = 40;
                        GpiSetCurrentPosition(hps, &ptlDrawPosition);
                        if (!WinLoadString(hab, hmodDLL, 502, sizeof(ressourceText), ressourceText))
                           error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                        GpiCharString(hps, 17, ressourceText);
                        }

                     if (Paused == 0) {
                        DrawActualMarks(hps, 1);
                        DrawFutureMarks(hps);
                     }

                     DrawRowNumbers(hps);

                     ptlDrawPosition.x = 50;
                     ptlDrawPosition.y = 485;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLL, 504, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     GpiCharString(hps, 16, ressourceText);
                     ptlDrawPosition.y = 70;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLL, 505, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     GpiCharString(hps, 17, ressourceText);
                     ptlDrawPosition.y = 419;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLL, 506, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     GpiCharString(hps, 22, ressourceText);
                     ptlDrawPosition.x = 230;
                     ptlDrawPosition.y = 485;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLL, 507, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     GpiCharString(hps, 15, ressourceText);
                     ptlDrawPosition.x = 350;
                     ptlDrawPosition.y = 485;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     GpiCharString(hps, 15, ressourceText);
                     ptlDrawPosition.y = 467;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLL, 509, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     GpiCharString(hps, 12, ressourceText);
                     ptlDrawPosition.x = 230;
                     ptlDrawPosition.y = 467;
                     GpiSetCurrentPosition(hps, &ptlDrawPosition);
                     if (!WinLoadString(hab, hmodDLL, 508, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     GpiCharString(hps, 12, ressourceText);
#line 254
                     if (guessed==1)
                        DrawMasterColors(hps);
#line 259
                     if (Paused == 0)
                        {
                        DrawGuessedColors(hps);
                        DrawPins(hps);
                        }

                     else
                        {
                        GpiSetColor(hps, 9L);
                        ptlDrawPosition.x = 87;
                        ptlDrawPosition.y = 250;
                        GpiSetCurrentPosition(hps, &ptlDrawPosition);
                        if (!WinLoadString(hab, hmodDLL, 510, sizeof(ressourceText), ressourceText))
                           error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                        GpiCharString(hps, 11, ressourceText);
                        }
#line 277
                     DrawTime(hps);

                     WinEndPaint(hps);
                     return (0);
                     break;

    case 0x0001:

                     WinSetPresParam(hwnd, 15L, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");

                     hptrRed = WinLoadPointer((HWND)1, 0L, 70);
                     hptrBlue = WinLoadPointer((HWND)1, 0L, 72);
                     hptrGreen = WinLoadPointer((HWND)1, 0L, 71);
                     hptrYellow = WinLoadPointer((HWND)1, 0L, 73);
                     hptrCyan = WinLoadPointer((HWND)1, 0L, 74);
                     hptrPink = WinLoadPointer((HWND)1, 0L, 75);
                     break;
    case 0x0002:

                     WinDestroyPointer(hptrRed);
                     WinDestroyPointer(hptrBlue);
                     WinDestroyPointer(hptrGreen);
                     WinDestroyPointer(hptrYellow);
                     WinDestroyPointer(hptrCyan);
                     WinDestroyPointer(hptrPink);
                     break;
    case 0x0070:

                     if (dragging == 1)
                        {

                        ptsPointerPos.x = ((USHORT)(ULONG)(mp1));
                        ptsPointerPos.y = ((USHORT)((ULONG)mp1 >> 16));

                        if ((ptsPointerPos.y >= 90+17+(iActualRow*30)) && (ptsPointerPos.y <= 90+17+16+(iActualRow*30)))
                           {
                           if ((ptsPointerPos.x >= 68) && (ptsPointerPos.x <= 87)) {
                              if (circle != 1)
                                 {
                                 circle = 1;
                                 hps = WinGetPS(hwnd);
                                 ptlDrawPosition.x = 50 + 18 + 9;
                                 ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                 GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                 GpiSetMix(hps, 12L);
                                 GpiFullArc(hps, 2L, MakeFixed(8,0));
                                 WinReleasePS(hps);
                                 }  
                              }  
                           else
                              if ((ptsPointerPos.x >= 114) && (ptsPointerPos.x <= 133)) {
                                 if (circle != 2)
                                    {
                                    circle = 2;
                                    hps = WinGetPS(hwnd);
                                    ptlDrawPosition.x = 50 + 18 + 9 + 37;
                                    ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                    GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                    GpiSetMix(hps, 12L);
                                    GpiFullArc(hps, 2L, MakeFixed(8,0));
                                    WinReleasePS(hps);
                                    }  
                                 }  
                              else
                                 if ((ptsPointerPos.x >= 151) && (ptsPointerPos.x <= 170)) {
                                    if (circle != 3)
                                       {
                                       circle = 3;
                                       hps = WinGetPS(hwnd);
                                       ptlDrawPosition.x = 50 + 18 + 9 + 2*37;
                                       ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                       GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                       GpiSetMix(hps, 12L);
                                       GpiFullArc(hps, 2L, MakeFixed(8,0));
                                       WinReleasePS(hps);
                                       }
                                    }
                                 else
                                    if ((ptsPointerPos.x >= 188) && (ptsPointerPos.x <= 207)) {
                                       if (circle != 4)
                                          {
                                          circle = 4;
                                          hps = WinGetPS(hwnd);
                                          ptlDrawPosition.x = 50 + 18 + 9 + 3*37;
                                          ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                          GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                          GpiSetMix(hps, 12L);
                                          GpiFullArc(hps, 2L, MakeFixed(8,0));
                                          WinReleasePS(hps);
                                          }
                                       }
                                    else
                                       if (circle != 0)
                                          {
                                          hps = WinGetPS(hwnd);
                                          ptlDrawPosition.x = 50 + 18 + 9 + (circle-1)*37;
                                          ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                                          GpiSetCurrentPosition(hps, &ptlDrawPosition);
                                          GpiSetMix(hps, 12L);
                                          GpiFullArc(hps, 2L, MakeFixed(8,0));
                                          WinReleasePS(hps);
                                          circle = 0;
                                          }
                           }
                        else
                           if (circle != 0)
                              {
                              hps = WinGetPS(hwnd);
                              ptlDrawPosition.x = 50 + 18 + 9 + (circle-1)*37;
                              ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                              GpiSetCurrentPosition(hps, &ptlDrawPosition);
                              GpiSetMix(hps, 12L);
                              GpiFullArc(hps, 2L, MakeFixed(8,0));
                              WinReleasePS(hps);
                              circle = 0;
                              }

                        switch (iDragColor)
                           {
                           case 50: WinSetPointer((HWND)1, hptrRed);
                              return 0;
                              break;
                           case 51: WinSetPointer((HWND)1, hptrGreen);
                              return 0;
                              break;
                           case 52: WinSetPointer((HWND)1, hptrBlue);
                              return 0;
                              break;
                           case 53: WinSetPointer((HWND)1, hptrYellow);
                              return 0;
                              break;
                           case 54: WinSetPointer((HWND)1, hptrCyan);
                              return 0;
                              break;
                           case 55: WinSetPointer((HWND)1, hptrPink);
                              return 0;
                              break;
                           default:
                              break;
                           }
                        }
                     break;
    case 0x0421:

                     dragging = 0;

                     WinSetPointer((HWND)1, hptrDefault);

                     ptsPointerPos.x = ((USHORT)(ULONG)(mp1));
                     ptsPointerPos.y = ((USHORT)((ULONG)mp1 >> 16));

                     if (circle != 0) {
                        hps = WinGetPS(hwnd);
                        ptlDrawPosition.x = 50 + 18 + 9 + (circle-1)*37;
                        ptlDrawPosition.y = 90 + 17 + 8 + iActualRow*30;
                        GpiSetCurrentPosition(hps, &ptlDrawPosition);
                        GpiSetMix(hps, 12L);
                        GpiFullArc(hps, 2L, MakeFixed(8,0));
                        WinReleasePS(hps);
                        circle = 0;
                        }
#line 440
                     if ((ptsPointerPos.y >= 90+17+(iActualRow*30)) && (ptsPointerPos.y <= 90+17+16+(iActualRow*30)))
                        if ((ptsPointerPos.x >= 68) && (ptsPointerPos.x <= 87))
                           {
                           if (NumTries <= 4*iActualRow)
                              NumTries = 4*iActualRow;
                           GuessedColors[4*iActualRow]=iDragColor;
                           hps = WinGetPS(hwnd);
                           DrawColors(hps, iDragColor, 0, iActualRow);
                           WinReleasePS(hps);
                           }
                        else
                           if ((ptsPointerPos.x >= 114) && (ptsPointerPos.x <= 133))
                              {
                              if (NumTries <= (4*iActualRow)+1)
                                 NumTries = (4*iActualRow)+1;
                              GuessedColors[(4*iActualRow)+1]=iDragColor;
                              hps = WinGetPS(hwnd);
                              DrawColors(hps, iDragColor, 1, iActualRow);
                              WinReleasePS(hps);
                              }
                           else
                              if ((ptsPointerPos.x >= 151) && (ptsPointerPos.x <= 170))
                                 {
                                 if (NumTries <= (4*iActualRow)+2)
                                    NumTries = (4*iActualRow)+2;
                                 GuessedColors[(4*iActualRow)+2]=iDragColor;
                                 hps = WinGetPS(hwnd);
                                 DrawColors(hps, iDragColor, 2, iActualRow);
                                 WinReleasePS(hps);
                                 }
                              else
                                 if ((ptsPointerPos.x >= 188) && (ptsPointerPos.x <= 207))
                                    {
                                    if (NumTries <= (4*iActualRow)+3)
                                       NumTries = (4*iActualRow)+3;
                                    GuessedColors[(4*iActualRow)+3]=iDragColor;
                                    hps = WinGetPS(hwnd);
                                    DrawColors(hps, iDragColor, 3, iActualRow);
                                    WinReleasePS(hps);
                                    }

                     iDragColor = 0;

                     if ((GuessedColors[4*iActualRow] != 0) && (GuessedColors[(4*iActualRow)+1] != 0) && (GuessedColors[(4*iActualRow)+2] != 0) && (GuessedColors[(4*iActualRow)+3] != 0)) {
                        rc = WinEnableWindow(hwndButton, 1);
                        if (rc != 1) {
                           error("Could not enable button!", 0);
                           }
                        }
                     break;
    case 0x0420:
                  if ((Playing == 1) && (Paused == 0))
                     {

                     if (dragging == 0)
                        {
                        ptsPointerPos.x = ((USHORT)(ULONG)(mp1));
                        ptsPointerPos.y = ((USHORT)((ULONG)mp1 >> 16));
                        iDragColor = 0;

                        if ((ptsPointerPos.y >= 35) && (ptsPointerPos.y <= 51))

                           if ((ptsPointerPos.x >= 57) && (ptsPointerPos.x <= 78))
                              {
                              dragging = 1;
                              iDragColor = 50;
                              }
                              else
                                 if ((ptsPointerPos.x >= 84) && (ptsPointerPos.x <= 103))
                                    {
                                    dragging = 1;
                                    iDragColor = 51;
                                    }
                                    else
                                       if ((ptsPointerPos.x >= 111) && (ptsPointerPos.x <= 130))
                                          {
                                          dragging = 1;
                                          iDragColor = 52;
                                          }
                                          else
                                             if ((ptsPointerPos.x >= 138) && (ptsPointerPos.x <= 157))
                                                {
                                                dragging = 1;
                                                iDragColor = 53;
                                                }
                                                else
                                                   if ((ptsPointerPos.x >= 165) && (ptsPointerPos.x <= 184))
                                                      {
                                                      dragging = 1;
                                                      iDragColor = 54;
                                                      }
                                                      else
                                                         if ((ptsPointerPos.x >= 192) && (ptsPointerPos.x <= 211))
                                                            {
                                                            dragging = 1;
                                                            iDragColor = 55;
                                                            }
                        }  

                     hptrDefault = WinQueryPointer((HWND)1);

                     switch (iDragColor)
                        {
                        case 50: WinSetPointer((HWND)1, hptrRed);
                           break;
                        case 51: WinSetPointer((HWND)1, hptrGreen);
                           break;
                        case 52: WinSetPointer((HWND)1, hptrBlue);
                           break;
                        case 53: WinSetPointer((HWND)1, hptrYellow);
                           break;
                        case 54: WinSetPointer((HWND)1, hptrCyan);
                           break;
                        case 55: WinSetPointer((HWND)1, hptrPink);
                           break;
                        default:
                           break;
                        }
                     }
                  break;

    case 0x0020:
                     ControlProg(hwnd, msg, mp1, mp2);
                  break;

    case 0x0024:
                     if ((Playing == 1) && (Paused == 0))
                        {
                        seconds += 1;
                        hps = WinGetPS(hwnd);
                        DrawTime(hps);
                        WinReleasePS(hps);
                        }
                  break;

    case 0x0029:

                  if (Playing == 1)
                     {
                     if (!WinLoadString(hab, hmodDLL, 512, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     if (!WinLoadString(hab, hmodDLL, 511, sizeof(title), title))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);

                     rc = WinMessageBox((HWND)1,
                                   hwnd,
                                   ressourceText,
                                   title,
                                   10,
                                   0x0004 | 0x0010 | 0x4000);
                     }
                  else
                     rc = 6;

                  if (rc != 6)
                     return (void*)1;
                  else {
                     WriteSettings();
                     WinPostMsg(hwnd, 0x002a, 0L, 0L);
                     }
               break;
    case 0x007a:

                  if (!(((PCHRMSG)((PBYTE)&msg + sizeof(MPARAM) ))->fs & 0x0040)) {
                     switch (((USHORT)((ULONG)mp2 >> 16))) {
                        case 0x0D :

                           if (Playing == 1)
                              WinSendMsg(hwnd, 0x0020, ((MPARAM)(USHORT)(103)), ((void *)0));
                           return (void*)1;
                           break;
                        }  
                     }  
                     return (void*)0;
               break;

    default : return WinDefWindowProc(hwnd, msg, mp1, mp2);
  }
  return WinDefWindowProc(hwnd, msg, mp1, mp2);
}

int DrawBitmap(HPS hps, int BitmapID, int height, int width, int posx, int posy)
#line 626
{
   PPOINTL pptlDst;
   POINTL  ptlDst;
   HBITMAP hbm, hbmPrevious;

   pptlDst = &ptlDst;

   hbm = GpiLoadBitmap(hps, ( (LHANDLE) 0), BitmapID, height, width);
   hbmPrevious = GpiSetBitmap(hps, hbm);   
   pptlDst->x = posx;
   pptlDst->y = posy;
   WinDrawBitmap(hps, hbm, ((void *)0), pptlDst, 0L, 0L, 0x0000);

   return 0;
}

int Draw3DBox(HPS hps, int posx, int posy, int width, int height, COLOR lBackground, int iFillmode)
#line 650
{
   POINTL ptlStart, ptlEdge;
   long   lOldColor;
#line 655
   lOldColor=GpiQueryColor(hps);
#line 658
   if (iFillmode == 0)
      {
      GpiSetColor(hps, lBackground);
      ptlStart.x = posx + 2;
      ptlStart.y = posy + 2;
      GpiSetCurrentPosition(hps, &ptlStart);
      ptlEdge.x = ptlStart.x + width - 4;
      ptlEdge.y = ptlStart.y + height - 4;
      GpiBox(hps, 1L, &ptlEdge, 0L, 0L);
      }
#line 670
   GpiSetColor(hps, (-1L));
   ptlStart.x = posx;
   ptlStart.y = posy;
   ptlEdge.x = ptlStart.x;
   ptlEdge.y = ptlStart.y + height;
   GpiSetCurrentPosition(hps, &ptlStart);
   GpiLine(hps, &ptlEdge);
   ptlEdge.x = ptlEdge.x + width;
   GpiLine(hps, &ptlEdge);
   GpiSetColor(hps, (-2L));
   ptlEdge.y = ptlEdge.y - height;
   GpiLine(hps, &ptlEdge);
   ptlStart.x += 1;
   GpiLine(hps, &ptlStart);
   GpiSetColor(hps, (-1L));
#line 687
   ptlStart.x = posx + 2;
   ptlStart.y = posy + 2;
   ptlEdge.x = ptlStart.x;
   ptlEdge.y = ptlStart.y + height - 4;
   GpiSetCurrentPosition(hps, &ptlStart);
   GpiLine(hps, &ptlEdge);
   ptlEdge.x = ptlEdge.x + width - 4;
   GpiLine(hps, &ptlEdge);
   GpiSetColor(hps, (-2L));
   ptlEdge.y = ptlEdge.y - height + 4;
   GpiLine(hps, &ptlEdge);
   ptlStart.x += 2;
   GpiLine(hps, &ptlStart);
#line 702
   GpiSetColor(hps, lOldColor);
   return 0;
}
#line 707
void CreateColors(void)
#line 711
{
   int available[6]={0, 1, 2, 3, 4, 5};
   int hilf;
   int i;

   if (Multiple == 1) {
      for (i=0; i<4; i++)
          MasterColors[i]=(rand() % 6) + 50;
      }
   else {
      for (i=0; i<4; i++)
         MasterColors[i]=(rand() % (6-i));
      for (i=0; i<4; i++) {
         hilf = MasterColors[i];
         MasterColors[i] = available[hilf] + 50;
         available[hilf] = available[5-i];
         }
      }
}
#line 732
void init(void)
#line 736
{
   struct timeb timebuffer;
   int i;
   char ressourceText[50];

   _ftime(&timebuffer);
   srand(timebuffer.millitm);
   screenx = WinQuerySysValue((HWND)1,20);
   screeny = WinQuerySysValue((HWND)1,21);
   CreateColors();
#line 749
   guessed = 0;
   iActualRow = 0;
   NumTries = -1;
   iDragColor = 0;
   dragging = 0;
   circle = 0;
   if (hwndButton != 0L)
      if (Playing != 1) {
         if (!WinLoadString(hab, hmodDLL, 501, sizeof(ressourceText), ressourceText))
            error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
         WinSetWindowText(hwndButton, ressourceText);
         WinEnableWindow(hwndButton, 1);
         }
   for (i=0; i<40; i++)
      {
      GuessedColors[i]=0;
      Pins[i]=0;
      }
   seconds = 0;
   Paused = 0;
}
#line 773
FIXED MakeFixed(int a, int b)
#line 777
{
   return a*65536 + b;
}
#line 782
int DrawColors(HPS hps, int BitmapID, int column, int row)
#line 786
{
   DrawBitmap(hps, BitmapID, 16L, 19L, 69+(column*37), 107+(row*30));
   return 0;
}
#line 792
int DrawMasterColors(HPS hps)
#line 796
{
   DrawBitmap(hps, MasterColors[0], 16L, 19L, 62, 450);
   DrawBitmap(hps, MasterColors[1], 16L, 19L, 104, 450);
   DrawBitmap(hps, MasterColors[2], 16L, 19L, 146, 450);
   DrawBitmap(hps, MasterColors[3], 16L, 19L, 188, 450);
   return 0;
}

int DrawGuessedColors(HPS hps)
#line 808
{
   int i;
   int row;
   int column;

   if (NumTries < 0) return 0;
   for (i=0; i<=NumTries; i++)
      if ((GuessedColors[i]>=50) && (GuessedColors[i]<=50+5))
         {
         row = i / 4;
         column = i % 4;
         DrawColors(hps, GuessedColors[i], column, row);
         }
   return 0;
}
#line 825
int DrawRowNumbers(HPS hps)
#line 829
{
   POINTL ptlDrawPosition;
   int    i;
   char   cNumber[4];

   GpiSetColor(hps, 9L);
   ptlDrawPosition.x = 20;
   for (i=0; i<=iActualRow && i<10; i++)
     {
      ptlDrawPosition.y = 90 + 11 + 8 + i*30;
      GpiSetCurrentPosition(hps, &ptlDrawPosition);
      sprintf(cNumber, "%d)", i+1);
      GpiCharString(hps, __strlen( (cNumber) ), (unsigned char*)&cNumber);
     }
  return 0;
}

int DrawActualMarks(HPS hps, int all)
#line 851
{
   POINTL ptlDrawPosition;
   int    i, j;
   ARCPARAMS arcp={1,1,0,0};

   GpiSetColor(hps, (-1L));
   GpiSetArcParams(hps, &arcp);
   if (all == 1)
      j = 0;
   else
      j = iActualRow;
   for (; j<=iActualRow && j<10; j++)
      {
      ptlDrawPosition.y = 90 + 17 + 8 + j*30;
      for (i=0; i<4; i++)
         {
         ptlDrawPosition.x = 50 + 18 + 9 + i*37;
         GpiSetCurrentPosition(hps, &ptlDrawPosition);
         GpiFullArc(hps, 2L, MakeFixed(8,0));
         }
      }
   return 0;
}

int DrawFutureMarks(HPS hps)
#line 880
{
   POINTL ptlDrawPosition;
   int    i, j;
   ARCPARAMS arcp={1,1,0,0};

   GpiSetColor(hps, 15L);
   GpiSetArcParams(hps, &arcp);
   if (iActualRow == 9)
      return 0;
   for (j=iActualRow+1; j<10; j++)
      {
      ptlDrawPosition.y = 90 + 17 + 8 + j*30;
      for (i=0; i<4; i++)
         {
         ptlDrawPosition.x = 50 + 18 + 9 + i*37;
         GpiSetCurrentPosition(hps, &ptlDrawPosition);
         GpiFullArc(hps, 2L, MakeFixed(8,0));
         }
      }
   return 0;
}
#line 903
void ControlProg(HWND hwnd,ULONG msg, MPARAM mp1, MPARAM mp2)
#line 907
{
   HWND        hwndMenu;
   HWND        hwndAbout;
   HWND        hwndHighscore;
   HWND        hwndContainer;
   HWND        hwndListbox;
   USHORT      command;
   HPS         hps;
   int         won;
   ULONG       rc;
   RECTL       rect;
   char        pszMenuText[15];
   char        dummy[800];
   MRESULT     mresReply;
   Hscr        *HighHelp;
   Hscr        *Highscore;
   PRECORDCORE HighItem, HighItemAnchor;
   PFIELDINFO  Column, ColumnAnchor;
   RECORDINSERT recsIn;
   FIELDINFOINSERT fieldIn;
   CNRINFO     cnrInfo;
   int         i;
   char        pszListEntry[100];
   char        pszTries[100];
   char        pszTime[100];
   char        ressourceText[200];
   char        title[30];
#line 936
   command = ((USHORT)(ULONG)(mp1));
   switch (command)
   {
      case 300:

                  if (Playing == 1) {
                     WinEnableWindow(hwndButton, 0);
                  } else {
                     WinSendMsg(hwnd, 0x0020, ((MPARAM)(USHORT)(101)), ((void *)0));
                     break;
                  }

                  hps = WinGetPS(hwnd);
                  won = CheckColors(hps, hwnd);
                  if (won != 1)
                     {

                     iActualRow += 1;
                     if (iActualRow <= 9)
                        {
                        DrawActualMarks(hps, 0);
                        DrawRowNumbers(hps);
                        }
                     }
                  WinReleasePS(hps);
                  if (iActualRow >= 10)
                     Loose(hwnd);

                  if (won != 1)
                     {
                     switch (iActualRow)
                        {
                        case 1 : if (!WinLoadString(hab, hmodDLL, 514, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 2 : if (!WinLoadString(hab, hmodDLL, 515, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 3 : if (!WinLoadString(hab, hmodDLL, 516, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 4 : if (!WinLoadString(hab, hmodDLL, 517, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 5 : if (!WinLoadString(hab, hmodDLL, 518, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 6 : if (!WinLoadString(hab, hmodDLL, 519, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 7 : if (!WinLoadString(hab, hmodDLL, 520, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 8 : if (!WinLoadString(hab, hmodDLL, 521, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        case 9 : if (!WinLoadString(hab, hmodDLL, 522, sizeof(ressourceText), ressourceText))
                                    error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                                 WinSetWindowText(hwndButton, ressourceText);
                           break;
                        }
                     }
               break;

      case 101:

                  if (Playing == 1)
                     {
                     if (!WinLoadString(hab, hmodDLL, 524, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     if (!WinLoadString(hab, hmodDLL, 523, sizeof(title), title))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     rc = WinMessageBox((HWND)1,
                                   hwnd,
                                   ressourceText,
                                   title,
                                   10,
                                   0x0004 | 0x0010 | 0x4000);
                     if (rc != 6)
                        break;
                     }

                  if (!WinLoadString(hab, hmodDLL, 513, sizeof(ressourceText), ressourceText))
                     error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                  WinSetWindowText(hwndButton, ressourceText);
                  WinEnableWindow(hwndButton, 0);
                  Playing = 1;
                  init();

                  hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                  ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(104)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(1) ? 0 : 0x4000))) << 16))))));
                  ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(103)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(1) ? 0 : 0x4000))) << 16))))));
                  ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));

                  WinQueryWindowRect(hwnd, &rect);
                  WinInvalidateRect(hwnd, &rect, 1);
               break;
      case 110:
                  WinPostMsg(hwnd, 0x0029, 0L, 0L);
               break;
      case 104:

                  if (!WinLoadString(hab, hmodDLL, 526, sizeof(ressourceText), ressourceText))
                     error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                  if (!WinLoadString(hab, hmodDLL, 525, sizeof(title), title))
                     error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                  rc = WinMessageBox((HWND)1,
                                hwnd,
                                ressourceText,
                                title,
                                10,
                                0x0004 | 0x0010 | 0x4000);
                  if (rc != 6)
                     break;
                  hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                  ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(104)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));
                  ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(103)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));
                  ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(1) ? 0 : 0x4000))) << 16))))));
                  Playing = 0;
                  guessed = 1;
                  if (!WinLoadString(hab, hmodDLL, 501, sizeof(ressourceText), ressourceText))
                     error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                  WinSetWindowText(hwndButton, ressourceText);
                  WinEnableWindow(hwndButton, 1);
                  if (Paused == 1) {

                     if (!WinLoadString(hab, hmodDLL, 527, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                     mresReply = WinSendMsg(hwndMenu, 0x018e, (MPARAM)103, (MPARAM)ressourceText);
                     Paused = 0;
                     }
                  WinQueryWindowRect(hwnd, &rect);
                  WinInvalidateRect(hwnd, &rect, 1);
               break;
      case 103:

                  if (Paused == 0)
                     {
                     Paused = 1;

                     if (!WinLoadString(hab, hmodDLL, 528, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                     mresReply = WinSendMsg(hwndMenu, 0x018e, (MPARAM)103, (MPARAM)ressourceText);

                     WinQueryWindowRect(hwnd, &rect);
                     WinInvalidateRect(hwnd, &rect, 1);
                     }

                  else
                     {
                     Paused = 0;

                     if (!WinLoadString(hab, hmodDLL, 527, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                     mresReply = WinSendMsg(hwndMenu, 0x018e, (MPARAM)103, (MPARAM)ressourceText);

                     WinQueryWindowRect(hwnd, &rect);
                     WinInvalidateRect(hwnd, &rect, 1);
                     }
               break;
      case 105:

                  if (Multiple == 1) {

                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                     ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x2000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0x2000 : 0))) << 16))))));

                     Multiple = 0;
                     }

                  else {

                     hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
                     ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x2000)) | ((ULONG)((USHORT)((USHORT)(1) ? 0x2000 : 0))) << 16))))));

                     Multiple = 1;
                     }
               break;
      case 102:

                  Highscore = ReadHighscore();

                  hwndHighscore = WinLoadDlg((HWND)1, WinQueryWindow(hwnd, 5), (PFNWP)HighscoreDlgProc, ( (LHANDLE) 0), 30, ((void *)0));
                  WinSetWindowPos(hwndHighscore, (HWND)3,
                                (WinQuerySysValue((HWND)1, 20)-450)/2,
                                (WinQuerySysValue((HWND)1, 21)-283)/2,
                                450, 283,
                                0x0001 | 0x0002 | 0x0080 | 0x0008);
                  hwndListbox = WinWindowFromID(hwndHighscore, 32);

                  WinEnableWindowUpdate(hwndListbox, 0);

                  if (Highscore == ((void *)0)) {
                     if (!WinLoadString(hab, hmodDLL, 529, sizeof(ressourceText), ressourceText))
                        error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
                     __strcpy( (pszListEntry), (ressourceText) );
                     WinSendMsg(hwndListbox, 0x0161, ((MPARAM)(USHORT)((-1))), ((MPARAM)((ULONG)(pszListEntry))));
                     }
                  else {
                     HighHelp = Highscore;
                     while (HighHelp != ((void *)0)) {
                        if (HighHelp->Tries != 10)
                           sprintf(pszTries, "  %d   |", HighHelp->Tries);
                        else
                           sprintf(pszTries, " 10   |");
                        if (HighHelp->Minutes >= 100)
                           sprintf(pszTime, " %d:%02d  |", HighHelp->Minutes, HighHelp->Seconds);
                        else
                           if (HighHelp->Minutes >= 10)
                              sprintf(pszTime, "  %d:%02d  |", HighHelp->Minutes, HighHelp->Seconds);
                           else
                              sprintf(pszTime, "   %d:%02d  |", HighHelp->Minutes, HighHelp->Seconds);
                        sprintf(pszListEntry, "%s%s %-s", pszTries, pszTime, HighHelp->Name);
                        WinSendMsg(hwndListbox, 0x0161, ((MPARAM)(USHORT)((-1))), ((MPARAM)((ULONG)(pszListEntry))));
                        HighHelp = HighHelp->Next;
                        }
                     }

                  WinShowWindow(hwndListbox, 1);
#line 1169
if (1 == 0) {
                  hwndContainer = WinCreateWindow(hwndHighscore,
                           ((PSZ)0xffff0025L),
                           ((void *)0),
                           0x00000020L | 0x00000002L | 0x80000000L,
                           5, 72,
                           440, 300,
                           hwnd,
                           (HWND)4,
                           86,
                           ((void *)0),
                           ((void *)0));

                  HighItemAnchor = (PRECORDCORE)WinSendMsg(hwndContainer, 0x0331, 0, ((MPARAM)(USHORT)(10)));

                  ColumnAnchor = (PFIELDINFO)WinSendMsg(hwndContainer, 0x0330, ((MPARAM)(USHORT)(4)), 0);
                  Column = ColumnAnchor;

                  for (i=0; i<4; i++) {
                     Column->cb = sizeof(FIELDINFO);
                     Column = Column->pNextFieldInfo;
                     }

                  Column = ColumnAnchor;
                  Column->flData = 0x00000800L | 0x00008000L | 0x00000400L | 0x00000200L;
                  Column->flTitle = 0x00010000L;
                  Column->pTitleData = "Name";
                  Column->offStruct = 0;
                  Column->pUserData = ((void *)0);
                  Column->cxWidth = 260;

                  Column = Column->pNextFieldInfo;
                  Column->flData = 0x00020000L | 0x00000400L | 0x00000200L;
                  Column->flTitle = 0x00010000L;
                  Column->pTitleData = "Tries";
                  Column->offStruct = sizeof(char)*100 + sizeof(int)*2;
                  Column->pUserData = ((void *)0);
                  Column->cxWidth = 30;

                  Column = Column->pNextFieldInfo;
                  Column->flData = 0x00020000L | 0x00000400L | 0x00000200L;
                  Column->flTitle = 0x00010000L;
                  Column->pTitleData = "Minutes";
                  Column->offStruct = sizeof(char)*100;
                  Column->pUserData = ((void *)0);
                  Column->cxWidth = 30;

                  Column = Column->pNextFieldInfo;
                  Column->flData = 0x00020000L | 0x00000400L | 0x00000200L;
                  Column->flTitle = 0x00010000L;
                  Column->pTitleData = "Seconds";
                  Column->offStruct = sizeof(char)*100 + sizeof(int);
                  Column->pUserData = ((void *)0);
                  Column->cxWidth = 30;

                  recsIn.cb = sizeof(RECORDINSERT);
                  recsIn.pRecordOrder = (PRECORDCORE)0x0010;
                  recsIn.pRecordParent = ((void *)0);
                  recsIn.zOrder = (USHORT)0x0001;
                  recsIn.fInvalidateRecord = 1;
                  recsIn.cRecordsInsert = 10;

                  cnrInfo.flWindowAttr = 0x00000008L | 0x00000200L;
                  cnrInfo.cFields = 4;
                  WinSendMsg(hwndContainer,
                             0x0349,
                             ((MPARAM)((ULONG)(&cnrInfo))),
                             ((MPARAM)(ULONG)(0x0004)));

                  fieldIn.cb = sizeof(FIELDINFOINSERT);
                  fieldIn.pFieldInfoOrder = (PFIELDINFO)0x0010;
                  fieldIn.fInvalidateFieldInfo = 1;
                  fieldIn.cFieldInfoInsert = 4;
                  WinSendMsg(hwndContainer,
                             0x0338,
                             ((MPARAM)((ULONG)(ColumnAnchor))),
                             ((MPARAM)((ULONG)(&fieldIn))));
#line 1251
                 }
#line 1256
                  WinProcessDlg(hwndHighscore);
                  WinDestroyWindow(hwndHighscore);

                  FreeHighscore(Highscore);
               break;

      case 201:
               WinSendMsg(hwndHelpInstance,
                    0x0220+0x0002,
                    ((MPARAM)(ULONG)(((long)((ULONG)(((USHORT)(401)) | ((ULONG)((USHORT)(((void *)0)))) << 16))))),
                    ((MPARAM)(USHORT)(0)));
               break;

      case 203:
               WinSendMsg(hwndHelpInstance,
                    0x0220+0x0002,
                    ((MPARAM)(ULONG)(((long)((ULONG)(((USHORT)(402)) | ((ULONG)((USHORT)(((void *)0)))) << 16))))),
                    ((MPARAM)(USHORT)(0)));
               break;

      case 204:
               WinSendMsg(hwndHelpInstance,
                    0x0220+0x0002,
                    ((MPARAM)(ULONG)(((long)((ULONG)(((USHORT)(414)) | ((ULONG)((USHORT)(((void *)0)))) << 16))))),
                    ((MPARAM)(USHORT)(0)));
               break;

      case 202:

               hwndAbout = WinLoadDlg( (HWND)1,     
                                   (HWND)1,     
                                   (PFNWP)ProdInfoDlgProc,    
                                   (HMODULE)0,       
                                   20,        
                                   ((void *)0));            
               WinSetWindowPos(hwndAbout, (HWND)3,
                                (WinQuerySysValue((HWND)1, 20)-390)/2,
                                (WinQuerySysValue((HWND)1, 21)-330)/2,
                                366, 330,
                                0x0001 | 0x0002 | 0x0080 | 0x0008);
               WinProcessDlg(hwndAbout);
               WinDestroyWindow(hwndAbout);
   }
   return;
}
#line 1307
int CheckColors(HPS hps, HWND hwnd)
#line 1311
{
   int MasterChecked[4] = {0,0,0,0};
   int GuessedChecked[4] = {0,0,0,0};
   int AllRight=1;
   int i, j;
#line 1318
   for (i=0; i<=3; i++)
      if (MasterColors[i] == GuessedColors[(iActualRow*4)+i])
         {
         Pins[(iActualRow*4)+i] = 60;
         MasterChecked[i] = 1;
         GuessedChecked[i] = 1;
         }

   for (i=0; i<=3; i++)
      for (j=0; j<=3; j++)
         if ((i!=j) && (MasterChecked[i]!=1) && (GuessedChecked[j]!=1))
            if (MasterColors[i] == GuessedColors[(iActualRow*4)+j])
               {
               Pins[(iActualRow*4)+j] = 61;
               MasterChecked[i] = 1;
               GuessedChecked[j] = 1;
               }

   DrawPins(hps);

   for (i=0; i<=3; i++)
      if (Pins[(iActualRow*4)+i] != 60)
         AllRight = 0;
   if (AllRight == 1)
      {
      Win(hwnd);
      return 1;
      }

   return 0;
}

void Loose(HWND hwnd)
#line 1354
{
   char message[300];
   RECTL rect;
   HWND hwndMenu;
   char ressourceText[50];

   Playing = 0;
   guessed = 1;
   hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(104)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(103)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(1) ? 0 : 0x4000))) << 16))))));
   if (!WinLoadString(hab, hmodDLL, 501, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   WinSetWindowText(hwndButton, ressourceText);
   WinEnableWindow(hwndButton, 1);
   WinQueryWindowRect(hwnd, &rect);
   WinInvalidateRect(hwnd, &rect, 1);
   if (!WinLoadString(hab, hmodDLL, 530, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   sprintf(message, "%s %d", ressourceText, seconds/60);
   if (!WinLoadString(hab, hmodDLL, 531, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   sprintf(message, "%s %s %d", message, ressourceText, seconds%60);
   if (!WinLoadString(hab, hmodDLL, 532, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   sprintf(message, "%s %s", message, ressourceText);

   if (!WinLoadString(hab, hmodDLL, 534, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   WinMessageBox((HWND)1,
                 hwnd,
                 message,
                 ressourceText,
                 10,
                 0x0000 | 0x0020 | 0x4000);
}

void Win(HWND hwnd)
#line 1396
{
   RECTL rect;
   HWND  hwndMenu;
   Hscr  *Highscore;
   Hscr  *HighHelp;
   int   HighPos;
   int   stop;
   int   stopInner;
   char  ressourceText[50];

   Playing = 0;
   guessed = 1;
   hwndMenu = WinWindowFromID(WinQueryWindow(hwnd, 5), 0x8005);
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(104)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(103)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(0) ? 0 : 0x4000))) << 16))))));
   ((BOOL)WinSendMsg(hwndMenu, 0x0192, ((MPARAM)((long)((ULONG)(((USHORT)(105)) | ((ULONG)((USHORT)(1))) << 16)))), ((MPARAM)((long)((ULONG)(((USHORT)(0x4000)) | ((ULONG)((USHORT)((USHORT)(1) ? 0 : 0x4000))) << 16))))));
   if (!WinLoadString(hab, hmodDLL, 501, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   WinSetWindowText(hwndButton, ressourceText);
   WinEnableWindow(hwndButton, 1);
   WinQueryWindowRect(hwnd, &rect);
   WinInvalidateRect(hwnd, &rect, 1);

   Highscore = ReadHighscore();

   HighHelp = Highscore;
   HighPos = 1;
   stop = 0;
   while ((HighHelp != ((void *)0)) && (HighPos <= 10) && (stop != 1)) {
      if (iActualRow+1 < HighHelp->Tries) {
         Highscore = Eintragen(HighHelp, HighHelp->Prev, Highscore, HighPos, hwnd);
         stop = 1;
         }
      else {
         if (iActualRow+1 == HighHelp->Tries) {
            if (seconds < (HighHelp->Minutes*60 + HighHelp->Seconds)) {
               Highscore = Eintragen(HighHelp, HighHelp->Prev, Highscore, HighPos, hwnd);
               stop = 1;
               }
            else {
               stopInner = 0;
               while ((HighHelp->Next != ((void *)0)) && (iActualRow+1 == HighHelp->Next->Tries) && (stopInner != 1)) {
                  if (HighHelp->Next != ((void *)0)) {
                     HighHelp = HighHelp->Next;
                     HighPos += 1;
                     }
                  else
                     stopInner = 1;
                  if (seconds < (HighHelp->Minutes*60 + HighHelp->Seconds)) {
                     Highscore = Eintragen(HighHelp, HighHelp->Prev, Highscore, HighPos, hwnd);
                     stopInner = 1;
                     }
                  }
               if (stopInner != 1)
                  Highscore = Eintragen(HighHelp->Next, HighHelp, Highscore, HighPos, hwnd);
               stop = 1;
               }
            }
         HighHelp = HighHelp->Next;
         HighPos += 1;
         }
      }
   if ((HighPos <= 10) && (stop != 1)){
      if (Highscore != ((void *)0)) {
         HighHelp = Highscore;
         while (HighHelp->Next != ((void *)0)) HighHelp = HighHelp->Next;
         Highscore = Eintragen(((void *)0), HighHelp, Highscore, HighPos, hwnd);
         }
      else
         Highscore = Eintragen(((void *)0), ((void *)0), Highscore, HighPos, hwnd);
      }
   WriteHighscore(Highscore);
   FreeHighscore(Highscore);
#line 1482
   WinSendMsg(hwnd, 0x0020, ((MPARAM)(USHORT)(102)), ( (LHANDLE) 0));
}
#line 1486
int DrawPins(HPS hps)
#line 1490
{
   int x,y;
   int i,r,c;
   int BothRight=0, RightPlace=0;

   for (r=0; r<=iActualRow; r++)
      {
      for (c=0; c<4; c++)
         {
         if (Pins[(r*4)+c] == 60)
            BothRight += 1;
         else
            if (Pins[(r*4)+c] == 61)
               RightPlace += 1;
         }
      y = 107+(r*30);
      if (RightPlace != 0)
         {
         x = 230;
         for (i=1; i<=RightPlace; i++)
            {
            DrawBitmap(hps, 61, 21, 21, x, y);
            x +=25;
            }
         RightPlace = 0;
         }
      if (BothRight != 0)
         {
         x = 350;
         for (i=1; i<=BothRight; i++)
            {
            DrawBitmap(hps, 60, 21, 21, x, y);
            x += 25;
            }
         BothRight = 0;
         }
      }
   return 0;
}

int DrawTime(HPS hps)
#line 1534
{
   char cTime[20];
   long mins, secs;
   POINTL ptlDrawPosition;
   RECTL rect;
   char ressourceText[20];

   rect.xLeft = 400;
   rect.yBottom = 520;
   rect.xRight = 500;
   rect.yTop = 600;
   WinFillRect(hps, &rect, 15L);
   mins = seconds / 60;
   secs = seconds % 60;
   sprintf(cTime, "%d:%02d", mins, secs);
   ptlDrawPosition.x = 400;
   ptlDrawPosition.y = 520;
   GpiSetCurrentPosition(hps, &ptlDrawPosition);
   GpiCharString(hps, __strlen( (cTime) ), cTime);
   ptlDrawPosition.x = 350;
   GpiSetCurrentPosition(hps, &ptlDrawPosition);
   GpiSetColor(hps, 9L);
   if (!WinLoadString(hab, hmodDLL, 535, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   GpiCharString(hps, __strlen( (ressourceText) ), ressourceText);
   return 0;
}
#line 1563
MRESULT _System ProdInfoDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
#line 1567
{
   RECTL rcl;
   HPS   hps;

   switch(msg)
   {
      case 0x003b:
           WinSetPresParam(hwnd, 15L, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
           WinCreateWindow(hwnd,
                                ((PSZ)0xffff0003L),
                                "OK",
                                0x80000000L | 0L | 0x0400L,
                                140, 18,
                                80, 36,
                                hwnd,
                                (HWND)3,
                                1,
                                ((void *)0),
                                ((void *)0));
         break;
      case 0x0024:
      case 0x0020:
#line 1592
         WinDismissDlg(hwnd, 1);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

MRESULT _System HighscoreDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
#line 1606
{
   RECTL rcl;
   HPS   hps;
   HWND  hwndContainer;
   HWND  hwndOK;

   switch(msg)
   {
      case 0x003b:
           hwndOK = WinCreateWindow(hwnd,
                           ((PSZ)0xffff0003L),
                           "OK",
                           0x80000000L | 0L | 0x0400L,
                           185, 18,
                           80, 36,
                           hwnd,
                           (HWND)3,
                           1,
                           ((void *)0),
                           ((void *)0));
             WinCreateWindow(hwnd,
                           ((PSZ)0xffff0007L),
                           ((void *)0),
                           0x80000000L | 0x00000004L,
                           5, 72,
                           440, 168,
                           hwnd,
                           (HWND)4,
                           32,
                           ((void *)0),
                           ((void *)0));
           WinSetPresParam(hwnd, 15L, (ULONG)sizeof("8.Courier"), (PVOID)"8.Courier");
           WinSetPresParam(hwndButton, 15L, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
        break;
      case 0x0020:
#line 1644
         WinDismissDlg(hwnd, 1);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

Hscr* Eintragen(Hscr* NextPos, Hscr* PrevPos, Hscr* Anchor, int Pos, HWND hwnd)
#line 1658
{
   Hscr* newEntry;
   char  Name[100];
   HWND  hwndQueryName;
   char  pszQNT[200];
   char  ressourceText[100];
#line 1666
   hwndQueryName = WinLoadDlg((HWND)1, hwnd, (PFNWP)QueryNameDlgProc, ( (LHANDLE) 0), 40, Name);

   if (iActualRow != 0) {
      if (!WinLoadString(hab, hmodDLL, 536, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %d", ressourceText, iActualRow+1);
      if (!WinLoadString(hab, hmodDLL, 537, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %s%d ", pszQNT, ressourceText, seconds/60);
      if (!WinLoadString(hab, hmodDLL, 538, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s%s %d", pszQNT, ressourceText, seconds%60);
      if (!WinLoadString(hab, hmodDLL, 539, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %s", pszQNT, ressourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, 42), pszQNT);
      if (!WinLoadString(hab, hmodDLL, 540, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %d", ressourceText, Pos);
      if (!WinLoadString(hab, hmodDLL, 541, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %s", pszQNT, ressourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, 43), pszQNT);
      }
   else {
      if (!WinLoadString(hab, hmodDLL, 542, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s%d", ressourceText, seconds/60);
      if (!WinLoadString(hab, hmodDLL, 543, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %s %d", pszQNT, ressourceText, seconds%60);
      if (!WinLoadString(hab, hmodDLL, 544, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %s", pszQNT, ressourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, 42), pszQNT);
      if (!WinLoadString(hab, hmodDLL, 545, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s %d", ressourceText, Pos);
      if (!WinLoadString(hab, hmodDLL, 546, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      sprintf(pszQNT, "%s%s", pszQNT, ressourceText);
      WinSetWindowText(WinWindowFromID(hwndQueryName, 43), pszQNT);
      }

   WinSendMsg(WinWindowFromID(hwndQueryName, 45), 0x0143, (MPARAM)25, (MPARAM)0);

   WinSetWindowPos(hwndQueryName, (HWND)3,
                   (WinQuerySysValue((HWND)1, 20)-450)/2,
                   (WinQuerySysValue((HWND)1, 21)-230)/2,
                   450, 230,
                   0x0001 | 0x0002 | 0x0080 | 0x0008);
   WinProcessDlg(hwndQueryName);
   WinDestroyWindow(hwndQueryName);
#line 1721
   newEntry = malloc(sizeof(Hscr));

   newEntry->Minutes = seconds/60;
   newEntry->Seconds = seconds%60;
   newEntry->Tries = iActualRow+1;
   __strcpy( (newEntry->Name), (Name) );

   newEntry->Next = NextPos;
   newEntry->Prev = PrevPos;

   if ((NextPos != ((void *)0)) && (PrevPos != ((void *)0))) {
      PrevPos->Next = newEntry;
      NextPos->Prev = newEntry;
      }
   else {

      if ((NextPos == ((void *)0)) && (PrevPos != ((void *)0)))
         PrevPos->Next = newEntry;
      else {

         if ((NextPos != ((void *)0)) && (PrevPos == ((void *)0))) {
            NextPos->Prev = newEntry;
            Anchor = newEntry;
            }
         else

            Anchor = newEntry;
         }
      }
   return Anchor;
}

MRESULT _System QueryNameDlgProc( HWND hwnd, ULONG msg, MPARAM mp1, MPARAM mp2)
#line 1757
{
   static char *Name;
   HWND hwndEntry;
   HWND hwndOK;

   switch(msg)
   {
      case 0x003b:
         Name = ((void *)(mp2));
         WinSetPresParam(hwnd, 15L, (ULONG)sizeof("8.Helv"), (PVOID)"8.Helv");
         hwndOK = WinCreateWindow(hwnd,
                           ((PSZ)0xffff0003L),
                           "OK",
                           0x80000000L | 0L | 0x0400L,
                           185, 18,
                           80, 36,
                           hwnd,
                           (HWND)3,
                           1,
                           ((void *)0),
                           ((void *)0));
         break;
      case 0x0020:
#line 1783
         hwndEntry = WinWindowFromID(hwnd, 45);
         WinQueryWindowText(hwndEntry, 100, Name);
         WinDismissDlg(hwnd, 1);
         break;

      default:
         return(WinDefDlgProc(hwnd, msg, mp1, mp2));
         break;
   }
   return (MRESULT)0;
}

Hscr* ReadHighscore(void)
#line 1799
{
   FILE       *HighscoreFile;
   Hscr       *Highscore;
   Hscr       *HighHelp;
   HscrBuffer Buffer;
   int        first;

   HighscoreFile = fopen("mmind.scr", "r");
   if (HighscoreFile != ((void *)0)) {
      Highscore = malloc(sizeof(Hscr));
      first = 1;
      HighHelp = Highscore;
      while (fread(&Buffer, sizeof(HscrBuffer), 1, HighscoreFile) == 1) {
         if (first != 1) {
            HighHelp->Next=malloc(sizeof(Hscr));
            HighHelp->Next->Prev=HighHelp;
            HighHelp = HighHelp->Next;
            }
         else first = 0;
         __strcpy( (HighHelp->Name), (Buffer.Name) );
         HighHelp->Minutes = Buffer.Minutes;
         HighHelp->Seconds = Buffer.Seconds;
         HighHelp->Tries = Buffer.Tries;
         }
      HighHelp->Next = ((void *)0);
      Highscore->Prev = ((void *)0);
      fclose(HighscoreFile);
      }
   else Highscore = ((void *)0);
   return Highscore;
}

void FreeHighscore(Hscr* Highscore)
#line 1835
{
   FILE       *HighscoreFile;
   Hscr       *HighHelp;
   HscrBuffer Buffer;

   HighHelp = Highscore;
   if (Highscore != ((void *)0))
      if (Highscore->Next != ((void *)0))
         while (HighHelp->Next->Next != ((void *)0))
            HighHelp = HighHelp->Next;
#line 1847
   if (HighHelp != ((void *)0))
      if (HighHelp->Next != ((void *)0))
         while (HighHelp != ((void *)0)) {
            free(HighHelp->Next);
            HighHelp = HighHelp->Prev;
            }

   if (Highscore != ((void *)0))
      free(Highscore);
   return;
}

void WriteHighscore(Hscr* Highscore)
#line 1863
{
   FILE       *HighscoreFile;
   HscrBuffer Buffer;
   ULONG      retry = 6;
   int        written = 0;
   int        count = 0;
   char       ressourceText[100];
   char       title[30];

   while ((written != 1) && (retry == 6)) {
      HighscoreFile = fopen("mmind.scr", "w");
      if (HighscoreFile != ((void *)0)) {
         while ((Highscore != ((void *)0)) && (count<10)) {
            count++;
            Buffer.Minutes = Highscore->Minutes;
            Buffer.Seconds = Highscore->Seconds;
            Buffer.Tries = Highscore->Tries;
            __strcpy( (Buffer.Name), (Highscore->Name) );
#line 1885
             fwrite(Buffer.Name, sizeof(char), 100, HighscoreFile);
            fwrite(&Buffer.Minutes, sizeof(int), 1, HighscoreFile);
            fwrite(&Buffer.Seconds, sizeof(int), 1, HighscoreFile);
            fwrite(&Buffer.Tries, sizeof(int), 1, HighscoreFile);
            Highscore = Highscore->Next;
            }  
         fclose(HighscoreFile);
         written = 1;
         }  
      else {
         if (!WinLoadString(hab, hmodDLL, 547, sizeof(ressourceText), ressourceText))
            error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
         if (!WinLoadString(hab, hmodDLL, 548, sizeof(title), title))
            error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
         retry = WinMessageBox((HWND)1,
                    WinWindowFromID((HWND)1, 1),
                    ressourceText,
                    title,
                    10,
                    0x0004 | 0x0040 | 0x4000);
      }  
   }  
   return;
}

void InitHelp(HWND hwnd)
#line 1914
{
   HELPINIT hini;
   char     ressourceText[100];
   char     title[50];

   HelpEnabled = 0;

   hini.cb = sizeof(HELPINIT);
   hini.ulReturnCode = 0UL;

   hini.pszTutorialName = (PSZ)((void *)0);
   hini.phtHelpTable = (PHELPTABLE)((long)((ULONG)(((USHORT)(398)) | ((ULONG)((USHORT)(0xFFFF))) << 16)));
   hini.hmodHelpTableModule = ( (LHANDLE) 0);
   hini.hmodAccelActionBarModule = ( (LHANDLE) 0);
   hini.idAccelTable = 0;
   hini.idActionBar  = 0;
   if (!WinLoadString(hab, hmodDLL, 549, sizeof(ressourceText), ressourceText))
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
   __strcpy( (hini.pszHelpWindowTitle), (ressourceText) );
   hini.pszHelpLibraryName = "MMIND.HLP";

   hwndHelpInstance = WinCreateHelpInstance(hab, &hini);

   if(hwndHelpInstance == ( (LHANDLE) 0) || hini.ulReturnCode)
   {
      if (!WinLoadString(hab, hmodDLL, 550, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      if (!WinLoadString(hab, hmodDLL, 548, sizeof(title), title))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      WinMessageBox((HWND)1,
                        hwnd,
                        ressourceText,
                        title,
                        10,
                        0x0000 | 0x0040);
      return;
   }

   if(!WinAssociateHelpInstance(hwndHelpInstance, hwnd))
   {
      if (!WinLoadString(hab, hmodDLL, 551, sizeof(ressourceText), ressourceText))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      if (!WinLoadString(hab, hmodDLL, 548, sizeof(title), title))
         error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
      WinMessageBox((HWND)1,
                        hwnd,
                        ressourceText,
                        title,
                        10,
                        0x0000 | 0x0040);
      return;
   }
#line 1968
   HelpEnabled = 1;
   return;
}    

void DestroyHelpInstance(void)
#line 1976
{
    if(hwndHelpInstance != ( (LHANDLE) 0))
    {
       WinDestroyHelpInstance(hwndHelpInstance);
    }
    return;

}

void ReadSettings(void)
#line 1989
{
   FILE *Settings;
   int iBuffer;

   Settings = fopen("mmind.ini", "r");
   if (Settings != ((void *)0))
      if (fread(&iBuffer, sizeof(int), 1, Settings) == 1 )
         Multiple = iBuffer;
   fclose(Settings);
}

void WriteSettings(void)
#line 2004
{
   FILE *Settings;
   int  Error = 1;
   ULONG      retry = 6;
   char title[50];
   char ressourceText[150];

   while (retry == 6) {
      Settings = fopen("mmind.ini", "w");
      if (Settings != ((void *)0))
         if (fwrite(&Multiple, sizeof(int), 1, Settings) == 1) {
            retry = 7;
            Error = 0;
            }
      if (Error == 1)
         {
         if (!WinLoadString(hab, hmodDLL, 552, sizeof(ressourceText), ressourceText))
            error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
         if (!WinLoadString(hab, hmodDLL, 548, sizeof(title), title))
            error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Program will end.", 1);
         retry = WinMessageBox((HWND)1,
                       WinWindowFromID((HWND)1, 1),
                       ressourceText,
                       title,
                       10,
                       0x0004 | 0x0040 | 0x4000);
         }
      }

   fclose(Settings);
}

void error(char *text, int close)
#line 2040
{
   char title[50];

   if (!WinLoadString(hab, hmodDLL, 548, sizeof(title), title)) {
      error("Could not load text in national language. Make sure the file mmind.dll is in the same directory as mmind.exe. Will use English.", 0);
   } else {
      __strcpy( (title), ("Mastermind/2 error") );
   }
   WinMessageBox((HWND)1,
                       WinWindowFromID((HWND)1, 1),
                       text,
                       title,
                       10,
                       0x0000 | 0x0040 | 0x4000);
   if (close)
      exit(1);
}
