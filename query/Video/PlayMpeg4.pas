unit PlayMpeg4;

interface

uses Windows;

//Max channel numbers
const PLAYM4_MAX_SUPPORTS = 500;
//Wave coef range;
  MIN_WAVE_COEF = -100;
  MAX_WAVE_COEF = 100;

//Timer type
  TIMER_1 = 1; //Only 16 timers for every process.Default TIMER;
  TIMER_2 = 2; //Not limit;But the precision less than TIMER_1;
//BUFFER TYPE
  BUF_VIDEO_SRC = 1;
  BUF_AUDIO_SRC = 2;
  BUF_VIDEO_RENDER = 3;
  BUF_AUDIO_RENDER = 4;

//Error code
  PLAYM4_NOERROR = 0; //no error
  PLAYM4_PARA_OVER = 1; //input parameter is invalid;
  PLAYM4_ORDER_ERROR = 2; //The order of the function to be called is error.
  PLAYM4_TIMER_ERROR = 3; //Create multimedia clock failed;
  PLAYM4_DEC_VIDEO_ERROR = 4; //Decode video data failed.
  PLAYM4_DEC_AUDIO_ERROR = 5; //Decode audio data failed.
  PLAYM4_ALLOC_MEMORY_ERROR = 6; //Allocate memory failed.
  PLAYM4_OPEN_FILE_ERROR = 7; //Open the file failed.
  PLAYM4_CREATE_OBJ_ERROR = 8; //Create thread or event failed
  PLAYM4_CREATE_DDRAW_ERROR = 9; //Create DirectDraw object failed.
  PLAYM4_CREATE_OFFSCREEN_ERROR = 10; //failed when creating off-screen surface.
  PLAYM4_BUF_OVER = 11; //buffer is overflow
  PLAYM4_CREATE_SOUND_ERROR = 12; //failed when creating audio device.
  PLAYM4_SET_VOLUME_ERROR = 13; //Set volume failed
  PLAYM4_SUPPORT_FILE_ONLY = 14; //The function only support play file.
  PLAYM4_SUPPORT_STREAM_ONLY = 15; //The function only support play stream.
  PLAYM4_SYS_NOT_SUPPORT = 16; //System not support.
  PLAYM4_FILEHEADER_UNKNOWN = 17; //No file header.
  PLAYM4_VERSION_INCORRECT = 18; //The version of decoder and encoder is not adapted.
  PLAYM4_INIT_DECODER_ERROR = 19; //Initialize decoder failed.
  PLAYM4_CHECK_FILE_ERROR = 20; //The file data is unknown.
  PLAYM4_INIT_TIMER_ERROR = 21; //Initialize multimedia clock failed.
  PLAYM4_BLT_ERROR = 22; //Blt failed.
  PLAYM4_UPDATE_ERROR = 23; //Update failed.
  PLAYM4_OPEN_FILE_ERROR_MULTI = 24; //openfile error, streamtype is multi
  PLAYM4_OPEN_FILE_ERROR_VIDEO = 25; //openfile error, streamtype is video
  PLAYM4_JPEG_COMPRESS_ERROR = 26; //JPEG compress error
  PLAYM4_EXTRACT_NOT_SUPPORT = 27; //Don't support the version of this file.
  PLAYM4_EXTRACT_DATA_ERROR = 28; //extract video data failed.
  PLAYM4_SECRET_KEY_ERROR = 29; //Secret key is error //add 20071218
//Max display regions.
  MAX_DISPLAY_WND = 4;

//Display type
  DISPLAY_NORMAL = 1;
  DISPLAY_QUARTER = 2;

//Display buffers
  MAX_DIS_FRAMES = 50;
  MIN_DIS_FRAMES = 6;

//Locate by
  BY_FRAMENUM = 1;
  BY_FRAMETIME = 2;

//Source buffer
  SOURCE_BUF_MAX = 1024 * 100000;
  SOURCE_BUF_MIN = 1024 * 50;

//Stream type
  STREAME_REALTIME = 0;
  STREAME_FILE = 1;

//frame type
  T_AUDIO16 = 101;
  T_AUDIO8 = 100;
  T_UYVY = 1;
  T_YV12 = 3;
  T_RGB32 = 7;

//capability
  SUPPORT_DDRAW = 1;
  SUPPORT_BLT = 2;
  SUPPORT_BLTFOURCC = 4;
  SUPPORT_BLTSHRINKX = 8;
  SUPPORT_BLTSHRINKY = 16;
  SUPPORT_BLTSTRETCHX = 32;
  SUPPORT_BLTSTRETCHY = 64;
  SUPPORT_SSE = 128;
  SUPPORT_MMX = 256;

// 以下宏定义用于HIK_MEDIAINFO结构
  FOURCC_HKMI = $484B4D49; // "HKMI" HIK_MEDIAINFO结构标记
// 系统封装格式
  SYSTEM_NULL = $0; // 没有系统层，纯音频流或视频流
  SYSTEM_HIK = $1; // 海康文件层
  SYSTEM_MPEG2_PS = $2; // PS封装
  SYSTEM_MPEG2_TS = $3; // TS封装
  SYSTEM_RTP = $4; // rtp封装

// 视频编码类型
  VIDEO_NULL = $0; // 没有视频
  VIDEO_H264 = $1; // 标准H.264和海康H.264都可以用这个定义
  VIDEO_MPEG4 = $3; // 标准MPEG4

// 音频编码类型
  AUDIO_NULL = $0000; // 没有音频
  AUDIO_ADPCM = $1000; // ADPCM
  AUDIO_MPEG = $2000; // MPEG 系列音频，解码器能自适应各种MPEG音频
// G系列音频
  AUDIO_G711_U = $7110;
  AUDIO_G711_A = $7111;
  AUDIO_G722_1 = $7221;
  AUDIO_G723_1 = $7231;
  AUDIO_G726 = $7260;
  AUDIO_G729 = $7290;

type
  LONG = Longint;

  TFrame_Pos = record
    nFilePos: Long;
    nFrameNum: Long;
    nFrameTime: Long;
    nErrorFrameNum: Long;
    pErrorTime: PSystemTime;
    nErrorLostFrameNum: long;
    nErrorFrameSize: long;
  end;
  PFrame_Pos = ^TFrame_Pos;

  TFrame_Info = record
    nWidth: Long;
    nHeight: Long;
    nStamp: Long;
    nType: Long;
    nFrameRate: Long;
    dwFrameNum: DWord;
  end;

  TFrame_Type = record
    pDataBuf: PChar;
    nSize: Long;
    nFrameNum: Long;
    bIsAudio: Boolean;
    nReserved: Long;
  end;

  TWaterMark_Info = record
    pDataBuf: PChar;
    nSize: Long;
    nFrameNum: Long;
    bRsaRight: Boolean;
    nReserved: Long;
  end;

  THik_MediaInfo = record
    media_fourcc: integer; // "HKMI": 0x484B4D49 Hikvision Media Information
    media_version: integer; // 版本号：指本信息结构版本号，目前为0x0101,即1.01版本，01：主版本号；01：子版本号。
    device_id: integer; // 设备ID，便于跟踪/分析

    system_format: integer; // 系统封装层
    video_format: integer; // 视频编码类型

    audio_format: integer; // 音频编码类型
    audio_channels: byte; // 通道数
    audio_bits_per_sample: byte; // 样位率
    audio_samplesrate: integer; // 采样率
    audio_bitrate: integer; // 压缩音频码率,单位：bit

    reserved: array[0..3] of integer; // 保留
  end;

  //Initialize DirecDraw.Now invalid.
function PlayM4_InitDDraw(hWnd: HWND): Boolean; stdcall;
//Release directDraw; Now invalid.
function PlayM4_RealeseDDraw(): Boolean; stdcall;

function PlayM4_OpenFile(nPort: Long; sFileName: LPSTR): Boolean; stdcall;
function PlayM4_CloseFile(nPort: Long): Boolean; stdcall;
function PlayM4_Play(nPort: Long; hWnd: HWND): Boolean; stdcall;
function PlayM4_Stop(nPort: Long): Boolean; stdcall;
function PlayM4_Pause(nPort: Long; nPause: DWORD): Boolean; stdcall;
function PlayM4_Fast(nPort: Long): Boolean; stdcall;
function PlayM4_Slow(nPort: Long): Boolean; stdcall;
function PlayM4_OneByOne(nPort: Long): Boolean; stdcall;
function PlayM4_SetPlayPos(nPort: Long; fRelativePos: Double): Boolean; stdcall;
function PlayM4_GetPlayPos(nPort: Long): Double; stdcall;
function PlayM4_SetFileEndMsg(nPort: Long; hWnd: HWND; nMsg: LongWord): Boolean; stdcall;
function PlayM4_SetVolume(nPort: Long; nVolume: Word): Boolean; stdcall;
function PlayM4_StopSound(): Boolean; stdcall;
function PlayM4_PlaySound(nPort: Long): Boolean; stdcall;
function PlayM4_OpenStream(nPort: Long; var pFileHeadBuf: Byte; nSize: DWORD; nBufPoolSize: DWORD): Boolean; stdcall;
function PlayM4_InputData(nPort: Long; var pBuf: Byte; nSize: DWORD): Boolean; stdcall;
function PlayM4_CloseStream(nPort: Long): Boolean; stdcall;
function PlayM4_GetCaps(): integer; stdcall;
function PlayM4_GetFileTime(nPort: Long): DWORD; stdcall;
function PlayM4_GetPlayedTime(nPort: Long): DWORD; stdcall;
function PlayM4_GetPlayedFrames(nPort: Long): DWORD; stdcall;

////////////////ver 2.0 added///////////////////////////////////////
type
  TDecCBFun = procedure(nPort: Long; var pBuf: char; nSize: Long; var pFrameInfo: TFrame_Info; nReserved1: Long; nReserved2: Long); stdcall;
  TDisplayCBFun = procedure(nPort: Long; var pBuf: char; nSize: Long; nWidth: Long; nHeight: Long;
    nStamp: Long; nType: Long; nReserved: Long); stdcall;

function PlayM4_SetDecCallBack(nPort: Long; DecCBFun: TDecCBFun): Boolean; stdcall;
function PlayM4_SetDisplayCallBack(nPort: Long; DisplayCBFun: TDisplayCBFun): Boolean; stdcall;
function PlayM4_ConvertToBmpFile(var pBuf: char; nSize: Long; nWidth: long;
  nHeight: long; nType: Long; var sFileName: char): Boolean; stdcall;

function PlayM4_GetFileTotalFrames(nPort: Long): DWord; stdcall;
function PlayM4_GetCurrentFrameRate(nPort: long): DWord; stdcall;
function PlayM4_GetPlayedTimeEx(nPort: Long): DWord; stdcall;
function PlayM4_SetPlayedTimeEx(nPort: Long; nTime: DWORD): Boolean; stdcall;
function PlayM4_GetCurrentFrameNum(nPort: Long): DWORD; stdcall;
function PlayM4_SetStreamOpenMode(nPort: Long; nMode: DWORD): Boolean; stdcall;
function PlayM4_GetFileHeadLength(): DWORD; stdcall;
function PlayM4_GetSdkVersion(): DWORD; stdcall;

////////////////ver 2.2 added///////////////////////////////////////
function PlayM4_GetLastError(nPort: Long): DWORD; stdcall;
function PlayM4_RefreshPlay(nPort: Long): Boolean; stdcall;
function PlayM4_SetOverlayMode(nPort: Long; bOverlay: Boolean; colorKey: COLORREF): Boolean; stdcall;
function PlayM4_GetPictureSize(nPort: Long; var pWidth: Long; var pHeight: Long): Boolean; stdcall;
function PlayM4_SetPicQuality(nPort: Long; bHighQuality: Boolean): Boolean; stdcall;
function PlayM4_PlaySoundShare(nPort: Long): Boolean; stdcall;
function PlayM4_StopSoundShare(nPort: Long): Boolean; stdcall;

////////////////ver 2.4 added///////////////////////////////////////
function PlayM4_GetStreamOpenMode(nPort: Long): Long; stdcall;
function PlayM4_GetOverlayMode(nPort: Long): Long; stdcall;
function PlayM4_GetColorKey(nPort: Long): ColorRef; stdcall;
function PlayM4_GetVolume(nPort: Long): Word; stdcall;
function PlayM4_GetPictureQuality(nPort: Long; var bHighQuality: Boolean): Boolean; stdcall;
function PlayM4_GetSourceBufferRemain(nPort: Long): DWord; stdcall;
function PlayM4_ResetSourceBuffer(nPort: Long): Boolean; stdcall;

type
  TSourceBufCallback = procedure(nPort: Long; nBufSize: DWord; dwUser: DWord; var pReserved: integer); stdcall;
function PlayM4_SetSourceBufCallBack(nPort: Long; nThreShold: DWORD; SourceBufCallBack: TSourceBufCallBack;
  dwUser: DWORD; var pReserved: integer): Boolean; stdcall;

function PlayM4_ResetSourceBufFlag(nPort: Long): Boolean; stdcall;
function PlayM4_SetDisplayBuf(nPort: Long; nNum: DWORD): Boolean; stdcall;
function PlayM4_GetDisplayBuf(nPort: Long): DWOrd; stdcall;
function PlayM4_OneByOneBack(nPort: Long): Boolean; stdcall;

type
  TFileRefDone = procedure(nPort: DWORD; nUser: DWORD); stdcall;
function PlayM4_SetFileRefCallBack(nPort: Long; pFileRefDone: TFileRefDone; nUser: DWORD): Boolean; stdcall;
function PlayM4_SetCurrentFrameNum(nPort: Long; nFrameNum: DWORD): Boolean; stdcall;
function PlayM4_GetKeyFramePos(nPort: Long; nValue: DWORD; nType: DWORD; var pFramePos: TFRAME_POS): Boolean; stdcall;
function PlayM4_GetNextKeyFramePos(nPort: Long; nValue: DWORD; nType: DWORD; var pFramePos: TFRAME_POS): Boolean; stdcall;
//# if (WINVER >= 0 x0400)
//Note: These funtion must be builded under win2000 or above with Microsoft Platform sdk.
//	    You can download the sdk from "http://www.microsoft.com/msdownload/platformsdk/sdkupdate/";
function PlayM4_InitDDrawDevice(): Boolean; stdcall;
procedure PlayM4_ReleaseDDrawDevice(); stdcall;
function PlayM4_GetDDrawDeviceTotalNums(): DWORD; stdcall;
function PlayM4_SetDDrawDevice(nPort: Long; nDeviceNum: DWORD): Boolean; stdcall;
{function PlayM4_GetDDrawDeviceInfo(nDeviceNum: DWORD; lpDriverDescription: LPSTR;
  nDespLen: DWORD; lpDriverName: LPSTR; nNameLen: DWORD;
  var hhMonitor: HMONITOR): Boolean; stdcall;    }
function PlayM4_GetCapsEx(nDDrawDeviceNum: DWORD): integer; stdcall;
//#E ndif
function PlayM4_ThrowBFrameNum(nPort: long; nNum: DWORD): Boolean; stdcall;

////////////////ver 2.5 added///////////////////////////////////////
function PlayM4_SetDisplayType(nPort: Long; nType: Long): Boolean; stdcall;
function PlayM4_GetDisplayType(nPort: Long): long; stdcall;
function PlayM4_SyncToAudio(nPort: long; bSyncToAudio: Boolean): Boolean; stdcall;

////////////////ver 3.0 added///////////////////////////////////////
function PlayM4_SetDecCBStream(nPort: Long; nStream: DWORD): Boolean; stdcall;
function PlayM4_SetDisplayRegion(nPort: LONG; nRegionNum: DWORD;
  var pSrcRect: TRECT; hDestWnd: HWND; bEnable: Boolean): Boolean; stdcall;
function PlayM4_RefreshPlayEx(nPort: Long; nRegionNum: DWORD): Boolean; stdcall;
//# if (WINVER >= 0 x0400)
//Note: The funtion must be builded under win2000 or above with Microsoft Platform sdk.
//	    You can download the sdk from http://www.microsoft.com/msdownload/platformsdk/sdkupdate/;
function PlayM4_SetDDrawDeviceEx(nPort: Long; nRegionNum: DWORD; nDeviceNum: DWORD): Boolean; stdcall;
//#E ndif
/////////////////v3.2 added/////////////////////////////////////////

function PlayM4_GetRefValue(nPort: Long; var pBuffer: Byte; var pSize: DWORD): Boolean; stdcall;
function PlayM4_SetRefValue(nPort: Long; var pBuffer: BYTE; nSize: DWORD): Boolean; stdcall;
function PlayM4_OpenStreamEx(nPort: Long; var pFileHeadBuf: BYTE; nSize: DWORD; nBufPoolSize: DWORD): Boolean; stdcall;
function PlayM4_CloseStreamEx(nPort: Long): Boolean; stdcall;
function PlayM4_InputVideoData(nPort: Long; var pBuf: Byte; nSize: DWORD): Boolean; stdcall;
function PlayM4_InputAudioData(nPort: Long; var pBuf: Byte; nSize: DWORD): Boolean; stdcall;
type
  TDrawFun = procedure(nPort: Long; hDc: HDC; nUser: Long); stdcall;
function PlayM4_RegisterDrawFun(nPort: Long; DrawFun: TDrawFun; nUser: Long): Boolean; stdcall;
//////////////////v3.4/////////////////////////////////////////////////////
function PlayM4_SetTimerType(nPort: Long; nTimerType: DWORD; nReserved: DWORD): Boolean; stdcall;
function PlayM4_GetTimerType(nPort: Long; var pTimerType: DWORD; var pReserved: DWORD): Boolean; stdcall;
function PlayM4_ResetBuffer(nPort: Long; nBufType: DWORD): Boolean; stdcall;
function PlayM4_GetBufferValue(nPort: Long; nBufType: DWORD): DWord; stdcall;
//////////////////V3.6/////////////////////////////////////////////////////////
function PlayM4_AdjustWaveAudio(nPort: Long; nCoefficient: Long): Boolean; stdcall;

type
  TfunVerify = procedure(nPort: long; var pFilePos: TFrame_Pos; bIsVideo: DWORD; nUser: DWORD); stdcall;
function PlayM4_SetVerifyCallBack(nPort: Long; nBeginTime: DWORD; nEndTime: DWORD;
  funVerify: TfunVerify; nUser: DWORD): Boolean; stdcall;

type
  TfunAudio = procedure(nPort: Long; var pAudioBuf: char; nSize: Long; nStamp: Long; nType: Long; nUser: Long); stdcall;
function PlayM4_SetAudioCallBack(nPort: Long; funAudio: TfunAudio; nUser: Long): Boolean; stdcall;

type
  TfunEncChange = procedure(nPort: Long; nUser: Long); stdcall;
function PlayM4_SetEncTypeChangeCallBack(nPort: Long; funEncChange: TfunEncChange; nUser: Long): Boolean; stdcall;

function PlayM4_SetColor(nPort: Boolean; nRegionNum: DWORD;
  nBrightness: integer; nContrast: integer;
  nSaturation: integer; nHue: integer): Boolean; stdcall;
function PlayM4_GetColor(nPort: Long; nRegionNum: DWORD;
  var pBrightness: integer; var pContrast: integer;
  var pSaturation: integer; var pHue: integer): Boolean; stdcall;
function PlayM4_SetEncChangeMsg(nPort: long; hWnd: HWND; nMsg: LongWord): Boolean; stdcall;

type
  TfunGetOriginalFrame = procedure(nPort: Long; var frameType: TFrame_Type; nUser: Long); stdcall;
function PlayM4_GetOriginalFrameCallBack(nPort: Long; bIsChange: Boolean;
  bNormalSpeed: Boolean; nStartFrameNum: Long;
  nStartStamp: Long; nFileHeader: Long;
  funGetOrignalFrame: TfunGetOriginalFrame; nUser: Long): Boolean; stdcall;

function PlayM4_GetFileSpecialAttr(nPort: Long; var pTimeStamp: DWORD;
  var pFileNum: DWORD; var pReserved: DWORD): Boolean; stdcall;

function PlayM4_GetSpecialData(nPort: Long): DWORD; stdcall;

type
  TfunCheckWaterMark = procedure(nPort: Long; var pWaterMarkInfo: TWaterMark_Info; nUser: DWORD); stdcall;
  TfunThrowBFrame = procedure(nPort: Long; nBFrame: DWORD; nUser: DWORD); stdcall;
  TfunGetUserData = procedure(nPort: long; var pUserBuf: Byte; nBufLen: DWORD; nUser: DWORD); stdcall;

function PlayM4_SetCheckWatermarkCallBack(nPort: Long;
  funCheckWatermark: TfunCheckWaterMark; nUser: DWORD): Boolean; stdcall;
function PlayM4_SetImageSharpen(nPort: Long; nLevel: DWORD): Boolean; stdcall;
function PlayM4_GetThrowBFrameCallBack(nPort: Long;
  funThrowBFrame: TfunThrowBFrame; nUser: DWORD): Boolean; stdcall;
function PlayM4_SetDecodeFrameType(nPort: Long; nFrameType: DWORD): Boolean; stdcall;
function PlayM4_SetPlayMode(nPort: Long; bNormal: Boolean): Boolean; stdcall;
function PlayM4_SetGetUserDataCallBack(nPort: Long; funGetUserData: TfunGetUserData; nUser: DWord): Boolean; stdcall;
function PlayM4_SetOverlayFlipMode(nPort: Long; bTrue: Boolean): Boolean; stdcall;
function PlayM4_GetAbsFrameNum(nPort: Long): DWORD; stdcall;

//////////////////V4.7.0.0//////////////////////////////////////////////////////
////convert yuv to jpeg
function PlayM4_ConvertToJpegFile(var pBuf: char; nSize: Long; nWidth: Long;
  nHeight: Long; nType: Long; var sFileName: char): Boolean; stdcall;
function PlayM4_SetJpegQuality(nQuality: Long): Boolean; stdcall;
//set deflash
function PlayM4_SetDeflash(nPort: Long; bDefalsh: Boolean): Boolean; stdcall;

function PlayM4_SetDecCallBackEx(nPort: Long; DecCBFun: TDecCBFun; var pDest: char; nDestSize: Long): Boolean; stdcall;
//////////////////V4.8.0.0/////////////////////////////////////////////////////////
//check discontinuous frame number as error data?
function PlayM4_CheckDiscontinuousFrameNum(nPort: Long; bCheck: Boolean): Boolean; stdcall;
//get bmp or jpeg
function PlayM4_GetBMP(nPort: long; var pBitmap: byte; nBufSize: DWORD; var pBmpSize: DWORD): Boolean; stdcall;
function PlayM4_GetJPEG(nPort: long; var pJpeg: byte; nBufSize: DWORD; var pJpegSize: DWORD): Boolean; stdcall;
//dec call back mend
function PlayM4_SetDecCallBackMend(nPort: long; DecCBFun: TDecCBFun; nUser: long): Boolean; stdcall;

function PlayM4_SetSecretKey(nPort: long; lKeyType: Long; var pSecretKey: char; lKeyLen: Long): Boolean; stdcall;

// add by gb 2007-12-23
type
  TFileEndCallBack = procedure(nPort: Long; var pUser: integer); stdcall;
function PlayM4_SetFileEndCallback(nPort: long; FileEndCallback: TFileEndCallBack;
  var pUser: integer): Boolean; stdcall;

// add by gb 080131 version 4.9.0.1
function PlayM4_GetPort(var nPort: long): Boolean; stdcall;
function PlayM4_FreePort(nPort: long): Boolean; stdcall;

implementation

function PlayM4_InitDDraw; stdcall; external 'PlayCtrl.dll' name 'PlayM4_InitDDraw';

function PlayM4_RealeseDDraw; stdcall; external 'PlayCtrl.dll' name 'PlayM4_RealeseDDraw';

function PlayM4_OpenFile; stdcall; external 'PlayCtrl.dll' name 'PlayM4_OpenFile';

function PlayM4_CloseFile; stdcall; external 'PlayCtrl.dll' name 'PlayM4_CloseFile';

function PlayM4_Play; stdcall; external 'PlayCtrl.dll' name 'PlayM4_Play';

function PlayM4_Stop; stdcall; external 'PlayCtrl.dll' name 'PlayM4_Stop';

function PlayM4_Pause; stdcall; external 'PlayCtrl.dll' name 'PlayM4_Pause';

function PlayM4_Fast; stdcall; external 'PlayCtrl.dll' name 'PlayM4_Fast';

function PlayM4_Slow; stdcall; external 'PlayCtrl.dll' name 'PlayM4_Slow';

function PlayM4_OneByOne; stdcall; external 'PlayCtrl.dll' name 'PlayM4_OneByOne';

function PlayM4_SetPlayPos; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetPlayPos';

function PlayM4_GetPlayPos; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPlayPos';

function PlayM4_SetFileEndMsg; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetFileEndMsg';

function PlayM4_SetVolume; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetVolume';

function PlayM4_StopSound; stdcall; external 'PlayCtrl.dll' name 'PlayM4_StopSound';

function PlayM4_PlaySound; stdcall; external 'PlayCtrl.dll' name 'PlayM4_PlaySound';

function PlayM4_OpenStream; stdcall; external 'PlayCtrl.dll' name 'PlayM4_OpenStream';

function PlayM4_InputData; stdcall; external 'PlayCtrl.dll' name 'PlayM4_InputData';

function PlayM4_CloseStream; stdcall; external 'PlayCtrl.dll' name 'PlayM4_CloseStream';

function PlayM4_GetCaps; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetCaps';

function PlayM4_GetFileTime; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetFileTime';

function PlayM4_GetPlayedTime; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPlayedTime';

function PlayM4_GetPlayedFrames; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPlayedFrames';

function PlayM4_SetDecCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDecCallBack';

function PlayM4_SetDisplayCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDisplayCallBack';

function PlayM4_ConvertToBmpFile; stdcall; external 'PlayCtrl.dll' name 'PlayM4_ConvertToBmpFile';

function PlayM4_GetFileTotalFrames; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetFileTotalFrames';

function PlayM4_GetCurrentFrameRate; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetCurrentFrameRate';

function PlayM4_GetPlayedTimeEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPlayedTimeEx';

function PlayM4_SetPlayedTimeEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetPlayedTimeEx';

function PlayM4_GetCurrentFrameNum; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetCurrentFrameNum';

function PlayM4_SetStreamOpenMode; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetStreamOpenMode';

function PlayM4_GetFileHeadLength; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetFileHeadLength';

function PlayM4_GetSdkVersion; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetSdkVersion';

function PlayM4_GetLastError; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetLastError';

function PlayM4_RefreshPlay; stdcall; external 'PlayCtrl.dll' name 'PlayM4_RefreshPlay';

function PlayM4_SetOverlayMode; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetOverlayMode';

function PlayM4_GetPictureSize; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPictureSize';

function PlayM4_SetPicQuality; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetPicQuality';

function PlayM4_PlaySoundShare; stdcall; external 'PlayCtrl.dll' name 'PlayM4_PlaySoundShare';

function PlayM4_StopSoundShare; stdcall; external 'PlayCtrl.dll' name 'PlayM4_StopSoundShare';

function PlayM4_GetStreamOpenMode; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetStreamOpenMode';

function PlayM4_GetOverlayMode; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetOverlayMode';

function PlayM4_GetColorKey; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetColorKey';

function PlayM4_GetVolume; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetVolume';

function PlayM4_GetPictureQuality; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPictureQuality';

function PlayM4_GetSourceBufferRemain; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetSourceBufferRemain';

function PlayM4_ResetSourceBuffer; stdcall; external 'PlayCtrl.dll' name 'PlayM4_ResetSourceBuffer';

function PlayM4_SetSourceBufCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetSourceBufCallBack';

function PlayM4_ResetSourceBufFlag; stdcall; external 'PlayCtrl.dll' name 'PlayM4_ResetSourceBufFlag';

function PlayM4_SetDisplayBuf; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDisplayBuf';

function PlayM4_GetDisplayBuf; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetDisplayBuf';

function PlayM4_OneByOneBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_OneByOneBack';

function PlayM4_SetFileRefCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetFileRefCallBack';

function PlayM4_SetCurrentFrameNum; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetCurrentFrameNum';

function PlayM4_GetKeyFramePos; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetKeyFramePos';

function PlayM4_GetNextKeyFramePos; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetNextKeyFramePos';

function PlayM4_InitDDrawDevice; stdcall; external 'PlayCtrl.dll' name 'PlayM4_InitDDrawDevice';

procedure PlayM4_ReleaseDDrawDevice; stdcall; external 'PlayCtrl.dll' name ' PlayM4_ReleaseDDrawDevice';

function PlayM4_GetDDrawDeviceTotalNums; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetDDrawDeviceTotalNums';

function PlayM4_SetDDrawDevice; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDDrawDevice';

function PlayM4_GetCapsEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetCapsEx';

function PlayM4_ThrowBFrameNum; stdcall; external 'PlayCtrl.dll' name 'PlayM4_ThrowBFrameNum';

function PlayM4_SetDisplayType; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDisplayType';

function PlayM4_GetDisplayType; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetDisplayType';

function PlayM4_SyncToAudio; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SyncToAudio';

function PlayM4_SetDecCBStream; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDecCBStream';

function PlayM4_SetDisplayRegion; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDisplayRegion';

function PlayM4_RefreshPlayEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_RefreshPlayEx';

function PlayM4_SetDDrawDeviceEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDDrawDeviceEx';

function PlayM4_GetRefValue; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetRefValue';

function PlayM4_SetRefValue; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetRefValue';

function PlayM4_OpenStreamEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_OpenStreamEx';

function PlayM4_CloseStreamEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_CloseStreamEx';

function PlayM4_InputVideoData; stdcall; external 'PlayCtrl.dll' name 'PlayM4_InputVideoData';

function PlayM4_InputAudioData; stdcall; external 'PlayCtrl.dll' name 'PlayM4_InputAudioData';

function PlayM4_RegisterDrawFun; stdcall; external 'PlayCtrl.dll' name 'PlayM4_RegisterDrawFun';

function PlayM4_SetTimerType; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetTimerType';

function PlayM4_GetTimerType; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetTimerType';

function PlayM4_ResetBuffer; stdcall; external 'PlayCtrl.dll' name 'PlayM4_ResetBuffer';

function PlayM4_GetBufferValue; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetBufferValue';

function PlayM4_AdjustWaveAudio; stdcall; external 'PlayCtrl.dll' name 'PlayM4_AdjustWaveAudio';

function PlayM4_SetVerifyCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetVerifyCallBack';

function PlayM4_SetAudioCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetAudioCallBack';

function PlayM4_SetEncTypeChangeCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetEncTypeChangeCallBack';

function PlayM4_SetColor; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetColor';

function PlayM4_GetColor; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetColor';

function PlayM4_SetEncChangeMsg; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetEncChangeMsg';

function PlayM4_GetOriginalFrameCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetOriginalFrameCallBack';

function PlayM4_GetFileSpecialAttr; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetFileSpecialAttr';

function PlayM4_GetSpecialData; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetSpecialData';

function PlayM4_SetCheckWatermarkCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetCheckWatermarkCallBack';

function PlayM4_SetImageSharpen; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetImageSharpen';

function PlayM4_GetThrowBFrameCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetThrowBFrameCallBack';

function PlayM4_SetDecodeFrameType; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDecodeFrameType';

function PlayM4_SetPlayMode; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetPlayMode';

function PlayM4_SetGetUserDataCallBack; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetGetUserDataCallBack';

function PlayM4_SetOverlayFlipMode; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetOverlayFlipMode';

function PlayM4_GetAbsFrameNum; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetAbsFrameNum';

function PlayM4_ConvertToJpegFile; stdcall; external 'PlayCtrl.dll' name 'PlayM4_ConvertToJpegFile';

function PlayM4_SetJpegQuality; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetJpegQuality';

function PlayM4_SetDeflash; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDeflash';

function PlayM4_SetDecCallBackEx; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDecCallBackEx';

function PlayM4_CheckDiscontinuousFrameNum; stdcall; external 'PlayCtrl.dll' name 'PlayM4_CheckDiscontinuousFrameNum';

function PlayM4_GetBMP; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetBMP';

function PlayM4_GetJPEG; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetJPEG';

function PlayM4_SetDecCallBackMend; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetDecCallBackMend';

function PlayM4_SetSecretKey; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetSecretKey';

function PlayM4_SetFileEndCallback; stdcall; external 'PlayCtrl.dll' name 'PlayM4_SetFileEndCallback';

function PlayM4_GetPort; stdcall; external 'PlayCtrl.dll' name 'PlayM4_GetPort';

function PlayM4_FreePort; stdcall; external 'PlayCtrl.dll' name 'PlayM4_FreePort';

end.

