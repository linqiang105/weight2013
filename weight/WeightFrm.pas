unit WeightFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzPanel, RzCmboBx, RzLabel, Buttons,
  ExtCtrls, RzEdit, SysConfig, Math, DB, RzAnimtr, ImgList, Mask, CnAAFont,
  CnAACtrls, Menus, AppEvnts;

type
  TFrmWeight = class(TFrame)
    PMain: TPanel;
    PInfo: TPanel;
    PRight: TPanel;
    PSimple: TPanel;
    BtnWeight: TBitBtn;
    BtnSave: TBitBtn;
    BtnPrint: TBitBtn;
    BtnCancel: TBitBtn;
    PStandard: TPanel;
    BitBtnPrint: TBitBtn;
    BitBtnTare: TBitBtn;
    BitBtnSave: TBitBtn;
    BitBtnGross: TBitBtn;
    BitBtnClear: TBitBtn;
    BtnSetTare: TBitBtn;
    GBWeightType: TGroupBox;
    RBPurchase: TRadioButton;
    RBSale: TRadioButton;
    RBInner: TRadioButton;
    RBOther: TRadioButton;
    GBWeightMode: TGroupBox;
    RBOnce: TRadioButton;
    RBStandard: TRadioButton;
    RBSimple: TRadioButton;
    PInput: TPanel;
    lblSum: TRzLabel;
    lblSpec: TRzLabel;
    lblShouHuo: TRzLabel;
    lblScale: TRzLabel;
    lblMemo: TRzLabel;
    lblReal: TRzLabel;
    lblQuanter: TRzLabel;
    lblPrice: TRzLabel;
    lblNet: TRzLabel;
    lblGross: TRzLabel;
    lblGoods: TRzLabel;
    lblFaHuo: TRzLabel;
    lblCost: TRzLabel;
    lblCar: TRzLabel;
    lblBundle: TRzLabel;
    lblBackup9: TRzLabel;
    lblBackup8: TRzLabel;
    lblBackup7: TRzLabel;
    lblBackup6: TRzLabel;
    lblBackup5: TRzLabel;
    lblBackup4: TRzLabel;
    lblBackup3: TRzLabel;
    lblBackup2: TRzLabel;
    lblBackup18: TRzLabel;
    lblBackup17: TRzLabel;
    lblBackup16: TRzLabel;
    lblBackup15: TRzLabel;
    lblBackup14: TRzLabel;
    lblBackup13: TRzLabel;
    lblBackup12: TRzLabel;
    lblBackup11: TRzLabel;
    lblBackup10: TRzLabel;
    lblBackup1: TRzLabel;
    lblTare: TRzLabel;
    EdtTare: TRzEdit;
    EdtSum: TRzEdit;
    CBSpec: TRzComboBox;
    CBShouHuo: TRzComboBox;
    EdtScale: TRzEdit;
    EdtMemo: TRzEdit;
    EdtReal: TRzEdit;
    EdtQuanter: TRzEdit;
    EdtPrice: TRzEdit;
    EdtNet: TRzEdit;
    CBGoods: TRzComboBox;
    CBFaHuo: TRzComboBox;
    EdtCost: TRzEdit;
    CBCar: TRzComboBox;
    EdtBundle: TRzEdit;
    EdtBackup9: TRzEdit;
    EdtBackup8: TRzEdit;
    EdtBackup7: TRzEdit;
    EdtBackup6: TRzEdit;
    CBBackup5: TRzComboBox;
    CBBackup4: TRzComboBox;
    CBBackup3: TRzComboBox;
    CBBackup2: TRzComboBox;
    EdtBackup18: TRzEdit;
    EdtBackup17: TRzEdit;
    EdtBackup16: TRzEdit;
    EdtBackup15: TRzEdit;
    CBBackup14: TRzComboBox;
    CBBackup13: TRzComboBox;
    CBBackup12: TRzComboBox;
    CBBackup11: TRzComboBox;
    CBBackup10: TRzComboBox;
    CBBackup1: TRzComboBox;
    P0: TPanel;
    P00: TPanel;
    P01: TPanel;
    P02: TPanel;
    P03: TPanel;
    P04: TPanel;
    P05: TPanel;
    P06: TPanel;
    P07: TPanel;
    P08: TPanel;
    P1: TPanel;
    P10: TPanel;
    P11: TPanel;
    P12: TPanel;
    P13: TPanel;
    P14: TPanel;
    P15: TPanel;
    P16: TPanel;
    P17: TPanel;
    P18: TPanel;
    P2: TPanel;
    P20: TPanel;
    P21: TPanel;
    P22: TPanel;
    P23: TPanel;
    P24: TPanel;
    P25: TPanel;
    P26: TPanel;
    P27: TPanel;
    P28: TPanel;
    P3: TPanel;
    P30: TPanel;
    P31: TPanel;
    P32: TPanel;
    P33: TPanel;
    P34: TPanel;
    P35: TPanel;
    P36: TPanel;
    TReadWeight: TTimer;
    TSteady: TTimer;
    EdtGross: TRzEdit;
    GBPrint: TGroupBox;
    CBPreview: TCheckBox;
    ImgList: TImageList;
    PMeter1: TPanel;
    lblTrans1: TLabel;
    lblSteady1: TLabel;
    lblUnit1: TLabel;
    PWeight1: TRzPanel;
    AniTrans1: TRzAnimator;
    AniSteady1: TRzAnimator;
    PMeter2: TPanel;
    PWeight2: TRzPanel;
    AniTrans2: TRzAnimator;
    lblTrans2: TLabel;
    AniSteady2: TRzAnimator;
    lblSteady2: TLabel;
    lblUnit2: TLabel;
    CBAuto: TCheckBox;
    TAuto: TTimer;
    TWaitForZero: TTimer;
    TWaitForScreen: TTimer;
    MSTotalMsg: TCnAAMarqueeText;
    MemoDebug: TMemo;
    lblGlideNo: TLabel;
    BtnCarNo: TButton;
    PMeter: TPanel;
    SpWeightType: TShape;
    ApplicationEvents1: TApplicationEvents;
    procedure BitBtnGrossClick(Sender: TObject);
    procedure BitBtnTareClick(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnClearClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
    procedure CBFaHuoExit(Sender: TObject);
    procedure CBShouHuoExit(Sender: TObject);
    procedure CBGoodsExit(Sender: TObject);
    procedure CBSpecExit(Sender: TObject);
    procedure TReadWeightTimer(Sender: TObject);
    procedure PWeight1DblClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnWeightClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure TSteadyTimer(Sender: TObject);
    procedure BtnSetTareClick(Sender: TObject);
    procedure CBBackup10Exit(Sender: TObject);
    procedure CBBackup11Exit(Sender: TObject);
    procedure CBBackup12Exit(Sender: TObject);
    procedure CBBackup13Exit(Sender: TObject);
    procedure CBBackup14Exit(Sender: TObject);
    procedure CBCarExit(Sender: TObject);
    procedure EdtBundleChange(Sender: TObject);
    procedure EdtScaleChange(Sender: TObject);
    procedure EdtPriceChange(Sender: TObject);
    procedure EdtGrossChange(Sender: TObject);
    procedure EdtTareChange(Sender: TObject);
    procedure RBStandardClick(Sender: TObject);
    procedure RBSimpleClick(Sender: TObject);
    procedure RBOnceClick(Sender: TObject);
    procedure CBBackup1Exit(Sender: TObject);
    procedure CBBackup2Exit(Sender: TObject);
    procedure CBBackup3Exit(Sender: TObject);
    procedure CBBackup4Exit(Sender: TObject);
    procedure CBBackup5Exit(Sender: TObject);
    procedure CBCarDblClick(Sender: TObject);
    procedure PWeight1Click(Sender: TObject);
    procedure PWeight2Click(Sender: TObject);
    procedure PWeight1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure CBAutoClick(Sender: TObject);
    procedure TAutoTimer(Sender: TObject);
    procedure TWaitForZeroTimer(Sender: TObject);
    procedure TWaitForScreenTimer(Sender: TObject);
    procedure MSTotalMsgMouseEnter(Sender: TObject);
    procedure MSTotalMsgMouseLeave(Sender: TObject);
    procedure CBFaHuoDblClick(Sender: TObject);
    procedure CBShouHuoDblClick(Sender: TObject);
    procedure CBGoodsDblClick(Sender: TObject);
    procedure CBSpecDblClick(Sender: TObject);
    procedure CBBackup1DblClick(Sender: TObject);
    procedure CBBackup2DblClick(Sender: TObject);
    procedure CBBackup3DblClick(Sender: TObject);
    procedure CBBackup4DblClick(Sender: TObject);
    procedure CBBackup5DblClick(Sender: TObject);
    procedure CBBackup10DblClick(Sender: TObject);
    procedure CBBackup11DblClick(Sender: TObject);
    procedure CBBackup12DblClick(Sender: TObject);
    procedure CBBackup13DblClick(Sender: TObject);
    procedure CBBackup14DblClick(Sender: TObject);
    procedure BtnCarNoClick(Sender: TObject);
    procedure CBCarEnter(Sender: TObject);
    procedure ApplicationEvents1Idle(Sender: TObject; var Done: Boolean);
    procedure CBBackup1Change(Sender: TObject);
  private
    { Private declarations }
    //判断稳定
    arrWeight1, arrWeight2: array[0..50] of string;
    cishu1, cishu2: Integer;

    flagReverse: Boolean;
    grossTime: TDateTime;
    grossAddr, grossMan: string;

    //小台秤自动过磅流程
    autoStep: Integer;
    lastSteadyWeight: Double;

    FlastGlideNo: string;
    function clearPosition(): Boolean; //隐藏所有控件
    procedure loadFormDesign(const pv: string; pWin: TPanel);
    function setPosition(): Boolean; //2.将控件摆到配置的位置上去
    procedure SetlastGlideNo(const Value: string);
  public
    { Public declarations }
    saved: Boolean;
    weightField, weightType, maxGlideNo, updateRecNo: string;

    function setSysConfig(systemConfig: TSysConfig): Boolean;
    function setLastWeightInfo(ds: TDataSet): Boolean; //取上次的过磅信息显示到界面上
    function calcNet(): Boolean; //计算净重
    function calcSum(): Boolean;
    function clearInfo(clearAll: Boolean = False): Boolean; //点清空按钮时全清空
    function clearWeight(): Boolean;
    function grossFindTare(): Boolean; //过毛重找车辆皮重信息
    function tareFindGross(): Boolean; //过皮重找车辆毛重信息
    function getCost(Value: Double): Double;
    function setCostValue(): Boolean;
    function setExpressionValue(): Boolean; //自定义公式项目
    function SimpleWeightFindFirst(): Boolean; //简单过磅
    function getWeight(): string; //取当前重量
    function getScaleNo(): Char; //A秤或B秤
    function getSteady(): Boolean; //是否稳定
    function getMust(): Boolean; //是否已经输入全部必填项
    function getUnique(): Boolean; //确认唯一性
    function getWeightType: string; //获取过磅类型
    function resizeFrame(): Boolean; //重排界面
    function resizeWidth(): Boolean; //3.刷新窗体,调整控件的长度
    function startSteady(start: Boolean = True): Boolean;
    function setSimpleBtnState(st: Boolean): Boolean;
    function setBtnState(st: Boolean): Boolean;
    procedure P00SetFocus(); //设置焦点
    function showMeter2(): Boolean;
    function weightAndSave(): Boolean; overload; //自动过磅
    function weightAndSave(w: Double): Boolean; overload;
    procedure addAutoDebug(s: string);
    procedure setNotChangeItem(st: Boolean); //设置二次过磅不可变更的选项
    function save(): Boolean;
    function simpleSave(): Boolean;
    procedure addDropdownInfo();
    procedure setWeightPos();
    procedure setAutoState();
    property lastGlideNo: string read FlastGlideNo write SetlastGlideNo;
  end;

implementation

uses
  Main, QueryDM, MultiGross, Video, PrepareUtil, DogUtil,
  ReadWeight, ExpressionUtil, WeightUtil, OtherUtil, PayUtil, ReportUtil,
  Car, CommonUtil, PrepareMaintain, MeterConnect1;

{$R *.dfm}

{ TFrmWeight }

function TFrmWeight.clearInfo(clearAll: Boolean): Boolean;
begin
  if clearAll then
  begin
    CBCar.Text := MainForm.poWeightSetConfig.carDefault;
    CBFaHuo.Text := MainForm.poWeightSetConfig.faHuoDefault;
    CBShouHuo.Text := MainForm.poWeightSetConfig.shouHuoDefault;
    CBGoods.Text := MainForm.poWeightSetConfig.goodsDefault;
    CBSpec.Text := MainForm.poWeightSetConfig.specDefault;
    EdtBundle.Text := MainForm.poWeightSetConfig.bundleDefault;
    EdtPrice.Text := MainForm.poWeightSetConfig.priceDefault;
    EdtScale.Text := MainForm.poWeightSetConfig.scaleDefault;
    EdtMemo.Text := MainForm.poWeightSetConfig.memoDefault;
    CBBackup1.Text := MainForm.poWeightSetConfig.backup1Default;
    CBBackup2.Text := MainForm.poWeightSetConfig.backup2Default;
    CBBackup3.Text := MainForm.poWeightSetConfig.backup3Default;
    CBBackup4.Text := MainForm.poWeightSetConfig.backup4Default;
    CBBackup5.Text := MainForm.poWeightSetConfig.backup5Default;
    EdtBackup6.Text := MainForm.poWeightSetConfig.backup6Default;
    EdtBackup7.Text := MainForm.poWeightSetConfig.backup7Default;
    EdtBackup8.Text := MainForm.poWeightSetConfig.backup8Default;
    EdtBackup9.Text := MainForm.poWeightSetConfig.backup9Default;
    CBBackup10.Text := MainForm.poWeightSetConfig.backup10Default;
    CBBackup11.Text := MainForm.poWeightSetConfig.backup11Default;
    CBBackup12.Text := MainForm.poWeightSetConfig.backup12Default;
    CBBackup13.Text := MainForm.poWeightSetConfig.backup13Default;
    CBBackup14.Text := MainForm.poWeightSetConfig.backup14Default;
    EdtBackup15.Text := MainForm.poWeightSetConfig.backup15Default;
    EdtBackup16.Text := MainForm.poWeightSetConfig.backup16Default;
    EdtBackup17.Text := MainForm.poWeightSetConfig.backup17Default;
    EdtBackup18.Text := MainForm.poWeightSetConfig.backup18Default;
  end
  else
  begin
    with MainForm do
    begin
      if MainForm.poWeightSetConfig.carClear then CBCar.Text := MainForm.poWeightSetConfig.carDefault;
      if MainForm.poWeightSetConfig.faHuoClear then CBFaHuo.Text := MainForm.poWeightSetConfig.faHuoDefault;
      if MainForm.poWeightSetConfig.shouHuoClear then CBShouHuo.Text := MainForm.poWeightSetConfig.shouHuoDefault;
      if MainForm.poWeightSetConfig.goodsClear then CBGoods.Text := MainForm.poWeightSetConfig.goodsDefault;
      if MainForm.poWeightSetConfig.specClear then CBSpec.Text := MainForm.poWeightSetConfig.specDefault;
      if MainForm.poWeightSetConfig.bundleClear then EdtBundle.Text := MainForm.poWeightSetConfig.bundleDefault;
      if MainForm.poWeightSetConfig.priceClear then EdtPrice.Text := MainForm.poWeightSetConfig.priceDefault;
      if MainForm.poWeightSetConfig.scaleClear then EdtScale.Text := MainForm.poWeightSetConfig.scaleDefault;
      if MainForm.poWeightSetConfig.memoClear then EdtMemo.Text := MainForm.poWeightSetConfig.memoDefault;
      if MainForm.poWeightSetConfig.backup1Clear then CBBackup1.Text := MainForm.poWeightSetConfig.backup1Default;
      if MainForm.poWeightSetConfig.backup2Clear then CBBackup2.Text := MainForm.poWeightSetConfig.backup2Default;
      if MainForm.poWeightSetConfig.backup3Clear then CBBackup3.Text := MainForm.poWeightSetConfig.backup3Default;
      if MainForm.poWeightSetConfig.backup4Clear then CBBackup4.Text := MainForm.poWeightSetConfig.backup4Default;
      if MainForm.poWeightSetConfig.backup5Clear then CBBackup5.Text := MainForm.poWeightSetConfig.backup5Default;
      if MainForm.poWeightSetConfig.backup6Clear then EdtBackup6.Text := MainForm.poWeightSetConfig.backup6Default;
      if MainForm.poWeightSetConfig.backup7Clear then EdtBackup7.Text := MainForm.poWeightSetConfig.backup7Default;
      if MainForm.poWeightSetConfig.backup8Clear then EdtBackup8.Text := MainForm.poWeightSetConfig.backup8Default;
      if MainForm.poWeightSetConfig.backup9Clear then EdtBackup9.Text := MainForm.poWeightSetConfig.backup9Default;
      if MainForm.poWeightSetConfig.backup10Clear then CBBackup10.Text := MainForm.poWeightSetConfig.backup10Default;
      if MainForm.poWeightSetConfig.backup11Clear then CBBackup11.Text := MainForm.poWeightSetConfig.backup11Default;
      if MainForm.poWeightSetConfig.backup12Clear then CBBackup12.Text := MainForm.poWeightSetConfig.backup12Default;
      if MainForm.poWeightSetConfig.backup13Clear then CBBackup13.Text := MainForm.poWeightSetConfig.backup13Default;
      if MainForm.poWeightSetConfig.backup14Clear then CBBackup14.Text := MainForm.poWeightSetConfig.backup14Default;
      if MainForm.poWeightSetConfig.backup15Clear then EdtBackup15.Text := MainForm.poWeightSetConfig.backup15Default;
      if MainForm.poWeightSetConfig.backup16Clear then EdtBackup16.Text := MainForm.poWeightSetConfig.backup16Default;
      if MainForm.poWeightSetConfig.backup17Clear then EdtBackup17.Text := MainForm.poWeightSetConfig.backup17Default;
      if MainForm.poWeightSetConfig.backup18Clear then EdtBackup18.Text := MainForm.poWeightSetConfig.backup18Default;
    end;
  end;
  lastGlideNo := '';
  EdtGross.Text := '0';
  EdtTare.Text := '0';
  EdtNet.Text := '0';
  EdtReal.Text := '0';
  EdtSum.Text := '0';
  EdtCost.Text := '0';
  EdtQuanter.Text := '0';
end;

function TFrmWeight.grossFindTare: Boolean;
begin
 //找寻上次的皮重记录
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select * from 称重信息 where (车号=:car) and (毛重=0) '
      + 'and (皮重<>0) and (净重=0) order By 流水号';
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      if MainForm.systemConfig.useLastTare then
      begin
        //询问用户是否使用过住的皮重
        if MessageDlg('是否调用以往的皮重?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
          Exit;
      end;
      if RecordCount = 1 then
      begin
        setLastWeightInfo(QueryDataModule.ADOQExec);
        EdtTare.Text := FieldByName('皮重').AsString; //毛重-皮重=净重
        calcNet;
        WeightType := 'update';
        UpdateRecNo := FieldByName('流水号').AsString;

      end
      else if RecordCount > 1 then //有大于一条的皮重记录,弹出对话框让用户选择其中一条
      begin
        with QueryDataModule.ADOQMultiGross do
        begin
          Close;
          SQL.Text := 'Select * From 称重信息 Where (车号=:car)'
            + ' And (毛重=0) and (皮重<>0) and (净重=0) Order By 序号 desc';
          Parameters.ParamByName('car').Value := CBCar.Text;
          Open;
        end;
        MultiGrossForm.Width := Screen.Width - 100;
        MultiGrossForm.ShowModal;
        UpdateRecNo := MultiGrossForm.UpdateRecNo;

        with MultiGrossForm.DBGridEhMulti.DataSource.DataSet do
        begin
          setLastWeightInfo(MultiGrossForm.DBGridEhMulti.DataSource.DataSet);
          EdtTare.Text := FieldByName('皮重').AsString; //毛重-皮重
          calcNet;
          WeightType := 'update';
        end;
      end
    end
  end
end;

procedure TFrmWeight.BitBtnGrossClick(Sender: TObject);
var grossGlideNo: string;
  Account: Double; //扣重，金额计算变量
  Flag: boolean; //预置标志
begin
  Account := 0.00;
  clearWeight;
  //等待稳定后才能称重
  if StrToFloatDef(getWeight(), 0) <= 0 then
  begin
    MainForm.ShowMsg('请上磅后再点我');
    Exit;
  end;
  if not getSteady then
  begin
    MainForm.ShowMsg('请等待重量稳定后再点我');
    Exit;
  end;
  if not getUnique then
  begin
    MainForm.ShowMsg('相关信息不允许重复');
    Exit;
  end;
  if MainForm.systemConfig.autoSavePrepare then
  begin
    TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text,
      CBSpec.Text); //预置车号,单位等信息
    TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
      CBBackup4.Text, CBBackup5.Text); //预置备用项目
    TPrepareUtil.prepareBackupInfo2(CBBackup10.Text, CBBackup11.Text, CBBackup12.Text,
      CBBackup13.Text, CBBackup14.Text);
  end;
  EdtGross.Text := getWeight; //获取当前重量
  UpdateRecNo := ''; //如果是更新的话，取上一次的号码
  WeightType := 'insert'; //称重类型，一种是插入，一种是更新
  WeightField := 'gross';
  //如果在重复过磅时间内，就不允许过磅
  if MainForm.systemConfig.useSaveInterval then
  begin
    if TWeightUtil.lessThanMinSaveInterval(CBCar.Text) then
    begin
      Application.MessageBox('重复过磅时间过短,不允许过磅', '错误', MB_OK
        + MB_ICONSTOP + MB_TOPMOST);
      lastGlideNo := '';
      Exit;
    end;
  end;
  //如果不允许二次过毛重,那么如果有磅过毛重,就弹出对话框让用户选择是否更新上次毛重
  //如果选是就更新,否则不能过磅
  if not MainForm.systemConfig.AllowSecondGross then
  begin
    if TWeightUtil.hasLastGross(CBCar.Text, grossGlideNo) then
    begin
      if MessageBoxW(Handle, '该车已过了重磅,是否更新上次的毛重?', '提示',
        MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        if TUserUtil.HasAuthority('修改毛重') then
        begin
          TWeightUtil.updateLastGross(grossGlideNo, EdtGross.Text);
          MessageBox(0, '已更新上次毛重，车辆可以下磅', '提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
          MainForm.showGridRecord;
        end
        else
        begin
          MessageBox(0, '对不起,你没有权限更新此记录', '错误', MB_OK +
            MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
        clearWeight;
        lastGlideNo := '';
        Exit;
      end
      else
      begin
        Exit;
      end;
    end;
  end;
  //预置的符号,为True 则无预置皮重
  Flag := True;
  //找寻是否有预置的皮重
  Account := TPrepareUtil.getCarTare(CBCar.Text);
  if account > 0 then
  begin
    if Application.MessageBox(PChar(Format('车号为【%s】有预置皮重为【%f】' +
      #13#10 + '是否使用当前的预置皮重?', [CBCar.Text, Account])), '提示', MB_YESNO +
      MB_ICONQUESTION + MB_TOPMOST) = IDYES then
    begin
      Flag := False;
    end;
  end;
  if Flag then //无预置时
  begin
    if RBOnce.Checked then //一次过磅
    begin
      calcNet;
    end
    else
    begin
      GrossFindTare; //找皮重记录
      if WeightType = 'update' then
      begin
        if MainForm.systemConfig.useTimeOutLimit
          and TWeightUtil.updateTimeOut(CBCar.Text) then //两次过磅时间是否超时
        begin
          Application.MessageBox('两次过磅时间超时,不允许过磅', '错误', MB_OK
            + MB_ICONSTOP + MB_TOPMOST);
          lastGlideNo := '';
          Exit;
        end;
      end;
    end;
  end
  else //有预置皮重时
  begin
    EdtTare.Text := FloatToStr(Account);
    calcNet;
    WeightType := 'pre';
  end;
  VideoForm.takePhoto;
  setCostValue; //设置过磅费
  setExpressionValue();
  setBtnState(False);
  TReadWeight.Enabled := MainForm.systemConfig.UseVoice;

  if MainForm.systemConfig.weightOneClick then
  begin
    if save then
    begin
      if MainForm.systemConfig.printAfterSave then
      begin
        if UpdateRecNo <> '' then
          TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
        else if maxGlideNo <> '' then
          TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
      end
      else
      begin
        if MessageBox(0, '是否打印', '提示', MB_YESNO + MB_ICONQUESTION +
          MB_TOPMOST) = IDYES then
        begin
          if UpdateRecNo <> '' then
            TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
          else if maxGlideNo <> '' then
            TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
        end;
      end;
    end;
  end;
end;

function TFrmWeight.tareFindGross: Boolean;
begin
  //找寻上次的毛重记录
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add('Select * From 称重信息 Where (车号=:car) '
      + 'And (皮重=0) and (毛重<>0) and (净重=0) Order By 流水号');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then //查询结果不为空
    begin
      if RecordCount = 1 then
      begin
        setLastWeightInfo(QueryDataModule.ADOQExec);
        EdtGross.Text := FieldByName('毛重').AsString; //毛重-皮重
        calcNet;
        WeightType := 'update';
        UpdateRecNo := FieldByName('流水号').AsString;
      end
      else if RecordCount > 1 then
      //有大于一条的毛重记录,弹出对话框让用户选择其中一条
      begin
        with QueryDataModule.ADOQMultiGross do
        begin
          Close;
          SQL.Text := 'Select * From 称重信息 Where (车号=:car)'
            + ' And (皮重=0) and (毛重<>0) and (净重=0) Order By 序号 desc';
          Parameters.ParamByName('car').Value := CBCar.Text;
          Open;
        end;
        MultiGrossForm.Width := Screen.Width - 50;
        MultiGrossForm.ShowModal;
        UpdateRecNo := MultiGrossForm.UpdateRecNo;
        with MultiGrossForm.DBGridEhMulti.DataSource.DataSet do
        begin
          setLastWeightInfo(MultiGrossForm.DBGridEhMulti.DataSource.DataSet);

          EdtGross.Text := FieldByName('毛重').AsString; //毛重-皮重
          calcNet;
          WeightType := 'update';
        end;
      end;
    end
  end;
end;

procedure TFrmWeight.BitBtnTareClick(Sender: TObject);
var tareGlideNo: string;
  sysTare, nowTare: Double;
begin
  clearWeight;
  //等待稳定后才能称重
  if StrToFloatDef(getWeight(), 0) <= 0 then
  begin
    MainForm.ShowMsg('请上磅后再点我');
    Exit;
  end;
  if not getSteady then
  begin
    MainForm.ShowMsg('请等待重量稳定后再点我');
    Exit;
  end;
  if not getUnique then
  begin
    MainForm.ShowMsg('相关信息不允许重复');
    Exit;
  end;
  if MainForm.systemConfig.autoSavePrepare then
  begin
    TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text,
      CBSpec.Text); //预置车号,单位等信息
    TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
      CBBackup4.Text, CBBackup5.Text); //预置备用项目
    TPrepareUtil.prepareBackupInfo2(CBBackup10.Text, CBBackup11.Text, CBBackup12.Text,
      CBBackup13.Text, CBBackup14.Text);
  end;
  //自动预置皮重
  if MainForm.systemConfig.autoWriteTare then
    TPrepareUtil.updateCarTare(CBCar.Text, getWeight);
  EdtTare.Text := getWeight;
  //不允许皮重超过预置皮重
  if MainForm.systemConfig.notAllowTareExceed then
  begin
    if StrToFloatDef(EdtTare.Text, 0) > TPrepareUtil.getCarTare(CBCar.Text) then
    begin
      Application.MessageBox('车皮超差过大,不允许过磅', '错误', MB_OK
        + MB_ICONSTOP + MB_TOPMOST);
      lastGlideNo := '';
      Exit;
    end;
  end;
  //如果在重复过磅时间内，就不允许过磅
  if MainForm.systemConfig.useSaveInterval then
  begin
    if TWeightUtil.lessThanMinSaveInterval(CBCar.Text) then
    begin
      Application.MessageBox('重复过磅时间过短,不允许过磅', '错误', MB_OK
        + MB_ICONSTOP + MB_TOPMOST);
      lastGlideNo := '';
      Exit;
    end;
  end;

  //提示皮重超差
  if MainForm.systemConfig.useTareDiff then
  begin
    nowTare := StrToFloatDef(EdtTare.Text, 0);
    sysTare := TPrepareUtil.getCarTare(CBCar.Text);
    //超过5%的重量
    if sysTare > 0 then
    begin
      if (abs(nowTare - sysTare) / sysTare) > MainForm.systemConfig.tareDiff / 100 then
      begin
        if Application.MessageBox(PChar(Format('该车皮与系统车皮存在误差,最后一次过磅为[%f],误差[%f],是否允许继续过磅?',
          [sysTare, sysTare - nowTare])), '提示', MB_YESNO + MB_ICONWARNING + MB_TOPMOST) = IDYES then
        begin
          TPrepareUtil.updateCarTare(CBCar.Text, EdtTare.Text);
        end
        else
        begin
          lastGlideNo := '';
          Exit;
        end;
      end;
    end;
  end;
  UpdateRecNo := '';
  WeightType := 'insert';
  WeightField := 'tare';
  //如果不允许二次过皮重,那么如果有磅过皮重,就弹出对话框让用户选择是否更新上次皮重
  //如果选是就更新,否则不能过磅
  if not MainForm.systemConfig.AllowSecondTare then
  begin
    if TWeightUtil.hasLastTare(CBCar.Text, tareGlideNo) then
    begin
      if MessageBoxW(Handle, '该车已过了空磅,是否更新上次的皮重?', '提示',
        MB_YESNO + MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        if TUserUtil.HasAuthority('修改皮重') then
        begin
          TWeightUtil.updateLastTare(tareGlideNo, EdtTare.Text);
          MessageBox(0, '已更新上次皮重，车辆可以下磅', '提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
          MainForm.showGridRecord;
        end
        else
        begin
          MessageBox(0, '对不起,你没有权限更新此记录', '错误', MB_OK +
            MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
        clearWeight;
        lastGlideNo := '';
        Exit;
      end
      else
      begin
        Exit;
      end;
    end;
  end;
  //找重车记录
  TareFindGross;
  if WeightType = 'update' then
  begin
    if MainForm.systemConfig.useTimeOutLimit
      and TWeightUtil.updateTimeOut(CBCar.Text) then //两次过磅时间是否超时
    begin
      Application.MessageBox('两次过磅时间超时,不允许过磅', '错误', MB_OK
        + MB_ICONSTOP + MB_TOPMOST);
      lastGlideNo := '';
      Exit;
    end;
  end;
  VideoForm.takePhoto;

  setCostValue;
  setExpressionValue();
  setBtnState(False);
  TReadWeight.Enabled := MainForm.systemConfig.UseVoice;

  if MainForm.systemConfig.weightOneClick then
  begin
    if save then
    begin
      if MainForm.systemConfig.printAfterSave then
      begin
        if UpdateRecNo <> '' then
          TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
        else if maxGlideNo <> '' then
          TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
      end
      else
      begin
        if MessageBox(0, '是否打印', '提示', MB_YESNO + MB_ICONQUESTION +
          MB_TOPMOST) = IDYES then
        begin
          if UpdateRecNo <> '' then
            TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
          else if maxGlideNo <> '' then
            TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
        end;
      end;
    end;
  end;
end;

procedure TFrmWeight.BitBtnSaveClick(Sender: TObject);
begin
  save();
end;

procedure TFrmWeight.BitBtnClearClick(Sender: TObject);
begin
  if not BitBtnSave.Enabled then
  begin
    clearInfo(True);
  end
  else
  begin
    clearWeight;
    setBtnState(True);
    BitBtnClear.Caption := '取消(&C)';
  end;
end;

procedure TFrmWeight.BitBtnPrintClick(Sender: TObject);
begin
  if save then
  begin
    if UpdateRecNo <> '' then
      TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
    else if maxGlideNo <> '' then
      TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
  end;
end;

procedure TFrmWeight.CBFaHuoExit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getFaHuoByCode((Sender as TRzComboBox).Text);
  if MainForm.systemConfig.taoPrimayKey = 2 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (发货单位=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBShouHuoExit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getShouHuoByCode((Sender as TRzComboBox).Text);
  EdtPrice.Text := FloatToStr(TPriceUtil.getPrice(CBShouHuo.Text, CBGoods.Text));

  if MainForm.systemConfig.taoPrimayKey = 3 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (收货单位=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBGoodsExit(Sender: TObject);
var price, scale: Double;
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getGoodsByCode((Sender as TRzComboBox).Text);
  TPrepareUtil.getGoodsInfo(CBGoods.Text, price, scale);
  //EdtPrice.Text := FloatToStr(price);
  EdtScale.Text := FloatToStr(scale);

  EdtPrice.Text := FloatToStr(TPriceUtil.getPrice(CBShouHuo.Text, CBGoods.Text));

  if MainForm.systemConfig.taoPrimayKey = 4 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (货名=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBSpecExit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getSpecByCode((Sender as TRzComboBox).Text);

  if MainForm.systemConfig.taoPrimayKey = 5 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (规格=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.TReadWeightTimer(Sender: TObject);
begin
  //语音报重量,如果有净重得出,就报净重,否则报当前重量
  if EdtNet.Text = '0' then
    ReadWeightForm.EdtSource.Text := getWeight
  else
    ReadWeightForm.EdtSource.Text := EdtNet.Text;
  ReadWeightForm.BtnRead.Click;
  TReadWeight.Enabled := False;
end;

procedure TFrmWeight.PWeight1DblClick(Sender: TObject);
var fontDialog: TFontDialog;
begin
  fontDialog := TFontDialog.Create(Application);
  try
    fontDialog.Font := PWeight1.Font;
    if fontDialog.Execute then
      (Sender as TRzPanel).Font := fontDialog.Font;
  finally
    fontDialog.Free;
  end;
end;

function TFrmWeight.setExpressionValue: Boolean;
begin
  if MainForm.poWeightSetConfig.useExpression6 then
  begin
    if (MainForm.poWeightSetConfig.rule61 <> 0) and (MainForm.poWeightSetConfig.group6 <> 0) then
    begin
      EdtBackup6.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule61, MainForm.poWeightSetConfig.rule62,
        MainForm.poWeightSetConfig.group6,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup6.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression6,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point6,
        MainForm.poWeightSetConfig.divide6, MainForm.poWeightSetConfig.sumType6);
      if StrToFloatDef(EdtBackup6.Text, 0) < MainForm.poWeightSetConfig.min6 then
        EdtBackup6.Text := FloatToStr(MainForm.poWeightSetConfig.min6);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression7 then
  begin
    if (MainForm.poWeightSetConfig.rule71 <> 0) and (MainForm.poWeightSetConfig.group7 <> 0) then
    begin
      EdtBackup7.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule71, MainForm.poWeightSetConfig.rule72,
        MainForm.poWeightSetConfig.group7,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup7.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression7,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point7,
        MainForm.poWeightSetConfig.divide7, MainForm.poWeightSetConfig.sumType7);
      if StrToFloatDef(EdtBackup7.Text, 0) < MainForm.poWeightSetConfig.min7 then
        EdtBackup7.Text := FloatToStr(MainForm.poWeightSetConfig.min7);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression8 then
  begin
    if (MainForm.poWeightSetConfig.rule81 <> 0) and (MainForm.poWeightSetConfig.group8 <> 0) then
    begin
      EdtBackup8.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule81, MainForm.poWeightSetConfig.rule82,
        MainForm.poWeightSetConfig.group8,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup8.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression8,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point8,
        MainForm.poWeightSetConfig.divide8, MainForm.poWeightSetConfig.sumType8);
      if StrToFloatDef(EdtBackup8.Text, 0) < MainForm.poWeightSetConfig.min8 then
        EdtBackup8.Text := FloatToStr(MainForm.poWeightSetConfig.min8);
    end
  end;
  if MainForm.poWeightSetConfig.useExpression9 then
  begin
    if (MainForm.poWeightSetConfig.rule91 <> 0) and (MainForm.poWeightSetConfig.group9 <> 0) then
    begin
      EdtBackup9.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule91, MainForm.poWeightSetConfig.rule92,
        MainForm.poWeightSetConfig.group9,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup9.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression9,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point9,
        MainForm.poWeightSetConfig.divide9, MainForm.poWeightSetConfig.sumType9);
      if StrToFloatDef(EdtBackup9.Text, 0) < MainForm.poWeightSetConfig.min9 then
        EdtBackup9.Text := FloatToStr(MainForm.poWeightSetConfig.min9);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression15 then
  begin
    if (MainForm.poWeightSetConfig.rule151 <> 0) and (MainForm.poWeightSetConfig.group15 <> 0) then
    begin
      EdtBackup15.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule151, MainForm.poWeightSetConfig.rule152,
        MainForm.poWeightSetConfig.group15,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup15.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression15,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point15,
        MainForm.poWeightSetConfig.divide15, MainForm.poWeightSetConfig.sumType15);
      if StrToFloatDef(EdtBackup15.Text, 0) < MainForm.poWeightSetConfig.min15 then
        EdtBackup15.Text := FloatToStr(MainForm.poWeightSetConfig.min15);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression16 then
  begin
    if (MainForm.poWeightSetConfig.rule161 <> 0) and (MainForm.poWeightSetConfig.group16 <> 0) then
    begin
      EdtBackup16.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule161, MainForm.poWeightSetConfig.rule162,
        MainForm.poWeightSetConfig.group16,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup16.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression16,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point16,
        MainForm.poWeightSetConfig.divide16, MainForm.poWeightSetConfig.sumType16);
      if StrToFloatDef(EdtBackup16.Text, 0) < MainForm.poWeightSetConfig.min16 then
        EdtBackup16.Text := FloatToStr(MainForm.poWeightSetConfig.min16);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression17 then
  begin
    if (MainForm.poWeightSetConfig.rule171 <> 0) and (MainForm.poWeightSetConfig.group17 <> 0) then
    begin
      EdtBackup17.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule171, MainForm.poWeightSetConfig.rule172,
        MainForm.poWeightSetConfig.group17,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup17.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression17,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point17,
        MainForm.poWeightSetConfig.divide17, MainForm.poWeightSetConfig.sumType17);
      if StrToFloatDef(EdtBackup17.Text, 0) < MainForm.poWeightSetConfig.min17 then
        EdtBackup17.Text := FloatToStr(MainForm.poWeightSetConfig.min17);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression18 then
  begin
    if (MainForm.poWeightSetConfig.rule181 <> 0) and (MainForm.poWeightSetConfig.group18 <> 0) then
    begin
      EdtBackup18.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule181, MainForm.poWeightSetConfig.rule182,
        MainForm.poWeightSetConfig.group18,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup18.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression18,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point18,
        MainForm.poWeightSetConfig.divide18, MainForm.poWeightSetConfig.sumType18);
      if StrToFloatDef(EdtBackup18.Text, 0) < MainForm.poWeightSetConfig.min18 then
        EdtBackup18.Text := FloatToStr(MainForm.poWeightSetConfig.min18);
    end;
  end;
end;

procedure TFrmWeight.BtnCancelClick(Sender: TObject);
begin
  if BtnCancel.Caption = '清空' then
  begin
    clearInfo(True);
  end
  else
  begin
    clearWeight;
    setSimpleBtnState(True);
    BtnCancel.Caption := '清空';
  end;
end;

procedure TFrmWeight.BtnWeightClick(Sender: TObject);
var carTare: Double;
begin
  clearWeight; //清空重量
  if StrToFloatDef(getWeight(), 0) <= 0 then
  begin
    MainForm.ShowMsg('请上磅后再点我');
    Exit;
  end;
  if not getSteady then
  begin
    MainForm.ShowMsg('请等待重量稳定后再点我');
    Exit;
  end;
  if not getUnique then
  begin
    MainForm.ShowMsg('相关信息不允许重复');
    Exit;
  end;
  if MainForm.systemConfig.autoSavePrepare then
  begin
    //预置车号,单位等信息
    TPrepareUtil.PrepareInfo(CBCar.Text, CBFaHuo.Text, CBShouHuo.Text,
      CBGoods.Text, CBSpec.Text);
    //预置备用项目
    TPrepareUtil.PrepareBackupInfo(CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
      CBBackup4.Text, CBBackup5.Text);
    TPrepareUtil.prepareBackupInfo2(CBBackup10.Text, CBBackup11.Text, CBBackup12.Text,
      CBBackup13.Text, CBBackup14.Text);
  end;
  if MainForm.systemConfig.simpleMode = 0 then
    EdtGross.Text := getWeight
  else
    EdtTare.Text := getWeight;

  UpdateRecNo := ''; //如果是更新的话，取上一次的号码
  WeightType := 'insert'; //称重类型，一种是插入，一种是更新
  WeightField := 'first'; //默认是第一次过磅

  //如果在重复过磅时间内，就不允许过磅
  if MainForm.systemConfig.useSaveInterval then
  begin
    if TWeightUtil.lessThanMinSaveInterval(CBCar.Text) then
    begin
      Application.MessageBox('重复过磅时间过短,不允许过磅', '错误', MB_OK
        + MB_ICONSTOP + MB_TOPMOST);
      lastGlideNo := '';
      Exit;
    end;
  end;

  //一次过磅
  if RBOnce.Checked then
  begin
    carTare := TPrepareUtil.getCarTare(CBCar.Text);
    if carTare > 0 then
      EdtTare.Text := FloatToStr(carTare);
    calcNet;
  end
  else
  begin
    carTare := TPrepareUtil.getCarTare(CBCar.Text);
    if carTare > 0 then
    begin
      EdtGross.Text := getWeight;
      EdtTare.Text := FloatToStr(carTare);
    end
    else
    begin
      SimpleWeightFindFirst(); //找第一次过磅记录
    end;
  end;

  VideoForm.takePhoto; //拍照
  setCostValue(); //设置过磅费
  setExpressionValue(); //设置有公式编辑的字段
  TReadWeight.Enabled := MainForm.systemConfig.UseVoice; //开始朗读
  setSimpleBtnState(False); //设置按钮状态

  if MainForm.systemConfig.weightOneClick then
  begin
    if simpleSave then
    begin
      if MainForm.systemConfig.printAfterSave then
      begin
        if UpdateRecNo <> '' then
          TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
        else if maxGlideNo <> '' then
          TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
      end
      else
      begin
        if MessageBox(0, '是否打印', '提示', MB_YESNO + MB_ICONQUESTION +
          MB_TOPMOST) = IDYES then
        begin
          if UpdateRecNo <> '' then
            TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
          else if maxGlideNo <> '' then
            TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
        end;
      end;
    end;
  end;
end;

procedure TFrmWeight.BtnSaveClick(Sender: TObject);
begin
  simpleSave;
end;

procedure TFrmWeight.BtnPrintClick(Sender: TObject);
begin
  if simpleSave then
  begin
    if UpdateRecNo <> '' then
      TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
    else if maxGlideNo <> '' then
      TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
  end;
end;

function TFrmWeight.SimpleWeightFindFirst: Boolean;
var tmp: string;
begin
  //找寻上次的毛重记录
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    if MainForm.systemConfig.simpleMode = 0 then
      SQL.Add('Select * From 称重信息 Where (车号=:car) '
        + 'And (皮重=0) and (毛重<>0) and (净重=0) Order By 流水号')
    else
      SQL.Add('Select * From 称重信息 Where (车号=:car) '
        + 'And (皮重<>0) and (毛重=0) and (净重=0) Order By 流水号');
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then //查询结果不为空
    begin
      setLastWeightInfo(QueryDataModule.ADOQExec);
      if MainForm.systemConfig.simpleMode = 0 then
      begin
        EdtGross.Text := FieldByName('毛重').AsString; //毛重-皮重
        EdtTare.Text := GetWeight;
      end
      else
      begin
        EdtGross.Text := GetWeight;
        EdtTare.Text := FieldByName('皮重').AsString;
      end;
      EdtNet.Text := FloatToStr(StrToFloatDef(EdtGross.Text, 0) -
        StrToFloatDef(EdtTare.Text, 0));
      //如果净重为零,就转换毛重和皮重
      flagReverse := False;
      if MainForm.systemConfig.simpleMode = 0 then
      begin
        grossTime := FieldByName('毛重时间').AsDateTime;
        grossMan := FieldByName('毛重司磅员').AsString;
        grossAddr := FieldByName('毛重磅号').AsString;
      end
      else
      begin
        grossTime := FieldByName('皮重时间').AsDateTime;
        grossMan := FieldByName('皮重司磅员').AsString;
        grossAddr := FieldByName('皮重磅号').AsString;
      end;
      if StrToFloatDef(EdtNet.Text, 0) < 0 then
      begin
        tmp := EdtGross.Text;
        EdtGross.Text := EdtTare.Text;
        EdtTare.Text := tmp;
        EdtNet.Text := FloatToStr(StrToFloatDef(EdtGross.Text, 0) -
          StrToFloatDef(EdtTare.Text, 0));
        flagReverse := True;
      end;
      calcNet;
      WeightType := 'update';
      UpdateRecNo := FieldByName('流水号').AsString;
    end
  end;
end;

procedure TFrmWeight.TSteadyTimer(Sender: TObject);
var i: Integer;
  flag1, flag2: Boolean;
begin
  AniTrans1.ImageIndex := 0;
  AniTrans2.ImageIndex := 0;

  //一号仪表判断稳定
  arrWeight1[cishu1] := PWeight1.Caption;
  inc(CiShu1);
  if CiShu1 > MainForm.systemConfig.steadyCount then
    CiShu1 := 0;
  for i := 0 to MainForm.systemConfig.steadyCount - 1 do
  begin
    flag1 := True;
    if Abs(StrToFloatDef(arrWeight1[i], 0) - StrToFloatDef(arrWeight1[i + 1], 0)) > MainForm.systemConfig.range then
    begin
      flag1 := False;
      break;
    end;
  end;
  if flag1 then
    AniSteady1.ImageIndex := 1
  else
    AniSteady1.ImageIndex := 0;

  //二号仪表判稳
  arrWeight2[cishu2] := PWeight2.Caption;
  inc(CiShu2);
  if CiShu2 > MainForm.systemConfig.steadyCount then
    CiShu2 := 0;
  for i := 0 to MainForm.systemConfig.steadyCount - 1 do
  begin
    flag2 := True;
    if Abs(StrToFloatDef(arrWeight2[i], 0) - StrToFloatDef(arrWeight2[i + 1], 0)) > MainForm.systemConfig.range then
    begin
      flag2 := False;
      break;
    end;
  end;
  if flag2 then
    AniSteady2.ImageIndex := 1
  else
    AniSteady2.ImageIndex := 0;

  if PMeter2.Visible then
    PWeight2.Visible := StrToFloatDef(PWeight2.Caption, 0)
      < MainForm.systemConfig.notVisibleWeight;
  PWeight1.Visible := StrToFloatDef(PWeight1.Caption, 0)
    < MainForm.systemConfig.notVisibleWeight;
end;

function TFrmWeight.setSysConfig(systemConfig: TSysConfig): Boolean;
begin
  lblUnit1.Caption := systemConfig.softUnit1;
  lblUnit2.Caption := systemConfig.softUnit2;

  CBCar.TabOnEnter := systemConfig.enterTab;
  CBFaHuo.TabOnEnter := systemConfig.enterTab;
  CBShouHuo.TabOnEnter := systemConfig.enterTab;
  CBGoods.TabOnEnter := systemConfig.enterTab;
  CBSpec.TabOnEnter := systemConfig.enterTab;
  CBBackup1.TabOnEnter := systemConfig.enterTab;
  CBBackup2.TabOnEnter := systemConfig.enterTab;
  CBBackup3.TabOnEnter := systemConfig.enterTab;
  CBBackup4.TabOnEnter := systemConfig.enterTab;
  CBBackup5.TabOnEnter := systemConfig.enterTab;
  CBBackup10.TabOnEnter := systemConfig.enterTab;
  CBBackup11.TabOnEnter := systemConfig.enterTab;
  CBBackup12.TabOnEnter := systemConfig.enterTab;
  CBBackup13.TabOnEnter := systemConfig.enterTab;
  CBBackup14.TabOnEnter := systemConfig.enterTab;

  CBCar.DropDownCount := systemConfig.dropCount;
  CBFaHuo.DropDownCount := systemConfig.dropCount;
  CBShouHuo.DropDownCount := systemConfig.dropCount;
  CBGoods.DropDownCount := systemConfig.dropCount;
  CBSpec.DropDownCount := systemConfig.dropCount;
  CBBackup1.DropDownCount := systemConfig.dropCount;
  CBBackup2.DropDownCount := systemConfig.dropCount;
  CBBackup3.DropDownCount := systemConfig.dropCount;
  CBBackup4.DropDownCount := systemConfig.dropCount;
  CBBackup5.DropDownCount := systemConfig.dropCount;
  CBBackup10.DropDownCount := systemConfig.dropCount;
  CBBackup11.DropDownCount := systemConfig.dropCount;
  CBBackup12.DropDownCount := systemConfig.dropCount;
  CBBackup13.DropDownCount := systemConfig.dropCount;
  CBBackup14.DropDownCount := systemConfig.dropCount;

  CBCar.AutoDropDown := systemConfig.dropAuto;
  CBFaHuo.AutoDropDown := systemConfig.dropAuto;
  CBShouHuo.AutoDropDown := systemConfig.dropAuto;
  CBGoods.AutoDropDown := systemConfig.dropAuto;
  CBSpec.AutoDropDown := systemConfig.dropAuto;
  CBBackup1.AutoDropDown := systemConfig.dropAuto;
  CBBackup2.AutoDropDown := systemConfig.dropAuto;
  CBBackup3.AutoDropDown := systemConfig.dropAuto;
  CBBackup4.AutoDropDown := systemConfig.dropAuto;
  CBBackup5.AutoDropDown := systemConfig.dropAuto;
  CBBackup10.AutoDropDown := systemConfig.dropAuto;
  CBBackup11.AutoDropDown := systemConfig.dropAuto;
  CBBackup12.AutoDropDown := systemConfig.dropAuto;
  CBBackup13.AutoDropDown := systemConfig.dropAuto;
  CBBackup14.AutoDropDown := systemConfig.dropAuto;

  CBCar.AutoComplete := systemConfig.autoComplete;
  CBFaHuo.AutoComplete := systemConfig.autoComplete;
  CBShouHuo.AutoComplete := systemConfig.autoComplete;
  CBGoods.AutoComplete := systemConfig.autoComplete;
  CBSpec.AutoComplete := systemConfig.autoComplete;
  CBBackup1.AutoComplete := systemConfig.autoComplete;
  CBBackup2.AutoComplete := systemConfig.autoComplete;
  CBBackup3.AutoComplete := systemConfig.autoComplete;
  CBBackup4.AutoComplete := systemConfig.autoComplete;
  CBBackup5.AutoComplete := systemConfig.autoComplete;
  CBBackup10.AutoComplete := systemConfig.autoComplete;
  CBBackup11.AutoComplete := systemConfig.autoComplete;
  CBBackup12.AutoComplete := systemConfig.autoComplete;
  CBBackup13.AutoComplete := systemConfig.autoComplete;
  CBBackup14.AutoComplete := systemConfig.autoComplete;

  CBCar.TabStop := not CBCar.ReadOnly;
  CBFaHuo.TabStop := not CBFaHuo.ReadOnly;
  CBShouHuo.TabStop := not CBShouHuo.ReadOnly;
  CBGoods.TabStop := not CBGoods.ReadOnly;
  CBSpec.TabStop := not CBSpec.ReadOnly;
  EdtBundle.TabStop := not EdtBundle.ReadOnly;
  EdtPrice.TabStop := not EdtPrice.ReadOnly;
  EdtScale.TabStop := not EdtScale.ReadOnly;
  EdtMemo.TabStop := not EdtMemo.ReadOnly;
  CBBackup1.TabStop := not CBBackup1.ReadOnly;
  CBBackup2.TabStop := not CBBackup2.ReadOnly;
  CBBackup3.TabStop := not CBBackup3.ReadOnly;
  CBBackup4.TabStop := not CBBackup4.ReadOnly;
  CBBackup5.TabStop := not CBBackup5.ReadOnly;
  EdtBackup6.TabStop := not EdtBackup6.ReadOnly;
  EdtBackup7.TabStop := not EdtBackup7.ReadOnly;
  EdtBackup8.TabStop := not EdtBackup8.ReadOnly;
  EdtBackup9.TabStop := not EdtBackup9.ReadOnly;
  CBBackup10.TabStop := not CBBackup10.ReadOnly;
  CBBackup11.TabStop := not CBBackup11.ReadOnly;
  CBBackup12.TabStop := not CBBackup12.ReadOnly;
  CBBackup13.TabStop := not CBBackup13.ReadOnly;
  CBBackup14.TabStop := not CBBackup14.ReadOnly;
  EdtBackup15.TabStop := not EdtBackup15.ReadOnly;
  EdtBackup16.TabStop := not EdtBackup16.ReadOnly;
  EdtBackup17.TabStop := not EdtBackup17.ReadOnly;
  EdtBackup18.TabStop := not EdtBackup18.ReadOnly;
  EdtGross.TabStop := not EdtGross.ReadOnly;
  EdtTare.TabStop := not EdtTare.ReadOnly;
  EdtNet.TabStop := not EdtNet.ReadOnly;
  EdtReal.TabStop := not EdtReal.ReadOnly;
  EdtCost.TabStop := not EdtCost.ReadOnly;
  EdtSum.TabStop := not EdtSum.ReadOnly;
  EdtQuanter.TabStop := not EdtQuanter.ReadOnly;
end;

procedure TFrmWeight.BtnSetTareClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('预置维护') then
  begin
    //不允许皮重超过预置皮重
    if MainForm.systemConfig.notAllowTareExceed then
    begin
      if StrToFloatDef(getWeight, 0) > TPrepareUtil.getCarTare(CBCar.Text) then
      begin
        Application.MessageBox('车皮超差过大,不允许过磅', '错误', MB_OK
          + MB_ICONSTOP + MB_TOPMOST);
        lastGlideNo := '';
        Exit;
      end;
    end;

    if TPrepareUtil.updateCarTare(CBCar.Text, getWeight) then
    begin
      Application.MessageBox(PChar(Format('预置皮重成功!车号:[%s],皮重:[%s]',
        [CBCar.Text, getWeight])),
        '提示', MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
    end
    else
    begin
      Application.MessageBox('预置皮重失败!', '提示', MB_OK + MB_ICONSTOP +
        MB_TOPMOST);
    end;
  end;
end;

procedure TFrmWeight.CBBackup10Exit(Sender: TObject);
begin

  if MainForm.systemConfig.taoPrimayKey = 11 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用10=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup10ByCode((Sender as TRzComboBox).Text);
end;

procedure TFrmWeight.CBBackup11Exit(Sender: TObject);
begin

  if MainForm.systemConfig.taoPrimayKey = 12 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用11=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup11ByCode((Sender as TRzComboBox).Text);
end;

procedure TFrmWeight.CBBackup12Exit(Sender: TObject);
begin

  if MainForm.systemConfig.taoPrimayKey = 13 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用12=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup12ByCode((Sender as TRzComboBox).Text);
end;

procedure TFrmWeight.CBBackup13Exit(Sender: TObject);
begin

  if MainForm.systemConfig.taoPrimayKey = 14 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用13=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup13ByCode((Sender as TRzComboBox).Text);
end;

procedure TFrmWeight.CBBackup14Exit(Sender: TObject);
begin

  if MainForm.systemConfig.taoPrimayKey = 15 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用14=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup14ByCode((Sender as TRzComboBox).Text);
end;

procedure TFrmWeight.CBCarExit(Sender: TObject);
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select top 1 * from 称重信息 where (车号=:car) and (净重=0) order by 流水号 desc';
    Parameters.ParamByName('car').Value := CBCar.Text;
    Open;
    if not IsEmpty then
    begin
      CBCar.Text := FieldByName('车号').AsString;
      CBFaHuo.Text := FieldByName('发货单位').AsString;
      CBShouHuo.Text := FieldByName('收货单位').AsString;
      CBGoods.Text := FieldByName('货名').AsString;
      CBSpec.Text := FieldByName('规格').AsString;
      EdtBundle.Text := FieldByName('扣重').AsString;
      EdtPrice.Text := FieldByName('单价').AsString;
      EdtScale.Text := FieldByName('折方系数').AsString;
      if FieldByName('净重').AsFloat = 0 then
      begin
        EdtGross.Text := FieldByName('毛重').AsString;
        EdtTare.Text := FieldByName('皮重').AsString;
      end;
      CBBackup1.Text := FieldByName('备用1').AsString;
      CBBackup2.Text := FieldByName('备用2').AsString;
      CBBackup3.Text := FieldByName('备用3').AsString;
      CBBackup4.Text := FieldByName('备用4').AsString;
      CBBackup5.Text := FieldByName('备用5').AsString;
      EdtBackup6.Text := FieldByName('备用6').AsString;
      EdtBackup7.Text := FieldByName('备用7').AsString;
      EdtBackup8.Text := FieldByName('备用8').AsString;
      EdtBackup9.Text := FieldByName('备用9').AsString;

      CBBackup10.Text := FieldByName('备用10').AsString;
      CBBackup11.Text := FieldByName('备用11').AsString;
      CBBackup12.Text := FieldByName('备用12').AsString;
      CBBackup13.Text := FieldByName('备用13').AsString;
      CBBackup14.Text := FieldByName('备用14').AsString;
      EdtBackup15.Text := FieldByName('备用15').AsString;
      EdtBackup16.Text := FieldByName('备用16').AsString;
      EdtBackup17.Text := FieldByName('备用17').AsString;
      EdtBackup18.Text := FieldByName('备用18').AsString;
    end
    else
    begin
      if MainForm.systemConfig.taoPrimayKey = 1 then
      begin
        SQL.Text := 'select * from 套表 where (车号=:car) ';
        Parameters.ParamByName('car').Value := CBCar.Text;
        Open;
        if not IsEmpty then
        begin
          if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
          if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
          if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
          if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
          if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
          if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
          if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
          if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
          if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
          if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
          if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
          if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
          if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
          if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
          if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
        end;
      end;
      EdtTare.Text := FloatToStr(TPrepareUtil.getCarTare(CBCar.Text));
    end;
  end;
  if MainForm.systemConfig.useFilterForm then
    CBCar.Text := TPrepareUtil.getCarByFilter(CBCar.Text);
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

function TFrmWeight.clearWeight: Boolean;
begin
  EdtGross.Text := '0';
  EdtTare.Text := '0';
  EdtNet.Text := '0';
  EdtReal.Text := '0';
  EdtSum.Text := '0';
  EdtCost.Text := '0';
  EdtQuanter.Text := '0';
end;

function TFrmWeight.getSteady: Boolean;
begin
  if MainForm.systemConfig.allowNotSteady then
    Result := True
  else
  begin
    if PWeight1.Color = clBlack then
      Result := AniSteady1.ImageIndex = 1
    else
      Result := AniSteady2.ImageIndex = 1;
  end;
end;

function TFrmWeight.setLastWeightInfo(ds: TDataSet): Boolean;
begin
  with ds do
  begin
    if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
    if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
    if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
    if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
    if FieldByName('扣重').AsFloat <> 0 then EdtBundle.Text := FieldByName('扣重').AsString;
    if FieldByName('单价').AsFloat <> 0 then EdtPrice.Text := FieldByName('单价').AsString;
    if FieldByName('折方系数').AsFloat <> 1 then EdtScale.Text := FieldByName('折方系数').AsString;
    if FieldByName('过磅费').AsFloat <> 0 then EdtCost.Text := FieldByName('过磅费').AsString;
    if FieldByName('备注').AsString <> '' then EdtMemo.Text := FieldByName('备注').AsString;
    if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
    if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
    if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
    if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
    if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
    if FieldByName('备用6').AsFloat <> 0 then EdtBackup6.Text := FieldByName('备用6').AsString;
    if FieldByName('备用7').AsFloat <> 0 then EdtBackup7.Text := FieldByName('备用7').AsString;
    if FieldByName('备用8').AsFloat <> 0 then EdtBackup8.Text := FieldByName('备用8').AsString;
    if FieldByName('备用9').AsFloat <> 0 then EdtBackup9.Text := FieldByName('备用9').AsString;
    if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
    if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
    if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
    if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
    if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
    if FieldByName('备用15').AsFloat <> 0 then EdtBackup15.Text := FieldByName('备用15').AsString;
    if FieldByName('备用16').AsFloat <> 0 then EdtBackup16.Text := FieldByName('备用16').AsString;
    if FieldByName('备用17').AsFloat <> 0 then EdtBackup17.Text := FieldByName('备用17').AsString;
    if FieldByName('备用18').AsFloat <> 0 then EdtBackup18.Text := FieldByName('备用18').AsString;
  end;
end;

function TFrmWeight.resizeFrame: Boolean;
begin
  //载入控件位置信息 ,从MainForm的poWeightSetConfig中读取
  //1.将所有控件放到主窗体中去
  clearPosition();
  //2.将控件摆到配置的位置上去
  setPosition();
  //3.刷新窗体,调整控件的长度
  resizeWidth;
end;

function TFrmWeight.clearPosition: Boolean;
begin
  lblCar.Visible := False;
  CBCar.Visible := False;
  lblFaHuo.Visible := False;
  CBFaHuo.Visible := False;
  lblShouHuo.Visible := False;
  CBShouHuo.Visible := False;
  lblGoods.Visible := False;
  CBGoods.Visible := False;
  lblSpec.Visible := False;
  CBSpec.Visible := False;
  lblScale.Visible := False;
  EdtScale.Visible := False;
  lblBundle.Visible := False;
  EdtBundle.Visible := False;
  lblPrice.Visible := False;
  EdtPrice.Visible := False;
  lblMemo.Visible := False;
  EdtMemo.Visible := False;
  lblBackup1.Visible := False;
  CBBackup1.Visible := False;
  lblBackup2.Visible := False;
  CBBackup2.Visible := False;
  lblBackup3.Visible := False;
  CBBackup3.Visible := False;
  lblBackup4.Visible := False;
  CBBackup4.Visible := False;
  lblBackup5.Visible := False;
  CBBackup5.Visible := False;
  lblBackup6.Visible := False;
  EdtBackup6.Visible := False;
  lblBackup7.Visible := False;
  EdtBackup7.Visible := False;
  lblBackup8.Visible := False;
  EdtBackup8.Visible := False;
  lblBackup9.Visible := False;
  EdtBackup9.Visible := False;
  lblBackup10.Visible := False;
  CBBackup10.Visible := False;
  lblBackup11.Visible := False;
  CBBackup11.Visible := False;
  lblBackup12.Visible := False;
  CBBackup12.Visible := False;
  lblBackup13.Visible := False;
  CBBackup13.Visible := False;
  lblBackup14.Visible := False;
  CBBackup14.Visible := False;
  lblBackup15.Visible := False;
  EdtBackup15.Visible := False;
  lblBackup16.Visible := False;
  EdtBackup16.Visible := False;
  lblBackup17.Visible := False;
  EdtBackup17.Visible := False;
  lblBackup18.Visible := False;
  EdtBackup18.Visible := False;
  lblGross.Visible := False;
  EdtGross.Visible := False;
  lblTare.Visible := False;
  EdtTare.Visible := False;
  lblNet.Visible := False;
  EdtNet.Visible := False;
  lblReal.Visible := False;
  EdtReal.Visible := False;
  lblSum.Visible := False;
  EdtSum.Visible := False;
  lblCost.Visible := False;
  EdtCost.Visible := False;
  lblQuanter.Visible := False;
  EdtQuanter.Visible := False;
end;

function TFrmWeight.resizeWidth: Boolean;
var i, wInput, wPanel: Integer;
begin
  PWeight1.Color := clBlack;
  P0.Visible := False;
  for i := 0 to P0.ControlCount - 1 do
  begin
    if P0.Controls[i].Visible then
      P0.Visible := True;
  end;

  P1.Visible := False;
  for i := 0 to P1.ControlCount - 1 do
  begin
    if P1.Controls[i].Visible then
      P1.Visible := True;
  end;

  P2.Visible := False;
  for i := 0 to P2.ControlCount - 1 do
  begin
    if P2.Controls[i].Visible then
      P2.Visible := True;
  end;

  P3.Visible := False;
  for i := 0 to P3.ControlCount - 1 do
  begin
    if P3.Controls[i].Visible then
      P3.Visible := True;
  end;

  wInput := PInput.Width - PInput.BorderWidth * 2;
  if P0.Visible then
  begin
    if P1.Visible then
    begin
      if P2.Visible then
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 4;
          P0.Width := wPanel;
          P1.Width := wPanel;
          P2.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 3;
          P0.Width := wPanel;
          P1.Width := wPanel;
          P2.Width := wPanel;
        end;
      end
      else
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 3;
          P0.Width := wPanel;
          P1.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 2;
          P0.Width := wPanel;
          P1.Width := wPanel;
        end;
      end;
    end
    else
    begin
      if P2.Visible then
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 3;
          P0.Width := wPanel;
          P2.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 2;
          P0.Width := wPanel;
          P2.Width := wPanel;
        end;
      end
      else
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 2;
          P0.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 1;
          P0.Width := wPanel;
        end;
      end;
    end;
  end;
  CBCar.Width := wPanel - 125;
  BtnCarNo.Left := CBCar.Left + CBCar.Width + 2;
  CBFaHuo.Width := wPanel - 95;
  CBShouHuo.Width := wPanel - 95;
  CBGoods.Width := wPanel - 95;
  CBSpec.Width := wPanel - 95;
  EdtBundle.Width := wPanel - 95;
  EdtPrice.Width := wPanel - 95;
  EdtScale.Width := wPanel - 95;
  EdtMemo.Width := wPanel - 95;
  CBBackup1.Width := wPanel - 95;
  CBBackup2.Width := wPanel - 95;
  CBBackup3.Width := wPanel - 95;
  CBBackup4.Width := wPanel - 95;
  CBBackup5.Width := wPanel - 95;
  EdtBackup6.Width := wPanel - 95;
  EdtBackup7.Width := wPanel - 95;
  EdtBackup8.Width := wPanel - 95;
  EdtBackup9.Width := wPanel - 95;
  CBBackup10.Width := wPanel - 95;
  CBBackup11.Width := wPanel - 95;
  CBBackup12.Width := wPanel - 95;
  CBBackup13.Width := wPanel - 95;
  CBBackup14.Width := wPanel - 95;
  EdtBackup15.Width := wPanel - 95;
  EdtBackup16.Width := wPanel - 95;
  EdtBackup17.Width := wPanel - 95;
  EdtBackup18.Width := wPanel - 95;
  EdtGross.Width := wPanel - 95;
  EdtTare.Width := wPanel - 95;
  EdtNet.Width := wPanel - 95;
  EdtReal.Width := wPanel - 95;
  EdtSum.Width := wPanel - 95;
  EdtCost.Width := wPanel - 95;
  EdtQuanter.Width := wPanel - 95;

  P0.Left := 100; P1.Left := 500; P2.Left := 1000; P3.Left := 1500;
  P00.Top := 100; P10.Top := 100; P20.Top := 100; P30.Top := 100;
  P01.Top := 200; P11.Top := 200; P21.Top := 200; P31.Top := 200;
  P02.Top := 300; P12.Top := 300; P22.Top := 300; P32.Top := 300;
  P03.Top := 400; P13.Top := 400; P23.Top := 400; P33.Top := 400;
  P04.Top := 500; P14.Top := 500; P24.Top := 500; P34.Top := 500;
  P05.Top := 600; P15.Top := 600; P25.Top := 600; P35.Top := 600;
  P06.Top := 700; P16.Top := 700; P26.Top := 700; P36.Top := 700;
  P07.Top := 800; P17.Top := 800; P27.Top := 800;
  P08.Top := 900; P18.Top := 900; P28.Top := 900;
end;

function TFrmWeight.setPosition: Boolean;
begin
  loadFormDesign(MainForm.poWeightSetConfig.pv00, P00);
  loadFormDesign(MainForm.poWeightSetConfig.pv01, P01);
  loadFormDesign(MainForm.poWeightSetConfig.pv02, P02);
  loadFormDesign(MainForm.poWeightSetConfig.pv03, P03);
  loadFormDesign(MainForm.poWeightSetConfig.pv04, P04);
  loadFormDesign(MainForm.poWeightSetConfig.pv05, P05);
  loadFormDesign(MainForm.poWeightSetConfig.pv06, P06);
  loadFormDesign(MainForm.poWeightSetConfig.pv07, P07);
  loadFormDesign(MainForm.poWeightSetConfig.pv08, P08);

  loadFormDesign(MainForm.poWeightSetConfig.pv10, P10);
  loadFormDesign(MainForm.poWeightSetConfig.pv11, P11);
  loadFormDesign(MainForm.poWeightSetConfig.pv12, P12);
  loadFormDesign(MainForm.poWeightSetConfig.pv13, P13);
  loadFormDesign(MainForm.poWeightSetConfig.pv14, P14);
  loadFormDesign(MainForm.poWeightSetConfig.pv15, P15);
  loadFormDesign(MainForm.poWeightSetConfig.pv16, P16);
  loadFormDesign(MainForm.poWeightSetConfig.pv17, P17);
  loadFormDesign(MainForm.poWeightSetConfig.pv18, P18);

  loadFormDesign(MainForm.poWeightSetConfig.pv20, P20);
  loadFormDesign(MainForm.poWeightSetConfig.pv21, P21);
  loadFormDesign(MainForm.poWeightSetConfig.pv22, P22);
  loadFormDesign(MainForm.poWeightSetConfig.pv23, P23);
  loadFormDesign(MainForm.poWeightSetConfig.pv24, P24);
  loadFormDesign(MainForm.poWeightSetConfig.pv25, P25);
  loadFormDesign(MainForm.poWeightSetConfig.pv26, P26);
  loadFormDesign(MainForm.poWeightSetConfig.pv27, P27);
  loadFormDesign(MainForm.poWeightSetConfig.pv28, P28);

  loadFormDesign(MainForm.poWeightSetConfig.pv30, P30);
  loadFormDesign(MainForm.poWeightSetConfig.pv31, P31);
  loadFormDesign(MainForm.poWeightSetConfig.pv32, P32);
  loadFormDesign(MainForm.poWeightSetConfig.pv33, P33);
  loadFormDesign(MainForm.poWeightSetConfig.pv34, P34);
  loadFormDesign(MainForm.poWeightSetConfig.pv35, P35);
  loadFormDesign(MainForm.poWeightSetConfig.pv36, P36);
end;

procedure TFrmWeight.loadFormDesign(const pv: string; pWin: TPanel);
var lblWin: TRzLabel;
  cbWin: TWinControl;
begin
  pWin.Visible := True;
  if pv = '车号' then
  begin
    lblWin := lblCar;
    cbWin := CBCar;

    BtnCarNo.Visible := True;
    BtnCarNo.Parent := pWin;
    BtnCarNo.Top := 1;
    BtnCarNo.Left := 94 + cbWin.Width;
    BtnCarNo.BringToFront;
  end
  else if pv = '发货单位' then
  begin
    lblWin := lblFaHuo;
    cbWin := CBFaHuo;
  end
  else if pv = '收货单位' then
  begin
    lblWin := lblShouHuo;
    cbWin := CBShouHuo;
  end
  else if pv = '货名' then
  begin
    lblWin := lblGoods;
    cbWin := CBGoods;
  end
  else if pv = '规格' then
  begin
    lblWin := lblSpec;
    cbWin := CBSpec;
  end
  else if pv = '折方系数' then
  begin
    lblWin := lblScale;
    cbWin := EdtScale;
  end
  else if pv = '扣重' then
  begin
    lblWin := lblBundle;
    cbWin := EdtBundle;
  end
  else if pv = '单价' then
  begin
    lblWin := lblPrice;
    cbWin := EdtPrice;
  end
  else if pv = '备注' then
  begin
    lblWin := lblMemo;
    cbWin := EdtMemo;
  end
  else if pv = '备用1' then
  begin
    lblWin := lblBackup1;
    cbWin := CBBackup1;
  end
  else if pv = '备用2' then
  begin
    lblWin := lblBackup2;
    cbWin := CBBackup2;
  end
  else if pv = '备用3' then
  begin
    lblWin := lblBackup3;
    cbWin := CBBackup3;
  end
  else if pv = '备用4' then
  begin
    lblWin := lblBackup4;
    cbWin := CBBackup4;
  end
  else if pv = '备用5' then
  begin
    lblWin := lblBackup5;
    cbWin := CBBackup5;
  end
  else if pv = '备用6' then
  begin
    lblWin := lblBackup6;
    cbWin := EdtBackup6;
  end
  else if pv = '备用7' then
  begin
    lblWin := lblBackup7;
    cbWin := EdtBackup7;
  end
  else if pv = '备用8' then
  begin
    lblWin := lblBackup8;
    cbWin := EdtBackup8;
  end
  else if pv = '备用9' then
  begin
    lblWin := lblBackup9;
    cbWin := EdtBackup9;
  end
  else if pv = '备用10' then
  begin
    lblWin := lblBackup10;
    cbWin := CBBackup10;
  end
  else if pv = '备用11' then
  begin
    lblWin := lblBackup11;
    cbWin := CBBackup11;
  end
  else if pv = '备用12' then
  begin
    lblWin := lblBackup12;
    cbWin := CBBackup12;
  end
  else if pv = '备用13' then
  begin
    lblWin := lblBackup13;
    cbWin := CBBackup13;
  end
  else if pv = '备用14' then
  begin
    lblWin := lblBackup14;
    cbWin := CBBackup14;
  end
  else if pv = '备用15' then
  begin
    lblWin := lblBackup15;
    cbWin := EdtBackup15;
  end
  else if pv = '备用16' then
  begin
    lblWin := lblBackup16;
    cbWin := EdtBackup16;
  end
  else if pv = '备用17' then
  begin
    lblWin := lblBackup17;
    cbWin := EdtBackup17;
  end
  else if pv = '备用18' then
  begin
    lblWin := lblBackup18;
    cbWin := EdtBackup18;
  end
  else if pv = '毛重' then
  begin
    lblWin := lblGross;
    cbWin := EdtGross;
  end
  else if pv = '皮重' then
  begin
    lblWin := lblTare;
    cbWin := EdtTare;
  end
  else if pv = '净重' then
  begin
    lblWin := lblNet;
    cbWin := EdtNet;
  end
  else if pv = '实重' then
  begin
    lblWin := lblReal;
    cbWin := EdtReal;
  end
  else if pv = '金额' then
  begin
    lblWin := lblSum;
    cbWin := EdtSum;
  end
  else if pv = '过磅费' then
  begin
    lblWin := lblCost;
    cbWin := EdtCost;
  end
  else if pv = '方量' then
  begin
    lblWin := lblQuanter;
    cbWin := EdtQuanter;
  end
  else
    pWin.Visible := False;

  if (pv <> '') and (pWin.Visible) then
  begin
    lblWin.Visible := True;
    lblWin.Parent := pWin;
    lblWin.Align := alLeft;
    cbWin.Visible := True;
    cbWin.Parent := pWin;
    cbWin.Top := 1;
    cbWin.Left := 92;
    pWin.Visible := True;
  end;
end;

function TFrmWeight.startSteady(start: Boolean): Boolean;
begin
  TSteady.Enabled := start;
end;

procedure TFrmWeight.EdtBundleChange(Sender: TObject);
begin
  calcSum;
  if (BtnSave.Enabled or BitBtnSave.Enabled) and (MainForm.systemConfig.autoUpdateExpression) then
    setExpressionValue;
end;

procedure TFrmWeight.EdtScaleChange(Sender: TObject);
begin
  calcSum;
  if (BtnSave.Enabled or BitBtnSave.Enabled) and (MainForm.systemConfig.autoUpdateExpression) then
    setExpressionValue;
end;

procedure TFrmWeight.EdtPriceChange(Sender: TObject);
begin
  calcSum;
  if (BtnSave.Enabled or BitBtnSave.Enabled) and (MainForm.systemConfig.autoUpdateExpression) then
    setExpressionValue;
end;

procedure TFrmWeight.EdtGrossChange(Sender: TObject);
begin
  if (Sender as TRzEdit).Enabled then
  begin
    if (StrToFloatDef(EdtGross.Text, 0) <> 0) and (StrToFloatDef(EdtTare.Text, 0) <> 0) then
    begin
      calcNet;
    end
    else if (StrToFloatDef(EdtGross.Text, 0) = 0) or (StrToFloatDef(EdtTare.Text, 0) = 0) then
    begin
      EdtNet.Text := '0';
    end;
  end;
  if (BtnSave.Enabled or BitBtnSave.Enabled) and (MainForm.systemConfig.autoUpdateExpression) then
    setExpressionValue;
end;

procedure TFrmWeight.EdtTareChange(Sender: TObject);
begin
  if (Sender as TRzEdit).Enabled then
  begin
    if (StrToFloatDef(EdtGross.Text, 0) <> 0) and (StrToFloatDef(EdtTare.Text, 0) <> 0) then
    begin
      calcNet;
    end
    else if (StrToFloatDef(EdtGross.Text, 0) = 0) or (StrToFloatDef(EdtTare.Text, 0) = 0) then
    begin
      EdtNet.Text := '0';
    end;
  end;
  if (BtnSave.Enabled or BitBtnSave.Enabled) and (MainForm.systemConfig.autoUpdateExpression) then
    setExpressionValue;
end;

procedure TFrmWeight.RBStandardClick(Sender: TObject);
begin
  PStandard.Visible := True;
  PSimple.Visible := False;
end;

procedure TFrmWeight.RBSimpleClick(Sender: TObject);
begin
  PStandard.Visible := False;
  PSimple.Visible := True;
end;

procedure TFrmWeight.RBOnceClick(Sender: TObject);
begin
  PStandard.Visible := False;
  PSimple.Visible := True;
end;

procedure TFrmWeight.CBBackup1Exit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup1ByCode(
    (Sender as TRzComboBox).Text);

  if MainForm.systemConfig.taoPrimayKey = 6 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用1=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBBackup2Exit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup2ByCode(
    (Sender as TRzComboBox).Text);

  if MainForm.systemConfig.taoPrimayKey = 7 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用2=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBBackup3Exit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup3ByCode(
    (Sender as TRzComboBox).Text);

  if MainForm.systemConfig.taoPrimayKey = 8 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用3=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBBackup4Exit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup4ByCode(
    (Sender as TRzComboBox).Text);

  if MainForm.systemConfig.taoPrimayKey = 9 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用4=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

procedure TFrmWeight.CBBackup5Exit(Sender: TObject);
begin
  (Sender as TRzComboBox).Text := TPrepareUtil.getBackup5ByCode(
    (Sender as TRzComboBox).Text);

  if MainForm.systemConfig.taoPrimayKey = 10 then
  begin
    with QueryDataModule.ADOQExec do
    begin
      Close;
      SQL.Text := 'select * from 套表 where (备用5=:car) ';
      Parameters.ParamByName('car').Value := (Sender as TRzComboBox).Text;
      Open;
      if not IsEmpty then
      begin
        if FieldByName('车号').AsString <> '' then CBCar.Text := FieldByName('车号').AsString;
        if FieldByName('发货单位').AsString <> '' then CBFaHuo.Text := FieldByName('发货单位').AsString;
        if FieldByName('收货单位').AsString <> '' then CBShouHuo.Text := FieldByName('收货单位').AsString;
        if FieldByName('货名').AsString <> '' then CBGoods.Text := FieldByName('货名').AsString;
        if FieldByName('规格').AsString <> '' then CBSpec.Text := FieldByName('规格').AsString;
        if FieldByName('备用1').AsString <> '' then CBBackup1.Text := FieldByName('备用1').AsString;
        if FieldByName('备用2').AsString <> '' then CBBackup2.Text := FieldByName('备用2').AsString;
        if FieldByName('备用3').AsString <> '' then CBBackup3.Text := FieldByName('备用3').AsString;
        if FieldByName('备用4').AsString <> '' then CBBackup4.Text := FieldByName('备用4').AsString;
        if FieldByName('备用5').AsString <> '' then CBBackup5.Text := FieldByName('备用5').AsString;
        if FieldByName('备用10').AsString <> '' then CBBackup10.Text := FieldByName('备用10').AsString;
        if FieldByName('备用11').AsString <> '' then CBBackup11.Text := FieldByName('备用11').AsString;
        if FieldByName('备用12').AsString <> '' then CBBackup12.Text := FieldByName('备用12').AsString;
        if FieldByName('备用13').AsString <> '' then CBBackup13.Text := FieldByName('备用13').AsString;
        if FieldByName('备用14').AsString <> '' then CBBackup14.Text := FieldByName('备用14').AsString;
      end;
    end;
  end;
  if MainForm.systemConfig.sayCombo then
  begin
    MainForm.speak((Sender as TRzComboBox).Text);
  end;
end;

function TFrmWeight.calcNet: Boolean;
begin
  EdtNet.Text := FloatToStr(StrToFloatDef(EdtGross.Text, 0) - StrToFloatDef(EdtTare.Text, 0));

  if MainForm.systemConfig.useBundleRate then
    EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
      * (1 - StrToFloatDef(EdtBundle.Text, 0) / 100), 1,
      0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType))
  else
    EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
      - StrToFloatDef(EdtBundle.Text, 0), 1,
      0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType));

  EdtSum.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
    * StrToFloatDef(EdtPrice.Text, 0), MainForm.systemConfig.sumDivide,
    0 - MainForm.systemConfig.sumPoint, MainForm.systemConfig.sumType));

  if (StrToFloatDef(EdtScale.Text, 1) <> 0) then
  begin
    EdtQuanter.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
      / StrToFloatDef(EdtScale.Text, 1), MainForm.systemConfig.quanterDivide,
      0 - MainForm.systemConfig.quanterPoint, MainForm.systemConfig.sumType));
  end;
end;

function TFrmWeight.setSimpleBtnState(st: Boolean): Boolean;
begin
  BtnWeight.Enabled := st;
  BtnSave.Enabled := not st;
  BtnPrint.Enabled := not st;

  setNotChangeItem(st);

  if not st then
    BtnCancel.Caption := '取消(&C)'
  else
    BtnCancel.Caption := '清空(&C)';
  if st then
    P00SetFocus;
end;

function TFrmWeight.getMust: Boolean;
begin
  if MainForm.poWeightSetConfig.carMust and (Trim(CBCar.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.faHuoMust and (Trim(CBFaHuo.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.shouHuoMust and (Trim(CBShouHuo.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.goodsMust and (Trim(CBGoods.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.specMust and (Trim(CBSpec.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.bundleMust and (Trim(EdtBundle.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.priceMust and (Trim(EdtPrice.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.scaleMust and (Trim(EdtScale.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.memoMust and (Trim(EdtMemo.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup1Must and (Trim(CBBackup1.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup2Must and (Trim(CBBackup2.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup3Must and (Trim(CBBackup3.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup4Must and (Trim(CBBackup4.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup5Must and (Trim(CBBackup5.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup6Must and (Trim(EdtBackup6.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup7Must and (Trim(EdtBackup7.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup8Must and (Trim(EdtBackup8.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup9Must and (Trim(EdtBackup9.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup10Must and (Trim(CBBackup10.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup11Must and (Trim(CBBackup11.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup12Must and (Trim(CBBackup12.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup13Must and (Trim(CBBackup13.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup14Must and (Trim(CBBackup14.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup15Must and (Trim(EdtBackup15.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup16Must and (Trim(EdtBackup16.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup17Must and (Trim(EdtBackup17.Text) = '') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.backup18Must and (Trim(EdtBackup18.Text) = '') then begin Result := False; Exit; end;

  if MainForm.poWeightSetConfig.grossMust and (Trim(EdtGross.Text) = '0') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.tareMust and (Trim(EdtTare.Text) = '0') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.netMust and (Trim(EdtNet.Text) = '0') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.realMust and (Trim(EdtReal.Text) = '0') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.sumMust and (Trim(EdtSum.Text) = '0') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.costMust and (Trim(EdtCost.Text) = '0') then begin Result := False; Exit; end;
  if MainForm.poWeightSetConfig.quanterMust and (Trim(EdtQuanter.Text) = '0') then begin Result := False; Exit; end;
  Result := True;
end;

function TFrmWeight.setBtnState(st: Boolean): Boolean;
begin
  BitBtnGross.Enabled := st;
  BitBtnTare.Enabled := st;
  BitBtnSave.Enabled := not st;
  BitBtnPrint.Enabled := not st;

  setNotChangeItem(st);

  if not st then
    BitBtnClear.Caption := '取消(&C)'
  else
    BitBtnClear.Caption := '清空(&C)';
  if st then
    P00SetFocus;
end;

procedure TFrmWeight.P00SetFocus;
var i: Integer;
begin
  for i := 0 to P00.ControlCount - 1 do
  begin
    if P00.Controls[i].Visible then
    begin
      if (P00.Controls[i] is TRzComboBox) then
      begin
        if (P00.Controls[i] as TRzComboBox).Enabled then
          (P00.Controls[i] as TRzComboBox).SetFocus();
        Break;
      end;
      if (P00.Controls[i] is TRzEdit) then
      begin
        if (P00.Controls[i] as TRzEdit).Enabled then
          (P00.Controls[i] as TRzEdit).SetFocus;
        Break;
      end;
    end;
  end;
end;

function TFrmWeight.getWeight: string;
begin
  if not MainForm.systemConfig.doubleAdd then
  begin
    if PMeter2.Visible then
    begin
      if PWeight1.Color = clBlack then
        Result := PWeight1.Caption
      else
        Result := PWeight2.Caption;
    end
    else
    begin
      Result := PWeight1.Caption;
    end;
  end
  else
  begin
    Result := FloatToStr(StrToFloatDef(PWeight1.Caption, 0) + StrToFloatDef(PWeight2.Caption, 0));
  end;
end;

function TFrmWeight.showMeter2(): Boolean;
begin
  PMeter2.Visible := not PMeter2.Visible;
  PWeight1.Color := clBlack;
  PWeight2.Color := clWindow;
end;

procedure TFrmWeight.CBCarDblClick(Sender: TObject);
begin
  CarForm.CBCar.Text := CBCar.Text;
  try
    CarForm.ShowModal;
  finally
    CBCar.Text := CarForm.CBCar.Text;
  end;
end;

procedure TFrmWeight.PWeight1Click(Sender: TObject);
begin
  PWeight1.Color := clBlack;
  PWeight2.Color := clWindow;
end;

procedure TFrmWeight.PWeight2Click(Sender: TObject);
begin
  PWeight1.Color := clWindow;
  PWeight2.Color := clBlack;
end;

procedure TFrmWeight.PWeight1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if TUserUtil.HasAuthority('管理员') then
    PWeight1.Caption := InputBox('', '', '0');
end;

procedure TFrmWeight.CBAutoClick(Sender: TObject);
begin
  setAutoState;
end;

procedure TFrmWeight.TAutoTimer(Sender: TObject);
var w: Double;
begin
  case MainForm.systemConfig.saveByInterval of
    0: begin
        case autoStep of
          0: begin
              if StrToFloatDef(getWeight(), 0) > MainForm.systemConfig.returnZero then
              begin
                addAutoDebug('检测到上秤信号,数据保存中...');

                if MainForm.systemConfig.saveAfterReturnZero then
                begin
                  if getSteady then
                  begin
                    lastSteadyWeight := StrToFloatDef(getWeight(), 0);
                    Inc(autoStep);
                  end;
                end
                else
                begin
                  try
                    TAuto.Enabled := False;
                    if weightAndSave then
                    begin
                      MainForm.speak(MainForm.systemConfig.completeHint);
                      addAutoDebug('数据保存完毕,请下秤...');
                      Inc(autoStep);
                    end;
                  finally
                    TAuto.Enabled := True;
                  end;
                end;
              end;
            end;
          1: begin
              if MainForm.systemConfig.saveAfterReturnZero then
              begin
                if StrToFloatDef(getWeight(), 0) <= MainForm.systemConfig.returnZero then
                begin
                  TAuto.Enabled := False;
                  try
                    if weightAndSave(lastSteadyWeight) then
                    begin
                      MainForm.speak(MainForm.systemConfig.completeHint);
                      addAutoDebug('数据保存完毕');
                      clearInfo;
                      autoStep := 0;
                    end;
                  finally
                    TAuto.Enabled := True;
                  end;
                end
                else
                begin
                  if getSteady then
                  begin
                    lastSteadyWeight := StrToFloatDef(getWeight(), 0);
                  end;
                end;
              end
              else
              begin
                if StrToFloatDef(getWeight(), 0) <= MainForm.systemConfig.returnZero then
                begin
                  clearInfo;
                  MainForm.speak(MainForm.systemConfig.carOutHint);
                  addAutoDebug('已下秤,等待信号...');
                  autoStep := 0;
                end;
              end;
            end;
        end;
      end;
    1: begin
        if StrToFloatDef(getWeight(), 0) > MainForm.systemConfig.returnZero then
        begin
          addAutoDebug('检测到上秤信号,数据保存中...');
          try
            TAuto.Enabled := False;
            if weightAndSave then
            begin
              MainForm.speak(MainForm.systemConfig.completeHint);
              addAutoDebug('数据保存完毕');
              Inc(autoStep);
            end;
          finally
            TAuto.Enabled := True;
          end;
        end;
      end;
    2: begin
        case autoStep of
          0: begin
              w := StrToFloatDef(getWeight(), 0);
              if (w >= MainForm.systemConfig.saveQuantity - MainForm.systemConfig.lowerLimit)
                and (w <= MainForm.systemConfig.saveQuantity + MainForm.systemConfig.upperLimit)
                then
              begin
                addAutoDebug('到达定量值，数据保存中...');
                try
                  TAuto.Enabled := False;
                  if weightAndSave then
                  begin
                    MainForm.speak(MainForm.systemConfig.completeHint);
                    addAutoDebug('数据保存完毕,请下秤...');
                    Inc(autoStep);
                  end;
                finally
                  TAuto.Enabled := True;
                end;
              end;
            end;
          1: begin
              if StrToFloatDef(getWeight(), 0) <= MainForm.systemConfig.returnZero then
              begin
                clearInfo;
                MainForm.speak(MainForm.systemConfig.carOutHint);
                addAutoDebug('已下秤,等待信号...');
                autoStep := 0;
              end;
            end;
        end;
      end;
  end;
end;

function TFrmWeight.weightAndSave: Boolean;
var carTare: Double;
  sqlStr: string;
  lowCredit: Boolean;
begin
  clearWeight; //清空重量
  if StrToFloatDef(getWeight(), 0) <= 0 then
  begin
    Result := False;
    Exit;
  end;
  if not getSteady then
  begin
    Result := False;
    Exit;
  end;
  if not getMust() then //输入必填项目
  begin
    Result := False;
    Exit;
  end;
  if MainForm.systemConfig.simpleMode = 0 then
    EdtGross.Text := getWeight
  else
    EdtTare.Text := getWeight;

  UpdateRecNo := ''; //如果是更新的话，取上一次的号码
  WeightType := 'insert'; //称重类型，一种是插入，一种是更新
  WeightField := 'first'; //默认是第一次过磅
  //自动保存不能连接保存得过快
  //如果在重复过磅时间内，就不允许过磅
  if MainForm.systemConfig.useSaveInterval then
  begin
    if TWeightUtil.lessThanMinSaveInterval(CBCar.Text) then
    begin
      addAutoDebug('重复过磅时间过短,不允许过磅');
      Result := False;
      Exit;
    end;
  end;
  //一次过磅
  if RBOnce.Checked then
  begin
    carTare := TPrepareUtil.getCarTare(CBCar.Text);
    if carTare > 0 then
      EdtTare.Text := FloatToStr(carTare);
    calcNet;
  end
  else
  begin
    SimpleWeightFindFirst(); //找第一次过磅记录
  end;
  VideoForm.takePhoto; //拍照
  Sleep(200);

  setCostValue(); //设置过磅费
  setExpressionValue(); //设置有公式编辑的字段
  TReadWeight.Enabled := MainForm.systemConfig.UseVoice; //开始朗读
  //没加密狗只能用15天或者500条记录
  if not TDog.DogExists() then
  begin
    if TDog.RegTimeOut then
    begin
      Result := False;
      Exit;
    end;
  end;
  //如果有收费功能，信用额度过低就不允许过磅
  if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
  begin
    case MainForm.systemConfig.payType of
      0: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
      1: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtReal.Text, 0));
      2: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtQuanter.Text, 0));
      3: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup6.Text, 0));
      4: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup7.Text, 0));
      5: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup8.Text, 0));
      6: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup9.Text, 0));
      7: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup15.Text, 0));
      8: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup16.Text, 0));
      9: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup17.Text, 0));
      10: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup18.Text, 0));
    else
      lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
    end;
    if lowCredit then
    begin
      addAutoDebug('该单位当前金额不足，请先续费');
      Result := False;
      Exit;
    end;
  end;

  //如果用出厂流水号，就用备用1
  if MainForm.systemConfig.useOutGlideNo then
  begin
    if StrToFloatDef(EdtReal.Text, 0) > 0 then
      CBBackup1.Text := TWeightUtil.getMaxOutGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
  end;
  if MainForm.systemConfig.recordCorrect then
  begin
    if MeterConnect1Form.cheat <> 0 then
      EdtBackup17.Text := FloatToStr(MeterConnect1Form.cheat);
  end;

  if ((WeightType = 'insert') or (WeightType = 'pre') or (WeightType = 'manual'))
    then
  begin
    MaxGlideNo := TWeightUtil.getMaxGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
      + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,'
      + '方量,过磅费,';
    if (WeightType = 'pre') or (WeightType = 'manual') then
      sqlStr := sqlStr + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
    else if WeightField = 'first' then
    begin
      if MainForm.systemConfig.simpleMode = 0 then
        sqlStr := sqlStr + '毛重司磅员,毛重磅号,毛重时间,'
      else
        sqlStr := sqlStr + '皮重司磅员,皮重磅号,皮重时间,';
    end;
    sqlStr := sqlStr + '一次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
      + '备用1,备用2,备用3,备用4,'
      + '备用5,备用6,备用7,备用8,备用9,'
      + '备用10,备用11,备用12,备用13,备用14,'
      + '备用15,备用16,备用17,备用18)';

    sqlstr := sqlstr + ' values(:glideNo,:car,:weightType,:fahuo,:shouhuo,'
      + ':goods,:spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,'
      + ':quanter,:charge,';
    if (WeightType = 'pre') or (WeightType = 'manual') then
      sqlstr := sqlstr + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grossTime,:tareTime,'
    else if WeightField = 'first' then
    begin
      if MainForm.systemConfig.simpleMode = 0 then
        sqlstr := sqlstr + ':grossMan,:grossAddr,:grossTime,'
      else
        sqlstr := sqlstr + ':tareMan,:tareAddr,:tareTime,'
    end;
    sqlstr := sqlstr + ':firstTime,:updateUser,:updateTime,:remark,:printCount,:upload,'
      + ':backup1,:backup2,:backup3,:backup4,:backup5,'
      + ':backup6,:backup7,:backup8,:backup9,:backup10,'
      + ':backup11,:backup12,:backup13,:backup14,:backup15,'
      + ':backup16,:backup17,:backup18)';
  end
  else if (WeightType = 'update') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update 称重信息 set 发货单位=:fahuo,收货单位=:shouhuo,'
      + '货名=:goods,规格=:spec,毛重=:gross,皮重=:tare,净重=:net,扣重=:bundle,'
      + '实重=:real,单价=:price,金额=:sum,折方系数=:scale,方量=:quanter,过磅费=:charge,';

    sqlstr := sqlstr + '毛重司磅员=:grossMan,毛重磅号=:grossAddr,毛重时间=:grossTime,'
      + '皮重司磅员=:tareMan,皮重磅号=:tareAddr,皮重时间=:tareTime,';

    sqlstr := sqlstr + '二次过磅时间=:secondTime,更新人=:updateUser,更新时间=:updateTime,'
      + '备注=:remark,备用1=:backup1,备用2=:backup2,'
      + '备用3=:backup3,备用4=:backup4,备用5=:backup5,备用6=:backup6,'
      + '备用7=:backup7,备用8=:backup8,备用9=:backup9,备用10=:backup10,备用11=:backup11,'
      + '备用12=:backup12,备用13=:backup13,备用14=:backup14,备用15=:backup15,'
      + '备用16=:backup16,备用17=:backup17,备用18=:backup18 where 流水号=:glideNo';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = 'update' then
    begin
      Parameters.ParamByName('glideNo').Value := UpdateRecNo;
      Parameters.ParamByName('secondTime').Value := Now;
    end
    else
    begin
      Parameters.ParamByName('glideNo').Value := MaxGlideNo;
      Parameters.ParamByName('car').Value := CBCar.Text;
      if RBPurchase.Checked then
        Parameters.ParamByName('weightType').Value := 'PO'
      else if RBSale.Checked then
        Parameters.ParamByName('weightType').Value := 'SO'
      else if RBInner.Checked then
        Parameters.ParamByName('weightType').Value := 'IO'
      else if RBOther.Checked then
        Parameters.ParamByName('weightType').Value := 'OO';
      Parameters.ParamByName('firstTime').Value := Now;
      Parameters.ParamByName('printCount').Value := 0;
      Parameters.ParamByName('upload').Value := False;
    end;

    Parameters.ParamByName('fahuo').Value := CBFaHuo.Text;
    Parameters.ParamByName('shouhuo').Value := CBShouHuo.Text;
    Parameters.ParamByName('goods').Value := CBGoods.Text;
    Parameters.ParamByName('spec').Value := CBSpec.Text;
    Parameters.ParamByName('gross').Value := StrToFloatDef(EdtGross.Text, 0);
    Parameters.ParamByName('tare').Value := StrToFloatDef(EdtTare.Text, 0);
    Parameters.ParamByName('net').Value := StrToFloatDef(EdtNet.Text, 0);
    Parameters.ParamByName('bundle').Value := StrToFloatDef(EdtBundle.Text, 0);
    Parameters.ParamByName('real').Value := StrToFloatDef(EdtReal.Text, 0);
    Parameters.ParamByName('price').Value := StrToFloatDef(EdtPrice.Text, 0);
    Parameters.ParamByName('sum').Value := StrToFloatDef(EdtSum.Text, 0);
    Parameters.ParamByName('scale').Value := StrToFloatDef(EdtScale.Text, 1);
    Parameters.ParamByName('quanter').Value := StrToFloatDef(EdtQuanter.Text, 0);
    Parameters.ParamByName('charge').Value := StrToFloatDef(EdtCost.Text, 0);

    Parameters.ParamByName('updateUser').Value := MainForm.CurrentUser;
    Parameters.ParamByName('updateTime').Value := Now;

    if WeightType = 'update' then
    begin
      if not flagReverse then
      begin
        if MainForm.systemConfig.simpleMode = 0 then
        begin
          Parameters.ParamByName('grossMan').Value := grossMan;
          Parameters.ParamByName('grossAddr').Value := grossAddr;
          Parameters.ParamByName('grossTime').Value := grossTime;
          Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('tareTime').Value := Now;
        end
        else
        begin
          Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('grossTime').Value := Now;
          Parameters.ParamByName('tareMan').Value := grossMan;
          Parameters.ParamByName('tareAddr').Value := grossAddr;
          Parameters.ParamByName('tareTime').Value := grossTime;
        end;
      end
      else
      begin
        if MainForm.systemConfig.simpleMode = 0 then
        begin
          Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('grossTime').Value := Now;
          Parameters.ParamByName('tareMan').Value := grossMan;
          Parameters.ParamByName('tareAddr').Value := grossAddr;
          Parameters.ParamByName('tareTime').Value := grossTime;
        end
        else
        begin
          Parameters.ParamByName('grossMan').Value := grossMan;
          Parameters.ParamByName('grossAddr').Value := grossAddr;
          Parameters.ParamByName('grossTime').Value := grossTime;
          Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('tareTime').Value := Now;
        end;
      end;
    end
    else
    begin
      if (WeightType = 'pre') or (WeightType = 'manual') then
      begin
        Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('grossTime').Value := Now;
        Parameters.ParamByName('tareTime').Value := Now;
      end
      else if WeightField = 'first' then
      begin
        if MainForm.systemConfig.simpleMode = 0 then
        begin
          Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('grossTime').Value := Now;
        end
        else
        begin
          Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('tareTime').Value := Now;
        end;
      end;
    end;
    Parameters.ParamByName('remark').Value := EdtMemo.Text;

    Parameters.ParamByName('backup1').Value := CBBackup1.Text;
    Parameters.ParamByName('backup2').Value := CBBackup2.Text;
    Parameters.ParamByName('backup3').Value := CBBackup3.Text;
    Parameters.ParamByName('backup4').Value := CBBackup4.Text;
    Parameters.ParamByName('backup5').Value := CBBackup5.Text;
    Parameters.ParamByName('backup6').Value := EdtBackup6.Text;
    Parameters.ParamByName('backup7').Value := EdtBackup7.Text;
    Parameters.ParamByName('backup8').Value := EdtBackup8.Text;
    Parameters.ParamByName('backup9').Value := EdtBackup9.Text;
    Parameters.ParamByName('backup10').Value := CBBackup10.Text;
    Parameters.ParamByName('backup11').Value := CBBackup11.Text;
    Parameters.ParamByName('backup12').Value := CBBackup12.Text;
    Parameters.ParamByName('backup13').Value := CBBackup13.Text;
    Parameters.ParamByName('backup14').Value := CBBackup14.Text;
    Parameters.ParamByName('backup15').Value := EdtBackup15.Text;
    Parameters.ParamByName('backup16').Value := EdtBackup16.Text;
    Parameters.ParamByName('backup17').Value := EdtBackup17.Text;
    Parameters.ParamByName('backup18').Value := EdtBackup18.Text;

    ExecSQL;
    //保存图片
    if WeightType = 'update' then
    begin
      TWeightUtil.SaveWeightImgEx('U', UpdateRecNo, 'T', MainForm.systemConfig.savePicLocal, getScaleNo);
    end
    else
    begin
      if WeightField = 'first' then
        TWeightUtil.SaveWeightImgEx('A', MaxGlideNo, 'G', MainForm.systemConfig.savePicLocal, getScaleNo)
    end;
    //按收货单位扣费
    if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
    begin
      case MainForm.systemConfig.payType of
        0: TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
        1: TPayUtil.pay(CBShouHuo.Text, EdtReal.Text);
        2: TPayUtil.pay(CBShouHuo.Text, EdtQuanter.Text);
        3: TPayUtil.pay(CBShouHuo.Text, EdtBackup6.Text);
        4: TPayUtil.pay(CBShouHuo.Text, EdtBackup7.Text);
        5: TPayUtil.pay(CBShouHuo.Text, EdtBackup8.Text);
        6: TPayUtil.pay(CBShouHuo.Text, EdtBackup9.Text);
        7: TPayUtil.pay(CBShouHuo.Text, EdtBackup15.Text);
        8: TPayUtil.pay(CBShouHuo.Text, EdtBackup16.Text);
        9: TPayUtil.pay(CBShouHuo.Text, EdtBackup17.Text);
        10: TPayUtil.pay(CBShouHuo.Text, EdtBackup18.Text);
      else
        TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
      end;
    end;
    //如果保存成功,就把最后一条后台记录变为已过磅标志
    TWeightUtil.updateLastBackRecord();
  end;

  //保存好了再输出到大屏幕
  saved := True;
  TWaitForScreen.Enabled := True;

  MainForm.GetStaticInfo;
  MainForm.showGridRecord;

  TWaitForZero.Enabled := True;
  if MainForm.systemConfig.waitForZero then
  begin
    PRight.Visible := False;
  end;

  if MainForm.systemConfig.printAfterSave then
  begin
    if WeightType = 'update' then
      TReportUtil.printTicket(UpdateRecNo, CBPreview.Checked, MainForm.systemConfig.ticketType)
    else
      TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
  end;
  Result := True;
end;

procedure TFrmWeight.TWaitForZeroTimer(Sender: TObject);
begin
  if StrToFloatDef(getWeight, 0) < MainForm.systemConfig.ReturnZero then
  begin
    (Sender as TTimer).Enabled := False;
    PRight.Visible := True;
    if MainForm.systemConfig.correctOnce then
    begin
      if StrToFloatDef(getWeight, 0) <= MainForm.systemConfig.returnZero then
      begin
        MainForm.systemConfig.cweightFlag1 := False;
        MainForm.systemConfig.cweightFlag2 := False;
        MainForm.systemConfig.cweightFlag3 := False;
        MainForm.systemConfig.cweightFlag4 := False;
        MainForm.systemConfig.cweightFlag5 := False;
        MainForm.systemConfig.cweightFlag6 := False;
        MainForm.systemConfig.cweightFlag7 := False;
        MainForm.systemConfig.cweightFlag8 := False;
      end;
    end;
  end;
end;

procedure TFrmWeight.TWaitForScreenTimer(Sender: TObject);
begin
  if StrToFloatDef(getWeight, 0) < MainForm.systemConfig.returnZero then
  begin
    (Sender as TTimer).Enabled := False;
    saved := False;
  end;
end;

procedure TFrmWeight.MSTotalMsgMouseEnter(Sender: TObject);
begin
  MSTotalMsg.ScrollDelay := 10000;
end;

procedure TFrmWeight.MSTotalMsgMouseLeave(Sender: TObject);
begin
  MSTotalMsg.ScrollDelay := 100;
end;

procedure TFrmWeight.addAutoDebug(s: string);
begin
  if MemoDebug.Lines.Count > 100 then
    MemoDebug.Lines.Clear;
  MemoDebug.Lines.Add(Format('%s : %s', [FormatDateTime('hh:nn:ss', Now), s]));
end;

procedure TFrmWeight.CBFaHuoDblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 1;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBShouHuoDblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 2;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBGoodsDblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 3;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBSpecDblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 4;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup1DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 5;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup2DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 6;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup3DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 7;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup4DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 8;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup5DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 9;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup10DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 10;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup11DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 11;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup12DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 12;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup13DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 13;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.CBBackup14DblClick(Sender: TObject);
begin
  if MainForm.systemConfig.ShowPrepare then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.PCPrepare.ActivePageIndex := 14;
      PrepareMaintainForm.toMainForm := True;
      PrepareMaintainForm.ShowModal;
    finally
      PrepareMaintainForm.Free;
    end;
  end;
end;

procedure TFrmWeight.SetlastGlideNo(const Value: string);
begin
  FlastGlideNo := Value;
  if Value = '' then
    lblGlideNo.Caption := ''
  else
    lblGlideNo.Caption := Format('流水号：%s', [Value]);
end;

function TFrmWeight.calcSum: Boolean;
begin
  if StrToFloatDef(EdtNet.Text, 0) > 0 then
  begin
    if MainForm.systemConfig.useBundleRate then
      EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
        * (1 - StrToFloatDef(EdtBundle.Text, 0) / 100), 1,
        0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType))
    else
      EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
        - StrToFloatDef(EdtBundle.Text, 0), 1,
        0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType));

    EdtSum.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
      * StrToFloatDef(EdtPrice.Text, 0), MainForm.systemConfig.sumDivide,
      0 - MainForm.systemConfig.sumPoint, MainForm.systemConfig.sumType));

    if (StrToFloatDef(EdtScale.Text, 1) <> 0) then
    begin
      EdtQuanter.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
        / StrToFloatDef(EdtScale.Text, 1), MainForm.systemConfig.quanterDivide,
        0 - MainForm.systemConfig.quanterPoint, MainForm.systemConfig.sumType));
    end;
  end;
end;

function TFrmWeight.getScaleNo: Char;
begin
  if PWeight1.Color = clBlack then
    Result := 'A'
  else if PWeight2.Color = clBlack then
    Result := 'B'
  else
    Result := 'C';
end;

function TFrmWeight.getUnique: Boolean;
begin
  if MainForm.poWeightSetConfig.carUnique then
  begin
    if TWeightUtil.getUniqueRecord('车号', CBCar.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;

  if MainForm.poWeightSetConfig.faHuoUnique then
  begin
    if TWeightUtil.getUniqueRecord('发货单位', CBFaHuo.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;

  if MainForm.poWeightSetConfig.shouHuoUnique then
  begin
    if TWeightUtil.getUniqueRecord('收货单位', CBShouHuo.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.goodsUnique then
  begin
    if TWeightUtil.getUniqueRecord('货名', CBGoods.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.specUnique then
  begin
    if TWeightUtil.getUniqueRecord('规格', CBSpec.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.memoUnique then
  begin
    if TWeightUtil.getUniqueRecord('备注', EdtMemo.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup1Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用1', CBBackup1.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup2Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用2', CBBackup2.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup3Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用3', CBBackup3.Text) then
    begin
      Result := False;
      Exit;
    end; end;
  if MainForm.poWeightSetConfig.backup4Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用4', CBBackup4.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup5Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用5', CBBackup5.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup10Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用10', CBBackup10.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup11Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用11', CBBackup11.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup12Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用12', CBBackup12.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup13Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用13', CBBackup13.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;
  if MainForm.poWeightSetConfig.backup14Unique then
  begin
    if TWeightUtil.getUniqueRecord('备用14', CBBackup14.Text) then
    begin
      Result := False;
      Exit;
    end;
  end;

  Result := True;
end;

function TFrmWeight.getCost(Value: Double): Double;
begin
  with MainForm do
  begin
    if systemConfig.chargeType = 0 then
    begin
      if systemConfig.ladder then
      begin
        if (Value > systemConfig.poundGrade1)
          and (Value <= systemConfig.poundGrade2) then
        begin
          Result := systemConfig.BasicPound;
        end
        else if (Value > systemConfig.poundGrade3)
          and (Value <= systemConfig.poundGrade4) then
        begin
          Result := RoundTo(systemConfig.UnitPound1 *
            (Value - systemConfig.poundGrade2) + systemConfig.BasicPound,
            0 - systemConfig.scalePoint);
        end
        else if (Value > systemConfig.poundGrade5)
          and (Value <= systemConfig.poundGrade6) then
          Result := RoundTo(systemConfig.UnitPound2 *
            (Value - systemConfig.poundGrade4)
            + systemConfig.UnitPound1 * (systemConfig.poundGrade4 - systemConfig.poundGrade3)
            + systemConfig.BasicPound,
            0 - systemConfig.scalePoint);
      end
      else
      begin
        if (Value > systemConfig.poundGrade1)
          and (Value <= systemConfig.poundGrade2) then
        begin
          Result := systemConfig.BasicPound;
        end
        else if (Value > systemConfig.poundGrade3)
          and (Value <= systemConfig.poundGrade4) then
        begin
          Result := RoundTo(systemConfig.UnitPound1 * Value,
            0 - systemConfig.scalePoint);
        end
        else if (Value > systemConfig.poundGrade5)
          and (Value <= systemConfig.poundGrade6) then
          Result := RoundTo(systemConfig.UnitPound2 * Value,
            0 - systemConfig.scalePoint);
      end;
      if Result < systemConfig.basicPound then
        Result := systemConfig.BasicPound;
    end
    else
    begin
      if (Value >= systemConfig.grade11) and (Value < systemConfig.grade12) then
      begin
        Result := systemConfig.cost1;
      end
      else if (Value >= systemConfig.grade21) and (Value < systemConfig.grade22) then
      begin
        Result := systemConfig.cost2;
      end
      else if (Value >= systemConfig.grade31) and (Value < systemConfig.grade32) then
      begin
        Result := systemConfig.cost3;
      end
      else if (Value >= systemConfig.grade41) and (Value < systemConfig.grade42) then
      begin
        Result := systemConfig.cost4;
      end
      else if (Value >= systemConfig.grade51) and (Value < systemConfig.grade52) then
      begin
        Result := systemConfig.cost5;
      end
      else if (Value >= systemConfig.grade61) and (Value < systemConfig.grade62) then
      begin
        Result := systemConfig.cost6;
      end
      else if (Value >= systemConfig.grade71) and (Value < systemConfig.grade72) then
      begin
        Result := systemConfig.cost7;
      end
      else if (Value >= systemConfig.grade81) and (Value < systemConfig.grade82) then
      begin
        Result := systemConfig.cost8;
      end
      else if (Value >= systemConfig.grade91) and (Value < systemConfig.grade92) then
      begin
        Result := systemConfig.cost9;
      end
      else if (Value >= systemConfig.grade101) and (Value < systemConfig.grade102) then
      begin
        Result := systemConfig.cost10;
      end
      else if (Value >= systemConfig.grade111) and (Value < systemConfig.grade112) then
      begin
        Result := systemConfig.cost11;
      end
      else if (Value >= systemConfig.grade121) and (Value < systemConfig.grade122) then
      begin
        Result := systemConfig.cost12;
      end
      else if (Value >= systemConfig.grade131) and (Value < systemConfig.grade132) then
      begin
        Result := systemConfig.cost13;
      end
      else
      begin
        Result := systemConfig.cost1;
      end
    end;
  end;
end;

function TFrmWeight.setCostValue: Boolean;
var w, unitPound: Double;
begin
  if not MainForm.systemConfig.useCost then
    Exit;
  if MainForm.systemConfig.ManualInputPound then
    Exit;
  case MainForm.systemConfig.costType of
    0: EdtCost.Text := FloatToStr(getCost(StrToFloatDef(EdtGross.Text, 0)));
    1: EdtCost.Text := FloatToStr(getCost(StrToFloatDef(EdtNet.Text, 0)));
    2: EdtCost.Text := FloatToStr(getCost(StrToFloatDef(EdtGross.Text, 0))
        + getCost(StrToFloatDef(EdtTare.Text, 0)));
  end;
end;

procedure TFrmWeight.setNotChangeItem(st: Boolean);
begin
  if st then
  begin
    CBCar.Enabled := st;
    CBFaHuo.Enabled := st;
    CBShouHuo.Enabled := st;
    CBGoods.Enabled := st;
    CBSpec.Enabled := st;
    EdtBundle.Enabled := st;
    EdtPrice.Enabled := st;
    EdtScale.Enabled := st;
    EdtMemo.Enabled := st;
    CBBackup1.Enabled := st;
    CBBackup2.Enabled := st;
    CBBackup3.Enabled := st;
    CBBackup4.Enabled := st;
    CBBackup5.Enabled := st;
    EdtBackup6.Enabled := st;
    EdtBackup7.Enabled := st;
    EdtBackup8.Enabled := st;
    EdtBackup9.Enabled := st;
    CBBackup10.Enabled := st;
    CBBackup11.Enabled := st;
    CBBackup12.Enabled := st;
    CBBackup13.Enabled := st;
    CBBackup14.Enabled := st;
    EdtBackup15.Enabled := st;
    EdtBackup16.Enabled := st;
    EdtBackup17.Enabled := st;
    EdtBackup18.Enabled := st;
  end
  else //只有在变灰的时候才决定是否更改
  begin
    if MainForm.poWeightSetConfig.carNotChange then CBCar.Enabled := st;
    if MainForm.poWeightSetConfig.faHuoNotChange then CBFaHuo.Enabled := st;
    if MainForm.poWeightSetConfig.shouHuoNotChange then CBShouHuo.Enabled := st;
    if MainForm.poWeightSetConfig.goodsNotChange then CBGoods.Enabled := st;
    if MainForm.poWeightSetConfig.specNotChange then CBSpec.Enabled := st;
    if MainForm.poWeightSetConfig.bundleNotChange then EdtBundle.Enabled := st;
    if MainForm.poWeightSetConfig.priceNotChange then EdtPrice.Enabled := st;
    if MainForm.poWeightSetConfig.scaleNotChange then EdtScale.Enabled := st;
    if MainForm.poWeightSetConfig.memoNotChange then EdtMemo.Enabled := st;
    if MainForm.poWeightSetConfig.backup1NotChange then CBBackup1.Enabled := st;
    if MainForm.poWeightSetConfig.backup2NotChange then CBBackup2.Enabled := st;
    if MainForm.poWeightSetConfig.backup3NotChange then CBBackup3.Enabled := st;
    if MainForm.poWeightSetConfig.backup4NotChange then CBBackup4.Enabled := st;
    if MainForm.poWeightSetConfig.backup5NotChange then CBBackup5.Enabled := st;
    if MainForm.poWeightSetConfig.backup6NotChange then EdtBackup6.Enabled := st;
    if MainForm.poWeightSetConfig.backup7NotChange then EdtBackup7.Enabled := st;
    if MainForm.poWeightSetConfig.backup8NotChange then EdtBackup8.Enabled := st;
    if MainForm.poWeightSetConfig.backup9NotChange then EdtBackup9.Enabled := st;
    if MainForm.poWeightSetConfig.backup10NotChange then CBBackup10.Enabled := st;
    if MainForm.poWeightSetConfig.backup11NotChange then CBBackup11.Enabled := st;
    if MainForm.poWeightSetConfig.backup12NotChange then CBBackup12.Enabled := st;
    if MainForm.poWeightSetConfig.backup13NotChange then CBBackup13.Enabled := st;
    if MainForm.poWeightSetConfig.backup14NotChange then CBBackup14.Enabled := st;
    if MainForm.poWeightSetConfig.backup15NotChange then EdtBackup15.Enabled := st;
    if MainForm.poWeightSetConfig.backup16NotChange then EdtBackup16.Enabled := st;
    if MainForm.poWeightSetConfig.backup17NotChange then EdtBackup17.Enabled := st;
    if MainForm.poWeightSetConfig.backup18NotChange then EdtBackup18.Enabled := st;
  end;
end;

procedure TFrmWeight.BtnCarNoClick(Sender: TObject);
begin
  CarForm.CBCar.Text := CBCar.Text;
  try
    CarForm.ShowModal;
  finally
    CBCar.Text := CarForm.CBCar.Text;
  end;
end;

function TFrmWeight.save: Boolean;
var sqlStr, tmp: string;
  lowCredit: Boolean;
begin
  Result := False;
  //没加密狗只能用15天或者500条记录
  if not TDog.Dog2() then
  begin
    if TDog.RegTimeOut then Exit;
  end;
  if not getMust() then //输入必填项目
  begin
    MainForm.ShowMsg('请录入完整信息');
    Exit;
  end;
  if StrToFloatDef(EdtNet.Text, 0) < 0 then
  begin
    if Application.MessageBox('净重为负数,不允许保存.' + #13#10 +
      '是否将毛重与皮重对调?否则无法继续过磅', '提示', MB_YESNO + MB_ICONQUESTION +
      MB_TOPMOST) = IDYES then
    begin
      tmp := EdtGross.Text;
      EdtGross.Text := EdtTare.Text;
      EdtTare.Text := tmp;
      EdtNet.Text := FloatToStr(StrToFloatDef(EdtGross.Text, 0) -
        StrToFloatDef(EdtTare.Text, 0));
      calcNet;
    end
    else
    begin
      Exit;
    end;
  end;
  //设置有公式编辑的字段
  setExpressionValue();
  //如果有收费功能，信用额度过低就不允许过磅
  if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
  begin
    case MainForm.systemConfig.payType of
      0: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
      1: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtReal.Text, 0));
      2: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtQuanter.Text, 0));
      3: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup6.Text, 0));
      4: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup7.Text, 0));
      5: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup8.Text, 0));
      6: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup9.Text, 0));
      7: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup15.Text, 0));
      8: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup16.Text, 0));
      9: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup17.Text, 0));
      10: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup18.Text, 0));
    else
      lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
    end;
    if lowCredit then
    begin
      Application.MessageBox('该单位当前金额不足，请先续费', '提示', MB_OK +
        MB_ICONSTOP);
      Exit;
    end
    else
    begin
      if MainForm.systemConfig.recordLeft then
      begin
        case MainForm.systemConfig.payType of
          0: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtSum.Text, 0));
          1: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtReal.Text, 0));
          2: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtQuanter.Text, 0));
          3: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup6.Text, 0));
          4: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup7.Text, 0));
          5: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup8.Text, 0));
          6: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup9.Text, 0));
          7: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup15.Text, 0));
          8: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup16.Text, 0));
          9: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup17.Text, 0));
          10: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup18.Text, 0));
        else
          EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtSum.Text, 0));
        end;
      end;
    end;
  end;
  //如果用出厂流水号，就用备用1
  if MainForm.systemConfig.useOutGlideNo then
  begin
    if StrToFloatDef(EdtReal.Text, 0) > 0 then
      CBBackup1.Text := TWeightUtil.getMaxOutGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
  end;
  if MainForm.systemConfig.recordCorrect then
  begin
    if MeterConnect1Form.cheat <> 0 then
      EdtBackup17.Text := FloatToStr(MeterConnect1Form.cheat);
  end;
  if ((WeightType = 'insert') or (WeightType = 'pre') or (WeightType = 'manual'))
    then
  begin
    MaxGlideNo := TWeightUtil.getMaxGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
      + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,'
      + '方量,过磅费,';
    if (WeightType = 'pre') or (WeightType = 'manual') then
      sqlStr := sqlStr + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
    else if WeightField = 'gross' then
      sqlStr := sqlStr + '毛重司磅员,毛重磅号,毛重时间,'
    else if WeightField = 'tare' then
      sqlStr := sqlStr + '皮重司磅员,皮重磅号,皮重时间,';

    sqlStr := sqlStr + '一次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
      + '备用1,备用2,备用3,备用4,'
      + '备用5,备用6,备用7,备用8,备用9,'
      + '备用10,备用11,备用12,备用13,备用14,'
      + '备用15,备用16,备用17,备用18)';

    sqlstr := sqlstr + ' values(:glideNo,:car,:weightType,:fahuo,:shouhuo,'
      + ':goods,:spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,'
      + ':quanter,:charge,';
    if (WeightType = 'pre') or (WeightType = 'manual') then
      sqlstr := sqlstr + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grossTime,:tareTime,'
    else if WeightField = 'gross' then
      sqlstr := sqlstr + ':grossMan,:grossAddr,:grossTime,'
    else if WeightField = 'tare' then
      sqlstr := sqlstr + ':tareMan,:tareAddr,:tareTime,';
    sqlstr := sqlstr + ':firstTime,:updateUser,:updateTime,:remark,:printCount,:upload,'
      + ':backup1,:backup2,:backup3,:backup4,:backup5,'
      + ':backup6,:backup7,:backup8,:backup9,:backup10,'
      + ':backup11,:backup12,:backup13,:backup14,:backup15,'
      + ':backup16,:backup17,:backup18)';
  end
  else if (WeightType = 'update') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update 称重信息 set 发货单位=:fahuo,收货单位=:shouhuo,'
      + '货名=:goods,规格=:spec,毛重=:gross,皮重=:tare,净重=:net,扣重=:bundle,'
      + '实重=:real,单价=:price,金额=:sum,折方系数=:scale,方量=:quanter,过磅费=:charge,';

    if WeightField = 'gross' then
      sqlstr := sqlstr + '毛重司磅员=:grossMan,毛重磅号=:grossAddr,毛重时间=:grossTime,'
    else if WeightField = 'tare' then
      sqlstr := sqlstr + '皮重司磅员=:tareMan,皮重磅号=:tareAddr,皮重时间=:tareTime,';

    sqlstr := sqlstr + '二次过磅时间=:secondTime,更新人=:updateUser,更新时间=:updateTime,'
      + '备注=:remark,备用1=:backup1,备用2=:backup2,'
      + '备用3=:backup3,备用4=:backup4,备用5=:backup5,备用6=:backup6,'
      + '备用7=:backup7,备用8=:backup8,备用9=:backup9,备用10=:backup10,备用11=:backup11,'
      + '备用12=:backup12,备用13=:backup13,备用14=:backup14,备用15=:backup15,'
      + '备用16=:backup16,备用17=:backup17,备用18=:backup18 where 流水号=:glideNo';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = 'update' then
    begin
      Parameters.ParamByName('glideNo').Value := UpdateRecNo;
      Parameters.ParamByName('secondTime').Value := Now;
    end
    else
    begin
      Parameters.ParamByName('glideNo').Value := MaxGlideNo;
      Parameters.ParamByName('car').Value := CBCar.Text;
      if RBPurchase.Checked then
        Parameters.ParamByName('weightType').Value := 'PO'
      else if RBSale.Checked then
        Parameters.ParamByName('weightType').Value := 'SO'
      else if RBInner.Checked then
        Parameters.ParamByName('weightType').Value := 'IO'
      else if RBOther.Checked then
        Parameters.ParamByName('weightType').Value := 'OO';
      Parameters.ParamByName('firstTime').Value := Now;
      Parameters.ParamByName('printCount').Value := 0;
      Parameters.ParamByName('upload').Value := False;
    end;

    Parameters.ParamByName('fahuo').Value := CBFaHuo.Text;
    Parameters.ParamByName('shouhuo').Value := CBShouHuo.Text;
    Parameters.ParamByName('goods').Value := CBGoods.Text;
    Parameters.ParamByName('spec').Value := CBSpec.Text;
    Parameters.ParamByName('gross').Value := StrToFloatDef(EdtGross.Text, 0);
    Parameters.ParamByName('tare').Value := StrToFloatDef(EdtTare.Text, 0);
    Parameters.ParamByName('net').Value := StrToFloatDef(EdtNet.Text, 0);
    Parameters.ParamByName('bundle').Value := StrToFloatDef(EdtBundle.Text, 0);
    Parameters.ParamByName('real').Value := StrToFloatDef(EdtReal.Text, 0);
    Parameters.ParamByName('price').Value := StrToFloatDef(EdtPrice.Text, 0);
    Parameters.ParamByName('sum').Value := StrToFloatDef(EdtSum.Text, 0);
    Parameters.ParamByName('scale').Value := StrToFloatDef(EdtScale.Text, 1);
    Parameters.ParamByName('quanter').Value := StrToFloatDef(EdtQuanter.Text, 0);
    Parameters.ParamByName('charge').Value := StrToFloatDef(EdtCost.Text, 0);

    Parameters.ParamByName('updateUser').Value := MainForm.CurrentUser;
    Parameters.ParamByName('updateTime').Value := Now;

    if WeightType = 'update' then
    begin
      if WeightField = 'gross' then
      begin
        Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('grossTime').Value := Now;
      end
      else if WeightField = 'tare' then
      begin
        Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('tareTime').Value := Now;
      end
    end
    else
    begin
      if (WeightType = 'pre') or (WeightType = 'manual') then
      begin
        Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('grossTime').Value := Now;
        Parameters.ParamByName('tareTime').Value := Now;
      end
      else if WeightField = 'gross' then
      begin
        Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('grossTime').Value := Now;
      end
      else if WeightField = 'tare' then
      begin
        Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('tareTime').Value := Now;
      end;
    end;
    Parameters.ParamByName('remark').Value := EdtMemo.Text;

    Parameters.ParamByName('backup1').Value := CBBackup1.Text;
    Parameters.ParamByName('backup2').Value := CBBackup2.Text;
    Parameters.ParamByName('backup3').Value := CBBackup3.Text;
    Parameters.ParamByName('backup4').Value := CBBackup4.Text;
    Parameters.ParamByName('backup5').Value := CBBackup5.Text;
    Parameters.ParamByName('backup6').Value := StrToFloatDef(EdtBackup6.Text, 0);
    Parameters.ParamByName('backup7').Value := StrToFloatDef(EdtBackup7.Text, 0);
    Parameters.ParamByName('backup8').Value := StrToFloatDef(EdtBackup8.Text, 0);
    Parameters.ParamByName('backup9').Value := StrToFloatDef(EdtBackup9.Text, 0);
    Parameters.ParamByName('backup10').Value := CBBackup10.Text;
    Parameters.ParamByName('backup11').Value := CBBackup11.Text;
    Parameters.ParamByName('backup12').Value := CBBackup12.Text;
    Parameters.ParamByName('backup13').Value := CBBackup13.Text;
    Parameters.ParamByName('backup14').Value := CBBackup14.Text;
    Parameters.ParamByName('backup15').Value := StrToFloatDef(EdtBackup15.Text, 0);
    Parameters.ParamByName('backup16').Value := StrToFloatDef(EdtBackup16.Text, 0);
    Parameters.ParamByName('backup17').Value := StrToFloatDef(EdtBackup17.Text, 0);
    Parameters.ParamByName('backup18').Value := StrToFloatDef(EdtBackup18.Text, 0);

    ExecSQL;

    Result := True;
    //保存图片
    if WeightType = 'update' then
    begin
      if WeightField = 'gross' then
        TWeightUtil.SaveWeightImgEx('U', UpdateRecNo, 'G', MainForm.systemConfig.savePicLocal, getScaleNo)
      else if WeightField = 'tare' then
        TWeightUtil.SaveWeightImgEx('U', UpdateRecNo, 'T', MainForm.systemConfig.savePicLocal, getScaleNo);
    end
    else
    begin
      if WeightField = 'gross' then
        TWeightUtil.SaveWeightImgEx('A', MaxGlideNo, 'G', MainForm.systemConfig.savePicLocal, getScaleNo)
      else if WeightField = 'tare' then
        TWeightUtil.SaveWeightImgEx('A', MaxGlideNo, 'T', MainForm.systemConfig.savePicLocal, getScaleNo)
      else
        TWeightUtil.SaveWeightImgEx('A', MaxGlideNo, 'A', MainForm.systemConfig.savePicLocal, getScaleNo);
    end;
    //按收货单位扣费
    if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
    begin
      case MainForm.systemConfig.payType of
        0: TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
        1: TPayUtil.pay(CBShouHuo.Text, EdtReal.Text);
        2: TPayUtil.pay(CBShouHuo.Text, EdtQuanter.Text);
        3: TPayUtil.pay(CBShouHuo.Text, EdtBackup6.Text);
        4: TPayUtil.pay(CBShouHuo.Text, EdtBackup7.Text);
        5: TPayUtil.pay(CBShouHuo.Text, EdtBackup8.Text);
        6: TPayUtil.pay(CBShouHuo.Text, EdtBackup9.Text);
        7: TPayUtil.pay(CBShouHuo.Text, EdtBackup15.Text);
        8: TPayUtil.pay(CBShouHuo.Text, EdtBackup16.Text);
        9: TPayUtil.pay(CBShouHuo.Text, EdtBackup17.Text);
        10: TPayUtil.pay(CBShouHuo.Text, EdtBackup18.Text);
      else
        TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
      end;
    end;
    //如果保存成功,就把最后一条后台记录变为已过磅标志
    TWeightUtil.updateLastBackRecord();
  end;

  //保存好了再输出到大屏幕
  saved := True;
  if MainForm.systemConfig.useVoice then
    MainForm.speak(MainForm.systemConfig.completeHint);
  TWaitForScreen.Enabled := True;

  MainForm.GetStaticInfo;
  MainForm.showGridRecord;
  clearInfo;
  weightType := '';
  weightField := '';
  setBtnState(True);

  TWaitForZero.Enabled := True;
  if MainForm.systemConfig.waitForZero then
  begin
    PRight.Visible := False;
  end;
end;

function TFrmWeight.simpleSave: Boolean;
var sqlStr: string;
  lowCredit: Boolean;
begin
  Result := False;
  if not getMust() then //输入必填项目
  begin
    MainForm.ShowMsg('请录入完整信息');
    Exit;
  end;
  if StrToFloatDef(EdtNet.Text, 0) < 0 then
  begin
    Application.MessageBox('净重不允许为负数', '提示', MB_OK + MB_ICONSTOP);
    Exit
  end;
  //没加密狗只能用15天或者500条记录
  if not TDog.Dog2() then
  begin
    if TDog.RegTimeOut then Exit;
  end;
  //如果有收费功能，信用额度过低就不允许过磅
  if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
  begin
    case MainForm.systemConfig.payType of
      0: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
      1: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtReal.Text, 0));
      2: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtQuanter.Text, 0));
      3: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup6.Text, 0));
      4: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup7.Text, 0));
      5: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup8.Text, 0));
      6: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup9.Text, 0));
      7: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup15.Text, 0));
      8: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup16.Text, 0));
      9: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup17.Text, 0));
      10: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup18.Text, 0));
    else
      lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
    end;
    if lowCredit then
    begin
      Application.MessageBox('该单位当前金额不足，请先续费', '提示', MB_OK +
        MB_ICONSTOP);
      Exit;
    end
    else
    begin
      if MainForm.systemConfig.recordLeft then
      begin
        case MainForm.systemConfig.payType of
          0: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtSum.Text, 0));
          1: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtReal.Text, 0));
          2: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtQuanter.Text, 0));
          3: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup6.Text, 0));
          4: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup7.Text, 0));
          5: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup8.Text, 0));
          6: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup9.Text, 0));
          7: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup15.Text, 0));
          8: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup16.Text, 0));
          9: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup17.Text, 0));
          10: EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtBackup18.Text, 0));
        else
          EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtSum.Text, 0));
        end;
      end;
    end;
  end;
  setExpressionValue(); //设置有公式编辑的字段

    //如果用出厂流水号，就用备用1
  if MainForm.systemConfig.useOutGlideNo then
  begin
    if StrToFloatDef(EdtReal.Text, 0) > 0 then
      CBBackup1.Text := TWeightUtil.getMaxOutGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
  end;
  if MainForm.systemConfig.recordCorrect then
  begin
    if MeterConnect1Form.cheat <> 0 then
      EdtBackup17.Text := FloatToStr(MeterConnect1Form.cheat);
  end;

  if ((WeightType = 'insert') or (WeightType = 'pre') or (WeightType = 'manual'))
    then
  begin
    MaxGlideNo := TWeightUtil.getMaxGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
    ////////////////////////////////////////////////////////////////////////////////
    sqlStr := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
      + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,'
      + '方量,过磅费,';
    if (WeightType = 'pre') or (WeightType = 'manual') then
      sqlStr := sqlStr + '毛重司磅员,皮重司磅员,毛重磅号,皮重磅号,毛重时间,皮重时间,'
    else if WeightField = 'first' then
    begin
      if MainForm.systemConfig.simpleMode = 0 then
        sqlStr := sqlStr + '毛重司磅员,毛重磅号,毛重时间,'
      else
        sqlStr := sqlStr + '皮重司磅员,皮重磅号,皮重时间,';
    end;

    sqlStr := sqlStr + '一次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
      + '备用1,备用2,备用3,备用4,'
      + '备用5,备用6,备用7,备用8,备用9,'
      + '备用10,备用11,备用12,备用13,备用14,'
      + '备用15,备用16,备用17,备用18)';

    sqlstr := sqlstr + ' values(:glideNo,:car,:weightType,:fahuo,:shouhuo,'
      + ':goods,:spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,'
      + ':quanter,:charge,';
    if (WeightType = 'pre') or (WeightType = 'manual') then
      sqlstr := sqlstr + ':grossMan,:tareMan,:grossAddr,:tareAddr,:grossTime,:tareTime,'
    else if WeightField = 'first' then
    begin
      if MainForm.systemConfig.simpleMode = 0 then
        sqlstr := sqlstr + ':grossMan,:grossAddr,:grossTime,'
      else
        sqlstr := sqlstr + ':tareMan,:tareAddr,:tareTime,';
    end;
    sqlstr := sqlstr + ':firstTime,:updateUser,:updateTime,:remark,:printCount,:upload,'
      + ':backup1,:backup2,:backup3,:backup4,:backup5,'
      + ':backup6,:backup7,:backup8,:backup9,:backup10,'
      + ':backup11,:backup12,:backup13,:backup14,:backup15,'
      + ':backup16,:backup17,:backup18)';
  end
  else if (WeightType = 'update') then
  begin
    ////////////////////////////////////////////////////////////////////////////////
    sqlstr := sqlstr + 'update 称重信息 set 发货单位=:fahuo,收货单位=:shouhuo,'
      + '货名=:goods,规格=:spec,毛重=:gross,皮重=:tare,净重=:net,扣重=:bundle,'
      + '实重=:real,单价=:price,金额=:sum,折方系数=:scale,方量=:quanter,过磅费=:charge,';

    sqlstr := sqlstr + '毛重司磅员=:grossMan,毛重磅号=:grossAddr,毛重时间=:grossTime,'
      + '皮重司磅员=:tareMan,皮重磅号=:tareAddr,皮重时间=:tareTime,';

    sqlstr := sqlstr + '二次过磅时间=:secondTime,更新人=:updateUser,更新时间=:updateTime,'
      + '备注=:remark,备用1=:backup1,备用2=:backup2,'
      + '备用3=:backup3,备用4=:backup4,备用5=:backup5,备用6=:backup6,'
      + '备用7=:backup7,备用8=:backup8,备用9=:backup9,备用10=:backup10,备用11=:backup11,'
      + '备用12=:backup12,备用13=:backup13,备用14=:backup14,备用15=:backup15,'
      + '备用16=:backup16,备用17=:backup17,备用18=:backup18 where 流水号=:glideNo';

  end;
  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);
    if WeightType = 'update' then
    begin
      Parameters.ParamByName('glideNo').Value := UpdateRecNo;
      Parameters.ParamByName('secondTime').Value := Now;
    end
    else
    begin
      Parameters.ParamByName('glideNo').Value := MaxGlideNo;
      Parameters.ParamByName('car').Value := CBCar.Text;
      if RBPurchase.Checked then
        Parameters.ParamByName('weightType').Value := 'PO'
      else if RBSale.Checked then
        Parameters.ParamByName('weightType').Value := 'SO'
      else if RBInner.Checked then
        Parameters.ParamByName('weightType').Value := 'IO'
      else if RBOther.Checked then
        Parameters.ParamByName('weightType').Value := 'OO';
      Parameters.ParamByName('firstTime').Value := Now;
      Parameters.ParamByName('printCount').Value := 0;
      Parameters.ParamByName('upload').Value := False;
    end;

    Parameters.ParamByName('fahuo').Value := CBFaHuo.Text;
    Parameters.ParamByName('shouhuo').Value := CBShouHuo.Text;
    Parameters.ParamByName('goods').Value := CBGoods.Text;
    Parameters.ParamByName('spec').Value := CBSpec.Text;
    Parameters.ParamByName('gross').Value := StrToFloatDef(EdtGross.Text, 0);
    Parameters.ParamByName('tare').Value := StrToFloatDef(EdtTare.Text, 0);
    Parameters.ParamByName('net').Value := StrToFloatDef(EdtNet.Text, 0);
    Parameters.ParamByName('bundle').Value := StrToFloatDef(EdtBundle.Text, 0);
    Parameters.ParamByName('real').Value := StrToFloatDef(EdtReal.Text, 0);
    Parameters.ParamByName('price').Value := StrToFloatDef(EdtPrice.Text, 0);
    Parameters.ParamByName('sum').Value := StrToFloatDef(EdtSum.Text, 0);
    Parameters.ParamByName('scale').Value := StrToFloatDef(EdtScale.Text, 1);
    Parameters.ParamByName('quanter').Value := StrToFloatDef(EdtQuanter.Text, 0);
    Parameters.ParamByName('charge').Value := StrToFloatDef(EdtCost.Text, 0);

    Parameters.ParamByName('updateUser').Value := MainForm.CurrentUser;
    Parameters.ParamByName('updateTime').Value := Now;

    if WeightType = 'update' then
    begin
      if not flagReverse then
      begin
        if MainForm.systemConfig.simpleMode = 0 then
        begin
          Parameters.ParamByName('grossMan').Value := grossMan;
          Parameters.ParamByName('grossAddr').Value := grossAddr;
          Parameters.ParamByName('grossTime').Value := grossTime;
          Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('tareTime').Value := Now;
        end
        else
        begin
          Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('grossTime').Value := Now;
          Parameters.ParamByName('tareMan').Value := grossMan;
          Parameters.ParamByName('tareAddr').Value := grossAddr;
          Parameters.ParamByName('tareTime').Value := grossTime;
        end;
      end
      else
      begin
        if MainForm.systemConfig.simpleMode = 0 then
        begin
          Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('grossTime').Value := Now;
          Parameters.ParamByName('tareMan').Value := grossMan;
          Parameters.ParamByName('tareAddr').Value := grossAddr;
          Parameters.ParamByName('tareTime').Value := grossTime;
        end
        else
        begin
          Parameters.ParamByName('grossMan').Value := grossMan;
          Parameters.ParamByName('grossAddr').Value := grossAddr;
          Parameters.ParamByName('grossTime').Value := grossTime;
          Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('tareTime').Value := Now;
        end;
      end;
    end
    else
    begin
      if (WeightType = 'pre') or (WeightType = 'manual') then
      begin
        Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
        Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
        Parameters.ParamByName('grossTime').Value := Now;
        Parameters.ParamByName('tareTime').Value := Now;
      end
      else if WeightField = 'first' then
      begin
        if MainForm.systemConfig.simpleMode = 0 then
        begin
          Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('grossTime').Value := Now;
        end
        else
        begin
          Parameters.ParamByName('tareMan').Value := MainForm.CurrentUser;
          Parameters.ParamByName('tareAddr').Value := MainForm.systemConfig.addr;
          Parameters.ParamByName('tareTime').Value := Now;
        end;
      end;
    end;
    Parameters.ParamByName('remark').Value := EdtMemo.Text;

    Parameters.ParamByName('backup1').Value := CBBackup1.Text;
    Parameters.ParamByName('backup2').Value := CBBackup2.Text;
    Parameters.ParamByName('backup3').Value := CBBackup3.Text;
    Parameters.ParamByName('backup4').Value := CBBackup4.Text;
    Parameters.ParamByName('backup5').Value := CBBackup5.Text;
    Parameters.ParamByName('backup6').Value := StrToFloatDef(EdtBackup6.Text, 0);
    Parameters.ParamByName('backup7').Value := StrToFloatDef(EdtBackup7.Text, 0);
    Parameters.ParamByName('backup8').Value := StrToFloatDef(EdtBackup8.Text, 0);
    Parameters.ParamByName('backup9').Value := StrToFloatDef(EdtBackup9.Text, 0);
    Parameters.ParamByName('backup10').Value := CBBackup10.Text;
    Parameters.ParamByName('backup11').Value := CBBackup11.Text;
    Parameters.ParamByName('backup12').Value := CBBackup12.Text;
    Parameters.ParamByName('backup13').Value := CBBackup13.Text;
    Parameters.ParamByName('backup14').Value := CBBackup14.Text;
    Parameters.ParamByName('backup15').Value := StrToFloatDef(EdtBackup15.Text, 0);
    Parameters.ParamByName('backup16').Value := StrToFloatDef(EdtBackup16.Text, 0);
    Parameters.ParamByName('backup17').Value := StrToFloatDef(EdtBackup17.Text, 0);
    Parameters.ParamByName('backup18').Value := StrToFloatDef(EdtBackup18.Text, 0);

    ExecSQL;
    Result := True;
    //保存图片
    if WeightType = 'update' then
    begin
      TWeightUtil.SaveWeightImgEx('U', UpdateRecNo, 'T', MainForm.systemConfig.savePicLocal, getScaleNo);
    end
    else
    begin
      if WeightField = 'first' then
        TWeightUtil.SaveWeightImgEx('A', MaxGlideNo, 'G', MainForm.systemConfig.savePicLocal, getScaleNo)
    end;
    //按收货单位扣费
    if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
    begin
      case MainForm.systemConfig.payType of
        0: TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
        1: TPayUtil.pay(CBShouHuo.Text, EdtReal.Text);
        2: TPayUtil.pay(CBShouHuo.Text, EdtQuanter.Text);
        3: TPayUtil.pay(CBShouHuo.Text, EdtBackup6.Text);
        4: TPayUtil.pay(CBShouHuo.Text, EdtBackup7.Text);
        5: TPayUtil.pay(CBShouHuo.Text, EdtBackup8.Text);
        6: TPayUtil.pay(CBShouHuo.Text, EdtBackup9.Text);
        7: TPayUtil.pay(CBShouHuo.Text, EdtBackup15.Text);
        8: TPayUtil.pay(CBShouHuo.Text, EdtBackup16.Text);
        9: TPayUtil.pay(CBShouHuo.Text, EdtBackup17.Text);
        10: TPayUtil.pay(CBShouHuo.Text, EdtBackup18.Text);
      else
        TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
      end;
    end;
    //如果保存成功,就把最后一条后台记录变为已过磅标志
    TWeightUtil.updateLastBackRecord();
  end;

  //保存好了再输出到大屏幕
  saved := True;
  if MainForm.systemConfig.useVoice then
    MainForm.speak(MainForm.systemConfig.completeHint);
  TWaitForScreen.Enabled := True;

  MainForm.GetStaticInfo;
  MainForm.showGridRecord;
  clearWeight;

  setSimpleBtnState(True);

  weightType := '';
  weightField := '';
  clearInfo;

  TWaitForZero.Enabled := True;
  if MainForm.systemConfig.waitForZero then
  begin
    PRight.Visible := False;
  end;
end;

procedure TFrmWeight.addDropdownInfo;
begin
  TPrepareUtil.addFaHuo(CBFaHuo);
  TPrepareUtil.addShouHuo(CBShouHuo);
  TPrepareUtil.addGoods(CBGoods);
  TPrepareUtil.addSpec(CBSpec);
  TPrepareUtil.addBackup1(CBBackup1);
  TPrepareUtil.addBackup2(CBBackup2);
  TPrepareUtil.addBackup3(CBBackup3);
  TPrepareUtil.addBackup4(CBBackup4);
  TPrepareUtil.addBackup5(CBBackup5);
  TPrepareUtil.addBackup10(CBBackup10);
  TPrepareUtil.addBackup11(CBBackup11);
  TPrepareUtil.addBackup12(CBBackup12);
  TPrepareUtil.addBackup13(CBBackup13);
  TPrepareUtil.addBackup14(CBBackup14);
end;

procedure TFrmWeight.setWeightPos;
begin
  if PMeter2.Visible then
  begin
    PMeter1.Width := PInfo.Width div 2;
    PWeight1.Width := PMeter1.Width - PWeight1.Left * 2;
    lblUnit1.Left := PWeight1.Left + PWeight1.Width - lblUnit1.Width;

    PMeter2.Left := PMeter1.Width + 2;
    PMeter2.Width := PInfo.Width div 2;
    PWeight2.Width := PMeter2.Width - PWeight2.Left * 2;
    lblUnit2.Left := PWeight2.Left + PWeight2.Width - lblUnit2.Width;
  end
  else
  begin
    PMeter1.Width := 450;
    PWeight1.Width := PMeter1.Width - PWeight1.Left * 2;
    lblUnit1.Left := PWeight1.Left + PWeight1.Width - lblUnit1.Width;
  end;
end;

function TFrmWeight.weightAndSave(w: Double): Boolean;
var carTare: Double;
  sqlStr: string;
  lowCredit: Boolean;
begin
  clearWeight; //清空重量
  if w <= 0 then
  begin
    Result := False;
    Exit;
  end;
  if not getMust() then //输入必填项目
  begin
    Result := False;
    Exit;
  end;

  EdtGross.Text := FloatToStr(w);

  carTare := TPrepareUtil.getCarTare(CBCar.Text);
  if carTare > 0 then
    EdtTare.Text := FloatToStr(carTare);
  calcNet;

  VideoForm.takePhoto; //拍照
  Sleep(200);

  setCostValue(); //设置过磅费
  setExpressionValue(); //设置有公式编辑的字段
  TReadWeight.Enabled := MainForm.systemConfig.UseVoice; //开始朗读
  //没加密狗只能用15天或者500条记录
  if not TDog.DogExists() then
  begin
    if TDog.RegTimeOut then
    begin
      Result := False;
      Exit;
    end;
  end;
  //如果有收费功能，信用额度过低就不允许过磅
  if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
  begin
    case MainForm.systemConfig.payType of
      0: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
      1: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtReal.Text, 0));
      2: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtQuanter.Text, 0));
      3: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup6.Text, 0));
      4: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup7.Text, 0));
      5: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup8.Text, 0));
      6: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup9.Text, 0));
      7: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup15.Text, 0));
      8: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup16.Text, 0));
      9: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup17.Text, 0));
      10: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup18.Text, 0));
    else
      lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
    end;
    if lowCredit then
    begin
      addAutoDebug('该单位当前金额不足，请先续费');
      Exit;
    end;
  end;

    //如果用出厂流水号，就用备用1
  if MainForm.systemConfig.useOutGlideNo then
  begin
    if StrToFloatDef(EdtReal.Text, 0) > 0 then
      CBBackup1.Text := TWeightUtil.getMaxOutGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
  end;
  if MainForm.systemConfig.recordCorrect then
  begin
    if MeterConnect1Form.cheat <> 0 then
      EdtBackup17.Text := FloatToStr(MeterConnect1Form.cheat);
  end;
  MaxGlideNo := TWeightUtil.getMaxGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
    ////////////////////////////////////////////////////////////////////////////////
  sqlStr := 'insert into 称重信息(流水号,车号,过磅类型,发货单位,收货单位,'
    + '货名,规格,毛重,皮重,净重,扣重,实重,单价,金额,折方系数,'
    + '方量,过磅费,';

  sqlStr := sqlStr + '毛重司磅员,毛重磅号,毛重时间,';

  sqlStr := sqlStr + '一次过磅时间,更新人,更新时间,备注,打印次数,上传否,'
    + '备用1,备用2,备用3,备用4,'
    + '备用5,备用6,备用7,备用8,备用9,'
    + '备用10,备用11,备用12,备用13,备用14,'
    + '备用15,备用16,备用17,备用18)';

  sqlstr := sqlstr + ' values(:glideNo,:car,:weightType,:fahuo,:shouhuo,'
    + ':goods,:spec,:gross,:tare,:net,:bundle,:real,:price,:sum,:scale,'
    + ':quanter,:charge,';

  sqlstr := sqlstr + ':grossMan,:grossAddr,:grossTime,';

  sqlstr := sqlstr + ':firstTime,:updateUser,:updateTime,:remark,:printCount,:upload,'
    + ':backup1,:backup2,:backup3,:backup4,:backup5,'
    + ':backup6,:backup7,:backup8,:backup9,:backup10,'
    + ':backup11,:backup12,:backup13,:backup14,:backup15,'
    + ':backup16,:backup17,:backup18)';

  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Clear;
    SQL.Add(sqlStr);

    Parameters.ParamByName('glideNo').Value := MaxGlideNo;
    Parameters.ParamByName('car').Value := CBCar.Text;
    if RBPurchase.Checked then
      Parameters.ParamByName('weightType').Value := 'PO'
    else if RBSale.Checked then
      Parameters.ParamByName('weightType').Value := 'SO'
    else if RBInner.Checked then
      Parameters.ParamByName('weightType').Value := 'IO'
    else if RBOther.Checked then
      Parameters.ParamByName('weightType').Value := 'OO';
    Parameters.ParamByName('firstTime').Value := Now;
    Parameters.ParamByName('printCount').Value := 0;
    Parameters.ParamByName('upload').Value := False;

    Parameters.ParamByName('fahuo').Value := CBFaHuo.Text;
    Parameters.ParamByName('shouhuo').Value := CBShouHuo.Text;
    Parameters.ParamByName('goods').Value := CBGoods.Text;
    Parameters.ParamByName('spec').Value := CBSpec.Text;
    Parameters.ParamByName('gross').Value := StrToFloatDef(EdtGross.Text, 0);
    Parameters.ParamByName('tare').Value := StrToFloatDef(EdtTare.Text, 0);
    Parameters.ParamByName('net').Value := StrToFloatDef(EdtNet.Text, 0);
    Parameters.ParamByName('bundle').Value := StrToFloatDef(EdtBundle.Text, 0);
    Parameters.ParamByName('real').Value := StrToFloatDef(EdtReal.Text, 0);
    Parameters.ParamByName('price').Value := StrToFloatDef(EdtPrice.Text, 0);
    Parameters.ParamByName('sum').Value := StrToFloatDef(EdtSum.Text, 0);
    Parameters.ParamByName('scale').Value := StrToFloatDef(EdtScale.Text, 1);
    Parameters.ParamByName('quanter').Value := StrToFloatDef(EdtQuanter.Text, 0);
    Parameters.ParamByName('charge').Value := StrToFloatDef(EdtCost.Text, 0);

    Parameters.ParamByName('updateUser').Value := MainForm.CurrentUser;
    Parameters.ParamByName('updateTime').Value := Now;

    Parameters.ParamByName('grossMan').Value := MainForm.CurrentUser;
    Parameters.ParamByName('grossAddr').Value := MainForm.systemConfig.addr;
    Parameters.ParamByName('grossTime').Value := Now;

    Parameters.ParamByName('remark').Value := EdtMemo.Text;

    Parameters.ParamByName('backup1').Value := CBBackup1.Text;
    Parameters.ParamByName('backup2').Value := CBBackup2.Text;
    Parameters.ParamByName('backup3').Value := CBBackup3.Text;
    Parameters.ParamByName('backup4').Value := CBBackup4.Text;
    Parameters.ParamByName('backup5').Value := CBBackup5.Text;
    Parameters.ParamByName('backup6').Value := EdtBackup6.Text;
    Parameters.ParamByName('backup7').Value := EdtBackup7.Text;
    Parameters.ParamByName('backup8').Value := EdtBackup8.Text;
    Parameters.ParamByName('backup9').Value := EdtBackup9.Text;
    Parameters.ParamByName('backup10').Value := CBBackup10.Text;
    Parameters.ParamByName('backup11').Value := CBBackup11.Text;
    Parameters.ParamByName('backup12').Value := CBBackup12.Text;
    Parameters.ParamByName('backup13').Value := CBBackup13.Text;
    Parameters.ParamByName('backup14').Value := CBBackup14.Text;
    Parameters.ParamByName('backup15').Value := EdtBackup15.Text;
    Parameters.ParamByName('backup16').Value := EdtBackup16.Text;
    Parameters.ParamByName('backup17').Value := EdtBackup17.Text;
    Parameters.ParamByName('backup18').Value := EdtBackup18.Text;

    ExecSQL;
    //保存图片
    TWeightUtil.SaveWeightImgEx('A', MaxGlideNo, 'G', MainForm.systemConfig.savePicLocal, getScaleNo);

    //按收货单位扣费
    if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
    begin
      case MainForm.systemConfig.payType of
        0: TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
        1: TPayUtil.pay(CBShouHuo.Text, EdtReal.Text);
        2: TPayUtil.pay(CBShouHuo.Text, EdtQuanter.Text);
        3: TPayUtil.pay(CBShouHuo.Text, EdtBackup6.Text);
        4: TPayUtil.pay(CBShouHuo.Text, EdtBackup7.Text);
        5: TPayUtil.pay(CBShouHuo.Text, EdtBackup8.Text);
        6: TPayUtil.pay(CBShouHuo.Text, EdtBackup9.Text);
        7: TPayUtil.pay(CBShouHuo.Text, EdtBackup15.Text);
        8: TPayUtil.pay(CBShouHuo.Text, EdtBackup16.Text);
        9: TPayUtil.pay(CBShouHuo.Text, EdtBackup17.Text);
        10: TPayUtil.pay(CBShouHuo.Text, EdtBackup18.Text);
      else
        TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
      end;
    end;
  end;

  //保存好了再输出到大屏幕
  saved := True;
  TWaitForScreen.Enabled := True;

  MainForm.GetStaticInfo;
  MainForm.showGridRecord;

  TWaitForZero.Enabled := True;
  if MainForm.systemConfig.waitForZero then
  begin
    PRight.Visible := False;
  end;

  if MainForm.systemConfig.printAfterSave then
  begin
    TReportUtil.printTicket(MaxGlideNo, CBPreview.Checked, MainForm.systemConfig.ticketType);
  end;
  Result := True;
end;

procedure TFrmWeight.CBCarEnter(Sender: TObject);
begin
  TPrepareUtil.addCar(CBCar);
end;

procedure TFrmWeight.ApplicationEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  if RBPurchase.Checked then
    SpWeightType.Brush.Color := clBtnFace
  else if RBSale.Checked then
    SpWeightType.Brush.Color := clBlue
  else if RBInner.Checked then
    SpWeightType.Brush.Color := clGreen
  else if RBOther.Checked then
    SpWeightType.Brush.Color := clWindow;
end;

function TFrmWeight.getWeightType: string;
begin
  if RBPurchase.Checked then
    Result := 'PO'
  else if RBSale.Checked then
    Result := 'SO'
  else if RBInner.Checked then
    Result := 'IO'
  else if RBOther.Checked then
    Result := 'OO';
end;

procedure TFrmWeight.CBBackup1Change(Sender: TObject);
begin
  if (BtnSave.Enabled or BitBtnSave.Enabled) and (MainForm.systemConfig.autoUpdateExpression) then
    setExpressionValue;
end;

procedure TFrmWeight.setAutoState;
begin
  TAuto.Enabled := CBAuto.Checked;

  PSimple.Visible := not CBAuto.Checked;
  PStandard.Visible := not CBAuto.Checked;
  MemoDebug.Visible := CBAuto.Checked;

  if CBAuto.Checked then
  begin
    case MainForm.systemConfig.saveByInterval of
      0: begin
          autoStep := 0;
          TAuto.Interval := 2000;
        end;
      1: begin
          TAuto.Interval := MainForm.systemConfig.saveInterval * 1000;
        end;
      2: begin
          autoStep := 0;
          TAuto.Interval := 2000;
        end;
    end
  end
  else
  begin
    if RBStandard.Checked then
    begin
      PStandard.Visible := True;
      PSimple.Visible := False;
    end
    else if RBSimple.Checked then
    begin
      PStandard.Visible := False;
      PSimple.Visible := True;
    end
    else
    begin
      PStandard.Visible := False;
      PSimple.Visible := True;
    end;
  end;
end;

end.

