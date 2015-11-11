unit Video;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, HCNETSDK,
  ExtCtrls, Menus, IniFiles, DS104, PropStorageEh, PropFilerEh, Dialogs;

const WM_ECHOBIRD_WINMSG = WM_USER + $300; // DVR-SDK(R) 返回窗口消息

type
  TVideoForm = class(TForm)
    VideoPanel1: TPanel;
    VideoPanel2: TPanel;
    VideoPanel3: TPanel;
    VideoPanel4: TPanel;
    PMVideoType: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N211: TMenuItem;
    N221: TMenuItem;
    N311: TMenuItem;
    N411: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    PropStorageEh1: TPropStorageEh;
    IniPropStorageManEh1: TIniPropStorageManEh;
    TResize: TTimer;
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N211Click(Sender: TObject);
    procedure N221Click(Sender: TObject);
    procedure N311Click(Sender: TObject);
    procedure N411Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VideoPanel1DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure VideoPanel2DblClick(Sender: TObject);
    procedure VideoPanel3DblClick(Sender: TObject);
    procedure VideoPanel4DblClick(Sender: TObject);
    procedure VideoPanel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TResizeTimer(Sender: TObject);
  private
    { Private declarations }
    maxForm: TForm; //最大化的窗体
    isMaximize: Boolean;
    //在一路视频最大化时不要乱画窗体
    maxState: Integer;
    t: Integer; //放大类型
    videoType, displayType: Integer; //视频卡类型
    use1, use2, use3, use4: Boolean; //使用路数
    video1, video2, video3, video4: Integer; //每路视频编号
    //海康威视硬盘录像机
    ip, port, user, pass: string;
    deviceInfo: NET_DVR_DEVICEINFO_V30;
    uid: Integer; //用户ID
    realHandle: array[0..3] of Integer; //视频窗口句柄
    clientHandle: array[0..3] of NET_DVR_CLIENTINFO; //客户端句柄
    //现在的窗体坐标
    initX, initY, initWidth, initHeight: Integer;
    //存在视频卡,连接上视频卡
    procedure OnMessage(var message: TMessage); message WM_ECHOBIRD_WINMSG;
  public
    { Public declarations }
    //显示参数
    showDate, showTime, showLogo: Boolean;
    dateX, dateY, timeX, timeY, logoX, logoY: Integer;
    logo: string;
    procedure initVideoCard();
    procedure loadVideoSet();
    //1:1*1    //2:1*2    //3:1*3    //4:1*4
    //5:2*1    //6:2*2    //7:3*1    //8:4*1
    procedure resizeForm(t: Integer = 1);
    procedure maxResizeForm(); //双击界面最大化及最小化时重新刷新一遍窗口
    procedure takePhoto(); //拍照
    procedure showScreen();
    procedure showScreenDate();
    procedure showScreenTime();
    procedure showScreenLogo();
    procedure setPanelWin(t: Integer = 1); //默认4*3

  end;

var
  VideoForm: TVideoForm;

implementation

uses VC404, CommonUtil, MediaTran;

{$R *.dfm}

{ TVideoForm }

function ManageProc(dwIp: longword; usPort: word; biCardNo: BYTE;
  biCmd: BYTE; lpInData: PByte; biInSize: word;
  lpOutData: pbyte; var biOutSize: word): BYTE; stdcall;
begin
  VideoInfo.dwWidth := Device_Inf.dwCapWeight;
  VideoInfo.dwHeight := Device_Inf.dwCapHeight;
  VideoInfo.nCompressor := MPEG4_XVID;
  pVideoInfo := @VideoInfo;
  move(pVideoInfo^, lpOutData^, sizeof(VIDINFO));
  biOutSize := sizeof(VIDINFO);
  result := 0;
end;

procedure TVideoForm.resizeForm(t: Integer);
begin
  if maxState <> 0 then
  begin
    Exit;
  end;
  Self.t := t;
  case t of
    1: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := False;
        VideoPanel3.Visible := False;
        VideoPanel4.Visible := False;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth;
        VideoPanel1.Height := ClientHeight;

      end;
    2: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := False;
        VideoPanel4.Visible := False;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth div 2;
        VideoPanel1.Height := ClientHeight;

        VideoPanel2.Left := ClientWidth div 2;
        VideoPanel2.Top := 0;
        VideoPanel2.Width := ClientWidth div 2;
        VideoPanel2.Height := ClientHeight;

      end;
    3: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := True;
        VideoPanel4.Visible := False;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth div 3;
        VideoPanel1.Height := ClientHeight;

        VideoPanel2.Left := ClientWidth div 3;
        VideoPanel2.Top := 0;
        VideoPanel2.Width := ClientWidth div 3;
        VideoPanel2.Height := ClientHeight;

        VideoPanel3.Left := ClientWidth div 3 * 2;
        VideoPanel3.Top := 0;
        VideoPanel3.Width := ClientWidth div 3;
        VideoPanel3.Height := ClientHeight;

      end;
    4: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := True;
        VideoPanel4.Visible := True;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth div 4;
        VideoPanel1.Height := ClientHeight;

        VideoPanel2.Left := ClientWidth div 4;
        VideoPanel2.Top := 0;
        VideoPanel2.Width := ClientWidth div 4;
        VideoPanel2.Height := ClientHeight;

        VideoPanel3.Left := ClientWidth div 2;
        VideoPanel3.Top := 0;
        VideoPanel3.Width := ClientWidth div 4;
        VideoPanel3.Height := ClientHeight;

        VideoPanel4.Left := ClientWidth div 4 * 3;
        VideoPanel4.Top := 0;
        VideoPanel4.Width := ClientWidth div 4;
        VideoPanel4.Height := ClientHeight;

      end;
    5: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := False;
        VideoPanel4.Visible := False;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth;
        VideoPanel1.Height := ClientHeight div 2;

        VideoPanel2.Left := 0;
        VideoPanel2.Top := ClientHeight div 2;
        VideoPanel2.Width := ClientWidth;
        VideoPanel2.Height := ClientHeight div 2;

      end;
    6: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := True;
        VideoPanel4.Visible := True;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth div 2;
        VideoPanel1.Height := ClientHeight div 2;

        VideoPanel2.Left := ClientWidth div 2;
        VideoPanel2.Top := 0;
        VideoPanel2.Width := ClientWidth div 2;
        VideoPanel2.Height := ClientHeight div 2;

        VideoPanel3.Left := 0;
        VideoPanel3.Top := ClientHeight div 2;
        VideoPanel3.Width := ClientWidth div 2;
        VideoPanel3.Height := ClientHeight div 2;

        VideoPanel4.Left := ClientWidth div 2;
        VideoPanel4.Top := ClientHeight div 2;
        VideoPanel4.Width := ClientWidth div 2;
        VideoPanel4.Height := ClientHeight div 2;

      end;
    7: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := True;
        VideoPanel4.Visible := False;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth;
        VideoPanel1.Height := ClientHeight div 3;

        VideoPanel2.Left := 0;
        VideoPanel2.Top := ClientHeight div 3;
        VideoPanel2.Width := ClientWidth;
        VideoPanel2.Height := ClientHeight div 3;

        VideoPanel3.Left := 0;
        VideoPanel3.Top := ClientHeight div 3 * 2;
        VideoPanel3.Width := ClientWidth;
        VideoPanel3.Height := ClientHeight div 3;

      end;
    8: begin
        VideoPanel1.Visible := True;
        VideoPanel2.Visible := True;
        VideoPanel3.Visible := True;
        VideoPanel4.Visible := True;

        VideoPanel1.Left := 0;
        VideoPanel1.Top := 0;
        VideoPanel1.Width := ClientWidth;
        VideoPanel1.Height := ClientHeight div 4;

        VideoPanel2.Left := 0;
        VideoPanel2.Top := ClientHeight div 4;
        VideoPanel2.Width := ClientWidth;
        VideoPanel2.Height := ClientHeight div 4;

        VideoPanel3.Left := 0;
        VideoPanel3.Top := ClientHeight div 2;
        VideoPanel3.Width := ClientWidth;
        VideoPanel3.Height := ClientHeight div 4;

        VideoPanel4.Left := 0;
        VideoPanel4.Top := ClientHeight div 4 * 3;
        VideoPanel4.Width := ClientWidth;
        VideoPanel4.Height := ClientHeight div 4;

      end;
  else
    begin
      VideoPanel1.Visible := True;
      VideoPanel2.Visible := False;
      VideoPanel3.Visible := False;
      VideoPanel4.Visible := False;

      VideoPanel1.Left := 0;
      VideoPanel1.Top := 0;
      VideoPanel1.Width := ClientWidth;
      VideoPanel1.Height := ClientHeight;
    end;
  end;
  if videoType = 0 then
  begin
    if HxnDVR_IsConnected(video1) then
      HxnDVR_SetWindowPos(video1, VideoPanel1.Handle, nil);
    if HxnDVR_IsConnected(video2) then
      HxnDVR_SetWindowPos(video2, VideoPanel2.Handle, nil);
    if HxnDVR_IsConnected(video3) then
      HxnDVR_SetWindowPos(video3, VideoPanel3.Handle, nil);
    if HxnDVR_IsConnected(video4) then
      HxnDVR_SetWindowPos(video4, VideoPanel4.Handle, nil);
  end
  else if videoType = 1 then
  begin
    Left := Left + 1;
  end;
end;

procedure TVideoForm.N11Click(Sender: TObject);
begin
  setPanelWin(1);
  resizeForm(1);
end;

procedure TVideoForm.N21Click(Sender: TObject);
begin
  setPanelWin(2);
  resizeForm(2);
end;

procedure TVideoForm.N31Click(Sender: TObject);
begin
  setPanelWin(3);
  resizeForm(3);
end;

procedure TVideoForm.N41Click(Sender: TObject);
begin
  setPanelWin(4);
  resizeForm(4);
end;

procedure TVideoForm.N211Click(Sender: TObject);
begin
  setPanelWin(5);
  resizeForm(5);
end;

procedure TVideoForm.N221Click(Sender: TObject);
begin
  setPanelWin(6);
  resizeForm(6);
end;

procedure TVideoForm.N311Click(Sender: TObject);
begin
  setPanelWin(7);
  resizeForm(7);
end;

procedure TVideoForm.N411Click(Sender: TObject);
begin
  setPanelWin(8);
  resizeForm(8);
end;

procedure TVideoForm.FormCreate(Sender: TObject);
begin
  maxState := 0;
  isMaximize := False;
  IniPropStorageManEh1.IniFileName := ExtractFilePath(ParamStr(0)) + 'video.ini';
  loadVideoSet;
  initVideoCard;
  showScreen();
end;

procedure TVideoForm.FormPaint(Sender: TObject);
begin
  resizeForm(t);
end;

procedure TVideoForm.FormResize(Sender: TObject);
begin
  resizeForm(t);
end;

procedure TVideoForm.FormShow(Sender: TObject);
begin
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE);
  showScreenDate;
  showScreenTime;
  showScreenLogo;
  TResize.Enabled := videoType = 1;
end;

procedure TVideoForm.OnMessage(var message: TMessage);
begin
  if videoType = 0 then
  begin
    if message.WParam = WM_LBUTTONDBLCLK then
    begin
      HxnDVR_SetFullScreen(message.LParam, True);
    end
    else if message.WParam = WM_LBUTTONDOWN then
    begin
      ReleaseCapture;
      SendMessage(Handle, wm_SysCommand, $F012, 0);
      HxnDVR_SetFullScreen(message.LParam, False);
    end;
  end;
end;

procedure TVideoForm.loadVideoSet;
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'video.ini');
  try
    videoType := myini.ReadInteger('video', 'type', 1);
    displayType := myini.ReadInteger('video', 'display_type', 2);

    Use1 := myini.ReadBool('video', 'use1', True);
    Use2 := myini.ReadBool('video', 'use2', True);
    Use3 := myini.ReadBool('video', 'use3', True);
    Use4 := myini.ReadBool('video', 'use4', True);

    Video1 := myini.ReadInteger('video', 'video1', 0);
    Video2 := myini.ReadInteger('video', 'video2', 1);
    Video3 := myini.ReadInteger('video', 'video3', 2);
    Video4 := myini.ReadInteger('video', 'video4', 3);

    t := myini.ReadInteger('video', 'form_type', 5);

    ip := myini.ReadString('video', 'ip', '192.168.1.250');
    port := myini.ReadString('video', 'port', '8000');
    user := myini.ReadString('video', 'user', 'admin');
    pass := TCommonUtil.deBase64(myini.ReadString('video', 'pass', 'MTIzNDU='));

    showDate := myini.ReadBool('video', 'showDate', False);
    showTime := myini.ReadBool('video', 'showTime', False);
    showLogo := myini.ReadBool('video', 'showLogo', False);

    dateX := myini.ReadInteger('video', 'dateX', 10);
    dateY := myini.ReadInteger('video', 'dateY', 10);
    timeX := myini.ReadInteger('video', 'timeX', 135);
    timeY := myini.ReadInteger('video', 'timeY', 10);
    logoX := myini.ReadInteger('video', 'logoX', 10);
    logoY := myini.ReadInteger('video', 'logoY', 30);
    logo := myini.ReadString('video', 'logo', '');
  finally
    myini.Free;
  end;
end;

procedure TVideoForm.takePhoto();
begin
  if videoType = 0 then
  begin
    if use1 then HxnDVR_SaveToJpgFile(video1, ExtractFilePath(Application.ExeName) + 'P0.jpg', 100);
    if use2 then HxnDVR_SaveToJpgFile(video2, ExtractFilePath(Application.ExeName) + 'P1.jpg', 100);
    if use3 then HxnDVR_SaveToJpgFile(video3, ExtractFilePath(Application.ExeName) + 'P2.jpg', 100);
    if use4 then HxnDVR_SaveToJpgFile(video4, ExtractFilePath(Application.ExeName) + 'P3.jpg', 100);
  end
  else if videoType = 1 then
  begin
    if use1 then VCASaveAsJpegFile(video1, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.jpg'), 100);
    if use2 then VCASaveAsJpegFile(video2, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.jpg'), 100);
    if use3 then VCASaveAsJpegFile(video3, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.jpg'), 100);
    if use4 then VCASaveAsJpegFile(video4, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.jpg'), 100);
  end
  else if videoType = 2 then
  begin
    NET_DVR_SetCapturePictureMode(JPEG_MODE);
    if use1 then NET_DVR_CapturePicture(realHandle[0], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.jpg'));
    if use2 then NET_DVR_CapturePicture(realHandle[1], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.jpg'));
    if use3 then NET_DVR_CapturePicture(realHandle[2], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.jpg'));
    if use4 then NET_DVR_CapturePicture(realHandle[3], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.jpg'));
  end;
end;

procedure TVideoForm.FormDestroy(Sender: TObject);
begin
  TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'video.ini').WriteInteger('video', 'form_type', t);
  if videoType = 0 then
  begin
    if HxnDVR_IsConnected(video1) then
      HxnDVR_DisconnectDevice(video1);
    if HxnDVR_IsConnected(video2) then
      HxnDVR_DisconnectDevice(video2);
    if HxnDVR_IsConnected(video3) then
      HxnDVR_DisconnectDevice(video3);
    if HxnDVR_IsConnected(video4) then
      HxnDVR_DisconnectDevice(video4);

    HxnDVR_UnInit;
  end
  else if videoType = 1 then
  begin
    VCAStopVideoPreview(video1);
    VCACloseDevice(video1);
    VCAStopVideoPreview(video2);
    VCACloseDevice(video2);
    VCAStopVideoPreview(video3);
    VCACloseDevice(video3);
    VCAStopVideoPreview(video4);
    VCACloseDevice(video4);

    VCAUnInitSdk;
    MTAFreeLibrary;
  end
  else if videoType = 2 then
  begin
    NET_DVR_StopRealPlay(realHandle[0]);
    NET_DVR_StopRealPlay(realHandle[1]);
    NET_DVR_StopRealPlay(realHandle[2]);
    NET_DVR_StopRealPlay(realHandle[3]);
    NET_DVR_Logout(uid);
    NET_DVR_Cleanup;
  end;
end;

procedure TVideoForm.N3Click(Sender: TObject);
begin
  takePhoto;
end;

procedure TVideoForm.VideoPanel1DblClick(Sender: TObject);
begin
  if maxState <> 0 then
  begin
    (Sender as TPanel).Align := alNone;
    maxState := 0;
    resizeForm(t);
  end
  else
  begin
    (Sender as TPanel).BringToFront;
    maxState := 1;
  end;
  maxResizeForm();
end;

procedure TVideoForm.VideoPanel2DblClick(Sender: TObject);
begin
  if maxState <> 0 then
  begin
    (Sender as TPanel).Align := alNone;
    maxState := 0;
    resizeForm(t);
  end
  else
  begin
    (Sender as TPanel).BringToFront;
    maxState := 2;
  end;
  maxResizeForm();
end;

procedure TVideoForm.VideoPanel3DblClick(Sender: TObject);
begin
  if maxState <> 0 then
  begin
    (Sender as TPanel).Align := alNone;
    maxState := 0;
    resizeForm(t);
  end
  else
  begin
    (Sender as TPanel).BringToFront;
    maxState := 3;
  end;
  maxResizeForm();
end;

procedure TVideoForm.VideoPanel4DblClick(Sender: TObject);
begin
  if maxState <> 0 then
  begin
    (Sender as TPanel).Align := alNone;
    maxState := 0;
    resizeForm(t);
  end
  else
  begin
    (Sender as TPanel).BringToFront;
    maxState := 4;
  end;
  maxResizeForm();
end;

procedure TVideoForm.VideoPanel1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, wm_SysCommand, $F012, 0);
end;

procedure TVideoForm.showScreenDate();
begin
  if videoType = 0 then
  begin
    HxnDVR_ShowDate(video1, showDate, dateX, dateY);
    HxnDVR_ShowDate(video2, showDate, dateX, dateY);
    HxnDVR_ShowDate(video3, showDate, dateX, dateY);
    HxnDVR_ShowDate(video4, showDate, dateX, dateY);
  end;
end;

procedure TVideoForm.showScreenTime();
begin
  if videoType = 0 then
  begin
    HxnDVR_ShowTime(video1, showTime, timeX, timeY);
    HxnDVR_ShowTime(video2, showTime, timeX, timeY);
    HxnDVR_ShowTime(video3, showTime, timeX, timeY);
    HxnDVR_ShowTime(video4, showTime, timeX, timeY);
  end;
end;

procedure TVideoForm.showScreenLogo();
begin
  if videoType = 0 then
  begin
    if logo = '' then
      logo := Chr(2);
    HxnDVR_SetLogoText(video1, logo);
    HxnDVR_ShowLogo(video1, showLogo, logoX, logoY);
    HxnDVR_SetLogoText(video2, logo);
    HxnDVR_ShowLogo(video2, showLogo, logoX, logoY);
    HxnDVR_SetLogoText(video3, logo);
    HxnDVR_ShowLogo(video3, showLogo, logoX, logoY);
    HxnDVR_SetLogoText(video4, logo);
    HxnDVR_ShowLogo(video4, showLogo, logoX, logoY);
  end;
end;

procedure TVideoForm.initVideoCard;
begin
  if use1 or use2 or use3 or use4 then
  begin
    if videoType = 0 then
    begin
      if HxnDVR_Init(handle) = 0 then
      begin
        Caption := '视频卡初始化失败';
      end
      else
      begin
        Caption := '视频卡初始化成功';
        if use1 then
          HxnDVR_ConnectDevice(video1, 0);
        if use2 then
          HxnDVR_ConnectDevice(video2, 0);
        if use3 then
          HxnDVR_ConnectDevice(video3, 0);
        if use4 then
          HxnDVR_ConnectDevice(video4, 0);
      end;
    end
    else if videoType = 1 then
    begin
      VideoPanel1.Color := RGB(255, 0, 255);
      VideoPanel2.Color := RGB(255, 0, 255);
      VideoPanel3.Color := RGB(255, 0, 255);
      VideoPanel4.Color := RGB(255, 0, 255);

      if not VCAInitSdk(VideoForm.Handle, TDisplayType(displayType), False) then
      begin
        Caption := '视频卡初始化失败';
      end
      else
      begin
        Caption := '视频卡初始化成功';
        VCAOpenDevice(video1, VideoPanel1.Handle);
        VCAOpenDevice(video2, VideoPanel2.Handle);
        VCAOpenDevice(video3, VideoPanel3.Handle);
        VCAOpenDevice(video4, VideoPanel4.Handle);

        MTALoadLibrary(7000, WORK_AS_SERVER);
        MTASetRequestTimeOut(5000);
        MTARegNotifier(ManageProc);
      end;
    end
    else if videoType = 2 then
    begin
      if not NET_DVR_Init then
      begin
        Caption := '视频模块初始化失败';
        Exit;
      end;
      if not NET_DVR_SetConnectTime(5000, 5) then
      begin
        Caption := '视频模块初始化失败';
        Exit;
      end;
      if not NET_DVR_SetReconnect(10000, True) then
      begin
        Caption := '视频模块初始化失败';
        Exit;
      end;
      uid := NET_DVR_Login_V30(PChar(ip), StrToIntDef(port, 8000), PChar(user), PChar(pass), @deviceInfo);
      if uid <> 0 then
      begin
        Caption := '视频模块登录失败';
        Exit;
      end;
      NET_DVR_MakeKeyFrame(uid, 1);
      Caption := '视频模块初始化成功';
    end;
  end;
end;

procedure TVideoForm.showScreen;
begin
  if videoType = 0 then
  begin
    if HxnDVR_IsConnected(video1) then
    begin
      HxnDVR_SetWindowPos(video1, VideoPanel1.Handle, nil);
    end;
    if HxnDVR_IsConnected(video2) then
    begin
      HxnDVR_SetWindowPos(video2, VideoPanel2.Handle, nil);
    end;
    if HxnDVR_IsConnected(video3) then
    begin
      HxnDVR_SetWindowPos(video3, VideoPanel3.Handle, nil);
    end;
    if HxnDVR_IsConnected(video4) then
    begin
      HxnDVR_SetWindowPos(video4, VideoPanel4.Handle, nil);
    end;
  end
  else if videoType = 1 then
  begin
    VCASetVidFieldFrq(video1, FIELD_FREQ_50HZ);
    VCAStartVideoPreview(video1);

    VCASetVidFieldFrq(video2, FIELD_FREQ_50HZ);
    VCAStartVideoPreview(video2);

    VCASetVidFieldFrq(video3, FIELD_FREQ_50HZ);
    VCAStartVideoPreview(video3);

    VCASetVidFieldFrq(video4, FIELD_FREQ_50HZ);
    VCAStartVideoPreview(video4);
  end
  else if videoType = 2 then
  begin
    if use1 then
    begin
      clientHandle[0].lChannel := video1 + 1;
      clientHandle[0].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
      clientHandle[0].hPlayWnd := VideoPanel1.Handle;
      realHandle[0] := NET_DVR_RealPlay_V30(uid, @clientHandle[0], nil, nil, False);
    end;
    if use2 then
    begin
      clientHandle[1].lChannel := video2 + 1;
      clientHandle[1].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
      clientHandle[1].hPlayWnd := VideoPanel2.Handle;
      realHandle[1] := NET_DVR_RealPlay_V30(uid, @clientHandle[1], nil, nil, False);
    end;
    if use3 then
    begin
      clientHandle[2].lChannel := video3 + 1;
      clientHandle[2].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
      clientHandle[2].hPlayWnd := VideoPanel3.Handle;
      realHandle[2] := NET_DVR_RealPlay_V30(uid, @clientHandle[2], nil, nil, False);
    end;
    if use4 then
    begin
      clientHandle[3].lChannel := video4 + 1;
      clientHandle[3].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
      clientHandle[3].hPlayWnd := VideoPanel4.Handle;
      realHandle[3] := NET_DVR_RealPlay_V30(uid, @clientHandle[3], nil, nil, False);
    end;
  end;
end;

procedure TVideoForm.TResizeTimer(Sender: TObject);
begin
  if Visible and (videoType = 1) then
  begin
    if (initX <> self.Left) or
      (initY <> Self.Top) or
      (initWidth <> Self.Width) or
      (initHeight <> Self.Height) then
    begin
      maxResizeForm();
      initX := self.Left;
      initY := Self.Top;
      initWidth := Self.Width;
      initHeight := Self.Height;
    end;
  end;
end;

procedure TVideoForm.maxResizeForm;
begin
  if videoType = 0 then
  begin
    HxnDVR_SetFullScreen(0, True);
  end
  else if (videoType = 1) then
  begin
    if maxState = 1 then
    begin
      VCAStopVideoPreview(video2);
      VCAStopVideoPreview(video3);
      VCAStopVideoPreview(video4);

      if maxForm = nil then maxForm := TForm.Create(nil);
      maxForm.BorderStyle := bsNone;
      maxForm.WindowState := wsMaximized;
      VideoPanel1.Align := alClient;
      VideoPanel1.Parent := maxForm;
      isMaximize := not isMaximize;

      VCAUpdateOverlayWnd(maxForm.Handle);
      VCAUpdateVideoPreview(video1, VideoPanel1.Handle);

      if not maxForm.Visible then maxForm.ShowModal;
    end
    else if maxState = 2 then
    begin
      VCAStopVideoPreview(video1);
      VCAStopVideoPreview(video3);
      VCAStopVideoPreview(video4);

      if maxForm = nil then maxForm := TForm.Create(nil);
      maxForm.BorderStyle := bsNone;
      maxForm.WindowState := wsMaximized;
      VideoPanel2.Align := alClient;
      VideoPanel2.Parent := maxForm;
      isMaximize := not isMaximize;

      VCAUpdateOverlayWnd(maxForm.Handle);
      VCAUpdateVideoPreview(video2, VideoPanel2.Handle);
      if not maxForm.Visible then maxForm.ShowModal;
    end
    else if maxState = 3 then
    begin
      VCAStopVideoPreview(video1);
      VCAStopVideoPreview(video2);
      VCAStopVideoPreview(video4);

      if maxForm = nil then maxForm := TForm.Create(nil);
      maxForm.BorderStyle := bsNone;
      maxForm.WindowState := wsMaximized;
      VideoPanel3.Align := alClient;
      VideoPanel3.Parent := maxForm;
      isMaximize := not isMaximize;

      VCAUpdateOverlayWnd(maxForm.Handle);
      VCAUpdateVideoPreview(video3, VideoPanel3.Handle);
      if not maxForm.Visible then maxForm.ShowModal;
    end
    else if maxState = 4 then
    begin
      VCAStopVideoPreview(video1);
      VCAStopVideoPreview(video2);
      VCAStopVideoPreview(video3);

      if maxForm = nil then maxForm := TForm.Create(nil);
      maxForm.BorderStyle := bsNone;
      maxForm.WindowState := wsMaximized;
      VideoPanel4.Align := alClient;
      VideoPanel4.Parent := maxForm;
      isMaximize := not isMaximize;

      VCAUpdateOverlayWnd(maxForm.Handle);
      VCAUpdateVideoPreview(video4, VideoPanel4.Handle);
      if not maxForm.Visible then maxForm.ShowModal;
    end
    else
    begin

      VCAStopVideoPreview(video1);
      VCAStopVideoPreview(video2);
      VCAStopVideoPreview(video3);
      VCAStopVideoPreview(video4);

      if maxForm <> nil then
        maxForm.Close;

      VideoPanel1.Align := alNone;
      VideoPanel1.Align := alNone;
      VideoPanel1.Align := alNone;
      VideoPanel1.Align := alNone;

      VideoPanel1.Parent := VideoForm;
      VideoPanel2.Parent := VideoForm;
      VideoPanel3.Parent := VideoForm;
      VideoPanel4.Parent := VideoForm;

      VCAUpdateOverlayWnd(VideoForm.Handle);
      if VideoPanel1.Visible then
        VCAUpdateVideoPreview(video1, VideoPanel1.Handle);
      if VideoPanel2.Visible then
        VCAUpdateVideoPreview(video2, VideoPanel2.Handle);
      if VideoPanel3.Visible then
        VCAUpdateVideoPreview(video3, VideoPanel3.Handle);
      if VideoPanel4.Visible then
        VCAUpdateVideoPreview(video4, VideoPanel4.Handle);
    end;
  end
  else if videoType = 2 then
  begin
    if not isMaximize then
    begin

      NET_DVR_StopRealPlay(realHandle[0]);
      NET_DVR_StopRealPlay(realHandle[1]);
      NET_DVR_StopRealPlay(realHandle[2]);
      NET_DVR_StopRealPlay(realHandle[3]);

      if maxForm = nil then maxForm := TForm.Create(nil);

      maxForm.BorderStyle := bsNone;
      maxForm.WindowState := wsMaximized;
      if maxState = 1 then
      begin
        VideoPanel1.Align := alClient;
        VideoPanel1.Parent := maxForm
      end
      else if maxState = 2 then
      begin
        VideoPanel2.Align := alClient;
        VideoPanel2.Parent := maxForm
      end
      else if maxState = 3 then
      begin
        VideoPanel3.Align := alClient;
        VideoPanel3.Parent := maxForm
      end
      else if maxState = 4 then
      begin
        VideoPanel4.Align := alClient;
        VideoPanel4.Parent := maxForm;
      end;
      isMaximize := not isMaximize;

      showScreen;
      if not maxForm.Visible then maxForm.ShowModal;
    end
    else
    begin

      NET_DVR_StopRealPlay(realHandle[0]);
      NET_DVR_StopRealPlay(realHandle[1]);
      NET_DVR_StopRealPlay(realHandle[2]);
      NET_DVR_StopRealPlay(realHandle[3]);

      if maxForm <> nil then
        maxForm.Close;

      VideoPanel1.Align := alNone;
      VideoPanel1.Align := alNone;
      VideoPanel1.Align := alNone;
      VideoPanel1.Align := alNone;

      VideoPanel1.Parent := VideoForm;
      VideoPanel2.Parent := VideoForm;
      VideoPanel3.Parent := VideoForm;
      VideoPanel4.Parent := VideoForm;

      showScreen;

      isMaximize := not isMaximize;
    end;
  end;
end;

procedure TVideoForm.setPanelWin(t: Integer);
begin
  case t of
    1: begin
        ClientWidth := ClientHeight * 4 div 3;
      end;
    2: begin
        ClientWidth := ClientHeight * 4 div 3 * 2;
      end;
    3: begin
        ClientWidth := ClientHeight * 4 div 3 * 3;
      end;
    4: begin
        ClientWidth := ClientHeight * 4 div 3 * 4;
      end;
    5: begin
        ClientWidth := ClientHeight * 4 div 3 div 2;
      end;
    6: begin
        ClientWidth := ClientHeight * 4 div 3;
      end;
    7: begin
        ClientWidth := ClientHeight * 4 div 3 div 3;
      end;
    8: begin
        ClientWidth := ClientHeight * 4 div 3 div 4;
      end;
  end;
end;

//if (maxState = 1) or (maxState = 2) or (maxState = 3) or (maxState = 4) then
//begin
//  PostMessage(self.Handle, WM_SYSCOMMAND, SC_MAXIMIZE, 0); //最大化
//  setwindowlong(handle, gwl_style, getwindowlong(handle, gwl_style) xor ws_caption);
//end
//else
//begin
//  PostMessage(self.Handle, WM_SYSCOMMAND, SC_RESTORE, 0); //恢复
//end;

end.

