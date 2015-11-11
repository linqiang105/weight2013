unit VideoSet;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls, IniFiles, Buttons, ExtCtrls;

type
  TVideoSetForm = class(TForm)
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    CBVideoType: TComboBox;
    GBRecorder: TGroupBox;
    LEIp: TLabeledEdit;
    LEPort: TLabeledEdit;
    LEUser: TLabeledEdit;
    LEPass: TLabeledEdit;
    GBLogo: TGroupBox;
    CBShowDate: TCheckBox;
    CBShowTime: TCheckBox;
    CBShowLogo: TCheckBox;
    LEDateX: TLabeledEdit;
    LEDateY: TLabeledEdit;
    LETimeX: TLabeledEdit;
    LETimeY: TLabeledEdit;
    LELogoX: TLabeledEdit;
    LELogoY: TLabeledEdit;
    EdtLogo: TEdit;
    GBParam: TGroupBox;
    CBUse1: TCheckBox;
    CBUse2: TCheckBox;
    CBUse3: TCheckBox;
    CBUse4: TCheckBox;
    CBVideo1: TComboBox;
    CBVideo2: TComboBox;
    CBVideo3: TComboBox;
    CBVideo4: TComboBox;
    Label2: TLabel;
    CBDisplayType: TComboBox;
    GBNV1: TGroupBox;
    lblType1: TLabel;
    CBType1: TComboBox;
    LEIP1: TLabeledEdit;
    LEPort1: TLabeledEdit;
    LEUser1: TLabeledEdit;
    LEPass1: TLabeledEdit;
    GBNV2: TGroupBox;
    lblType2: TLabel;
    CBType2: TComboBox;
    LEIP2: TLabeledEdit;
    LEPort2: TLabeledEdit;
    LEUser2: TLabeledEdit;
    LEPass2: TLabeledEdit;
    GBNV3: TGroupBox;
    lblType3: TLabel;
    CBType3: TComboBox;
    LEIP3: TLabeledEdit;
    LEPort3: TLabeledEdit;
    LEUser3: TLabeledEdit;
    LEPass3: TLabeledEdit;
    GBNV4: TGroupBox;
    lblType4: TLabel;
    CBType4: TComboBox;
    LEIP4: TLabeledEdit;
    LEPort4: TLabeledEdit;
    LEUser4: TLabeledEdit;
    LEPass4: TLabeledEdit;
    CBUseRecord: TCheckBox;
    EdtRecordAddr: TEdit;
    SBRecordAddrSet: TSpeedButton;
    GBPicText: TGroupBox;
    CBUsePicText: TCheckBox;
    CBShowCar: TCheckBox;
    CBShowFaHuo: TCheckBox;
    CBShowShouHuo: TCheckBox;
    CBShowGoods: TCheckBox;
    CBShowSpec: TCheckBox;
    CBShowGross: TCheckBox;
    CBShowTare: TCheckBox;
    CBShowNet: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure CBVideoTypeChange(Sender: TObject);
    procedure CBType1Change(Sender: TObject);
    procedure CBType2Change(Sender: TObject);
    procedure CBType3Change(Sender: TObject);
    procedure CBType4Change(Sender: TObject);
    procedure SBRecordAddrSetClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VideoSetForm: TVideoSetForm;

implementation

uses
  CommonUtil, Video;

{$R *.dfm}

procedure TVideoSetForm.FormShow(Sender: TObject);
var myini: TIniFile;
  i: Integer;
begin
  CBVideo1.Items.Clear;
  for i := 1 to 64 do
  begin
    CBVideo1.Items.Add(Format('%d 路通道', [i]));
  end;
  CBVideo2.Items := CBVideo1.Items;
  CBVideo3.Items := CBVideo1.Items;
  CBVideo4.Items := CBVideo1.Items;
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'video.ini');
  try
    CBVideoType.ItemIndex := myini.ReadInteger('video', 'type', 1);
    CBDisplayType.ItemIndex := myini.ReadInteger('video', 'display_type', 3);

    CBUse1.Checked := myini.ReadBool('video', 'use1', True);
    CBUse2.Checked := myini.ReadBool('video', 'use2', True);
    CBUse3.Checked := myini.ReadBool('video', 'use3', True);
    CBUse4.Checked := myini.ReadBool('video', 'use4', True);

    CBVideo1.ItemIndex := myini.ReadInteger('video', 'video1', 0);
    CBVideo2.ItemIndex := myini.ReadInteger('video', 'video2', 1);
    CBVideo3.ItemIndex := myini.ReadInteger('video', 'video3', 2);
    CBVideo4.ItemIndex := myini.ReadInteger('video', 'video4', 3);

    LEIp.Text := myini.ReadString('video', 'ip', '192.168.1.64');
    LEPort.Text := myini.ReadString('video', 'port', '8000');
    LEUser.Text := myini.ReadString('video', 'user', 'admin');
    LEPass.Text := TCommonUtil.deBase64(myini.ReadString('video', 'pass', 'MTIzNDU='));

    CBShowDate.Checked := myini.ReadBool('video', 'showDate', False);
    CBShowTime.Checked := myini.ReadBool('video', 'showTime', False);
    CBShowLogo.Checked := myini.ReadBool('video', 'showLogo', False);

    LEDateX.Text := myini.ReadString('video', 'dateX', '10');
    LEDateY.Text := myini.ReadString('video', 'dateY', '10');
    LETimeX.Text := myini.ReadString('video', 'timeX', '135');
    LETimeY.Text := myini.ReadString('video', 'timeY', '10');
    LELogoX.Text := myini.ReadString('video', 'logoX', '10');
    LELogoY.Text := myini.ReadString('video', 'logoY', '30');
    EdtLogo.Text := myini.ReadString('video', 'logo', '');

    CBType1.ItemIndex := myini.ReadInteger('video', 'type1', 0);
    LEIP1.Text := myini.ReadString('video', 'ip1', '192.168.1.100');
    LEPort1.Text := myini.ReadString('video', 'port1', '8000');
    LEUser1.Text := myini.ReadString('video', 'user1', 'admin');
    LEPass1.Text := TCommonUtil.deBase64(myini.ReadString('video', 'pass1', 'MTIzNDU='));

    CBType2.ItemIndex := myini.ReadInteger('video', 'type2', 0);
    LEIP2.Text := myini.ReadString('video', 'ip2', '192.168.1.101');
    LEPort2.Text := myini.ReadString('video', 'port2', '8000');
    LEUser2.Text := myini.ReadString('video', 'user2', 'admin');
    LEPass2.Text := TCommonUtil.deBase64(myini.ReadString('video', 'pass2', 'MTIzNDU='));

    CBType3.ItemIndex := myini.ReadInteger('video', 'type3', 0);
    LEIP3.Text := myini.ReadString('video', 'ip3', '192.168.1.102');
    LEPort3.Text := myini.ReadString('video', 'port3', '8000');
    LEUser3.Text := myini.ReadString('video', 'user3', 'admin');
    LEPass3.Text := TCommonUtil.deBase64(myini.ReadString('video', 'pass3', 'MTIzNDU='));

    CBType4.ItemIndex := myini.ReadInteger('video', 'type4', 0);
    LEIP4.Text := myini.ReadString('video', 'ip4', '192.168.1.103');
    LEPort4.Text := myini.ReadString('video', 'port4', '8000');
    LEUser4.Text := myini.ReadString('video', 'user4', 'admin');
    LEPass4.Text := TCommonUtil.deBase64(myini.ReadString('video', 'pass4', 'MTIzNDU='));

    CBUseRecord.Checked := myini.ReadBool('video', 'use_record', False);
    EdtRecordAddr.Text := myini.ReadString('video', 'record_addr', 'D:\Record\');

    CBUsePicText.Checked := myini.ReadBool('video', 'use_pic_text', False);
    CBShowCar.Checked := myini.ReadBool('video', 'show_car', False);
    CBShowFaHuo.Checked := myini.ReadBool('video', 'show_faHuo', False);
    CBShowShouHuo.Checked := myini.ReadBool('video', 'show_shouHuo', False);
    CBShowGoods.Checked := myini.ReadBool('video', 'show_goods', False);
    CBShowSpec.Checked := myini.ReadBool('video', 'show_spec', False);
    CBShowGross.Checked := myini.ReadBool('video', 'show_gross', False);
    CBShowTare.Checked := myini.ReadBool('video', 'show_tare', False);
    CBShowNet.Checked := myini.ReadBool('video', 'show_net', False);

  finally
    myini.Free;
  end;
end;

procedure TVideoSetForm.BitBtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TVideoSetForm.BitBtnOKClick(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'video.ini');
  try
    myini.WriteInteger('video', 'type', CBVideoType.ItemIndex);
    myini.WriteInteger('video', 'display_type', CBDisplayType.ItemIndex);

    myini.WriteBool('video', 'use1', CBUse1.Checked);
    myini.WriteBool('video', 'use2', CBUse2.Checked);
    myini.WriteBool('video', 'use3', CBUse3.Checked);
    myini.WriteBool('video', 'use4', CBUse4.Checked);

    myini.WriteInteger('video', 'video1', CBVideo1.ItemIndex);
    myini.WriteInteger('video', 'video2', CBVideo2.ItemIndex);
    myini.WriteInteger('video', 'video3', CBVideo3.ItemIndex);
    myini.WriteInteger('video', 'video4', CBVideo4.ItemIndex);

    myini.WriteString('video', 'ip', LEIP.Text);
    myini.WriteString('video', 'port', LEPort.Text);
    myini.WriteString('video', 'user', LEUser.Text);
    myini.WriteString('video', 'pass', TCommonUtil.base64(LEPass.Text));

    myini.WriteBool('video', 'showDate', CBShowDate.Checked);
    myini.WriteBool('video', 'showTime', CBShowTime.Checked);
    myini.WriteBool('video', 'showLogo', CBShowLogo.Checked);

    myini.WriteString('video', 'dateX', LEDateX.Text);
    myini.WriteString('video', 'dateY', LEDateY.Text);
    myini.WriteString('video', 'timeX', LETimeX.Text);
    myini.WriteString('video', 'timeY', LETimeY.Text);
    myini.WriteString('video', 'logoX', LELogoX.Text);
    myini.WriteString('video', 'logoY', LELogoY.Text);
    myini.WriteString('video', 'logo', EdtLogo.Text);

    VideoForm.showDate := CBShowDate.Checked;
    VideoForm.showTime := CBShowTime.Checked;
    VideoForm.showLogo := CBShowLogo.Checked;
    VideoForm.dateX := StrToIntDef(LEDateX.Text, 10);
    VideoForm.dateY := StrToIntDef(LEDateY.Text, 10);
    VideoForm.timeX := StrToIntDef(LETimeX.Text, 135);
    VideoForm.timeY := StrToIntDef(LETimeY.Text, 10);
    VideoForm.logoX := StrToIntDef(LELogoX.Text, 10);
    VideoForm.logoY := StrToIntDef(LELogoY.Text, 30);
    VideoForm.logo := EdtLogo.Text;
    VideoForm.showScreenDate();
    VideoForm.showScreenTime();
    VideoForm.showScreenLogo();

    myini.WriteInteger('video', 'type1', CBType1.ItemIndex);
    myini.WriteString('video', 'ip1', LEIP1.Text);
    myini.WriteInteger('video', 'port1', StrToIntDef(LEPort1.Text, 8000));
    myini.WriteString('video', 'user1', LEUser1.Text);
    myini.WriteString('video', 'pass1', TCommonUtil.base64(LEPass1.Text));

    myini.WriteInteger('video', 'type2', CBType2.ItemIndex);
    myini.WriteString('video', 'ip2', LEIP2.Text);
    myini.WriteInteger('video', 'port2', StrToIntDef(LEPort2.Text, 8000));
    myini.WriteString('video', 'user2', LEUser2.Text);
    myini.WriteString('video', 'pass2', TCommonUtil.base64(LEPass2.Text));

    myini.WriteInteger('video', 'type3', CBType3.ItemIndex);
    myini.WriteString('video', 'ip3', LEIP3.Text);
    myini.WriteInteger('video', 'port3', StrToIntDef(LEPort3.Text, 8000));
    myini.WriteString('video', 'user3', LEUser3.Text);
    myini.WriteString('video', 'pass3', TCommonUtil.base64(LEPass3.Text));

    myini.WriteInteger('video', 'type4', CBType4.ItemIndex);
    myini.WriteString('video', 'ip4', LEIP4.Text);
    myini.WriteInteger('video', 'port4', StrToIntDef(LEPort4.Text, 8000));
    myini.WriteString('video', 'user4', LEUser4.Text);
    myini.WriteString('video', 'pass4', TCommonUtil.base64(LEPass4.Text));

    myini.WriteBool('video', 'use_record', CBUseRecord.Checked);
    myini.WriteString('video', 'record_addr', EdtRecordAddr.Text);

    myini.WriteBool('video', 'use_pic_text', CBUsePicText.Checked);
    myini.WriteBool('video', 'show_car', CBShowCar.Checked);
    myini.WriteBool('video', 'show_faHuo', CBShowFaHuo.Checked);
    myini.WriteBool('video', 'show_shouHuo', CBShowShouHuo.Checked);
    myini.WriteBool('video', 'show_goods', CBShowGoods.Checked);
    myini.WriteBool('video', 'show_spec', CBShowSpec.Checked);
    myini.WriteBool('video', 'show_gross', CBShowGross.Checked);
    myini.WriteBool('video', 'show_tare', CBShowTare.Checked);
    myini.WriteBool('video', 'show_net', CBShowNet.Checked);
    VideoForm.usePicText := CBUsePicText.Checked;
    VideoForm.showCar := CBShowCar.Checked;
    VideoForm.showFaHuo := CBShowFaHuo.Checked;
    VideoForm.showShouHuo := CBShowShouHuo.Checked;
    VideoForm.showGoods := CBShowGoods.Checked;
    VideoForm.showSpec := CBShowSpec.Checked;
    VideoForm.showGross := CBShowGross.Checked;
    VideoForm.showTare := CBShowTare.Checked;
    VideoForm.showNet := CBShowNet.Checked;

  finally
    myini.Free;
    Close;
  end;
end;

procedure TVideoSetForm.CBVideoTypeChange(Sender: TObject);
begin
  if CBVideoType.ItemIndex = 2 then
  begin
    LEPort.Text := '8000';
  end
  else if CBVideoType.ItemIndex = 3 then
  begin
    LEPort.Text := '37777';
  end;
end;

procedure TVideoSetForm.CBType1Change(Sender: TObject);
begin
  case (Sender as TComboBox).ItemIndex of
    0: LEPort1.Text := '8000';
    1: LEPort1.Text := '37777';
  end;
end;

procedure TVideoSetForm.CBType2Change(Sender: TObject);
begin
  case (Sender as TComboBox).ItemIndex of
    0: LEPort2.Text := '8000';
    1: LEPort2.Text := '37777';
  end;
end;

procedure TVideoSetForm.CBType3Change(Sender: TObject);
begin
  case (Sender as TComboBox).ItemIndex of
    0: LEPort3.Text := '8000';
    1: LEPort3.Text := '37777';
  end;
end;

procedure TVideoSetForm.CBType4Change(Sender: TObject);
begin
  case (Sender as TComboBox).ItemIndex of
    0: LEPort4.Text := '8000';
    1: LEPort4.Text := '37777';
  end;
end;

procedure TVideoSetForm.SBRecordAddrSetClick(Sender: TObject);
begin
  EdtRecordAddr.Text := TCommonUtil.SelectFolder(handle, '请选择目录');
end;

end.

