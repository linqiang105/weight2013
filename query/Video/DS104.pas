unit DS104;

interface

uses Windows;

const
  DS104_DLL = 'DvrSdk.dll';

type VidComArray = array[0..127] of char;

//========================================================================
// DvrSdk.Dll API 调用接口
//========================================================================

const
  //视频流类型数据结构
  VSubType_RGB32 = $0;
  VSubType_RGB24 = $1;
  VSubType_RGB16 = $2;
  VSubType_RGB15 = $3;
  VSubType_YUY2 = $4;
  VSubType_BTYUV = $5;
  VSubType_Y8 = $6;
  VSubType_RGB8 = $7;
  VSubType_PL422 = $8;
  VSubType_PL411 = $9;
  VSubType_YUV12 = $A;
  VSubType_YUV9 = $B;
  VSubType_RAW = $E;
  //视频制式数据结构
  VStandard_NTSC = $1;
  VStandard_PAL = $3;
  VStandard_SECAM = $6;
  //录像视频制式数据结构
  VRecord_NTSC = $0;
  VRecord_PAL = $1;
  //视频属性数据结构
  VProperty_Brightness = $0;
  VProperty_Contrast = $1;
  VProperty_Hue = $2;
  VProperty_Saturation = $3;
  //

  //定义 MPEG4 捕捉时工作模式数据结构
  MPEG4Mode_ToFile = 0; // 只能用于捕捉成文件
  MPEG4Mode_Both = 1; // 可以捕捉成文件也能网传
  MPEG4Mode_ToTransmit = 2; // 只能用于网传

  //  捕捉模式定义
  //  例如：要捕捉只有视频的 MPEG4 文件和捕捉音视流保存为 .WAV 文件，请使用
  //  参数：CaptureMode_VO_MPEG4_FILE | CaptureMode_AO_WAV_FILE
  CaptureMode_VA_MPEG4_FILE = $FFFFFFFF; // 捕捉音视频复合的 MPEG4 文件
  CaptureMode_VO_MPEG4_FILE = $FFF70000; // 捕捉只有视频的 MPEG4 文件
  CaptureMode_VO_YUY2_FILE = $FFF00000; // 捕捉未压缩 YUY2 文件
  CaptureMode_VO_USER = $FF000000; // 将捕捉到的视频流提供给用户
  CaptureMode_AO_WAV_USER = $000000FF; // 将捕捉到的未压缩音频流提供给用户
  CaptureMode_AO_ADPCM_USER = $00000FFF; // 将捕捉到的压缩音频ADPCM流提供给用户
  CaptureMode_AO_WAV_FILE = $0000FFF7; // 捕捉音视流保存为 .WAV 文件

  // MPEG4 录制参数设置
type
  RecordMPEGPara = record
    RecProperty_BitRate: DWORD; // 位率 (范围：56KBPS ~ 10MBPS)
    RecProperty_KeyFrameInterval: DWORD; // 关键帧间隔 (要求：大于等于帧率)
    RecProperty_FrameRate: DWORD; // 帧率 (范围：1 ~ 25(PAL)/30(NTSC)帧)
    RecProperty_VStandard: integer; // 视频制式 (取值：0 为NTSC, 1 为PAL)
  end;
  PRecordMPEGPara = ^RecordMPEGPara;

// 系统函数 - 对所有DVR设备全局堆进行初始化
function HxnDVR_Init(hWnd: THandle): DWORD; stdcall; external DS104_DLL name 'HxnDVR_Init';

// 系统函数 - 对所有DVR设备全局堆占用资源进行释放
procedure HxnDVR_UnInit(); stdcall; external DS104_DLL name 'HxnDVR_UnInit';

//获取DVR设备的实际总数量
function HxnDVR_GetDeviceAmount(): DWORD; stdcall; external DS104_DLL name 'HxnDVR_GetDeviceAmount';

//系统函数 - 启动指定卡号的音视频设备, 可多次调用选择视频输入端口号
function HxnDVR_ConnectDevice(dwCardID: DWORD; m_Insel: Integer): Boolean; stdcall; external DS104_DLL name 'HxnDVR_ConnectDevice';

// 系统函数 - 判断当前设备是否已经启动
function HxnDVR_IsConnected(dwCardID: DWORD): boolean; stdcall; external DS104_DLL name 'HxnDVR_IsConnected';

// 系统函数 - 关闭指定卡号的音视频设备
procedure HxnDVR_DisconnectDevice(dwCardID: DWORD); stdcall; external DS104_DLL name 'HxnDVR_DisconnectDevice';

//设置当前设备要显示视频制式
function HxnDVR_SetVStandard(dwCardID: DWORD; vformat: Integer): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVStandard';

// 系统函数 - 设置捕捉视频属性(亮度、对比度、色度、饱和度和锐度(清晰度)等)
function HxnDVR_SetVPropertyValue(dwCardID: DWORD; pro: DWORD; dwValue: DWORD): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVPropertyValue';

// 系统函数 - 获取捕捉视频尺寸大小
procedure HxnDVR_GetVidCapSize(dwCardID: integer; lpdwCapWidth: PDWORD; lpdwCapHeight: PDWORD);
stdcall; external DS104_DLL name 'HxnDVR_GetVidCapSize';

// 系统函数 - 设置捕捉视频尺寸大小
function HxnDVR_SetVidCapSize(dwCardID: DWORD; dwCapWidth: DWORD; dwCapHeight: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVidCapSize';

// 系统函数 - 获取显示、快照视频尺寸大小 (SDK7000 有效)
procedure HxnDVR_GetVidPreSize(dwCardID: DWORD; lpdwCapWidth: PDWORD; lpdwCapHeight: PDWORD);
stdcall; external DS104_DLL name 'HxnDVR_GetVidPreSize';

// 系统函数 - 设置显示、快照视频尺寸大小 (SDK7000 有效)
function HxnDVR_SetVidPreSize(dwCardID: DWORD; dwCapWidth: DWORD; dwCapHeight: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetVidPreSize';

// 系统函数 - 获取当前使用视频压缩卡的ID号, 必须先调用 HxnDVR_Init
function HxnDVR_GetCurrentCardID(RegID: string): boolean;
stdcall; external DS104_DLL name 'HxnDVR_GetCurrentCardID';

//确定是否显示指定卡号的视频图像(不显示情况下将不进行视频流传输，能进一步降低系统资源占用)。
function HxnDVR_ShowWindow(dwCardId: DWORD; isShow: Boolean): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_ShowWindow';

//当只需要显示单路尺寸高度大于288请使用此函数。
function HxnDVR_SetOneScreenAnomaly(dwCardId: DWORD; hWnd: THandle; rc: PRect): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetOneScreenAnomaly';

//当只需要显示四路视频时的情况，每尺寸高度大于288请使用此函数，
function HxnDVR_SetFourScreenAnomaly(dwCardId1, dwCardId2, dwCardId3, dwCardId4: DWORD; hWnd: THandle; rc: PRect): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetFourScreenAnomaly';

// 显示函数 - 设定指定卡号的视频图像位置，并由 HxnDVR_ShowWindow 决定是否显示
function HxnDVR_SetWindowPos(dwCardID: DWORD; hWnd: DWORD; rc: PRect): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetWindowPos';

//全屏显示或恢复正常显示指定卡号的视频设备
function HxnDVR_SetFullScreen(dwCardID: DWORD; isFull: Boolean): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetFullScreen';

// 显示函数 - 设置Logo内容(如场景说明等)
function HxnDVR_SetLogoText(dwCardID: DWORD; szLogoText: string): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetLogoText';

// 显示函数 - 显示或隐藏Logo
procedure HxnDVR_ShowLogo(dwCardID: DWORD; bShow: Boolean; x: integer; y: integer);
stdcall; external DS104_DLL name 'HxnDVR_ShowLogo';

// 显示函数 - 显示或隐藏时间
procedure HxnDVR_ShowTime(dwCardID: DWORD; bShow: Boolean; x: integer; y: integer);
stdcall; external DS104_DLL name 'HxnDVR_ShowTime';

// 显示函数 - 显示或隐藏日期
procedure HxnDVR_ShowDate(dwCardID: DWORD; bShow: boolean; x: integer; y: integer);
stdcall; external DS104_DLL name 'HxnDVR_ShowDate';

// 显示函数 - 画质显示增强模式, 选择范围(0,1,...14)
function HxnDVR_ShowInfocus(dwCardID: DWORD; iMode: integer): boolean;
stdcall; external DS104_DLL name 'HxnDVR_ShowInfocus';

// 显示函数 - 图像卜莱兹显示模式, 选择范围(0,1,...14)
function HxnDVR_ShowInBlaze(dwCardID: DWORD; iMode: integer): boolean;
stdcall; external DS104_DLL name 'HxnDVR_ShowInBlaze';

// 录像函数 - 设置要录制的文件名称和捕捉模式, 其中 dwMode 参考捕捉模式定义
function HxnDVR_SetCaptureFile(dwCardID: DWORD; filename: string; dwMode: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetCaptureFile';

// 录像函数 - 开始捕捉流或文件
function HxnDVR_StartCapture(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_StartCapture';

// 录像函数 - 停止捕捉流或文件
procedure HxnDVR_StopCapture(dwCardID: DWORD);
stdcall; external DS104_DLL name 'HxnDVR_StopCapture';

// 录像函数 - 判断指定卡是否正在进行捕捉
function HxnDVR_IsVideoCapture(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_IsVideoCapture';

// 录像函数 - 获取 MPEG4 压缩流的录制参数和捕捉模式属性
procedure HxnDVR_GetMPEG4Property(dwCardID: DWORD; mpgPara: PRecordMPEGPara; lpdwMode: PDWORD);
stdcall; external DS104_DLL name 'HxnDVR_GetMPEG4Property';

// 录像函数 - 设置 MPEG4 压缩流的录制参数和捕捉模式属性
procedure HxnDVR_SetMPEG4Property(dwCardID: DWORD; mpgPara: PRecordMPEGPara; dwMode: DWORD);
stdcall; external DS104_DLL name 'HxnDVR_SetMPEG4Property';

// 抓图函数 - 抓拍 BMP 图片
function HxnDVR_SaveToBmpFile(dwCardID: DWORD; filename: string): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SaveToBmpFile';

// 抓图函数 - 抓拍 JPG 图片
function HxnDVR_SaveToJpgFile(dwCardID: DWORD; filename: string; dwQuality: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SaveToJpgFile';

// 抓图函数 - 将图像存入剪贴板
function HxnDVR_CopyToClipboard(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_CopyToClipboard';

//启动动态监测
function HxnDVR_StartMotionDetect(dwCardId: DWORD): Boolean;
stdcall; external DS104_DLL name 'HxnDVR_StartMotionDetect';

//停止动态监测
procedure HxnDVR_StopMotionDetect(dwCardId: DWORD);
stdcall; external DS104_DLL name 'HxnDVR_StopMotionDetec';

// 显示函数 - 设置视频显示帧率
function HxnDVR_SetDisplayFrame(dwCardID: DWORD; iFrame: integer): boolean;
stdcall; external DS104_DLL name 'HxnDVR_SetDisplayFrame';

// 显示函数 - 判断当前通道是否有视频图像输入
function HxnDVR_IsVideoSignalLocked(dwCardID: DWORD): boolean;
stdcall; external DS104_DLL name 'HxnDVR_IsVideoSignalLocked';

// 系统函数 - 后台播放一个指定WAV文件
function HxnDVR_PlaySoundFromFile(m_hWnd: integer; // 播放窗口句柄
  m_filename: string; // 要播放的WAV文件名
  dwPrimaryChannels: integer; // 音频通道数如：2
  dwPrimaryFreq: integer; // 频率如：22050
  dwPrimaryBitRate: integer // 位率如：16
  ): boolean;
stdcall; external DS104_DLL name 'HxnDVR_PlaySoundFromFile';

implementation

end.

