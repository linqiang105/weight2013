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
    TSUnique: TTabSheet;
    GBUnique: TGroupBox;
    CBUniqueCar: TCheckBox;
    CBUniqueShouHuo: TCheckBox;
    CBUniqueSpec: TCheckBox;
    CBUniqueBundle: TCheckBox;
    CBUniqueBackup1: TCheckBox;
    CBUniqueBackup3: TCheckBox;
    CBUniqueBackup5: TCheckBox;
    CBUniqueFaHuo: TCheckBox;
    CBUniqueGoods: TCheckBox;
    CBUniqueMemo: TCheckBox;
    CBUniqueBackup2: TCheckBox;
    CBUniqueBackup4: TCheckBox;
    CBUniqueBackup10: TCheckBox;
    CBUniqueBackup11: TCheckBox;
    CBUniqueBackup12: TCheckBox;
    CBUniqueBackup13: TCheckBox;
    CBUniqueBackup14: TCheckBox;
    CBUniqueBackup6: TCheckBox;
    CBUniqueBackup7: TCheckBox;
    CBUniqueBackup8: TCheckBox;
    CBUniqueBackup9: TCheckBox;
    CBUniqueBackup15: TCheckBox;
    CBUniqueBackup16: TCheckBox;
    CBUniqueBackup17: TCheckBox;
    CBUniqueBackup18: TCheckBox;
    CBUniquePrice: TCheckBox;
    CBUniqueScale: TCheckBox;
    GBNotChange: TGroupBox;
    CBNotChangeCar: TCheckBox;
    CBNotChangeShouHuo: TCheckBox;
    CBNotChangeSpec: TCheckBox;
    CBNotChangeBundle: TCheckBox;
    CBNotChangeBackup1: TCheckBox;
    CBNotChangeBackup3: TCheckBox;
    CBNotChangeBackup5: TCheckBox;
    CBNotChangeFaHuo: TCheckBox;
    CBNotChangeGoods: TCheckBox;
    CBNotChangeMemo: TCheckBox;
    CBNotChangeBackup2: TCheckBox;
    CBNotChangeBackup4: TCheckBox;
    CBNotChangeBackup10: TCheckBox;
    CBNotChangeBackup11: TCheckBox;
    CBNotChangeBackup12: TCheckBox;
    CBNotChangeBackup13: TCheckBox;
    CBNotChangeBackup14: TCheckBox;
    CBNotChangeBackup6: TCheckBox;
    CBNotChangeBackup7: TCheckBox;
    CBNotChangeBackup8: TCheckBox;
    CBNotChangeBackup9: TCheckBox;
    CBNotChangeBackup15: TCheckBox;
    CBNotChangeBackup16: TCheckBox;
    CBNotChangeBackup17: TCheckBox;
    CBNotChangeBackup18: TCheckBox;
    CBNotChangePrice: TCheckBox;
    CBNotChangeScale: TCheckBox;
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
    ////////////////////////////////////////////
    function loadUnique(): Boolean;
    function saveUnique(): Boolean;
    ////////////////////////////////////////////
    function loadNotChange(): Boolean;
    function saveNotChange(): Boolean;
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
  saveUnique;
  saveNotChange;

  loadShowName;
  reloadComboBox;
  loadPosition;
  //loadAutoClear;
  //loadDefault;
  //loadMust;
  //loadFormule;
  //loadUnique;

  //生效到主窗体中
  if MainForm.SpltMain.Visible then
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
  loadUnique;
  loadNotChange;
end;

procedure TWeightSetForm.BtnSetFormule6Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression6.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min6;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType6;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point6;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide6;
    FormuleForm.ShowModal;
    EdtExpression6.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min6 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType6 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point6 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide6 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule7Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression7.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min7;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType7;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point7;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide7;
    FormuleForm.ShowModal;
    EdtExpression7.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min7 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType7 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point7 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide7 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule8Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression8.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min8;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType8;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point8;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide8;
    FormuleForm.ShowModal;
    EdtExpression8.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min8 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType8 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point8 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide8 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule9Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression9.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min9;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType9;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point9;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide9;
    FormuleForm.ShowModal;
    EdtExpression9.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min9 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType9 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point9 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide9 := FormuleForm.sumDivide;
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
    FormuleForm.minValue := MainForm.poWeightSetConfig.min15;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType15;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point15;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide15;
    FormuleForm.ShowModal;
    EdtExpression15.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min15 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType15 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point15 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide15 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule16Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression16.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min16;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType16;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point16;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide16;
    FormuleForm.ShowModal;
    EdtExpression16.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min16 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType16 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point16 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide16 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule17Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression17.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min17;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType17;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point17;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide17;
    FormuleForm.ShowModal;
    EdtExpression17.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min17 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType17 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point17 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide17 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnSetFormule18Click(Sender: TObject);
begin
  Application.CreateForm(TFormuleForm, FormuleForm);
  try
    FormuleForm.returnValue := EdtExpression18.Text;
    FormuleForm.minValue := MainForm.poWeightSetConfig.min18;
    FormuleForm.sumType := MainForm.poWeightSetConfig.sumType18;
    FormuleForm.sumPoint := MainForm.poWeightSetConfig.point18;
    FormuleForm.sumDivide := MainForm.poWeightSetConfig.divide18;
    FormuleForm.ShowModal;
    EdtExpression18.Text := FormuleForm.returnValue;
    MainForm.poWeightSetConfig.min18 := FormuleForm.minValue;
    MainForm.poWeightSetConfig.sumType18 := FormuleForm.sumType;
    MainForm.poWeightSetConfig.point18 := FormuleForm.sumPoint;
    MainForm.poWeightSetConfig.divide18 := FormuleForm.sumDivide;
  finally
    FormuleForm.Free;
  end;
end;

procedure TWeightSetForm.BtnLoadClick(Sender: TObject);
var f: string;
begin
  f := TCommonUtil.openFileDialog('ini', '界面配置文件(*.wfc)|*.wfc',
    ExtractFilePath(ParamStr(0)) + 'Design\');
  if FileExists(f) then
  begin
    CopyFile(PChar(f), PChar(ExtractFilePath(ParamStr(0)) + 'design.ini'), False);
    TSysConfigUtil.loadFormConfig(MainForm.poWeightSetConfig,MainForm.soWeightSetConfig,
    MainForm.ioWeightSetConfig,MainForm.ooWeightSetConfig);

    loadShowName;
    reloadComboBox;
    loadPosition;
    loadAutoClear;
    loadDefault;
    loadMust;
    loadFormule;

    if MainForm.SpltMain.Visible then
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
  CBClearCar.Caption := MainForm.poWeightSetConfig.carCaption;
  CBClearFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  CBClearShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  CBClearGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  CBClearSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  CBClearBundle.Caption := MainForm.poWeightSetConfig.bundleCaption;
  CBClearPrice.Caption := MainForm.poWeightSetConfig.priceCaption;
  CBClearScale.Caption := MainForm.poWeightSetConfig.scaleCaption;
  CBClearMemo.Caption := MainForm.poWeightSetConfig.memoCaption;
  CBClearBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  CBClearBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  CBClearBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  CBClearBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  CBClearBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  CBClearBackup6.Caption := MainForm.poWeightSetConfig.backup6Caption;
  CBClearBackup7.Caption := MainForm.poWeightSetConfig.backup7Caption;
  CBClearBackup8.Caption := MainForm.poWeightSetConfig.backup8Caption;
  CBClearBackup9.Caption := MainForm.poWeightSetConfig.backup9Caption;
  CBClearBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  CBClearBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  CBClearBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  CBClearBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  CBClearBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;
  CBClearBackup15.Caption := MainForm.poWeightSetConfig.backup15Caption;
  CBClearBackup16.Caption := MainForm.poWeightSetConfig.backup16Caption;
  CBClearBackup17.Caption := MainForm.poWeightSetConfig.backup17Caption;
  CBClearBackup18.Caption := MainForm.poWeightSetConfig.backup18Caption;

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
  LECarDefault.EditLabel.Caption := MainForm.poWeightSetConfig.carCaption + '    ';
  LEFaHuoDefault.EditLabel.Caption := MainForm.poWeightSetConfig.faHuoCaption + '    ';
  LEShouHuoDefault.EditLabel.Caption := MainForm.poWeightSetConfig.shouHuoCaption + '    ';
  LEGoodsDefault.EditLabel.Caption := MainForm.poWeightSetConfig.goodsCaption + '    ';
  LESpecDefault.EditLabel.Caption := MainForm.poWeightSetConfig.specCaption + '    ';
  LEBundleDefault.EditLabel.Caption := MainForm.poWeightSetConfig.bundleCaption + '    ';
  LEPriceDefault.EditLabel.Caption := MainForm.poWeightSetConfig.priceCaption + '    ';
  LEScaleDefault.EditLabel.Caption := MainForm.poWeightSetConfig.scaleCaption + '    ';
  LEMemoDefault.EditLabel.Caption := MainForm.poWeightSetConfig.memoCaption + '    ';
  LEBackup1Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup1Caption + '    ';
  LEBackup2Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup2Caption + '    ';
  LEBackup3Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup3Caption + '    ';
  LEBackup4Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup4Caption + '    ';
  LEBackup5Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup5Caption + '    ';
  LEBackup6Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup6Caption + '    ';
  LEBackup7Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup7Caption + '    ';
  LEBackup8Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup8Caption + '    ';
  LEBackup9Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup9Caption + '    ';
  LEBackup10Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup10Caption + '    ';
  LEBackup11Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup11Caption + '    ';
  LEBackup12Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup12Caption + '    ';
  LEBackup13Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup13Caption + '    ';
  LEBackup14Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup14Caption + '    ';
  LEBackup15Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup15Caption + '    ';
  LEBackup16Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup16Caption + '    ';
  LEBackup17Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup17Caption + '    ';
  LEBackup18Default.EditLabel.Caption := MainForm.poWeightSetConfig.backup18Caption + '    ';

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
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.carCaption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.faHuoCaption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.shouHuoCaption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.goodsCaption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.specCaption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup1Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup2Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup3Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup4Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup5Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup10Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup11Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup12Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup13Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.backup14Caption);
  CBRule61.Items.Add('根据' + MainForm.poWeightSetConfig.updateTimeCaption);

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
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup6Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup7Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup8Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup9Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup15Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup16Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup17Caption);
  CBGroup6.Items.Add('统计' + MainForm.poWeightSetConfig.backup18Caption);

  CBGroup7.Items := CBGroup6.Items;
  CBGroup8.Items := CBGroup6.Items;
  CBGroup9.Items := CBGroup6.Items;
  CBGroup15.Items := CBGroup6.Items;
  CBGroup16.Items := CBGroup6.Items;
  CBGroup17.Items := CBGroup6.Items;
  CBGroup18.Items := CBGroup6.Items;

  //如果有配置公式,输入框就不允许输入
  lblBackup6.Caption := MainForm.poWeightSetConfig.backup6Caption;
  lblBackup7.Caption := MainForm.poWeightSetConfig.backup7Caption;
  lblBackup8.Caption := MainForm.poWeightSetConfig.backup8Caption;
  lblBackup9.Caption := MainForm.poWeightSetConfig.backup9Caption;

  lblBackup15.Caption := MainForm.poWeightSetConfig.backup15Caption;
  lblBackup16.Caption := MainForm.poWeightSetConfig.backup16Caption;
  lblBackup17.Caption := MainForm.poWeightSetConfig.backup17Caption;
  lblBackup18.Caption := MainForm.poWeightSetConfig.backup18Caption;

  CBUseExpression6.Checked := MainForm.poWeightSetConfig.useExpression6;
  CBUseExpression7.Checked := MainForm.poWeightSetConfig.useExpression7;
  CBUseExpression8.Checked := MainForm.poWeightSetConfig.useExpression8;
  CBUseExpression9.Checked := MainForm.poWeightSetConfig.useExpression9;
  CBUseExpression15.Checked := MainForm.poWeightSetConfig.useExpression15;
  CBUseExpression16.Checked := MainForm.poWeightSetConfig.useExpression16;
  CBUseExpression17.Checked := MainForm.poWeightSetConfig.useExpression17;
  CBUseExpression18.Checked := MainForm.poWeightSetConfig.useExpression18;
  EdtExpression6.Text := MainForm.poWeightSetConfig.expression6;
  EdtExpression7.Text := MainForm.poWeightSetConfig.expression7;
  EdtExpression8.Text := MainForm.poWeightSetConfig.expression8;
  EdtExpression9.Text := MainForm.poWeightSetConfig.expression9;
  EdtExpression15.Text := MainForm.poWeightSetConfig.expression15;
  EdtExpression16.Text := MainForm.poWeightSetConfig.expression16;
  EdtExpression17.Text := MainForm.poWeightSetConfig.expression17;
  EdtExpression18.Text := MainForm.poWeightSetConfig.expression18;

  CBRule61.ItemIndex := MainForm.poWeightSetConfig.rule61;
  CBRule62.ItemIndex := MainForm.poWeightSetConfig.rule62;
  CBRule71.ItemIndex := MainForm.poWeightSetConfig.rule71;
  CBRule72.ItemIndex := MainForm.poWeightSetConfig.rule72;
  CBRule81.ItemIndex := MainForm.poWeightSetConfig.rule81;
  CBRule82.ItemIndex := MainForm.poWeightSetConfig.rule82;
  CBRule91.ItemIndex := MainForm.poWeightSetConfig.rule91;
  CBRule92.ItemIndex := MainForm.poWeightSetConfig.rule92;
  CBRule151.ItemIndex := MainForm.poWeightSetConfig.rule151;
  CBRule152.ItemIndex := MainForm.poWeightSetConfig.rule152;
  CBRule161.ItemIndex := MainForm.poWeightSetConfig.rule161;
  CBRule162.ItemIndex := MainForm.poWeightSetConfig.rule162;
  CBRule171.ItemIndex := MainForm.poWeightSetConfig.rule171;
  CBRule172.ItemIndex := MainForm.poWeightSetConfig.rule172;
  CBRule181.ItemIndex := MainForm.poWeightSetConfig.rule181;
  CBRule182.ItemIndex := MainForm.poWeightSetConfig.rule182;

  CBGroup6.ItemIndex := MainForm.poWeightSetConfig.group6;
  CBGroup7.ItemIndex := MainForm.poWeightSetConfig.group7;
  CBGroup8.ItemIndex := MainForm.poWeightSetConfig.group8;
  CBGroup9.ItemIndex := MainForm.poWeightSetConfig.group9;
  CBGroup15.ItemIndex := MainForm.poWeightSetConfig.group15;
  CBGroup16.ItemIndex := MainForm.poWeightSetConfig.group16;
  CBGroup17.ItemIndex := MainForm.poWeightSetConfig.group17;
  CBGroup18.ItemIndex := MainForm.poWeightSetConfig.group18;

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
  MainForm.poWeightSetConfig.carClear := CBClearCar.Checked;
  MainForm.poWeightSetConfig.faHuoClear := CBClearFaHuo.Checked;
  MainForm.poWeightSetConfig.shouHuoClear := CBClearShouHuo.Checked;
  MainForm.poWeightSetConfig.goodsClear := CBClearGoods.Checked;
  MainForm.poWeightSetConfig.specClear := CBClearSpec.Checked;
  MainForm.poWeightSetConfig.bundleClear := CBClearBundle.Checked;
  MainForm.poWeightSetConfig.priceClear := CBClearPrice.Checked;
  MainForm.poWeightSetConfig.scaleClear := CBClearScale.Checked;
  MainForm.poWeightSetConfig.memoClear := CBClearMemo.Checked;
  MainForm.poWeightSetConfig.backup1Clear := CBClearBackup1.Checked;
  MainForm.poWeightSetConfig.backup2Clear := CBClearBackup2.Checked;
  MainForm.poWeightSetConfig.backup3Clear := CBClearBackup3.Checked;
  MainForm.poWeightSetConfig.backup4Clear := CBClearBackup4.Checked;
  MainForm.poWeightSetConfig.backup5Clear := CBClearBackup5.Checked;
  MainForm.poWeightSetConfig.backup6Clear := CBClearBackup6.Checked;
  MainForm.poWeightSetConfig.backup7Clear := CBClearBackup7.Checked;
  MainForm.poWeightSetConfig.backup8Clear := CBClearBackup8.Checked;
  MainForm.poWeightSetConfig.backup9Clear := CBClearBackup9.Checked;
  MainForm.poWeightSetConfig.backup10Clear := CBClearBackup10.Checked;
  MainForm.poWeightSetConfig.backup11Clear := CBClearBackup11.Checked;
  MainForm.poWeightSetConfig.backup12Clear := CBClearBackup12.Checked;
  MainForm.poWeightSetConfig.backup13Clear := CBClearBackup13.Checked;
  MainForm.poWeightSetConfig.backup14Clear := CBClearBackup14.Checked;
  MainForm.poWeightSetConfig.backup15Clear := CBClearBackup15.Checked;
  MainForm.poWeightSetConfig.backup16Clear := CBClearBackup16.Checked;
  MainForm.poWeightSetConfig.backup17Clear := CBClearBackup17.Checked;
  MainForm.poWeightSetConfig.backup18Clear := CBClearBackup18.Checked;
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
  MainForm.poWeightSetConfig.carDefault := LECarDefault.Text;
  MainForm.poWeightSetConfig.faHuoDefault := LEFaHuoDefault.Text;
  MainForm.poWeightSetConfig.shouHuoDefault := LEShouHuoDefault.Text;
  MainForm.poWeightSetConfig.goodsDefault := LEGoodsDefault.Text;
  MainForm.poWeightSetConfig.specDefault := LESpecDefault.Text;
  MainForm.poWeightSetConfig.bundleDefault := LEBundleDefault.Text;
  MainForm.poWeightSetConfig.priceDefault := LEPriceDefault.Text;
  MainForm.poWeightSetConfig.scaleDefault := LEScaleDefault.Text;
  MainForm.poWeightSetConfig.memoDefault := LEMemoDefault.Text;
  MainForm.poWeightSetConfig.backup1Default := LEBackup1Default.Text;
  MainForm.poWeightSetConfig.backup2Default := LEBackup2Default.Text;
  MainForm.poWeightSetConfig.backup3Default := LEBackup3Default.Text;
  MainForm.poWeightSetConfig.backup4Default := LEBackup4Default.Text;
  MainForm.poWeightSetConfig.backup5Default := LEBackup5Default.Text;
  MainForm.poWeightSetConfig.backup6Default := LEBackup6Default.Text;
  MainForm.poWeightSetConfig.backup7Default := LEBackup7Default.Text;
  MainForm.poWeightSetConfig.backup8Default := LEBackup8Default.Text;
  MainForm.poWeightSetConfig.backup9Default := LEBackup9Default.Text;
  MainForm.poWeightSetConfig.backup10Default := LEBackup10Default.Text;
  MainForm.poWeightSetConfig.backup11Default := LEBackup11Default.Text;
  MainForm.poWeightSetConfig.backup12Default := LEBackup12Default.Text;
  MainForm.poWeightSetConfig.backup13Default := LEBackup13Default.Text;
  MainForm.poWeightSetConfig.backup14Default := LEBackup14Default.Text;
  MainForm.poWeightSetConfig.backup15Default := LEBackup15Default.Text;
  MainForm.poWeightSetConfig.backup16Default := LEBackup16Default.Text;
  MainForm.poWeightSetConfig.backup17Default := LEBackup17Default.Text;
  MainForm.poWeightSetConfig.backup18Default := LEBackup18Default.Text;
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

  myini.WriteInteger('formDesign', 'point6', MainForm.poWeightSetConfig.point6);
  myini.WriteInteger('formDesign', 'point7', MainForm.poWeightSetConfig.point7);
  myini.WriteInteger('formDesign', 'point8', MainForm.poWeightSetConfig.point8);
  myini.WriteInteger('formDesign', 'point9', MainForm.poWeightSetConfig.point9);
  myini.WriteInteger('formDesign', 'point15', MainForm.poWeightSetConfig.point15);
  myini.WriteInteger('formDesign', 'point16', MainForm.poWeightSetConfig.point16);
  myini.WriteInteger('formDesign', 'point17', MainForm.poWeightSetConfig.point17);
  myini.WriteInteger('formDesign', 'point18', MainForm.poWeightSetConfig.point18);

  myini.WriteInteger('formDesign', 'divide6', MainForm.poWeightSetConfig.divide6);
  myini.WriteInteger('formDesign', 'divide7', MainForm.poWeightSetConfig.divide7);
  myini.WriteInteger('formDesign', 'divide8', MainForm.poWeightSetConfig.divide8);
  myini.WriteInteger('formDesign', 'divide9', MainForm.poWeightSetConfig.divide9);
  myini.WriteInteger('formDesign', 'divide15', MainForm.poWeightSetConfig.divide15);
  myini.WriteInteger('formDesign', 'divide16', MainForm.poWeightSetConfig.divide16);
  myini.WriteInteger('formDesign', 'divide17', MainForm.poWeightSetConfig.divide17);
  myini.WriteInteger('formDesign', 'divide18', MainForm.poWeightSetConfig.divide18);

  myini.WriteInteger('formDesign', 'sumType6', MainForm.poWeightSetConfig.sumType6);
  myini.WriteInteger('formDesign', 'sumType7', MainForm.poWeightSetConfig.sumType7);
  myini.WriteInteger('formDesign', 'sumType8', MainForm.poWeightSetConfig.sumType8);
  myini.WriteInteger('formDesign', 'sumType9', MainForm.poWeightSetConfig.sumType9);
  myini.WriteInteger('formDesign', 'sumType15', MainForm.poWeightSetConfig.sumType15);
  myini.WriteInteger('formDesign', 'sumType16', MainForm.poWeightSetConfig.sumType16);
  myini.WriteInteger('formDesign', 'sumType17', MainForm.poWeightSetConfig.sumType17);
  myini.WriteInteger('formDesign', 'sumType18', MainForm.poWeightSetConfig.sumType18);

  myini.WriteFloat('formDesign', 'min6', MainForm.poWeightSetConfig.min6);
  myini.WriteFloat('formDesign', 'min7', MainForm.poWeightSetConfig.min7);
  myini.WriteFloat('formDesign', 'min8', MainForm.poWeightSetConfig.min8);
  myini.WriteFloat('formDesign', 'min9', MainForm.poWeightSetConfig.min9);
  myini.WriteFloat('formDesign', 'min15', MainForm.poWeightSetConfig.min15);
  myini.WriteFloat('formDesign', 'min16', MainForm.poWeightSetConfig.min16);
  myini.WriteFloat('formDesign', 'min17', MainForm.poWeightSetConfig.min17);
  myini.WriteFloat('formDesign', 'min18', MainForm.poWeightSetConfig.min18);

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

  MainForm.poWeightSetConfig.useExpression6 := CBUseExpression6.Checked;
  MainForm.poWeightSetConfig.useExpression7 := CBUseExpression7.Checked;
  MainForm.poWeightSetConfig.useExpression8 := CBUseExpression8.Checked;
  MainForm.poWeightSetConfig.useExpression9 := CBUseExpression9.Checked;
  MainForm.poWeightSetConfig.useExpression15 := CBUseExpression15.Checked;
  MainForm.poWeightSetConfig.useExpression16 := CBUseExpression16.Checked;
  MainForm.poWeightSetConfig.useExpression17 := CBUseExpression17.Checked;
  MainForm.poWeightSetConfig.useExpression18 := CBUseExpression18.Checked;

  MainForm.poWeightSetConfig.expression6 := EdtExpression6.Text;
  MainForm.poWeightSetConfig.expression7 := EdtExpression7.Text;
  MainForm.poWeightSetConfig.expression8 := EdtExpression8.Text;
  MainForm.poWeightSetConfig.expression9 := EdtExpression9.Text;
  MainForm.poWeightSetConfig.expression15 := EdtExpression15.Text;
  MainForm.poWeightSetConfig.expression16 := EdtExpression16.Text;
  MainForm.poWeightSetConfig.expression17 := EdtExpression17.Text;
  MainForm.poWeightSetConfig.expression18 := EdtExpression18.Text;

  MainForm.poWeightSetConfig.rule61 := CBRule61.ItemIndex;
  MainForm.poWeightSetConfig.rule62 := CBRule62.ItemIndex;
  MainForm.poWeightSetConfig.rule71 := CBRule71.ItemIndex;
  MainForm.poWeightSetConfig.rule72 := CBRule72.ItemIndex;
  MainForm.poWeightSetConfig.rule81 := CBRule81.ItemIndex;
  MainForm.poWeightSetConfig.rule82 := CBRule82.ItemIndex;
  MainForm.poWeightSetConfig.rule91 := CBRule91.ItemIndex;
  MainForm.poWeightSetConfig.rule92 := CBRule92.ItemIndex;
  MainForm.poWeightSetConfig.rule151 := CBRule151.ItemIndex;
  MainForm.poWeightSetConfig.rule152 := CBRule152.ItemIndex;
  MainForm.poWeightSetConfig.rule161 := CBRule161.ItemIndex;
  MainForm.poWeightSetConfig.rule162 := CBRule162.ItemIndex;
  MainForm.poWeightSetConfig.rule171 := CBRule171.ItemIndex;
  MainForm.poWeightSetConfig.rule172 := CBRule172.ItemIndex;
  MainForm.poWeightSetConfig.rule181 := CBRule181.ItemIndex;
  MainForm.poWeightSetConfig.rule182 := CBRule182.ItemIndex;

  MainForm.poWeightSetConfig.group6 := CBGroup6.ItemIndex;
  MainForm.poWeightSetConfig.group7 := CBGroup7.ItemIndex;
  MainForm.poWeightSetConfig.group8 := CBGroup8.ItemIndex;
  MainForm.poWeightSetConfig.group9 := CBGroup9.ItemIndex;
  MainForm.poWeightSetConfig.group15 := CBGroup15.ItemIndex;
  MainForm.poWeightSetConfig.group16 := CBGroup16.ItemIndex;
  MainForm.poWeightSetConfig.group17 := CBGroup17.ItemIndex;
  MainForm.poWeightSetConfig.group18 := CBGroup18.ItemIndex;
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

  MainForm.poWeightSetConfig.pv00 := cb00.Value;
  MainForm.poWeightSetConfig.pv01 := cb01.Value;
  MainForm.poWeightSetConfig.pv02 := cb02.Value;
  MainForm.poWeightSetConfig.pv03 := cb03.Value;
  MainForm.poWeightSetConfig.pv04 := cb04.Value;
  MainForm.poWeightSetConfig.pv05 := cb05.Value;
  MainForm.poWeightSetConfig.pv06 := cb06.Value;
  MainForm.poWeightSetConfig.pv07 := cb07.Value;
  MainForm.poWeightSetConfig.pv08 := cb08.Value;

  MainForm.poWeightSetConfig.pv10 := cb10.Value;
  MainForm.poWeightSetConfig.pv11 := cb11.Value;
  MainForm.poWeightSetConfig.pv12 := cb12.Value;
  MainForm.poWeightSetConfig.pv13 := cb13.Value;
  MainForm.poWeightSetConfig.pv14 := cb14.Value;
  MainForm.poWeightSetConfig.pv15 := cb15.Value;
  MainForm.poWeightSetConfig.pv16 := cb16.Value;
  MainForm.poWeightSetConfig.pv17 := cb17.Value;
  MainForm.poWeightSetConfig.pv18 := cb18.Value;

  MainForm.poWeightSetConfig.pv20 := cb20.Value;
  MainForm.poWeightSetConfig.pv21 := cb21.Value;
  MainForm.poWeightSetConfig.pv22 := cb22.Value;
  MainForm.poWeightSetConfig.pv23 := cb23.Value;
  MainForm.poWeightSetConfig.pv24 := cb24.Value;
  MainForm.poWeightSetConfig.pv25 := cb25.Value;
  MainForm.poWeightSetConfig.pv26 := cb26.Value;
  MainForm.poWeightSetConfig.pv27 := cb27.Value;
  MainForm.poWeightSetConfig.pv28 := cb28.Value;

  MainForm.poWeightSetConfig.pv30 := cb30.Value;
  MainForm.poWeightSetConfig.pv31 := cb31.Value;
  MainForm.poWeightSetConfig.pv32 := cb32.Value;
  MainForm.poWeightSetConfig.pv33 := cb33.Value;
  MainForm.poWeightSetConfig.pv34 := cb34.Value;
  MainForm.poWeightSetConfig.pv35 := cb35.Value;
  MainForm.poWeightSetConfig.pv36 := cb36.Value;
end;

function TWeightSetForm.saveShowName: Boolean;
begin
  if EdtCar.Text = '' then EdtCar.Text := '车号';
  if EdtFaHuo.Text = '' then EdtFaHuo.Text := '发货单位';
  if EdtShouHuo.Text = '' then EdtShouHuo.Text := '收货单位';
  if EdtGoods.Text = '' then EdtGoods.Text := '货名';
  if EdtSpec.Text = '' then EdtSpec.Text := '规格';
  if EdtGross.Text = '' then EdtGross.Text := '毛重';
  if EdtTare.Text = '' then EdtTare.Text := '皮重';
  if EdtNet.Text = '' then EdtNet.Text := '净重';
  if EdtBundle.Text = '' then EdtBundle.Text := '扣重';
  if EdtReal.Text = '' then EdtReal.Text := '实重';
  if EdtPrice.Text = '' then EdtPrice.Text := '单价';
  if EdtSum.Text = '' then EdtSum.Text := '金额';
  if EdtScale.Text = '' then EdtScale.Text := '折方系数';
  if EdtQuanter.Text = '' then EdtQuanter.Text := '方量';
  if EdtCost.Text = '' then EdtCost.Text := '过磅费';
  if EdtGrossTime.Text = '' then EdtGrossTime.Text := '毛重时间';
  if EdtTareTime.Text = '' then EdtTareTime.Text := '皮重时间';
  if EdtMemo.Text = '' then EdtMemo.Text := '备注';
  if EdtBackup1.Text = '' then EdtBackup1.Text := '备用1';
  if EdtBackup2.Text = '' then EdtBackup2.Text := '备用2';
  if EdtBackup3.Text = '' then EdtBackup3.Text := '备用3';
  if EdtBackup4.Text = '' then EdtBackup4.Text := '备用4';
  if EdtBackup5.Text = '' then EdtBackup5.Text := '备用5';
  if EdtBackup6.Text = '' then EdtBackup6.Text := '备用6';
  if EdtBackup7.Text = '' then EdtBackup7.Text := '备用7';
  if EdtBackup8.Text = '' then EdtBackup8.Text := '备用8';
  if EdtBackup9.Text = '' then EdtBackup9.Text := '备用9';
  if EdtBackup10.Text = '' then EdtBackup10.Text := '备用10';
  if EdtBackup11.Text = '' then EdtBackup11.Text := '备用11';
  if EdtBackup12.Text = '' then EdtBackup12.Text := '备用12';
  if EdtBackup13.Text = '' then EdtBackup13.Text := '备用13';
  if EdtBackup14.Text = '' then EdtBackup14.Text := '备用14';
  if EdtBackup15.Text = '' then EdtBackup15.Text := '备用15';
  if EdtBackup16.Text = '' then EdtBackup16.Text := '备用16';
  if EdtBackup17.Text = '' then EdtBackup17.Text := '备用17';
  if EdtBackup18.Text = '' then EdtBackup18.Text := '备用18';

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
  myini.WriteString('formDesign', 'memoCaption', EdtMemo.Text);
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
  MainForm.poWeightSetConfig.carCaption := EdtCar.Text;
  MainForm.poWeightSetConfig.faHuoCaption := EdtFaHuo.Text;
  MainForm.poWeightSetConfig.shouHuoCaption := EdtShouHuo.Text;
  MainForm.poWeightSetConfig.goodsCaption := EdtGoods.Text;
  MainForm.poWeightSetConfig.specCaption := EdtSpec.Text;
  MainForm.poWeightSetConfig.grossCaption := EdtGross.Text;
  MainForm.poWeightSetConfig.tareCaption := EdtTare.Text;
  MainForm.poWeightSetConfig.netCaption := EdtNet.Text;
  MainForm.poWeightSetConfig.bundleCaption := EdtBundle.Text;
  MainForm.poWeightSetConfig.realCaption := EdtReal.Text;
  MainForm.poWeightSetConfig.priceCaption := EdtPrice.Text;
  MainForm.poWeightSetConfig.sumCaption := EdtSum.Text;
  MainForm.poWeightSetConfig.scaleCaption := EdtScale.Text;
  MainForm.poWeightSetConfig.quanterCaption := EdtQuanter.Text;
  MainForm.poWeightSetConfig.costCaption := EdtCost.Text;
  MainForm.poWeightSetConfig.grossTimeCaption := EdtGrossTime.Text;
  MainForm.poWeightSetConfig.tareTimeCaption := EdtTareTime.Text;
  MainForm.poWeightSetConfig.memoCaption := EdtMemo.Text;
  MainForm.poWeightSetConfig.backup1Caption := EdtBackup1.Text;
  MainForm.poWeightSetConfig.backup2Caption := EdtBackup2.Text;
  MainForm.poWeightSetConfig.backup3Caption := EdtBackup3.Text;
  MainForm.poWeightSetConfig.backup4Caption := EdtBackup4.Text;
  MainForm.poWeightSetConfig.backup5Caption := EdtBackup5.Text;
  MainForm.poWeightSetConfig.backup6Caption := EdtBackup6.Text;
  MainForm.poWeightSetConfig.backup7Caption := EdtBackup7.Text;
  MainForm.poWeightSetConfig.backup8Caption := EdtBackup8.Text;
  MainForm.poWeightSetConfig.backup9Caption := EdtBackup9.Text;
  MainForm.poWeightSetConfig.backup10Caption := EdtBackup10.Text;
  MainForm.poWeightSetConfig.backup11Caption := EdtBackup11.Text;
  MainForm.poWeightSetConfig.backup12Caption := EdtBackup12.Text;
  MainForm.poWeightSetConfig.backup13Caption := EdtBackup13.Text;
  MainForm.poWeightSetConfig.backup14Caption := EdtBackup14.Text;
  MainForm.poWeightSetConfig.backup15Caption := EdtBackup15.Text;
  MainForm.poWeightSetConfig.backup16Caption := EdtBackup16.Text;
  MainForm.poWeightSetConfig.backup17Caption := EdtBackup17.Text;
  MainForm.poWeightSetConfig.backup18Caption := EdtBackup18.Text;
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
  CBMustCar.Caption := MainForm.poWeightSetConfig.carCaption;
  CBMustFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  CBMustShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  CBMustGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  CBMustSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  CBMustBundle.Caption := MainForm.poWeightSetConfig.bundleCaption;
  CBMustPrice.Caption := MainForm.poWeightSetConfig.priceCaption;
  CBMustScale.Caption := MainForm.poWeightSetConfig.scaleCaption;
  CBMustMemo.Caption := MainForm.poWeightSetConfig.memoCaption;
  CBMustBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  CBMustBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  CBMustBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  CBMustBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  CBMustBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  CBMustBackup6.Caption := MainForm.poWeightSetConfig.backup6Caption;
  CBMustBackup7.Caption := MainForm.poWeightSetConfig.backup7Caption;
  CBMustBackup8.Caption := MainForm.poWeightSetConfig.backup8Caption;
  CBMustBackup9.Caption := MainForm.poWeightSetConfig.backup9Caption;
  CBMustBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  CBMustBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  CBMustBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  CBMustBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  CBMustBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;
  CBMustBackup15.Caption := MainForm.poWeightSetConfig.backup15Caption;
  CBMustBackup16.Caption := MainForm.poWeightSetConfig.backup16Caption;
  CBMustBackup17.Caption := MainForm.poWeightSetConfig.backup17Caption;
  CBMustBackup18.Caption := MainForm.poWeightSetConfig.backup18Caption;

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
  MainForm.poWeightSetConfig.carMust := CBMustCar.Checked;
  MainForm.poWeightSetConfig.faHuoMust := CBMustFaHuo.Checked;
  MainForm.poWeightSetConfig.shouHuoMust := CBMustShouHuo.Checked;
  MainForm.poWeightSetConfig.goodsMust := CBMustGoods.Checked;
  MainForm.poWeightSetConfig.specMust := CBMustSpec.Checked;
  MainForm.poWeightSetConfig.bundleMust := CBMustBundle.Checked;
  MainForm.poWeightSetConfig.priceMust := CBMustPrice.Checked;
  MainForm.poWeightSetConfig.scaleMust := CBMustScale.Checked;
  MainForm.poWeightSetConfig.memoMust := CBMustMemo.Checked;
  MainForm.poWeightSetConfig.backup1Must := CBMustBackup1.Checked;
  MainForm.poWeightSetConfig.backup2Must := CBMustBackup2.Checked;
  MainForm.poWeightSetConfig.backup3Must := CBMustBackup3.Checked;
  MainForm.poWeightSetConfig.backup4Must := CBMustBackup4.Checked;
  MainForm.poWeightSetConfig.backup5Must := CBMustBackup5.Checked;
  MainForm.poWeightSetConfig.backup6Must := CBMustBackup6.Checked;
  MainForm.poWeightSetConfig.backup7Must := CBMustBackup7.Checked;
  MainForm.poWeightSetConfig.backup8Must := CBMustBackup8.Checked;
  MainForm.poWeightSetConfig.backup9Must := CBMustBackup9.Checked;
  MainForm.poWeightSetConfig.backup10Must := CBMustBackup10.Checked;
  MainForm.poWeightSetConfig.backup11Must := CBMustBackup11.Checked;
  MainForm.poWeightSetConfig.backup12Must := CBMustBackup12.Checked;
  MainForm.poWeightSetConfig.backup13Must := CBMustBackup13.Checked;
  MainForm.poWeightSetConfig.backup14Must := CBMustBackup14.Checked;
  MainForm.poWeightSetConfig.backup15Must := CBMustBackup15.Checked;
  MainForm.poWeightSetConfig.backup16Must := CBMustBackup16.Checked;
  MainForm.poWeightSetConfig.backup17Must := CBMustBackup17.Checked;
  MainForm.poWeightSetConfig.backup18Must := CBMustBackup18.Checked;
  MainForm.poWeightSetConfig.grossMust := CBMustGross.Checked;
  MainForm.poWeightSetConfig.tareMust := CBMustTare.Checked;
  MainForm.poWeightSetConfig.netMust := CBMustNet.Checked;
  MainForm.poWeightSetConfig.realMust := CBMustReal.Checked;
  MainForm.poWeightSetConfig.sumMust := CBMustSum.Checked;
  MainForm.poWeightSetConfig.costMust := CBMustCost.Checked;
  MainForm.poWeightSetConfig.quanterMust := CBMustQuanter.Checked;

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
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.carCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.faHuoCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.shouHuoCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.goodsCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.specCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.scaleCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.bundleCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.priceCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.memoCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup1Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup2Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup3Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup4Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup5Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup6Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup7Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup8Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup9Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup10Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup11Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup12Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup13Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup14Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup15Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup16Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup17Caption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.backup18Caption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.grossCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.tareCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.netCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.realCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.sumCaption);
    arrWeightItem[i].Add(MainForm.poWeightSetConfig.costCaption); arrWeightItem[i].Add(MainForm.poWeightSetConfig.quanterCaption);

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

function TWeightSetForm.loadUnique: Boolean;
begin
  //唯一性选项
  CBUniqueCar.Caption := MainForm.poWeightSetConfig.carCaption;
  CBUniqueFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  CBUniqueShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  CBUniqueGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  CBUniqueSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  CBUniqueBundle.Caption := MainForm.poWeightSetConfig.bundleCaption;
  CBUniquePrice.Caption := MainForm.poWeightSetConfig.priceCaption;
  CBUniqueScale.Caption := MainForm.poWeightSetConfig.scaleCaption;
  CBUniqueMemo.Caption := MainForm.poWeightSetConfig.memoCaption;
  CBUniqueBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  CBUniqueBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  CBUniqueBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  CBUniqueBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  CBUniqueBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  CBUniqueBackup6.Caption := MainForm.poWeightSetConfig.backup6Caption;
  CBUniqueBackup7.Caption := MainForm.poWeightSetConfig.backup7Caption;
  CBUniqueBackup8.Caption := MainForm.poWeightSetConfig.backup8Caption;
  CBUniqueBackup9.Caption := MainForm.poWeightSetConfig.backup9Caption;
  CBUniqueBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  CBUniqueBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  CBUniqueBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  CBUniqueBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  CBUniqueBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;
  CBUniqueBackup15.Caption := MainForm.poWeightSetConfig.backup15Caption;
  CBUniqueBackup16.Caption := MainForm.poWeightSetConfig.backup16Caption;
  CBUniqueBackup17.Caption := MainForm.poWeightSetConfig.backup17Caption;
  CBUniqueBackup18.Caption := MainForm.poWeightSetConfig.backup18Caption;

  CBUniqueCar.Checked := myini.ReadBool('formDesign', 'UniqueCar', False);
  CBUniqueFaHuo.Checked := myini.ReadBool('formDesign', 'UniqueFaHuo', False);
  CBUniqueShouHuo.Checked := myini.ReadBool('formDesign', 'UniqueShouHuo', False);
  CBUniqueGoods.Checked := myini.ReadBool('formDesign', 'UniqueGoods', False);
  CBUniqueSpec.Checked := myini.ReadBool('formDesign', 'UniqueSpec', False);
  CBUniqueBundle.Checked := myini.ReadBool('formDesign', 'UniqueBundle', False);
  CBUniquePrice.Checked := myini.ReadBool('formDesign', 'UniquePrice', False);
  CBUniqueScale.Checked := myini.ReadBool('formDesign', 'UniqueScale', False);
  CBUniqueMemo.Checked := myini.ReadBool('formDesign', 'UniqueMemo', False);
  CBUniqueBackup1.Checked := myini.ReadBool('formDesign', 'UniqueBackup1', False);
  CBUniqueBackup2.Checked := myini.ReadBool('formDesign', 'UniqueBackup2', False);
  CBUniqueBackup3.Checked := myini.ReadBool('formDesign', 'UniqueBackup3', False);
  CBUniqueBackup4.Checked := myini.ReadBool('formDesign', 'UniqueBackup4', False);
  CBUniqueBackup5.Checked := myini.ReadBool('formDesign', 'UniqueBackup5', False);
  CBUniqueBackup6.Checked := myini.ReadBool('formDesign', 'UniqueBackup6', False);
  CBUniqueBackup7.Checked := myini.ReadBool('formDesign', 'UniqueBackup7', False);
  CBUniqueBackup8.Checked := myini.ReadBool('formDesign', 'UniqueBackup8', False);
  CBUniqueBackup9.Checked := myini.ReadBool('formDesign', 'UniqueBackup9', False);
  CBUniqueBackup10.Checked := myini.ReadBool('formDesign', 'UniqueBackup10', False);
  CBUniqueBackup11.Checked := myini.ReadBool('formDesign', 'UniqueBackup11', False);
  CBUniqueBackup12.Checked := myini.ReadBool('formDesign', 'UniqueBackup12', False);
  CBUniqueBackup13.Checked := myini.ReadBool('formDesign', 'UniqueBackup13', False);
  CBUniqueBackup14.Checked := myini.ReadBool('formDesign', 'UniqueBackup14', False);
  CBUniqueBackup15.Checked := myini.ReadBool('formDesign', 'UniqueBackup15', False);
  CBUniqueBackup16.Checked := myini.ReadBool('formDesign', 'UniqueBackup16', False);
  CBUniqueBackup17.Checked := myini.ReadBool('formDesign', 'UniqueBackup17', False);
  CBUniqueBackup18.Checked := myini.ReadBool('formDesign', 'UniqueBackup18', False);
  Result := True;
end;

function TWeightSetForm.saveUnique: Boolean;
begin
  //唯一性选项
  myini.WriteBool('formDesign', 'UniqueCar', CBUniqueCar.Checked);
  myini.WriteBool('formDesign', 'UniqueFaHuo', CBUniqueFaHuo.Checked);
  myini.WriteBool('formDesign', 'UniqueShouHuo', CBUniqueShouHuo.Checked);
  myini.WriteBool('formDesign', 'UniqueGoods', CBUniqueGoods.Checked);
  myini.WriteBool('formDesign', 'UniqueSpec', CBUniqueSpec.Checked);
  myini.WriteBool('formDesign', 'UniqueBundle', CBUniqueBundle.Checked);
  myini.WriteBool('formDesign', 'UniquePrice', CBUniquePrice.Checked);
  myini.WriteBool('formDesign', 'UniqueScale', CBUniqueScale.Checked);
  myini.WriteBool('formDesign', 'UniqueMemo', CBUniqueMemo.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup1', CBUniqueBackup1.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup2', CBUniqueBackup2.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup3', CBUniqueBackup3.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup4', CBUniqueBackup4.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup5', CBUniqueBackup5.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup6', CBUniqueBackup6.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup7', CBUniqueBackup7.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup8', CBUniqueBackup8.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup9', CBUniqueBackup9.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup10', CBUniqueBackup10.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup11', CBUniqueBackup11.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup12', CBUniqueBackup12.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup13', CBUniqueBackup13.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup14', CBUniqueBackup14.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup15', CBUniqueBackup15.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup16', CBUniqueBackup16.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup17', CBUniqueBackup17.Checked);
  myini.WriteBool('formDesign', 'UniqueBackup18', CBUniqueBackup18.Checked);

  //唯一性
  MainForm.poWeightSetConfig.carUnique := CBUniqueCar.Checked;
  MainForm.poWeightSetConfig.faHuoUnique := CBUniqueFaHuo.Checked;
  MainForm.poWeightSetConfig.shouHuoUnique := CBUniqueShouHuo.Checked;
  MainForm.poWeightSetConfig.goodsUnique := CBUniqueGoods.Checked;
  MainForm.poWeightSetConfig.specUnique := CBUniqueSpec.Checked;
  MainForm.poWeightSetConfig.bundleUnique := CBUniqueBundle.Checked;
  MainForm.poWeightSetConfig.priceUnique := CBUniquePrice.Checked;
  MainForm.poWeightSetConfig.scaleUnique := CBUniqueScale.Checked;
  MainForm.poWeightSetConfig.memoUnique := CBUniqueMemo.Checked;
  MainForm.poWeightSetConfig.backup1Unique := CBUniqueBackup1.Checked;
  MainForm.poWeightSetConfig.backup2Unique := CBUniqueBackup2.Checked;
  MainForm.poWeightSetConfig.backup3Unique := CBUniqueBackup3.Checked;
  MainForm.poWeightSetConfig.backup4Unique := CBUniqueBackup4.Checked;
  MainForm.poWeightSetConfig.backup5Unique := CBUniqueBackup5.Checked;
  MainForm.poWeightSetConfig.backup6Unique := CBUniqueBackup6.Checked;
  MainForm.poWeightSetConfig.backup7Unique := CBUniqueBackup7.Checked;
  MainForm.poWeightSetConfig.backup8Unique := CBUniqueBackup8.Checked;
  MainForm.poWeightSetConfig.backup9Unique := CBUniqueBackup9.Checked;
  MainForm.poWeightSetConfig.backup10Unique := CBUniqueBackup10.Checked;
  MainForm.poWeightSetConfig.backup11Unique := CBUniqueBackup11.Checked;
  MainForm.poWeightSetConfig.backup12Unique := CBUniqueBackup12.Checked;
  MainForm.poWeightSetConfig.backup13Unique := CBUniqueBackup13.Checked;
  MainForm.poWeightSetConfig.backup14Unique := CBUniqueBackup14.Checked;
  MainForm.poWeightSetConfig.backup15Unique := CBUniqueBackup15.Checked;
  MainForm.poWeightSetConfig.backup16Unique := CBUniqueBackup16.Checked;
  MainForm.poWeightSetConfig.backup17Unique := CBUniqueBackup17.Checked;
  MainForm.poWeightSetConfig.backup18Unique := CBUniqueBackup18.Checked;
end;

function TWeightSetForm.loadNotChange: Boolean;
begin
  //不可变更选项
  CBNotChangeCar.Caption := MainForm.poWeightSetConfig.carCaption;
  CBNotChangeFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  CBNotChangeShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  CBNotChangeGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  CBNotChangeSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  CBNotChangeBundle.Caption := MainForm.poWeightSetConfig.bundleCaption;
  CBNotChangePrice.Caption := MainForm.poWeightSetConfig.priceCaption;
  CBNotChangeScale.Caption := MainForm.poWeightSetConfig.scaleCaption;
  CBNotChangeMemo.Caption := MainForm.poWeightSetConfig.memoCaption;
  CBNotChangeBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  CBNotChangeBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  CBNotChangeBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  CBNotChangeBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  CBNotChangeBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  CBNotChangeBackup6.Caption := MainForm.poWeightSetConfig.backup6Caption;
  CBNotChangeBackup7.Caption := MainForm.poWeightSetConfig.backup7Caption;
  CBNotChangeBackup8.Caption := MainForm.poWeightSetConfig.backup8Caption;
  CBNotChangeBackup9.Caption := MainForm.poWeightSetConfig.backup9Caption;
  CBNotChangeBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  CBNotChangeBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  CBNotChangeBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  CBNotChangeBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  CBNotChangeBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;
  CBNotChangeBackup15.Caption := MainForm.poWeightSetConfig.backup15Caption;
  CBNotChangeBackup16.Caption := MainForm.poWeightSetConfig.backup16Caption;
  CBNotChangeBackup17.Caption := MainForm.poWeightSetConfig.backup17Caption;
  CBNotChangeBackup18.Caption := MainForm.poWeightSetConfig.backup18Caption;

  CBNotChangeCar.Checked := myini.ReadBool('formDesign', 'NotChangeCar', True);
  CBNotChangeFaHuo.Checked := myini.ReadBool('formDesign', 'NotChangeFaHuo', False);
  CBNotChangeShouHuo.Checked := myini.ReadBool('formDesign', 'NotChangeShouHuo', False);
  CBNotChangeGoods.Checked := myini.ReadBool('formDesign', 'NotChangeGoods', False);
  CBNotChangeSpec.Checked := myini.ReadBool('formDesign', 'NotChangeSpec', False);
  CBNotChangeBundle.Checked := myini.ReadBool('formDesign', 'NotChangeBundle', False);
  CBNotChangePrice.Checked := myini.ReadBool('formDesign', 'NotChangePrice', False);
  CBNotChangeScale.Checked := myini.ReadBool('formDesign', 'NotChangeScale', False);
  CBNotChangeMemo.Checked := myini.ReadBool('formDesign', 'NotChangeMemo', False);
  CBNotChangeBackup1.Checked := myini.ReadBool('formDesign', 'NotChangeBackup1', False);
  CBNotChangeBackup2.Checked := myini.ReadBool('formDesign', 'NotChangeBackup2', False);
  CBNotChangeBackup3.Checked := myini.ReadBool('formDesign', 'NotChangeBackup3', False);
  CBNotChangeBackup4.Checked := myini.ReadBool('formDesign', 'NotChangeBackup4', False);
  CBNotChangeBackup5.Checked := myini.ReadBool('formDesign', 'NotChangeBackup5', False);
  CBNotChangeBackup6.Checked := myini.ReadBool('formDesign', 'NotChangeBackup6', False);
  CBNotChangeBackup7.Checked := myini.ReadBool('formDesign', 'NotChangeBackup7', False);
  CBNotChangeBackup8.Checked := myini.ReadBool('formDesign', 'NotChangeBackup8', False);
  CBNotChangeBackup9.Checked := myini.ReadBool('formDesign', 'NotChangeBackup9', False);
  CBNotChangeBackup10.Checked := myini.ReadBool('formDesign', 'NotChangeBackup10', False);
  CBNotChangeBackup11.Checked := myini.ReadBool('formDesign', 'NotChangeBackup11', False);
  CBNotChangeBackup12.Checked := myini.ReadBool('formDesign', 'NotChangeBackup12', False);
  CBNotChangeBackup13.Checked := myini.ReadBool('formDesign', 'NotChangeBackup13', False);
  CBNotChangeBackup14.Checked := myini.ReadBool('formDesign', 'NotChangeBackup14', False);
  CBNotChangeBackup15.Checked := myini.ReadBool('formDesign', 'NotChangeBackup15', False);
  CBNotChangeBackup16.Checked := myini.ReadBool('formDesign', 'NotChangeBackup16', False);
  CBNotChangeBackup17.Checked := myini.ReadBool('formDesign', 'NotChangeBackup17', False);
  CBNotChangeBackup18.Checked := myini.ReadBool('formDesign', 'NotChangeBackup18', False);
  Result := True;
end;

function TWeightSetForm.saveNotChange: Boolean;
begin
  //二次过磅不可变更选项
  myini.WriteBool('formDesign', 'NotChangeCar', CBNotChangeCar.Checked);
  myini.WriteBool('formDesign', 'NotChangeFaHuo', CBNotChangeFaHuo.Checked);
  myini.WriteBool('formDesign', 'NotChangeShouHuo', CBNotChangeShouHuo.Checked);
  myini.WriteBool('formDesign', 'NotChangeGoods', CBNotChangeGoods.Checked);
  myini.WriteBool('formDesign', 'NotChangeSpec', CBNotChangeSpec.Checked);
  myini.WriteBool('formDesign', 'NotChangeBundle', CBNotChangeBundle.Checked);
  myini.WriteBool('formDesign', 'NotChangePrice', CBNotChangePrice.Checked);
  myini.WriteBool('formDesign', 'NotChangeScale', CBNotChangeScale.Checked);
  myini.WriteBool('formDesign', 'NotChangeMemo', CBNotChangeMemo.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup1', CBNotChangeBackup1.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup2', CBNotChangeBackup2.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup3', CBNotChangeBackup3.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup4', CBNotChangeBackup4.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup5', CBNotChangeBackup5.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup6', CBNotChangeBackup6.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup7', CBNotChangeBackup7.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup8', CBNotChangeBackup8.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup9', CBNotChangeBackup9.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup10', CBNotChangeBackup10.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup11', CBNotChangeBackup11.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup12', CBNotChangeBackup12.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup13', CBNotChangeBackup13.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup14', CBNotChangeBackup14.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup15', CBNotChangeBackup15.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup16', CBNotChangeBackup16.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup17', CBNotChangeBackup17.Checked);
  myini.WriteBool('formDesign', 'NotChangeBackup18', CBNotChangeBackup18.Checked);

  //二次过磅不可变更选项
  MainForm.poWeightSetConfig.carNotChange := CBNotChangeCar.Checked;
  MainForm.poWeightSetConfig.faHuoNotChange := CBNotChangeFaHuo.Checked;
  MainForm.poWeightSetConfig.shouHuoNotChange := CBNotChangeShouHuo.Checked;
  MainForm.poWeightSetConfig.goodsNotChange := CBNotChangeGoods.Checked;
  MainForm.poWeightSetConfig.specNotChange := CBNotChangeSpec.Checked;
  MainForm.poWeightSetConfig.bundleNotChange := CBNotChangeBundle.Checked;
  MainForm.poWeightSetConfig.priceNotChange := CBNotChangePrice.Checked;
  MainForm.poWeightSetConfig.scaleNotChange := CBNotChangeScale.Checked;
  MainForm.poWeightSetConfig.memoNotChange := CBNotChangeMemo.Checked;
  MainForm.poWeightSetConfig.backup1NotChange := CBNotChangeBackup1.Checked;
  MainForm.poWeightSetConfig.backup2NotChange := CBNotChangeBackup2.Checked;
  MainForm.poWeightSetConfig.backup3NotChange := CBNotChangeBackup3.Checked;
  MainForm.poWeightSetConfig.backup4NotChange := CBNotChangeBackup4.Checked;
  MainForm.poWeightSetConfig.backup5NotChange := CBNotChangeBackup5.Checked;
  MainForm.poWeightSetConfig.backup6NotChange := CBNotChangeBackup6.Checked;
  MainForm.poWeightSetConfig.backup7NotChange := CBNotChangeBackup7.Checked;
  MainForm.poWeightSetConfig.backup8NotChange := CBNotChangeBackup8.Checked;
  MainForm.poWeightSetConfig.backup9NotChange := CBNotChangeBackup9.Checked;
  MainForm.poWeightSetConfig.backup10NotChange := CBNotChangeBackup10.Checked;
  MainForm.poWeightSetConfig.backup11NotChange := CBNotChangeBackup11.Checked;
  MainForm.poWeightSetConfig.backup12NotChange := CBNotChangeBackup12.Checked;
  MainForm.poWeightSetConfig.backup13NotChange := CBNotChangeBackup13.Checked;
  MainForm.poWeightSetConfig.backup14NotChange := CBNotChangeBackup14.Checked;
  MainForm.poWeightSetConfig.backup15NotChange := CBNotChangeBackup15.Checked;
  MainForm.poWeightSetConfig.backup16NotChange := CBNotChangeBackup16.Checked;
  MainForm.poWeightSetConfig.backup17NotChange := CBNotChangeBackup17.Checked;
  MainForm.poWeightSetConfig.backup18NotChange := CBNotChangeBackup18.Checked;
end;

end.
