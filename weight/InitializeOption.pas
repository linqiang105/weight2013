unit InitializeOption;

interface

uses
  Windows, Classes, Controls, Forms,
  StdCtrls, Buttons;

type
  TInitializeOptionForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBWeight: TCheckBox;
    CBUser: TCheckBox;
    CBCar: TCheckBox;
    CBGoods: TCheckBox;
    CBSpec: TCheckBox;
    CBFaHuo: TCheckBox;
    CBShouHuo: TCheckBox;
    CBBackup1: TCheckBox;
    CBBackup2: TCheckBox;
    CBBackup3: TCheckBox;
    CBBackup4: TCheckBox;
    CBBackup5: TCheckBox;
    CBBackRecord: TCheckBox;
    CBLog: TCheckBox;
    CBTao: TCheckBox;
    CBBackup10: TCheckBox;
    CBBackup11: TCheckBox;
    CBBackup12: TCheckBox;
    CBBackup13: TCheckBox;
    CBBackup14: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InitializeOptionForm: TInitializeOptionForm;

implementation

uses
  Main, WeightUtil;

{$R *.dfm}

procedure TInitializeOptionForm.FormShow(Sender: TObject);
begin
  CBCar.Caption := MainForm.poWeightSetConfig.carCaption;
  CBFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  CBShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  CBGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  CBSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  CBBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  CBBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  CBBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  CBBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  CBBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  CBBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  CBBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  CBBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  CBBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  CBBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;
end;

procedure TInitializeOptionForm.BitBtn1Click(Sender: TObject);
begin
  try
    if CBWeight.Checked then TWeightUtil.clearWeightInfo;
    if CBUser.Checked then TWeightUtil.clearUserInfo;
    if CBCar.Checked then TWeightUtil.clearCar;
    if CBFaHuo.Checked then TWeightUtil.clearFaHuo;
    if CBShouHuo.Checked then TWeightUtil.clearShouHuo;
    if CBGoods.Checked then TWeightUtil.clearGoods;
    if CBSpec.Checked then TWeightUtil.clearSpec;
    if CBBackup1.Checked then TWeightUtil.clearBackup1;
    if CBBackup2.Checked then TWeightUtil.clearBackup2;
    if CBBackup3.Checked then TWeightUtil.clearBackup3;
    if CBBackup4.Checked then TWeightUtil.clearBackup4;
    if CBBackup5.Checked then TWeightUtil.clearBackup5;
    if CBBackup10.Checked then TWeightUtil.clearBackup10;
    if CBBackup11.Checked then TWeightUtil.clearBackup11;
    if CBBackup12.Checked then TWeightUtil.clearBackup12;
    if CBBackup13.Checked then TWeightUtil.clearBackup13;
    if CBBackup14.Checked then TWeightUtil.clearBackup14;
    if CBBackRecord.Checked then TWeightUtil.clearBackRecord;
    if CBLog.Checked then TWeightUtil.clearLog;
    if CBTao.Checked then TWeightUtil.clearTao;
    Application.MessageBox('数据库初始化成功!', '提示', MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  except
    Application.MessageBox('数据库初始化失败!', '错误', MB_OK + MB_ICONSTOP +
      MB_TOPMOST);
  end;
end;

end.
d.
