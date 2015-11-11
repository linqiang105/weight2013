unit WeightSet;

interface

uses
  SysUtils, Classes, Controls, Forms, Windows, Dialogs,
  Spin, StdCtrls, Buttons, IniFiles, ExtCtrls, ComCtrls, RzCmboBx;

type
  TWeightSetForm = class(TForm)
    BtnOK: TBitBtn;
    BtnCancel: TBitBtn;
    PCWeightSet: TPageControl;
    TSShow: TTabSheet;
    BtnLoad: TBitBtn;
    TSDefault: TTabSheet;
    GBDefault: TGroupBox;
    LECarDefault: TLabeledEdit;
    LEShouHuoDefault: TLabeledEdit;
    LESpecDefault: TLabeledEdit;
    LEBundleDefault: TLabeledEdit;
    LEPriceDefault: TLabeledEdit;
    LEBackup1Default: TLabeledEdit;
    LEBackup3Default: TLabeledEdit;
    LEBackup5Default: TLabeledEdit;
    LEFaHuoDefault: TLabeledEdit;
    LEGoodsDefault: TLabeledEdit;
    LEScaleDefault: TLabeledEdit;
    LEMemoDefault: TLabeledEdit;
    LEBackup2Default: TLabeledEdit;
    LEBackup4Default: TLabeledEdit;
    LEBackup10Default: TLabeledEdit;
    LEBackup11Default: TLabeledEdit;
    LEBackup12Default: TLabeledEdit;
    LEBackup13Default: TLabeledEdit;
    LEBackup14Default: TLabeledEdit;
    LEBackup6Default: TLabeledEdit;
    LEBackup8Default: TLabeledEdit;
    LEBackup7Default: TLabeledEdit;
    LEBackup9Default: TLabeledEdit;
    LEBackup15Default: TLabeledEdit;
    LEBackup16Default: TLabeledEdit;
    LEBackup17Default: TLabeledEdit;
    LEBackup18Default: TLabeledEdit;
    TSFormule: TTabSheet;
    CBUseExpression6: TCheckBox;
    CBUseExpression7: TCheckBox;
    CBUseExpression8: TCheckBox;
    EdtExpression6: TEdit;
    EdtExpression7: TEdit;
    EdtExpression8: TEdit;
    CBUseExpression9: TCheckBox;
    EdtExpression9: TEdit;
    BtnSetFormule6: TBitBtn;
    BtnSetFormule7: TBitBtn;
    BtnSetFormule8: TBitBtn;
    BtnSetFormule9: TBitBtn;
    CBUseExpression15: TCheckBox;
    CBUseExpression16: TCheckBox;
    CBUseExpression17: TCheckBox;
    EdtExpression15: TEdit;
    EdtExpression16: TEdit;
    EdtExpression17: TEdit;
    CBUseExpression18: TCheckBox;
    EdtExpression18: TEdit;
    BtnSetFormule15: TBitBtn;
    BtnSetFormule16: TBitBtn;
    BtnSetFormule17: TBitBtn;
    BtnSetFormule18: TBitBtn;
    GBShow: TGroupBox;
    EdtCar: TLabeledEdit;
    EdtFaHuo: TLabeledEdit;
    EdtShouHuo: TLabeledEdit;
    EdtGoods: TLabeledEdit;
    EdtSpec: TLabeledEdit;
    EdtGross: TLabeledEdit;
    EdtTare: TLabeledEdit;
    EdtNet: TLabeledEdit;
    EdtBundle: TLabeledEdit;
    EdtReal: TLabeledEdit;
    EdtPrice: TLabeledEdit;
    EdtSum: TLabeledEdit;
    EdtCost: TLabeledEdit;
    EdtGrossTime: TLabeledEdit;
    EdtTareTime: TLabeledEdit;
    EdtMemo: TLabeledEdit;
    EdtBackup1: TLabeledEdit;
    EdtBackup2: TLabeledEdit;
    EdtBackup3: TLabeledEdit;
    EdtBackup4: TLabeledEdit;
    EdtBackup10: TLabeledEdit;
    EdtBackup11: TLabeledEdit;
    EdtBackup12: TLabeledEdit;
    EdtBackup13: TLabeledEdit;
    EdtBackup14: TLabeledEdit;
    EdtBackup5: TLabeledEdit;
    EdtBackup6: TLabeledEdit;
    EdtBackup7: TLabeledEdit;
    EdtBackup8: TLabeledEdit;
    EdtBackup9: TLabeledEdit;
    EdtBackup15: TLabeledEdit;
    EdtBackup16: TLabeledEdit;
    EdtBackup17: TLabeledEdit;
    EdtBackup18: TLabeledEdit;
    EdtScale: TLabeledEdit;
    EdtQuanter: TLabeledEdit;
    GBFormule: TGroupBox;
    lblBackup6: TLabel;
    lblBackup7: TLabel;
    lblBackup8: TLabel;
    lblBackup9: TLabel;
    lblBackup15: TLabel;
    lblBackup16: TLabel;
    lblBackup17: TLabel;
    lblBackup18: TLabel;
    TSPosition: TTabSheet;
    TSAutoClear: TTabSheet;
    GBPosition: TGroupBox;
    cb00: TRzComboBox;
    cb01: TRzComboBox;
    cb02: TRzComboBox;
    cb03: TRzComboBox;
    cb04: TRzComboBox;
    cb05: TRzComboBox;
    cb06: TRzComboBox;
    cb07: TRzComboBox;
    cb08: TRzComboBox;
    cb10: TRzComboBox;
    cb11: TRzComboBox;
    cb12: TRzComboBox;
    cb13: TRzComboBox;
    cb14: TRzComboBox;
    cb15: TRzComboBox;
    cb16: TRzComboBox;
    cb17: TRzComboBox;
    cb18: TRzComboBox;
    cb20: TRzComboBox;
    cb21: TRzComboBox;
    cb22: TRzComboBox;
    cb23: TRzComboBox;
    cb24: TRzComboBox;
    cb25: TRzComboBox;
    cb26: TRzComboBox;
    cb27: TRzComboBox;
    cb28: TRzComboBox;
    cb30: TRzComboBox;
    cb31: TRzComboBox;
    cb32: TRzComboBox;
    cb33: TRzComboBox;
    cb34: TRzComboBox;
    cb35: TRzComboBox;
    cb36: TRzComboBox;
    GBAutoClear: TGroupBox;
    CBClearCar: TCheckBox;
    CBClearShouHuo: TCheckBox;
    CBClearSpec: TCheckBox;
    CBClearBundle: TCheckBox;
    CBClearBackup1: TCheckBox;
    CBClearBackup3: TCheckBox;
    CBClearBackup5: TCheckBox;
    CBClearFahuo: TCheckBox;
    CBClearGoods: TCheckBox;
    CBClearMemo: TCheckBox;
    CBClearBackup2: TCheckBox;
    CBClearBackup4: TCheckBox;
    CBClearBackup10: TCheckBox;
    CBClearBackup11: TCheckBox;
    CBClearBackup12: TCheckBox;
    CBClearBackup13: TCheckBox;
    CBClearBackup14: TCheckBox;
    CBClearBackup6: TCheckBox;
    CBClearBackup7: TCheckBox;
    CBClearBackup8: TCheckBox;
    CBClearBackup9: TCheckBox;
    CBClearBackup15: TCheckBox;
    CBClearBackup16: TCheckBox;
    CBClearBackup17: TCheckBox;
    CBClearBackup18: TCheckBox;
    CBClearPrice: TCheckBox;
    CBClearScale: TCheckBox;
    GBMust: TGroupBox;
    CBMustCar: TCheckBox;
    CBMustShouHuo: TCheckBox;
    CBMustSpec: TCheckBox;
    CBMustBundle: TCheckBox;
    CBMustBackup1: TCheckBox;
    CBMustBackup3: TCheckBox;
    CBMustBackup5: TCheckBox;
    CBMustFaHuo: TCheckBox;
    CBMustGoods: TCheckBox;
    CBMustMemo: TCheckBox;
    CBMustBackup2: TCheckBox;
    CBMustBackup4: TCheckBox;
    CBMustBackup10: TCheckBox;
    CBMustBackup11: TCheckBox;
    CBMustBackup12: TCheckBox;
    CBMustBackup13: TCheckBox;
    CBMustBackup14: TCheckBox;
    CBMustBackup6: TCheckBox;
    CBMustBackup7: TCheckBox;
    CBMustBackup8: TCheckBox;
    CBMustBackup9: TCheckBox;
    CBMustBackup15: TCheckBox;
    CBMustBackup16: TCheckBox;
    CBMustBackup17: TCheckBox;
    CBMustBackup18: TCheckBox;
    CBMustPrice: TCheckBox;
    CBMustScale: TCheckBox;
    BtnSaveAs: TBitBtn;
    CBMustGross: TCheckBox;
    CBMustTare: TCheckBox;
    CBMustNet: TCheckBox;
    CBMustReal: TCheckBox;
    CBMustSum: TCheckBox;
    CBMustCost: TCheckBox;
    CBMustQuanter: TCheckBox;
    CBRule61: TComboBox;
    CBGroup6: TComboBox;
    Label1: TLabel;
    CBRule71: TComboBox;
    CBGroup7: TComboBox;
    CBRule81: TComboBox;
    CBGroup8: TComboBox;
    CBRule91: TComboBox;
    CBGroup9: TComboBox;
    CBRule151: TComboBox;
    CBGroup15: TComboBox;
    CBRule161: TComboBox;
    CBGroup16: TComboBox;
    CBRule171: TComboBox;
    CBGroup17: TComboBox;
    CBRule181: TComboBox;
    CBGroup18: TComboBox;
    CBRule62: TComboBox;
    CBRule72: TComboBox;
    CBRule82: TComboBox;
    CBRule92: TComboBox;
    CBRule152: TComboBox;
    CBRule162: TComboBox;
    CBRule172: TComboBox;
    CBRule182: TComboBox;
    procedure CBUseExpression6Click(Sender: TObject);
    procedure CBUseExpression7Click(Sender: TObject);
    procedure CBUseExpression8Click(Sender: TObject);
    procedure CBUseExpression9Click(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnSetFormule6Click(Sender: TObject);
    procedure BtnSetFormule7Click(Sender: TObject);
    procedure BtnSetFormule8Click(Sender: TObject);
    procedure BtnSetFormule9Click(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure CBUseExpression15Click(Sender: TObject);
    procedure CBUseExpression16Click(Sender: TObject);
    procedure CBUseExpression17Click(Sender: TObject);
    procedure CBUseExpression18Click(Sender: TObject);
    procedure BtnSetFormule15Click(Sender: TObject);
    procedure BtnSetFormule16Click(Sender: TObject);
    procedure BtnSetFormule17Click(Sender: TObject);
    procedure BtnSetFormule18Click(Sender: TObject);
    procedure BtnLoadClick(Sender: TObject);
    procedure BtnSaveAsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cb00Change(Sender: TObject);
    procedure TSPositionShow(Sender: TObject);
  private
    myini: TIniFile;
    arrWeightKey, arrWeightItem: array[0..33] of TStringList;
    procedure initWeightArr();
    procedure reloadComboBox();
    procedure changeComboBox(str: array of string);
    { Private declarations }
  public
    { Public declarations }
    function loadShowName(): Boolean;
    function saveShowName(): Boolean;
    /////////////////////////////////////////////
    function loadPosition(): Boolean;
    function savePosition(): Boolean;
    ////////////////////////////////////////////
    function loadDefault(): Boolean;
    function saveDefault(): Boolean;
    ////////////////////////////////////////////
    function loadAutoClear(): Boolean;
    function saveAutoClear(): Boolean;
    ////////////////////////////////////////////
    function loadFormule(): Boolean;
    function saveFormule(): Boolean;
    ////////////////////////////////////////////
    function loadMust(): Boolean;
    function saveMust(): Boolean;
    ////////////////////////////////////////////
    function loadField(): Boolean;
  end;

var
  WeightSetForm: TWeightSetForm;

implementation

uses Main, Formule, CommonUtil, SysConfig;

{$R *.dfm}

procedure TWeightSetForm.CBUseExpression6Click(Sender: TObject);
begin
  EdtExpression6.Enabled := CBUseExpression6.Checked;
  BtnSetFormule6.Enabled := CBUseExpression6.Checked;
  CBRule61.Enabled := CBUseExpression6.Checked;
  CBRule62.Enabled := CBUseExpression6.Checked;
  CBGroup6.Enabled := CBUseExpression6.Checked;
end;

procedure TWeightSetForm.CBUseExpression7Click(Sender: TObject);
begin
  EdtExpression7.Enabled := CBUseExpression7.Checked;
  BtnSetFormule7.Enabled := CBUseExpression7.Checked;
  CBRule71.Enabled := CBUseExpression7.Checked;
  CBRule72.Enabled := CBUseExpression7.Checked;
  CBGroup7.Enabled := CBUseExpression7.Checked;
end;

procedure TWeightSetForm.CBUseExpression8Click(Sender: TObject);
begin
  EdtExpression8.Enabled := CBUseExpression8.Checked;
  BtnSetFormule8.Enabled := CBUseExpression8.Checked;
  CBRule81.Enabled := CBUseExpression8.Checked;
  CBRule82.Enabled := CBUseExpression8.Checked;
  CBGroup8.Enabled := CBUseExpression8.Checked;
end;

procedure TWeightSetForm.CBUseExpression9Click(Sender: TObject);
begin
  EdtExpression9.Enabled := CBUseExpression9.Checked;
  BtnSetFormule9.Enabled := CBUseExpression9.Checked;
  CBRule91.Enabled := CBUseExpression9.Checked;
  CBRule92.Enabled := CBUseExpression9.Checked;
  CBGroup9.Enabled := CBUseExpression9.Checked;
end;

procedure TWeightSetForm.BtnOKClick(Sender: TObject);
begin
  //界面设置配置
  saveShowName;
  savePosition;
  saveDefault;
  saveAutoClear;
  saveMust;
  saveFormule;

  loadShowName;
  reloadComboBox;
  loadPosition;
  loadAutoClear;
  loadDefault;
  loadMust;
  loadFormule;

  //生效到主窗体中
  if MainForm.PanelMain.Visible then
  begin
    MainForm.FrmWeight1.resizeFrame;
    MainForm.loadFormDesign;
    MainForm.SMWeight.Click;
  end;
end;

procedure TWeightSetForm.FormShow(Sender: TObject);
begin
  loadShowName;
  reloadComboBox;
  loadPosition;
  loadAutoClear;
  loadDefault;
  loadMust;
  loadFormule;
end;

procedure TWeightSetForm.BtnSetFormule6Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression6.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min6;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType6;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point6;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide6;
    FormuleForm.ShowModal;
    EdtExpression6.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min6 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType6 := FormuleForm.sumType;
    MainForm.weightSetConfig.point6 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide6 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule7Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression7.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min7;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType7;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point7;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide7;
    FormuleForm.ShowModal;
    EdtExpression7.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min7 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType7 := FormuleForm.sumType;
    MainForm.weightSetConfig.point7 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide7 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule8Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression8.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min8;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType8;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point8;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide8;
    FormuleForm.ShowModal;
    EdtExpression8.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min8 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType8 := FormuleForm.sumType;
    MainForm.weightSetConfig.point8 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide8 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule9Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression9.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min9;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType9;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point9;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide9;
    FormuleForm.ShowModal;
    EdtExpression9.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min9 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType9 := FormuleForm.sumType;
    MainForm.weightSetConfig.point9 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide9 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TWeightSetForm.CBUseExpression15Click(Sender: TObject);
begin
  EdtExpression15.Enabled := CBUseExpression15.Checked;
  BtnSetFormule15.Enabled := CBUseExpression15.Checked;
  CBRule151.Enabled := CBUseExpression15.Checked;
  CBRule152.Enabled := CBUseExpression15.Checked;
  CBGroup15.Enabled := CBUseExpression15.Checked;
end;

procedure TWeightSetForm.CBUseExpression16Click(Sender: TObject);
begin
  EdtExpression16.Enabled := CBUseExpression16.Checked;
  BtnSetFormule16.Enabled := CBUseExpression16.Checked;
  CBRule161.Enabled := CBUseExpression16.Checked;
  CBRule162.Enabled := CBUseExpression16.Checked;
  CBGroup16.Enabled := CBUseExpression16.Checked;
end;

procedure TWeightSetForm.CBUseExpression17Click(Sender: TObject);
begin
  EdtExpression17.Enabled := CBUseExpression17.Checked;
  BtnSetFormule17.Enabled := CBUseExpression17.Checked;
  CBRule171.Enabled := CBUseExpression17.Checked;
  CBRule172.Enabled := CBUseExpression17.Checked;
  CBGroup17.Enabled := CBUseExpression17.Checked;
end;

procedure TWeightSetForm.CBUseExpression18Click(Sender: TObject);
begin
  EdtExpression18.Enabled := CBUseExpression18.Checked;
  BtnSetFormule18.Enabled := CBUseExpression18.Checked;
  CBRule181.Enabled := CBUseExpression18.Checked;
  CBRule182.Enabled := CBUseExpression18.Checked;
  CBGroup18.Enabled := CBUseExpression18.Checked;
end;

procedure TWeightSetForm.BtnSetFormule15Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression15.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min15;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType15;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point15;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide15;
    FormuleForm.ShowModal;
    EdtExpression15.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min15 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType15 := FormuleForm.sumType;
    MainForm.weightSetConfig.point15 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide15 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule16Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression16.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min16;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType16;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point16;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide16;
    FormuleForm.ShowModal;
    EdtExpression16.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min16 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType16 := FormuleForm.sumType;
    MainForm.weightSetConfig.point16 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide16 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule17Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression17.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min17;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType17;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point17;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide17;
    FormuleForm.ShowModal;
    EdtExpression17.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min17 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType17 := FormuleForm.sumType;
    MainForm.weightSetConfig.point17 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide17 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule18Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression18.Text;
    FormuleForm.minValue := MainForm.weightSetConfig.min18;
    FormuleForm.sumType := MainForm.weightSetConfig.sumType18;
    FormuleForm.sumPoint := MainForm.weightSetConfig.point18;
    FormuleForm.sumDivide := MainForm.weightSetConfig.divide18;
    FormuleForm.ShowModal;
    EdtExpression18.Text := FormuleForm.returnValue;
    MainForm.weightSetConfig.min18 := FormuleForm.minValue;
    MainForm.weightSetConfig.sumType18 := FormuleForm.sumType;
    MainForm.weightSetConfig.point18 := FormuleForm.sumPoint;
    MainForm.weightSetConfig.divide18 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnLoadClick(Sender: TObject);
var f: string;
begin
  f := TCommonUtil.openFileDialog('ini', '界面配置文件(*.wfc)|*.wfc',
    ExtractFilePath(ParamStr(0)) + 'Design');
  if FileExists(f) then
  begin
    CopyFile(PChar(f), PChar(ExtractFilePath(ParamStr(0)) + 'design.ini'), False);
    TSysConfigUtil.loadFormConfig(MainForm.weightSetConfig);

    loadShowName;
    reloadComboBox;
    loadPosition;
    loadAutoClear;
    loadDefault;
    loadMust;
    loadFormule;

    if MainForm.PanelMain.Visible then
    begin
      MainForm.loadFormDesign;
      MainForm.SMWeight.Click;
    end;
  end;
end;

procedure TWeightSetForm.BtnSaveAsClick(Sender: TObject);
var f: string;
begin
  f := InputBox('请输入界面名称', '', '');
  if (f <> '') then
  begin
    if not CopyFile(PChar(ExtractFilePath(ParamStr(0)) + '\design.ini'),
      PChar(ExtractFilePath(ParamStr(0)) + '\Design\' + f + '.wfc'), False) then
    begin
      MessageBox(0, '称重界面配置保存失败,请重命名后再试', '错误', MB_OK +
        MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    end
    else
    begin
      MessageBox(0, '称重界面配置保存成功', '提示', MB_OK + MB_ICONINFORMATION
        + MB_DEFBUTTON2 + MB_TOPMOST);
    end;
  end;
end;

function TWeightSetForm.loadAutoClear: Boolean;
begin
  //自动清空选项
  CBClearCar.Caption := MainForm.weightSetConfig.carCaption;
  CBClearFaHuo.Caption := MainForm.weightSetConfig.faHuoCaption;
  CBClearShouHuo.Caption := MainForm.weightSetConfig.shouHuoCaption;
  CBClearGoods.Caption := MainForm.weightSetConfig.goodsCaption;
  CBClearSpec.Caption := MainForm.weightSetConfig.specCaption;
  CBClearBundle.Caption := MainForm.weightSetConfig.bundleCaption;
  CBClearPrice.Caption := MainForm.weightSetConfig.priceCaption;
  CBClearScale.Caption := MainForm.weightSetConfig.scaleCaption;
  CBClearMemo.Caption := MainForm.weightSetConfig.memoCaption;
  CBClearBackup1.Caption := MainForm.weightSetConfig.backup1Caption;
  CBClearBackup2.Caption := MainForm.weightSetConfig.backup2Caption;
  CBClearBackup3.Caption := MainForm.weightSetConfig.backup3Caption;
  CBClearBackup4.Caption := MainForm.weightSetConfig.backup4Caption;
  CBClearBackup5.Caption := MainForm.weightSetConfig.backup5Caption;
  CBClearBackup6.Caption := MainForm.weightSetConfig.backup6Caption;
  CBClearBackup7.Caption := MainForm.weightSetConfig.backup7Caption;
  CBClearBackup8.Caption := MainForm.weightSetConfig.backup8Caption;
  CBClearBackup9.Caption := MainForm.weightSetConfig.backup9Caption;
  CBClearBackup10.Caption := MainForm.weightSetConfig.backup10Caption;
  CBClearBackup11.Caption := MainForm.weightSetConfig.backup11Caption;
  CBClearBackup12.Caption := MainForm.weightSetConfig.backup12Caption;
  CBClearBackup13.Caption := MainForm.weightSetConfig.backup13Caption;
  CBClearBackup14.Caption := MainForm.weightSetConfig.backup14Caption;
  CBClearBackup15.Caption := MainForm.weightSetConfig.backup15Caption;
  CBClearBackup16.Caption := MainForm.weightSetConfig.backup16Caption;
  CBClearBackup17.Caption := MainForm.weightSetConfig.backup17Caption;
  CBClearBackup18.Caption := MainForm.weightSetConfig.backup18Caption;

  CBClearCar.Checked := myini.ReadBool('formDesign', 'clearCar', True);
  CBClearFaHuo.Checked := myini.ReadBool('formDesign', 'clearFaHuo', True);
  CBClearShouHuo.Checked := myini.ReadBool('formDesign', 'clearShouHuo', True);
  CBClearGoods.Checked := myini.ReadBool('formDesign', 'clearGoods', True);
  CBClearSpec.Checked := myini.ReadBool('formDesign', 'clearSpec', True);
  CBClearBundle.Checked := myini.ReadBool('formDesign', 'clearBundle', True);
  CBClearPrice.Checked := myini.ReadBool('formDesign', 'clearPrice', True);
  CBClearScale.Checked := myini.ReadBool('formDesign', 'clearScale', True);
  CBClearMemo.Checked := myini.ReadBool('formDesign', 'clearMemo', True);
  CBClearBackup1.Checked := myini.ReadBool('formDesign', 'clearBackup1', True);
  CBClearBackup2.Checked := myini.ReadBool('formDesign', 'clearBackup2', True);
  CBClearBackup3.Checked := myini.ReadBool('formDesign', 'clearBackup3', True);
  CBClearBackup4.Checked := myini.ReadBool('formDesign', 'clearBackup4', True);
  CBClearBackup5.Checked := myini.ReadBool('formDesign', 'clearBackup5', True);
  CBClearBackup6.Checked := myini.ReadBool('formDesign', 'clearBackup6', True);
  CBClearBackup7.Checked := myini.ReadBool('formDesign', 'clearBackup7', True);
  CBClearBackup8.Checked := myini.ReadBool('formDesign', 'clearBackup8', True);
  CBClearBackup9.Checked := myini.ReadBool('formDesign', 'clearBackup9', True);
  CBClearBackup10.Checked := myini.ReadBool('formDesign', 'clearBackup10', True);
  CBClearBackup11.Checked := myini.ReadBool('formDesign', 'clearBackup11', True);
  CBClearBackup12.Checked := myini.ReadBool('formDesign', 'clearBackup12', True);
  CBClearBackup13.Checked := myini.ReadBool('formDesign', 'clearBackup13', True);
  CBClearBackup14.Checked := myini.ReadBool('formDesign', 'clearBackup14', True);
  CBClearBackup15.Checked := myini.ReadBool('formDesign', 'clearBackup15', True);
  CBClearBackup16.Checked := myini.ReadBool('formDesign', 'clearBackup16', True);
  CBClearBackup17.Checked := myini.ReadBool('formDesign', 'clearBackup17', True);
  CBClearBackup18.Checked := myini.ReadBool('formDesign', 'clearBackup18', True);
  Result := True;
end;

function TWeightSetForm.loadDefault: Boolean;
begin
  //读默认值
  LECarDefault.EditLabel.Caption := MainForm.weightSetConfig.carCaption + '    ';
  LEFaHuoDefault.EditLabel.Caption := MainForm.weightSetConfig.faHuoCaption + '    ';
  LEShouHuoDefault.EditLabel.Caption := MainForm.weightSetConfig.shouHuoCaption + '    ';
  LEGoodsDefault.EditLabel.Caption := MainForm.weightSetConfig.goodsCaption + '    ';
  LESpecDefault.EditLabel.Caption := MainForm.weightSetConfig.specCaption + '    ';
  LEBundleDefault.EditLabel.Caption := MainForm.weightSetConfig.bundleCaption + '    ';
  LEPriceDefault.EditLabel.Caption := MainForm.weightSetConfig.priceCaption + '    ';
  LEScaleDefault.EditLabel.Caption := MainForm.weightSetConfig.scaleCaption + '    ';
  LEMemoDefault.EditLabel.Caption := MainForm.weightSetConfig.memoCaption + '    ';
  LEBackup1Default.EditLabel.Caption := MainForm.weightSetConfig.backup1Caption + '    ';
  LEBackup2Default.EditLabel.Caption := MainForm.weightSetConfig.backup2Caption + '    ';
  LEBackup3Default.EditLabel.Caption := MainForm.weightSetConfig.backup3Caption + '    ';
  LEBackup4Default.EditLabel.Caption := MainForm.weightSetConfig.backup4Caption + '    ';
  LEBackup5Default.EditLabel.Caption := MainForm.weightSetConfig.backup5Caption + '    ';
  LEBackup6Default.EditLabel.Caption := MainForm.weightSetConfig.backup6Caption + '    ';
  LEBackup7Default.EditLabel.Caption := MainForm.weightSetConfig.backup7Caption + '    ';
  LEBackup8Default.EditLabel.Caption := MainForm.weightSetConfig.backup8Caption + '    ';
  LEBackup9Default.EditLabel.Caption := MainForm.weightSetConfig.backup9Caption + '    ';
  LEBackup10Default.EditLabel.Caption := MainForm.weightSetConfig.backup10Caption + '    ';
  LEBackup11Default.EditLabel.Caption := MainForm.weightSetConfig.backup11Caption + '    ';
  LEBackup12Default.EditLabel.Caption := MainForm.weightSetConfig.backup12Caption + '    ';
  LEBackup13Default.EditLabel.Caption := MainForm.weightSetConfig.backup13Caption + '    ';
  LEBackup14Default.EditLabel.Caption := MainForm.weightSetConfig.backup14Caption + '    ';
  LEBackup15Default.EditLabel.Caption := MainForm.weightSetConfig.backup15Caption + '    ';
  LEBackup16Default.EditLabel.Caption := MainForm.weightSetConfig.backup16Caption + '    ';
  LEBackup17Default.EditLabel.Caption := MainForm.weightSetConfig.backup17Caption + '    ';
  LEBackup18Default.EditLabel.Caption := MainForm.weightSetConfig.backup18Caption + '    ';

  LECarDefault.Text := myini.ReadString('formDesign', 'carDefault', '');
  LEFaHuoDefault.Text := myini.ReadString('formDesign', 'faHuoDefault', '');
  LEShouHuoDefault.Text := myini.ReadString('formDesign', 'shouHuoDefault', '');
  LEGoodsDefault.Text := myini.ReadString('formDesign', 'goodsDefault', '');
  LESpecDefault.Text := myini.ReadString('formDesign', 'specDefault', '');
  LEBundleDefault.Text := myini.ReadString('formDesign', 'bundleDefault', '0');
  LEPriceDefault.Text := myini.ReadString('formDesign', 'priceDefault', '0');
  LEScaleDefault.Text := myini.ReadString('formDesign', 'scaleDefault', '1');
  LEMemoDefault.Text := myini.ReadString('formDesign', 'memoDefault', '');
  LEBackup1Default.Text := myini.ReadString('formDesign', 'backup1Default', '');
  LEBackup2Default.Text := myini.ReadString('formDesign', 'backup2Default', '');
  LEBackup3Default.Text := myini.ReadString('formDesign', 'backup3Default', '');
  LEBackup4Default.Text := myini.ReadString('formDesign', 'backup4Default', '');
  LEBackup5Default.Text := myini.ReadString('formDesign', 'backup5Default', '');
  LEBackup6Default.Text := myini.ReadString('formDesign', 'backup6Default', '0');
  LEBackup7Default.Text := myini.ReadString('formDesign', 'backup7Default', '0');
  LEBackup8Default.Text := myini.ReadString('formDesign', 'backup8Default', '0');
  LEBackup9Default.Text := myini.ReadString('formDesign', 'backup9Default', '0');
  LEBackup10Default.Text := myini.ReadString('formDesign', 'backup10Default', '');
  LEBackup11Default.Text := myini.ReadString('formDesign', 'backup11Default', '');
  LEBackup12Default.Text := myini.ReadString('formDesign', 'backup12Default', '');
  LEBackup13Default.Text := myini.ReadString('formDesign', 'backup13Default', '');
  LEBackup14Default.Text := myini.ReadString('formDesign', 'backup14Default', '');
  LEBackup15Default.Text := myini.ReadString('formDesign', 'backup15Default', '0');
  LEBackup16Default.Text := myini.ReadString('formDesign', 'backup16Default', '0');
  LEBackup17Default.Text := myini.ReadString('formDesign', 'backup17Default', '0');
  LEBackup18Default.Text := myini.ReadString('formDesign', 'backup18Default', '0');
  Result := True;
end;

function TWeightSetForm.loadFormule: Boolean;
begin
  CBRule61.Items.Clear;
  CBRule61.Items.Add('');
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.carCaption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.faHuoCaption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.shouHuoCaption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.goodsCaption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.specCaption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup1Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup2Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup3Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup4Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup5Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup10Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup11Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup12Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup13Caption);
  CBRule61.Items.Add('根据' + MainForm.weightSetConfig.backup14Caption);

  CBRule62.Items := CBRule61.Items;
  CBRule71.Items := CBRule61.Items;
  CBRule72.Items := CBRule61.Items;
  CBRule81.Items := CBRule61.Items;
  CBRule82.Items := CBRule61.Items;
  CBRule91.Items := CBRule61.Items;
  CBRule92.Items := CBRule61.Items;
  CBRule151.Items := CBRule61.Items;
  CBRule152.Items := CBRule61.Items;
  CBRule161.Items := CBRule61.Items;
  CBRule162.Items := CBRule61.Items;
  CBRule171.Items := CBRule61.Items;
  CBRule172.Items := CBRule61.Items;
  CBRule181.Items := CBRule61.Items;
  CBRule182.Items := CBRule61.Items;

  CBGroup6.Items.Clear;
  CBGroup6.Items.Add('');
  CBGroup6.Items.Add('统计车次');
  CBGroup6.Items.Add('统计毛重');
  CBGroup6.Items.Add('统计皮重');
  CBGroup6.Items.Add('统计净重');
  CBGroup6.Items.Add('统计实重');
  CBGroup6.Items.Add('统计金额');
  CBGroup6.Items.Add('统计方量');
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup6Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup7Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup8Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup9Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup15Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup16Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup17Caption);
  CBGroup6.Items.Add('统计' + MainForm.weightSetConfig.backup18Caption);

  CBGroup7.Items := CBGroup6.Items;
  CBGroup8.Items := CBGroup6.Items;
  CBGroup9.Items := CBGroup6.Items;
  CBGroup15.Items := CBGroup6.Items;
  CBGroup16.Items := CBGroup6.Items;
  CBGroup17.Items := CBGroup6.Items;
  CBGroup18.Items := CBGroup6.Items;

  //如果有配置公式,输入框就不允许输入
  lblBackup6.Caption := MainForm.weightSetConfig.backup6Caption;
  lblBackup7.Caption := MainForm.weightSetConfig.backup7Caption;
  lblBackup8.Caption := MainForm.weightSetConfig.backup8Caption;
  lblBackup9.Caption := MainForm.weightSetConfig.backup9Caption;

  lblBackup15.Caption := MainForm.weightSetConfig.backup15Caption;
  lblBackup16.Caption := MainForm.weightSetConfig.backup16Caption;
  lblBackup17.Caption := MainForm.weightSetConfig.backup17Caption;
  lblBackup18.Caption := MainForm.weightSetConfig.backup18Caption;

  CBUseExpression6.Checked := MainForm.weightSetConfig.useExpression6;
  CBUseExpression7.Checked := MainForm.weightSetConfig.useExpression7;
  CBUseExpression8.Checked := MainForm.weightSetConfig.useExpression8;
  CBUseExpression9.Checked := MainForm.weightSetConfig.useExpression9;
  CBUseExpression15.Checked := MainForm.weightSetConfig.useExpression15;
  CBUseExpression16.Checked := MainForm.weightSetConfig.useExpression16;
  CBUseExpression17.Checked := MainForm.weightSetConfig.useExpression17;
  CBUseExpression18.Checked := MainForm.weightSetConfig.useExpression18;
  EdtExpression6.Text := MainForm.weightSetConfig.expression6;
  EdtExpression7.Text := MainForm.weightSetConfig.expression7;
  EdtExpression8.Text := MainForm.weightSetConfig.expression8;
  EdtExpression9.Text := MainForm.weightSetConfig.expression9;
  EdtExpression15.Text := MainForm.weightSetConfig.expression15;
  EdtExpression16.Text := MainForm.weightSetConfig.expression16;
  EdtExpression17.Text := MainForm.weightSetConfig.expression17;
  EdtExpression18.Text := MainForm.weightSetConfig.expression18;

  CBRule61.ItemIndex := MainForm.weightSetConfig.rule61;
  CBRule62.ItemIndex := MainForm.weightSetConfig.rule62;
  CBRule71.ItemIndex := MainForm.weightSetConfig.rule71;
  CBRule72.ItemIndex := MainForm.weightSetConfig.rule72;
  CBRule81.ItemIndex := MainForm.weightSetConfig.rule81;
  CBRule82.ItemIndex := MainForm.weightSetConfig.rule82;
  CBRule91.ItemIndex := MainForm.weightSetConfig.rule91;
  CBRule92.ItemIndex := MainForm.weightSetConfig.rule92;
  CBRule151.ItemIndex := MainForm.weightSetConfig.rule151;
  CBRule152.ItemIndex := MainForm.weightSetConfig.rule152;
  CBRule161.ItemIndex := MainForm.weightSetConfig.rule161;
  CBRule162.ItemIndex := MainForm.weightSetConfig.rule162;
  CBRule171.ItemIndex := MainForm.weightSetConfig.rule171;
  CBRule172.ItemIndex := MainForm.weightSetConfig.rule172;
  CBRule181.ItemIndex := MainForm.weightSetConfig.rule181;
  CBRule182.ItemIndex := MainForm.weightSetConfig.rule182;
                                                            
  CBGroup6.ItemIndex := MainForm.weightSetConfig.group6;
  CBGroup7.ItemIndex := MainForm.weightSetConfig.group7;
  CBGroup8.ItemIndex := MainForm.weightSetConfig.group8;
  CBGroup9.ItemIndex := MainForm.weightSetConfig.group9;
  CBGroup15.ItemIndex := MainForm.weightSetConfig.group15;
  CBGroup16.ItemIndex := MainForm.weightSetConfig.group16;
  CBGroup17.ItemIndex := MainForm.weightSetConfig.group17;
  CBGroup18.ItemIndex := MainForm.weightSetConfig.group18;

  Result := True;
end;

function TWeightSetForm.loadPosition: Boolean;
var i: Integer;
begin
  loadField;

  cb00.ItemIndex := arrWeightKey[0].IndexOf(myini.ReadString('position', 'cb00', '车号'));
  cb01.ItemIndex := arrWeightKey[1].IndexOf(myini.ReadString('position', 'cb01', '发货单位'));
  cb02.ItemIndex := arrWeightKey[2].IndexOf(myini.ReadString('position', 'cb02', '收货单位'));
  cb03.ItemIndex := arrWeightKey[3].IndexOf(myini.ReadString('position', 'cb03', '货名'));
  cb04.ItemIndex := arrWeightKey[4].IndexOf(myini.ReadString('position', 'cb04', '规格'));
  cb05.ItemIndex := arrWeightKey[5].IndexOf(myini.ReadString('position', 'cb05', '备注'));
  cb06.ItemIndex := arrWeightKey[6].IndexOf(myini.ReadString('position', 'cb06', '毛重'));
  cb07.ItemIndex := arrWeightKey[7].IndexOf(myini.ReadString('position', 'cb07', '皮重'));
  cb08.ItemIndex := arrWeightKey[8].IndexOf(myini.ReadString('position', 'cb08', '净重'));

  cb10.ItemIndex := arrWeightKey[9].IndexOf(myini.ReadString('position', 'cb10', ''));
  cb11.ItemIndex := arrWeightKey[10].IndexOf(myini.ReadString('position', 'cb11', ''));
  cb12.ItemIndex := arrWeightKey[11].IndexOf(myini.ReadString('position', 'cb12', ''));
  cb13.ItemIndex := arrWeightKey[12].IndexOf(myini.ReadString('position', 'cb13', ''));
  cb14.ItemIndex := arrWeightKey[13].IndexOf(myini.ReadString('position', 'cb14', ''));
  cb15.ItemIndex := arrWeightKey[14].IndexOf(myini.ReadString('position', 'cb15', ''));
  cb16.ItemIndex := arrWeightKey[15].IndexOf(myini.ReadString('position', 'cb16', ''));
  cb17.ItemIndex := arrWeightKey[16].IndexOf(myini.ReadString('position', 'cb17', ''));
  cb18.ItemIndex := arrWeightKey[17].IndexOf(myini.ReadString('position', 'cb18', ''));

  cb20.ItemIndex := arrWeightKey[18].IndexOf(myini.ReadString('position', 'cb20', ''));
  cb21.ItemIndex := arrWeightKey[19].IndexOf(myini.ReadString('position', 'cb21', ''));
  cb22.ItemIndex := arrWeightKey[20].IndexOf(myini.ReadString('position', 'cb22', ''));
  cb23.ItemIndex := arrWeightKey[21].IndexOf(myini.ReadString('position', 'cb23', ''));
  cb24.ItemIndex := arrWeightKey[22].IndexOf(myini.ReadString('position', 'cb24', ''));
  cb25.ItemIndex := arrWeightKey[23].IndexOf(myini.ReadString('position', 'cb25', ''));
  cb26.ItemIndex := arrWeightKey[24].IndexOf(myini.ReadString('position', 'cb26', ''));
  cb27.ItemIndex := arrWeightKey[25].IndexOf(myini.ReadString('position', 'cb27', ''));
  cb28.ItemIndex := arrWeightKey[26].IndexOf(myini.ReadString('position', 'cb28', ''));

  cb30.ItemIndex := arrWeightKey[27].IndexOf(myini.ReadString('position', 'cb30', ''));
  cb31.ItemIndex := arrWeightKey[28].IndexOf(myini.ReadString('position', 'cb31', ''));
  cb32.ItemIndex := arrWeightKey[29].IndexOf(myini.ReadString('position', 'cb32', ''));
  cb33.ItemIndex := arrWeightKey[30].IndexOf(myini.ReadString('position', 'cb33', ''));
  cb34.ItemIndex := arrWeightKey[31].IndexOf(myini.ReadString('position', 'cb34', ''));
  cb35.ItemIndex := arrWeightKey[32].IndexOf(myini.ReadString('position', 'cb35', ''));
  cb36.ItemIndex := arrWeightKey[33].IndexOf(myini.ReadString('position', 'cb36', ''));
  Result := True;
end;

function TWeightSetForm.loadShowName: Boolean;
begin
  //读显示名称
  EdtCar.Text := myini.ReadString('formDesign', 'carCaption', '车  号');
  EdtFaHuo.Text := myini.ReadString('formDesign', 'faHuoCaption', '发货单位');
  EdtShouHuo.Text := myini.ReadString('formDesign', 'shouHuoCaption', '收货单位');
  EdtGoods.Text := myini.ReadString('formDesign', 'goodsCaption', '货  名');
  EdtSpec.Text := myini.ReadString('formDesign', 'specCaption', '规  格');
  EdtGross.Text := myini.ReadString('formDesign', 'grossCaption', '毛  重');
  EdtTare.Text := myini.ReadString('formDesign', 'tareCaption', '皮  重');
  EdtNet.Text := myini.ReadString('formDesign', 'netCaption', '净  重');
  EdtBundle.Text := myini.ReadString('formDesign', 'bundleCaption', '扣  重');
  EdtReal.Text := myini.ReadString('formDesign', 'realCaption', '实  重');
  EdtPrice.Text := myini.ReadString('formDesign', 'priceCaption', '单  价');
  EdtSum.Text := myini.ReadString('formDesign', 'sumCaption', '金  额');
  EdtScale.Text := myini.ReadString('formDesign', 'scaleCaption', '折方系数');
  EdtQuanter.Text := myini.ReadString('formDesign', 'quanterCaption', '方  量');
  EdtCost.Text := myini.ReadString('formDesign', 'costCaption', '过磅费');
  EdtGrossTime.Text := myini.ReadString('formDesign', 'grossTimeCaption', '毛重时间');
  EdtTareTime.Text := myini.ReadString('formDesign', 'tareTimeCaption', '皮重时间');
  EdtMemo.Text := myini.ReadString('formDesign', 'memoCaption', '备  注');
  EdtBackup1.Text := myini.ReadString('formDesign', 'backup1Caption', '备用1');
  EdtBackup2.Text := myini.ReadString('formDesign', 'backup2Caption', '备用2');
  EdtBackup3.Text := myini.ReadString('formDesign', 'backup3Caption', '备用3');
  EdtBackup4.Text := myini.ReadString('formDesign', 'backup4Caption', '备用4');
  EdtBackup5.Text := myini.ReadString('formDesign', 'backup5Caption', '备用5');
  EdtBackup6.Text := myini.ReadString('formDesign', 'backup6Caption', '备用6');
  EdtBackup7.Text := myini.ReadString('formDesign', 'backup7Caption', '备用7');
  EdtBackup8.Text := myini.ReadString('formDesign', 'backup8Caption', '备用8');
  EdtBackup9.Text := myini.ReadString('formDesign', 'backup9Caption', '备用9');
  EdtBackup10.Text := myini.ReadString('formDesign', 'backup10Caption', '备用10');
  EdtBackup11.Text := myini.ReadString('formDesign', 'backup11Caption', '备用11');
  EdtBackup12.Text := myini.ReadString('formDesign', 'backup12Caption', '备用12');
  EdtBackup13.Text := myini.ReadString('formDesign', 'backup13Caption', '备用13');
  EdtBackup14.Text := myini.ReadString('formDesign', 'backup14Caption', '备用14');
  EdtBackup15.Text := myini.ReadString('formDesign', 'backup15Caption', '备用15');
  EdtBackup16.Text := myini.ReadString('formDesign', 'backup16Caption', '备用16');
  EdtBackup17.Text := myini.ReadString('formDesign', 'backup17Caption', '备用17');
  EdtBackup18.Text := myini.ReadString('formDesign', 'backup18Caption', '备用18');
end;

function TWeightSetForm.saveAutoClear: Boolean;
begin
  //自动清空选项
  myini.WriteBool('formDesign', 'clearCar', CBClearCar.Checked);
  myini.WriteBool('formDesign', 'clearFaHuo', CBClearFaHuo.Checked);
  myini.WriteBool('formDesign', 'clearShouHuo', CBClearShouHuo.Checked);
  myini.WriteBool('formDesign', 'clearGoods', CBClearGoods.Checked);
  myini.WriteBool('formDesign', 'clearSpec', CBClearSpec.Checked);
  myini.WriteBool('formDesign', 'clearBundle', CBClearBundle.Checked);
  myini.WriteBool('formDesign', 'clearPrice', CBClearPrice.Checked);
  myini.WriteBool('formDesign', 'clearScale', CBClearScale.Checked);
  myini.WriteBool('formDesign', 'memoRemark', CBClearMemo.Checked);
  myini.WriteBool('formDesign', 'clearBackup1', CBClearBackup1.Checked);
  myini.WriteBool('formDesign', 'clearBackup2', CBClearBackup2.Checked);
  myini.WriteBool('formDesign', 'clearBackup3', CBClearBackup3.Checked);
  myini.WriteBool('formDesign', 'clearBackup4', CBClearBackup4.Checked);
  myini.WriteBool('formDesign', 'clearBackup5', CBClearBackup5.Checked);
  myini.WriteBool('formDesign', 'clearBackup6', CBClearBackup6.Checked);
  myini.WriteBool('formDesign', 'clearBackup7', CBClearBackup7.Checked);
  myini.WriteBool('formDesign', 'clearBackup8', CBClearBackup8.Checked);
  myini.WriteBool('formDesign', 'clearBackup9', CBClearBackup9.Checked);
  myini.WriteBool('formDesign', 'clearBackup10', CBClearBackup10.Checked);
  myini.WriteBool('formDesign', 'clearBackup11', CBClearBackup11.Checked);
  myini.WriteBool('formDesign', 'clearBackup12', CBClearBackup12.Checked);
  myini.WriteBool('formDesign', 'clearBackup13', CBClearBackup13.Checked);
  myini.WriteBool('formDesign', 'clearBackup14', CBClearBackup14.Checked);
  myini.WriteBool('formDesign', 'clearBackup15', CBClearBackup15.Checked);
  myini.WriteBool('formDesign', 'clearBackup16', CBClearBackup16.Checked);
  myini.WriteBool('formDesign', 'clearBackup17', CBClearBackup17.Checked);
  myini.WriteBool('formDesign', 'clearBackup18', CBClearBackup18.Checked);

  //自动清空
  MainForm.weightSetConfig.carClear := CBClearCar.Checked;
  MainForm.weightSetConfig.faHuoClear := CBClearFaHuo.Checked;
  MainForm.weightSetConfig.shouHuoClear := CBClearShouHuo.Checked;
  MainForm.weightSetConfig.goodsClear := CBClearGoods.Checked;
  MainForm.weightSetConfig.specClear := CBClearSpec.Checked;
  MainForm.weightSetConfig.bundleClear := CBClearBundle.Checked;
  MainForm.weightSetConfig.priceClear := CBClearPrice.Checked;
  MainForm.weightSetConfig.scaleClear := CBClearScale.Checked;
  MainForm.weightSetConfig.memoClear := CBClearMemo.Checked;
  MainForm.weightSetConfig.backup1Clear := CBClearBackup1.Checked;
  MainForm.weightSetConfig.backup2Clear := CBClearBackup2.Checked;
  MainForm.weightSetConfig.backup3Clear := CBClearBackup3.Checked;
  MainForm.weightSetConfig.backup4Clear := CBClearBackup4.Checked;
  MainForm.weightSetConfig.backup5Clear := CBClearBackup5.Checked;
  MainForm.weightSetConfig.backup6Clear := CBClearBackup6.Checked;
  MainForm.weightSetConfig.backup7Clear := CBClearBackup7.Checked;
  MainForm.weightSetConfig.backup8Clear := CBClearBackup8.Checked;
  MainForm.weightSetConfig.backup9Clear := CBClearBackup9.Checked;
  MainForm.weightSetConfig.backup10Clear := CBClearBackup10.Checked;
  MainForm.weightSetConfig.backup11Clear := CBClearBackup11.Checked;
  MainForm.weightSetConfig.backup12Clear := CBClearBackup12.Checked;
  MainForm.weightSetConfig.backup13Clear := CBClearBackup13.Checked;
  MainForm.weightSetConfig.backup14Clear := CBClearBackup14.Checked;
  MainForm.weightSetConfig.backup15Clear := CBClearBackup15.Checked;
  MainForm.weightSetConfig.backup16Clear := CBClearBackup16.Checked;
  MainForm.weightSetConfig.backup17Clear := CBClearBackup17.Checked;
  MainForm.weightSetConfig.backup18Clear := CBClearBackup18.Checked;
end;

function TWeightSetForm.saveDefault: Boolean;
begin
  //写默认值
  myini.WriteString('formDesign', 'carDefault', LECarDefault.Text);
  myini.WriteString('formDesign', 'faHuoDefault', LEFaHuoDefault.Text);
  myini.WriteString('formDesign', 'shouHuoDefault', LEShouHuoDefault.Text);
  myini.WriteString('formDesign', 'goodsDefault', LEGoodsDefault.Text);
  myini.WriteString('formDesign', 'specDefault', LESpecDefault.Text);
  myini.WriteString('formDesign', 'bundleDefault', LEBundleDefault.Text);
  myini.WriteString('formDesign', 'priceDefault', LEPriceDefault.Text);
  myini.WriteString('formDesign', 'scaleDefault', LEScaleDefault.Text);
  myini.WriteString('formDesign', 'remarkDefault', LEMemoDefault.Text);
  myini.WriteString('formDesign', 'backup1Default', LEBackup1Default.Text);
  myini.WriteString('formDesign', 'backup2Default', LEBackup2Default.Text);
  myini.WriteString('formDesign', 'backup3Default', LEBackup3Default.Text);
  myini.WriteString('formDesign', 'backup4Default', LEBackup4Default.Text);
  myini.WriteString('formDesign', 'backup5Default', LEBackup5Default.Text);
  myini.WriteString('formDesign', 'backup6Default', LEBackup6Default.Text);
  myini.WriteString('formDesign', 'backup7Default', LEBackup7Default.Text);
  myini.WriteString('formDesign', 'backup8Default', LEBackup8Default.Text);
  myini.WriteString('formDesign', 'backup9Default', LEBackup9Default.Text);
  myini.WriteString('formDesign', 'backup10Default', LEBackup10Default.Text);
  myini.WriteString('formDesign', 'backup11Default', LEBackup11Default.Text);
  myini.WriteString('formDesign', 'backup12Default', LEBackup12Default.Text);
  myini.WriteString('formDesign', 'backup13Default', LEBackup13Default.Text);
  myini.WriteString('formDesign', 'backup14Default', LEBackup14Default.Text);
  myini.WriteString('formDesign', 'backup15Default', LEBackup15Default.Text);
  myini.WriteString('formDesign', 'backup16Default', LEBackup16Default.Text);
  myini.WriteString('formDesign', 'backup17Default', LEBackup17Default.Text);
  myini.WriteString('formDesign', 'backup18Default', LEBackup18Default.Text);

  //写默认值
  MainForm.weightSetConfig.carDefault := LECarDefault.Text;
  MainForm.weightSetConfig.faHuoDefault := LEFaHuoDefault.Text;
  MainForm.weightSetConfig.shouHuoDefault := LEShouHuoDefault.Text;
  MainForm.weightSetConfig.goodsDefault := LEGoodsDefault.Text;
  MainForm.weightSetConfig.specDefault := LESpecDefault.Text;
  MainForm.weightSetConfig.bundleDefault := LEBundleDefault.Text;
  MainForm.weightSetConfig.priceDefault := LEPriceDefault.Text;
  MainForm.weightSetConfig.scaleDefault := LEScaleDefault.Text;
  MainForm.weightSetConfig.memoDefault := LEMemoDefault.Text;
  MainForm.weightSetConfig.backup1Default := LEBackup1Default.Text;
  MainForm.weightSetConfig.backup2Default := LEBackup2Default.Text;
  MainForm.weightSetConfig.backup3Default := LEBackup3Default.Text;
  MainForm.weightSetConfig.backup4Default := LEBackup4Default.Text;
  MainForm.weightSetConfig.backup5Default := LEBackup5Default.Text;
  MainForm.weightSetConfig.backup6Default := LEBackup6Default.Text;
  MainForm.weightSetConfig.backup7Default := LEBackup7Default.Text;
  MainForm.weightSetConfig.backup8Default := LEBackup8Default.Text;
  MainForm.weightSetConfig.backup9Default := LEBackup9Default.Text;
  MainForm.weightSetConfig.backup10Default := LEBackup10Default.Text;
  MainForm.weightSetConfig.backup11Default := LEBackup11Default.Text;
  MainForm.weightSetConfig.backup12Default := LEBackup12Default.Text;
  MainForm.weightSetConfig.backup13Default := LEBackup13Default.Text;
  MainForm.weightSetConfig.backup14Default := LEBackup14Default.Text;
  MainForm.weightSetConfig.backup15Default := LEBackup15Default.Text;
  MainForm.weightSetConfig.backup16Default := LEBackup16Default.Text;
  MainForm.weightSetConfig.backup17Default := LEBackup17Default.Text;
  MainForm.weightSetConfig.backup18Default := LEBackup18Default.Text;
end;

function TWeightSetForm.saveFormule: Boolean;
begin
  //如果有配置公式,输入框就不允许输入
  myini.WriteBool('formDesign', 'useExpression6', CBUseExpression6.Checked);
  myini.WriteBool('formDesign', 'useExpression7', CBUseExpression7.Checked);
  myini.WriteBool('formDesign', 'useExpression8', CBUseExpression8.Checked);
  myini.WriteBool('formDesign', 'useExpression9', CBUseExpression9.Checked);
  myini.WriteBool('formDesign', 'useExpression15', CBUseExpression15.Checked);
  myini.WriteBool('formDesign', 'useExpression16', CBUseExpression16.Checked);
  myini.WriteBool('formDesign', 'useExpression17', CBUseExpression17.Checked);
  myini.WriteBool('formDesign', 'useExpression18', CBUseExpression18.Checked);

  myini.WriteString('formDesign', 'expression6', EdtExpression6.Text);
  myini.WriteString('formDesign', 'expression7', EdtExpression7.Text);
  myini.WriteString('formDesign', 'expression8', EdtExpression8.Text);
  myini.WriteString('formDesign', 'expression9', EdtExpression9.Text);
  myini.WriteString('formDesign', 'expression15', EdtExpression15.Text);
  myini.WriteString('formDesign', 'expression16', EdtExpression16.Text);
  myini.WriteString('formDesign', 'expression17', EdtExpression17.Text);
  myini.WriteString('formDesign', 'expression18', EdtExpression18.Text);

  myini.WriteInteger('formDesign', 'point6', MainForm.weightSetConfig.point6);
  myini.WriteInteger('formDesign', 'point7', MainForm.weightSetConfig.point7);
  myini.WriteInteger('formDesign', 'point8', MainForm.weightSetConfig.point8);
  myini.WriteInteger('formDesign', 'point9', MainForm.weightSetConfig.point9);
  myini.WriteInteger('formDesign', 'point15', MainForm.weightSetConfig.point15);
  myini.WriteInteger('formDesign', 'point16', MainForm.weightSetConfig.point16);
  myini.WriteInteger('formDesign', 'point17', MainForm.weightSetConfig.point17);
  myini.WriteInteger('formDesign', 'point18', MainForm.weightSetConfig.point18);

  myini.WriteInteger('formDesign', 'divide6', MainForm.weightSetConfig.divide6);
  myini.WriteInteger('formDesign', 'divide7', MainForm.weightSetConfig.divide7);
  myini.WriteInteger('formDesign', 'divide8', MainForm.weightSetConfig.divide8);
  myini.WriteInteger('formDesign', 'divide9', MainForm.weightSetConfig.divide9);
  myini.WriteInteger('formDesign', 'divide15', MainForm.weightSetConfig.divide15);
  myini.WriteInteger('formDesign', 'divide16', MainForm.weightSetConfig.divide16);
  myini.WriteInteger('formDesign', 'divide17', MainForm.weightSetConfig.divide17);
  myini.WriteInteger('formDesign', 'divide18', MainForm.weightSetConfig.divide18);

  myini.WriteInteger('formDesign', 'sumType6', MainForm.weightSetConfig.sumType6);
  myini.WriteInteger('formDesign', 'sumType7', MainForm.weightSetConfig.sumType7);
  myini.WriteInteger('formDesign', 'sumType8', MainForm.weightSetConfig.sumType8);
  myini.WriteInteger('formDesign', 'sumType9', MainForm.weightSetConfig.sumType9);
  myini.WriteInteger('formDesign', 'sumType15', MainForm.weightSetConfig.sumType15);
  myini.WriteInteger('formDesign', 'sumType16', MainForm.weightSetConfig.sumType16);
  myini.WriteInteger('formDesign', 'sumType17', MainForm.weightSetConfig.sumType17);
  myini.WriteInteger('formDesign', 'sumType18', MainForm.weightSetConfig.sumType18);

  myini.WriteFloat('formDesign', 'min6', MainForm.weightSetConfig.min6);
  myini.WriteFloat('formDesign', 'min7', MainForm.weightSetConfig.min7);
  myini.WriteFloat('formDesign', 'min8', MainForm.weightSetConfig.min8);
  myini.WriteFloat('formDesign', 'min9', MainForm.weightSetConfig.min9);
  myini.WriteFloat('formDesign', 'min15', MainForm.weightSetConfig.min15);
  myini.WriteFloat('formDesign', 'min16', MainForm.weightSetConfig.min16);
  myini.WriteFloat('formDesign', 'min17', MainForm.weightSetConfig.min17);
  myini.WriteFloat('formDesign', 'min18', MainForm.weightSetConfig.min18);

  myini.WriteInteger('formDesign', 'rule6', CBRule61.ItemIndex);
  myini.WriteInteger('formDesign', 'rule62', CBRule62.ItemIndex);
  myini.WriteInteger('formDesign', 'rule7', CBRule71.ItemIndex);
  myini.WriteInteger('formDesign', 'rule72', CBRule72.ItemIndex);
  myini.WriteInteger('formDesign', 'rule8', CBRule81.ItemIndex);
  myini.WriteInteger('formDesign', 'rule82', CBRule82.ItemIndex);
  myini.WriteInteger('formDesign', 'rule9', CBRule91.ItemIndex);
  myini.WriteInteger('formDesign', 'rule92', CBRule92.ItemIndex);
  myini.WriteInteger('formDesign', 'rule15', CBRule151.ItemIndex);
  myini.WriteInteger('formDesign', 'rule152', CBRule152.ItemIndex);
  myini.WriteInteger('formDesign', 'rule16', CBRule161.ItemIndex);
  myini.WriteInteger('formDesign', 'rule162', CBRule162.ItemIndex);
  myini.WriteInteger('formDesign', 'rule17', CBRule171.ItemIndex);
  myini.WriteInteger('formDesign', 'rule172', CBRule172.ItemIndex);
  myini.WriteInteger('formDesign', 'rule18', CBRule181.ItemIndex);
  myini.WriteInteger('formDesign', 'rule182', CBRule182.ItemIndex);

  myini.WriteInteger('formDesign', 'group6', CBGroup6.ItemIndex);
  myini.WriteInteger('formDesign', 'group7', CBGroup7.ItemIndex);
  myini.WriteInteger('formDesign', 'group8', CBGroup8.ItemIndex);
  myini.WriteInteger('formDesign', 'group9', CBGroup9.ItemIndex);
  myini.WriteInteger('formDesign', 'group15', CBGroup15.ItemIndex);
  myini.WriteInteger('formDesign', 'group16', CBGroup16.ItemIndex);
  myini.WriteInteger('formDesign', 'group17', CBGroup17.ItemIndex);
  myini.WriteInteger('formDesign', 'group18', CBGroup18.ItemIndex);

  MainForm.weightSetConfig.useExpression6 := CBUseExpression6.Checked;
  MainForm.weightSetConfig.useExpression7 := CBUseExpression7.Checked;
  MainForm.weightSetConfig.useExpression8 := CBUseExpression8.Checked;
  MainForm.weightSetConfig.useExpression9 := CBUseExpression9.Checked;
  MainForm.weightSetConfig.useExpression15 := CBUseExpression15.Checked;
  MainForm.weightSetConfig.useExpression16 := CBUseExpression16.Checked;
  MainForm.weightSetConfig.useExpression17 := CBUseExpression17.Checked;
  MainForm.weightSetConfig.useExpression18 := CBUseExpression18.Checked;

  MainForm.weightSetConfig.expression6 := EdtExpression6.Text;
  MainForm.weightSetConfig.expression7 := EdtExpression7.Text;
  MainForm.weightSetConfig.expression8 := EdtExpression8.Text;
  MainForm.weightSetConfig.expression9 := EdtExpression9.Text;
  MainForm.weightSetConfig.expression15 := EdtExpression15.Text;
  MainForm.weightSetConfig.expression16 := EdtExpression16.Text;
  MainForm.weightSetConfig.expression17 := EdtExpression17.Text;
  MainForm.weightSetConfig.expression18 := EdtExpression18.Text;

  MainForm.weightSetConfig.rule61 := CBRule61.ItemIndex;
  MainForm.weightSetConfig.rule62 := CBRule62.ItemIndex;
  MainForm.weightSetConfig.rule71 := CBRule71.ItemIndex;
  MainForm.weightSetConfig.rule72 := CBRule72.ItemIndex;
  MainForm.weightSetConfig.rule81 := CBRule81.ItemIndex;
  MainForm.weightSetConfig.rule82 := CBRule82.ItemIndex;
  MainForm.weightSetConfig.rule91 := CBRule91.ItemIndex;
  MainForm.weightSetConfig.rule92 := CBRule92.ItemIndex;
  MainForm.weightSetConfig.rule151 := CBRule151.ItemIndex;
  MainForm.weightSetConfig.rule152 := CBRule152.ItemIndex;
  MainForm.weightSetConfig.rule161 := CBRule161.ItemIndex;
  MainForm.weightSetConfig.rule162 := CBRule162.ItemIndex;
  MainForm.weightSetConfig.rule171 := CBRule171.ItemIndex;
  MainForm.weightSetConfig.rule172 := CBRule172.ItemIndex;
  MainForm.weightSetConfig.rule181 := CBRule181.ItemIndex;
  MainForm.weightSetConfig.rule182 := CBRule182.ItemIndex;

  MainForm.weightSetConfig.group6 := CBGroup6.ItemIndex;
  MainForm.weightSetConfig.group7 := CBGroup7.ItemIndex;
  MainForm.weightSetConfig.group8 := CBGroup8.ItemIndex;
  MainForm.weightSetConfig.group9 := CBGroup9.ItemIndex;
  MainForm.weightSetConfig.group15 := CBGroup15.ItemIndex;
  MainForm.weightSetConfig.group16 := CBGroup16.ItemIndex;
  MainForm.weightSetConfig.group17 := CBGroup17.ItemIndex;
  MainForm.weightSetConfig.group18 := CBGroup18.ItemIndex;
end;

function TWeightSetForm.savePosition: Boolean;
begin
  myini.WriteString('position', 'cb00', cb00.Value);
  myini.WriteString('position', 'cb01', cb01.Value);
  myini.WriteString('position', 'cb02', cb02.Value);
  myini.WriteString('position', 'cb03', cb03.Value);
  myini.WriteString('position', 'cb04', cb04.Value);
  myini.WriteString('position', 'cb05', cb05.Value);
  myini.WriteString('position', 'cb06', cb06.Value);
  myini.WriteString('position', 'cb07', cb07.Value);
  myini.WriteString('position', 'cb08', cb08.Value);

  myini.WriteString('position', 'cb10', cb10.Value);
  myini.WriteString('position', 'cb11', cb11.Value);
  myini.WriteString('position', 'cb12', cb12.Value);
  myini.WriteString('position', 'cb13', cb13.Value);
  myini.WriteString('position', 'cb14', cb14.Value);
  myini.WriteString('position', 'cb15', cb15.Value);
  myini.WriteString('position', 'cb16', cb16.Value);
  myini.WriteString('position', 'cb17', cb17.Value);
  myini.WriteString('position', 'cb18', cb18.Value);

  myini.WriteString('position', 'cb20', cb20.Value);
  myini.WriteString('position', 'cb21', cb21.Value);
  myini.WriteString('position', 'cb22', cb22.Value);
  myini.WriteString('position', 'cb23', cb23.Value);
  myini.WriteString('position', 'cb24', cb24.Value);
  myini.WriteString('position', 'cb25', cb25.Value);
  myini.WriteString('position', 'cb26', cb26.Value);
  myini.WriteString('position', 'cb27', cb27.Value);
  myini.WriteString('position', 'cb28', cb28.Value);

  myini.WriteString('position', 'cb30', cb30.Value);
  myini.WriteString('position', 'cb31', cb31.Value);
  myini.WriteString('position', 'cb32', cb32.Value);
  myini.WriteString('position', 'cb33', cb33.Value);
  myini.WriteString('position', 'cb34', cb34.Value);
  myini.WriteString('position', 'cb35', cb35.Value);
  myini.WriteString('position', 'cb36', cb36.Value);

  MainForm.weightSetConfig.pv00 := cb00.Value;
  MainForm.weightSetConfig.pv01 := cb01.Value;
  MainForm.weightSetConfig.pv02 := cb02.Value;
  MainForm.weightSetConfig.pv03 := cb03.Value;
  MainForm.weightSetConfig.pv04 := cb04.Value;
  MainForm.weightSetConfig.pv05 := cb05.Value;
  MainForm.weightSetConfig.pv06 := cb06.Value;
  MainForm.weightSetConfig.pv07 := cb07.Value;
  MainForm.weightSetConfig.pv08 := cb08.Value;

  MainForm.weightSetConfig.pv10 := cb10.Value;
  MainForm.weightSetConfig.pv11 := cb11.Value;
  MainForm.weightSetConfig.pv12 := cb12.Value;
  MainForm.weightSetConfig.pv13 := cb13.Value;
  MainForm.weightSetConfig.pv14 := cb14.Value;
  MainForm.weightSetConfig.pv15 := cb15.Value;
  MainForm.weightSetConfig.pv16 := cb16.Value;
  MainForm.weightSetConfig.pv17 := cb17.Value;
  MainForm.weightSetConfig.pv18 := cb18.Value;

  MainForm.weightSetConfig.pv20 := cb20.Value;
  MainForm.weightSetConfig.pv21 := cb21.Value;
  MainForm.weightSetConfig.pv22 := cb22.Value;
  MainForm.weightSetConfig.pv23 := cb23.Value;
  MainForm.weightSetConfig.pv24 := cb24.Value;
  MainForm.weightSetConfig.pv25 := cb25.Value;
  MainForm.weightSetConfig.pv26 := cb26.Value;
  MainForm.weightSetConfig.pv27 := cb27.Value;
  MainForm.weightSetConfig.pv28 := cb28.Value;

  MainForm.weightSetConfig.pv30 := cb30.Value;
  MainForm.weightSetConfig.pv31 := cb31.Value;
  MainForm.weightSetConfig.pv32 := cb32.Value;
  MainForm.weightSetConfig.pv33 := cb33.Value;
  MainForm.weightSetConfig.pv34 := cb34.Value;
  MainForm.weightSetConfig.pv35 := cb35.Value;
  MainForm.weightSetConfig.pv36 := cb36.Value;
end;

function TWeightSetForm.saveShowName: Boolean;
begin
  //写显示名称
  myini.WriteString('formDesign', 'carCaption', EdtCar.Text);
  myini.WriteString('formDesign', 'faHuoCaption', EdtFaHuo.Text);
  myini.WriteString('formDesign', 'shouHuoCaption', EdtShouHuo.Text);
  myini.WriteString('formDesign', 'goodsCaption', EdtGoods.Text);
  myini.WriteString('formDesign', 'specCaption', EdtSpec.Text);
  myini.WriteString('formDesign', 'grossCaption', EdtGross.Text);
  myini.WriteString('formDesign', 'tareCaption', EdtTare.Text);
  myini.WriteString('formDesign', 'netCaption', EdtNet.Text);
  myini.WriteString('formDesign', 'bundleCaption', EdtBundle.Text);
  myini.WriteString('formDesign', 'realCaption', EdtReal.Text);
  myini.WriteString('formDesign', 'priceCaption', EdtPrice.Text);
  myini.WriteString('formDesign', 'sumCaption', EdtSum.Text);
  myini.WriteString('formDesign', 'scaleCaption', EdtScale.Text);
  myini.WriteString('formDesign', 'quanterCaption', EdtQuanter.Text);
  myini.WriteString('formDesign', 'costCaption', EdtCost.Text);
  myini.WriteString('formDesign', 'grossTimeCaption', EdtGrossTime.Text);
  myini.WriteString('formDesign', 'tareTimeCaption', EdtTareTime.Text);
  myini.WriteString('formDesign', 'remarkCaption', EdtMemo.Text);
  myini.WriteString('formDesign', 'backup1Caption', EdtBackup1.Text);
  myini.WriteString('formDesign', 'backup2Caption', EdtBackup2.Text);
  myini.WriteString('formDesign', 'backup3Caption', EdtBackup3.Text);
  myini.WriteString('formDesign', 'backup4Caption', EdtBackup4.Text);
  myini.WriteString('formDesign', 'backup5Caption', EdtBackup5.Text);
  myini.WriteString('formDesign', 'backup6Caption', EdtBackup6.Text);
  myini.WriteString('formDesign', 'backup7Caption', EdtBackup7.Text);
  myini.WriteString('formDesign', 'backup8Caption', EdtBackup8.Text);
  myini.WriteString('formDesign', 'backup9Caption', EdtBackup9.Text);
  myini.WriteString('formDesign', 'backup10Caption', EdtBackup10.Text);
  myini.WriteString('formDesign', 'backup11Caption', EdtBackup11.Text);
  myini.WriteString('formDesign', 'backup12Caption', EdtBackup12.Text);
  myini.WriteString('formDesign', 'backup13Caption', EdtBackup13.Text);
  myini.WriteString('formDesign', 'backup14Caption', EdtBackup14.Text);
  myini.WriteString('formDesign', 'backup15Caption', EdtBackup15.Text);
  myini.WriteString('formDesign', 'backup16Caption', EdtBackup16.Text);
  myini.WriteString('formDesign', 'backup17Caption', EdtBackup17.Text);
  myini.WriteString('formDesign', 'backup18Caption', EdtBackup18.Text);

  //写显示名称
  MainForm.weightSetConfig.carCaption := EdtCar.Text;
  MainForm.weightSetConfig.faHuoCaption := EdtFaHuo.Text;
  MainForm.weightSetConfig.shouHuoCaption := EdtShouHuo.Text;
  MainForm.weightSetConfig.goodsCaption := EdtGoods.Text;
  MainForm.weightSetConfig.specCaption := EdtSpec.Text;
  MainForm.weightSetConfig.grossCaption := EdtGross.Text;
  MainForm.weightSetConfig.tareCaption := EdtTare.Text;
  MainForm.weightSetConfig.netCaption := EdtNet.Text;
  MainForm.weightSetConfig.bundleCaption := EdtBundle.Text;
  MainForm.weightSetConfig.realCaption := EdtReal.Text;
  MainForm.weightSetConfig.priceCaption := EdtPrice.Text;
  MainForm.weightSetConfig.sumCaption := EdtSum.Text;
  MainForm.weightSetConfig.scaleCaption := EdtScale.Text;
  MainForm.weightSetConfig.quanterCaption := EdtQuanter.Text;
  MainForm.weightSetConfig.costCaption := EdtCost.Text;
  MainForm.weightSetConfig.grossTimeCaption := EdtGrossTime.Text;
  MainForm.weightSetConfig.tareTimeCaption := EdtTareTime.Text;
  MainForm.weightSetConfig.memoCaption := EdtMemo.Text;
  MainForm.weightSetConfig.backup1Caption := EdtBackup1.Text;
  MainForm.weightSetConfig.backup2Caption := EdtBackup2.Text;
  MainForm.weightSetConfig.backup3Caption := EdtBackup3.Text;
  MainForm.weightSetConfig.backup4Caption := EdtBackup4.Text;
  MainForm.weightSetConfig.backup5Caption := EdtBackup5.Text;
  MainForm.weightSetConfig.backup6Caption := EdtBackup6.Text;
  MainForm.weightSetConfig.backup7Caption := EdtBackup7.Text;
  MainForm.weightSetConfig.backup8Caption := EdtBackup8.Text;
  MainForm.weightSetConfig.backup9Caption := EdtBackup9.Text;
  MainForm.weightSetConfig.backup10Caption := EdtBackup10.Text;
  MainForm.weightSetConfig.backup11Caption := EdtBackup11.Text;
  MainForm.weightSetConfig.backup12Caption := EdtBackup12.Text;
  MainForm.weightSetConfig.backup13Caption := EdtBackup13.Text;
  MainForm.weightSetConfig.backup14Caption := EdtBackup14.Text;
  MainForm.weightSetConfig.backup15Caption := EdtBackup15.Text;
  MainForm.weightSetConfig.backup16Caption := EdtBackup16.Text;
  MainForm.weightSetConfig.backup17Caption := EdtBackup17.Text;
  MainForm.weightSetConfig.backup18Caption := EdtBackup18.Text;
end;

function TWeightSetForm.loadField: Boolean;
begin
  cb00.Items := arrWeightItem[0]; cb00.Values := arrWeightKey[0];
  cb01.Items := arrWeightItem[1]; cb01.Values := arrWeightKey[1];
  cb02.Items := arrWeightItem[2]; cb02.Values := arrWeightKey[2];
  cb03.Items := arrWeightItem[3]; cb03.Values := arrWeightKey[3];
  cb04.Items := arrWeightItem[4]; cb04.Values := arrWeightKey[4];
  cb05.Items := arrWeightItem[5]; cb05.Values := arrWeightKey[5];
  cb06.Items := arrWeightItem[6]; cb06.Values := arrWeightKey[6];
  cb07.Items := arrWeightItem[7]; cb07.Values := arrWeightKey[7];
  cb08.Items := arrWeightItem[8]; cb08.Values := arrWeightKey[8];

  cb10.Items := arrWeightItem[9]; cb10.Values := arrWeightKey[9];
  cb11.Items := arrWeightItem[10]; cb11.Values := arrWeightKey[10];
  cb12.Items := arrWeightItem[11]; cb12.Values := arrWeightKey[11];
  cb13.Items := arrWeightItem[12]; cb13.Values := arrWeightKey[12];
  cb14.Items := arrWeightItem[13]; cb14.Values := arrWeightKey[13];
  cb15.Items := arrWeightItem[14]; cb15.Values := arrWeightKey[14];
  cb16.Items := arrWeightItem[15]; cb16.Values := arrWeightKey[15];
  cb17.Items := arrWeightItem[16]; cb17.Values := arrWeightKey[16];
  cb18.Items := arrWeightItem[17]; cb18.Values := arrWeightKey[17];

  cb20.Items := arrWeightItem[18]; cb20.Values := arrWeightKey[18];
  cb21.Items := arrWeightItem[19]; cb21.Values := arrWeightKey[19];
  cb22.Items := arrWeightItem[20]; cb22.Values := arrWeightKey[20];
  cb23.Items := arrWeightItem[21]; cb23.Values := arrWeightKey[21];
  cb24.Items := arrWeightItem[22]; cb24.Values := arrWeightKey[22];
  cb25.Items := arrWeightItem[23]; cb25.Values := arrWeightKey[23];
  cb26.Items := arrWeightItem[24]; cb26.Values := arrWeightKey[24];
  cb27.Items := arrWeightItem[25]; cb27.Values := arrWeightKey[25];
  cb28.Items := arrWeightItem[26]; cb28.Values := arrWeightKey[26];

  cb30.Items := arrWeightItem[27]; cb30.Values := arrWeightKey[27];
  cb31.Items := arrWeightItem[28]; cb31.Values := arrWeightKey[28];
  cb32.Items := arrWeightItem[29]; cb32.Values := arrWeightKey[29];
  cb33.Items := arrWeightItem[30]; cb33.Values := arrWeightKey[30];
  cb34.Items := arrWeightItem[31]; cb34.Values := arrWeightKey[31];
  cb35.Items := arrWeightItem[32]; cb35.Values := arrWeightKey[32];
  cb36.Items := arrWeightItem[33]; cb36.Values := arrWeightKey[33];
end;

procedure TWeightSetForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  myini := TiniFile.Create(ExtractFilePath(ParamStr(0)) + 'design.ini');
  for i := 0 to Length(arrWeightItem) - 1 do
  begin
    arrWeightKey[i] := TStringList.Create;
    arrWeightItem[i] := TStringList.Create;
  end;
  PCWeightSet.ActivePageIndex := 0;
end;

procedure TWeightSetForm.FormDestroy(Sender: TObject);
var i: Integer;
begin
  myini.Free;
  for i := 0 to Length(arrWeightItem) - 1 do
  begin
    arrWeightItem[i].Free;
  end;
end;

function TWeightSetForm.loadMust: Boolean;
begin
  //必填选项
  CBMustCar.Caption := MainForm.weightSetConfig.carCaption;
  CBMustFaHuo.Caption := MainForm.weightSetConfig.faHuoCaption;
  CBMustShouHuo.Caption := MainForm.weightSetConfig.shouHuoCaption;
  CBMustGoods.Caption := MainForm.weightSetConfig.goodsCaption;
  CBMustSpec.Caption := MainForm.weightSetConfig.specCaption;
  CBMustBundle.Caption := MainForm.weightSetConfig.bundleCaption;
  CBMustPrice.Caption := MainForm.weightSetConfig.priceCaption;
  CBMustScale.Caption := MainForm.weightSetConfig.scaleCaption;
  CBMustMemo.Caption := MainForm.weightSetConfig.memoCaption;
  CBMustBackup1.Caption := MainForm.weightSetConfig.backup1Caption;
  CBMustBackup2.Caption := MainForm.weightSetConfig.backup2Caption;
  CBMustBackup3.Caption := MainForm.weightSetConfig.backup3Caption;
  CBMustBackup4.Caption := MainForm.weightSetConfig.backup4Caption;
  CBMustBackup5.Caption := MainForm.weightSetConfig.backup5Caption;
  CBMustBackup6.Caption := MainForm.weightSetConfig.backup6Caption;
  CBMustBackup7.Caption := MainForm.weightSetConfig.backup7Caption;
  CBMustBackup8.Caption := MainForm.weightSetConfig.backup8Caption;
  CBMustBackup9.Caption := MainForm.weightSetConfig.backup9Caption;
  CBMustBackup10.Caption := MainForm.weightSetConfig.backup10Caption;
  CBMustBackup11.Caption := MainForm.weightSetConfig.backup11Caption;
  CBMustBackup12.Caption := MainForm.weightSetConfig.backup12Caption;
  CBMustBackup13.Caption := MainForm.weightSetConfig.backup13Caption;
  CBMustBackup14.Caption := MainForm.weightSetConfig.backup14Caption;
  CBMustBackup15.Caption := MainForm.weightSetConfig.backup15Caption;
  CBMustBackup16.Caption := MainForm.weightSetConfig.backup16Caption;
  CBMustBackup17.Caption := MainForm.weightSetConfig.backup17Caption;
  CBMustBackup18.Caption := MainForm.weightSetConfig.backup18Caption;

  CBMustCar.Checked := myini.ReadBool('formDesign', 'mustCar', True);
  CBMustFaHuo.Checked := myini.ReadBool('formDesign', 'mustFaHuo', False);
  CBMustShouHuo.Checked := myini.ReadBool('formDesign', 'mustShouHuo', False);
  CBMustGoods.Checked := myini.ReadBool('formDesign', 'mustGoods', False);
  CBMustSpec.Checked := myini.ReadBool('formDesign', 'mustSpec', False);
  CBMustBundle.Checked := myini.ReadBool('formDesign', 'mustBundle', False);
  CBMustPrice.Checked := myini.ReadBool('formDesign', 'mustPrice', False);
  CBMustScale.Checked := myini.ReadBool('formDesign', 'mustScale', False);
  CBMustMemo.Checked := myini.ReadBool('formDesign', 'mustMemo', False);
  CBMustBackup1.Checked := myini.ReadBool('formDesign', 'mustBackup1', False);
  CBMustBackup2.Checked := myini.ReadBool('formDesign', 'mustBackup2', False);
  CBMustBackup3.Checked := myini.ReadBool('formDesign', 'mustBackup3', False);
  CBMustBackup4.Checked := myini.ReadBool('formDesign', 'mustBackup4', False);
  CBMustBackup5.Checked := myini.ReadBool('formDesign', 'mustBackup5', False);
  CBMustBackup6.Checked := myini.ReadBool('formDesign', 'mustBackup6', False);
  CBMustBackup7.Checked := myini.ReadBool('formDesign', 'mustBackup7', False);
  CBMustBackup8.Checked := myini.ReadBool('formDesign', 'mustBackup8', False);
  CBMustBackup9.Checked := myini.ReadBool('formDesign', 'mustBackup9', False);
  CBMustBackup10.Checked := myini.ReadBool('formDesign', 'mustBackup10', False);
  CBMustBackup11.Checked := myini.ReadBool('formDesign', 'mustBackup11', False);
  CBMustBackup12.Checked := myini.ReadBool('formDesign', 'mustBackup12', False);
  CBMustBackup13.Checked := myini.ReadBool('formDesign', 'mustBackup13', False);
  CBMustBackup14.Checked := myini.ReadBool('formDesign', 'mustBackup14', False);
  CBMustBackup15.Checked := myini.ReadBool('formDesign', 'mustBackup15', False);
  CBMustBackup16.Checked := myini.ReadBool('formDesign', 'mustBackup16', False);
  CBMustBackup17.Checked := myini.ReadBool('formDesign', 'mustBackup17', False);
  CBMustBackup18.Checked := myini.ReadBool('formDesign', 'mustBackup18', False);
  CBMustGross.Checked := myini.ReadBool('formDesign', 'mustGross', False);
  CBMustTare.Checked := myini.ReadBool('formDesign', 'mustTare', False);
  CBMustNet.Checked := myini.ReadBool('formDesign', 'mustNet', False);
  CBMustReal.Checked := myini.ReadBool('formDesign', 'mustReal', False);
  CBMustSum.Checked := myini.ReadBool('formDesign', 'mustSum', False);
  CBMustCost.Checked := myini.ReadBool('formDesign', 'mustCost', False);
  CBMustQuanter.Checked := myini.ReadBool('formDesign', 'mustQuanter', False);
  Result := True;
end;

function TWeightSetForm.saveMust: Boolean;
begin
  //必填选项
  myini.WriteBool('formDesign', 'mustCar', CBMustCar.Checked);
  myini.WriteBool('formDesign', 'mustFaHuo', CBMustFaHuo.Checked);
  myini.WriteBool('formDesign', 'mustShouHuo', CBMustShouHuo.Checked);
  myini.WriteBool('formDesign', 'mustGoods', CBMustGoods.Checked);
  myini.WriteBool('formDesign', 'mustSpec', CBMustSpec.Checked);
  myini.WriteBool('formDesign', 'mustBundle', CBMustBundle.Checked);
  myini.WriteBool('formDesign', 'mustPrice', CBMustPrice.Checked);
  myini.WriteBool('formDesign', 'mustScale', CBMustScale.Checked);
  myini.WriteBool('formDesign', 'mustMemo', CBMustMemo.Checked);
  myini.WriteBool('formDesign', 'mustBackup1', CBMustBackup1.Checked);
  myini.WriteBool('formDesign', 'mustBackup2', CBMustBackup2.Checked);
  myini.WriteBool('formDesign', 'mustBackup3', CBMustBackup3.Checked);
  myini.WriteBool('formDesign', 'mustBackup4', CBMustBackup4.Checked);
  myini.WriteBool('formDesign', 'mustBackup5', CBMustBackup5.Checked);
  myini.WriteBool('formDesign', 'mustBackup6', CBMustBackup6.Checked);
  myini.WriteBool('formDesign', 'mustBackup7', CBMustBackup7.Checked);
  myini.WriteBool('formDesign', 'mustBackup8', CBMustBackup8.Checked);
  myini.WriteBool('formDesign', 'mustBackup9', CBMustBackup9.Checked);
  myini.WriteBool('formDesign', 'mustBackup10', CBMustBackup10.Checked);
  myini.WriteBool('formDesign', 'mustBackup11', CBMustBackup11.Checked);
  myini.WriteBool('formDesign', 'mustBackup12', CBMustBackup12.Checked);
  myini.WriteBool('formDesign', 'mustBackup13', CBMustBackup13.Checked);
  myini.WriteBool('formDesign', 'mustBackup14', CBMustBackup14.Checked);
  myini.WriteBool('formDesign', 'mustBackup15', CBMustBackup15.Checked);
  myini.WriteBool('formDesign', 'mustBackup16', CBMustBackup16.Checked);
  myini.WriteBool('formDesign', 'mustBackup17', CBMustBackup17.Checked);
  myini.WriteBool('formDesign', 'mustBackup18', CBMustBackup18.Checked);
  myini.WriteBool('formDesign', 'mustGross', CBMustGross.Checked);
  myini.WriteBool('formDesign', 'mustTare', CBMustTare.Checked);
  myini.WriteBool('formDesign', 'mustNet', CBMustNet.Checked);
  myini.WriteBool('formDesign', 'mustReal', CBMustReal.Checked);
  myini.WriteBool('formDesign', 'mustSum', CBMustSum.Checked);
  myini.WriteBool('formDesign', 'mustCost', CBMustCost.Checked);
  myini.WriteBool('formDesign', 'mustQuanter', CBMustQuanter.Checked);

  //自动清空
  MainForm.weightSetConfig.carMust := CBMustCar.Checked;
  MainForm.weightSetConfig.faHuoMust := CBMustFaHuo.Checked;
  MainForm.weightSetConfig.shouHuoMust := CBMustShouHuo.Checked;
  MainForm.weightSetConfig.goodsMust := CBMustGoods.Checked;
  MainForm.weightSetConfig.specMust := CBMustSpec.Checked;
  MainForm.weightSetConfig.bundleMust := CBMustBundle.Checked;
  MainForm.weightSetConfig.priceMust := CBMustPrice.Checked;
  MainForm.weightSetConfig.scaleMust := CBMustScale.Checked;
  MainForm.weightSetConfig.memoMust := CBMustMemo.Checked;
  MainForm.weightSetConfig.backup1Must := CBMustBackup1.Checked;
  MainForm.weightSetConfig.backup2Must := CBMustBackup2.Checked;
  MainForm.weightSetConfig.backup3Must := CBMustBackup3.Checked;
  MainForm.weightSetConfig.backup4Must := CBMustBackup4.Checked;
  MainForm.weightSetConfig.backup5Must := CBMustBackup5.Checked;
  MainForm.weightSetConfig.backup6Must := CBMustBackup6.Checked;
  MainForm.weightSetConfig.backup7Must := CBMustBackup7.Checked;
  MainForm.weightSetConfig.backup8Must := CBMustBackup8.Checked;
  MainForm.weightSetConfig.backup9Must := CBMustBackup9.Checked;
  MainForm.weightSetConfig.backup10Must := CBMustBackup10.Checked;
  MainForm.weightSetConfig.backup11Must := CBMustBackup11.Checked;
  MainForm.weightSetConfig.backup12Must := CBMustBackup12.Checked;
  MainForm.weightSetConfig.backup13Must := CBMustBackup13.Checked;
  MainForm.weightSetConfig.backup14Must := CBMustBackup14.Checked;
  MainForm.weightSetConfig.backup15Must := CBMustBackup15.Checked;
  MainForm.weightSetConfig.backup16Must := CBMustBackup16.Checked;
  MainForm.weightSetConfig.backup17Must := CBMustBackup17.Checked;
  MainForm.weightSetConfig.backup18Must := CBMustBackup18.Checked;
  MainForm.weightSetConfig.grossMust := CBMustGross.Checked;
  MainForm.weightSetConfig.tareMust := CBMustTare.Checked;
  MainForm.weightSetConfig.netMust := CBMustNet.Checked;
  MainForm.weightSetConfig.realMust := CBMustReal.Checked;
  MainForm.weightSetConfig.sumMust := CBMustSum.Checked;
  MainForm.weightSetConfig.costMust := CBMustCost.Checked;
  MainForm.weightSetConfig.quanterMust := CBMustQuanter.Checked;

end;

procedure TWeightSetForm.cb00Change(Sender: TObject);
begin
  reloadComboBox;
end;

procedure TWeightSetForm.changeComboBox(str: array of string);
var i, j, idx: Integer;
begin
  for i := 0 to Length(arrWeightItem) - 1 do
  begin
    for j := 0 to Length(str) - 1 do
    begin
      if (i <> j) and (str[j] <> '') then
      begin
        idx := arrWeightKey[i].IndexOf(str[j]);
        if idx <> -1 then
        begin
          arrWeightKey[i].Delete(idx);
          arrWeightItem[i].Delete(idx);
        end;
      end;
    end;
  end;

  cb00.Items := arrWeightItem[0]; cb00.Values := arrWeightKey[0];
  cb01.Items := arrWeightItem[1]; cb01.Values := arrWeightKey[1];
  cb02.Items := arrWeightItem[2]; cb02.Values := arrWeightKey[2];
  cb03.Items := arrWeightItem[3]; cb03.Values := arrWeightKey[3];
  cb04.Items := arrWeightItem[4]; cb04.Values := arrWeightKey[4];
  cb05.Items := arrWeightItem[5]; cb05.Values := arrWeightKey[5];
  cb06.Items := arrWeightItem[6]; cb06.Values := arrWeightKey[6];
  cb07.Items := arrWeightItem[7]; cb07.Values := arrWeightKey[7];
  cb08.Items := arrWeightItem[8]; cb08.Values := arrWeightKey[8];

  cb10.Items := arrWeightItem[9]; cb10.Values := arrWeightKey[9];
  cb11.Items := arrWeightItem[10]; cb11.Values := arrWeightKey[10];
  cb12.Items := arrWeightItem[11]; cb12.Values := arrWeightKey[11];
  cb13.Items := arrWeightItem[12]; cb13.Values := arrWeightKey[12];
  cb14.Items := arrWeightItem[13]; cb14.Values := arrWeightKey[13];
  cb15.Items := arrWeightItem[14]; cb15.Values := arrWeightKey[14];
  cb16.Items := arrWeightItem[15]; cb16.Values := arrWeightKey[15];
  cb17.Items := arrWeightItem[16]; cb17.Values := arrWeightKey[16];
  cb18.Items := arrWeightItem[17]; cb18.Values := arrWeightKey[17];

  cb20.Items := arrWeightItem[18]; cb20.Values := arrWeightKey[18];
  cb21.Items := arrWeightItem[19]; cb21.Values := arrWeightKey[19];
  cb22.Items := arrWeightItem[20]; cb22.Values := arrWeightKey[20];
  cb23.Items := arrWeightItem[21]; cb23.Values := arrWeightKey[21];
  cb24.Items := arrWeightItem[22]; cb24.Values := arrWeightKey[22];
  cb25.Items := arrWeightItem[23]; cb25.Values := arrWeightKey[23];
  cb26.Items := arrWeightItem[24]; cb26.Values := arrWeightKey[24];
  cb27.Items := arrWeightItem[25]; cb27.Values := arrWeightKey[25];
  cb28.Items := arrWeightItem[26]; cb28.Values := arrWeightKey[26];

  cb30.Items := arrWeightItem[27]; cb30.Values := arrWeightKey[27];
  cb31.Items := arrWeightItem[28]; cb31.Values := arrWeightKey[28];
  cb32.Items := arrWeightItem[29]; cb32.Values := arrWeightKey[29];
  cb33.Items := arrWeightItem[30]; cb33.Values := arrWeightKey[30];
  cb34.Items := arrWeightItem[31]; cb34.Values := arrWeightKey[31];
  cb35.Items := arrWeightItem[32]; cb35.Values := arrWeightKey[32];
  cb36.Items := arrWeightItem[33]; cb36.Values := arrWeightKey[33];

  cb00.ItemIndex := arrWeightKey[0].IndexOf(str[0]);
  cb01.ItemIndex := arrWeightKey[1].IndexOf(str[1]);
  cb02.ItemIndex := arrWeightKey[2].IndexOf(str[2]);
  cb03.ItemIndex := arrWeightKey[3].IndexOf(str[3]);
  cb04.ItemIndex := arrWeightKey[4].IndexOf(str[4]);
  cb05.ItemIndex := arrWeightKey[5].IndexOf(str[5]);
  cb06.ItemIndex := arrWeightKey[6].IndexOf(str[6]);
  cb07.ItemIndex := arrWeightKey[7].IndexOf(str[7]);
  cb08.ItemIndex := arrWeightKey[8].IndexOf(str[8]);

  cb10.ItemIndex := arrWeightKey[9].IndexOf(str[9]);
  cb11.ItemIndex := arrWeightKey[10].IndexOf(str[10]);
  cb12.ItemIndex := arrWeightKey[11].IndexOf(str[11]);
  cb13.ItemIndex := arrWeightKey[12].IndexOf(str[12]);
  cb14.ItemIndex := arrWeightKey[13].IndexOf(str[13]);
  cb15.ItemIndex := arrWeightKey[14].IndexOf(str[14]);
  cb16.ItemIndex := arrWeightKey[15].IndexOf(str[15]);
  cb17.ItemIndex := arrWeightKey[16].IndexOf(str[16]);
  cb18.ItemIndex := arrWeightKey[17].IndexOf(str[17]);

  cb20.ItemIndex := arrWeightKey[18].IndexOf(str[18]);
  cb21.ItemIndex := arrWeightKey[19].IndexOf(str[19]);
  cb22.ItemIndex := arrWeightKey[20].IndexOf(str[20]);
  cb23.ItemIndex := arrWeightKey[21].IndexOf(str[21]);
  cb24.ItemIndex := arrWeightKey[22].IndexOf(str[22]);
  cb25.ItemIndex := arrWeightKey[23].IndexOf(str[23]);
  cb26.ItemIndex := arrWeightKey[24].IndexOf(str[24]);
  cb27.ItemIndex := arrWeightKey[25].IndexOf(str[25]);
  cb28.ItemIndex := arrWeightKey[26].IndexOf(str[26]);

  cb30.ItemIndex := arrWeightKey[27].IndexOf(str[27]);
  cb31.ItemIndex := arrWeightKey[28].IndexOf(str[28]);
  cb32.ItemIndex := arrWeightKey[29].IndexOf(str[29]);
  cb33.ItemIndex := arrWeightKey[30].IndexOf(str[30]);
  cb34.ItemIndex := arrWeightKey[31].IndexOf(str[31]);
  cb35.ItemIndex := arrWeightKey[32].IndexOf(str[32]);
  cb36.ItemIndex := arrWeightKey[33].IndexOf(str[33]);
end;

procedure TWeightSetForm.reloadComboBox;
begin
  initWeightArr;
  changeComboBox([cb00.Value, cb01.Value, cb02.Value, cb03.Value, cb04.Value,
    cb05.Value, cb06.Value, cb07.Value, cb08.Value,
      cb10.Value, cb11.Value, cb12.Value, cb13.Value, cb14.Value,
      cb15.Value, cb16.Value, cb17.Value, cb18.Value,
      cb20.Value, cb21.Value, cb22.Value, cb23.Value, cb24.Value,
      cb25.Value, cb26.Value, cb27.Value, cb28.Value,
      cb30.Value, cb31.Value, cb32.Value, cb33.Value, cb34.Value, cb35.Value, cb36.Value]);
end;

procedure TWeightSetForm.initWeightArr;
var i: Integer;
begin
  for i := 0 to Length(arrWeightItem) - 1 do
  begin
    arrWeightItem[i].Clear;
    arrWeightItem[i].Add('');
    arrWeightItem[i].Add(MainForm.weightSetConfig.carCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.faHuoCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.shouHuoCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.goodsCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.specCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.scaleCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.bundleCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.priceCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.memoCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup1Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup2Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup3Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup4Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup5Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup6Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup7Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup8Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup9Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup10Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup11Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup12Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup13Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup14Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup15Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup16Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.backup17Caption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.backup18Caption); arrWeightItem[i].Add(MainForm.weightSetConfig.grossCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.tareCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.netCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.realCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.sumCaption);
    arrWeightItem[i].Add(MainForm.weightSetConfig.costCaption); arrWeightItem[i].Add(MainForm.weightSetConfig.quanterCaption);

    arrWeightKey[i].Clear;
    arrWeightKey[i].Add('');
    arrWeightKey[i].Add('车号'); arrWeightKey[i].Add('发货单位');
    arrWeightKey[i].Add('收货单位'); arrWeightKey[i].Add('货名');
    arrWeightKey[i].Add('规格'); arrWeightKey[i].Add('折方系数');
    arrWeightKey[i].Add('扣重'); arrWeightKey[i].Add('单价');
    arrWeightKey[i].Add('备注'); arrWeightKey[i].Add('备用1');
    arrWeightKey[i].Add('备用2'); arrWeightKey[i].Add('备用3');
    arrWeightKey[i].Add('备用4'); arrWeightKey[i].Add('备用5');
    arrWeightKey[i].Add('备用6'); arrWeightKey[i].Add('备用7');
    arrWeightKey[i].Add('备用8'); arrWeightKey[i].Add('备用9');
    arrWeightKey[i].Add('备用10'); arrWeightKey[i].Add('备用11');
    arrWeightKey[i].Add('备用12'); arrWeightKey[i].Add('备用13');
    arrWeightKey[i].Add('备用14'); arrWeightKey[i].Add('备用15');
    arrWeightKey[i].Add('备用16'); arrWeightKey[i].Add('备用17');
    arrWeightKey[i].Add('备用18'); arrWeightKey[i].Add('毛重');
    arrWeightKey[i].Add('皮重'); arrWeightKey[i].Add('净重');
    arrWeightKey[i].Add('实重'); arrWeightKey[i].Add('金额');
    arrWeightKey[i].Add('过磅费'); arrWeightKey[i].Add('方量');
  end;
end;

procedure TWeightSetForm.TSPositionShow(Sender: TObject);
begin
  reloadComboBox;
  loadPosition;
end;

end.

