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
    procedure FormShow(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
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
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'video.ini');
  try
    CBVideoType.ItemIndex := myini.ReadInteger('video', 'type', 1);
    CBDisplayType.ItemIndex := myini.ReadInteger('video', 'display_type', 2);

    CBUse1.Checked := myini.ReadBool('video', 'use1', True);
    CBUse2.Checked := myini.ReadBool('video', 'use2', True);
    CBUse3.Checked := myini.ReadBool('video', 'use3', True);
    CBUse4.Checked := myini.ReadBool('video', 'use4', True);

    CBVideo1.ItemIndex := myini.ReadInteger('video', 'video1', 0);
    CBVideo2.ItemIndex := myini.ReadInteger('video', 'video2', 1);
    CBVideo3.ItemIndex := myini.ReadInteger('video', 'video3', 2);
    CBVideo4.ItemIndex := myini.ReadInteger('video', 'video4', 3);

    LEIp.Text := myini.ReadString('video', 'ip', '192.168.1.250');
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
  finally
    myini.Free;
    Close;
  end;
end;

end.

