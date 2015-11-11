unit SoftwareSet;

interface

uses
  Windows, Classes, Controls, Forms, ExtCtrls, ComCtrls, StdCtrls,
  Buttons, Spin, Registry, SysUtils, inifiles, Printers, Dialogs, Mask;

type
  TSoftwareSetForm = class(TForm)
    PCMain: TPageControl;
    TSBase: TTabSheet;
    Panel1: TPanel;
    Label1: TLabel;
    EdtCompany: TEdit;
    Label2: TLabel;
    EdtTel: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TSWeightSet: TTabSheet;
    LEAddr: TLabeledEdit;
    CBPrinter1: TComboBox;
    Label12: TLabel;
    TSWeightSetII: TTabSheet;
    Label7: TLabel;
    LEBackRecord: TLabeledEdit;
    LEReturnZero: TLabeledEdit;
    SEDropDownCount: TSpinEdit;
    LESumPoint: TLabeledEdit;
    Label13: TLabel;
    SESteadyCount: TSpinEdit;
    LETareDiff: TLabeledEdit;
    GBGlideNoRule: TGroupBox;
    Label10: TLabel;
    Label17: TLabel;
    CBGlideCode1: TComboBox;
    EdtGlideLength: TEdit;
    LEMax: TLabeledEdit;
    LEDatabaseAlarm: TLabeledEdit;
    GBTicketType: TGroupBox;
    RBFirstGeneration: TRadioButton;
    RBSecondGeneration: TRadioButton;
    LEPrinterBackRow: TLabeledEdit;
    BtnTestPrinter: TBitBtn;
    Label19: TLabel;
    CBPrinter2: TComboBox;
    TSOther: TTabSheet;
    CBXMLExport: TCheckBox;
    GBXMLType: TGroupBox;
    RBAttr: TRadioButton;
    RBChild: TRadioButton;
    CBAutoShutdown: TCheckBox;
    DTPClose: TDateTimePicker;
    LERange: TLabeledEdit;
    LECompleteHint: TLabeledEdit;
    LEReportTitle: TLabeledEdit;
    LECarOutHint: TLabeledEdit;
    Label20: TLabel;
    CBGlideCode2: TComboBox;
    LESumDivide: TLabeledEdit;
    LEPicCount: TLabeledEdit;
    LEQuanterPoint: TLabeledEdit;
    LEQuanterDivide: TLabeledEdit;
    CBAutoRun: TCheckBox;
    PLogin: TPanel;
    LELoginPass: TLabeledEdit;
    LELoginName: TLabeledEdit;
    LEAutoRefreshInterval: TLabeledEdit;
    LEPicPath: TLabeledEdit;
    RGSimpleMode: TRadioGroup;
    GBSaveType: TGroupBox;
    lblSaveByIntervalHint: TLabel;
    lblSaveByTimeHint: TLabel;
    lblSecond: TLabel;
    lblSaveByQuantityHint: TLabel;
    RBSaveBySteady: TRadioButton;
    RBSaveByTime: TRadioButton;
    SEInterval: TSpinEdit;
    RBSaveByQuantity: TRadioButton;
    LEQuantity: TLabeledEdit;
    RGSumType: TRadioGroup;
    lblVoice: TLabel;
    TBVoiceRate: TTrackBar;
    GBWeightMode: TGroupBox;
    CBStandard: TCheckBox;
    CBSimple: TCheckBox;
    CBOnce: TCheckBox;
    CBSaveAfterReturnZero: TCheckBox;
    LEUpperLimit: TLabeledEdit;
    LELowerLimit: TLabeledEdit;
    LETicketSelHeight: TLabeledEdit;
    LEDisconectCheckCount: TLabeledEdit;
    LEWeightSaveInterval: TLabeledEdit;
    LENotVisibleWeight: TLabeledEdit;
    lblUpdateTime: TLabel;
    EdtMinUpdateTime: TEdit;
    EdtMaxUpdateTime: TEdit;
    Label5: TLabel;
    CBAutoLogin: TCheckBox;
    Label18: TLabel;
    CBPayType: TComboBox;
    lblColorSel: TLabel;
    SpOddColor: TShape;
    SpEvenColor: TShape;
    lblDayStart: TLabel;
    MEDayStart: TMaskEdit;
    LERealPoint: TLabeledEdit;
    GBList: TGroupBox;
    GBFunc: TGroupBox;
    GBWeight: TGroupBox;
    GBOther: TGroupBox;
    GBRecord: TGroupBox;
    CBAutoDropDown: TCheckBox;
    CBAutoComplete: TCheckBox;
    CBEnterAsTab: TCheckBox;
    CBUseCode: TCheckBox;
    CBShowPrepare: TCheckBox;
    CBSay: TCheckBox;
    CBAllowSecondTare: TCheckBox;
    CBAllowSecondGross: TCheckBox;
    CBWriteTare: TCheckBox;
    CBSavePicLocal: TCheckBox;
    CBAutoSavePrepare: TCheckBox;
    CBUseLastTare: TCheckBox;
    CBUseWeightLine: TCheckBox;
    CBVoice: TCheckBox;
    CBBackRecord: TCheckBox;
    CBAutoRefresh: TCheckBox;
    CBUseLog: TCheckBox;
    CBPay: TCheckBox;
    CBRecordLeft: TCheckBox;
    CBUseOutGlideNo: TCheckBox;
    CBUseManualFlag: TCheckBox;
    CBRecordCorrect: TCheckBox;
    CBUseFilterForm: TCheckBox;
    GBPrint: TGroupBox;
    CBPrintTwo: TCheckBox;
    CBShowPrintDialog: TCheckBox;
    CBDefaultPrintPicTicket: TCheckBox;
    CBSelectTicketBeforePrint: TCheckBox;
    CBAllowModifyGlideNo: TCheckBox;
    CBOnlyAllowInvalidNotFinished: TCheckBox;
    CBUseSaveInterval: TCheckBox;
    CBUseTimeOutLimit: TCheckBox;
    CBUseBundleRate: TCheckBox;
    CBTareDiff: TCheckBox;
    CBWeightOneClick: TCheckBox;
    CBPrintAfterSave: TCheckBox;
    CBPrintNet: TCheckBox;
    CBWaitForZero: TCheckBox;
    CBAllowNotSteady: TCheckBox;
    CBAllowModifyPrice: TCheckBox;
    CBUseLast100CarNo: TCheckBox;
    CBAutoUpdateExpression: TCheckBox;
    CBOnlyShowNotFinishedRecord: TCheckBox;
    CBDisconnectToZero: TCheckBox;
    CBDoubleAdd: TCheckBox;
    CBGridOddEvenColor: TCheckBox;
    CBShowSumList: TCheckBox;
    CBShowTotal: TCheckBox;
    CBDelHistory: TCheckBox;
    CBDoubleClickModifyRecord: TCheckBox;
    CBNotAllowTareExceed: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure EdtTelKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CBAutoShutdownClick(Sender: TObject);
    procedure BtnTestPrinterClick(Sender: TObject);
    procedure LEPicPathDblClick(Sender: TObject);
    procedure SpOddColorMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    myini: Tinifile;
  public
    { Public declarations }
    //////////////////////////////////////////
    function loadBasic(): Boolean;
    function writeBasic(): Boolean;
    //////////////////////////////////////////////
    function loadWeightSet(): Boolean;
    function writeWeightSet(): Boolean;
    /////////////////////////////////////////////
    function loadWeightSetII(): Boolean;
    function writeWeightSetII(): Boolean;
    //////////////////////////////////////////////
    function loadCostSet(): Boolean;
    function writeCostSet(): Boolean;
    /////////////////////////////////////////////
    function loadOther(): Boolean;
    function writeOther(): Boolean;
  end;

var
  SoftwareSetForm: TSoftwareSetForm;

implementation

uses Main, MeterConnect1, MeterConnect2, CommonUtil, Graphics, DateUtils;

{$R *.dfm}

procedure TSoftwareSetForm.BitBtn1Click(Sender: TObject);
begin
  writeBasic;
  writeWeightSet;
  writeWeightSetII;
  writeCostSet;
  writeOther;
end;

procedure TSoftwareSetForm.FormShow(Sender: TObject);
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  loadBasic;
  loadWeightSet;
  loadWeightSetII;
  loadCostSet;
  loadOther;
  PCMain.ActivePageIndex := 0
end;

procedure TSoftwareSetForm.BitBtn2Click(Sender: TObject);
begin
  Close
end;

procedure TSoftwareSetForm.EdtTelKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '-', '.', #8]) then
    Key := #0
end;

function TSoftwareSetForm.loadBasic: Boolean;
var i: Integer;
begin
  EdtCompany.Text := myini.ReadString('system_set', 'company', '');
  EdtTel.Text := myini.ReadString('system_set', 'tel', '');

  LEAddr.Text := myini.ReadString('system_set', 'addr', 'A');

  RBFirstGeneration.Checked := myini.ReadInteger('system_set', 'ticket_type', 1) = 1;
  RBSecondGeneration.Checked := myini.ReadInteger('system_set', 'ticket_type', 1) = 2;

  CBPrinter1.Items.Clear; //枚举本地打印机
  CBPrinter2.Items.Clear;

  CBPrinter1.Items := Printer.Printers;
  CBPrinter2.Items := Printer.Printers;
  CBPrinter1.Text := myini.ReadString('system_set', 'printer1', 'Default');
  CBPrinter2.Text := myini.ReadString('system_set', 'printer2', 'Default');

  CBStandard.Checked := myini.ReadBool('system_set', 'use_standard', True);
  CBSimple.Checked := myini.ReadBool('system_set', 'use_simple', False);
  CBOnce.Checked := myini.ReadBool('system_set', 'use_once', False);
end;

function TSoftwareSetForm.loadCostSet: Boolean;
begin

end;

function TSoftwareSetForm.loadWeightSet: Boolean;
var i: Integer;
begin
  CBAutoDropDown.Checked := myini.ReadBool('system_set', 'autoDropDown', False);
  //自动补全列表框
  CBAutoComplete.Checked := myini.ReadBool('system_set', 'autoComplete', False);
  CBEnterAsTab.Checked := myini.ReadBool('system_set', 'enterAsTab', True);
  //每次过磅之后要回零才能再次输入车号
  CBWaitForZero.Checked := myini.ReadBool('system_set', 'waitForZero', False);
  CBUseBundleRate.Checked := myini.ReadBool('system_set', 'useBundleRate', False);
  CBDelHistory.Checked := myini.ReadBool('system_set', 'delHistory', False);
  CBAllowSecondTare.Checked := myini.ReadBool('system_set', 'allowSecondTare', False);
  CBAllowSecondGross.Checked := myini.ReadBool('system_set', 'allowSecondGross', False);
  //每次过空车时自动预置车皮
  CBWriteTare.Checked := myini.ReadBool('system_set', 'autoWriteTare', False);
  //发货单位,收货单位等信息用代码输入
  CBUseCode.Checked := myini.ReadBool('system_set', 'useCode', False);
  //不稳定保存
  CBAllowNotSteady.Checked := myini.ReadBool('system_set', 'allowNotSteady', False);
  CBShowPrepare.Checked := myini.ReadBool('system_set', 'showPrepare', False);
  CBVoice.Checked := myini.ReadBool('system_set', 'useVoice', False);
  //后台自动保存的最小重量
  LEBackRecord.Text := myini.ReadString('system_set', 'back_record_weight', '1000');
  //每次称重打印时选择磅单
  CBSelectTicketBeforePrint.Checked := myini.ReadBool('system_set', 'selectTicketBeforePrint', False);
  //皮重超差预警
  CBTareDiff.Checked := myini.ReadBool('system_set', 'useTareDiff', False);
  //是否启用扣费功能
  CBPay.Checked := myini.ReadBool('system_set', 'pay', False);
  //图片存放在本地
  CBSavePicLocal.Checked := myini.ReadBool('system_set', 'savePicLocal', True);
  //过毛重时提示是否使用上次皮重
  CBUseLastTare.Checked := myini.ReadBool('system_set', 'useLastTare', False);
  //自动保存预置信息
  CBAutoSavePrepare.Checked := myini.ReadBool('system_set', 'auto_save_prepare', True);
  //开启重量曲线
  CBUseWeightLine.Checked := myini.ReadBool('system_set', 'use_weight_line', False);
  //允许修改预置信息带出的单价和折方系数
  CBAllowModifyPrice.Checked := myini.ReadBool('system_set', 'allow_modify_price', True);
  //自动过磅模式下保存后自动打印
  CBPrintAfterSave.Checked := myini.ReadBool('system_set', 'print_after_save', False);
  //启用超时限制
  CBUseTimeoutLimit.Checked := myini.ReadBool('system_set', 'use_timeout_limit', False);
  //预置下拉车号使用最近100次的车号
  CBUseLast100CarNo.Checked := myini.ReadBool('system_set', 'use_last_100_carNo', False);
  //启用超时限制
  CBUseTimeoutLimit.Checked := myini.ReadBool('system_set', 'use_timeout_limit', False);
  //联网时自动刷新数据
  CBAutoRefresh.Checked := myini.ReadBool('system_set', 'auto_refresh', False);
  //点称重后立即保存
  CBWeightOneClick.Checked := myini.ReadBool('system_set', 'weight_one_click', False);
  //显示合计信息
  CBShowTotal.Checked := myini.ReadBool('system_set', 'show_total', True);
  //仪表断线归零
  CBDisconnectToZero.Checked := myini.ReadBool('system_set', 'disconnect_to_zero', False);
  //记录剩余量
  CBRecordLeft.Checked := myini.ReadBool('system_set', 'record_left', False);
  //使用出厂流水号
  CBUseOutGlideNo.Checked := myini.ReadBool('system_set', 'use_out_glide_no', False);
  //列表过滤框
  CBUseFilterForm.Checked := myini.ReadBool('system_set', 'use_filter_form', False);
  //打印机选择对话框
  CBShowPrintDialog.Checked := myini.ReadBool('system_set', 'show_print_dialog', False);
  //启用重复过磅时间限制
  CBUseSaveInterval.Checked := myini.ReadBool('system_set', 'use_save_interval', False);
  //双仪表累加
  CBDoubleAdd.Checked := myini.ReadBool('system_set', 'double_add', False);
  //同时在两台打印机打印
  CBPrintTwo.Checked := myini.ReadBool('system_set', 'print_two', False);
  //启用系统日志
  CBUseLog.Checked := myini.ReadBool('system_set', 'use_log', True);
  //只允许作废未完成记录
  CBOnlyAllowInvalidNotFinished.Checked := myini.ReadBool('system_set',
    'only_allow_invalid_not_finished', False);
  //允许修改流水号
  CBAllowModifyGlideNo.Checked := myini.ReadBool('system_set', 'allow_modify_glideNo', False);
  //使用补单标志
  CBUseManualFlag.Checked := myini.ReadBool('system_set', 'use_manual_flag', False);
  //默认打印图形磅单
  CBDefaultPrintPicTicket.Checked := myini.ReadBool('system_set', 'default_print_pic_ticket', False);
  //实时更新自定义公式
  CBAutoUpdateExpression.Checked := myini.ReadBool('system_set', 'auto_update_expression', False);
  //记录修正量
  CBRecordCorrect.Checked := myini.ReadBool('system_set', 'record_correct', False);
  //列表双击弹出未完成记录
  CBOnlyShowNotFinishedRecord.Checked := myini.ReadBool('system_set', 'only_show_not_finished_record', False);
  //列表单双行颜色区分
  CBGridOddEvenColor.Checked := myini.ReadBool('system_set', 'grid_odd_even_color', False);
  //显示合计行
  CBShowSumList.Checked := myini.ReadBool('system_set', 'show_sum_list', True);
  //双击修改称重界面列表记录
  CBDoubleClickModifyRecord.Checked := myini.ReadBool('system_set', 'double_click_modify_record', False);
  //不允许过皮超过预置皮重
  CBNotAllowTareExceed.Checked := myini.ReadBool('system_set', 'not_allow_tare_exceed', False);
end;

function TSoftwareSetForm.writeBasic: Boolean;
begin
  //公司信息
  myini.WriteString('system_set', 'company', EdtCompany.Text);
  myini.WriteString('system_set', 'tel', EdtTel.Text);
  MainForm.systemConfig.company := EdtCompany.Text;
  MainForm.systemConfig.tel := EdtTel.Text;
  MainForm.setCompanyInfo;

  //打印机
  myini.WriteString('system_set', 'printer1', CBPrinter1.Text);
  MainForm.systemConfig.printer1 := CBPrinter1.Text;
  myini.WriteString('system_set', 'printer2', CBPrinter2.Text);
  MainForm.systemConfig.printer2 := CBPrinter2.Text;

  myini.WriteString('system_set', 'addr', LEAddr.Text);
  MainForm.systemConfig.addr := LEAddr.Text;

  if RBFirstGeneration.Checked then
  begin
    myini.WriteInteger('system_set', 'ticket_type', 1);
    MainForm.systemConfig.ticketType := 1;
  end
  else if RBSecondGeneration.Checked then
  begin
    myini.WriteInteger('system_set', 'ticket_type', 2);
    MainForm.systemConfig.ticketType := 2;
  end;

  myini.WriteBool('system_set', 'use_standard', CBStandard.Checked);
  myini.WriteBool('system_set', 'use_simple', CBSimple.Checked);
  myini.WriteBool('system_set', 'use_once', CBOnce.Checked);
  MainForm.systemConfig.useStandard := CBStandard.Checked;
  MainForm.systemConfig.useSimple := CBSimple.Checked;
  MainForm.systemConfig.useOnce := CBOnce.Checked;
  MainForm.FrmWeight1.RBStandard.Enabled := CBStandard.Checked;
  MainForm.FrmWeight1.RBSimple.Enabled := CBSimple.Checked;
  MainForm.FrmWeight1.RBOnce.Enabled := CBOnce.Checked;
end;

function TSoftwareSetForm.writeCostSet: Boolean;
begin
{
  //过磅费设置
  MainForm.systemConfig.usePound := CBUsePound.Checked;
  myini.WriteBool('system_set', 'useCost', CBUsePound.Checked);
  MainForm.systemConfig.BasicPound := StrToFloat(EdtInitial.Text);
  myini.WriteString('system_set', 'initCost', EdtInitial.Text);
  MainForm.systemConfig.UnitPound1 := StrToFloat(EdtUnit.Text);
  myini.WriteString('system_set', 'unitCost1', EdtUnit.Text);
  MainForm.systemConfig.UnitPound2 := StrToFloat(EdtUnit2.Text);
  myini.WriteString('system_set', 'unitCost2', EdtUnit2.Text);
  MainForm.systemConfig.ManualInputPound := CBManualInput.Checked;
  MainForm.FrmWeight1.EdtCost.Enabled := CBManualInput.Checked;
  myini.WriteBool('system_set', 'manualInputCost', CBManualInput.Checked);
  MainForm.systemConfig.poundGrade1 := StrToFloatDef(EdtPound1.Text, 500);
  MainForm.systemConfig.poundGrade2 := StrToFloatDef(EdtPound2.Text, 10000);
  MainForm.systemConfig.poundGrade3 := StrToFloatDef(EdtPound3.Text, 10000);
  MainForm.systemConfig.poundGrade4 := StrToFloatDef(EdtPound4.Text, 100000);
  MainForm.systemConfig.poundGrade5 := StrToFloatDef(EdtPound5.Text, 100000);
  MainForm.systemConfig.poundGrade6 := StrToFloatDef(EdtPound6.Text, 120000);
  myini.WriteString('system_set', 'grade1', EdtPound1.Text);
  myini.WriteString('system_set', 'grade2', EdtPound2.Text);
  myini.WriteString('system_set', 'grade3', EdtPound3.Text);
  myini.WriteString('system_set', 'grade4', EdtPound4.Text);
  myini.WriteString('system_set', 'grade5', EdtPound5.Text);
  myini.WriteString('system_set', 'grade6', EdtPound6.Text);

  if RBGross.Checked then
  begin
    MainForm.systemConfig.ChargeType := 1; //毛重计费
    myini.WriteInteger('system_set', 'costType', 1);
  end
  else if RBTwo.Checked then
  begin
    MainForm.systemConfig.ChargeType := 2; //毛重+皮重计费
    myini.WriteInteger('system_set', 'costType', 2);
  end
  else if RBNet.Checked then
  begin
    MainForm.systemConfig.ChargeType := 3; //净重计费
    myini.WriteInteger('system_set', 'costType', 3);
  end;
  myini.WriteInteger('system_set', 'point', StrToInt(LEPoint.Text));
  MainForm.systemConfig.scalePoint := StrToIntDef(LEPoint.Text, 0);
}
end;

function TSoftwareSetForm.writeWeightSet: Boolean;
begin
  //称重设置
  myini.WriteBool('system_set', 'autoDropDown', CBAutoDropDown.Checked);
  myini.WriteBool('system_set', 'enterAsTab', CBEnterAsTab.Checked);
  //自动下拉
  MainForm.FrmWeight1.CBCar.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBFaHuo.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBShouHuo.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBGoods.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBSpec.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup1.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup2.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup3.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup4.AutoDropDown := CBAutoDropDown.Checked;
  MainForm.FrmWeight1.CBBackup5.AutoDropDown := CBAutoDropDown.Checked;

  MainForm.systemConfig.EnterTab := CBEnterAsTab.Checked;
  //自动补全列表框
  myini.WriteBool('system_set', 'autoComplete', CBAutoComplete.Checked);
  MainForm.FrmWeight1.CBCar.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBFaHuo.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBShouHuo.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBGoods.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBSpec.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup1.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup2.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup3.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup4.AutoComplete := CBAutoComplete.Checked;
  MainForm.FrmWeight1.CBBackup5.AutoComplete := CBAutoComplete.Checked;
  //自动删除今天之前的历史记录
  myini.WriteBool('system_set', 'delHistory', CBDelHistory.Checked);
  //自动用鼠标来选择车号,货名等信息
  myini.WriteBool('system_set', 'showPrepare', CBShowPrepare.Checked);
  MainForm.systemConfig.ShowPrepare := CBShowPrepare.Checked;
  //是否允许二次过皮
  myini.WriteBool('system_set', 'allowSecondTare', CBAllowSecondTare.Checked);
  MainForm.systemConfig.AllowSecondTare := CBAllowSecondTare.Checked;
  //是否允许二次过毛
  myini.WriteBool('system_set', 'allowSecondGross', CBAllowSecondGross.Checked);
  MainForm.systemConfig.AllowSecondGross := CBAllowSecondGross.Checked;
  //每次过磅之后要回零才能再次输入车号
  myini.WriteBool('system_set', 'waitForZero', CBWaitForZero.Checked);
  MainForm.systemConfig.waitForZero := CBWaitForZero.Checked;
  myini.WriteBool('system_set', 'useBundleRate', CBUseBundleRate.Checked);
  MainForm.systemConfig.useBundleRate := CBUseBundleRate.Checked;
  //每次过空车时自动预置车皮
  myini.WriteBool('system_set', 'autoWriteTare', CBWriteTare.Checked);
  mainForm.systemConfig.autoWriteTare := CBWriteTare.Checked;
  //发货单位,收货单位等信息用代码输入
  myini.WriteBool('system_set', 'useCode', CBUseCode.Checked);
  MainForm.systemConfig.useCode := CBUseCode.Checked;
  //允许不稳定时也能保存重量
  myini.WriteBool('system_set', 'allowNotSteady', CBAllowNotSteady.Checked);
  MainForm.systemConfig.allowNotSteady := CBAllowNotSteady.Checked;
  myini.WriteBool('system_set', 'useVoice', CBVoice.Checked);
  MainForm.systemConfig.UseVoice := CBVoice.Checked;
  //打印时选择磅单
  myini.WriteBool('system_set', 'selectTicketBeforePrint', CBSelectTicketBeforePrint.Checked);
  MainForm.systemConfig.selectTicketBeforePrint := CBSelectTicketBeforePrint.Checked;
  //皮重超差预警
  myini.WriteBool('system_set', 'useTareDiff', CBTareDiff.Checked);
  MainForm.systemConfig.useTareDiff := CBTareDiff.Checked;
  //是否启用扣费功能
  myini.WriteBool('system_set', 'pay', CBPay.Checked);
  MainForm.systemConfig.usePay := CBPay.Checked;
  //图片存放在本地
  myini.WriteBool('system_set', 'savePicLocal', CBSavePicLocal.Checked);
  MainForm.systemConfig.savePicLocal := CBSavePicLocal.Checked;
  //过毛重时提示是否使用上次皮重
  myini.WriteBool('system_set', 'useLastTare', CBUseLastTare.Checked);
  MainForm.systemConfig.useLastTare := CBUseLastTare.Checked;
  //自动保存预置信息
  myini.WriteBool('system_set', 'auto_save_prepare', CBAutoSavePrepare.Checked);
  MainForm.systemConfig.autoSavePrepare := CBAutoSavePrepare.Checked;
  //开启重量曲线
  myini.WriteBool('system_set', 'use_weight_line', CBUseWeightLine.Checked);
  MainForm.systemConfig.useWeightLine := CBUseWeightLine.Checked;
  //后台自动保存的最小重量
  myini.WriteString('system_set', 'back_record_weight', LEBackRecord.Text);
  MainForm.systemConfig.backRecordWeight := StrToFloatDef(LEBackRecord.Text, 1000);
  //允许修改预置信息带出的单价和折方系数
  myini.WriteBool('system_set', 'allow_modify_price', CBAllowModifyPrice.Checked);
  MainForm.systemConfig.allowModifyPrice := CBAllowModifyPrice.Checked;
  MainForm.FrmWeight1.EdtPrice.ReadOnly := not CBAllowModifyPrice.Checked;
  MainForm.FrmWeight1.EdtScale.ReadOnly := not CBAllowModifyPrice.Checked;
  //自动过磅模式下保存后自动打印
  myini.WriteBool('system_set', 'print_after_save', CBPrintAfterSave.Checked);
  MainForm.systemConfig.printAfterSave := CBPrintAfterSave.Checked; ;
  //启用超时限制
  myini.WriteBool('system_set', 'use_timeout_limit', CBUseTimeoutLimit.Checked);
  MainForm.systemConfig.useTimeOutLimit := CBUseTimeoutLimit.Checked;
  //预置下拉车号使用最近100次的车号
  myini.WriteBool('system_set', 'use_last_100_carNo', CBUseLast100CarNo.Checked);
  MainForm.systemConfig.useLast100CarNo := CBUseLast100CarNo.Checked;
  //启用超时限制
  myini.WriteBool('system_set', 'use_timeout_limit', CBUseTimeoutLimit.Checked);
  MainForm.systemConfig.useTimeOutLimit := CBUseTimeoutLimit.Checked;
  //联网时自动刷新数据
  myini.WriteBool('system_set', 'auto_refresh', CBAutoRefresh.Checked);
  MainForm.systemConfig.autoRefresh := CBAutoRefresh.Checked;
  //点称重后立即保存
  myini.WriteBool('system_set', 'weight_one_click', CBWeightOneClick.Checked);
  MainForm.systemConfig.weightOneClick := CBWeightOneClick.Checked;
  //显示合计信息
  myini.WriteBool('system_set', 'show_total', CBShowTotal.Checked);
  MainForm.systemConfig.showTotal := CBShowTotal.Checked;
  //仪表断线归零
  myini.WriteBool('system_set', 'disconnect_to_zero', CBDisconnectToZero.Checked);
  MainForm.systemConfig.disconnectToZero := CBDisconnectToZero.Checked;
  //记录剩余量
  myini.WriteBool('system_set', 'record_left', CBRecordLeft.Checked);
  MainForm.systemConfig.recordLeft := CBRecordLeft.Checked;
  //使用出厂流水号
  myini.WriteBool('system_set', 'use_out_glide_no', CBUseOutGlideNo.Checked);
  MainForm.systemConfig.useOutGlideNo := CBUseOutGlideNo.Checked;
  //列表过滤框
  myini.WriteBool('system_set', 'use_filter_form', CBUseFilterForm.Checked);
  MainForm.systemConfig.useFilterForm := CBUseFilterForm.Checked;
  //打印机选择对话框
  myini.WriteBool('system_set', 'show_print_dialog', CBShowPrintDialog.Checked);
  MainForm.systemConfig.showPrintDialog := CBShowPrintDialog.Checked;
  //启用重复过磅时间限制
  myini.WriteBool('system_set', 'use_save_interval', CBUseSaveInterval.Checked);
  MainForm.systemConfig.useSaveInterval := CBUseSaveInterval.Checked;
  //双仪表累加
  myini.WriteBool('system_set', 'double_add', CBDoubleAdd.Checked);
  MainForm.systemConfig.doubleAdd := CBDoubleAdd.Checked;
  //同时在两台打印机打印
  myini.WriteBool('system_set', 'print_two', CBPrintTwo.Checked);
  MainForm.systemConfig.printTwo := CBPrintTwo.Checked;
  //启用系统日志
  myini.WriteBool('system_set', 'use_log', CBUseLog.Checked);
  MainForm.systemConfig.useLog := CBUseLog.Checked;
  //只允许作废未完成记录
  myini.WriteBool('system_set', 'only_allow_invalid_not_finished',
    CBOnlyAllowInvalidNotFinished.Checked);
  MainForm.systemConfig.onlyAllowInvalidNotFinished := CBOnlyAllowInvalidNotFinished.Checked;
  //允许修改流水号
  myini.WriteBool('system_set', 'allow_modify_glideNo', CBAllowModifyGlideNo.Checked);
  MainForm.systemConfig.allowModifyGlideNo := CBAllowModifyGlideNo.Checked;
  //使用补单标志
  myini.WriteBool('system_set', 'use_manual_flag', CBUseManualFlag.Checked);
  MainForm.systemConfig.useManualFlag := CBUseManualFlag.Checked;
  //默认打印图形磅单
  myini.WriteBool('system_set', 'default_print_pic_ticket', CBDefaultPrintPicTicket.Checked);
  MainForm.systemConfig.defaultPrintPicTicket := CBDefaultPrintPicTicket.Checked;
  //实时更新自定义公式
  myini.WriteBool('system_set', 'auto_update_expression', CBAutoUpdateExpression.Checked);
  MainForm.systemConfig.autoUpdateExpression := CBAutoUpdateExpression.Checked;
  //记录修正量
  myini.WriteBool('system_set', 'record_correct', CBRecordCorrect.Checked);
  MainForm.systemConfig.recordCorrect := CBRecordCorrect.Checked;
  //列表双击弹出未完成记录
  myini.WriteBool('system_set', 'only_show_not_finished_record', CBOnlyShowNotFinishedRecord.Checked);
  MainForm.systemConfig.onlyShowNotFinishedRecord := CBOnlyShowNotFinishedRecord.Checked;
  //显示合计行
  myini.WriteBool('system_set', 'show_sum_list', CBShowSumList.Checked);
  MainForm.systemConfig.showSumList := CBShowSumList.Checked;
  //双击修改称重界面列表记录
  myini.WriteBool('system_set', 'double_click_modify_record', CBDoubleClickModifyRecord.Checked);
  MainForm.systemConfig.doubleClickModifyRecord := CBDoubleClickModifyRecord.Checked;
  //不允许过皮超过预置皮重
  myini.WriteBool('system_set', 'not_allow_tare_exceed', CBNotAllowTareExceed.Checked);
  MainForm.systemConfig.notAllowTareExceed := CBNotAllowTareExceed.Checked;

end;

procedure TSoftwareSetForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  myini.Free;
end;

function TSoftwareSetForm.loadWeightSetII: Boolean;
begin
  //流水号规则
  CBGlideCode1.ItemIndex := myini.ReadInteger('system_set', 'glide_code1', 1);
  CBGlideCode2.ItemIndex := myini.ReadInteger('system_set', 'glide_code2', 1);
  EdtGlideLength.Text := myini.ReadString('system_set', 'glide_length', '4');
  SEDropDownCount.Value := myini.ReadInteger('system_set', 'dropDownCount', 10);
  LEReturnZero.Text := myini.ReadString('system_set', 'returnZero', '100');
  //数据打印报表抬头
  LEReportTitle.Text := myini.ReadString('system_set', 'dataReportTitle', '数据报表');
  //金额小数点位数
  LESumDivide.Text := myini.ReadString('system_set', 'sumDivide', '1');
  LESumPoint.Text := myini.ReadString('system_set', 'sumPoint', '0');
  LEQuanterDivide.Text := myini.ReadString('system_set', 'quanterDivide', '1');
  LEQuanterPoint.Text := myini.ReadString('system_set', 'quanterPoint', '2');
  LERealPoint.Text := myini.ReadString('system_set', 'real_point', '2');
  //稳定次数
  SESteadyCount.Value := myini.ReadInteger('system_set', 'steadyCount', 2);
  LETareDiff.Text := myini.ReadString('system_set', 'tareDiff', '5');
  //二次过磅超时时间设置
  EdtMinUpdateTime.Text := myini.ReadString('system_set', 'min_update_time', '0');
  EdtMaxUpdateTime.Text := myini.ReadString('system_set', 'max_update_time', '12000');
  //最大量程
  LEMax.Text := myini.ReadString('system_set', 'max', '150000');
  //启用后台数据记录
  CBBackRecord.Checked := myini.ReadBool('system_set', 'backRecord', False);
  LEDatabaseAlarm.Text := myini.ReadString('system_set', 'database_alarm_value', '2048');
  //播报输入框内容
  CBSay.Checked := myini.ReadBool('system_set', 'say', False);
  //语音播报速度
  TBVoiceRate.Position := myini.ReadInteger('system_set', 'voice_rate', 0);
  //打印机退纸行数
  LEPrinterBackRow.Text := myini.ReadString('system_set', 'printerBackRow', '0');
  //波动范围
  LERange.Text := myini.ReadString('system_set', 'range', '20');
  //只允许打印完成记录
  CBPrintNet.Checked := myini.ReadBool('system_set', 'print_net', False);
  //自动过磅语音提示
  LECompleteHint.Text := myini.ReadString('system_set', 'complete_hint', '取重完成请下称');
  LECarOutHint.Text := myini.ReadString('system_set', 'car_out_hint', '车辆已下秤');
  //存放数据库图片数量限制
  LEPicCount.Text := myini.ReadString('system_set', 'pic_count', '2000');
  //扣费方式
  RGSumType.ItemIndex := myini.ReadInteger('system_set', 'sum_type', 1);
  CBPayType.Items.Clear;
  CBPayType.Items.Add('金额');
  CBPayType.Items.Add('实重');
  CBPayType.Items.Add('方量');
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup6Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup7Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup8Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup9Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup15Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup16Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup17Caption);
  CBPayType.Items.Add(MainForm.poWeightSetConfig.backup18Caption);
  CBPayType.ItemIndex := myini.ReadInteger('system_set', 'pay_type', 0);
  //过磅图片路径
  LEPicPath.Text := myini.ReadString('system_set', 'pic_path',
    ExtractFilePath(ParamStr(0)) + '\WeightImg\');
  //简单过磅第一次过毛或者过皮
  RGSimpleMode.ItemIndex := myini.ReadInteger('system_set', 'simple_mode', 0);
  //自动刷新频率
  LEAutoRefreshInterval.Text := myini.ReadString('system_set', 'auto_refresh_interval', '60');
  //仪表断线检测次数
  LEDisconectCheckCount.Text := myini.ReadString('system_set', 'disconnect_check_count', '10');
  //两次数据保存间隔
  LEWeightSaveInterval.Text := myini.ReadString('system_set', 'weight_save_interval', '0');
  //不可视重量
  LENotVisibleWeight.Text := myini.ReadString('system_set', 'not_visible_weight', '150000');
  //列表单双行颜色
  SpOddColor.Brush.Color := myini.ReadInteger('system_set', 'odd_color', clBtnFace);
  SpEvenColor.Brush.Color := myini.ReadInteger('system_set', 'even_color', clBtnFace);
  //每日起始时间
  MEDayStart.Text := myini.ReadString('system_set', 'day_start', '00:00:00');
end;

function TSoftwareSetForm.writeWeightSetII: Boolean;
begin
  myini.WriteInteger('system_set', 'glide_code1', CBGlideCode1.ItemIndex);
  myini.WriteInteger('system_set', 'glide_code2', CBGlideCode2.ItemIndex);
  myini.WriteString('system_set', 'glide_length', EdtGlideLength.Text);
  MainForm.systemConfig.glideCode1 := CBGlideCode1.ItemIndex;
  MainForm.systemConfig.glideCode2 := CBGlideCode2.ItemIndex;
  MainForm.systemConfig.glideLength := StrToIntDef(EdtGlideLength.Text, 6);

  myini.Writeinteger('system_set', 'dropDownCount', SEDropDownCount.Value);
  //下拉项目
  MainForm.FrmWeight1.CBCar.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBFaHuo.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBShouHuo.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBGoods.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBSpec.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup1.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup2.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup3.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup4.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup5.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup10.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup11.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup12.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup13.DropDownCount := SEDropDownCount.Value;
  MainForm.FrmWeight1.CBBackup14.DropDownCount := SEDropDownCount.Value;
  myini.WriteFloat('system_set', 'returnZero', StrToFloatDef(LEReturnZero.Text,
    0));
  MainForm.systemConfig.ReturnZero := StrToFloatDef(LEReturnZero.Text, 100);

  //数据打印报表抬头
  myini.WriteString('system_set', 'dataReportTitle', LEReportTitle.Text);
  MainForm.systemConfig.dataReportTitle := LEReportTitle.Text;
  //金额小数点位数
  myini.WriteInteger('system_set', 'sumDivide', StrToIntDef(LESumDivide.Text, 1));
  MainForm.systemConfig.sumDivide := StrToIntDef(LESumDivide.Text, 1);
  myini.WriteString('system_set', 'sumPoint', LESumPoint.Text);
  MainForm.systemConfig.sumPoint := StrToIntDef(LESumPoint.Text, 0);

  myini.WriteString('system_set', 'quanterDivide', LEQuanterDivide.Text);
  MainForm.systemConfig.quanterDivide := StrToIntDef(LEQuanterDivide.Text, 1);
  myini.WriteString('system_set', 'quanterPoint', LEQuanterPoint.Text);
  MainForm.systemConfig.quanterPoint := StrToIntDef(LEQuanterPoint.Text, 2);

  myini.WriteString('system_set', 'real_point', LERealPoint.Text);
  MainForm.systemConfig.realPoint := StrToIntDef(LERealPoint.Text, 2);

  //稳定次数
  myini.WriteInteger('system_set', 'steadyCount', SESteadyCount.Value);
  MainForm.systemConfig.steadyCount := SESteadyCount.Value;
  //皮重超差
  myini.WriteFloat('system_set', 'tareDiff', StrToFloatDef(LETareDiff.Text, 0));
  MainForm.systemConfig.tareDiff := StrToFloatDef(LETareDiff.Text, 0);
  //二次过磅超时时间设置
  myini.WriteInteger('system_set', 'min_update_time', StrToIntDef(EdtMinUpdateTime.Text, 0));
  myini.WriteInteger('system_set', 'max_update_time', StrToIntDef(EdtMaxUpdateTime.Text, 12000));
  MainForm.systemConfig.minUpdateTime := StrToIntDef(EdtMinUpdateTime.Text, 0);
  MainForm.systemConfig.maxUpdateTime := StrToIntDef(EdtMaxUpdateTime.Text, 12000);
  //最大量程
  myini.WriteFloat('system_set', 'max', StrToFloatDef(LEMax.Text, 200000));
  MainForm.systemConfig.max := StrToFloatDef(LEMax.Text, 200000);
  //启用后台数据记录
  myini.WriteBool('system_set', 'backRecord', CBBackRecord.Checked);
  MainForm.systemConfig.useBackRecord := CBBackRecord.Checked;
  //数据库超限报警
  myini.WriteFloat('system_set', 'database_alarm_value', StrToFloatDef(LEDatabaseAlarm.Text, 1024));
  MainForm.systemConfig.databaseAlarm := StrToFloatDef(LEDatabaseAlarm.Text, 1024);
  //播报输入框内容
  myini.WriteBool('system_set', 'say', CBSay.Checked);
  MainForm.systemConfig.sayCombo := CBSay.Checked;
  //语音播报速度
  myini.WriteInteger('system_set', 'voice_rate', TBVoiceRate.Position);
  MainForm.setVoiceRate(TBVoiceRate.Position);
  //打印机退纸行数
  myini.WriteInteger('system_set', 'printerBackRow', StrToIntDef(LEPrinterBackRow.Text, 0));
  MainForm.systemConfig.printerBackRow := StrToIntDef(LEPrinterBackRow.Text, 0);
  //波动范围
  myini.WriteFloat('system_set', 'range', StrToFloatDef(LERange.Text, 20));
  MainForm.systemConfig.range := StrToFloatDef(LERange.Text, 20);
  //只允许打印完成记录
  myini.WriteBool('system_set', 'print_net', CBPrintNet.Checked);
  MainForm.systemConfig.printNet := CBPrintNet.Checked;
  //自动过磅语音提示
  myini.WriteString('system_set', 'complete_hint', LECompleteHint.Text);
  MainForm.systemConfig.completeHint := LECompleteHint.Text;
  myini.WriteString('system_set', 'car_out_hint', LECarOutHint.Text);
  MainForm.systemConfig.carOutHint := LECarOutHint.Text;
  //存放数据库图片数量限制
  myini.WriteInteger('system_set', 'pic_count', StrToIntDef(LEPicCount.Text, 2000));
  MainForm.systemConfig.picCount := StrToIntDef(LEPicCount.Text, 2000);
  //过磅图片路径
  if not DirectoryExists(LEPicPath.Text) then
  begin
    if not ForceDirectories(LEPicPath.Text) then
      LEPicPath.Text := ExtractFilePath(ParamStr(0)) + 'WeightImg\';
  end;
  myini.WriteString('system_set', 'pic_path', LEPicPath.Text);
  MainForm.systemConfig.picPath := LEPicPath.Text;
  //简单过磅第一次过毛或者过皮
  myini.WriteInteger('system_set', 'simple_mode', RGSimpleMode.ItemIndex);
  MainForm.systemConfig.simpleMode := RGSimpleMode.ItemIndex;
  //自动刷新频率
  myini.WriteInteger('system_set', 'auto_refresh_interval', StrToIntDef(LEAutoRefreshInterval.Text, 60));
  MainForm.systemConfig.autoRefreshInterval := StrToIntDef(LEAutoRefreshInterval.Text, 60) * 1000;
  //仪表断线检测次数
  myini.WriteInteger('system_set', 'disconnect_check_count', StrToIntDef(LEDisconectCheckCount.Text, 10));
  MainForm.systemConfig.disconnectCheckCount := StrToIntDef(LEDisconectCheckCount.Text, 10);
  //两次数据保存间隔
  myini.WriteString('system_set', 'weight_save_interval', LEWeightSaveInterval.Text);
  MainForm.systemConfig.weightSaveInterval := StrToIntDef(LEWeightSaveInterval.Text, 0);
  //不可视重量
  myini.WriteString('system_set', 'not_visible_weight', LENotVisibleWeight.Text);
  MainForm.systemConfig.notVisibleWeight := StrToFloatDef(LENotVisibleWeight.Text, 150000);
  //列表单双行颜色
  myini.WriteInteger('system_set', 'odd_color', SpOddColor.Brush.Color);
  myini.WriteInteger('system_set', 'even_color', SpEvenColor.Brush.Color);
  MainForm.systemConfig.oddColor := SpOddColor.Brush.Color;
  MainForm.systemConfig.evenColor := SpEvenColor.Brush.Color;
  //列表单双行颜色区分
  myini.WriteBool('system_set', 'grid_odd_even_color', CBGridOddEvenColor.Checked);
  MainForm.systemConfig.gridOddEvenColor := CBGridOddEvenColor.Checked;
  //每日起始时间
  myini.WriteString('system_set', 'day_start', MEDayStart.Text);
  MainForm.systemConfig.dayStart := MEDayStart.Text;
  MainForm.systemConfig.dayStartDiff :=
    SecondsBetween(StrToTime(MainForm.systemConfig.dayStart), StrToTime('00:00:00'));
end;

function TSoftwareSetForm.loadOther: Boolean;
begin
  CBAutoRun.Checked := myini.ReadBool('system_set', 'autoRun', False);

  CBXMLExport.Checked := myini.ReadBool('system_set', 'export_XML', False);
  RBAttr.Checked := myini.Readinteger('system_set', 'XML_type', 0) = 0;

  case myini.ReadInteger('system_set', 'save_by_steady', 0) of
    0: RBSaveBySteady.Checked := True;
    1: RBSaveByTime.Checked := True;
    2: RBSaveByQuantity.Checked := True;
  else
    RBSaveByQuantity.Checked := True;
  end;
  SEInterval.Value := myini.ReadInteger('system_set', 'save_interval', 5);
  LEQuantity.Text := myini.ReadString('system_set', 'save_quantity', '10000');
  CBSaveAfterReturnZero.Checked := myini.ReadBool('system_set', 'save_after_return_zero', False);
  LEUpperLimit.Text := myini.ReadString('system_set', 'upper_limit', '10');
  LELowerLimit.Text := myini.ReadString('system_set', 'lower_limit', '10');

  LETicketSelHeight.Text := myini.ReadString('system_set', 'ticket_sel_height', '25');

  CBAutoLogin.Checked := myini.ReadBool('system_set', 'auto_login', False);
  LELoginName.Text := myini.ReadString('system_set', 'login_name', '');
  LELoginPass.Text := TCommonUtil.deBase64AndDecompress(
    myini.ReadString('system_set', 'login_pass', 'eJwDAAAAAAE='));
end;

function TSoftwareSetForm.writeOther: Boolean;
begin
  //开机自动运行
  with TRegistry.Create do
  begin
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Microsoft\Windows\CurrentVersion\Run', False);
    if CBAutoRun.Checked and (not ValueExists('weight')) then
      WriteString('weight', Application.ExeName)
    else if ValueExists('weight') then
      DeleteValue('weight');
    CloseKey
  end;
  myini.WriteBool('system_set', 'autoRun', CBAutoRun.Checked);

  //导出XML
  myini.WriteBool('system_set', 'export_XML', CBXMLExport.Checked);
  if RBAttr.Checked then
    myini.Writeinteger('system_set', 'XML_type', 0)
  else if RBChild.Checked then
    myini.Writeinteger('system_set', 'XML_type', 1);

  //自动关机
  if CBAutoShutdown.Checked then
  begin
    MainForm.systemConfig.CloseTime := FormatDateTime('hns', DTPClose.DateTime);
    MainForm.TAutoShut.Enabled := True;
  end;

  if RBSaveBySteady.Checked then
  begin
    myini.WriteInteger('system_set', 'save_by_steady', 0);
    MainForm.systemConfig.saveByInterval := 0;
  end
  else if RBSaveByTime.Checked then
  begin
    myini.WriteInteger('system_set', 'save_by_steady', 1);
    MainForm.systemConfig.saveByInterval := 1;
  end
  else if RBSaveByQuantity.Checked then
  begin
    myini.WriteInteger('system_set', 'save_by_steady', 2);
    MainForm.systemConfig.saveByInterval := 2;
  end;
  myini.WriteInteger('system_set', 'save_interval', SEInterval.Value);
  myini.WriteFloat('system_set', 'save_quantity', StrToFloatDef(LEQuantity.Text, 10000));
  MainForm.systemConfig.saveInterval := SEInterval.Value;
  MainForm.systemConfig.saveQuantity := StrToFloatDef(LEQuantity.Text, 10000);
  myini.WriteBool('system_set', 'save_after_return_zero', CBSaveAfterReturnZero.Checked);
  MainForm.systemConfig.saveAfterReturnZero := CBSaveAfterReturnZero.Checked;
  myini.WriteFloat('system_set', 'upper_limit', StrToFloatDef(LEUpperLimit.Text, 10));
  myini.WriteFloat('system_set', 'lower_limit', StrToFloatDef(LELowerLimit.Text, 10));
  MainForm.systemConfig.upperLimit := StrToFloatDef(LEUpperLimit.Text, 10);
  MainForm.systemConfig.lowerLimit := StrToFloatDef(LELowerLimit.Text, 10);

  myini.WriteInteger('system_set', 'ticket_sel_height',
    StrToIntDef(LETicketSelHeight.Text, 25));
  MainForm.systemConfig.ticketSelHeight := StrToIntDef(LETicketSelHeight.Text, 25);

  myini.WriteInteger('system_set', 'sum_type', RGSumType.ItemIndex);
  MainForm.systemConfig.sumType := RGSumType.ItemIndex;

  myini.WriteInteger('system_set', 'pay_type', CBPayType.ItemIndex);
  MainForm.systemConfig.payType := CBPayType.ItemIndex;

  myini.WriteBool('system_set', 'auto_login', CBAutoLogin.Checked);
  MainForm.systemConfig.autoLogin := CBAutoLogin.Checked;
  myini.WriteString('system_set', 'login_name', LELoginName.Text);
  MainForm.systemConfig.loginName := LELoginName.Text;
  myini.WriteString('system_set', 'login_pass', TCommonUtil.compressAndBase64(LELoginPass.Text));
  MainForm.systemConfig.loginPass := TCommonUtil.compressAndBase64(LELoginPass.Text);
end;

procedure TSoftwareSetForm.CBAutoShutdownClick(Sender: TObject);
begin
  DTPClose.Enabled := CBAutoShutdown.Checked;
end;

procedure TSoftwareSetForm.BtnTestPrinterClick(Sender: TObject);
begin
  TCommonUtil.printerBack(MainForm.systemConfig.printer1, StrToIntDef(LEPrinterBackRow.Text, 60));
end;

procedure TSoftwareSetForm.LEPicPathDblClick(Sender: TObject);
begin
  LEPicPath.Text := ExtractFilePath(ParamStr(0)) + '\WeightImg\';
end;

procedure TSoftwareSetForm.SpOddColorMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var colorDialog: TColorDialog;
begin
  colorDialog := TColorDialog.Create(nil);
  try
    colorDialog.Color := SpOddColor.Brush.Color;
    if colorDialog.Execute then
    begin
      (Sender as TShape).Brush.Color := colorDialog.Color;
    end;
  finally
    colorDialog.Free;
  end;
end;

end.

