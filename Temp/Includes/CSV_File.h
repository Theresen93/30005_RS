/* Automation Studio generated header file */
/* Do not edit ! */
/* CSV_File 2.01.7 */

#ifndef _CSV_FILE_
#define _CSV_FILE_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _CSV_File_VERSION
#define _CSV_File_VERSION 2.01.7
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
#ifdef _SG3
		#include "Runtime.h"
		#include "AsMath.h"
		#include "asstring.h"
		#include "astime.h"
		#include "FileIO.h"
		#include "AsMem.h"
		#include "standard.h"
		#include "sys_lib.h"
#endif
#ifdef _SG4
		#include "Runtime.h"
		#include "AsMath.h"
		#include "asstring.h"
		#include "astime.h"
		#include "FileIO.h"
		#include "AsMem.h"
		#include "standard.h"
		#include "sys_lib.h"
#endif
#ifdef _SGC
		#include "Runtime.h"
		#include "AsMath.h"
		#include "asstring.h"
		#include "astime.h"
		#include "FileIO.h"
		#include "AsMem.h"
		#include "standard.h"
		#include "sys_lib.h"
#endif


/* Constants */
#ifdef _REPLACE_CONST
 #define ARRAY_TO_LESS 5003U
 #define DATATYP_ERROR 5007U
 #define ERRF_NO_ERROR 0U
 #define ERROR_CHECKFILEBUFFER_TOO_SMALL 5013U
 #define ERROR_ENABLE_NOT_SET 5017U
 #define ERROR_INPUT_POINTER_ERR 5018U
 #define ERROR_NUM_OF_STRUCT_MISMATCH 5015U
 #define ERROR_SIZE_MISMATCH 5016U
 #define ERROR_STRUCTNAME_TOO_LONG 5010U
 #define ERROR_STRUCT_NAMES 5006U
 #define ERROR_VERSION_MISMATCH 5014U
 #define ERROR_WRONG_SEPARATOR 5012U
 #define ERROR_ZERO_POINTER_FILE 5019U
 #define ERR_NO_MEM_ALLOC 5000U
 #define ERR_PV_ADRESS 5008U
 #define ERR_ZERO_POINTER_DEVICE 5009U
 #define ERR_ZERO_POINTER_OPTION 5011U
 #define EXECUTION_BUSY 0U
 #define FILE_CREATE 0U
 #define FILE_CREATE_WITHOUT_MEM_CHECK 2U
 #define FILE_FOUND 1U
 #define FILE_NOT_FOUND 0U
 #define FILE_OW 1U
 #define FILE_OW_WITHOUT_MEM_CHECK 3U
 #define FOCUSPOS_OUT_OF_LISTBOX 5005U
 #define FiJOB_CREATE_FILE_LIST 2U
 #define FiJOB_LIST_DOWN 6U
 #define FiJOB_LIST_PG_DOWN 4U
 #define FiJOB_LIST_PG_UP 3U
 #define FiJOB_LIST_UP 5U
 #define FiJOB_SET_FOCUS 7U
 #define HEADER 1
 #define INVALID_CHARACTER 5004U
 #define MAX_NAMELENGHT_TO_LONG 5002U
 #define MAX_VAR_NAME_LENGHT 40U
 #define NO_FILENAME 5001U
 #define NO_HEADER 0
#else
 _GLOBAL_CONST unsigned short ARRAY_TO_LESS;
 _GLOBAL_CONST unsigned short DATATYP_ERROR;
 _GLOBAL_CONST unsigned short ERRF_NO_ERROR;
 _GLOBAL_CONST unsigned short ERROR_CHECKFILEBUFFER_TOO_SMALL;
 _GLOBAL_CONST unsigned short ERROR_ENABLE_NOT_SET;
 _GLOBAL_CONST unsigned short ERROR_INPUT_POINTER_ERR;
 _GLOBAL_CONST unsigned short ERROR_NUM_OF_STRUCT_MISMATCH;
 _GLOBAL_CONST unsigned short ERROR_SIZE_MISMATCH;
 _GLOBAL_CONST unsigned short ERROR_STRUCTNAME_TOO_LONG;
 _GLOBAL_CONST unsigned short ERROR_STRUCT_NAMES;
 _GLOBAL_CONST unsigned short ERROR_VERSION_MISMATCH;
 _GLOBAL_CONST unsigned short ERROR_WRONG_SEPARATOR;
 _GLOBAL_CONST unsigned short ERROR_ZERO_POINTER_FILE;
 _GLOBAL_CONST unsigned short ERR_NO_MEM_ALLOC;
 _GLOBAL_CONST unsigned short ERR_PV_ADRESS;
 _GLOBAL_CONST unsigned short ERR_ZERO_POINTER_DEVICE;
 _GLOBAL_CONST unsigned short ERR_ZERO_POINTER_OPTION;
 _GLOBAL_CONST unsigned short EXECUTION_BUSY;
 _GLOBAL_CONST unsigned char FILE_CREATE;
 _GLOBAL_CONST unsigned char FILE_CREATE_WITHOUT_MEM_CHECK;
 _GLOBAL_CONST unsigned short FILE_FOUND;
 _GLOBAL_CONST unsigned short FILE_NOT_FOUND;
 _GLOBAL_CONST unsigned char FILE_OW;
 _GLOBAL_CONST unsigned char FILE_OW_WITHOUT_MEM_CHECK;
 _GLOBAL_CONST unsigned short FOCUSPOS_OUT_OF_LISTBOX;
 _GLOBAL_CONST unsigned char FiJOB_CREATE_FILE_LIST;
 _GLOBAL_CONST unsigned char FiJOB_LIST_DOWN;
 _GLOBAL_CONST unsigned char FiJOB_LIST_PG_DOWN;
 _GLOBAL_CONST unsigned char FiJOB_LIST_PG_UP;
 _GLOBAL_CONST unsigned char FiJOB_LIST_UP;
 _GLOBAL_CONST unsigned char FiJOB_SET_FOCUS;
 _GLOBAL_CONST plcbit HEADER;
 _GLOBAL_CONST unsigned short INVALID_CHARACTER;
 _GLOBAL_CONST unsigned short MAX_NAMELENGHT_TO_LONG;
 _GLOBAL_CONST unsigned short MAX_VAR_NAME_LENGHT;
 _GLOBAL_CONST unsigned short NO_FILENAME;
 _GLOBAL_CONST plcbit NO_HEADER;
#endif




/* Datatypes and datatypes of function blocks */
typedef struct CSV_ListFileOption_typ
{	plcstring SearchVarName[81];
	unsigned short FileLenToRead;
	unsigned char MaxNrLen;
	unsigned char MaxNameLen;
} CSV_ListFileOption_typ;

typedef struct _csv_exfilelist_internal
{	unsigned char Step;
	unsigned short DownLines;
	unsigned short UpLines;
	unsigned short PosFirstLine;
	unsigned short FileNumOnDisk;
	unsigned short FileNumAct;
	unsigned long Offset;
	plcstring TmpExtension[5];
	struct fiDIR_READ_DATA FileInfo;
	unsigned short i;
	signed long result1;
	signed long result2;
	struct CSV_ListFileOption_typ OptionStruct;
	unsigned char TmpString[51];
	struct DTStructure dateandtime;
	unsigned short status_alloc;
	unsigned long pFileData;
	unsigned long FileIdent;
	plcbit FileFound;
	plcbit PositionFound;
	plcbit FirstSeperatorFound;
	plcbit SecondSeperatorFound;
	plcbit EndPositionFound;
	unsigned long StartPositionName;
	unsigned long EndPositionName;
	unsigned char CRLF[3];
	unsigned char InternalFileName[255];
	unsigned char VarNameSearch[6];
	unsigned char CompleteEntry[255];
} _csv_exfilelist_internal;

typedef struct _csv_filelist_Internal
{	unsigned short MaxFileNum;
	unsigned char EntriesOnDisp;
	unsigned long pFileDevice;
	unsigned long pFilelist;
	unsigned long pActName;
	unsigned long pTeeList;
	unsigned long Offset;
	unsigned long MemTempOffset;
	unsigned long TempMemLng;
	unsigned short ListboxPos;
	unsigned short FilePosCounter;
	unsigned short FileNumAct;
	unsigned short FileNumOnDisk;
	unsigned short AllocStatus;
} _csv_filelist_Internal;

typedef struct _csv_init_Internal
{	unsigned short PV_xgetadrStatus;
	unsigned short PV_ninfoStatus;
	unsigned short PV_itemStatus;
	unsigned short TMP_allocStatus;
	unsigned short Dimension;
	unsigned short ItemNrSoll[50];
	unsigned short ItemNrIst[50];
	unsigned short i;
	unsigned char CRLF[3];
	unsigned char Ebene;
	unsigned char Step;
	unsigned char FoundChar;
	unsigned char Counter_Usint;
	unsigned char NameCounter;
	unsigned char Merker;
	plcbit MerkerArray[50];
	unsigned long DataLenght;
	unsigned long Datatyp;
	unsigned long PV_Adress;
	unsigned long Lenght;
	unsigned long TmpValue;
	unsigned char StartVarName[80];
	unsigned char FullStrukturName[300];
	unsigned char StrukturName[300];
	unsigned char Index[7];
	unsigned char VarItemName[300];
	unsigned char ItemName[80];
	unsigned char ArrayName[80];
	unsigned char Value[80];
	unsigned char UsintArray[80];
	signed long DintTime;
	plcbit NextItemReady;
	plcbit ArrayStructure;
	plcbit ArrayVariable;
	unsigned long VariableCounter;
} _csv_init_Internal;

typedef struct _csv_read_internal
{	plcbit OnlyArray;
	plcbit OnlyArrayInStruct;
	plcbit DateAndTime;
	plcbit HeaderLine;
	plcbit DynamicVariable;
	unsigned char Step;
	unsigned char NameEntered;
	unsigned char ArrayStructureStarts;
	unsigned char level;
	unsigned char TmpDateTime[80];
	unsigned char TmpDataTyp[80];
	unsigned char Value[80];
	unsigned char TmpName[150];
	unsigned char StructName[150];
	unsigned char DataTyp[80];
	unsigned char DateTime[80];
	unsigned char VarName[150];
	unsigned short y;
	unsigned short status_alloc;
	unsigned short status_free;
	unsigned short temp_status;
	unsigned short PV_xgetadrStatus;
	unsigned long j;
	unsigned long i;
	unsigned long FileIdent;
	unsigned long pFileData;
	unsigned long Offset;
	unsigned long OffsetOld;
	unsigned long CharPerCyclic;
	unsigned long SpacesCounter;
	unsigned long Merker;
	unsigned long SpacesLastRow;
	unsigned long nextPV;
	unsigned long Counter;
	unsigned long PV_Adress;
	unsigned long data_len;
	plcstring FileName[81];
	plcstring Path[81];
	struct DTStructure DateTimeStruct;
	unsigned char Separator;
} _csv_read_internal;

typedef struct _csv_search_internal
{	unsigned short PV_xgetadrStatus;
	unsigned short PV_ninfoStatus;
	unsigned short PV_itemStatus;
	unsigned short TMP_allocStatus;
	unsigned short Dimension;
	unsigned short ItemNrSoll[50];
	unsigned short ItemNrIst[50];
	unsigned short i;
	unsigned short y;
	unsigned char FullStrukturName[300];
	unsigned char StrukturName[300];
	unsigned char ArrayName[80];
	unsigned char UsintArray[80];
	unsigned char CRLF[3];
	unsigned char Separator[2];
	unsigned char Ebene;
	unsigned char Step;
	unsigned char NameCounter;
	unsigned char FoundChar;
	unsigned char Counter_Usint;
	unsigned char Merker;
	plcbit MerkerArray[50];
	unsigned long DataLenght;
	unsigned long Datatyp;
	unsigned long PV_Adress;
	unsigned long Offset;
	unsigned long TmpValue;
	unsigned long Lenght;
	plcdt Date_and_Time;
	signed long DintTime;
	unsigned char Index[7];
	unsigned char StartVarName[80];
	unsigned char VarItemName[300];
	unsigned char ItemName[80];
	unsigned char Value[80];
	plcbit NextItemReady;
	plcbit ArrayStructure;
	plcbit ArrayVariable;
	unsigned long VariableCounter;
} _csv_search_internal;

typedef struct CSV_CheckFile
{
	/* VAR_INPUT (analog) */
	unsigned long pFileName;
	unsigned long pDevice;
	unsigned long pStructSizes;
	unsigned char NumOfStruct;
	unsigned long pVersion;
	unsigned long pFileBuffer;
	unsigned long FileBufferSize;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short fileError;
	/* VAR (analog) */
	unsigned short statusInternal;
	plcstring fileVersionStr[256];
	unsigned char cntSizesFound;
	unsigned char ixCmp;
	unsigned long* pSize;
	unsigned long SizesFound[255];
	unsigned long fileOffset;
	plcstring sizeSignificationStr[256];
	plcstring lineBuf[256];
	unsigned short maxLenLine;
	unsigned long ixLine;
	unsigned long ixLineMax;
	unsigned long lineCnt;
	struct FileClose FClose;
	unsigned long fileIdent;
	unsigned char* pChar;
	struct FileOpen FOpen;
	struct FileRead FRead;
	plcstring verSignificationStr[256];
	struct R_TRIG R_TRIG_0;
	unsigned short fileCheckStep;
	unsigned char CharPerCyclic;
	/* VAR_INPUT (digital) */
	plcbit enable;
	/* VAR (digital) */
	plcbit versionFound;
} CSV_CheckFile_typ;

typedef struct CSV_InitCheckFile
{
	/* VAR_INPUT (analog) */
	unsigned long MemCounter;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long pFileBuffer;
	unsigned long FileBufferSize;
	/* VAR (analog) */
	struct AsMemPartAlloc AsMemPartAlloc_0;
	struct AsMemPartCreate AsMemPartCreate_0;
	/* VAR_INPUT (digital) */
	plcbit enable;
} CSV_InitCheckFile_typ;

typedef struct CSV_Search
{
	/* VAR_INPUT (analog) */
	unsigned long pStructName;
	unsigned char NumOfStructs;
	unsigned long pStructMem;
	unsigned long MemLen;
	unsigned long Options;
	unsigned char Separator;
	unsigned long pMaschineNo;
	unsigned long pComment;
	unsigned long pVersion;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned char ErrorName;
	unsigned long FileLen;
	/* VAR (analog) */
	struct _csv_search_internal Internal;
	struct DTGetTime zzDTGetTime00000;
	unsigned char* SearchChar;
	plcbit* Dyn_Bool;
	unsigned char* Dyn_Usint;
	signed char* Dyn_Sint;
	unsigned short* Dyn_Uint;
	signed short* Dyn_Int;
	unsigned long* Dyn_Udint;
	signed long* Dyn_Dint;
	float* Dyn_Real;
	plcdt* Dyn_Date_and_Time;
	plctime* Dyn_Time;
	/* VAR_INPUT (digital) */
	plcbit FullNameLenght;
	plcbit FileHeader;
	/* VAR (digital) */
	plcbit OnlyOneVar;
} CSV_Search_typ;

typedef struct CSV_Init
{
	/* VAR_INPUT (analog) */
	unsigned long pStructName;
	unsigned char NumOfStructs;
	unsigned long Options;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned char ErrorName;
	unsigned long pStructMem;
	unsigned long MemCounter;
	/* VAR (analog) */
	struct _csv_init_Internal Internal;
	unsigned char* SearchChar;
	unsigned char* Dyn_Usint;
	signed char* Dyn_Sint;
	signed short* Dyn_Int;
	signed long* Dyn_Dint;
	unsigned short* Dyn_Uint;
	unsigned long* Dyn_Udint;
	float* Dyn_Real;
	plcdt* Dyn_Date_and_Time;
	plctime* Dyn_Time;
	/* VAR_INPUT (digital) */
	plcbit FullNameLenght;
	/* VAR (digital) */
	plcbit OnlyOneVar;
} CSV_Init_typ;

typedef struct CSV_ListFile
{
	/* VAR_INPUT (analog) */
	unsigned long pStringArray;
	unsigned long SizeStringArray;
	unsigned short ArrayNum;
	unsigned short NumListboxLines;
	unsigned long pFileDevice;
	unsigned long pPath;
	unsigned char MaxNameLenght;
	unsigned short SetFocusPos;
	unsigned char command;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short CSV_FileNum;
	unsigned short ListboxFocusPos;
	/* VAR (analog) */
	struct DirRead DirRead_01;
	struct DirInfo DirInfo_01;
	unsigned char TmpString[51];
	unsigned char Step;
	unsigned short i;
	plcstring TmpExtension[5];
	struct fiDIR_READ_DATA FileInfo;
	signed long result1;
	signed long result2;
	unsigned short FileNumAct;
	unsigned short FileNumOnDisk;
	unsigned long Offset;
	unsigned long pActName;
	struct DTStructure dateandtime;
	unsigned short UpLines;
	unsigned short DownLines;
	unsigned short PosFirstLine;
	struct CSV_ListFileOption_typ* OptionStruct;
	/* VAR_OUTPUT (digital) */
	plcbit ScrollUp;
	plcbit ScrollDown;
} CSV_ListFile_typ;

typedef struct SearchFileName
{
	/* VAR_INPUT (analog) */
	unsigned long pFileName;
	unsigned long pDevice;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned char step;
	plcstring FileName[41];
	unsigned char i;
	struct FileOpen FileOpen_01;
	struct FileClose FileClose_01;
	unsigned char* SearchChar;
} SearchFileName_typ;

typedef struct CSV_ReadFile
{
	/* VAR_INPUT (analog) */
	unsigned long pFileName;
	unsigned long pDevice;
	unsigned long pPath;
	unsigned char Separator;
	unsigned long Options;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned long LineCnt;
	unsigned long VarCnt;
	unsigned long ErrorLine;
	unsigned short ErrorNumber;
	unsigned long ErrorCnt;
	/* VAR (analog) */
	struct FileOpen FileOpen_CSV;
	struct FileRead FileRead_CSV;
	struct FileClose FileClose_CSV;
	struct _csv_read_internal Internal;
	unsigned char* Dyn_Usint;
	unsigned char* SearchChar;
	plcbit* Dyn_Bool;
	signed char* Dyn_Sint;
	unsigned short* Dyn_Uint;
	signed short* Dyn_Int;
	unsigned long* Dyn_Udint;
	signed long* Dyn_Dint;
	plcstring (*Dyn_String);
	float* Dyn_Real;
	plcdt* Dyn_Date_and_Time;
	plctime* Dyn_Time;
	unsigned char TestUsint;
	unsigned short temp_status;
	/* VAR_INPUT (digital) */
	plcbit No_DatatypControl;
	plcbit IgnoreError;
	/* VAR (digital) */
	plcbit Part;
} CSV_ReadFile_typ;

typedef struct ExListFile
{
	/* VAR_INPUT (analog) */
	unsigned long pStringArray;
	unsigned long SizeStringArray;
	unsigned short NumListboxLines;
	unsigned short ArrayNum;
	unsigned long pFileDevice;
	unsigned char MaxNameLenght;
	unsigned short SetFocusPos;
	unsigned char command;
	unsigned long pOptions;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	unsigned short CSV_FileNum;
	unsigned short ListboxFocusPos;
	/* VAR (analog) */
	struct _csv_exfilelist_internal Internal;
	struct DirInfo DirInfo_CSV;
	struct DirRead DirRead_CSV;
	struct FileOpen FileOpen_CSV;
	struct FileRead FileRead_CSV;
	struct FileClose FileClose_CSV;
	unsigned char* DynUsint;
	/* VAR_OUTPUT (digital) */
	plcbit ScrollUp;
	plcbit ScrollDown;
} ExListFile_typ;

typedef struct CSV_WriteFile
{
	/* VAR_INPUT (analog) */
	unsigned long pFileName;
	unsigned long pDevice;
	unsigned long pPath;
	unsigned long pStructMem;
	unsigned long MemLen;
	unsigned char Mode;
	/* VAR_OUTPUT (analog) */
	unsigned short status;
	/* VAR (analog) */
	unsigned char Step;
	struct FileCreate FileCreate_CSV;
	struct FileWrite FileWrite_CSV;
	struct FileDelete FileDelete_CSV;
	struct FileClose FileClose_CSV;
	plcstring FileName[81];
	unsigned char i;
	unsigned char* Dyn_Usint;
	struct DevMemInfo DevMemInfo_CSV;
	plcstring Path[101];
} CSV_WriteFile_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void CSV_CheckFile(struct CSV_CheckFile* inst);
_BUR_PUBLIC void CSV_InitCheckFile(struct CSV_InitCheckFile* inst);
_BUR_PUBLIC void CSV_Search(struct CSV_Search* inst);
_BUR_PUBLIC void CSV_Init(struct CSV_Init* inst);
_BUR_PUBLIC void CSV_ListFile(struct CSV_ListFile* inst);
_BUR_PUBLIC void SearchFileName(struct SearchFileName* inst);
_BUR_PUBLIC void CSV_ReadFile(struct CSV_ReadFile* inst);
_BUR_PUBLIC void ExListFile(struct ExListFile* inst);
_BUR_PUBLIC void CSV_WriteFile(struct CSV_WriteFile* inst);


#ifdef __cplusplus
};
#endif
#endif /* _CSV_FILE_ */

