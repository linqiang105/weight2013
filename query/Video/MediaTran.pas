unit MediaTran;

interface

uses
  Windows;

const
  DLL_MediaTransmit = 'MediaTransmit.dll';

type
  TusRole =
    (
    WORK_AS_SERVER,
    WORK_AS_CLIENT,
    WORK_AS_SUPPLY
    );
  TdwMode =
    (
    SAVE_VIDEO_DATA,
    SAVE_AUDIO_DATA
    );

  TMPEG4_VERSION =
    (
    MPEG4_V1,
    MPEG4_V2,
    MPEG4_V3,
    MPEG4_XVID,
    WMV9
    );

  VIDINFO = record
    dwWidth: longword;
    dwHeight: longword;
    nCompressor: TMPEG4_VERSION;
  end;

  PVIDINFO = ^VIDINFO;
 // callback function api
 //////////////////////////////////////////////////////////////////////////
  TEvCaptureAbnormity = procedure(nCallID: LongWord; nError: LongWord); stdcall;
  TEvInComingRequest = function(dwIp: longword; usPort: word; biCardNo: BYTE;
    biCmd: BYTE; lpInData: PBYTE; biInSize: word;
    lpOutData: pbyte; var biOutSize: word): BYTE; stdcall;

  TEvCmdRespond = procedure(nCallId: longword; biCmd: char; nResult: longword; pRetData: pbyte); stdcall;

 //server function api
////////////////////////////////////////////////////////////////////////////////////////////////////////
 ///注册用于接收请求的回调函数
function MTARegNotifier(evNotifier: TEvInComingRequest): bool; stdcall; external DLL_MediaTransmit;
////初始化开发包，分配相应系统资源
function MTALoadLibrary(usLocalPort: word; usRole: TusRole): bool; stdcall; external DLL_MediaTransmit;
//// 释放开发包分配的系统资源
procedure MTAFreeLibrary(); stdcall; external DLL_MediaTransmit;
////////发送视频数据帧。该函数须实时调用
function MTAWriteVideo(nCardNo: byte; pData: pbyte; lSize: longword; bIFrm: longbool): longbool; stdcall; external DLL_MediaTransmit;
///////  设置请求超时的时间长度
procedure MTASetRequestTimeOut(usTimeOut: word); stdcall; external DLL_MediaTransmit;

////////////////////////////////////////////////////////////////////////////////////////////
// client delphi api ////////////////////////////////////////////////////////////////
////创建视频显示窗口和Overlay显示表面
function MTACreateVideoDevice(hParentWnd: HWND; hNotifyWnd: HWND;
  rect: TRect; nWidth: longword; nHeight: longword;
  nSpace: longword; bUseOverlay: longword): longword; stdcall; external DLL_MediaTransmit;
/////申请呼叫资源
function MTANewCall(pRemoteIp: pchar; usRemotePortL: WORD; biCardNo: BYTE): longword; stdcall; external DLL_MediaTransmit;
/////////发起呼叫，请求媒体传送服务
function MTAMakeCall(nCallID: Longword; biReqType: byte; bWANCall: boolean; lpSndData: pbyte;
  biSndSize: byte; hEventNotify: Thandle; evCallNotify: TEvCmdRespond): boolean; stdcall; external DLL_MediaTransmit;
///清除呼叫，释放系统资源
procedure MTAClearCall(nCallId: longword; bWait: boolean); stdcall; external DLL_MediaTransmit;
//// 服务端强制停止一路呼叫
procedure MTADiscardCall(biCard: BYTE; dwRemoteIp: longword; usRemotePort: longword; bWait: boolean); stdcall; external DLL_MediaTransmit;
 ///// 设置视频窗口的显示切分模式
function MTASetSplitMode(nMode: longword): longword; stdcall; external DLL_MediaTransmit;
function MTAPageDown(): longword; stdcall; external DLL_MediaTransmit;
function MTAPageUp(): longword; stdcall; external DLL_MediaTransmit;
function MTAGetPageNo(): longword; stdcall; external DLL_MediaTransmit;
function MTASetVideoOut(nCallID: longword; nIndex: longword; pVidInfo: PVIDINFO): boolean; stdcall; external DLL_MediaTransmit;
procedure MTASetLastError(Errno: integer); stdcall; external DLL_MediaTransmit;
function MTAGetIndexByCallID(nCallID: longword): longword; stdcall; external DLL_MediaTransmit;
function MTAStartCapture(nCallID: LongWord; pFileName: PChar; dwMode: LongWord; evCapAbnormity: TEvCaptureAbnormity): LongWord; stdcall; external DLL_MediaTransmit;
procedure MTAStopCapture(Errno: integer); stdcall; external DLL_MediaTransmit;
function MTANewPlayBack(lpFileName: pchar): longword; stdcall; external DLL_MediaTransmit;
function MTAFreePalyBack(nPlayBackId: LongWord): LongWord; stdcall; external DLL_MediaTransmit;
function MTAOpenFile(nPlayBackID: LongWord; lpFileName: pchar): LongWord; stdcall; external DLL_MediaTransmit;
function MTACloseFile(nPlayBackID: LongWord): LongWord; stdcall; external DLL_MediaTransmit;
function MTAStartPlay(nPlayBackID: LongWord; dwMode: LongWord): LongWord; stdcall; external DLL_MediaTransmit;

//////////////////////////////////////////////////////////////////////////////////////////////////
var
  VideoInfo: VIDINFO;
  pVideoInfo: PVIDINFO;

implementation

end.

