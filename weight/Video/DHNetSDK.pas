unit dhnetsdk;

interface

uses
  SysUtils, WinTypes;

type
 //服务器断开回调原形
  TDisConnect = procedure(lLoginID: LongInt; strDVRIP: PChar; nDVRPort: LongInt;
    dwUser: LongWord); stdcall;

    // 网络连接恢复回调函数原形
  THaveReConnect = procedure(lLoginID: LongInt; strDVRIP: PChar; nDVRPort: LongInt;
    dwUser: LongWord); stdcall;

 //回调原形
  TMessCallBack = function(lCommand, lLoginID: LongInt; var pBuf;
    dwBufLen: LongWord; strDVRIP: Pchar; nDVRPort: LongInt; dwUser: LongWord): LongBool; stdcall;

 //屏幕叠加回调原形
  TDrawCallBack = procedure(lLoginID, lPlayHandle: LongInt; hDC: THandle; dwUser: LongInt); stdcall;

 //设备信息
  NET_DEVICEINFO = record
    sSerialNumber: array[0..47] of Byte; //序列号
    byAlarmInPortNum: byte; //DVR报警输入个数
    byAlarmOutPortNum: BYTE; //DVR报警输出个数
    byDiskNum: BYTE; //DVR 硬盘个数
    byDVRType: BYTE; //DVR类型,
    byChanNum: BYTE; //DVR 通道个数
  end;

 //SDK初始化
function CLIENT_Init(cbDisConnect: TDisConnect; dwUser: LongWord): LongBool;
stdcall; external 'dhnetsdk.dll';

 //SDK退出清理
procedure CLIENT_Cleanup(); stdcall; external 'dhnetsdk.dll';

// 设置断线重连成功回调函数，设置后SDK内部断线自动重连
procedure CLIENT_SetAutoReconnect(cbAutoConnect: THaveReConnect; dwUser: LongWord);
stdcall; external 'dhnetsdk.dll';

 //设置连接服务器超时时间和尝试次数
procedure CLIENT_SetConnectTime(nWaitTime: Integer; nTryTimes: Integer);
stdcall; external 'dhnetsdk.dll';

// 返回函数执行失败代码
function CLIENT_GetLastError(): DWORD; stdcall; external 'dhnetsdk.dll';

 //获取SDK的版本信息
function CLIENT_GetSDKVersion(): LongWord; stdcall; external 'dhnetsdk.dll';

 //向设备注册
function CLIENT_Login(strDVRIP: string; wDVRPort: Integer; strUserName: string;
  strPassword: string; var netDeviceInfo: NET_DEVICEINFO; var error: Integer): LongInt;
stdcall; external 'dhnetsdk.dll';

 //向设备注销
function CLIENT_Logout(lLoginID: LongInt): LongBool;
stdcall; external 'dhnetsdk.dll';

procedure CLIENT_SetDVRMessCallBack(cbMessage: TMessCallBack; dwUser: LongWord);
stdcall; external 'dhnetsdk.dll';

 //设置屏幕叠加回调
procedure CLIENT_RigisterDrawFun(cbDraw: TDrawCallBack; dwUser: LongWord);
stdcall; external 'dhnetsdk.dll';

 //开始实时预览
function CLIENT_RealPlay(lLoginID: LongInt; nChannelID: Integer; hWnd: HWND): LongInt;
stdcall; external 'dhnetsdk.dll';

 //停止实时预览
function CLIENT_StopRealPlay(lRealHandle: LongInt): LongBool;
stdcall; external 'dhnetsdk.dll';

// 抓图；hPlayHandle为监视或回放句柄
function CLIENT_CapturePicture(hPlayHandle: LongInt; strPicFileName: string): Boolean;
stdcall; external 'dhnetsdk.dll';

// 保存数据为文件
function CLIENT_SaveRealData(lRealHandle: LongInt; pchFileName: string): Boolean;
stdcall; external 'dhnetsdk.dll';

// 结束保存数据为文件
function CLIENT_StopSaveRealData(lRealHandle: LongInt): Boolean;
stdcall; external 'dhnetsdk.dll';

function getInitError(ret: Integer): string;

implementation

function getInitError(ret: Integer): string;
begin
  case ret of
    1: Result := '密码不正确';
    2: Result := '用户名不存在';
    3: Result := '登录超时';
    4: Result := '帐号已登录';
    5: Result := '帐号已被锁定';
    6: Result := '帐号被列为黑名单';
    7: Result := '资源不足，系统忙';
    8: Result := '子连接失败';
    9: Result := '主连接失败';
    10: Result := '超过最大用户连接数';
  end;

end;

end.

