unit ComOutput;

interface

uses
  SysUtils, Classes, Controls, Forms,
  ExtCtrls, StdCtrls, CPDrv, Spin, Dialogs, iniFiles, StrUtils;

type
  TComOutputForm = class(TForm)
    PCom1: TPanel;
    GBCom1Set: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    ComOpen1: TCheckBox;
    DPBaudRate1: TComboBox;
    DPPortName1: TComboBox;
    GBDevice1: TGroupBox;
    OutEquipment1: TComboBox;
    XK3190Timer1: TTimer;
    CPDOut1: TCommPortDriver;
    SpeedSpin1: TSpinEdit;
    Label1: TLabel;
    T8142ProTimer1: TTimer;
    Panel2: TPanel;
    GBCom2Set: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComOpen2: TCheckBox;
    DPBaudRate2: TComboBox;
    DPPortName2: TComboBox;
    SpeedSpin2: TSpinEdit;
    GBDevice2: TGroupBox;
    OutEquipment2: TComboBox;
    XK3190Timer2: TTimer;
    CPDOut2: TCommPortDriver;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    OutSpin1: TSpinEdit;
    OutSpin2: TSpinEdit;
    T8142Pro_addTimer1: TTimer;
    XK315ATimer1: TTimer;
    procedure XK3190Timer1Timer(Sender: TObject);
    procedure ComOpen1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure T8142ProTimer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CpdOpen1; //cpd1
    procedure CpdOpen2; //cpd2
    procedure AddCom;
    procedure XK3190Timer2Timer(Sender: TObject);
    procedure ComOpen2Click(Sender: TObject);
    procedure T8142Pro_addTimer1Timer(Sender: TObject);
    procedure XK315ATimer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ComOutputForm: TComOutputForm;
implementation

uses Main;

{$R *.dfm}

procedure TComOutputForm.AddCom; //增加有效串口
begin
  CPDOut2.Disconnect;
  DPPortName1.Items.Clear;
  DPPortName2.Items.Clear;
  CPDOut2.Port := pnCOM1;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM1');
    DPPortName2.Items.Add('COM1');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM2;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM2');
    DPPortName2.Items.Add('COM2');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM3;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM3');
    DPPortName2.Items.Add('COM3');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM4;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM4');
    DPPortName2.Items.Add('COM4');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM5;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM5');
    DPPortName2.Items.Add('COM5');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM6;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM6');
    DPPortName2.Items.Add('COM6');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM7;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM7');
    DPPortName2.Items.Add('COM7');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM8;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM8');
    DPPortName2.Items.Add('COM8');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM9;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM9');
    DPPortName2.Items.Add('COM9');
    CPDOut2.Disconnect;
  end;
  CPDOut2.Port := pnCOM10;
  if CPDOut2.Connect then
  begin
    DPPortName1.Items.Add('COM10');
    DPPortName2.Items.Add('COM10');
    CPDOut2.Disconnect;
  end;
end;

procedure TComOutputForm.CpdOpen1; //cpd
begin
  CPDOut1.Disconnect;
  CPDOut1.PortName := DPPortName1.Text; //串口
  CPDOut1.BaudRateValue := StrToInt(DPBaudRate1.Text); //波特率
  CPDOut1.DataBits := CPDrv.db8BITS;

  if not CPDOut1.Connect then
  begin
    MessageDlg('输出串口' + DPPortName1.Text + '打开失败'
      + #13 + '请检查是否被占用或不存在！', mtWarning, [mbOK], 0);
    exit;
  end
  else
  begin
    CPDOut1.FlushBuffers(True, True);
    case OutEquipment1.ItemIndex of
      0:
        begin //耀华XK3190-D2
          T8142ProTimer1.Enabled := False;
          T8142Pro_addTimer1.Enabled := False;
          XK3190Timer1.Interval := SpeedSpin1.Value;
          XK3190Timer1.Enabled := True;
        end;
      1:
        begin //托力多8142Pro
          XK3190Timer1.Enabled := False;
          T8142Pro_addTimer1.Enabled := False;
          T8142ProTimer1.Interval := SpeedSpin1.Value;
          T8142ProTimer1.Enabled := True;
        end;
      2:
        begin //托力多8142Pro+
          XK3190Timer1.Enabled := False;
          T8142ProTimer1.Enabled := False;
          T8142Pro_addTimer1.Interval := SpeedSpin1.Value;
          T8142Pro_addTimer1.Enabled := True;
        end;
    end;
  end;
end;

procedure TComOutputForm.CpdOpen2; //cpd 2
begin
  CPDOut2.Disconnect;
  CPDOut2.PortName := DPPortName2.Text; //串口
  CPDOut2.BaudRateValue := StrToInt(DPBaudRate2.Text); //波特率
  if not CPDOut2.Connect then
  begin
    MessageDlg('输出串口' + DPPortName2.Text + '打开失败'
      + #13 + '请检查是否被占用或不存在！', mtWarning, [mbOK], 0);
    exit;
  end
  else
    case OutEquipment2.ItemIndex of
      0:
        begin //耀华XK3190-D2
          //XK315ATimer2.Enabled := False;
          XK3190Timer2.Interval := SpeedSpin2.Value;
          XK3190Timer2.Enabled := True;
        end;

    end;

end;

procedure TComOutputForm.FormCreate(Sender: TObject);
var myini: TiniFile;
begin
  myini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    DPPortName1.Text := Myini.ReadString('ComOutPut', 'DPPortName1', 'COM2'); //大屏串口1
    DPBaudRate1.ItemIndex := Myini.ReadInteger('ComOutPut', 'DPComBaudRate1', 0); //大屏波特率1
    OutEquipment1.ItemIndex := Myini.ReadInteger('ComOutPut', 'OutEquipment1', 0); //选择大屏1
    OutSpin1.Value := Myini.ReadInteger('ComOutPut', 'OutSpin1', 1); //一次输出字符串数1
    DPPortName2.Text := Myini.ReadString('ComOutPut', 'DPPortName2', 'COM2'); //大屏串口2
    DPBaudRate2.ItemIndex := Myini.ReadInteger('ComOutPut', 'DPComBaudRate2', 0); //大屏波特率2
    OutEquipment2.ItemIndex := Myini.ReadInteger('ComOutPut', 'OutEquipment2', 0); //选择大屏2
    OutSpin2.Value := Myini.ReadInteger('ComOutPut', 'OutSpin2', 1); //一次输出字符串数2

    ComOpen1.Checked := Myini.ReadBool('ComOutPut', 'ComOpen1', False); //串口1打开状态
    ComOpen2.Checked := Myini.ReadBool('ComOutPut', 'ComOpen2', False); //串口2打开状态
  finally
    myini.Free;
  end;
end;

procedure TComOutputForm.FormShow(Sender: TObject);
begin
  AddCom;
  if ComOpen1.Checked then
    CpdOpen1;
  if ComOpen2.Checked then
    CpdOpen2;
end;

procedure TComOutputForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
var myini: TiniFile;
begin
  myini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    if not ComOpen1.Checked then
      CPDOut1.Disconnect;
    if not ComOpen2.Checked then
      CPDOut2.Disconnect;
    Myini.WriteString('ComOutPut', 'DPPortName1', DPPortName1.Text); //大屏串口1
    Myini.WriteInteger('ComOutPut', 'DPComBaudRate1', DPBaudRate1.ItemIndex); //大屏波特率1
    Myini.WriteInteger('ComOutPut', 'OutEquipment1', OutEquipment1.ItemIndex); //选择大屏1
    Myini.WriteInteger('ComOutPut', 'OutSpin1', OutSpin1.Value); //一次输出字符串数1
    Myini.WriteBool('ComOutPut', 'ComOpen1', ComOpen1.Checked); //串口打开状态1
    Myini.WriteString('ComOutPut', 'DPPortName2', DPPortName2.Text); //大屏串口2
    Myini.WriteInteger('ComOutPut', 'DPComBaudRate2', DPBaudRate2.ItemIndex); //大屏波特率2
    Myini.WriteInteger('ComOutPut', 'OutEquipment2', OutEquipment2.ItemIndex); //选择大屏2
    Myini.WriteInteger('ComOutPut', 'OutSpin2', OutSpin2.Value); //一次输出字符串数2
    Myini.WriteBool('ComOutPut', 'ComOpen2', ComOpen2.Checked); //串口打开状态2
  finally
    myini.Free;
  end;
end;

procedure TComOutputForm.ComOpen1Click(Sender: TObject);
begin
  if ComOpen1.Checked then
    CpdOpen1
  else
  begin
    XK3190Timer1.Enabled := False;
    T8142ProTimer1.Enabled := False;
    T8142Pro_addTimer1.Enabled := False;
    XK315ATimer1.Enabled := False;
    CPDOut1.Disconnect;
  end;
end;

procedure TComOutputForm.XK3190Timer1Timer(Sender: TObject);
var WeightTemp, OutWeight: string[10];
  i: integer;
begin                                       
  try
    WeightTemp := MainForm.FrmWeight1.PWeight1.Caption;
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
    for i := 1 to OutSpin1.Value do
      CPDOut1.SendString('=' + OutWeight);
  except
    XK3190Timer1.Enabled := False;
    exit;
  end;
end;

procedure TComOutputForm.T8142ProTimer1Timer(Sender: TObject);
var WeightTemp, Wtemp: string[10];
  BTemp: Char;
  OutWeight: string[17];
  i: integer;
begin
  WeightTemp := MainForm.FrmWeight1.PWeight1.Caption;
  if WeightTemp <> '' then
  try
    OutWeight := #02;
    BTemp := #42; //无小数点
    for i := Length(WeightTemp) - 1 downto 2 do
    begin
      if WeightTemp[i] = '.' then
      begin
        case i of
          3: BTemp := #43; //'0101011' ,小数点0.0 = 011
          4: BTemp := #44; //'0101100' ,小数点0.00 = 100
          5: BTemp := #45; //'0101101' ,小数点0.000 = 101
          6: BTemp := #46; //'0101110' ,小数点0.0000 = 110
          7: BTemp := #47; //'0101111' ,小数点0.00000 = 111
        end;
        break;
      end;
    end;
    if WeightTemp[1] = '-' then
      OutWeight := OutWeight + BTemp + #50 + #32 // 02/A/B/C
    else
      OutWeight := OutWeight + BTemp + #48 + #32;
    Wtemp := '';
    for i := 1 to Length(WeightTemp) do
      if WeightTemp[i] in ['0'..'9'] then
        Wtemp := Wtemp + WeightTemp[i];
    while Length(Wtemp) < 6 do
      Wtemp := '0' + Wtemp;
    OutWeight := OutWeight + Wtemp + '000000' + #13;
    for i := 1 to OutSpin1.Value do
      CPDOut1.SendString(OutWeight);
  except
    T8142ProTimer1.Enabled := False;
    exit;
  end;
end;

procedure TComOutputForm.T8142Pro_addTimer1Timer(Sender: TObject);
var WeightTemp, Wtemp: string[10];
  OutWeight: string[17];
  i: integer;
begin
  WeightTemp := MainForm.FrmWeight1.PWeight1.Caption;
  if WeightTemp <> '' then
  try
    OutWeight := #02 + #41 + #48 + #32;
    Wtemp := '';
    for i := 1 to Length(WeightTemp) do
      if WeightTemp[i] in ['0'..'9'] then
        Wtemp := Wtemp + WeightTemp[i];
    while Length(Wtemp) < 6 do
      Wtemp := '0' + Wtemp;
    OutWeight := OutWeight + Wtemp + '000000' + #13;
    for i := 1 to OutSpin1.Value do
      CPDOut1.SendString(OutWeight);
  except
    T8142ProTimer1.Enabled := False;
    exit;
  end;
end;

procedure TComOutputForm.ComOpen2Click(Sender: TObject);
begin
  if ComOpen2.Checked then
    CpdOpen2
  else
  begin
    XK3190Timer2.Enabled := False;
    CPDOut2.Disconnect;
  end;
end;

procedure TComOutputForm.XK3190Timer2Timer(Sender: TObject);
var WeightTemp, OutWeight: string[10];
  i: integer;
begin
  try
    WeightTemp := MainForm.FrmWeight1.PWeight1.Caption;
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
    for i := 1 to OutSpin2.Value do
      CPDOut2.SendString('=' + OutWeight);
  except
    XK3190Timer2.Enabled := False;
    exit;
  end;
end;


{procedure TComOutputForm.XK315ATimer2Timer(Sender: TObject);
var WeightTemp, Wtemp: string[10];
  BTemp: char;
  OutWeight: string[17];
  I: integer;
begin
  WeightTemp := MainForm.Weight.Caption;
  if WeightTemp <> '' then
  try
    OutWeight := #02;
    BTemp := #42; //无小数点
    if WeightTemp[1] = '-' then
      OutWeight := OutWeight + BTemp + #50 + #32 // 02/A/B/C
    else OutWeight := OutWeight + BTemp + #48 + #32;
    Wtemp := '';
    for I := 1 to length(WeightTemp) do
      if WeightTemp[I] in ['0'..'9'] then
        Wtemp := Wtemp + WeightTemp[I];
    while length(Wtemp) < 6 do
      Wtemp := '0' + Wtemp;
    OutWeight := OutWeight + Wtemp + '000000' + #13;
    for I := 1 to OutSpin2.value do
      CPDOut2.SendString(OutWeight);
  except
    XK315ATimer2.Enabled := False;
    exit;
  end;
end;
 }
{procedure TComOutputForm.T8142Pro_addTimer2Timer(Sender: TObject);
var WeightTemp, Wtemp: string[10];
  OutWeight: string[17];
  I: integer;
begin
  WeightTemp := MainForm.Weight.Caption;
  if WeightTemp <> '' then
  try
    OutWeight := #130 + #169 + #48 + #160; // 02 + 128(STR) / 41 + 128(A) /B / C
    if WeightTemp[1] in ['1'..'9'] then
      Wtemp := chr(ord(WeightTemp[1]) + 128);
    for I := 2 to length(WeightTemp) do
      if WeightTemp[I] in ['0'..'9'] then
        Wtemp := Wtemp + WeightTemp[I];
    while length(Wtemp) < 6 do
      Wtemp := '0' + Wtemp;
    OutWeight := OutWeight + Wtemp + '000000' + #141;
    for I := 1 to OutSpin2.value do
      CPDOut2.SendString(OutWeight);
  except
    T8142ProTimer2.Enabled := False;
    exit;
  end;
end;
      }

procedure TComOutputForm.XK315ATimer1Timer(Sender: TObject);
var WeightTemp, OutWeight: string[10];
  i: integer;
begin
  try
    WeightTemp := MainForm.FrmWeight1.PWeight1.Caption;
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
    for i := 1 to OutSpin1.Value do
      CPDOut1.SendString('=' + OutWeight);
  except
    XK315ATimer1.Enabled := False;
    exit;
  end;
end;

end.
d.

