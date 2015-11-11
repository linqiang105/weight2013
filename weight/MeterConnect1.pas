unit MeterConnect1;

interface

uses
  Classes, Controls, Forms, Dialogs, StdCtrls, Buttons, StrUtils,
  ExtCtrls, inifiles, CPDrv, DBCtrlsEh, Graphics,
  SysUtils, Math, IdAntiFreeze, IdUDPServer,
  IdUDPBase, IdUDPClient, IdSocketHandle, IdAntiFreezeBase,
  IdBaseComponent, IdComponent, Mask, RzPanel, RzSplit;

type
  TMeterConnect1Form = class(TForm)
    PTitle: TPanel;
    TSend: TTimer;
    IdUDPC: TIdUDPClient;
    IdUDPS: TIdUDPServer;
    IdAntiFreeze1: TIdAntiFreeze;
    PSetting: TPanel;
    lblMeterType: TLabel;
    SBClear: TSpeedButton;
    BitBtnCancel: TBitBtn;
    PComParam: TPanel;
    lblCom: TLabel;
    lblBaut: TLabel;
    lblDataBit: TLabel;
    lblStopBit: TLabel;
    lblParity: TLabel;
    lblPollingDelay: TLabel;
    ComPort: TComboBox;
    BaudRate: TComboBox;
    ByteSize: TComboBox;
    StopBits: TComboBox;
    Parity: TComboBox;
    PollingDelay: TDBNumberEditEh;
    BitBtnApply: TBitBtn;
    CBMeterType: TComboBox;
    CBUseMeter: TCheckBox;
    MemoLog: TMemo;
    GBChange: TGroupBox;
    RBTen: TRadioButton;
    RBSixteen: TRadioButton;
    TScreen: TTimer;
    TUDPClient: TTimer;
    CommP: TCommPortDriver;
    Label4: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CBMeterUnit: TComboBox;
    CBSoftUnit: TComboBox;
    LEMeterShowMode: TComboBox;
    CBMeterDivide: TComboBox;
    TTest: TTimer;
    SPAdvance: TRzSizePanel;
    GBRemote: TGroupBox;
    CBUDP: TCheckBox;
    LEIP: TLabeledEdit;
    LEPort: TLabeledEdit;
    CBAllowRemote: TCheckBox;
    SBSend: TSpeedButton;
    CBAutoSend: TCheckBox;
    RBAlways: TRadioButton;
    RBAfterSave: TRadioButton;
    CBScreenType: TComboBox;
    CBScreen: TCheckBox;
    GBDefine: TGroupBox;
    LEStart: TLabeledEdit;
    LEGetFirst: TLabeledEdit;
    CBQueue: TComboBox;
    LEDataLength: TLabeledEdit;
    LEPoint: TLabeledEdit;
    CBType: TComboBox;
    EdtSend: TMemo;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnApplyClick(Sender: TObject);
    procedure PollingDelayKeyPress(Sender: TObject; var Key: Char);
    procedure CBMeterTypeChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CommPReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    procedure SBClearClick(Sender: TObject);
    procedure SBSendClick(Sender: TObject);
    procedure TSendTimer(Sender: TObject);
    procedure CBScreenClick(Sender: TObject);
    procedure TScreenTimer(Sender: TObject);
    procedure TUDPClientTimer(Sender: TObject);
    procedure IdUDPSUDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure CBAllowRemoteClick(Sender: TObject);
    procedure CBUDPClick(Sender: TObject);
    procedure CBSoftUnitChange(Sender: TObject);
    procedure TTestTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    point: integer;
  public
    { Public declarations }
    testStep: Integer;
    cheat: Double;
    arrRevCount: array of Integer;
    procedure Commpopen; 
    procedure reloadUnit();
    procedure addMemo(s: string);
    procedure setSenderState(meterIndex: Integer);
    procedure setDefineState(meterIndex: Integer);
  end;

var
  MeterConnect1Form: TMeterConnect1Form;

implementation

uses Main, MeterUtil, CommonUtil;

{$R *.dfm}

procedure TMeterConnect1Form.Commpopen;
begin
  if CommP.Connected then
    CommP.Disconnect;

  setDefineState(CBMeterType.ItemIndex);

  CommP.Port := TPortNumber(ComPort.ItemIndex + 1);
  CommP.BaudRate := TBaudRate(BaudRate.ItemIndex + 1);
  CommP.DataBits := TDataBits(ByteSize.ItemIndex);
  CommP.StopBits := TStopBits(StopBits.ItemIndex);
  CommP.Parity := TParity(Parity.ItemIndex);
  CommP.PollingDelay := PollingDelay.Value;
  try
    CommP.Connect;
    if not CommP.Connected then
    begin
      MessageDlg('打开1#仪表串口失败！' + Char(13) + '请检查串口连接是否设置正确！',
        mtWarning, [mbOK], 0);
      Exit;
    end;
    setSenderState(CBMeterType.ItemIndex);
  except
    MessageDlg('打开1#仪表串口失败！' + Char(13) + '请检查串口连接是否设置正确！',
      mtWarning, [mbOK], 0);
  end;
end;

procedure TMeterConnect1Form.BitBtnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TMeterConnect1Form.BitBtnApplyClick(Sender: TObject);
var myini: Tinifile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\meter.ini');
  try
    myini.WriteBool('meter1', 'use', CBUseMeter.Checked);
    myini.Writeinteger('meter1', 'meter_type', CBMeterType.ItemIndex);
    myini.Writeinteger('meter1', 'com', ComPort.ItemIndex);
    myini.Writeinteger('meter1', 'baut', BaudRate.ItemIndex);
    myini.Writeinteger('meter1', 'databit', ByteSize.ItemIndex);
    myini.Writeinteger('meter1', 'stopbit', StopBits.ItemIndex);
    myini.Writeinteger('meter1', 'parity', Parity.ItemIndex);
    myini.Writeinteger('meter1', 'polling', PollingDelay.Value);

    myini.WriteInteger('meter1', 'type', CBType.ItemIndex);
    myini.WriteString('meter1', 'start', LEStart.Text);
    myini.WriteString('meter1', 'first', LEGetFirst.Text);
    myini.WriteString('meter1', 'len', LEDataLength.Text);
    myini.Writeinteger('meter1', 'queue', CBQueue.ItemIndex);
    myini.WriteString('meter1', 'point', LEPoint.Text);

    myini.WriteBool('meter1', 'to_screen', CBScreen.Checked);
    myini.WriteBool('meter1', 'to_screen_type', RBAlways.Checked);

    myini.Writeinteger('meter1', 'meter_unit_index', CBMeterUnit.ItemIndex);
    myini.WriteString('meter1', 'meter_unit', CBMeterUnit.Text);
    myini.Writeinteger('meter1', 'soft_unit_index', CBSoftUnit.ItemIndex);
    myini.WriteString('meter1', 'soft_unit', CBSoftUnit.Text);

    MainForm.systemConfig.softUnit1 := CBSoftUnit.Text;
    MainForm.FrmWeight1.lblUnit1.Caption := CBSoftUnit.Text;

    myini.WriteString('meter1', 'meter_show_mode', LEMeterShowMode.Text);
    MainForm.systemConfig.meterShowMode1 := LEMeterShowMode.Text;
    myini.WriteInteger('meter1', 'meter_divide', StrToIntDef(CBMeterDivide.Text, 10));
    MainForm.systemConfig.meterDivide1 := StrToIntDef(CBMeterDivide.Text, 10);

    reloadUnit;

    myini.WriteBool('meter1', 'allowRemote', CBAllowRemote.Checked);
    myini.WriteBool('meter1', 'readRemote', CBUDP.Checked);
    myini.WriteString('meter1', 'remoteIp', LEIP.Text);
    myini.WriteInteger('meter1', 'remotePort', StrToIntDef(LEPort.Text, 8888));

    myini.WriteString('meter1', 'send_str', EdtSend.Text);
    myini.WriteBool('meter1', 'auto_send', CBAutoSend.Checked);

    myini.WriteInteger('meter1', 'screen_type', CBScreenType.ItemIndex);

    if CBUseMeter.Checked then
      Commpopen
    else
      CommP.Disconnect;
  finally
    myini.Free;
  end;
end;

procedure TMeterConnect1Form.PollingDelayKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0
end;

procedure TMeterConnect1Form.CBMeterTypeChange(Sender: TObject);
begin
  Commpopen;
end;

procedure TMeterConnect1Form.FormCreate(Sender: TObject);
var myini: Tinifile;
  i: Integer;
begin
  for i := 1 to 16 do
  begin
    ComPort.Items.Add('COM' + IntToStr(i));
  end;

  BaudRate.Items.Clear;
  BaudRate.Items.Add('110'); BaudRate.Items.Add('300');
  BaudRate.Items.Add('600'); BaudRate.Items.Add('1200');
  BaudRate.Items.Add('2400'); BaudRate.Items.Add('4800');
  BaudRate.Items.Add('9600'); BaudRate.Items.Add('14400');
  BaudRate.Items.Add('19200'); BaudRate.Items.Add('38400');
  BaudRate.Items.Add('56000'); BaudRate.Items.Add('57600');
  BaudRate.Items.Add('115200'); BaudRate.Items.Add('128000');
  BaudRate.Items.Add('256000');

  ByteSize.Items.Clear;
  ByteSize.Items.Add('5'); ByteSize.Items.Add('6');
  ByteSize.Items.Add('7'); ByteSize.Items.Add('8');

  StopBits.Items.Clear;
  StopBits.Items.Add('1'); StopBits.Items.Add('1.5');
  StopBits.Items.Add('2');

  Parity.Items.Clear;
  Parity.Items.Add('无校验'); Parity.Items.Add('奇校验');
  Parity.Items.Add('偶校验'); Parity.Items.Add('标记');
  Parity.Items.Add('空格');

  TMeterUtil.addMeterType(CBMeterType);

  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\meter.ini');
  try
    CBUseMeter.Checked := myini.ReadBool('meter1', 'use', true);
    CBMeterType.ItemIndex := myini.ReadInteger('meter1', 'meter_type', 1);
    ComPort.ItemIndex := myini.ReadInteger('meter1', 'com', 0);
    BaudRate.ItemIndex := myini.ReadInteger('meter1', 'baut', 5);
    ByteSize.ItemIndex := myini.ReadInteger('meter1', 'databit', 3);
    StopBits.ItemIndex := myini.ReadInteger('meter1', 'stopbit', 0);
    Parity.ItemIndex := myini.ReadInteger('meter1', 'parity', 0);
    PollingDelay.Value := myini.ReadInteger('meter1', 'polling', 300);

    CBType.ItemIndex := myini.ReadInteger('meter1', 'type', 0);
    LEStart.Text := myini.ReadString('meter1', 'start', '=');
    LEGetFirst.Text := myini.ReadString('meter1', 'first', '1');
    LEDataLength.Text := myini.ReadString('meter1', 'len', '7');
    CBQueue.ItemIndex := myini.ReadInteger('meter1', 'queue', 0);
    LEPoint.Text := myini.ReadString('meter1', 'point', '0');

    CBScreen.Checked := myini.ReadBool('meter1', 'to_screen', False);
    RBAlways.Checked := myini.ReadBool('meter1', 'to_screen_type', True);
    RBAfterSave.Checked := not myini.ReadBool('meter1', 'to_screen_type', True);

    CBMeterUnit.ItemIndex := myini.ReadInteger('meter1', 'meter_unit_index', 0);
    CBSoftUnit.ItemIndex := myini.ReadInteger('meter1', 'soft_unit_index', 0);
    LEMeterShowMode.Text := myini.ReadString('meter1', 'meter_show_mode', '0');
    CBMeterDivide.Text := myini.ReadString('meter1', 'meter_divide', '1');

    reloadUnit;

    CBUDP.Checked := myini.ReadBool('meter1', 'readRemote', False);
    LEIP.Text := myini.ReadString('meter1', 'remoteIp', '127.0.0.1');
    LEPort.Text := myini.ReadString('meter1', 'remotePort', '8888');
    CBAllowRemote.Checked := myini.ReadBool('meter1', 'allowRemote', False);

    EdtSend.Text := myini.ReadString('meter1', 'send_str', '');
    CBAutoSend.Checked := myini.ReadBool('meter1', 'auto_send', False);

    CBScreenType.ItemIndex := myini.ReadInteger('meter1', 'screen_type', 0);

  finally
    myini.Free;
  end;

  SetLength(arrRevCount, MainForm.systemConfig.disconnectCheckCount);

  if CBAllowRemote.Checked then
  begin
    //IdUDPS.Binding.IP := '0.0.0.0';
    IdUDPS.DefaultPort := StrToIntDef(LEPort.Text, 8888);
    IdUDPS.Active := CBAllowRemote.Checked;
  end;

  if CBUseMeter.Checked then
  begin
    Commpopen
  end
  else if CBUDP.Checked then
  begin
    IdUDPC.Host := LEIP.Text;
    IdUDPC.Port := StrToIntDef(LEPort.Text, 8888);
    IDUDPC.Active := True;
    TUDPClient.Enabled := True;
  end;
end;

procedure TMeterConnect1Form.CommPReceiveData(Sender: TObject;
  DataPtr: Pointer; DataSize: Cardinal);
var s, s16: string;
  i: Integer;
  sf: boolean;
  w: string;
  speed, flow, givenFlow: Double;
begin
  SetLength(s, DataSize);
  Move(DataPtr^, pchar(s)^, DataSize);
  if s <> '' then
    MainForm.FrmWeight1.AniTrans1.ImageIndex := 1;

  if not TTest.Enabled then
  begin
    TTest.Interval := CommP.PollingDelay;
    TTest.Enabled := True;
  end;

  if RBTen.Checked then
  begin
    addMemo(s);
  end
  else if RBSixteen.Checked then
  begin
    for i := 0 to Length(s) do
      s16 := s16 + Char(32) + Char(32) + IntToHex(Ord(s[i]), 2);
    addMemo(s16)
  end;

  try
    w := TMeterUtil.getMeterNum(CBMeterType.ItemIndex, s, sf, '01', LEStart.Text,
      StrToIntDef(LEGetFirst.Text, 1), StrToIntDef(LEDataLength.Text, 6),
      StrToIntDef(LEPoint.Text, 0), CBQueue.ItemIndex,
      CBType.ItemIndex);

    if w = '' then
      Exit;

    //看主界面上是扣哪一个
    if MainForm.systemConfig.useCorrect then
    begin
      if MainForm.systemConfig.cweightFlag1 then
      begin
        cheat := MainForm.systemConfig.cweight1;
        MainForm.SPCheat.Caption := 'A';
      end
      else if MainForm.systemConfig.cweightFlag2 then
      begin
        cheat := MainForm.systemConfig.cweight2;
        MainForm.SPCheat.Caption := 'B';
      end
      else if MainForm.systemConfig.cweightFlag3 then
      begin
        cheat := MainForm.systemConfig.cweight3;
        MainForm.SPCheat.Caption := 'C';
      end
      else if MainForm.systemConfig.cweightFlag4 then
      begin
        cheat := MainForm.systemConfig.cweight4;
        MainForm.SPCheat.Caption := 'D';
      end
      else if MainForm.systemConfig.cweightFlag5 then
      begin
        cheat := MainForm.systemConfig.cweight5;
        MainForm.SPCheat.Caption := 'E';
      end
      else if MainForm.systemConfig.cweightFlag6 then
      begin
        cheat := MainForm.systemConfig.cweight6;
        MainForm.SPCheat.Caption := 'F';
      end
      else if MainForm.systemConfig.cweightFlag7 then
      begin
        cheat := MainForm.systemConfig.cweight7;
        MainForm.SPCheat.Caption := 'G';
      end
      else if MainForm.systemConfig.cweightFlag8 then
      begin
        cheat := MainForm.systemConfig.cweight8;
        MainForm.SPCheat.Caption := 'H';
      end
      else
      begin
        cheat := 0;
        MainForm.SPCheat.Caption := ' ';
      end;
    end
    else
    begin
      cheat := 0;
      MainForm.SPCheat.Caption := ' ';
    end;
    if MainForm.systemConfig.useFix then
    begin
      if MainForm.systemConfig.fixCheatFlag then
        cheat := MainForm.systemConfig.fix;
    end;
    if StrToFloatDef(w, 0) < MainForm.systemConfig.startCheat then
      cheat := 0;
    //如果输出到主界面，就不进行暗扣了
    if MainForm.systemConfig.exportToWeight then
      cheat := 0;

    if StrToFloatDef(w, 0) > MainForm.systemConfig.max then
      w := FloatToStr(MainForm.systemConfig.max);

    MainForm.FrmWeight1.PWeight1.Caption := FormatFloat(MainForm.systemConfig.meterShowMode1,
      TCommonUtil.meterValue(StrToFloat(w), MainForm.systemConfig.meterDivide1,
      MainForm.systemConfig.cheatType, cheat)
      * power(10, point));

  except
    Exit
  end
end;

procedure TMeterConnect1Form.SBClearClick(Sender: TObject);
begin
  MemoLog.Lines.Clear;
end;

procedure TMeterConnect1Form.SBSendClick(Sender: TObject);
begin
  if CommP.Connected then
  begin
    CommP.SendString(TCommonUtil.HexStrToStr(EdtSend.Text));
  end;
end;

procedure TMeterConnect1Form.reloadUnit;
var meterUnitIndex, softUnitIndex: integer;
begin
  meterUnitIndex := CBMeterUnit.ItemIndex;
  softUnitIndex := CBSoftUnit.ItemIndex;
  //如果都是公斤或都是吨就不转换
  //如果仪表是公斤,软件是吨,就要除以1000
  //如果仪表是吨,软件是公斤,就要乘以1000
  if (meterUnitIndex < 3) then
  begin
    if (softUnitIndex < 3) then
    begin
      point := 0;
    end
    else
    begin
      point := -3;
    end;
  end
  else
  begin
    if (softUnitIndex < 3) then
    begin
      point := 3;
    end
    else
    begin
      point := 0;
    end;
  end;
end;

procedure TMeterConnect1Form.TSendTimer(Sender: TObject);
var s: string;
begin
  if CBAutoSend.Checked then
  begin
    if CommP.Connected then
    begin
      s := TCommonUtil.HexStrToStr(EdtSend.Text);
      CommP.SendString(s);
    end;
  end
  else
  begin
    case CBMeterType.ItemIndex of
      21: begin
          if CommP.Connected then
          begin
            s := 'READ' + Chr($0D) + Chr($0A);
            CommP.SendString(s);
          end;
        end;
      30: begin
          if CommP.Connected then
          begin
            s := Chr($4D) + Chr($53) + Chr($56) + Chr($3F) + Chr($0D) + Chr($0A);
            CommP.SendString(s);
          end;
        end;
      38: begin
          if CommP.Connected then
          begin
            s := '010300000008';
            s := ':' + TCommonUtil.modbusAsciiCheck(s) + Chr($0D) + Chr($0A);
            CommP.SendString(s);
          end;
        end;
      39: begin
          s := Chr($01) + Chr($04) + Chr($00) + Chr($00) + Chr($00) + Chr($02);
          s := TCommonUtil.modbusRTUCheck(s);
          CommP.SendString(s);
        end;
      47: begin
          s := Chr($01) + Chr($03) + Chr($70) + Chr($00) + Chr($00) + Chr($08)
            + Chr($5E) + Chr($CC);
          CommP.SendString(s);
        end;
    end;
  end;
end;

procedure TMeterConnect1Form.CBScreenClick(Sender: TObject);
begin
  TScreen.Enabled := CBScreen.Checked;
end;

procedure TMeterConnect1Form.TScreenTimer(Sender: TObject);
var WeightTemp, OutWeight: string[10];
  i: integer;
begin
  try
    if RBAlways.Checked then
    begin
      case CBScreenType.ItemIndex of
        0: WeightTemp := MainForm.FrmWeight1.getWeight; //输出当前重量
        1: WeightTemp := MainForm.FrmWeight1.EdtGross.Text; //输出毛重
        2: WeightTemp := MainForm.FrmWeight1.EdtTare.Text; //输出皮重
        3: WeightTemp := MainForm.FrmWeight1.EdtNet.Text; //输出净重
        4: WeightTemp := MainForm.FrmWeight1.EdtBundle.Text; //输出扣重
        5: WeightTemp := MainForm.FrmWeight1.EdtReal.Text; //输出实重
        6: WeightTemp := MainForm.FrmWeight1.CBBackup1.Text; //输出备用1
        7: WeightTemp := MainForm.FrmWeight1.CBBackup2.Text; //输出备用2
        8: WeightTemp := MainForm.FrmWeight1.CBBackup3.Text; //输出备用3
        9: WeightTemp := MainForm.FrmWeight1.CBBackup4.Text; //输出备用4
        10: WeightTemp := MainForm.FrmWeight1.CBBackup5.Text; //输出备用5
        11: WeightTemp := MainForm.FrmWeight1.EdtBackup6.Text; //输出备用6
        12: WeightTemp := MainForm.FrmWeight1.EdtBackup7.Text; //输出备用7
        13: WeightTemp := MainForm.FrmWeight1.EdtBackup8.Text; //输出备用8
        14: WeightTemp := MainForm.FrmWeight1.EdtBackup9.Text; //输出备用9
        15: WeightTemp := MainForm.FrmWeight1.CBBackup10.Text; //输出备用10
        16: WeightTemp := MainForm.FrmWeight1.CBBackup11.Text; //输出备用11
        17: WeightTemp := MainForm.FrmWeight1.CBBackup12.Text; //输出备用12
        18: WeightTemp := MainForm.FrmWeight1.CBBackup13.Text; //输出备用13
        19: WeightTemp := MainForm.FrmWeight1.CBBackup14.Text; //输出备用14
        20: WeightTemp := MainForm.FrmWeight1.EdtBackup15.Text; //输出备用15
        21: WeightTemp := MainForm.FrmWeight1.EdtBackup16.Text; //输出备用16
        22: WeightTemp := MainForm.FrmWeight1.EdtBackup17.Text; //输出备用17
        23: WeightTemp := MainForm.FrmWeight1.EdtBackup18.Text; //输出备用18
      else
        WeightTemp := MainForm.FrmWeight1.getWeight;
      end;
    end
    else if RBAfterSave.Checked then
    begin
      if MainForm.FrmWeight1.saved then
        WeightTemp := MainForm.FrmWeight1.PWeight1.Caption
      else
        WeightTemp := '0';
    end;
    OutWeight := '';
    for i := Length(WeightTemp) downto 1 do
      if WeightTemp[i] in ['0'..'9', '.'] then
        OutWeight := OutWeight + WeightTemp[i];
    if AnsiContainsText(WeightTemp, '-') then
    begin
      for i := 1 to 8 - Length(WeightTemp) do
        OutWeight := OutWeight + '0';
      OutWeight := OutWeight + '-'
    end
    else
    begin
      for i := 1 to 7 - Length(WeightTemp) do
        OutWeight := OutWeight + '0';
    end;
    CommP.SendString('=' + OutWeight);
  except
    exit;
  end;
end;

procedure TMeterConnect1Form.TUDPClientTimer(Sender: TObject);
var s: string;
  i: integer;
begin
  if not CBUseMeter.Checked then
  begin
    if not IdUDPC.Active then
    begin
      IdUDPC.Host := LEIP.Text;
      IdUDPC.Port := StrToIntDef(LEPort.Text, 8888);
      IdUDPC.Active := True;
    end
    else
    begin
      IdUDPC.Send(Chr($02) + 'getWeight' + Chr($03));
      try
        s := IdUDPC.ReceiveString();
        if s <> '' then
        begin
          addMemo('Client Receive: ' + s);
          for i := 1 to Length(s) do
          begin
            if s[i] = Chr($02) then
            begin
              MainForm.FrmWeight1.PWeight1.Caption := FloatToStr(StrToFloatDef(Copy(s, i + 1, 8), 0));
              break;
            end;
          end;
        end;
      except
      end;
    end;
  end;
end;

procedure TMeterConnect1Form.IdUDPSUDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  s, r: string;
  i: integer;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    s := DataStringStream.DataString;
    addMemo('Server Receive: ' + s);
    if s = Chr($02) + 'getWeight' + Chr($03) then
    begin
      r := MainForm.FrmWeight1.PWeight1.Caption;
      for i := 1 to 8 - Length(r) do
        r := '0' + r;

      r := Chr($02) + r + Chr($03);
      ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, r[1], Length(r));
    end;
  finally
    DataStringStream.Free;
  end;
end;

procedure TMeterConnect1Form.CBAllowRemoteClick(Sender: TObject);
begin
  //IdUDPS.Binding.IP := '0.0.0.0';
  IdUDPS.DefaultPort := StrToIntDef(LEPort.Text, 8888);
  IdUDPS.Active := CBAllowRemote.Checked;
end;

procedure TMeterConnect1Form.CBUDPClick(Sender: TObject);
begin
  IdUDPC.Host := LEIP.Text;
  IdUDPC.Port := StrToIntDef(LEPort.Text, 8888);
  IdUDPC.Active := CBUDP.Checked;
  TUDPClient.Enabled := CBUDP.Checked;
end;

procedure TMeterConnect1Form.addMemo(s: string);
begin
  if MemoLog.Lines.Count > 100 then
    MemoLog.Lines.Clear;
  MemoLog.Lines.Add(s);
end;

procedure TMeterConnect1Form.setDefineState(meterIndex: Integer);
var i: Integer;
begin
  for i := 0 to GBDefine.ControlCount - 1 do
  begin
    GBDefine.Controls[i].Enabled := meterIndex = CBMeterType.Items.Count - 1;
  end;
end;

procedure TMeterConnect1Form.setSenderState(meterIndex: Integer);
begin
  TSend.Interval := PollingDelay.Value;
  TSend.Enabled := True;
end;

procedure TMeterConnect1Form.CBSoftUnitChange(Sender: TObject);
begin
  case CBSoftUnit.ItemIndex of
    0, 1, 2: begin
        if LEMeterShowMode.Text = '0.000' then
        begin
          LEMeterShowMode.Text := '0';
        end;
      end;
    3, 4, 5: begin
        if LEMeterShowMode.Text = '0' then
        begin
          LEMeterShowMode.Text := '0.000';
        end;
      end;
  end;
end;

procedure TMeterConnect1Form.TTestTimer(Sender: TObject);
var i: Integer;
  comDisconnect: Boolean;
begin
  if not MainForm.systemConfig.disconnectToZero then
    Exit;
  if testStep > Length(arrRevCount) - 1 then
    testStep := 0;
  arrRevCount[testStep] := CommP.CountRX;
  inc(testStep);
  comDisconnect := True;
  for i := 0 to Length(arrRevCount) - 1 do
  begin
    if arrRevCount[i] <> 0 then
    begin
      comDisconnect := False;
      Break;
    end;
  end;
  if comDisconnect then
    MainForm.FrmWeight1.PWeight1.Caption := '0';
end;

procedure TMeterConnect1Form.FormShow(Sender: TObject);
begin
  SPAdvance.CloseHotSpot
end;

end.

