unit Video;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, HCNETSDK,
  ExtCtrls, Menus, IniFiles, DS104, PropStorageEh, PropFilerEh, Dialogs, DHNetSDK;

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
    TRecord: TTimer;
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
    procedure TRecordTimer(Sender: TObject);
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
    //大华录像机参数
    dhDeviceInfo: NET_DEVICEINFO;
    lastError: Integer;
    //IPC摄像头参数
    type1, type2, type3, type4: Integer;
    ip1, ip2, ip3, ip4: string;
    port1, port2, port3, port4: Integer;
    user1, user2, user3, user4: string;
    pass1, pass2, pass3, pass4: string;
    deviceInfo1, deviceInfo2, deviceInfo3, deviceInfo4: NET_DVR_DEVICEINFO_V30;
    uid1, uid2, uid3, uid4: Integer;
    dhDeviceInfo1, dhDeviceInfo2, dhDeviceInfo3, dhDeviceInfo4: NET_DEVICEINFO;
    useRecord: Boolean;
    recordAddr: string;
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
    //图片上叠加文字
    usePicText, showCar, showFaHuo, showShouHuo, showGoods, showSpec,
      showGross, showTare, showNet: Boolean;
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
    procedure startRecord();
    procedure stopRecord();
    procedure addPicText();
  end;

var
  VideoForm: TVideoForm;

implementation

uses VC404, CommonUtil, MediaTran, jpeg, Graphics, StrUtils, Main;

{$R *.dfm}

{ TVideoForm }

 //服务器断开函数

procedure DisConnect(lLoginID: LongInt; strDVRIP: Pchar; nDVRPort: LongInt;
  dwUser: LongWord); stdcall;
begin
end;

procedure HaveReConnect(lLoginID: LongInt; strDVRIP: PChar; nDVRPort: LongInt;
  dwUser: LongWord); stdcall;
begin
end;

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
    displayType := myini.ReadInteger('video', 'display_type', 3);

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

    type1 := myini.ReadInteger('video', 'type1', 0);
    ip1 := myini.ReadString('video', 'ip1', '192.168.1.100');
    port1 := myini.ReadInteger('video', 'port1', 8000);
    user1 := myini.ReadString('video', 'user1', 'admin');
    pass1 := TCommonUtil.deBase64(myini.ReadString('video', 'pass1', 'MTIzNDU='));

    type2 := myini.ReadInteger('video', 'type2', 0);
    ip2 := myini.ReadString('video', 'ip2', '192.168.1.101');
    port2 := myini.ReadInteger('video', 'port2', 8000);
    user2 := myini.ReadString('video', 'user2', 'admin');
    pass2 := TCommonUtil.deBase64(myini.ReadString('video', 'pass2', 'MTIzNDU='));

    type3 := myini.ReadInteger('video', 'type3', 0);
    ip3 := myini.ReadString('video', 'ip3', '192.168.1.102');
    port3 := myini.ReadInteger('video', 'port3', 8000);
    user3 := myini.ReadString('video', 'user3', 'admin');
    pass3 := TCommonUtil.deBase64(myini.ReadString('video', 'pass3', 'MTIzNDU='));

    type4 := myini.ReadInteger('video', 'type4', 0);
    ip4 := myini.ReadString('video', 'ip4', '192.168.1.103');
    port4 := myini.ReadInteger('video', 'port4', 8000);
    user4 := myini.ReadString('video', 'user4', 'admin');
    pass4 := TCommonUtil.deBase64(myini.ReadString('video', 'pass4', 'MTIzNDU='));

    useRecord := myini.ReadBool('video', 'use_record', False);
    recordAddr := myini.ReadString('video', 'record_addr', 'D:\Record\');

    usePicText := myini.ReadBool('video', 'use_pic_text', False);
    showCar := myini.ReadBool('video', 'show_car', False);
    showFaHuo := myini.ReadBool('video', 'show_faHuo', False);
    showShouHuo := myini.ReadBool('video', 'show_shouHuo', False);
    showGoods := myini.ReadBool('video', 'show_goods', False);
    showSpec := myini.ReadBool('video', 'show_spec', False);
    showGross := myini.ReadBool('video', 'show_gross', False);
    showTare := myini.ReadBool('video', 'show_tare', False);
    showNet := myini.ReadBool('video', 'show_net', False);
  finally
    myini.Free;
  end;
end;

procedure TVideoForm.takePhoto();
var bmp: TBitmap;
  jpg: TJPEGImage;
begin
  case videoType of
    0: begin
        if use1 then HxnDVR_SaveToJpgFile(video1, ExtractFilePath(Application.ExeName) + 'P0.jpg', 100);
        if use2 then HxnDVR_SaveToJpgFile(video2, ExtractFilePath(Application.ExeName) + 'P1.jpg', 100);
        if use3 then HxnDVR_SaveToJpgFile(video3, ExtractFilePath(Application.ExeName) + 'P2.jpg', 100);
        if use4 then HxnDVR_SaveToJpgFile(video4, ExtractFilePath(Application.ExeName) + 'P3.jpg', 100);
      end;
    1: begin
        if use1 then VCASaveAsJpegFile(video1, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.jpg'), 100);
        if use2 then VCASaveAsJpegFile(video2, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.jpg'), 100);
        if use3 then VCASaveAsJpegFile(video3, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.jpg'), 100);
        if use4 then VCASaveAsJpegFile(video4, PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.jpg'), 100);
      end;
    2: begin
        NET_DVR_SetCapturePictureMode(JPEG_MODE);
        if use1 then NET_DVR_CapturePicture(realHandle[0], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.jpg'));
        if use2 then NET_DVR_CapturePicture(realHandle[1], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.jpg'));
        if use3 then NET_DVR_CapturePicture(realHandle[2], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.jpg'));
        if use4 then NET_DVR_CapturePicture(realHandle[3], PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.jpg'));
      end;
    3: begin
        if use1 then CLIENT_CapturePicture(realHandle[0],
            PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.bmp'));
        if use2 then CLIENT_CapturePicture(realHandle[1],
            PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.bmp'));
        if use3 then CLIENT_CapturePicture(realHandle[2],
            PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.bmp'));
        if use4 then CLIENT_CapturePicture(realHandle[3],
            PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.bmp'));
        bmp := TBitmap.Create;
        jpg := TJPEGImage.Create;
        try
          if FileExists(ExtractFilePath(Application.ExeName) + 'P0.bmp') then
          begin
            bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P0.bmp');
            jpg.Assign(bmp);
            jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P0.jpg');
          end;
          if FileExists(ExtractFilePath(Application.ExeName) + 'P1.bmp') then
          begin
            bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P1.bmp');
            jpg.Assign(bmp);
            jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P1.jpg');
          end;
          if FileExists(ExtractFilePath(Application.ExeName) + 'P2.bmp') then
          begin
            bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P2.bmp');
            jpg.Assign(bmp);
            jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P2.jpg');
          end;
          if FileExists(ExtractFilePath(Application.ExeName) + 'P3.bmp') then
          begin
            bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P3.bmp');
            jpg.Assign(bmp);
            jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P3.jpg');
          end;
        finally
          if FileExists(ExtractFilePath(Application.ExeName) + 'P0.bmp') then
            DeleteFile(ExtractFilePath(Application.ExeName) + 'P0.bmp');
          if FileExists(ExtractFilePath(Application.ExeName) + 'P1.bmp') then
            DeleteFile(ExtractFilePath(Application.ExeName) + 'P1.bmp');
          if FileExists(ExtractFilePath(Application.ExeName) + 'P2.bmp') then
            DeleteFile(ExtractFilePath(Application.ExeName) + 'P2.bmp');
          if FileExists(ExtractFilePath(Application.ExeName) + 'P3.bmp') then
            DeleteFile(ExtractFilePath(Application.ExeName) + 'P3.bmp');
          bmp.Free;
          jpg.Free;
        end;
      end;
    4: begin
        if type1 = 0 then
        begin
          if use1 then
          begin
            NET_DVR_SetCapturePictureMode(JPEG_MODE);
            NET_DVR_CapturePicture(realHandle[0],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.jpg'));
          end
        end
        else if type1 = 1 then
        begin
          if use1 then
          begin
            CLIENT_CapturePicture(realHandle[0],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P0.bmp'));
            bmp := TBitmap.Create;
            jpg := TJPEGImage.Create;
            try
              if FileExists(ExtractFilePath(Application.ExeName) + 'P0.bmp') then
              begin
                bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P0.bmp');
                jpg.Assign(bmp);
                jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P0.jpg');
              end;
            finally
              if FileExists(ExtractFilePath(Application.ExeName) + 'P0.bmp') then
                DeleteFile(ExtractFilePath(Application.ExeName) + 'P0.bmp');
              bmp.Free;
              jpg.Free;
            end;
          end;
        end;

        if type2 = 0 then
        begin
          if use2 then
          begin
            NET_DVR_SetCapturePictureMode(JPEG_MODE);
            NET_DVR_CapturePicture(realHandle[1],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.jpg'));
          end;
        end
        else if type2 = 1 then
        begin
          if use2 then
          begin
            CLIENT_CapturePicture(realHandle[1],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P1.bmp'));
            bmp := TBitmap.Create;
            jpg := TJPEGImage.Create;
            try
              if FileExists(ExtractFilePath(Application.ExeName) + 'P1.bmp') then
              begin
                bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P1.bmp');
                jpg.Assign(bmp);
                jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P1.jpg');
              end;
            finally
              if FileExists(ExtractFilePath(Application.ExeName) + 'P1.bmp') then
                DeleteFile(ExtractFilePath(Application.ExeName) + 'P1.bmp');
              bmp.Free;
              jpg.Free;
            end;
          end;
        end;

        if type3 = 0 then
        begin
          if use3 then
          begin
            NET_DVR_SetCapturePictureMode(JPEG_MODE);
            NET_DVR_CapturePicture(realHandle[2],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.jpg'));
          end;
        end
        else if type3 = 1 then
        begin
          if use3 then
          begin
            CLIENT_CapturePicture(realHandle[2],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P2.bmp'));
            bmp := TBitmap.Create;
            jpg := TJPEGImage.Create;
            try
              if FileExists(ExtractFilePath(Application.ExeName) + 'P2.bmp') then
              begin
                bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P2.bmp');
                jpg.Assign(bmp);
                jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P2.jpg');
              end;
            finally
              if FileExists(ExtractFilePath(Application.ExeName) + 'P2.bmp') then
                DeleteFile(ExtractFilePath(Application.ExeName) + 'P2.bmp');
              bmp.Free;
              jpg.Free;
            end;
          end;
        end;

        if type4 = 0 then
        begin
          if use4 then
          begin
            NET_DVR_SetCapturePictureMode(JPEG_MODE);
            NET_DVR_CapturePicture(realHandle[3],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.jpg'));
          end
        end
        else if type4 = 1 then
        begin
          if use4 then
          begin
            CLIENT_CapturePicture(realHandle[3],
              PAnsiChar(ExtractFilePath(Application.ExeName) + 'P3.bmp'));
            bmp := TBitmap.Create;
            jpg := TJPEGImage.Create;
            try
              if FileExists(ExtractFilePath(Application.ExeName) + 'P3.bmp') then
              begin
                bmp.LoadFromFile(ExtractFilePath(Application.ExeName) + 'P3.bmp');
                jpg.Assign(bmp);
                jpg.SaveToFile(ExtractFilePath(Application.ExeName) + 'P3.jpg');
              end;
            finally
              if FileExists(ExtractFilePath(Application.ExeName) + 'P3.bmp') then
                DeleteFile(ExtractFilePath(Application.ExeName) + 'P3.bmp');
              bmp.Free;
              jpg.Free;
            end;
          end;
        end;
      end;
  end;
end;

procedure TVideoForm.FormDestroy(Sender: TObject);
begin
  TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'video.ini').WriteInteger('video', 'form_type', t);
  case videoType of
    0: begin
        if HxnDVR_IsConnected(video1) then
          HxnDVR_DisconnectDevice(video1);
        if HxnDVR_IsConnected(video2) then
          HxnDVR_DisconnectDevice(video2);
        if HxnDVR_IsConnected(video3) then
          HxnDVR_DisconnectDevice(video3);
        if HxnDVR_IsConnected(video4) then
          HxnDVR_DisconnectDevice(video4);

        HxnDVR_UnInit;
      end;
    1: begin
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
      end;
    2: begin
        NET_DVR_StopRealPlay(realHandle[0]);
        NET_DVR_StopRealPlay(realHandle[1]);
        NET_DVR_StopRealPlay(realHandle[2]);
        NET_DVR_StopRealPlay(realHandle[3]);
        NET_DVR_Logout(uid);
        NET_DVR_Cleanup;
      end;
    3: begin
        CLIENT_StopRealPlay(realHandle[0]);
        CLIENT_StopRealPlay(realHandle[1]);
        CLIENT_StopRealPlay(realHandle[2]);
        CLIENT_StopRealPlay(realHandle[3]);
        CLIENT_Logout(uid);
        CLIENT_Cleanup;
      end;
    4: begin
        if type1 = 0 then NET_DVR_StopRealPlay(realHandle[0])
        else if type1 = 1 then CLIENT_StopRealPlay(realHandle[0]);

        if type2 = 0 then NET_DVR_StopRealPlay(realHandle[1])
        else if type2 = 1 then CLIENT_StopRealPlay(realHandle[1]);

        if type3 = 0 then NET_DVR_StopRealPlay(realHandle[2])
        else if type3 = 1 then CLIENT_StopRealPlay(realHandle[2]);

        if type4 = 0 then NET_DVR_StopRealPlay(realHandle[3])
        else if type4 = 1 then CLIENT_StopRealPlay(realHandle[3]);

        if (type1 = 0) or (type2 = 0) or (type3 = 0) or (type4 = 0) then
        begin
          NET_DVR_Logout(uid);
          NET_DVR_Cleanup;
        end;

        if (type1 = 1) or (type2 = 1) or (type3 = 1) or (type4 = 1) then
        begin
          CLIENT_Logout(uid);
          CLIENT_Cleanup;
        end;
      end;
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
    case videoType of
      0: begin
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
        end;
      1: begin
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
        end;
      2: begin
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
      3: begin
          if not CLIENT_Init(DisConnect, 0) then
          begin
            Caption := '视频模块初始化失败';
            Exit;
          end;
          CLIENT_SetConnectTime(5000, 5);
          CLIENT_SetAutoReconnect(HaveReConnect, 0);
          uid := CLIENT_Login(ip, StrToIntDef(port, 37777), user, pass, dhDeviceInfo, lastError);
          if uid = 0 then
          begin
            Caption := '视频模块登录失败';
            Exit;
          end;
          Caption := '视频模块初始化成功';
        end;
      4: begin
          if (type1 = 0) or (type2 = 0) or (type3 = 0) or (type4 = 0) then
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
          end;

          if (type1 = 1) or (type2 = 1) or (type3 = 1) or (type4 = 1) then
          begin
            if not CLIENT_Init(DisConnect, 0) then
            begin
              Caption := '视频模块初始化失败';
              Exit;
            end;
            CLIENT_SetConnectTime(5000, 5);
            CLIENT_SetAutoReconnect(HaveReConnect, 0);
          end;

          if use1 then
          begin
            if type1 = 0 then
            begin
              uid1 := NET_DVR_Login_V30(PChar(ip1), port1,
                PChar(user1), PChar(pass1), @deviceInfo1);
              if uid1 <> 0 then
              begin
                Caption := Caption + '1#IPC登录失败,';
              end;
              NET_DVR_MakeKeyFrame(uid1, 1);
            end
            else if type1 = 1 then
            begin
              uid1 := CLIENT_Login(ip1, port1, user1, pass1,
                dhDeviceInfo1, lastError);
              if uid1 = 0 then
              begin
                Caption := Caption + '1#IPC登录失败,';
              end;
            end;
          end;

          if use2 then
          begin
            if type2 = 0 then
            begin
              uid2 := NET_DVR_Login_V30(PChar(ip2), port2,
                PChar(user2), PChar(pass2), @deviceInfo2);
              if uid2 <> 0 then
              begin
                Caption := Caption + '2#IPC登录失败,';
              end;
              NET_DVR_MakeKeyFrame(uid2, 1);
            end
            else if type2 = 1 then
            begin
              uid2 := CLIENT_Login(ip2, port2, user2, pass2,
                dhDeviceInfo2, lastError);
              if uid2 = 0 then
              begin
                Caption := Caption + '2#IPC登录失败,';
              end;
            end;
          end;

          if use3 then
          begin
            if type3 = 0 then
            begin
              uid3 := NET_DVR_Login_V30(PChar(ip3), port3,
                PChar(user3), PChar(pass3), @deviceInfo3);
              if uid3 <> 0 then
              begin
                Caption := Caption + '3#IPC登录失败,';
              end;
              NET_DVR_MakeKeyFrame(uid3, 1);
            end
            else if type3 = 1 then
            begin
              uid3 := CLIENT_Login(ip3, port3, user3, pass3,
                dhDeviceInfo3, lastError);
              if uid3 = 0 then
              begin
                Caption := Caption + '3#IPC登录失败,';
              end;
            end;
          end;

          if use4 then
          begin
            if type4 = 0 then
            begin
              uid4 := NET_DVR_Login_V30(PChar(ip4), port4,
                PChar(user4), PChar(pass4), @deviceInfo4);
              if uid4 <> 0 then
              begin
                Caption := Caption + '4#IPC登录失败,';
              end;
              NET_DVR_MakeKeyFrame(uid4, 1);
            end
            else if type4 = 1 then
            begin
              uid4 := CLIENT_Login(ip4, port4, user4, pass4,
                dhDeviceInfo4, lastError);
              if uid4 = 0 then
              begin
                Caption := Caption + '4#IPC登录失败,';
              end;
            end;
          end;
          Caption := '视频模块初始化成功';
        end;
    end;
  end;
end;

procedure TVideoForm.showScreen;
begin
  case videoType of
    0: begin
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
      end;
    1: begin
        VCASetVidFieldFrq(video1, FIELD_FREQ_50HZ);
        VCAStartVideoPreview(video1);

        VCASetVidFieldFrq(video2, FIELD_FREQ_50HZ);
        VCAStartVideoPreview(video2);

        VCASetVidFieldFrq(video3, FIELD_FREQ_50HZ);
        VCAStartVideoPreview(video3);

        VCASetVidFieldFrq(video4, FIELD_FREQ_50HZ);
        VCAStartVideoPreview(video4);
      end;
    2: begin
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
    3: begin
        if use1 then
        begin
          realHandle[0] := CLIENT_RealPlay(uid, video1, VideoPanel1.Handle);
        end;
        if use2 then
        begin
          realHandle[1] := CLIENT_RealPlay(uid, video2, VideoPanel2.Handle);
        end;
        if use3 then
        begin
          realHandle[2] := CLIENT_RealPlay(uid, video3, VideoPanel3.Handle);
        end;
        if use4 then
        begin
          realHandle[3] := CLIENT_RealPlay(uid, video4, VideoPanel4.Handle);
        end;
      end;
    4: begin

        if use1 then
        begin
          if type1 = 0 then
          begin
            clientHandle[0].lChannel := 1;
            clientHandle[0].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
            clientHandle[0].hPlayWnd := VideoPanel1.Handle;
            realHandle[0] := NET_DVR_RealPlay_V30(uid1, @clientHandle[0], nil, nil, False);
          end
          else if type1 = 1 then
          begin
            realHandle[0] := CLIENT_RealPlay(uid1, 0, VideoPanel1.Handle);
          end;
        end;

        if use2 then
        begin
          if type2 = 0 then
          begin
            clientHandle[1].lChannel := 1;
            clientHandle[1].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
            clientHandle[1].hPlayWnd := VideoPanel2.Handle;
            realHandle[1] := NET_DVR_RealPlay_V30(uid2, @clientHandle[1], nil, nil, False);
          end
          else if type2 = 1 then
          begin
            realHandle[1] := CLIENT_RealPlay(uid2, 0, VideoPanel2.Handle);
          end;
        end;
        if use3 then
        begin
          if type3 = 0 then
          begin
            clientHandle[2].lChannel := 1;
            clientHandle[2].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
            clientHandle[2].hPlayWnd := VideoPanel3.Handle;
            realHandle[2] := NET_DVR_RealPlay_V30(uid3, @clientHandle[2], nil, nil, False);
          end
          else if type3 = 1 then
          begin
            realHandle[2] := CLIENT_RealPlay(uid3, 0, VideoPanel3.Handle);
          end;
        end;
        if use4 then
        begin
          if type4 = 0 then
          begin
            clientHandle[3].lChannel := 1;
            clientHandle[3].lLinkMode := 0; //0－TCP方式；1－UDP方式；2－多播方式；3－RTP方式;
            clientHandle[3].hPlayWnd := VideoPanel4.Handle;
            realHandle[3] := NET_DVR_RealPlay_V30(uid4, @clientHandle[3], nil, nil, False);
          end
          else if type4 = 1 then
          begin
            realHandle[3] := CLIENT_RealPlay(uid4, 0, VideoPanel4.Handle);
          end;
        end;
      end;
  end;
  if useRecord then
  begin
    startRecord;
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
  case videoType of
    0: begin
        HxnDVR_SetFullScreen(0, True);
      end;
    1: begin
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
          VideoPanel2.Align := alNone;
          VideoPanel3.Align := alNone;
          VideoPanel4.Align := alNone;

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
      end;
    2: begin
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
          VideoPanel2.Align := alNone;
          VideoPanel3.Align := alNone;
          VideoPanel4.Align := alNone;

          VideoPanel1.Parent := VideoForm;
          VideoPanel2.Parent := VideoForm;
          VideoPanel3.Parent := VideoForm;
          VideoPanel4.Parent := VideoForm;

          showScreen;

          isMaximize := not isMaximize;
        end;
      end;
    3: begin
        if not isMaximize then
        begin

          CLIENT_StopRealPlay(realHandle[0]);
          CLIENT_StopRealPlay(realHandle[1]);
          CLIENT_StopRealPlay(realHandle[2]);
          CLIENT_StopRealPlay(realHandle[3]);

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

          Client_StopRealPlay(realHandle[0]);
          Client_StopRealPlay(realHandle[1]);
          Client_StopRealPlay(realHandle[2]);
          Client_StopRealPlay(realHandle[3]);

          if maxForm <> nil then
            maxForm.Close;

          VideoPanel1.Align := alNone;
          VideoPanel2.Align := alNone;
          VideoPanel3.Align := alNone;
          VideoPanel4.Align := alNone;

          VideoPanel1.Parent := VideoForm;
          VideoPanel2.Parent := VideoForm;
          VideoPanel3.Parent := VideoForm;
          VideoPanel4.Parent := VideoForm;

          showScreen;

          isMaximize := not isMaximize;
        end;
      end;
    4: begin
        if not isMaximize then
        begin
          if type1 = 0 then
            NET_DVR_StopRealPlay(realHandle[0])
          else
            CLIENT_StopRealPlay(realHandle[0]);

          if type2 = 0 then
            NET_DVR_StopRealPlay(realHandle[1])
          else
            CLIENT_StopRealPlay(realHandle[1]);

          if type3 = 0 then
            NET_DVR_StopRealPlay(realHandle[2])
          else
            CLIENT_StopRealPlay(realHandle[2]);

          if type4 = 0 then
            NET_DVR_StopRealPlay(realHandle[3])
          else
            CLIENT_StopRealPlay(realHandle[3]);

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
          if type1 = 0 then
            NET_DVR_StopRealPlay(realHandle[0])
          else
            CLIENT_StopRealPlay(realHandle[0]);

          if type2 = 0 then
            NET_DVR_StopRealPlay(realHandle[1])
          else
            CLIENT_StopRealPlay(realHandle[1]);

          if type3 = 0 then
            NET_DVR_StopRealPlay(realHandle[2])
          else
            CLIENT_StopRealPlay(realHandle[2]);

          if type4 = 0 then
            NET_DVR_StopRealPlay(realHandle[3])
          else
            CLIENT_StopRealPlay(realHandle[3]);

          if maxForm <> nil then
            maxForm.Close;

          VideoPanel1.Align := alNone;
          VideoPanel2.Align := alNone;
          VideoPanel3.Align := alNone;
          VideoPanel4.Align := alNone;

          VideoPanel1.Parent := VideoForm;
          VideoPanel2.Parent := VideoForm;
          VideoPanel3.Parent := VideoForm;
          VideoPanel4.Parent := VideoForm;

          showScreen;

          isMaximize := not isMaximize;
        end;
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

procedure TVideoForm.TRecordTimer(Sender: TObject);
var lpFreeBytesAvailableToCaller,
  lpTotalNumberOfBytes,
    lpTotalNumberOfFreeBytes: TLargeInteger;
  leftSpace: Double;
  recordDir, recordFile: string;
begin
  if GetDiskFreeSpaceEx(PAnsiChar(LeftStr(recordAddr, 3)),
    lpFreeBytesAvailableToCaller,
    lpTotalNumberOfBytes, @lpTotalNumberOfFreeBytes) then
    leftSpace := lpTotalNumberOfFreeBytes / 1024 / 1024;
  if leftSpace < 100 then
    Exit;
  recordDir := recordAddr + FormatDateTime('yyMMdd', Date) + '\';
  if not DirectoryExists(recordDir) then
    ForceDirectories(recordDir);
  if FormatDateTime('ss', Time) = '00' then
  begin
    case videoType of
      4: begin
          if use1 then
          begin
            if type1 = 0 then
            begin
              NET_DVR_StopSaveRealData(realHandle[0]);
              recordFile := '1_' + FormatDateTime('HHmmss', Time) + '.avi';
              NET_DVR_SaveRealData(realHandle[0], recordDir + recordFile);
            end
            else
            begin
              CLIENT_StopSaveRealData(realHandle[0]);
              recordFile := '1_' + FormatDateTime('HHmmss', Time) + '.dav';
              CLIENT_SaveRealData(realHandle[0], recordDir + recordFile);
            end;
          end;
          if use2 then
          begin
            if type2 = 0 then
            begin
              NET_DVR_StopSaveRealData(realHandle[1]);
              recordFile := '2_' + FormatDateTime('HHmmss', Time) + '.avi';
              NET_DVR_SaveRealData(realHandle[1], recordDir + recordFile);
            end
            else
            begin
              CLIENT_StopSaveRealData(realHandle[1]);
              recordFile := '2_' + FormatDateTime('HHmmss', Time) + '.dav';
              CLIENT_SaveRealData(realHandle[1], recordDir + recordFile);
            end;
          end;
          if use3 then
          begin
            if type3 = 0 then
            begin
              NET_DVR_StopSaveRealData(realHandle[2]);
              recordFile := '3_' + FormatDateTime('HHmmss', Time) + '.avi';
              NET_DVR_SaveRealData(realHandle[2], recordDir + recordFile);
            end
            else
            begin
              CLIENT_StopSaveRealData(realHandle[2]);
              recordFile := '3_' + FormatDateTime('HHmmss', Time) + '.dav';
              CLIENT_SaveRealData(realHandle[2], recordDir + recordFile);
            end;
          end;
          if use4 then
          begin
            if type4 = 0 then
            begin
              NET_DVR_StopSaveRealData(realHandle[3]);
              recordFile := '4_' + FormatDateTime('HHmmss', Time) + '.avi';
              NET_DVR_SaveRealData(realHandle[3], recordDir + recordFile);
            end
            else
            begin
              CLIENT_StopSaveRealData(realHandle[3]);
              recordFile := '4_' + FormatDateTime('HHmmss', Time) + '.dav';
              CLIENT_SaveRealData(realHandle[3], recordDir + recordFile);
            end;
          end;
        end;
    end;
  end;
end;

procedure TVideoForm.startRecord;
var recordDir, recordFile: string;
begin
  recordDir := recordAddr + FormatDateTime('yyMMdd', Date) + '\';
  if not DirectoryExists(recordDir) then
    ForceDirectories(recordDir);
  case videoType of
    4: begin
        if use1 then
        begin
          if type1 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[0]);
            recordFile := '1_' + FormatDateTime('HHmmss', Time) + '.avi';
            NET_DVR_SaveRealData(realHandle[0], recordDir + recordFile);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[0]);
            recordFile := '1_' + FormatDateTime('HHmmss', Time) + '.dav';
            CLIENT_SaveRealData(realHandle[0], recordDir + recordFile);
          end;
        end;
        if use2 then
        begin
          if type2 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[1]);
            recordFile := '2_' + FormatDateTime('HHmmss', Time) + '.avi';
            NET_DVR_SaveRealData(realHandle[1], recordDir + recordFile);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[1]);
            recordFile := '2_' + FormatDateTime('HHmmss', Time) + '.dav';
            CLIENT_SaveRealData(realHandle[1], recordDir + recordFile);
          end;
        end;
        if use3 then
        begin
          if type3 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[2]);
            recordFile := '3_' + FormatDateTime('HHmmss', Time) + '.avi';
            NET_DVR_SaveRealData(realHandle[2], recordDir + recordFile);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[2]);
            recordFile := '3_' + FormatDateTime('HHmmss', Time) + '.dav';
            CLIENT_SaveRealData(realHandle[2], recordDir + recordFile);
          end;
        end;
        if use4 then
        begin
          if type4 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[3]);
            recordFile := '4_' + FormatDateTime('HHmmss', Time) + '.avi';
            NET_DVR_SaveRealData(realHandle[3], recordDir + recordFile);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[3]);
            recordFile := '4_' + FormatDateTime('HHmmss', Time) + '.dav';
            CLIENT_SaveRealData(realHandle[3], recordDir + recordFile);
          end;
        end;
      end;
  end;
  TRecord.Enabled := True;
end;

procedure TVideoForm.stopRecord;
begin
  case videoType of
    4: begin
        if use1 then
        begin
          if type1 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[0]);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[0]);
          end;
        end;
        if use2 then
        begin
          if type2 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[1]);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[1]);
          end;
        end;
        if use3 then
        begin
          if type3 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[2]);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[2]);
          end;
        end;
        if use4 then
        begin
          if type4 = 0 then
          begin
            NET_DVR_StopSaveRealData(realHandle[3]);
          end
          else
          begin
            CLIENT_StopSaveRealData(realHandle[3]);
          end;
        end;
      end;
  end;
  TRecord.Enabled := False;
end;

procedure TVideoForm.addPicText();

  procedure addText(p: string);
  var
    Bmp: TBitmap;
    Jpg: TJpegImage;
  begin
    if FileExists(p) then
    begin
      try
        Bmp := TBitmap.Create;
        Jpg := TjpegImage.Create;
        Jpg.LoadFromFile(p);
        Bmp.Assign(Jpg);
        Bmp.Canvas.Brush.Style := bsClear;
        Bmp.Canvas.Font.Color := clWhite;
        Bmp.Canvas.Font.Size := 30;

        Bmp.Canvas.TextOut(10, 20, FormatDateTime('yyyy-MM-dd hh:nn:ss', Now));
        if MainForm.FrmWeight1.weightType = 'update' then
          Bmp.Canvas.TextOut(10, 70, MainForm.FrmWeight1.updateRecNo)
        else
          Bmp.Canvas.TextOut(10, 70, MainForm.FrmWeight1.maxGlideNo);

        if showCar then
          Bmp.Canvas.TextOut(10, 120, MainForm.FrmWeight1.CBCar.Text);
        if showFaHuo then
          Bmp.Canvas.TextOut(10, 170, MainForm.FrmWeight1.CBFaHuo.Text);
        if showShouHuo then
          Bmp.Canvas.TextOut(10, 220, MainForm.FrmWeight1.CBShouHuo.Text);
        if showGoods then
          Bmp.Canvas.TextOut(10, 270, MainForm.FrmWeight1.CBGoods.Text);
        if showSpec then
          Bmp.Canvas.TextOut(10, 320, MainForm.FrmWeight1.CBSpec.Text);
        if showGross then
          Bmp.Canvas.TextOut(10, 370, MainForm.FrmWeight1.EdtGross.Text);
        if showTare then
          Bmp.Canvas.TextOut(10, 420, MainForm.FrmWeight1.EdtTare.Text);
        if showNet then
          Bmp.Canvas.TextOut(10, 470, MainForm.FrmWeight1.EdtNet.Text);

        Jpg.Assign(Bmp);
        Jpg.SaveToFile(p);
      finally
        bmp.Free;
        jpg.Free;
      end;
    end;
  end;

begin

  if usePicText then
  begin
    addText(ExtractFilePath(Application.ExeName) + 'P0.jpg');
    addText(ExtractFilePath(Application.ExeName) + 'P1.jpg');
    addText(ExtractFilePath(Application.ExeName) + 'P2.jpg');
    addText(ExtractFilePath(Application.ExeName) + 'P3.jpg');
  end;

end;

end.

