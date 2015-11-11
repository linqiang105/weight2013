unit DecodeCardSdk;
///////////////////////////////////////////////////////////////////////////
// DS-40xxHC/HF BOARD SYSTEM SDK					 //
///////////////////////////////////////////////////////////////////////////

interface

uses Windows, DataType;

const
  ERR_WAIT_TIMEOUT = $C0000001;
  ERR_INVALID_HANDLE = $C0000002;
  ERR_INVALID_ARGUMENT = $C0000003;
  ERR_DDRAW_CREATE_FAILED = $C0000004;
  ERR_DDRAW_CAPS_FAULT = $C0000005;
  ERR_SET_COOPERATIVELEVEL_FAILED = $C0000006;
  ERR_PRIMARY_SURFACE_CREATE_FAILED = $C0000007;
  ERR_GET_OVERLAY_ADDRESS_FAILED = $C0000008;
  ERR_OVERLAY_SURFACE_CREATE_FAILED = $C0000009;
  ERR_OVERLAY_UPDATE_FAILED = $C000000A;
  ERR_TMMAN_FAILURE = $C000000B;
  ERR_CHANNELMAGIC_MISMATCH = $C000000C;
  ERR_CALLBACK_REGISTERED = $C000000D;
  ERR_QUEUE_OVERFLOW = $C000000E;
  ERR__STREAM_THREAD_FAILURE = $C000000F;
  ERR_THREAD_STOP_ERROR = $C0000010;
  ERR_NOT_SUPPORT = $C0000011;
  ERR_OUTOF_MEMORY = $C0000012;
  ERR_DSP_BUSY = $C0000013;
  ERR_DATA_ERROR = $C0000014;
  ERR_KERNEL = $C0000016;
  ERR_OFFSCREEN_CREATE_FAILED = $C0000017;
  ERR_MULTICLOCK_FAILURE = $C0000018;
  ERR_INVALID_DEVICE = $C0000019;
  ERR_INVALID_DRIVER = $C000001A;
  ERR_OFFSCREEN_BLT_FAILED = $C000001B;
  ERR_ORDER = $C000001C;
  ERR_DDRAW_NONE = $C000001D;
  ERR_DDRAW7_UNSUPPORT = $C000001E;
  ERR_GLOBAL_OVE_FAILED = $C000001F;
  ERR_DDRAW_GENERAL = $C0000020;
  //error code for MD card
  HWERR_SUCCESS = 0;
  HWERR_ALLOCATE_MEMORY = $C1000001;
  HWERR_INVALID_HANDLE = $C1000002;
  HWERR_DDRAW_CREATE_FAILED = $C1000003;
  HWERR_DDRAW_CAPS_FAULT = $C1000004;
  HWERR_SET_COOPERATIVELEVEL_FAILED = $C1000005;
  HWERR_PRIMARY_SURFACE_CREATE_FAILED = $C1000006;
  HWERR_OVERLAY_CREATE_FAILED = $C1000007;
  HWERR_GET_OVERLAY_ADDRESS_FAILED = $C1000008;
  HWERR_OVERLAY_UPDATE_FAILED = $C1000009;
  HWERR_SURFACE_NULL = $C100000A;
  HWERR_FILEHEADER_UNKNOWN = $C100000B;
  HWERR_CREATE_FILE_FAILED = $C100000C;
  HWERR_FILE_SIZE_ZERO = $C100000D;
  HWERR_FILE_SIZE_INVALID = $C100000E;
  HWERR_CREATE_OBJ_FAILED = $C100000F;
  HWERR_CHANNELMAGIC_MISMATCH = $C1000010;
  HWERR_PARA_OVER = $C1000011;
  HWERR_ORDER = $C1000012;
  HWERR_COMMAND = $C1000013;
  HWERR_UNSUPPORTED = $C1000014;
  HWERR_DSPOPEN = $C1000015;
  HWERR_DSPLOAD = $C1000016;
  HWERR_ALLOCATE_DSPMEMORY = $C1000017;
  HWERR_DSPCHECHER = $C1000018;
  HWERR_IMGFILE_UNKNOWN = $C1000019;
  HWERR_INVALID_FILE = $C100001A;
  HWERR_OFFSCREEN_CREATE_FAILED = $C100001B;
  HWERR_OFFSCREEN_BLT_FAILED = $C100001C;
  HWERR_DDRAW_NONE = $C100001D;
  HWERR_DDRAW7_UNSUPPORT = $C100001E;
  HWERR_GLOBAL_OVE_FAILED = $C100001F;
  HWERR_DDRAW_GENERAL = $C1000020;
  //standart
  HW_PAL = 2;
  HW_NTSC = 1;
  //jump direction
  HW_JUMP_FORWARD = 309;
  HW_JUMP_BACKWARD = 310;

type TTypeVideoFormat = (
    vdfRGB8A_233 = $00000001,
    vdfRGB8R_332 = $00000002,
    vdfRGB15Alpha = $00000004,
    vdfRGB16 = $00000008,
    vdfRGB24 = $00000010,
    vdfRGB24Alpha = $00000020,
    vdfYUV420Planar = $00000040,
    vdfYUV422Planar = $00000080,
    vdfYUV411Planar = $00000100,
    vdfYUV420Interspersed = $00000200,
    vdfYUV422Interspersed = $00000400,
    vdfYUV411Interspersed = $00000800,
    vdfYUV422Sequence = $00001000,
    vdfYUV422SequenceAlpha = $00002000,
    vdfMono = $00004000,
    vdfYUV444Planar = $00008000
    );

type
  TBitrateControlType = (
    brCBR = 0,
    brVBR = 1
    );

type TBOARD_TYPE_DS = (
    DS400XM = 0, //M卡
    DS400XH = 1, //H卡
    DS4004HC = 2, //4004HC
    DS4008HC = 3, //4008HC
    DS4016HC = 4, //4016HC
    DS4001HF = 5, //4001HF
    DS4004HF = 6, //4004HF
    DS4002MD = 7, //4002MD
    DS4004MD = 8, //4004MD
    DS4016HCS = 9, //4016HCS
    DS4002HT = 10, //4002HT
    DS4004HT = 11, //4004HT
    DS4008HT = 12, //4008HT
    DS4004HC_PLUS = 13, //4004HC+
    DS4008HC_PLUS = 14, //4008HC+
    DS4016HC_PLUS = 15, //4016HC+
    DS4008HF = 16, //4008HF
    DS4008MD = 17, //4008MD
    DS4008HS = 18, //4008HS
    DS4016HS = 19, //4016HS

    DS4108HCV = 20, //4108HCV
    DS4116HCV = 21, //4116HCV
    DS5016HC = 22,

    DS4208HFV = 23,
    DS4216HC = 24,
    DS4216HFV = 25,

    INVALID_BOARD_TYPE = $FFFFFFFF
    );

const STREAM_TYPE_VIDEO = 1; //视频流
  STREAM_TYPE_AUDIO = 2; //音频流
  STREAM_TYPE_AVSYNC = 3; //音视频同步流

type
  TDrawFun = procedure(nport: Integer; hDc: HDC; nUser: Integer); stdcall;

  TLogRecord_CallBack = procedure(var str: char;
    var context: integer); stdcall;

  TStream_Read_CallBack = function(ChannelNumber: integer;
    var Context: integer): Integer; stdcall;

  TStream_Direct_Read_CallBack = function(ChannelNum: Integer;
    Databuf: array of byte;
    Length: DWORD;
    frameType: TFrameType;
    var context: byte): Integer; cdecl;

type tagChannelCapability = record
    bAudioPreview: byte;
    bAlarmIO: byte;
    bWatchDog: byte;
  end;
  TChannel_Capability = tagChannelCapability;
  PChannel_Capability = ^TChannel_Capability;

type tagFrameStatistics = record
    VideoFrames: LongWord;
    AudioFrames: LongWord;
    FramesLost: LongWord;
    QueueOverFlow: LongWord;
  end;
  TFrames_Statistics = tagFrameStatistics;
  PFrames_Statistics = ^TFrames_Statistics;

function InitDSPs(): integer; stdcall;
function DeInitDSPs(): integer; stdcall;
function ChannelOpen(ChannelNum: integer): integer; stdcall;
function ChannelClose(hChannelHandle: integer): integer; stdcall;
function GetTotalChannels(): integer; stdcall;
function GetTotalDSPs(): integer; stdcall;
function StartVideoPreview(hChannelHandle: integer;
  WndHandle: HWND;
  var rect: TRect;
  bOverlay: Boolean;
  VideoFormat: TTypeVideoFormat;
  FrameRate: integer): integer; stdcall;
function StopVideoPreview(hChannelHandle: integer): integer; stdcall;
function SetVideoPara(hChannelHandle: integer;
  Brightness: integer;
  Contrast: integer;
  Saturation: integer;
  Hue: integer): integer; stdcall;
function GetVideoPara(hChannelHandle: integer;
  var VideoStandard: TVideoStandard;
  var Brightness: integer; var Contrast: integer;
  var Saturation: integer; var Hue: integer): integer; stdcall;
function GetVideoSignal(hChannelHandle: integer): integer; stdcall;
function GetSDKVersion(var VersionInfo: TVERSION_INFO): integer; stdcall;
function GetCapability(hChannelHandle: integer;
  var CapabilityTCHANNEL_CAPABILITY): integer; stdcall;
function GetLastErrorNum(hChannelHandle: integer;
  var DspError: LongWord; var SdkError: LongWord): integer; stdcall;
function SetStreamType(hChannelHandle: Integer;
  types: integer): integer; stdcall;
function GetStreamType(hChannelHandle: integer;
  var StreamType: integer): integer; stdcall;
function GetFramesStatistics(hChannelHandle: integer;
  var framesStatistics: TFRAMES_STATISTICS): integer; stdcall;
function StartMotionDetection(hChannelHandle: integer): integer; stdcall;
function GetBoardInfo(hChannelHandle: integer;
  var BoardType: LongWord; var SerialNo: byte): integer; stdcall;
function StopMotionDetection(hChannelHandle: integer): integer; stdcall;
function GetOriginalImage(hChannelHandle: integer;
  var ImageBuf: byte; var Size: byte): integer; stdcall;
function RegisterLogRecordCallback(LogRecordFunc: TLOGRECORD_CALLBACK;
  var Context: integer): integer; stdcall;
function SetAudioPreview(hChannelHandle: integer; bEnable: Boolean): integer; stdcall;
function ReadStreamData(hChannelHandle: integer; var DataBuf: integer;
  var Length: DWORD; var FrameType: integer): integer; stdcall;
function RegisterMessageNotifyHandle(hWnd: HWND;
  MessageId: integer): integer; stdcall;
function StartVideoCapture(hChannelHandle: integer): integer; stdcall;
function StopVideoCapture(hChannelHandle: integer): integer; stdcall;
function SetIBPMode(hChannelHandle: integer;
  KeyFrameIntervals: integer; BFrames: integer;
  PFrames: integer; FrameRate: integer): integer; stdcall;
function SetDefaultQuant(hChannelHandle: integer;
  IQuantVal: integer; PQuantVal: integer;
  BQuantVal: integer): integer; stdcall;
function SetOsd(hChannelHandle: integer;
  Enable: Boolean): integer; stdcall;

function SetLogo(hChannelHandle: integer;
  x: integer; y: integer;
  w: integer; h: integer;
  var yuv: byte): integer; stdcall;
function StopLogo(hChannelHandle: integer): integer; stdcall;
function SetupMotionDetection(hChannelHandle: integer;
  var RectList: TRect; iAreas: integer): integer; stdcall;
function MotionAnalyzer(hChannelHandle: integer;
  var MotionData: char; iThreshold: integer;
  var iResult: integer): integer; stdcall;
function LoadYUVFromBmpFile(var FileName: char;
  var yuv: byte;
  BufLen: integer; var Width: integer;
  var Height: integer): integer; stdcall;
function SaveYUVToBmpFile(var FileName: char;
  var yuv: byte;
  Width: integer; Height: integer): integer; stdcall;
function CaptureIFrame(hChannelHandle: integer): integer; stdcall;
function RegisterStreamReadCallback(StreamReadCallback: TSTREAM_READ_CALLBACK;
  var Context: integer): integer; stdcall;
function AdjustMotionDetectPrecision(hChannelHandle: integer;
  iGrade: integer; iFastMotionDetectFps: integer;
  iSlowMotionDetectFps: integer): integer; stdcall;
function SetupBitrateControl(hChannelHandle: integer;
  MaxBps: LongWord): integer; stdcall;
function SetOverlayColorKey(DestColorKey: COLORREF): integer; stdcall;
function SetOsdDisplayMode(hChannelHandle: integer;
  Brightness: integer; Translucent: Boolean;
  parameter: integer; var Format1: byte;
  var Format2: byte): integer; stdcall;
function SetLogoDisplayMode(hChannelHandle: integer;
  ColorKey: COLORREF; Translucent: Boolean;
  TwinkleInterval: integer): integer; stdcall;
function SetEncoderPictureFormat(hChannelHandle: integer;
  PictureFormat: TPictureFormat): integer; stdcall;
function SetVideoStandard(hChannelHandle: integer;
  VideoStandard: TVideoStandard): integer; stdcall;
function RestoreOverlay(): integer; stdcall;
function ResetDSP(DspNumber: integer): integer; stdcall;
function GetSoundLevel(hChannelHandle: integer): integer; stdcall;

function SetBitrateControlMode(hChannelHandle: integer;
  brc: TBitrateControlType): integer; stdcall;
function SetupNotifyThreshold(hChannelHandle: integer;
  iFramesThreshold: integer): integer; stdcall;

function SetupSubChannel(hChannelHandle: integer;
  iSubChannel: integer): integer; stdcall;
function GetSubChannelStreamType(var DataBuf: integer;
  FrameType: integer): integer; stdcall;
  //add for HC/HF
function RegisterStreamDirectReadCallback(
  StreamDirectReadCallback: TSTREAM_DIRECT_READ_CALLBACK;
  var Context: byte): integer; stdcall;
function RegisterDrawFun(nport: DWORD; DrawFun: TDRAWFUN;
  nUser: LongInt): integer; stdcall;
function SetupMask(hChannelHandle: integer;
  var RectList: TRect; iAreas: integer): integer; stdcall;
function StopMask(hChannelHandle: integer): integer; stdcall;
function SetSubEncoderPictureFormat(hChannelHandle: integer;
  PictureFormat: TPictureFormat): integer; stdcall;
function StartSubVideoCapture(hChannelHandle: integer): integer; stdcall;
function StopSubVideoCapture(hChannelHandle: integer): integer; stdcall;
function SetupDateTime(hChannelHandle: integer;
  var nows: SYSTEMTIME): integer; stdcall;
//原始图像流设置
type TIMAGE_STREAM_CALLBACK = procedure(channelNumber: integer;
    var context: integer); stdcall;

function SetImageStream(hChannel: integer;
  bStart: Boolean; fps: LongInt;
  width: LongInt; height: LongInt;
  var imageBuffer: byte): integer; stdcall;

function RegisterImageStreamCallback(ImageStreamCallback: TIMAGE_STREAM_CALLBACK;
  var context: integer): integer; stdcall;

const Serial_Number_Length = 12;

type DS_BOARD_DETAIL = record
    types: TBOARD_TYPE_DS; //板卡类型
    sn: array[0..15] of Byte; //序列号
    dspCount: LongWord; //板卡包含的DSP个数
    firstDspIndex: LongWord; //板卡上第一个DSP的索引
    encodeChannelCount: LongWord; //板卡包含的编码通道个数
    firstEncodeChannelIndex: LongWord; //板卡上第一个编码通道的索引
    decodeChannelCount: LongWord; //板卡包含的解码通道个数
    firstDecodeChannelIndex: LongWord; //板卡上第一个解码通道的索引
    displayChannelCount: LongWord; //板卡包含的视频输出通道个数
    firstDisplayChannelIndex: LongWord; //板卡上第一个视频输出通道的索引
    reserved1: LongWord;
    reserved2: LongWord;
    initInfo: LongWord;
    version: Integer; //硬件版本,format:major.minor.build,major:bit 16-19,minor: bit 8-15,build: bit 0-7
  end;
  PDS_BOARD_DETAIL = ^DS_BOARD_DETAIL;

type DSP_DETAIL = record
    encodeChannelCount: LongInt; //板卡包含的编码通道个数
    firstEncodeChannelIndex: LongInt; //板卡上第一个编码通道的索引
    decodeChannelCount: LongInt; //板卡包含的解码通道个数
    firstDecodeChannelIndex: LongInt; //板卡上第一个解码通道的索引
    displayChannelCount: LongInt; //板卡包含的视频输出通道个数
    firstDisplayChannelIndex: LongInt; //板卡上第一个视频输出通道的索引
    reserved1: LongInt;
    reserved2: LongInt;
    reserved3: LongInt;
    initInfo: LongInt;
  end;
  PDSP_DETAIL = ^DSP_DETAIL;

function GetBoardCount(): integer; stdcall;
function GetBoardDetail(boardNum: Integer; var pBoardDetail: DS_BOARD_DETAIL): integer; stdcall;
function GetDspCount(): integer; stdcall;
function GetDspDetail(dspNum: integer; var pDspDetail: DSP_DETAIL): integer; stdcall;
function GetEncodeChannelCount(): integer; stdcall;
function GetDecodeChannelCount(): integer; stdcall;
function GetDisplayChannelCount(): integer; stdcall;
function SetDefaultVideoStandard(var VideoStandard: TVideoStandard): integer; stdcall;
function SetVideoDetectPrecision(hChannel: integer; value: integer): integer; stdcall;
function SetSubStreamType(hChannelHandle: integer; Types: integer): integer; stdcall;
function GetSubStreamType(hChannelHandle: integer; var StreamType: integer): integer; stdcall;

const Max_Display_Region = 16;

type TRegion_Param = record
    left: LongWord;
    top: LongWord;
    width: LongWord;
    height: LongWord;
    color: ColorRef;
    param: LongWord;
  end;

function SetDisplayStandard(nDisplayChannel: integer; VideoStandard: TVideoStandard): integer; stdcall;
function SetDisplayRegion(nDisplayChannel: integer; nRegionCount: integer;
  var pParam: TREGION_PARAM; nReserved: integer): integer; stdcall;
function ClearDisplayRegion(nDisplayChannel: integer; nRegionFlag: integer): integer; stdcall;
function SetDisplayRegionPosition(nDisplayChannel: integer;
  nRegion: integer; nLeft: integer; nTop: integer): integer; stdcall;
function FillDisplayRegion(nDisplayChannel: integer; nRegion: integer; var pImage: byte): integer; stdcall;
function SetEncoderVideoExtOutput(nEncodeChannel: integer; var nPort: integer; bOpen: Boolean;
  nDisplayChannel: integer; nDisplayRegion: integer; nFrameRate: integer): integer; stdcall;
function SetDecoderVideoExtOutput(nDecodeChannel: integer; nPort: integer; bOpen: Boolean;
  nDisplayChannel: integer; nDisplayRegion: integer; nReserved: integer): integer; stdcall;
function SetDecoderVideoOutput(nDecodeChannel: integer; nPort: integer; bOpen: Boolean;
  nDisplayChannel: integer; nDisplayRegion: integer; nReserved: integer): integer; stdcall;
function SetDecoderAudioOutput(nDecodeChannel: integer; bOpen: Boolean; nOutputChannel: integer): integer; stdcall;
//3.1
function SetDeInterlace(hChannelHandle: integer; mode: integer; level: integer): integer; stdcall;
function SetPreviewOverlayMode(bTrue: Boolean): integer; stdcall;

type Display_Para = record
    bToScreen: LongInt;
    bToVideoOut: LongInt;
    nLeft: LongInt;
    nTop: LongInt;
    nWidth: LongInt;
    nHeight: LongInt;
    nReserved: LongInt;
  end;
  PDisplay_Para = ^Display_Para;

type HW_Version = record
    DspVersion: LongWord;
    DspBuildNum: LongWord;
    DriverVersion: LongWord;
    DriverBuildNum: LongWord;
    SDKVersion: LongWord;
    SDKBuildNum: LongWord;
  end;
  PHW_Version = ^HW_Version;
  {
  //以下为解码卡用函数，暂时未译
  //init part
DLLEXPORT_API int __stdcall HW_InitDirectDraw(HWND hParent,COLORREF colorKey);
DLLEXPORT_API int __stdcall HW_ReleaseDirectDraw();
DLLEXPORT_API int __stdcall HW_InitDecDevice(long *pDeviceTotal);
DLLEXPORT_API int __stdcall HW_ReleaseDecDevice();
DLLEXPORT_API int __stdcall HW_ChannelOpen(long nChannelNum,HANDLE* phChannel);
DLLEXPORT_API int __stdcall HW_ChannelClose(HANDLE hChannel);
//open part

DLLEXPORT_API int __stdcall HW_OpenStream(HANDLE hChannel,PBYTE pFileHeadBuf,DWORD nSize);
DLLEXPORT_API int __stdcall HW_ResetStream(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_CloseStream(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_InputData(HANDLE hChannel,PBYTE pBuf,DWORD nSize);
DLLEXPORT_API int __stdcall HW_OpenFile(HANDLE hChannel,LPTSTR sFileName);
DLLEXPORT_API int __stdcall HW_CloseFile(HANDLE hChannel);

//play part
DLLEXPORT_API int __stdcall HW_SetDisplayPara(HANDLE hChannel,DISPLAY_PARA *pPara);
DLLEXPORT_API int __stdcall HW_Play(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_Stop(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_Pause(HANDLE hChannel,ULONG bPause);

//sound part
DLLEXPORT_API int __stdcall HW_PlaySound(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_StopSound(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_SetVolume(HANDLE hChannel,ULONG nVolume);
//overlay part
DLLEXPORT_API int __stdcall HW_RefreshSurface();
DLLEXPORT_API int __stdcall HW_RestoreSurface();
DLLEXPORT_API int __stdcall HW_ClearSurface();
DLLEXPORT_API int __stdcall HW_ZoomOverlay(RECT* pSrcClientRect, RECT* pDecScreenRect);
//cut file
DLLEXPORT_API int __stdcall HW_StartCapFile(HANDLE hChannel,LPTSTR sFileName);
DLLEXPORT_API int __stdcall HW_StopCapFile(HANDLE hChannel);
//capture picture
DLLEXPORT_API int __stdcall HW_GetYV12Image(HANDLE hChannel, PBYTE pBuffer, ULONG nSize);
DLLEXPORT_API int __stdcall HW_GetPictureSize(HANDLE hChannel,ULONG* pWidth, ULONG* pHeight);
DLLEXPORT_API int __stdcall HW_ConvertToBmpFile(BYTE * pBuf,ULONG nSize,ULONG nWidth,ULONG nHeight,char *sFileName,ULONG nReserved);
//setting and getting  part
DLLEXPORT_API int __stdcall HW_Jump(HANDLE hChannel,ULONG nDirection);
DLLEXPORT_API int __stdcall HW_SetJumpInterval(HANDLE hChannel,ULONG nSecond);
DLLEXPORT_API int __stdcall HW_GetSpeed(HANDLE hChannel,long *pSpeed);
DLLEXPORT_API int __stdcall HW_SetSpeed(HANDLE hChannel,long nSpeed);
DLLEXPORT_API int __stdcall HW_SetPlayPos(HANDLE hChannel,ULONG nPos);
DLLEXPORT_API int __stdcall HW_GetPlayPos(HANDLE hChannel,ULONG* pPos);
DLLEXPORT_API int __stdcall HW_GetVersion(PHW_VERSION pVersion);
DLLEXPORT_API int __stdcall HW_GetCurrentFrameRate(HANDLE hChannel,ULONG* pFrameRate);
DLLEXPORT_API int __stdcall HW_GetCurrentFrameNum(HANDLE hChannel,ULONG* pFrameNum);
DLLEXPORT_API int __stdcall HW_GetFileTotalFrames(HANDLE hChannel,ULONG* pTotalFrames);
DLLEXPORT_API int __stdcall HW_GetFileTime(HANDLE hChannel, ULONG* pFileTime);
DLLEXPORT_API int __stdcall HW_GetCurrentFrameTime(HANDLE hChannel,ULONG* pFrameTime);
DLLEXPORT_API int __stdcall HW_GetPlayedFrames(HANDLE hChannel,ULONG *pDecVFrames);
DLLEXPORT_API int __stdcall HW_GetDeviceSerialNo(HANDLE hChannel,ULONG *pDeviceSerialNo);
DLLEXPORT_API int __stdcall HW_SetFileEndMsg(HANDLE hChannel,HWND hWnd,UINT nMsg);
DLLEXPORT_API int __stdcall HW_SetStreamOpenMode(HANDLE hChannel,ULONG nMode);
DLLEXPORT_API int __stdcall HW_GetStreamOpenMode(HANDLE hChannel,ULONG *pMode);
DLLEXPORT_API int __stdcall HW_SetVideoOutStandard(HANDLE hChannel,ULONG nStandard);
DLLEXPORT_API int __stdcall HW_SetDspDeadlockMsg(HWND hWnd,UINT nMsg);
DLLEXPORT_API int __stdcall HW_GetChannelNum(long nDspNum,long *pChannelNum,ULONG nNumsToGet,ULONG * pNumsGotten);
DLLEXPORT_API int __stdcall HW_ResetDsp(long nDspNum);
DLLEXPORT_API int __stdcall HW_SetAudioPreview(HANDLE hChannel, BOOL bEnable);
//////////////////////////////////////////////

DLLEXPORT_API int __stdcall HW_OpenStreamEx(HANDLE hChannel,PBYTE pFileHeadBuf,DWORD nSize);
DLLEXPORT_API int __stdcall HW_CloseStreamEx(HANDLE hChannel);
DLLEXPORT_API int __stdcall HW_InputVideoData(HANDLE hChannel,PBYTE pBuf,DWORD nSize);
DLLEXPORT_API int __stdcall HW_InputAudioData(HANDLE hChannel,PBYTE pBuf,DWORD nSize);
  }
  //4.0
function SetOsdDisplayModeEx(hChannelHandle: integer;
  color: integer; Translucent: Boolean;
  param: integer; nLineCount: integer; var Format: PByte): integer; stdcall;

type TMOTION_DETECTION_CALLBACK = procedure(channelNumber: LongWord;
    bMotionDetected: Boolean; var context: integer); stdcall;

function SetupMotionDetectionEx(hChannelHandle: integer; iGrade: integer;
  iFastMotionDetectFps: integer;
  iSlowMotionDetectFps: integer; delay: LongWord;
  var RectList: TRect; iAreas: integer;
  MotionDetectionCallback: TMOTION_DETECTION_CALLBACK; reserved: integer): integer; stdcall;

function GetJpegImage(hChannelHandle: Integer; var ImageBuf: char;
  var Size: LongWord; nQuality: LongWord): integer; stdcall;
//WatchDog
function SetWatchDog(boardNumber: LongInt; bEnable: Boolean): integer; stdcall;
//4.1
type TFILE_REF_DONE_CALLBACK = procedure(nChannel: LongWord; nSize: LongWord); stdcall;
{
解码卡未译
DLLEXPORT_API int __stdcall HW_SetFileRef(HANDLE hChannel,BOOL bEnable,FILE_REF_DONE_CALLBACK FileRefDoneCallback);
DLLEXPORT_API int __stdcall HW_LocateByAbsoluteTime(HANDLE hChannel,SYSTEMTIME time);
DLLEXPORT_API int __stdcall HW_LocateByFrameNumber(HANDLE hChannel,UINT frmNum);
DLLEXPORT_API int __stdcall HW_GetCurrentAbsoluteTime(HANDLE hChannel,SYSTEMTIME *pTime);
DLLEXPORT_API int __stdcall HW_GetFileAbsoluteTime(HANDLE hChannel,SYSTEMTIME *pStartTime,SYSTEMTIME *pEndTime);
//4.2
DLLEXPORT_API int __stdcall HW_ImportFileRef(HANDLE hChannel,char *pBuffer,UINT nSize);
DLLEXPORT_API int __stdcall HW_ExportFileRef(HANDLE hChannel,char *pBuffer,UINT nSize);
}
function SetDisplayVideoCapture(nDisplayChannel: LongWord; bStart: Boolean;
  fps: LongWord; width: LongWord; height: LongWord; var imageBuffer: byte): integer; stdcall;
function RegisterDisplayVideoCaptureCallback(DisplayVideoCaptureCallback: TIMAGE_STREAM_CALLBACK;
  var context: integer): integer; stdcall;
function SetDisplayVideoBrightness(chan: LongWord; Brightness: integer): integer; stdcall;
function SetChannelStreamCRC(hChannel: integer; bEnable: Boolean): integer; stdcall;
function SetSubChannelStreamCRC(hChannel: integer; bEnable: Boolean): integer; stdcall;
function HW_SetDecoderPostProcess(hChannel: integer; param: LongWord): integer; stdcall;
//
type TDECODER_VIDEO_CAPTURE_CALLBACK = procedure(nChannelNumber: LongWord;
    var DataBuf: integer; width: LongWord;
    height: LongWord; nFrameNum: LongWord;
    nFrameTime: LongWord; var pFrameAbsoluteTime: SYSTEMTIME;
    var context: integer); stdcall;
  {
  解码卡未译
DLLEXPORT_API int __stdcall RegisterDecoderVideoCaptureCallback(DECODER_VIDEO_CAPTURE_CALLBACK DecoderVideoCaptureCallback, void * context);
DLLEXPORT_API int __stdcall HW_SetDecoderVideoCapture(HANDLE hChannel, BOOL bStart, UINT param);
DLLEXPORT_API int __stdcall HW_InputDataByFrame(HANDLE hChannel, PBYTE pBuf, DWORD nSize);
//4.3
DLLEXPORT_API int __stdcall HW_RegisterDrawFun(DWORD nport, DRAWFUN(DrawFun), LONG nUser);
DLLEXPORT_API int __stdcall HW_StopRegisterDrawFun(DWORD nport);
}
//5.0
function SetEncoderAudioOutput(nEncodeChannel: LongWord; bEnable: Boolean;
  nOutputChannel: LongWord): integer; stdcall;
function SetEncoderAudioExtOutput(nEncodeChannel: LongWord; nPort: LongWord;
  bOpen: Boolean; nOutChannel: LongWord; nReserved: LongWord): integer; stdcall;
function SetDecoderAudioExtOutput(nDecodeChannel: LongWord; nPort: LongWord;
  bOpen: Boolean; nOutChannel: longWord; nReserved: LongWord): integer; stdcall;

implementation

function InitDSPs; stdcall; external 'DS40xxSDK.dll' name 'InitDSPs';

function DeInitDSPs; stdcall; external 'DS40xxSDK.dll' name 'DeInitDSPs';

function ChannelOpen; stdcall; external 'DS40xxSDK.dll' name 'ChannelOpen';

function ChannelClose; stdcall; external 'DS40xxSDK.dll' name 'ChannelClose';

function GetTotalChannels; stdcall; external 'DS40xxSDK.dll' name 'GetTotalChannels';

function GetTotalDSPs; stdcall; external 'DS40xxSDK.dll' name 'GetTotalDSPs';

function StartVideoPreview; stdcall; external 'DS40xxSDK.dll' name 'StartVideoPreview';

function StopVideoPreview; stdcall; external 'DS40xxSDK.dll' name 'StopVideoPreview';

function SetVideoPara; stdcall; external 'DS40xxSDK.dll' name 'SetVideoPara';

function GetVideoPara; stdcall; external 'DS40xxSDK.dll' name 'GetVideoPara';

function GetVideoSignal; stdcall; external 'DS40xxSDK.dll' name 'GetVideoSignal';

function GetSDKVersion; stdcall; external 'DS40xxSDK.dll' name 'GetSDKVersion';

function GetCapability; stdcall; external 'DS40xxSDK.dll' name 'GetCapability';

function GetLastErrorNum; stdcall; external 'DS40xxSDK.dll' name 'GetLastErrorNum';

function SetStreamType; stdcall; external 'DS40xxSDK.dll' name 'SetStreamType';

function GetStreamType; stdcall; external 'DS40xxSDK.dll' name 'GetStreamType';

function GetFramesStatistics; stdcall; external 'DS40xxSDK.dll' name 'GetFramesStatistics';

function StartMotionDetection; stdcall; external 'DS40xxSDK.dll' name 'StartMotionDetection';

function GetBoardInfo; stdcall; external 'DS40xxSDK.dll' name 'GetBoardInfo';

function StopMotionDetection; stdcall; external 'DS40xxSDK.dll' name 'StopMotionDetection';

function GetOriginalImage; stdcall; external 'DS40xxSDK.dll' name 'GetOriginalImage';

function RegisterLogRecordCallback; stdcall; external 'DS40xxSDK.dll' name 'RegisterLogRecordCallback';

function SetAudioPreview; stdcall; external 'DS40xxSDK.dll' name 'SetAudioPreview';

function ReadStreamData; stdcall; external 'DS40xxSDK.dll' name 'ReadStreamData';

function RegisterMessageNotifyHandle; stdcall; external 'DS40xxSDK.dll' name 'RegisterMessageNotifyHandle';

function StartVideoCapture; stdcall; external 'DS40xxSDK.dll' name 'StartVideoCapture';

function StopVideoCapture; stdcall; external 'DS40xxSDK.dll' name 'StopVideoCapture';

function SetIBPMode; stdcall; external 'DS40xxSDK.dll' name 'SetIBPMode';

function SetDefaultQuant; stdcall; external 'DS40xxSDK.dll' name 'SetDefaultQuant';

function SetOsd; stdcall; external 'DS40xxSDK.dll' name 'SetOsd';

function SetLogo; stdcall; external 'DS40xxSDK.dll' name 'SetLogo';

function StopLogo; stdcall; external 'DS40xxSDK.dll' name 'StopLogo';

function SetupMotionDetection; stdcall; external 'DS40xxSDK.dll' name 'SetupMotionDetection';

function MotionAnalyzer; stdcall; external 'DS40xxSDK.dll' name 'MotionAnalyzer';

function LoadYUVFromBmpFile; stdcall; external 'DS40xxSDK.dll' name 'LoadYUVFromBmpFile';

function SaveYUVToBmpFile; stdcall; external 'DS40xxSDK.dll' name 'SaveYUVToBmpFile';

function CaptureIFrame; stdcall; external 'DS40xxSDK.dll' name 'CaptureIFrame';

function RegisterStreamReadCallback; stdcall; external 'DS40xxSDK.dll' name 'RegisterStreamReadCallback';

function AdjustMotionDetectPrecision; stdcall; external 'DS40xxSDK.dll' name 'AdjustMotionDetectPrecision';

function SetupBitrateControl; stdcall; external 'DS40xxSDK.dll' name 'SetupBitrateControl';

function SetOverlayColorKey; stdcall; external 'DS40xxSDK.dll' name 'SetOverlayColorKey';

function SetOsdDisplayMode; stdcall; external 'DS40xxSDK.dll' name 'SetOsdDisplayMode';

function SetLogoDisplayMode; stdcall; external 'DS40xxSDK.dll' name 'SetLogoDisplayMode';

function SetEncoderPictureFormat; stdcall; external 'DS40xxSDK.dll' name 'SetEncoderPictureFormat';

function SetVideoStandard; stdcall; external 'DS40xxSDK.dll' name 'SetVideoStandard';

function RestoreOverlay; stdcall; external 'DS40xxSDK.dll' name 'RestoreOverlay';

function ResetDSP; stdcall; external 'DS40xxSDK.dll' name 'ResetDSP';

function GetSoundLevel; stdcall; external 'DS40xxSDK.dll' name 'GetSoundLevel';

function SetBitrateControlMode; stdcall; external 'DS40xxSDK.dll' name 'SetBitrateControlMode';

function SetupNotifyThreshold; stdcall; external 'DS40xxSDK.dll' name 'SetupNotifyThreshold';

function SetupSubChannel; stdcall; external 'DS40xxSDK.dll' name 'SetupSubChannel';

function GetSubChannelStreamType; stdcall; external 'DS40xxSDK.dll' name 'GetSubChannelStreamType';
  //add for HC/HF

function RegisterStreamDirectReadCallback; stdcall; external 'DS40xxSDK.dll' name 'RegisterStreamDirectReadCallback';

function RegisterDrawFun; stdcall; external 'DS40xxSDK.dll' name 'RegisterDrawFun';

function SetupMask; stdcall; external 'DS40xxSDK.dll' name 'SetupMask';

function StopMask; stdcall; external 'DS40xxSDK.dll' name 'StopMask';

function SetSubEncoderPictureFormat; stdcall; external 'DS40xxSDK.dll' name 'SetSubEncoderPictureFormat';

function StartSubVideoCapture; stdcall; external 'DS40xxSDK.dll' name 'StartSubVideoCapture';

function StopSubVideoCapture; stdcall; external 'DS40xxSDK.dll' name 'StopSubVideoCapture';

function SetupDateTime; stdcall; external 'DS40xxSDK.dll' name 'SetupDateTime';
                                                                                                                                                //原始图像流设置

function SetImageStream; stdcall; external 'DS40xxSDK.dll' name 'SetImageStream';

function RegisterImageStreamCallback; stdcall; external 'DS40xxSDK.dll' name 'RegisterImageStreamCallback';

function GetBoardCount; stdcall; external 'DS40xxSDK.dll' name 'GetBoardCount';

function GetBoardDetail; stdcall; external 'DS40xxSDK.dll' name 'GetBoardDetail';

function GetDspCount; stdcall; external 'DS40xxSDK.dll' name 'GetDspCount';

function GetDspDetail; stdcall; external 'DS40xxSDK.dll' name 'GetDspDetail';

function GetEncodeChannelCount; stdcall; external 'DS40xxSDK.dll' name 'GetEncodeChannelCount';

function GetDecodeChannelCount; stdcall; external 'DS40xxSDK.dll' name 'GetDecodeChannelCount';

function GetDisplayChannelCount; stdcall; external 'DS40xxSDK.dll' name 'GetDisplayChannelCount';

function SetDefaultVideoStandard; stdcall; external 'DS40xxSDK.dll' name 'SetDefaultVideoStandard';

function SetVideoDetectPrecision; stdcall; external 'DS40xxSDK.dll' name 'SetVideoDetectPrecision';

function SetSubStreamType; stdcall; external 'DS40xxSDK.dll' name 'SetSubStreamType';

function GetSubStreamType; stdcall; external 'DS40xxSDK.dll' name 'GetSubStreamType';

function SetDisplayStandard; stdcall; external 'DS40xxSDK.dll' name 'SetDisplayStandard';

function SetDisplayRegion; stdcall; external 'DS40xxSDK.dll' name 'SetDisplayRegion';

function ClearDisplayRegion; stdcall; external 'DS40xxSDK.dll' name 'ClearDisplayRegion';

function SetDisplayRegionPosition; stdcall; external 'DS40xxSDK.dll' name 'SetDisplayRegionPosition';

function FillDisplayRegion; stdcall; external 'DS40xxSDK.dll' name 'FillDisplayRegion';

function SetEncoderVideoExtOutput; stdcall; external 'DS40xxSDK.dll' name 'SetEncoderVideoExtOutput';

function SetDecoderVideoExtOutput; stdcall; external 'DS40xxSDK.dll' name 'SetDecoderVideoExtOutput';

function SetDecoderVideoOutput; stdcall; external 'DS40xxSDK.dll' name 'SetDecoderVideoOutput';

function SetDecoderAudioOutput; stdcall; external 'DS40xxSDK.dll' name 'SetDecoderAudioOutput';
//3.1

function SetDeInterlace; stdcall; external 'DS40xxSDK.dll' name 'SetDeInterlace';

function SetPreviewOverlayMode; stdcall; external 'DS40xxSDK.dll' name 'SetPreviewOverlayMode';
  //4.0

function SetOsdDisplayModeEx; stdcall; external 'DS40xxSDK.dll' name 'SetOsdDisplayModeEx';

function SetupMotionDetectionEx; stdcall; external 'DS40xxSDK.dll' name 'SetupMotionDetectionEx';

function GetJpegImage; stdcall; external 'DS40xxSDK.dll' name 'GetJpegImage';
//WatchDog

function SetWatchDog; stdcall; external 'DS40xxSDK.dll' name 'SetWatchDog';
//4.1

function SetDisplayVideoCapture; stdcall; external 'DS40xxSDK.dll' name 'SetDisplayVideoCapture';

function RegisterDisplayVideoCaptureCallback; stdcall; external 'DS40xxSDK.dll' name 'RegisterDisplayVideoCaptureCallback';

function SetDisplayVideoBrightness; stdcall; external 'DS40xxSDK.dll' name 'SetDisplayVideoBrightness';

function SetChannelStreamCRC; stdcall; external 'DS40xxSDK.dll' name 'SetChannelStreamCRC';

function SetSubChannelStreamCRC; stdcall; external 'DS40xxSDK.dll' name 'SetSubChannelStreamCRC';

function HW_SetDecoderPostProcess; stdcall; external 'DS40xxSDK.dll' name 'HW_SetDecoderPostProcess';
//5.0

function SetEncoderAudioOutput; stdcall; external 'DS40xxSDK.dll' name 'SetEncoderAudioOutput';

function SetEncoderAudioExtOutput; stdcall; external 'DS40xxSDK.dll' name 'SetEncoderAudioExtOutput';

function SetDecoderAudioExtOutput; stdcall; external 'DS40xxSDK.dll' name 'SetDecoderAudioExtOutput';

end.

