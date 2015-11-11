unit VC404;

interface

uses
  Windows;

const
  DLL_SA7134CAPTURE = 'Sa7134Capture.dll';
  DLL_CAPTUREPICTURE = 'CapturePicture.dll';

  BrightnessDefault: longword = $80;
  ContrastDefault: longword = $46; // $44;
  SaturationDefault: longword = $44; //$40;
  HueDefault: longword = $00;
  SharpnessDefault: longword = $01; //$00;

  MIN_VAMP_BRIGHTNESS_UNITS = 0;
  MAX_VAMP_BRIGHTNESS_UNITS = 255;

  MIN_VAMP_CONTRAST_UNITS = -128;
  MAX_VAMP_CONTRAST_UNITS = 127;

  MIN_VAMP_HUE_UNITS = -128;
  MAX_VAMP_HUE_UNITS = 127;

  MIN_VAMP_SATURATION_UNITS = -128;
  MAX_VAMP_SATURATION_UNITS = 127;

  MIN_VAMP_SHARPNESS_UNITS = -8;
  MAX_VAMP_SHARPNESS_UNITS = 7;

  //---- error define area
  ERR_VC404_OK = 0; // no error,success
  ERR_VC404_NODEVICEFOUND = 1; // no device found in system
  ERR_VC404_UNSUPPORTFUNC = 2; // unsupport func tempro?
  ERR_VC404_ALLOCRESOURCE = 3; // alloc resource error
  ERR_VC404_INITDIRECTDRAW = 4; // Init Directdraw error
  ERR_VC404_INITDIRECTSOUND = 5; // Init Directdraw error
  ERR_VC404_NOT_10MOONSDEV = 6; // it is not device of 10Moons

  //NEW_DATE_TIME				        = 'NEW_DATE_TIME';

type
  TColorControl =
    (
    BRIGHTNESS = 0, // control for brightness
    CONTRAST = 1, // control for contrast
    SATURATION = 2, // control for saturation
    HUE = 3, // control for hue
    SHARPNESS = 4 // control for sharpness
    );

  TColorDeviceType =
    (
    COLOR_DECODER = 0, //解码器(包括视频预览和视频捕获)
    COLOR_PREVIEW = 1, //视频预览
    COLOR_CAPTURE = 2 //视频捕获
    );
  TDisplayType =
    (
    NOT_DISPLAY = 0,
    PCI_VIEDOMEMORY = 1, // AGP VGA card
    PCI_MEMORY_VIDEOMEMORY = 2, // PCI-E VGA card
    OFF_SCREEN = 3
    );

  TCOMPRESSMODE =
    (
    XVID_CBR_MODE = 0,
    XVID_VBR_MODE = 1 //,
    );
  TEventType =
    (
    VID_CAPTURE_EVENT = 0,
    AUD_CAPTURE_EVENT1 = 1,
    AUD_CAPTURE_EVENT2 = 2,
    IO_ALERT_EVENT = 3,
    MOTION_DETECT = 4
    );

  TColorFormat =
    (
    RGB32 = $0,
    RGB24 = $1,
    RGB16 = $2,
    RGB15 = $3,
    YUY2 = $4,
    BTYUV = $5,
    Y8 = $6,
    RGB8 = $7,
    PL422 = $8,
    PL411 = $9,
    YUV12 = $A,
    YUV9 = $B,
    RAW = $E
    );

  TCapModel =
    (
    CAP_NULL_STREAM = 0, //捕获无效
    CAP_ORIGIN_STREAM = 1, //	/*原始流回调*/
    CAP_MPEG4_STREAM = 2, ///*Mpeg4流*/
    CAP_MPEG4_XVID_STREAM = 3,
    CAP_ORIGIN_MPEG4_STREAM = 4,
    CAP_ORIGIN_XVID_STREAM = 5,
    CAP_WMV9_STREAM = 6,
    CAP_ORIGIN_WMV9_STREAM = 7
    );

  TMP4Model =
    (
    MPEG4_AVIFILE_ONLY = 0, // 存为MPEG文件
    MPEG4_CALLBACK_ONLY = 1, // MPEG数据回调
    MPEG4_AVIFILE_CALLBACK = 2 // 存为MPEG文件并回调
    );

  TFieldFrequency =
    (// Field frequency
    FIELD_FREQ_50HZ = 0, // source is 50 Hz (PAL)
    FIELD_FREQ_60HZ = 1, // source is 60 Hz (NTSC)
    FIELD_FREQ_0HZ = 2, // source is 0 Hz   (NO SIGNL)
    FIELD_FREQ_50HZ_NULL = 3,
    FIELD_FREQ_60HZ_NULL = 4
    );

  TVoltageLevel =
    (// 电平等级
    HIGH_VOLTAGE = 0, // 高电平
    LOW_VOLTAGE = 1 // 低电平
    );

  TVideoStandard = (
    VideoStandard_None = $00000000,
    VideoStandard_NTSC_M = $00000001,
    VideoStandard_NTSC_M_J = $00000002,
    VideoStandard_NTSC_433 = $00000004,
    VideoStandard_PAL_B = $00000010,
    VideoStandard_PAL_D = $00000020,
    VideoStandard_PAL_H = $00000080,
    VideoStandard_PAL_I = $00000100,
    VideoStandard_PAL_M = $00000200,
    VideoStandard_PAL_N = $00000400,
    VideoStandard_PAL_60 = $00000800,
    VideoStandard_SECAM_B = $00001000,
    VideoStandard_SECAM_D = $00002000,
    VideoStandard_SECAM_G = $00004000,
    VideoStandard_SECAM_H = $00008000,
    VideoStandard_SECAM_K = $00010000,
    VideoStandard_SECAM_K1 = $00020000,
    VideoStandard_SECAM_L = $00040000,
    VideoStandard_SECAM_L1 = $00080000
    );


  TOSD_DATE_TIME_TYPE =
    (
    OSD_DATE = 0, //日期类型
    OSD_TIME = 1, //时间类型
    OSD_DATE_TIME = 2 //日期类型 + 时间类型
    );
  {
  POSDParam = ^TOSDParam;
  TOSDParam = record
    // EnableOSD: LongBool;                // 是否允许叠加 FALSE—不允许 TRUE—允许
    // Type: OSDType;                      // 叠加类型 0—文本类型 1—日期类型 2—时间类型
    // Text: array[0..255] of char;        // 叠加文本
    Hight: longword; // 字符高度
    Width: longword; // 字符宽度
    Weight: longword; // 字符粗细
    Spacing: longword; // 字符间距
    Italic: LongBool; // 斜体
    UnderLine: LongBool; // 下划线
    StrikeOut: LongBool; // 删除线
    Transparent: LongBool; // 背景是否透明，当背景透明时，在字符边缘参杂有背景色的杂色，请将背景色设为背景相近的颜色，这样使杂色不明显
    BkColor: COLORREF; // 背景色
    TextColor: COLORREF; // 前景色
    FaceName: array[0..32] of char; // 字体名  TCHAR[32]
    // TopLeft: TPoint;                    // 叠加文本左顶点位置（捕获窗口中）
  end;
  POSDParam = ^TOSDParam;
  }
  pOSDPARAM = ^OSDPARAM;
  OSDPARAM = packed record
    cfHeight: Longword; //字符高度
    cfWidth: Longword; //字符宽度
    cfWeight: Longword; //字符粗细
    cfSpacing: Longword; //字符间距
    cfItalic: longword; //斜体
    cfUnderline: longword; //下划线
    cfStrikeOut: longword; //删除线
    bTransparent: longword; //透明
    cfBkColor: TCOLORREF; //背景色 COLORREF
    cfTextColor: TCOLORREF; //前景色 COLORREF
    cfFaceName: array[0..31] of char; //字体名[32]TCHAR
  end;

  OSD_INFO = packed record
    OSDParam: OSDPARAM; //
    cfEnableOSD: Boolean; //BOOL
    cfText: array[0..255] of char; //[256]TCHAR
    cfTransparent: Boolean; // BOOL
    cfTopLeft: TPoint; //  POINT
  end;

  Device_Info = record
    bCapStart: Boolean; // BOOL
    dwCard: Longword; //DWORD
    dwCapTime: Longword; // DWORD
    dwRealFrameRate: Longword; // DWORD
    dwCapHeight: Longword; //DWORD
    dwCapWeight: Longword; //DWORD
    dwFrameRate: Longword; //DWORD
    dwSwitchFreq: Longword; //DWORD
    dwBitRate: Longword; //DWORD
    dwKeyFrmInterval: Longword; // DWORD
    enVidCapModel: Longword; //CAPMODEL -----168
    enVidMpegModel: Longword; // MP4MODEL
    enAudCapModel: Longword; //CAPMODEL
    enAudMpegModel: Longword; //MP4MODEL
    dwSharpness: Longword; //DWORD
    dwSaturation: Longword; //DWORD
    dwHue: Longword; //DWORD
    dwContrast: Longword; // DWORD
    dwBrightness: Longword; //DWORD
    bNetTrans: Boolean; // BOOL
    bFrameRateReduction: Boolean; // BOOL
    bMotionDetect: Boolean; //BOOL
    dwQuantizer: Longword; //DWORD
      //DWORD			dwMotionPrecision;
    enCompessMode: Longword; // COMPRESSMODE
    dwVBRPeakrate: Longword; //DWORD
    dwVBRMaxrate: Longword; //DWORD
    bPrev: Boolean; // BOOL
      //BOOL	bIOLowLevelIn;
      //BOOL	bFirstIoAlert;
  end;
  pDevice_Info = ^Device_Info;
  (*
    1—日期类型 和 2—时间类型 比较特殊，为了提高视频捕获叠加的效率,每路视频捕获
    的日期类型和时间类型共用以下下属性

    Hight: longword;                    // 字符高度
    Width: longword;                    // 字符宽度
    Weight: longword;                   // 字符粗细
    Spacing: longword;                  // 字符间距
    Italic: LongBool;                   // 斜体
    UnderLine: LongBool;                // 下划线
    StrikeOut: LongBool;                // 删除线
    BkColor: COLORREF;                  // 背景色
    TextColor: COLORREF;                // 前景色
    FaceName: array[0..31] of char;     // 字体名

    当叠加文本为"NEW_DATE_TIME", 时表示每路叠加重新设置日期类型和时间类型,这时每
    路视频捕获停止时或捕获暂停时调用有效
  *)


  //---- call back functions define
  // 动态检测回调
  TPrcCbMotionDetect = procedure(ACard: longword; AMove: LongBool; AContext: pointer); stdcall;

  // 视频捕获原始数据回调
  TPrcVidCapCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword); stdcall;

  // 视频MPEG压缩数据回调
  TPrcVidMpegCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword; AIsKeyFrm: LongBool); stdcall;

  // 视频捕获存盘出错回调
  TPrcVidSaveErrCallBack = procedure(ACard: longword); stdcall;

  // 视频捕获字幕叠加出错回调
  TPrcVidOSDErrCallBack = procedure(ACard: longword; OSDNum: longword); stdcall;

  // 音频捕获原始数据回调
  TPrcAudCapCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword); stdcall;

  // 音频MPEG压缩数据回调
  TPrcAudMpegCallBack = procedure(ACard: longword; ABuf: PByte; ASize: longword); stdcall;

  // 音频捕获存盘出错回调
  TPrcAudSaveErrCallBack = procedure(ACard: longword); stdcall;

  // IO报警回调
  TPrcIoAlertCallBack = procedure(ACard: longword); stdcall;


  //---- 回调函数的注册函数
  // 注册视频捕获原始数据回调

function VCARegVidCapCallBack(ACard: longword; AFunc: TPrcVidCapCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册视频MPEG压缩数据回调
function VCARegVidMpegCallBack(ACard: longword; AFunc: TPrcVidMpegCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册视频捕获存盘出错回调
function VCARegVidSaveErrCallBack(ACard: longword; AFunc: TPrcVidSaveErrCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册视频捕获字幕叠加出错回调
function VCARegVidOSDErrCallBack(ACard: longword; AFunc: TPrcVidOSDErrCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册音频捕获原始数据回调
function VCARegAudCapCallBack(ACard: longword; AFunc: TPrcAudCapCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册音频MPEG压缩数据回调
function VCARegAudMpegCallBack(ACard: longword; AFunc: TPrcAudMpegCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册音频频捕获存盘出错回调
function VCARegAudSaveErrCallBack(ACard: longword; AFunc: TPrcAudSaveErrCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 注册IO报警回调
function VCARegIoAlertCallBack(ACard: longword; AFunc: TPrcIoAlertCallBack): longbool; stdcall; external DLL_SA7134CAPTURE;

  //---- dll export functions
  // 设置错误序号
procedure VCASetLastError(AErrNo: longword); stdcall; external DLL_SA7134CAPTURE;

  // 得到错误序号
function VCAGetLastError(): longword; stdcall; external DLL_SA7134CAPTURE;

  // 初始化SDK
function VCAInitSdk(AMainWnd: HWND; ADisplay: TDisplayType; bInitAudDev: longbool): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 释放SDK资源
procedure VCAUnInitSdk(); stdcall; external DLL_SA7134CAPTURE;

  // 得到设备总数
function VCAGetDevNum(): longword; stdcall; external DLL_SA7134CAPTURE;

  // 打开设备
function VCAOpenDevice(ACard: longword; APreviewWnd: HWND): longbool; stdcall; external DLL_SA7134CAPTURE;
  // ACard: 从0开始

  // 关闭设备
function VCACloseDevice(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;
  //设置视频预览尺寸
  //  function VCASetVidPreviewSize(ACard: longword,Card: dwWidth,dwHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;
  // 开始视频预览
function VCAStartVideoPreview(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 停止视频预览
function VCAStopVideoPreview(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  //更新overlay窗口，当overlay窗口句柄改变或尺寸、位置改变时调用，overlay窗口就是包含多路显示小窗口的大窗口。
  //overlay窗口必须有一个，多路显示小窗口必须包含在其内部。
function VCAUpdateOverlayWnd(hOverlayWnd: HWND): Boolean; stdcall; external DLL_SA7134CAPTURE;

  // 更新视频预览，比如已经改变了显示窗口的尺寸，想更新显示分辨率为当前窗口的大小，或改变了显示窗口时，调用。
function VCAUpdateVideoPreview(ACard: longword; hPreviewWnd: HWND): longbool; stdcall; external DLL_SA7134CAPTURE;

  // OVERLAY的逻辑区域到用户区域的映射，比如已经改变了显示窗口的尺寸或位置，但不想当前改变显示分辨率，时调用。
function VCAResetMapRegion(ASrcRect: PRect; ADesRect: PRect): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置视频预览色彩
  // function VCASetVidDisplayColor(ACard: longword; ACtlType: TColorControl; AValue: longword): longbool: stdcall; external DLL_SA7134CAPTURE;
  //设置视频预览尺寸
  //function VCASetVidCapSize(ACard: longword; dwWidth: longword; dwHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // WINAPI VCASetVidPreviewSize( DWORD dwCard, DWORD dwWidth, DWORD dwHeight )
  // 保存快照数据到相应的缓冲区
function VCASaveBitsToBuf(ACard: longword; ADestBuf: TPoint; var AWidth, AHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 保存快照为JPEG文件
function VCASaveAsJpegFile(ACard: longword; AFileName: PChar; AQuality: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 保存快照为BMP文件
function VCASaveAsBmpFile(ACard: longword; AFileName: PChar): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 开始视频捕获
function VCAStartVideoCapture(ACard: longword; ACapMode: longword; AMp4Mode: longword;
  AFileName: PChar): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 停止视频捕获
function VCAStopVideoCapture(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置视频捕获尺寸
function VCASetVidCapSize(ACard: longword; AWidth, AHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 得到视频捕获尺寸
function VCAGetVidCapSize(ACard: longword; var AWidth, AHeight: longword): longbool; stdcall; external DLL_SA7134CAPTURE;
  //设置视频制式
function VCASetVidFieldFrq(ACard: longword; eVidSourceFieldRate: TFieldFrequency): longbool; stdcall; external DLL_SA7134CAPTURE;

function VCASetVidCapFrameRate(ACard: longword; AFrameRate: longword; AFrameRateReduction: longbool = false): longbool; stdcall; external DLL_SA7134CAPTURE;

  //设置MPEG4_XVID压缩的质量 dwQuantizer: 1 ~ 31 (1为最小量度，压缩质量最好); dwMotionPrecision: 0 ~ 6 (0最小运动精度)
function VCASetXVIDQuality(dwCard: Longword; dwQuantizer: Longword; dwMotionPrecision: Longword): boolean; stdcall; external 'Sa7134Capture.dll' name 'VCASetXVIDQuality';
function VCASetXVIDCompressMode(dwCard: Longword; enCompessMode: Longword): boolean; stdcall; external 'Sa7134Capture.dll' name 'VCASetXVIDCompressMode';
  // 设置MPEG压缩的位率,范围:56KBPS ~ 10MBPS
function VCASetBitRate(ACard: longword; ABitRate: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置MPEG压缩的关键帧间隔，必须大于等于帧率
function VCASetKeyFrmInterval(ACard: longword; AKeyFrmInterval: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置动态检测，视频捕获停止时调用有效
function VCAEnableMotionDetect(ACard: longword;
  AEnableDetect: longbool; // 是否允许动态检测
  AAreaMap: PByte; // 运动检测地图
  ASizeOfMap: longword; // AAreaMap尺寸,以BYTE为单位
  APersistTime: longword; // 物体持续nPersistTime秒不动则认为停止 1-30s
  AContext: pointer; // 监测上下文
  AOnObjectMove: TPrcCbMotionDetect // 运动/停止回调函数
  ): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置视频捕获色彩
function VCASetVidCaptureColor(ACard: longword; ACtlType: TColorControl; AValue: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置视频色彩
function VCASetVidDeviceColor(ACard: longword; ACtlType: TColorControl; AValue: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 得到视频源输入频率( 0HZ / 50HZ / 60HZ )对应( 无信号 / PAL制 / NTSC制 ), 参考枚举变量 TFieldFrequency
function VCAGetVidFieldFrq(ACard: longword; var AVidSourceFieldRate: TFieldFrequency): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 开始音频捕获，如果音频捕获方式为MPEG4,视频捕获MPEG4方式开始时，调用有效
function VCAStartAudioCapture(ACard: longword; ACapMode: TCapModel; AMp4Mode: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 允许音频从声卡输出,当dwCard >= 16 时，为静音；开始音频捕获时有效
function VCASetAudioCardOutOn(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;


  // 停止音频捕获，如果音频捕获方式为MPEG4,视频捕获MPEG4方式开始时，调用有效
function VCAStopAudioCapture(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置IO输入报警当前电平
function VCASetIOAlertLevelIn(ACard: longword; ACurrentLevel: TVoltageLevel): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 开始IO输入报警，enSpringLevel为触发电平
function VCAStartIOAlertIn(ACard: longword; ASpringLevel: TVoltageLevel): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 停止IO输入报警
function VCAStopIOAlertIn(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // IO输出报警
function VCAIOAlertOut(ACard: longword; ALevel: TVoltageLevel): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 暂停捕获，暂停视频捕获和音频捕获,可用于快速改变音视频捕获类型和文件切换，设置视频捕获字幕叠加
function VCAPauseCapture(ACard: longword): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 设置视频捕获文本叠加，视频捕获停止时或捕获暂停时调用有效
function VCASetVidCapTextOSD(dwCard: Longword; bEnableOSD: longword; tcText: Pchar; var ptTopLeft: Tpoint; var MyOSDParm: OSDPARAM): boolean; stdcall; external 'Sa7134Capture.dll';

function VCASetVidCapDateTimeOSD(dwCard: Longword; bEnableOSD: longword; var ptTopLeft: tpoint): boolean; stdcall; external 'Sa7134Capture.dll';
    //设置视频捕获字幕叠加                 OSDPARAM*
function VCASetVidCapDateTimeOSDParam(var pOSDParm: OSDPARAM): boolean; stdcall; external 'Sa7134Capture.dll';
    //允许视频Mpeg处理回调
  // 初始化视频
function VCAInitVidDev(): longbool; stdcall; external DLL_SA7134CAPTURE;

  // 初始化音频
function VCAInitAudDev(): longbool; stdcall; external DLL_SA7134CAPTURE;

//---- DLL_CAPTUREPICTURE
function CaptureFileAsBmp(AFileName: PChar; AYUVBuf, ARGBBuf: PChar; AWidth, AHeight: longword): longword; stdcall; external DLL_CAPTUREPICTURE;

function CaptureFileAsJpeg(AFileName: PChar; AYUVBuf, ARGBBuf: PChar; AWidth, AHeight: longword; AQuality: longword): longword; stdcall; external DLL_CAPTUREPICTURE;

var
  Device_Inf: Device_Info;
  OSD_INFO1: OSD_INFO;
  OSD_INFO2: OSD_INFO;
  VideoSet: boolean;
  VideoRec: boolean;
  SnapPic: boolean;
  osdparameter: OSDPARAM;

implementation

end.

