unit Main;

interface

uses
  Windows, Graphics, SysUtils, Classes, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ExtCtrls, StdCtrls, inifiles,
  Buttons, DBGridEh, SysConfig, WinSkinData, PropStorageEh, StdActns,
  DBActns, ActnList, PrnDbgeh, RzPanel, RzButton, GridsEh, Registry,
  RzStatus, ExceptionLog, WeightFrm,
  ExtDlgs, PropFilerEh, OleServer, CnAAFont,
  MSNPopUp, RzSplit, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping, SpeechLib_TLB, ImgList, RzAnimtr;

type
  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    MSysOper: TMenuItem;
    MDataMaintain: TMenuItem;
    MSysMaintain: TMenuItem;
    MAdditionalTool: TMenuItem;
    MHelp: TMenuItem;
    SMChange: TMenuItem;
    SMPassword: TMenuItem;
    SMWeight: TMenuItem;
    SMClose: TMenuItem;
    SMTerminate: TMenuItem;
    SMUser: TMenuItem;
    SMDataQuery: TMenuItem;
    SMDBSet: TMenuItem;
    SMDBBackup: TMenuItem;
    SMPreMaintain: TMenuItem;
    SMMeter1: TMenuItem;
    SMSoftSet: TMenuItem;
    SMTareTrend: TMenuItem;
    SMComputer: TMenuItem;
    SMModify: TMenuItem;
    SMAbout: TMenuItem;
    N38: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N44: TMenuItem;
    SMDBClear: TMenuItem;
    TAutoBackup: TTimer;
    PrintDBGridEh1: TPrintDBGridEh;
    SMSimulate: TMenuItem;
    ActionListMain: TActionList;
    DataSetFirst1: TDataSetFirst;
    DataSetLast1: TDataSetLast;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    PMDBGridEh: TPopupMenu;
    SPMPrint: TMenuItem;
    SPMSaveAs: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    TSimulate: TTimer;
    SMReadWeight: TMenuItem;
    N4: TMenuItem;
    SMDb: TMenuItem;
    SMSysLog: TMenuItem;
    IniPropStorageManEh1: TIniPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    SMVideo: TMenuItem;
    SMHelp: TMenuItem;
    cheat1: TAction;
    SMBackRecord: TMenuItem;
    SMTicketSet: TMenuItem;
    SMScreen: TMenuItem;
    SMMeter: TMenuItem;
    SMMeter2: TMenuItem;
    SMDBInit: TMenuItem;
    N11: TMenuItem;
    SMEquipment: TMenuItem;
    cheat2: TAction;
    cheat3: TAction;
    cheat4: TAction;
    ASetCheat: TAction;
    SMDesign: TMenuItem;
    RzToolbar1: TRzToolbar;
    RzSpacer4: TRzSpacer;
    RzSpacer5: TRzSpacer;
    RzSpacer6: TRzSpacer;
    RzSpacer1: TRzSpacer;
    StatusBar1: TRzStatusBar;
    SpMode: TRzStatusPane;
    SpUser: TRzStatusPane;
    SpTime: TRzClockStatus;
    spInfo: TRzMarqueeStatus;
    PMVoice: TPopupMenu;
    SMCharge: TMenuItem;
    SMChargeHistory: TMenuItem;
    EurekaLog1: TEurekaLog;
    SMTaoQuery: TMenuItem;
    AVideo: TAction;
    SMSkin: TMenuItem;
    SkinData1: TSkinData;
    ImgBack: TImage;
    TLine: TTimer;
    N8: TMenuItem;
    SMDBMigrate: TMenuItem;
    TBackRecord: TTimer;
    SMStaticTrend: TMenuItem;
    N23: TMenuItem;
    N27: TMenuItem;
    TBExit: TRzBitBtn;
    TBChange: TRzBitBtn;
    TBWeight: TRzBitBtn;
    TBQuery: TRzBitBtn;
    TBTicket: TRzBitBtn;
    TBVideo: TRzBitBtn;
    TBCalc: TRzBitBtn;
    TBVoice: TRzMenuButton;
    TBDouble: TRzBitBtn;
    SMMail: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    TBNet: TRzBitBtn;
    SMManualInput: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    MSNPopUp1: TMSNPopUp;
    SMStorageInfo: TMenuItem;
    N34: TMenuItem;
    SMInvalidQuery: TMenuItem;
    N35: TMenuItem;
    SMPriceQuery: TMenuItem;
    cbjt1: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    ADefine: TAction;
    TAutoShut: TTimer;
    N43: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    cheatClose: TAction;
    SPCheat: TRzStatusPane;
    SMWeightSet: TMenuItem;
    N48: TMenuItem;
    SMReportSys: TMenuItem;
    SpltMain: TRzSplitter;
    PWeight: TRzPanel;
    FrmWeight1: TFrmWeight;
    PData: TRzPanel;
    DBGridEh1: TDBGridEh;
    SPTool: TRzSizePanel;
    PhotoBtn: TSpeedButton;
    CBRecordType: TComboBox;
    CBRecordTime: TComboBox;
    ListBtn: TBitBtn;
    OutputBtn: TRzBitBtn;
    PrintBtn: TBitBtn;
    cheat5: TAction;
    cheat6: TAction;
    cheat7: TAction;
    cheat8: TAction;
    SMCostSet: TMenuItem;
    TAutoRefresh: TTimer;
    SpVoice1: TSpVoice;
    ASetCloud: TAction;
    SMScanTicket: TMenuItem;
    SMScanReport: TMenuItem;
    TBPhone: TRzBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure SMMeter1Click(Sender: TObject);
    procedure SMCloseClick(Sender: TObject);
    procedure SMSoftSetClick(Sender: TObject);
    procedure SMChangeClick(Sender: TObject);
    procedure SMPasswordClick(Sender: TObject);
    procedure SMWeightClick(Sender: TObject);
    procedure SMUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SMDBSetClick(Sender: TObject);
    procedure SMDBBackupClick(Sender: TObject);
    procedure SMPreMaintainClick(Sender: TObject);
    procedure SMDBClearClick(Sender: TObject);
    procedure TAutoBackupTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SMDataQueryClick(Sender: TObject);
    procedure SMAboutClick(Sender: TObject);
    procedure SMComputerClick(Sender: TObject);
    procedure SMTerminateClick(Sender: TObject);
    procedure SMSimulateClick(Sender: TObject);
    procedure SPMPrintClick(Sender: TObject);
    procedure SPMSaveAsClick(Sender: TObject);
    procedure TSimulateTimer(Sender: TObject);
    procedure SMReadWeightClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SMSysLogClick(Sender: TObject);
    procedure SMBackRecordClick(Sender: TObject);
    procedure SMTicketSetClick(Sender: TObject);
    procedure SMModifyClick(Sender: TObject);
    procedure SMScreenClick(Sender: TObject);
    procedure SMMeter2Click(Sender: TObject);
    procedure SMDBInitClick(Sender: TObject);
    procedure CBRecordTypeChange(Sender: TObject);
    procedure cheat1Execute(Sender: TObject);
    procedure cheat2Execute(Sender: TObject);
    procedure cheat3Execute(Sender: TObject);
    procedure cheat4Execute(Sender: TObject);
    procedure ASetCheatExecute(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure SMTareTrendClick(Sender: TObject);
    procedure SMDesignClick(Sender: TObject);
    procedure TBExitClick(Sender: TObject);
    procedure TBChangeClick(Sender: TObject);
    procedure TBWeightClick(Sender: TObject);
    procedure TBQueryClick(Sender: TObject);
    procedure TBCalcClick(Sender: TObject);
    procedure TBTicketClick(Sender: TObject);
    procedure TBVideoClick(Sender: TObject);
    procedure SMVideoClick(Sender: TObject);
    procedure CBRecordTimeChange(Sender: TObject);
    procedure SMChargeClick(Sender: TObject);
    procedure SMChargeHistoryClick(Sender: TObject);
    procedure SMTaoQueryClick(Sender: TObject);
    procedure RzToolbar1DblClick(Sender: TObject);
    procedure AVideoExecute(Sender: TObject);
    procedure SMSkinClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TLineTimer(Sender: TObject);
    procedure SMDBMigrateClick(Sender: TObject);
    procedure TBackRecordTimer(Sender: TObject);
    procedure SMStaticTrendClick(Sender: TObject);
    procedure SMBackGroundClick(Sender: TObject);
    procedure TBDoubleClick(Sender: TObject);
    procedure SMMailClick(Sender: TObject);
    procedure TBNetClick(Sender: TObject);
    procedure TBVoiceContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ImgBackDblClick(Sender: TObject);
    procedure SMHelpClick(Sender: TObject);
    procedure SMManualInputClick(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure SMStorageInfoClick(Sender: TObject);
    procedure SMInvalidQueryClick(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure SMPriceQueryClick(Sender: TObject);
    procedure cbjt1Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure TAutoShutTimer(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure PhotoBtnClick(Sender: TObject);
    procedure ListBtnClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure cheatCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SMReportSysClick(Sender: TObject);
    procedure cheat5Execute(Sender: TObject);
    procedure cheat6Execute(Sender: TObject);
    procedure cheat7Execute(Sender: TObject);
    procedure cheat8Execute(Sender: TObject);
    procedure SMCostSetClick(Sender: TObject);
    procedure TAutoRefreshTimer(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure SMScanTicketClick(Sender: TObject);
    procedure SMScanReportClick(Sender: TObject);
    procedure ADefineExecute(Sender: TObject);
    procedure ShowJson1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    myini: TiniFile;
    canAutoSave1, canAutoSave2: Boolean; //后台自动保存
    arrPicFile: TStringList;
    arrDesignMenu: array of TMenuItem;
    picStep: Integer; //用来切换图片使用
    FCurrentUser: string;
    testStep: Boolean;
    meter1Plus, meter2Plus: Boolean; //模拟称重加减标志

    procedure SetCurrentUser(const Value: string);
    function getBgFile(): Boolean; //获取背景图片文件名存入数组
    procedure selWeightForm(Sender: TObject); //选择称重界面
  public
    { Public declarations }
    systemConfig: TSysConfig; //系统参数
    poWeightSetConfig, soWeightSetConfig, ioWeightSetConfig, ooWeightSetConfig: TWeightSetConfig; //界面参数
    procedure ShowMsg(Msg: string); //显示信息
    procedure GetStaticInfo(); //计算称重界面右上角的统计信息
    procedure setAutoBackup(t: boolean); //设置自动备份数据库
    procedure CheckRegistry; //输入注册码
    function GetRegistryCode: string; //取系统注册码
    procedure loadFormDesign(); //载入窗体配置
    procedure loadVoiceList(); //读取语音播放列表
    function showGridRecord(): string; //显示表格的记录,根据条件
    procedure loadSysConfig(); //读取系统配置
    procedure pmVoiceClick(Sender: TObject); //语音播报列表
    function setSkin(skinFile: string): Boolean; //设置系统皮肤
    function setBackGround(s: string): Boolean; //设置背景文件
    function setVoiceRate(r: Integer): Boolean; //设置播报速度
    function resizeMain(): Boolean; //重置窗体
    procedure setCompanyInfo();
    procedure loadFormDesignFile();

    procedure loadMenu();
    procedure saveMenu();
    procedure loadDBGrid(dg: TDBGridEh);
    procedure saveDBGrid(dg: TDBGridEh);

    procedure speak(str: string);
    procedure setExportWeightCheat();
    property
      CurrentUser: string read FCurrentUser write SetCurrentUser; //当前用户
  end;

var
  MainForm: TMainForm;
  //rd: TReadDog;

type
  TMyDBGrid = class(TDBGridEh);

implementation

uses QueryDM, SoftwareSet, ModifyPassword, Login, UserPurview,
  DataQuery, PrepareMaintain, DBConnect,
  DBMaintain, DBClear, DBBackup, About, ReadWeight, Log,
  PhotoUnit, SQLDBBackup, BackRecord, TicketSet, CommonUtil,
  RegCode, Reg, ComOutput,
  Correct, DogUtil, Tao,
  TareChart, WeightSet, InitializeOption, Video,
  Voice, Pay, PayHistory, VideoSet, DataShowSetting,
  SkinChange, DrawLine1, DrawLine2, DataMigrate, StaticChart, MeterConnect1,
  MeterConnect2, Mail, OtherUtil, WeightUtil, ReportUtil, ShellAPI,
  ManualInput, Storage, Price, InvalidDataQuery, Autoshut, DateUtils,
  ReportSys, CostSet, Math, ScanTicket, ScanReport, WeightRecord,
  MeterUtil, LoginInfo;

{$R *.dfm}

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  if MessageDlg('确定要关闭软件吗?', mtConfirmation, [mbOK, mbCancel], 0) = mrCancel then
    CanClose := False
end;

procedure TMainForm.SMMeter1Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('仪表设置') then
    MeterConnect1Form.ShowModal
  else
    ShowMsg('对不起您没有仪表设置权限，无法进行仪表设置！')
end;

procedure TMainForm.SMCloseClick(Sender: TObject);
begin
  Close
end;

procedure TMainForm.SMSoftSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('系统设置') then
  begin
    Application.CreateForm(TSoftwareSetForm, SoftwareSetForm);
    try
      SoftwareSetForm.ShowModal;
    finally
      SoftwareSetForm.Free;
    end
  end
  else
    ShowMsg('对不起您没有系统设置权限，无法进行软件设置！')
end;

procedure TMainForm.SMChangeClick(Sender: TObject);
begin
  SpltMain.Visible := False;
  CurrentUser := '';
  Application.CreateForm(TLoginForm, LoginForm);
  try
    LoginForm.ShowModal;
    if CurrentUser = '' then
      Application.Terminate;
    TLogUtil.AddLog(CurrentUser + '登陆');
  finally
    LoginForm.Free
  end
end;

procedure TMainForm.SMPasswordClick(Sender: TObject);
begin
  Application.CreateForm(TModifyPasswordForm, ModifyPasswordForm);
  try
    ModifyPasswordForm.ShowModal;
  finally
    ModifyPasswordForm.Free
  end
end;

procedure TMainForm.SMWeightClick(Sender: TObject);
begin
  SpltMain.Visible := True;
  //更新称重界面 , 启动画线及稳定判断
  FrmWeight1.Align := alClient;
  FrmWeight1.resizeFrame;
  FrmWeight1.setSysConfig(systemConfig);
  FrmWeight1.EdtGross.ReadOnly := not TUserUtil.HasAuthority('修改毛重');
  FrmWeight1.EdtTare.ReadOnly := not TUserUtil.HasAuthority('修改皮重');
  FrmWeight1.addDropdownInfo();
  FrmWeight1.startSteady(True);
  FrmWeight1.setWeightPos;
  FrmWeight1.clearInfo();
  FrmWeight1.P00SetFocus;

  TLine.Enabled := True;
  //计算称重界面右上角的统计信息
  GetStaticInfo();
  showGridRecord;

  DBGridEh1.OddRowColor := systemConfig.oddColor;
  DBGridEh1.EvenRowColor := systemConfig.evenColor;
end;

procedure TMainForm.SMUserClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('用户管理') then
  begin
    Application.CreateForm(TUserPurviewForm, UserPurviewForm);
    try
      UserPurviewForm.ShowModal;
    finally
      UserPurviewForm.Free
    end
  end
  else
    ShowMsg('对不起您没有用户管理权限，无法进行操作员维护！')
end;

procedure TMainForm.FormCreate(Sender: TObject);
var i: Integer;
begin
  //CheckRegistry;
  if not TDog.DogExists() then
  begin
    MessageBoxW(0, '请插入加密狗！', '提示', MB_OK + MB_ICONWARNING +
      MB_TOPMOST);
  end;
  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  IniPropStorageManEh1.IniFileName := ExtractFilePath(ParamStr(0)) +
    '\form.ini';
  systemConfig := TSysConfig.Create;
  poWeightSetConfig := TWeightSetConfig.Create;
  soWeightSetConfig := TWeightSetConfig.Create;
  ioWeightSetConfig := TWeightSetConfig.Create;
  ooWeightSetConfig := TWeightSetConfig.Create;
  arrPicFile := TStringList.Create;

  if not QueryDataModule.ConnectFlag then
  begin
    Application.CreateForm(TDBConnectForm, DBConnectForm);
    try
      DBConnectForm.ShowModal;
      QueryDataModule.ConnectDatabase;
      if not QueryDataModule.ConnectFlag then
      begin
        Exit;
      end;
    finally
      DBConnectForm.Free
    end
  end;

  //读取系统参数配置
  loadSysConfig();
  loadFormDesign();
  //载入声音文件
  loadVoiceList();
  loadMenu;

  //当数据库过大时,提示用户清理,仅限于单机模式
  if TWeightUtil.getDatabaseSpace(systemConfig.databaseInUse) >= systemConfig.databaseAlarm then
  begin
    MessageBox(0, '您的数据库文件已经过大了,请及时清理数据', '警告', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1 + MB_TOPMOST);
  end;
  if (TWeightUtil.getRecordCount > 500) and (not TDog.DogExists) then
  begin
    Application.Terminate;
  end;
  if systemConfig.autoLogin then
  begin
    if UpperCase(TUserUtil.getPassword(systemConfig.loginName)) =
      UpperCase(TCommonUtil.md5(systemConfig.loginPass)) then
    begin
      CurrentUser := systemConfig.loginName;
    end
    else
    begin
      CurrentUser := '';
      Application.CreateForm(TLoginForm, LoginForm);
      try
        LoginForm.ShowModal;
        if CurrentUser = '' then
          Application.Terminate;
      finally
        LoginForm.Free
      end
    end;
  end
  else
  begin
    CurrentUser := '';
    Application.CreateForm(TLoginForm, LoginForm);
    try
      LoginForm.ShowModal;
      if CurrentUser = '' then
        Application.Terminate;
    finally
      LoginForm.Free
    end
  end;

  getBgFile;
  loadFormDesignFile;
  loadDBGrid(DBGridEh1);
end;

procedure TMainForm.SMDBSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据库设置') then
  begin
    Application.CreateForm(TDBConnectForm, DBConnectForm);
    try
      DBConnectForm.ShowModal;
    finally
      DBConnectForm.Free
    end;
  end
  else
    ShowMsg('对不起您没有数库设置权限，无法进行数据库设置！')
end;

procedure TMainForm.SMDBBackupClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据备份') then
  begin
    if systemConfig.DatabaseInUse then
    begin
      Application.CreateForm(TDBMaintainForm, DBMaintainForm);
      try
        DBMaintainForm.ShowModal;
      finally
        DBMaintainForm.Free
      end
    end
    else
    begin
      Application.CreateForm(TSQLDBBackupForm, SQLDBBackupForm);
      try
        SQLDBBackupForm.ShowModal;
      finally
        SQLDBBackupForm.Free;
      end;
    end;
  end
  else
  begin
    if systemConfig.DatabaseInUse then //如果是Access数据库,就自动备份
    begin
      Application.CreateForm(TDBBackupForm, DBBackupForm);
      try
        DBBackupForm.ShowModal;
      finally
        DBBackupForm.Free
      end
    end;
  end
end;

procedure TMainForm.SMPreMaintainClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('预置维护') then
  begin
    Application.CreateForm(TPrepareMaintainForm, PrepareMaintainForm);
    try
      PrepareMaintainForm.toMainForm := False;
      PrepareMaintainForm.ShowModal;
    finally
      FrmWeight1.addDropdownInfo();
      PrepareMaintainForm.Free
    end
  end
  else
    ShowMsg('对不起您没有预置维护权限，无法进行预置维护！')
end;

procedure TMainForm.SMDBClearClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据清理') then
  begin
    Application.CreateForm(TDBClearForm, DBClearForm);
    try
      DBClearForm.ShowModal;
    finally
      DBClearForm.Free
    end
  end
  else
    ShowMsg('对不起您没有数据导出权限，无法进行数据库清理！')
end;

procedure TMainForm.TAutoBackupTimer(Sender: TObject); //每小时备份
begin
  Application.CreateForm(TDBBackupForm, DBBackupForm);
  DBBackupForm.ShowModal
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  MeterConnect1Form.CommP.Disconnect;
  MeterConnect2Form.CommP.Disconnect;

  if myini.ReadBool('system_set', 'export_XML', False) then
  begin
    case myini.ReadInteger('system_set', 'XML_type', 0) of
      0: TWeightUtil.XMLExport0();
      1: TWeightUtil.XMLExport1();
    end;
  end;
  //保存过磅类型
  if FrmWeight1.RBPurchase.Checked then
    myini.WriteInteger('system_set', 'weight_type', 0)
  else if FrmWeight1.RBSale.Checked then
    myini.WriteInteger('system_set', 'weight_type', 1)
  else if FrmWeight1.RBInner.Checked then
    myini.WriteInteger('system_set', 'weight_type', 2)
  else if FrmWeight1.RBOther.Checked then
    myini.WriteInteger('system_set', 'weight_type', 3);
  //保存过磅模式
  if FrmWeight1.RBStandard.Checked then
    myini.WriteInteger('system_set', 'weight_mode', 0)
  else if FrmWeight1.RBSimple.Checked then
    myini.WriteInteger('system_set', 'weight_mode', 1)
  else if FrmWeight1.RBOnce.Checked then
    myini.WriteInteger('system_set', 'weight_mode', 2);
  //保存自动过磅
  myini.WriteBool('system_set', 'auto_mode', FrmWeight1.CBAuto.Checked);
  //记录当前显示的是本月,未完成记录等
  myini.WriteInteger('system_set', 'record_time', CBRecordTime.ItemIndex);
  myini.WriteInteger('system_set', 'record_type', CBRecordType.ItemIndex);
  myini.WriteBool('system_set', 'show_meter2', FrmWeight1.PMeter2.Visible);
  myini.WriteBool('system_set', 'previewTicket', FrmWeight1.CBPreview.Checked);

  saveMenu;
  saveDBGrid(DBGridEh1);

  FrmWeight1.TReadWeight.Enabled := False;
  FrmWeight1.startSteady(False);
  FrmWeight1.TAuto.Enabled := False;
  FrmWeight1.TWaitForZero.Enabled := False;
  FrmWeight1.TWaitForScreen.Enabled := False;

  if (systemConfig.backupType = 3) and (systemConfig.databaseInUse) then
  begin
    Application.CreateForm(TDBBackupForm, DBBackupForm);
    DBBackupForm.ShowModal
  end;

  if myini <> nil then myini.Free;
  if systemConfig <> nil then systemConfig.Free;
  if poWeightSetConfig <> nil then poWeightSetConfig.Free;
  if soWeightSetConfig <> nil then soWeightSetConfig.Free;
  if ioWeightSetConfig <> nil then ioWeightSetConfig.Free;
  if ooWeightSetConfig <> nil then ooWeightSetConfig.Free;

  if arrPicFile <> nil then arrPicFile.Free;
end;

procedure TMainForm.DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  if QueryDataModule.WeightMaintainQuery.Sort <> (Column.FieldName + ' ASC') then
    //判断原排序方式
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' ASC'
  else
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' DESC'
end;

procedure TMainForm.SMDataQueryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据查询') then
  begin
    DataQueryForm.ShowModal;
  end
  else
    ShowMsg('对不起您没有数据查询权限，无法进行数据查询！')
end;

procedure TMainForm.SMAboutClick(Sender: TObject);
begin
  Application.CreateForm(TAboutForm, AboutForm);
  try
    AboutForm.ShowModal;
  finally
    AboutForm.Free
  end
end;

procedure TMainForm.SMComputerClick(Sender: TObject);
begin
  WinExec('calc.exe', SW_SHOW)
end;

procedure TMainForm.SMTerminateClick(Sender: TObject);
begin
  if Application.MessageBox('你确实要关闭计算机吗?', '警告', MB_YESNO +
    MB_ICONQUESTION + MB_TOPMOST) = IDYES then
  begin
    TCommonUtil.ExitWin32Sys(EWX_POWEROFF)
  end;
end;

procedure TMainForm.SMSimulateClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('管理员') then
  begin
    if systemConfig.disconnectToZero then
    begin
      ShowMsg('请先关闭仪表断线回零功能');
      Exit;
    end;
    if not SMSimulate.Checked then
    begin
      SMSimulate.Checked := True;
      meter1Plus := True;
      meter2Plus := True;
      TSimulate.Enabled := True;
    end
    else
    begin
      SMSimulate.Checked := False;
      TSimulate.Enabled := False;
    end
  end
  else
    ShowMsg('对不起您不是管理员，无法进行模拟称重！')
end;

procedure TMainForm.SPMPrintClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, True,
      systemConfig.ticketType);
  end
end;

procedure TMainForm.SPMSaveAsClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('数据导出') then
    Exit;
  if TCommonUtil.exportExcel(DBGridEh1) then
    Application.MessageBox('数据导出成功!', '警告', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TMainForm.TSimulateTimer(Sender: TObject);
begin
  if meter1Plus then
  begin
    FrmWeight1.PWeight1.Caption := FloatToStr(
      StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) + Random(1000) * 10);
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) >= systemConfig.max then
      meter1Plus := False;
  end
  else
  begin
    FrmWeight1.PWeight1.Caption := FloatToStr(
      StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) - Random(1000) * 10);
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 0) <= systemConfig.returnZero then
      meter1Plus := True;
  end;

  if FrmWeight1.PMeter2.Visible then
  begin
    if meter2Plus then
    begin
      FrmWeight1.PWeight2.Caption := FloatToStr(
        StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) + Random(1000) * 10);
      if StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) >= systemConfig.max then
        meter2Plus := False;
    end
    else
    begin
      FrmWeight1.PWeight2.Caption := FloatToStr(
        StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) - Random(1000) * 10);
      if StrToFloatDef(FrmWeight1.PWeight2.Caption, 0) <= systemConfig.returnZero then
        meter2Plus := True;
    end;
  end;
end;

procedure TMainForm.SMReadWeightClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('语音输出') then
    ShowMsg('对不起您没有该权限，无法进行语音输出配置！');
  ReadWeightForm.ShowModal;
end;

procedure TMainForm.N4Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, False, systemConfig.ticketType);
  end
end;

procedure TMainForm.ShowMsg(Msg: string);
begin
  msnpopup1.Title := '提示';
  MSNPopUp1.Text := Msg;
  MSNPopUp1.TimeOut := 3;
  MSNPopUp1.ShowPopUp;
end;

procedure TMainForm.SetCurrentUser(const Value: string);
begin
  FCurrentUser := Value;
  SpUser.Caption := Format('当前用户: %s', [Value]);
end;

procedure TMainForm.SMSysLogClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('系统日志') then
  begin
    Application.CreateForm(TLogForm, LogForm);
    try
      LogForm.ShowModal;
    finally
      LogForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有日志查询权限，无法查询日志！')
  end;
end;

procedure TMainForm.SMBackRecordClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('后台记录') then
  begin
    Application.CreateForm(TBackRecordForm, BackRecordForm);
    try
      BackRecordForm.ShowModal;
    finally
      BackRecordForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有后台记录查询权限，无法查询后台记录！')
  end;
end;

procedure TMainForm.SMTicketSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('系统设置') then
  begin
    Application.CreateForm(TTicketSetForm, TicketSetForm);
    try
      TicketSetForm.ShowModal();
    finally
      TicketSetForm.Free;
    end;
  end
  else
    ShowMsg('对不起您没有磅单修改权限，无法进行磅单修改！')
end;

procedure TMainForm.GetStaticInfo;
var count, todayCount: integer;
  todayNet, todayReal: Double;
begin
  TWeightUtil.getStaticInfo(count, todayCount, todayNet, todayReal);
  FrmWeight1.MSTotalMsg.Caption := Format('全部记录: %s 条; 今日记录: %s 条; 今日净重: %s',
    [IntToStr(count), IntToStr(todayCount), FloatToStr(todayNet)]);
end;

procedure TMainForm.setAutoBackup(t: boolean);
begin
  TAutoBackup.Enabled := t;
end;

procedure TMainForm.SMModifyClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('修改磅单') then
  begin
    if systemConfig.ticketType = 1 then
    begin
      if FrmWeight1.RBPurchase.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.poTicketFormat, 1)
      else if FrmWeight1.RBSale.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.soTicketFormat, 1)
      else if FrmWeight1.RBInner.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ioTicketFormat, 1)
      else if FrmWeight1.RBOther.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ooTicketFormat, 1)
    end
    else if systemConfig.ticketType = 2 then
    begin
      if FrmWeight1.RBPurchase.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.poTicketFormat2, 2)
      else if FrmWeight1.RBSale.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.soTicketFormat2, 2)
      else if FrmWeight1.RBInner.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ioTicketFormat2, 2)
      else if FrmWeight1.RBOther.Checked then
        TReportUtil.designTicket(ExtractFilePath(ParamStr(0)) + systemConfig.ooTicketFormat2, 2)
    end;
  end;
end;

procedure TMainForm.CheckRegistry;
begin
  //注册表中的注册码与当前算出来的一致
  if GetRegistryCode() <> RegisterCode(GetNewEncodeKey) then
  begin
    Application.CreateForm(TRegCodeForm, RegCodeForm);
    try
      RegCodeForm.ShowModal;
    finally
      RegCodeForm.Free;
    end
  end
end;

function TMainForm.GetRegistryCode: string;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      if reg.ValueExists('RegistryCode') then
        Result := reg.ReadString('RegistryCode')
      else
        Result := '';
    end;
  finally
    reg.Free;
  end;
end;

procedure TMainForm.SMScreenClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('大屏幕设置') then
    ShowMsg('对不起您没有该权限，无法进行大屏幕设置！');
  ComOutputForm.ShowModal();
end;

procedure TMainForm.loadFormDesign;
begin
  with FrmWeight1 do
  begin
    lblCar.Caption := poWeightSetConfig.carCaption;
    lblFaHuo.Caption := poWeightSetConfig.faHuoCaption;
    lblShouHuo.Caption := poWeightSetConfig.shouHuoCaption;
    lblGoods.Caption := poWeightSetConfig.goodsCaption;
    lblSpec.Caption := poWeightSetConfig.specCaption;
    lblGross.Caption := poWeightSetConfig.grossCaption;
    lblTare.Caption := poWeightSetConfig.tareCaption;
    lblNet.Caption := poWeightSetConfig.netCaption;
    lblBundle.Caption := poWeightSetConfig.bundleCaption;
    lblReal.Caption := poWeightSetConfig.realCaption;
    lblPrice.Caption := poWeightSetConfig.priceCaption;
    lblSum.Caption := poWeightSetConfig.sumCaption;
    lblScale.Caption := poWeightSetConfig.scaleCaption;
    lblQuanter.Caption := poWeightSetConfig.quanterCaption;
    lblCost.Caption := poWeightSetConfig.costCaption;
    lblMemo.Caption := poWeightSetConfig.memoCaption;
    lblbackup1.Caption := poWeightSetConfig.backup1Caption;
    lblbackup2.Caption := poWeightSetConfig.backup2Caption;
    lblbackup3.Caption := poWeightSetConfig.backup3Caption;
    lblbackup4.Caption := poWeightSetConfig.backup4Caption;
    lblbackup5.Caption := poWeightSetConfig.backup5Caption;
    lblbackup6.Caption := poWeightSetConfig.backup6Caption;
    lblbackup7.Caption := poWeightSetConfig.backup7Caption;
    lblbackup8.Caption := poWeightSetConfig.backup8Caption;
    lblbackup9.Caption := poWeightSetConfig.backup9Caption;
    lblbackup10.Caption := poWeightSetConfig.backup10Caption;
    lblbackup11.Caption := poWeightSetConfig.backup11Caption;
    lblbackup12.Caption := poWeightSetConfig.backup12Caption;
    lblbackup13.Caption := poWeightSetConfig.backup13Caption;
    lblbackup14.Caption := poWeightSetConfig.backup14Caption;
    lblbackup15.Caption := poWeightSetConfig.backup15Caption;
    lblbackup16.Caption := poWeightSetConfig.backup16Caption;
    lblbackup17.Caption := poWeightSetConfig.backup17Caption;
    lblbackup18.Caption := poWeightSetConfig.backup18Caption;
  end;

  DBGridEh1.FieldColumns['序号'].Title.Caption := poWeightSetConfig.noCaption;
  DBGridEh1.FieldColumns['流水号'].Title.Caption := poWeightSetConfig.glideNoCaption;
  DBGridEh1.FieldColumns['车号'].Title.Caption := poWeightSetConfig.carCaption;
  DBGridEh1.FieldColumns['过磅类型'].Title.Caption := poWeightSetConfig.weightTypeCaption;
  DBGridEh1.FieldColumns['发货单位'].Title.Caption := poWeightSetConfig.faHuoCaption;
  DBGridEh1.FieldColumns['收货单位'].Title.Caption := poWeightSetConfig.shouHuoCaption;
  DBGridEh1.FieldColumns['货名'].Title.Caption := poWeightSetConfig.goodsCaption;
  DBGridEh1.FieldColumns['规格'].Title.Caption := poWeightSetConfig.specCaption;
  DBGridEh1.FieldColumns['毛重'].Title.Caption := poWeightSetConfig.grossCaption;
  DBGridEh1.FieldColumns['皮重'].Title.Caption := poWeightSetConfig.tareCaption;
  DBGridEh1.FieldColumns['净重'].Title.Caption := poWeightSetConfig.netCaption;
  DBGridEh1.FieldColumns['扣重'].Title.Caption := poWeightSetConfig.bundleCaption;
  DBGridEh1.FieldColumns['实重'].Title.Caption := poWeightSetConfig.realCaption;
  DBGridEh1.FieldColumns['单价'].Title.Caption := poWeightSetConfig.priceCaption;
  DBGridEh1.FieldColumns['金额'].Title.Caption := poWeightSetConfig.sumCaption;
  DBGridEh1.FieldColumns['折方系数'].Title.Caption := poWeightSetConfig.scaleCaption;
  DBGridEh1.FieldColumns['方量'].Title.Caption := poWeightSetConfig.quanterCaption;
  DBGridEh1.FieldColumns['过磅费'].Title.Caption := poWeightSetConfig.costCaption;
  DBGridEh1.FieldColumns['毛重司磅员'].Title.Caption := poWeightSetConfig.grossManCaption;
  DBGridEh1.FieldColumns['皮重司磅员'].Title.Caption := poWeightSetConfig.tareManCaption;
  DBGridEh1.FieldColumns['毛重磅号'].Title.Caption := poWeightSetConfig.grossAddrCaption;
  DBGridEh1.FieldColumns['皮重磅号'].Title.Caption := poWeightSetConfig.tareAddrCaption;
  DBGridEh1.FieldColumns['毛重时间'].Title.Caption := poWeightSetConfig.grossTimeCaption;
  DBGridEh1.FieldColumns['皮重时间'].Title.Caption := poWeightSetConfig.tareTimeCaption;
  DBGridEh1.FieldColumns['一次过磅时间'].Title.Caption := poWeightSetConfig.firstTimeCaption;
  DBGridEh1.FieldColumns['二次过磅时间'].Title.Caption := poWeightSetConfig.secondTimeCaption;
  DBGridEh1.FieldColumns['更新人'].Title.Caption := poWeightSetConfig.updateUserCaption;
  DBGridEh1.FieldColumns['更新时间'].Title.Caption := poWeightSetConfig.updateTimeCaption;
  DBGridEh1.FieldColumns['备注'].Title.Caption := poWeightSetConfig.memoCaption;
  DBGridEh1.FieldColumns['打印次数'].Title.Caption := poWeightSetConfig.printCountCaption;
  DBGridEh1.FieldColumns['上传否'].Title.Caption := poWeightSetConfig.uploadCaption;
  DBGridEh1.FieldColumns['备用1'].Title.Caption := poWeightSetConfig.backup1Caption;
  DBGridEh1.FieldColumns['备用2'].Title.Caption := poWeightSetConfig.backup2Caption;
  DBGridEh1.FieldColumns['备用3'].Title.Caption := poWeightSetConfig.backup3Caption;
  DBGridEh1.FieldColumns['备用4'].Title.Caption := poWeightSetConfig.backup4Caption;
  DBGridEh1.FieldColumns['备用5'].Title.Caption := poWeightSetConfig.backup5Caption;
  DBGridEh1.FieldColumns['备用6'].Title.Caption := poWeightSetConfig.backup6Caption;
  DBGridEh1.FieldColumns['备用7'].Title.Caption := poWeightSetConfig.backup7Caption;
  DBGridEh1.FieldColumns['备用8'].Title.Caption := poWeightSetConfig.backup8Caption;
  DBGridEh1.FieldColumns['备用9'].Title.Caption := poWeightSetConfig.backup9Caption;
  DBGridEh1.FieldColumns['备用10'].Title.Caption := poWeightSetConfig.backup10Caption;
  DBGridEh1.FieldColumns['备用11'].Title.Caption := poWeightSetConfig.backup11Caption;
  DBGridEh1.FieldColumns['备用12'].Title.Caption := poWeightSetConfig.backup12Caption;
  DBGridEh1.FieldColumns['备用13'].Title.Caption := poWeightSetConfig.backup13Caption;
  DBGridEh1.FieldColumns['备用14'].Title.Caption := poWeightSetConfig.backup14Caption;
  DBGridEh1.FieldColumns['备用15'].Title.Caption := poWeightSetConfig.backup15Caption;
  DBGridEh1.FieldColumns['备用16'].Title.Caption := poWeightSetConfig.backup16Caption;
  DBGridEh1.FieldColumns['备用17'].Title.Caption := poWeightSetConfig.backup17Caption;
  DBGridEh1.FieldColumns['备用18'].Title.Caption := poWeightSetConfig.backup18Caption;

end;

procedure TMainForm.SMMeter2Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('仪表设置') then
    MeterConnect2Form.ShowModal
  else
    ShowMsg('对不起您没有仪表设置权限，无法进行仪表设置！')
end;

procedure TMainForm.SMDBInitClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据初始化') then
  begin
    Application.CreateForm(TInitializeOptionForm, InitializeOptionForm);
    try
      InitializeOptionForm.ShowModal();
    finally
      InitializeOptionForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有数据库权限，无法进行数据库初始化操作！')
  end;
  showGridRecord;
end;

function TMainForm.showGridRecord: string;
begin
  if systemConfig.useExceed then
    TWeightUtil.moveExceedRecord;

  try
    case CBRecordTime.ItemIndex of
      0:
        TWeightUtil.showHistoryRecord(CBRecordType.ItemIndex);
      1:
        TWeightUtil.showTodayRecord(CBRecordType.ItemIndex);
      2:
        TWeightUtil.showToWeekRecord(CBRecordType.ItemIndex);
      3:
        TWeightUtil.showToMonthRecord(CBRecordType.ItemIndex);
      4:
        TWeightUtil.showToSeasonRecord(CBRecordType.ItemIndex);
      5:
        TWeightUtil.showToYearRecord(CBRecordType.ItemIndex);
    else
      TWeightUtil.showHistoryRecord(CBRecordType.ItemIndex);
    end;
  except
    ShowMsg('数据库无法打开，请检查!');
  end;

  Repaint
end;

procedure TMainForm.CBRecordTypeChange(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.loadSysConfig;
var i: Integer;
begin
  //先导入配置
  TSysConfigUtil.loadConfig(systemConfig, poWeightSetConfig, soWeightSetConfig,
    ioWeightSetConfig, ooWeightSetConfig);

  setAutoBackup(systemConfig.backupType = 2);
  if FileExists(ExtractFilePath(ParamStr(0)) + 'bg.jpg') then
    ImgBack.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'bg.jpg');

  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\exit.bmp') then
    TBExit.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\exit.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\logout.bmp') then
    TBChange.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\logout.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp') then
    TBWeight.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\query.bmp') then
    TBQuery.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\query.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\ticket.bmp') then
    TBTicket.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\ticket.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\video.bmp') then
    TBVideo.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\video.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\calc.bmp') then
    TBCalc.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\calc.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\double.bmp') then
    TBDouble.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\double.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\net.bmp') then
    TBNet.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\net.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\voice.bmp') then
    TBVoice.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\voice.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\phone.bmp') then
    TBPhone.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\phone.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\gross.bmp') then
    FrmWeight1.BitBtnGross.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\gross.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\tare.bmp') then
    FrmWeight1.BitBtnTare.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\tare.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp') then
    FrmWeight1.BitBtnSave.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp') then
    FrmWeight1.BitBtnPrint.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\setTare.bmp') then
    FrmWeight1.BtnSetTare.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\setTare.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp') then
    FrmWeight1.BitBtnClear.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp') then
    FrmWeight1.BtnWeight.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\weight.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp') then
    FrmWeight1.BtnSave.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\save.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp') then
    FrmWeight1.BtnPrint.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\print.bmp');
  if FileExists(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp') then
    FrmWeight1.BtnCancel.Glyph.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\ico\clear.bmp');


  TBackRecord.Enabled := systemConfig.useBackRecord;
  canAutoSave1 := True;
  canAutoSave2 := True;

  FrmWeight1.saved := False;
  //记录当前显示的是本月,未完成记录等
  CBRecordTime.ItemIndex := systemConfig.recordTime;
  CBRecordType.ItemIndex := systemConfig.recordType;
  if systemConfig.showMeter2 then FrmWeight1.showMeter2();
  if systemConfig.deleteHistory then TWeightUtil.DelHistory();
  TWeightUtil.checkPicCount(systemConfig.picCount);

  case systemConfig.weightType of
    0: FrmWeight1.RBPurchase.Checked := True;
    1: FrmWeight1.RBSale.Checked := True;
    2: FrmWeight1.RBInner.Checked := True;
    3: FrmWeight1.RBOther.Checked := True;
  end;
  FrmWeight1.RBStandard.Enabled := systemConfig.useStandard;
  FrmWeight1.RBSimple.Enabled := systemConfig.useSimple;
  FrmWeight1.RBOnce.Enabled := systemConfig.useOnce;
  FrmWeight1.CBAuto.Checked := systemConfig.autoMode;
  FrmWeight1.setAutoState();

  case systemConfig.weightMode of
    0: FrmWeight1.RBStandard.Checked := True;
    1: FrmWeight1.RBSimple.Checked := True;
    2: FrmWeight1.RBOnce.Checked := True;
  end;
  FrmWeight1.CBPreview.Checked := systemConfig.previewTicket;

  FrmWeight1.EdtBackup6.ReadOnly := poWeightSetConfig.useExpression6;
  FrmWeight1.EdtBackup7.ReadOnly := poWeightSetConfig.useExpression7;
  FrmWeight1.EdtBackup8.ReadOnly := poWeightSetConfig.useExpression8;
  FrmWeight1.EdtBackup9.ReadOnly := poWeightSetConfig.useExpression9;
  FrmWeight1.EdtBackup15.ReadOnly := poWeightSetConfig.useExpression15;
  FrmWeight1.EdtBackup16.ReadOnly := poWeightSetConfig.useExpression16;
  FrmWeight1.EdtBackup17.ReadOnly := poWeightSetConfig.useExpression17;
  FrmWeight1.EdtBackup18.ReadOnly := poWeightSetConfig.useExpression18;

  FrmWeight1.EdtPrice.ReadOnly := not systemConfig.allowModifyPrice;
  FrmWeight1.EdtScale.ReadOnly := not systemConfig.allowModifyPrice;
  FrmWeight1.EdtCost.Enabled := systemConfig.manualInputPound;

  FrmWeight1.MSTotalMsg.Visible := systemConfig.showTotal;

  Application.Title := '称重管理系统';
  Caption := systemConfig.mainTitle; //'称重管理系统';

  setCompanyInfo();
  if systemConfig.databaseInUse then
    SpMode.Caption := '[单机模式]'
  else
    SpMode.Caption := '[联网模式]';
  //暗扣重量
  cheat1.ShortCut := systemConfig.cheat1ShortCut;
  cheat2.ShortCut := systemConfig.cheat2ShortCut;
  cheat3.ShortCut := systemConfig.cheat3ShortCut;
  cheat4.ShortCut := systemConfig.cheat4ShortCut;
  cheat5.ShortCut := systemConfig.cheat5ShortCut;
  cheat6.ShortCut := systemConfig.cheat6ShortCut;
  cheat7.ShortCut := systemConfig.cheat7ShortCut;
  cheat8.ShortCut := systemConfig.cheat8ShortCut;
  cheatClose.ShortCut := systemConfig.cheatCloseShortCut;

  setSkin(systemConfig.skinFile);
  setVoiceRate(systemConfig.voiceRate);
  TAutoRefresh.Interval := systemConfig.autoRefreshInterval * 1000;
  TAutoRefresh.Enabled := systemConfig.autoRefresh;

end;

procedure TMainForm.cheat1Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := not systemConfig.cweightFlag1;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat2Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := not systemConfig.cweightFlag2;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat3Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := not systemConfig.cweightFlag3;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat4Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := not systemConfig.cweightFlag4;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.ASetCheatExecute(Sender: TObject);
begin
  if TUserUtil.HasAuthority('系统设置') and SMSimulate.Checked then
  begin
    Application.CreateForm(TCorrectForm, CorrectForm);
    try
      CorrectForm.ShowModal();
    finally
      CorrectForm.Free;
    end;
  end;
end;

procedure TMainForm.DBGridEh1DblClick(Sender: TObject);
begin
  with DBGridEh1.DataSource.DataSet do
  begin
    //只允许弹出未完成记录
    if systemConfig.onlyShowNotFinishedRecord then
    begin
      if StrToFloatDef(FieldByName('净重').AsString, 0) <> 0 then
        Exit;
    end;
    FrmWeight1.lastGlideNo := '';

    FrmWeight1.CBCar.Text := FieldByName('车号').AsString;
    FrmWeight1.CBFaHuo.Text := FieldByName('发货单位').AsString;
    FrmWeight1.CBShouHuo.Text := FieldByName('收货单位').AsString;
    FrmWeight1.CBGoods.Text := FieldByName('货名').AsString;
    FrmWeight1.CBSpec.Text := FieldByName('规格').AsString;
    {
    if StrToFloatDef(FieldByName('净重').AsString, 0) = 0 then
    begin
      FrmWeight1.EdtGross.Text := FieldByName('毛重').AsString;
      FrmWeight1.EdtTare.Text := FieldByName('皮重').AsString;
      FrmWeight1.lastGlideNo := FieldByName('流水号').AsString;
    end;
    }
    FrmWeight1.EdtCost.Text := FieldByName('过磅费').AsString;
    FrmWeight1.EdtQuanter.Text := FieldByName('方量').AsString;

    FrmWeight1.EdtBundle.Text := FieldByName('扣重').AsString;
    FrmWeight1.EdtPrice.Text := FieldByName('单价').AsString;
    FrmWeight1.EdtScale.Text := FieldByName('折方系数').AsString;
    FrmWeight1.EdtMemo.Text := FieldByName('备注').AsString;
    FrmWeight1.CBBackup1.Text := FieldByName('备用1').AsString;
    FrmWeight1.CBBackup2.Text := FieldByName('备用2').AsString;
    FrmWeight1.CBBackup3.Text := FieldByName('备用3').AsString;
    FrmWeight1.CBBackup4.Text := FieldByName('备用4').AsString;
    FrmWeight1.CBBackup5.Text := FieldByName('备用5').AsString;
    FrmWeight1.EdtBackup6.Text := FieldByName('备用6').AsString;
    FrmWeight1.EdtBackup7.Text := FieldByName('备用7').AsString;
    FrmWeight1.EdtBackup8.Text := FieldByName('备用8').AsString;
    FrmWeight1.EdtBackup9.Text := FieldByName('备用9').AsString;
    FrmWeight1.CBBackup10.Text := FieldByName('备用10').AsString;
    FrmWeight1.CBBackup11.Text := FieldByName('备用11').AsString;
    FrmWeight1.CBBackup12.Text := FieldByName('备用12').AsString;
    FrmWeight1.CBBackup13.Text := FieldByName('备用13').AsString;
    FrmWeight1.CBBackup14.Text := FieldByName('备用14').AsString;
    FrmWeight1.EdtBackup15.Text := FieldByName('备用15').AsString;
    FrmWeight1.EdtBackup16.Text := FieldByName('备用16').AsString;
    FrmWeight1.EdtBackup17.Text := FieldByName('备用17').AsString;
    FrmWeight1.EdtBackup18.Text := FieldByName('备用18').AsString;

    if systemConfig.doubleClickModifyRecord then
    begin
      Application.CreateForm(TManualInputForm, ManualInputForm);
      try
        ManualInputForm.glideNo :=
          FieldByName('流水号').AsString;
        ManualInputForm.insertOrUpdate := False;
        ManualInputForm.ShowModal;
      finally
        ManualInputForm.Free;
        showGridRecord;
      end;
    end;
  end;
end;

procedure TMainForm.SMTareTrendClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据查询') then
  begin
    Application.CreateForm(TTareChartForm, TareChartForm);
    try
      TareChartForm.ShowModal;
    finally
      TareChartForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有数据查询权限，无法查看皮重走势图！')
  end;
end;

procedure TMainForm.SMDesignClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('界面配置') then
  begin
    Application.CreateForm(TWeightSetForm, WeightSetForm);
    try
      WeightSetForm.ShowModal;
    finally
      WeightSetForm.Free;
    end
  end
  else
    ShowMsg('对不起您没有系统设置权限，无法进行称重界面设置！');
end;

procedure TMainForm.TBExitClick(Sender: TObject);
begin
  SpltMain.Visible := False;
end;

procedure TMainForm.TBChangeClick(Sender: TObject);
begin
  SMChange.Click
end;

procedure TMainForm.TBWeightClick(Sender: TObject);
begin
  SMWeight.Click
end;

procedure TMainForm.TBQueryClick(Sender: TObject);
begin
  SMDataQuery.Click
end;

procedure TMainForm.TBCalcClick(Sender: TObject);
begin
  SMComputer.Click
end;

procedure TMainForm.TBTicketClick(Sender: TObject);
begin
  SMTicketSet.Click;
end;

procedure TMainForm.TBVideoClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('视频设置') then
  begin
    if VideoForm.Visible then VideoForm.Close
    else VideoForm.Show;
  end
  else
  begin
    ShowMsg('对不起您无权查看视频！')
  end;
end;

procedure TMainForm.SMVideoClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('视频设置') then
    VideoSetForm.ShowModal
  else
    ShowMsg('对不起您没有视频设置权限，无法进行视频设置！')
end;

procedure TMainForm.loadVoiceList;
var sl: TStrings;
  t: TMenuItem;
  i: Integer;
begin
  sl := TStringList.Create;
  try
    if not FileExists(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt') then
    begin
      sl.Add('称重完毕，请离开秤台！');
      sl.Add('请熄火下车！');
      sl.Add('请停到秤台中间！');
      sl.Add('祝你一路平安！');
      sl.Add('请上秤');
      sl.SaveToFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
    end;
    sl.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'VoiceList.txt');
    PMVoice.Items.Clear;
    PMVoice.AutoHotkeys := maManual;
    for i := 0 to sl.Count - 1 do
    begin
      t := TMenuItem.Create(PMVoice);
      t.AutoHotkeys := maManual;
      t.Caption := sl.Strings[i];
      t.OnClick := pmVoiceClick;
      PMVoice.Items.Add(t);
    end;
  finally
    sl.Free;
  end;
end;

procedure TMainForm.pmVoiceClick(Sender: TObject);
begin
  try
    SpVoice1.Speak('', SVSFPurgeBeforeSpeak);
    SpVoice1.Speak((Sender as TMenuItem).Caption, SVSFlagsAsync);
  except
  end;
end;

procedure TMainForm.CBRecordTimeChange(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.SMChargeClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('预置维护') then
  begin
    Application.CreateForm(TPayForm, PayForm);
    try
      PayForm.ShowModal;
    finally
      PayForm.Free
    end
  end
  else
    ShowMsg('对不起您没有预置维护权限，无法进行充值操作！')
end;

procedure TMainForm.SMChargeHistoryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('预置维护') then
  begin
    Application.CreateForm(TPayHistoryForm, PayHistoryForm);
    try
      PayHistoryForm.ShowModal;
    finally
      PayHistoryForm.Free
    end
  end
  else
    ShowMsg('对不起您没有预置维护权限，无法查询充值历史！')
end;

procedure TMainForm.SMTaoQueryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('预置维护') then
  begin
    Application.CreateForm(TTaoForm, TaoForm);
    try
      TaoForm.ShowModal;
    finally
      TaoForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有套表维护权限，无法进行套表维护！');
  end;
end;

procedure TMainForm.RzToolbar1DblClick(Sender: TObject);
begin
  RzToolbar1.Customize();
end;

procedure TMainForm.AVideoExecute(Sender: TObject);
begin
  if VideoForm.Visible then VideoForm.Close
  else VideoForm.Show;
end;

procedure TMainForm.SMSkinClick(Sender: TObject);
begin
  Application.CreateForm(TSkinChangeForm, SkinChangeForm);
  try
    SkinChangeForm.ShowModal;
  finally
    SkinChangeForm.Free;
  end;
end;

function TMainForm.setSkin(skinFile: string): Boolean;
begin
  if skinFile = '' then
  begin
    SkinData1.Active := False;
  end
  else
  begin
    if FileExists(ExtractFilePath(ParamStr(0)) + '\Skin\' + skinFile + '.skn') then
    begin
      SkinData1.LoadFromFile(ExtractFilePath(ParamStr(0)) + '\Skin\' + skinFile + '.skn');
      SkinData1.Active := True;
    end;
  end;
end;

function TMainForm.resizeMain: Boolean;
begin
  FrmWeight1.Align := alClient;
  FrmWeight1.Width := PWeight.Width;
  FrmWeight1.resizeWidth;
  FrmWeight1.setWeightPos;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  resizeMain;
end;

procedure TMainForm.TLineTimer(Sender: TObject);
begin
  if systemConfig.useWeightLine then
  begin
    TDrawLine1.draw(FrmWeight1.PWeight1);
    TDrawLine2.draw(FrmWeight1.PWeight2);
  end;
end;

procedure TMainForm.SMDBMigrateClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据库设置') then
  begin
    Application.CreateForm(TDataMigrateForm, DataMigrateForm);
    try
      DataMigrateForm.ShowModal;
    finally
      DataMigrateForm.Free
    end;
  end
  else
    ShowMsg('对不起您没有该权限，无法进行数据库迁移！')
end;

procedure TMainForm.TBackRecordTimer(Sender: TObject);
begin
  //后台自动保存数据
  if canAutoSave1 then
  begin
    if (StrToFloatDef(FrmWeight1.PWeight1.Caption, 1000) > systemConfig.backRecordWeight)
      and (FrmWeight1.getSteady) then
    begin
      TWeightUtil.saveBackRecord(FrmWeight1.PWeight1.Caption);
      canAutoSave1 := False;
    end;
  end
  else
  begin
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 1000) < systemConfig.ReturnZero then
      canAutoSave1 := True;
  end;

  if canAutoSave2 then
  begin
    if (StrToFloatDef(FrmWeight1.PWeight2.Caption, 1000) > systemConfig.backRecordWeight)
      and (FrmWeight1.getSteady) then
    begin
      TWeightUtil.saveBackRecord(FrmWeight1.PWeight2.Caption);
      canAutoSave2 := False;
    end;
  end
  else
  begin
    if StrToFloatDef(FrmWeight1.PWeight2.Caption, 1000) < systemConfig.ReturnZero then
      canAutoSave2 := True;
  end;
end;

procedure TMainForm.SMStaticTrendClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据查询') then
  begin
    Application.CreateForm(TStaticChartForm, StaticChartForm);
    try
      StaticChartForm.ShowModal;
    finally
      StaticChartForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有数据查询权限，无法查看统计数据！')
  end;
end;

procedure TMainForm.SMBackGroundClick(Sender: TObject);
var od: TOpenPictureDialog;
begin
  od := TOpenPictureDialog.Create(nil);
  try
    od.DefaultExt := 'jpg';
    od.FileName := '';
    od.Filter := '背景图片(*.jpg)|*.jpg';
    od.InitialDir := ExtractFilePath(ParamStr(0)) + 'BackGround';
    if od.Execute then
    begin
      setBackGround(od.FileName);
    end;
  finally
    od.Free;
  end;
end;

function TMainForm.setBackGround(s: string): Boolean;
begin
  if FileExists(s) then
  begin
    CopyFile(PChar(s), PChar(ExtractFilePath(ParamStr(0)) + '\bg.jpg'), False);
    ImgBack.Picture.LoadFromFile(s);
  end;
end;

function TMainForm.setVoiceRate(r: Integer): Boolean;
begin
  if (r >= -10) and (r <= 10) then
  begin
    try
      SpVoice1.Rate := r;
      SpVoice1.Volume
    except
    end;
  end;
end;

procedure TMainForm.TBDoubleClick(Sender: TObject);
begin
  FrmWeight1.showMeter2();
  FrmWeight1.setWeightPos;
end;

procedure TMainForm.SMMailClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据导出') then
  begin
    MailForm.ShowModal();
  end;
end;

procedure TMainForm.TBNetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据库设置') then
  begin
    Application.CreateForm(TDBConnectForm, DBConnectForm);
    try
      DBConnectForm.ShowModal;
    finally
      DBConnectForm.Free
    end;
  end
  else
    ShowMsg('对不起您没有数库设置权限，无法进行数据库设置！')
end;

procedure TMainForm.TBVoiceContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  if TUserUtil.HasAuthority('语音输出') then
  begin
    Application.CreateForm(TVoiceForm, VoiceForm);
    try
      VoiceForm.ShowModal();
    finally
      VoiceForm.Free;
    end;
  end
  else
    ShowMsg('对不起您没有语音输出权限，无法进行语音输出设置！')
end;

procedure TMainForm.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var t: string;
begin
  if not systemConfig.gridOddEvenColor then
  begin
    t := DBGridEh1.DataSource.DataSet.FieldByName('过磅类型').AsString;
    if t = 'PO' then
      Background := clWindow
    else if t = 'SO' then
      Background := clSkyBlue
    else if t = 'IO' then
      Background := clMoneyGreen
    else
      Background := clBtnFace;
  end;
end;

function TMainForm.getBgFile: Boolean;
var f: TSearchRec;
  sPath, sFile: string;
  dt: TDateTime;
  FilePath: string;
begin
  FilePath := ExtractFilePath(ParamStr(0)) + 'BackGround\';
  if Copy(FilePath, Length(FilePath), 1) <> '\\' then
    sPath := FilePath + '\\'
  else
    sPath := FilePath;
  if FindFirst(sPath + '*.jpg', faAnyFile, f) = 0 then
  begin
    repeat
      sFile := Trim(f.Name);
      if sFile = '.' then
        Continue;
      if sFile = '..' then
        Continue;
      sFile := sPath + f.Name;
      if (f.Attr and faAnyFile) = f.Attr then
      begin
        arrPicFile.Add(sFile);
      end;
    until FindNext(f) <> 0;
    FindClose(f);
  end;
end;

procedure TMainForm.ImgBackDblClick(Sender: TObject);
begin
  {inc(picStep);
  if picStep > arrPicFile.Count - 1 then
    picStep := 0;
  if FileExists(arrPicFile[picStep]) then
    setBackGround(arrPicFile[picStep]);  }
end;

procedure TMainForm.SMHelpClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PAnsiChar(ExtractFilePath(Application.ExeName) + '\help.chm'), '', '', SW_SHOW);
end;

procedure TMainForm.SMManualInputClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('添加记录') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.insertOrUpdate := True;
      ManualInputForm.ShowModal;
    finally
      ManualInputForm.Free;
    end;
  end
  else
  begin
    ShowMsg('对不起您没有添加记录权限，无法添加记录！')
  end;
end;

procedure TMainForm.N30Click(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.setCompanyInfo();
begin
  SpInfo.Caption := Format('%s 使用单位:%s 电话号码:%s  专业研发各类称重系统,无人值守系统,进销存系统,配料系统',
    [Application.Title, systemConfig.company, systemConfig.tel]);
end;

procedure TMainForm.SMStorageInfoClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据查询') then
  begin
    Application.CreateForm(TStorageForm, StorageForm);
    try
      StorageForm.ShowModal;
    finally
      StorageForm.Free;
    end;
  end;
end;

procedure TMainForm.SMInvalidQueryClick(Sender: TObject);
begin
  Application.CreateForm(TInvalidDataQueryForm, InvalidDataQueryForm);
  try
    InvalidDataQueryForm.ShowModal;
  finally
    InvalidDataQueryForm.Free;
  end;
end;

procedure TMainForm.N35Click(Sender: TObject);
begin
  if systemConfig.onlyAllowInvalidNotFinished then
  begin
    if DBGridEh1.DataSource.DataSet.FieldByName('净重').AsFloat <> 0 then
    begin
      Exit;
    end;
  end;
  if TUserUtil.HasAuthority('卡号管理') then
  begin
    if MessageDlg('你确定要作废这条记录吗?', mtConfirmation, [mbYes, mbNo],
      0) = mrNo then
    begin
      Exit;
    end;
    if TWeightUtil.moveDeletedRecord(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString) then
    begin
      DBGridEh1.DataSource.DataSet.Delete;
      Application.MessageBox('该记录已经作废', '提示', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end
    else
    begin
      if MessageBox(0, '作废该记录失败，是否直接删除？', '提示', MB_YESNO +
        MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
      begin
        if TUserUtil.HasAuthority('删除记录') then
        begin
          DBGridEh1.DataSource.DataSet.Delete;
          TWeightUtil.deletePhoto(DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString);
        end
        else
        begin
          MessageBox(0, '对不起，你无权删除数据！', '错误', MB_OK + MB_ICONSTOP
            + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
      end;
    end;
  end;
end;

procedure TMainForm.SMPriceQueryClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('预置维护') then
  begin
    Application.CreateForm(TPriceForm, PriceForm);
    try
      PriceForm.ShowModal;
    finally
      PriceForm.Free
    end
  end
  else
    ShowMsg('对不起您没有预置维护权限，无法进行客户价格维护！')
end;

procedure TMainForm.cbjt1Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printPicTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, True,
      systemConfig.ticketType);
  end
end;

procedure TMainForm.N37Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printPicTicket(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, False, systemConfig.ticketType);
  end
end;

procedure TMainForm.TAutoShutTimer(Sender: TObject);
begin
  if systemConfig.CloseTime = FormatDateTime('hns', Now) then
  begin
    Application.CreateForm(TAutoShutForm, AutoShutForm);
    AutoShutForm.ShowModal
  end
end;

procedure TMainForm.N45Click(Sender: TObject);
begin
  TWeightUtil.showWeightPic(
    DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString);
  PhotoForm.Show;
end;

procedure TMainForm.N46Click(Sender: TObject);
begin
  Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
  try
    DataShowSettingForm.DBGridEh1 := DBGridEh1;
    DataShowSettingForm.ShowModal;
  finally
    DataShowSettingForm.Free
  end
end;

procedure TMainForm.N47Click(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEh1;
    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(systemConfig.dataReportTitle);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('操作员：' + CurrentUser + '        ' + '报表时间：' +
      DateTimeToStr(Now));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('第&[Page]页/共&[Pages]页');
    Preview
  end
end;

procedure TMainForm.PhotoBtnClick(Sender: TObject);
begin
  TWeightUtil.showWeightPic(
    DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString);

  PhotoForm.Show;
end;

procedure TMainForm.ListBtnClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('界面配置') then
  begin
    Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
    try
      DataShowSettingForm.DBGridEh1 := DBGridEh1;
      DataShowSettingForm.ShowModal;
    finally
      DataShowSettingForm.Free
    end
  end
end;

procedure TMainForm.OutputBtnClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('数据导出') then
    Exit;
  if TCommonUtil.exportExcel(DBGridEh1) then
    Application.MessageBox('数据导出成功!', '警告', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TMainForm.PrintBtnClick(Sender: TObject);
begin
  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEh1;
    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(systemConfig.dataReportTitle);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('操作员：' + CurrentUser + '        ' + '报表时间：' +
      DateTimeToStr(Now));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('第&[Page]页/共&[Pages]页');
    Preview
  end
end;

procedure TMainForm.cheatCloseExecute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;

  systemConfig.fixCheatFlag := not systemConfig.fixCheatFlag;
  setExportWeightCheat();
end;

procedure TMainForm.loadFormDesignFile;
var f: TSearchRec;
  sPath, sFile: string;
  dt: TDateTime;
  FilePath: string;
  slDesign: TStringList;
  i: Integer;
begin
  slDesign := TStringList.Create;
  try
    FilePath := ExtractFilePath(ParamStr(0)) + 'Design';
    if Copy(FilePath, Length(FilePath), 1) <> '\' then
      sPath := FilePath + '\'
    else
      sPath := FilePath;
    if FindFirst(sPath + '*.wfc', faAnyFile, f) = 0 then
    begin
      repeat
        sFile := Trim(f.Name);
        if sFile = '.' then
          Continue;
        if sFile = '..' then
          Continue;
        //sFile := sPath + f.Name;
        if (f.Attr and faAnyFile) = f.Attr then
        begin
          slDesign.Add(Copy(sFile, 1, Length(sFile) - 4));
        end;
      until FindNext(f) <> 0;
      FindClose(f);
    end;

    setLength(arrDesignMenu, slDesign.Count);
    for i := 0 to slDesign.Count - 1 do
    begin
      arrDesignMenu[i] := TMenuItem.Create(nil);
      arrDesignMenu[i].AutoHotkeys := maManual;
      arrDesignMenu[i].Caption := slDesign.Strings[i];
      arrDesignMenu[i].OnClick := selWeightForm;
    end;
    SMWeightSet.Add(arrDesignMenu);
  finally
    slDesign.Free;
  end;
end;

procedure TMainForm.selWeightForm(Sender: TObject);
var f: string;
begin
  if TUserUtil.HasAuthority('界面配置') then
  begin
    if MessageBox(0, '你将丢失当前界面，是否继续？', '警告', MB_YESNO +
      MB_ICONWARNING + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
    begin
      f := ExtractFilePath(ParamStr(0)) + 'Design\' + (Sender as TMenuItem).Caption + '.wfc';

      if FileExists(f) then
      begin
        CopyFile(PChar(f), PChar(ExtractFilePath(ParamStr(0)) + 'design.ini'), False);
        TSysConfigUtil.loadFormConfig(MainForm.poWeightSetConfig, MainForm.soWeightSetConfig,
          MainForm.ioWeightSetConfig, MainForm.ooWeightSetConfig);

        if MainForm.SpltMain.Visible then
        begin
          MainForm.loadFormDesign;
          MainForm.SMWeight.Click;
        end;
      end;
    end;
  end
  else
  begin
    ShowMsg('你无权切换界面');
  end;
end;

procedure TMainForm.speak(str: string);
begin
  if str = '' then
    Exit;
  try
    SpVoice1.Speak('', SVSFPurgeBeforeSpeak);
    str := StringReplace(str, '[车号]', FrmWeight1.CBCar.Text, [rfReplaceAll]);
    str := StringReplace(str, '[发货单位]', FrmWeight1.CBFaHuo.Text, [rfReplaceAll]);
    str := StringReplace(str, '[收货单位]', FrmWeight1.CBShouHuo.Text, [rfReplaceAll]);
    str := StringReplace(str, '[货名]', FrmWeight1.CBGoods.Text, [rfReplaceAll]);
    str := StringReplace(str, '[规格]', FrmWeight1.CBSpec.Text, [rfReplaceAll]);
    str := StringReplace(str, '[毛重]', FrmWeight1.EdtGross.Text, [rfReplaceAll]);
    str := StringReplace(str, '[皮重]', FrmWeight1.EdtTare.Text, [rfReplaceAll]);
    str := StringReplace(str, '[净重]', FrmWeight1.EdtNet.Text, [rfReplaceAll]);
    str := StringReplace(str, '[重量]', FrmWeight1.getWeight, [rfReplaceAll]);
    SpVoice1.Speak(str, SVSFlagsAsync);
  except
  end;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if not QueryDataModule.ConnectFlag then
  begin
    Application.MessageBox('无法连接数据库,系统即将退出', '错误', MB_OK +
      MB_ICONSTOP + MB_TOPMOST);
    Application.Terminate;
  end;
  //增加磅单格式
  if not myini.ReadBool('system_set', 'add_print_form', False) then
  begin
    TCommonUtil.AddPaper('奥特威格式1', 10.1, 10.1);
    TCommonUtil.AddPaper('奥特威格式2', 10.1, 19.1);
    TCommonUtil.AddPaper('奥特威格式3', 21, 9.3);
    TCommonUtil.AddPaper('奥特威格式4', 24.1, 19.1);
    TCommonUtil.AddPaper('奥特威格式5', 12.1, 19.1);
    myini.WriteBool('system_set', 'add_print_form', True);
  end;
  //调整系统时间格式
  TCommonUtil.setTimeFormat();

  DBGridEh1.SumList.Active := MainForm.systemConfig.showSumList;
end;

procedure TMainForm.SMReportSysClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据查询') then
  begin
    Application.CreateForm(TReportSysForm, ReportSysForm);
    try
      ReportSysForm.ShowModal;
    finally
      ReportSysForm.Free;
    end;
  end
  else
    ShowMsg('对不起您没有数据查询权限，无法进行报表查询！')
end;

procedure TMainForm.cheat5Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := not systemConfig.cweightFlag5;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat6Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := not systemConfig.cweightFlag6;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat7Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := not systemConfig.cweightFlag7;
  systemConfig.cweightFlag8 := False;
  setExportWeightCheat();
end;

procedure TMainForm.cheat8Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
  systemConfig.cweightFlag5 := False;
  systemConfig.cweightFlag6 := False;
  systemConfig.cweightFlag7 := False;
  systemConfig.cweightFlag8 := not systemConfig.cweightFlag8;
  setExportWeightCheat();
end;

procedure TMainForm.SMCostSetClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('系统设置') then
  begin
    Application.CreateForm(TCostSetForm, CostSetForm);
    try
      CostSetForm.ShowModal;
    finally
      CostSetForm.Free;
    end
  end;
end;

procedure TMainForm.TAutoRefreshTimer(Sender: TObject);
begin
  if (not systemConfig.databaseInUse)
    and (StrToIntDef(FrmWeight1.getWeight, 0) < systemConfig.returnZero) then
  begin
    showGridRecord;
  end;
end;

procedure TMainForm.loadMenu;
var menuIni: TIniFile;
begin
  menuIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'menu.ini');
  try
    MSysOper.Caption := menuIni.ReadString('sys_oper', 'caption', '系统操作');
    MDataMaintain.Caption := menuIni.ReadString('data_maintain', 'caption', '数据维护');
    MSysMaintain.Caption := menuIni.ReadString('sys_maintain', 'caption', '系统维护');
    MAdditionalTool.Caption := menuIni.ReadString('additional_tool', 'caption', '附加工具');
    MHelp.Caption := menuIni.ReadString('help', 'caption', '帮助');

    SMChange.Caption := menuIni.ReadString('user_change', 'caption', '切换用户');
    SMPassword.Caption := menuIni.ReadString('change_password', 'caption', '更改密码');
    SMWeight.Caption := menuIni.ReadString('weight', 'caption', '称重操作');
    SMClose.Caption := menuIni.ReadString('close', 'caption', '关闭软件');
    SMTerminate.Caption := menuIni.ReadString('terminate', 'caption', '关闭计算机');

    SMUser.Caption := menuIni.ReadString('user', 'caption', '操作员维护');
    SMDataQuery.Caption := menuIni.ReadString('data_query', 'caption', '数据记录查询');
    SMPreMaintain.Caption := menuIni.ReadString('pre_maintain', 'caption', '预置信息查询');
    SMTaoQuery.Caption := menuIni.ReadString('tao_query', 'caption', '套表信息查询');
    SMSysLog.Caption := menuIni.ReadString('sys_log', 'caption', '系统日志查询');
    SMBackRecord.Caption := menuIni.ReadString('back_record', 'caption', '后台记录查询');
    SMInvalidQuery.Caption := menuIni.ReadString('invalid_query', 'caption', '作废记录查询');
    SMStorageInfo.Caption := menuIni.ReadString('storage_info', 'caption', '库存信息查询');
    SMChargeHistory.Caption := menuIni.ReadString('charge_history', 'caption', '充值历史查询');
    SMPriceQuery.Caption := menuIni.ReadString('price_query', 'caption', '客户价格查询');
    SMReportSys.Caption := menuIni.ReadString('report_sys', 'caption', '高级报表查询');
    SMTareTrend.Caption := menuIni.ReadString('tare_trend', 'caption', '皮重走势图');
    SMStaticTrend.Caption := menuIni.ReadString('static_trend', 'caption', '统计分析图');
    SMCharge.Caption := menuIni.ReadString('charge', 'caption', '收货单位充值');
    SMManualInput.Caption := menuIni.ReadString('manual_input', 'caption', '手工补单');
    SMScanTicket.Caption := menuIni.ReadString('scan_ticket', 'caption', '打描验证磅单');
    SMScanReport.Caption := menuIni.ReadString('scan_report', 'caption', '扫描打印报表');

    SMMeter.Caption := menuIni.ReadString('meter', 'caption', '仪表设置');
    SMMeter1.Caption := menuIni.ReadString('meter1', 'caption', '1#仪表设置');
    SMMeter2.Caption := menuIni.ReadString('meter2', 'caption', '2#仪表设置');
    SMDb.Caption := menuIni.ReadString('db', 'caption', '数据库');
    SMDBSet.Caption := menuIni.ReadString('db_set', 'caption', '数据库设置');
    SMDBBackup.Caption := menuIni.ReadString('db_backup', 'caption', '数据库备份');
    SMDBClear.Caption := menuIni.ReadString('db_clear', 'caption', '数据库清理');
    SMDBInit.Caption := menuIni.ReadString('db_init', 'caption', '数据库初始化');
    SMDBMigrate.Caption := menuIni.ReadString('db_migrate', 'caption', '数据库迁移');
    SMEquipment.Caption := menuIni.ReadString('equipment', 'caption', '外围设备');
    SMVideo.Caption := menuIni.ReadString('video', 'caption', '视频设置');
    SMScreen.Caption := menuIni.ReadString('screen', 'caption', '大屏幕设置');
    SMReadWeight.Caption := menuIni.ReadString('read_weight', 'caption', '语音播报');
    SMTicketSet.Caption := menuIni.ReadString('ticket_set', 'caption', '磅单格式设置');
    SMModify.Caption := menuIni.ReadString('modify', 'caption', '修改当前磅单');
    SMWeightSet.Caption := menuIni.ReadString('weight_set', 'caption', '称重界面配置');
    SMDesign.Caption := menuIni.ReadString('design', 'caption', '界面即时设置');
    SMSoftSet.Caption := menuIni.ReadString('soft_set', 'caption', '软件系统设置');
    SMCostSet.Caption := menuIni.ReadString('cost_set', 'caption', '过磅费设置');

    SMComputer.Caption := menuIni.ReadString('computer', 'caption', '计算器');
    SMSkin.Caption := menuIni.ReadString('skin', 'caption', '软件皮肤设置');
    SMMail.Caption := menuIni.ReadString('mail', 'caption', '定时邮件发送');
    SMSimulate.Caption := menuIni.ReadString('simulate', 'caption', '模拟称重');

    SMAbout.Caption := menuIni.ReadString('about', 'caption', '关于软件');
    SMHelp.Caption := menuIni.ReadString('use_help', 'caption', '使用帮助');

    //////////////////////////////////////////////////////////////////////////////////
    MSysOper.Visible := menuIni.ReadBool('sys_oper', 'visible', True);
    MDataMaintain.Visible := menuIni.ReadBool('data_maintain', 'visible', True);
    MSysMaintain.Visible := menuIni.ReadBool('sys_maintain', 'visible', True);
    MAdditionalTool.Visible := menuIni.ReadBool('additional_tool', 'visible', True);
    MHelp.Visible := menuIni.ReadBool('help', 'visible', True);

    SMChange.Visible := menuIni.ReadBool('user_change', 'visible', True);
    SMPassword.Visible := menuIni.ReadBool('change_password', 'visible', True);
    SMWeight.Visible := menuIni.ReadBool('weight', 'visible', True);
    SMClose.Visible := menuIni.ReadBool('close', 'visible', True);
    SMTerminate.Visible := menuIni.ReadBool('terminate', 'visible', True);

    SMUser.Visible := menuIni.ReadBool('user', 'visible', True);
    SMDataQuery.Visible := menuIni.ReadBool('data_query', 'visible', True);
    SMPreMaintain.Visible := menuIni.ReadBool('pre_maintain', 'visible', True);
    SMTaoQuery.Visible := menuIni.ReadBool('tao_query', 'visible', True);
    SMSysLog.Visible := menuIni.ReadBool('sys_log', 'visible', True);
    SMBackRecord.Visible := menuIni.ReadBool('back_record', 'visible', True);
    SMInvalidQuery.Visible := menuIni.ReadBool('invalid_query', 'visible', True);
    SMStorageInfo.Visible := menuIni.ReadBool('storage_info', 'visible', True);
    SMChargeHistory.Visible := menuIni.ReadBool('charge_history', 'visible', True);
    SMPriceQuery.Visible := menuIni.ReadBool('price_query', 'visible', True);
    SMReportSys.Visible := menuIni.ReadBool('report_sys', 'visible', True);
    SMTareTrend.Visible := menuIni.ReadBool('tare_trend', 'visible', True);
    SMStaticTrend.Visible := menuIni.ReadBool('static_trend', 'visible', True);
    SMCharge.Visible := menuIni.ReadBool('charge', 'visible', True);
    SMManualInput.Visible := menuIni.ReadBool('manual_input', 'visible', True);
    SMScanTicket.Visible := menuIni.ReadBool('scan_ticket', 'visible', False);
    SMScanReport.Visible := menuIni.ReadBool('scan_report', 'visible', False);

    SMMeter.Visible := menuIni.ReadBool('meter', 'visible', True);
    SMMeter1.Visible := menuIni.ReadBool('meter1', 'visible', True);
    SMMeter2.Visible := menuIni.ReadBool('meter2', 'visible', True);
    SMDb.Visible := menuIni.ReadBool('db', 'visible', True);
    SMDBSet.Visible := menuIni.ReadBool('db_set', 'visible', True);
    SMDBBackup.Visible := menuIni.ReadBool('db_backup', 'visible', True);
    SMDBClear.Visible := menuIni.ReadBool('db_clear', 'visible', True);
    SMDBInit.Visible := menuIni.ReadBool('db_init', 'visible', True);
    SMDBMigrate.Visible := menuIni.ReadBool('db_migrate', 'visible', True);
    SMEquipment.Visible := menuIni.ReadBool('equipment', 'visible', True);
    SMVideo.Visible := menuIni.ReadBool('video', 'visible', True);
    SMScreen.Visible := menuIni.ReadBool('screen', 'visible', True);
    SMReadWeight.Visible := menuIni.ReadBool('read_weight', 'visible', True);
    SMTicketSet.Visible := menuIni.ReadBool('ticket_set', 'visible', True);
    SMModify.Visible := menuIni.ReadBool('modify', 'visible', True);
    SMWeightSet.Visible := menuIni.ReadBool('weight_set', 'visible', True);
    SMDesign.Visible := menuIni.ReadBool('design', 'visible', True);
    SMSoftSet.Visible := menuIni.ReadBool('soft_set', 'visible', True);
    SMCostSet.Visible := menuIni.ReadBool('cost_set', 'visible', True);

    SMComputer.Visible := menuIni.ReadBool('computer', 'visible', True);
    SMSkin.Visible := menuIni.ReadBool('skin', 'visible', True);
    SMMail.Visible := menuIni.ReadBool('mail', 'visible', True);
    SMSimulate.Visible := menuIni.ReadBool('simulate', 'visible', True);

    SMAbout.Visible := menuIni.ReadBool('about', 'visible', True);
    SMHelp.Visible := menuIni.ReadBool('use_help', 'visible', True);
  finally
    menuIni.Free;
  end;
end;

procedure TMainForm.saveMenu;
var menuIni: TIniFile;
begin
  menuIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'menu.ini');
  try
    menuIni.WriteString('sys_oper', 'caption', MSysOper.Caption);
    menuIni.WriteString('data_maintain', 'caption', MDataMaintain.Caption);
    menuIni.WriteString('sys_maintain', 'caption', MSysMaintain.Caption);
    menuIni.WriteString('additional_tool', 'caption', MAdditionalTool.Caption);
    menuIni.WriteString('help', 'caption', MHelp.Caption);

    menuIni.WriteString('user_change', 'caption', SMChange.Caption);
    menuIni.WriteString('change_password', 'caption', SMPassword.Caption);
    menuIni.WriteString('weight', 'caption', SMWeight.Caption);
    menuIni.WriteString('close', 'caption', SMClose.Caption);
    menuIni.WriteString('terminate', 'caption', SMTerminate.Caption);

    menuIni.WriteString('user', 'caption', SMUser.Caption);
    menuIni.WriteString('data_query', 'caption', SMDataQuery.Caption);
    menuIni.WriteString('pre_maintain', 'caption', SMPreMaintain.Caption);
    menuIni.WriteString('tao_query', 'caption', SMTaoQuery.Caption);
    menuIni.WriteString('sys_log', 'caption', SMSysLog.Caption);
    menuIni.WriteString('back_record', 'caption', SMBackRecord.Caption);
    menuIni.WriteString('invalid_query', 'caption', SMInvalidQuery.Caption);
    menuIni.WriteString('storage_info', 'caption', SMStorageInfo.Caption);
    menuIni.WriteString('charge_history', 'caption', SMChargeHistory.Caption);
    menuIni.WriteString('price_query', 'caption', SMPriceQuery.Caption);
    menuIni.WriteString('report_sys', 'caption', SMReportSys.Caption);
    menuIni.WriteString('tare_trend', 'caption', SMTareTrend.Caption);
    menuIni.WriteString('static_trend', 'caption', SMStaticTrend.Caption);
    menuIni.WriteString('charge', 'caption', SMCharge.Caption);
    menuIni.WriteString('manual_input', 'caption', SMManualInput.Caption);
    menuIni.WriteString('scan_ticket', 'caption', SMScanTicket.Caption);
    menuIni.WriteString('scan_report', 'caption', SMScanReport.Caption);

    menuIni.WriteString('meter', 'caption', SMMeter.Caption);
    menuIni.WriteString('meter1', 'caption', SMMeter1.Caption);
    menuIni.WriteString('meter2', 'caption', SMMeter2.Caption);
    menuIni.WriteString('db', 'caption', SMDb.Caption);
    menuIni.WriteString('db_set', 'caption', SMDBSet.Caption);
    menuIni.WriteString('db_backup', 'caption', SMDBBackup.Caption);
    menuIni.WriteString('db_clear', 'caption', SMDBClear.Caption);
    menuIni.WriteString('db_init', 'caption', SMDBInit.Caption);
    menuIni.WriteString('db_migrate', 'caption', SMDBMigrate.Caption);
    menuIni.WriteString('equipment', 'caption', SMEquipment.Caption);
    menuIni.WriteString('video', 'caption', SMVideo.Caption);
    menuIni.WriteString('screen', 'caption', SMScreen.Caption);
    menuIni.WriteString('read_weight', 'caption', SMReadWeight.Caption);
    menuIni.WriteString('ticket_set', 'caption', SMTicketSet.Caption);
    menuIni.WriteString('modify', 'caption', SMModify.Caption);
    menuIni.WriteString('weight_set', 'caption', SMWeightSet.Caption);
    menuIni.WriteString('design', 'caption', SMDesign.Caption);
    menuIni.WriteString('soft_set', 'caption', SMSoftSet.Caption);
    menuIni.WriteString('cost_set', 'caption', SMCostSet.Caption);

    menuIni.WriteString('computer', 'caption', SMComputer.Caption);
    menuIni.WriteString('skin', 'caption', SMSkin.Caption);
    menuIni.WriteString('mail', 'caption', SMMail.Caption);
    menuIni.WriteString('simulate', 'caption', SMSimulate.Caption);

    menuIni.WriteString('about', 'caption', SMAbout.Caption);
    menuIni.WriteString('use_help', 'caption', SMHelp.Caption);

    //////////////////////////////////////////////////////////////////////////////////
    menuIni.WriteBool('sys_oper', 'visible', MSysOper.Visible);
    menuIni.WriteBool('data_maintain', 'visible', MDataMaintain.Visible);
    menuIni.WriteBool('sys_maintain', 'visible', MSysMaintain.Visible);
    menuIni.WriteBool('additional_tool', 'visible', MAdditionalTool.Visible);
    menuIni.WriteBool('help', 'visible', MHelp.Visible);

    menuIni.WriteBool('user_change', 'visible', SMChange.Visible);
    menuIni.WriteBool('change_password', 'visible', SMPassword.Visible);
    menuIni.WriteBool('weight', 'visible', SMWeight.Visible);
    menuIni.WriteBool('close', 'visible', SMClose.Visible);
    menuIni.WriteBool('terminate', 'visible', SMTerminate.Visible);

    menuIni.WriteBool('user', 'visible', SMUser.Visible);
    menuIni.WriteBool('data_query', 'visible', SMDataQuery.Visible);
    menuIni.WriteBool('pre_maintain', 'visible', SMPreMaintain.Visible);
    menuIni.WriteBool('tao_query', 'visible', SMTaoQuery.Visible);
    menuIni.WriteBool('sys_log', 'visible', SMSysLog.Visible);
    menuIni.WriteBool('back_record', 'visible', SMBackRecord.Visible);
    menuIni.WriteBool('invalid_query', 'visible', SMInvalidQuery.Visible);
    menuIni.WriteBool('storage_info', 'visible', SMStorageInfo.Visible);
    menuIni.WriteBool('charge_history', 'visible', SMChargeHistory.Visible);
    menuIni.WriteBool('price_query', 'visible', SMPriceQuery.Visible);
    menuIni.WriteBool('report_sys', 'visible', SMReportSys.Visible);
    menuIni.WriteBool('tare_trend', 'visible', SMTareTrend.Visible);
    menuIni.WriteBool('static_trend', 'visible', SMStaticTrend.Visible);
    menuIni.WriteBool('charge', 'visible', SMCharge.Visible);
    menuIni.WriteBool('manual_input', 'visible', SMManualInput.Visible);
    menuIni.WriteBool('scan_ticket', 'visible', SMScanTicket.Visible);
    menuIni.WriteBool('scan_report', 'visible', SMScanReport.Visible);

    menuIni.WriteBool('meter', 'visible', SMMeter.Visible);
    menuIni.WriteBool('meter1', 'visible', SMMeter1.Visible);
    menuIni.WriteBool('meter2', 'visible', SMMeter2.Visible);
    menuIni.WriteBool('db', 'visible', SMDb.Visible);
    menuIni.WriteBool('db_set', 'visible', SMDBSet.Visible);
    menuIni.WriteBool('db_backup', 'visible', SMDBBackup.Visible);
    menuIni.WriteBool('db_clear', 'visible', SMDBClear.Visible);
    menuIni.WriteBool('db_init', 'visible', SMDBInit.Visible);
    menuIni.WriteBool('db_migrate', 'visible', SMDBMigrate.Visible);
    menuIni.WriteBool('equipment', 'visible', SMEquipment.Visible);
    menuIni.WriteBool('video', 'visible', SMVideo.Visible);
    menuIni.WriteBool('screen', 'visible', SMScreen.Visible);
    menuIni.WriteBool('read_weight', 'visible', SMReadWeight.Visible);
    menuIni.WriteBool('ticket_set', 'visible', SMTicketSet.Visible);
    menuIni.WriteBool('modify', 'visible', SMModify.Visible);
    menuIni.WriteBool('weight_set', 'visible', SMWeightSet.Visible);
    menuIni.WriteBool('design', 'visible', SMDesign.Visible);
    menuIni.WriteBool('soft_set', 'visible', SMSoftSet.Visible);
    menuIni.WriteBool('cost_set', 'visible', SMCostSet.Visible);

    menuIni.WriteBool('computer', 'visible', SMComputer.Visible);
    menuIni.WriteBool('skin', 'visible', SMSkin.Visible);
    menuIni.WriteBool('mail', 'visible', SMMail.Visible);
    menuIni.WriteBool('simulate', 'visible', SMSimulate.Visible);

    menuIni.WriteBool('about', 'visible', SMAbout.Visible);
    menuIni.WriteBool('use_help', 'visible', SMHelp.Visible);
  finally
    menuIni.Free;
  end;
end;

procedure TMainForm.DBGridEh1CellClick(Column: TColumnEh);
begin
  TWeightUtil.showWeightPic(
    DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString);
end;

procedure TMainForm.loadDBGrid(dg: TDBGridEh);
begin

  dg.FieldColumns['序号'].Visible := poWeightSetConfig.noVisible;
  dg.FieldColumns['流水号'].Visible := poWeightSetConfig.glideNoVisible;
  dg.FieldColumns['车号'].Visible := poWeightSetConfig.carVisible;
  dg.FieldColumns['过磅类型'].Visible := poWeightSetConfig.weightTypeVisible;
  dg.FieldColumns['发货单位'].Visible := poWeightSetConfig.faHuoVisible;
  dg.FieldColumns['收货单位'].Visible := poWeightSetConfig.shouHuoVisible;
  dg.FieldColumns['货名'].Visible := poWeightSetConfig.goodsVisible;
  dg.FieldColumns['规格'].Visible := poWeightSetConfig.specVisible;
  dg.FieldColumns['毛重'].Visible := poWeightSetConfig.grossVisible;
  dg.FieldColumns['皮重'].Visible := poWeightSetConfig.tareVisible;
  dg.FieldColumns['净重'].Visible := poWeightSetConfig.netVisible;
  dg.FieldColumns['扣重'].Visible := poWeightSetConfig.bundleVisible;
  dg.FieldColumns['实重'].Visible := poWeightSetConfig.realVisible;
  dg.FieldColumns['单价'].Visible := poWeightSetConfig.priceVisible;
  dg.FieldColumns['金额'].Visible := poWeightSetConfig.sumVisible;
  dg.FieldColumns['折方系数'].Visible := poWeightSetConfig.scaleVisible;
  dg.FieldColumns['方量'].Visible := poWeightSetConfig.quanterVisible;
  dg.FieldColumns['过磅费'].Visible := poWeightSetConfig.costVisible;
  dg.FieldColumns['毛重司磅员'].Visible := poWeightSetConfig.grossManVisible;
  dg.FieldColumns['皮重司磅员'].Visible := poWeightSetConfig.tareManVisible;
  dg.FieldColumns['毛重磅号'].Visible := poWeightSetConfig.grossAddrVisible;
  dg.FieldColumns['皮重磅号'].Visible := poWeightSetConfig.tareAddrVisible;
  dg.FieldColumns['毛重时间'].Visible := poWeightSetConfig.grossTimeVisible;
  dg.FieldColumns['皮重时间'].Visible := poWeightSetConfig.tareTimeVisible;
  dg.FieldColumns['一次过磅时间'].Visible := poWeightSetConfig.firstTimeVisible;
  dg.FieldColumns['二次过磅时间'].Visible := poWeightSetConfig.secondTimeVisible;
  dg.FieldColumns['更新人'].Visible := poWeightSetConfig.updateUserVisible;
  dg.FieldColumns['更新时间'].Visible := poWeightSetConfig.updateTimeVisible;
  dg.FieldColumns['备注'].Visible := poWeightSetConfig.memoVisible;
  dg.FieldColumns['打印次数'].Visible := poWeightSetConfig.printCountVisible;
  dg.FieldColumns['上传否'].Visible := poWeightSetConfig.uploadVisible;
  dg.FieldColumns['备用1'].Visible := poWeightSetConfig.backup1Visible;
  dg.FieldColumns['备用2'].Visible := poWeightSetConfig.backup2Visible;
  dg.FieldColumns['备用3'].Visible := poWeightSetConfig.backup3Visible;
  dg.FieldColumns['备用4'].Visible := poWeightSetConfig.backup4Visible;
  dg.FieldColumns['备用5'].Visible := poWeightSetConfig.backup5Visible;
  dg.FieldColumns['备用6'].Visible := poWeightSetConfig.backup6Visible;
  dg.FieldColumns['备用7'].Visible := poWeightSetConfig.backup7Visible;
  dg.FieldColumns['备用8'].Visible := poWeightSetConfig.backup8Visible;
  dg.FieldColumns['备用9'].Visible := poWeightSetConfig.backup9Visible;
  dg.FieldColumns['备用10'].Visible := poWeightSetConfig.backup10Visible;
  dg.FieldColumns['备用11'].Visible := poWeightSetConfig.backup11Visible;
  dg.FieldColumns['备用12'].Visible := poWeightSetConfig.backup12Visible;
  dg.FieldColumns['备用13'].Visible := poWeightSetConfig.backup13Visible;
  dg.FieldColumns['备用14'].Visible := poWeightSetConfig.backup14Visible;
  dg.FieldColumns['备用15'].Visible := poWeightSetConfig.backup15Visible;
  dg.FieldColumns['备用16'].Visible := poWeightSetConfig.backup16Visible;
  dg.FieldColumns['备用17'].Visible := poWeightSetConfig.backup17Visible;
  dg.FieldColumns['备用18'].Visible := poWeightSetConfig.backup18Visible;

  dg.FieldColumns['序号'].Title.Caption := poWeightSetConfig.noCaption;
  dg.FieldColumns['流水号'].Title.Caption := poWeightSetConfig.glideNoCaption;
  dg.FieldColumns['车号'].Title.Caption := poWeightSetConfig.carCaption;
  dg.FieldColumns['过磅类型'].Title.Caption := poWeightSetConfig.weightTypeCaption;
  dg.FieldColumns['发货单位'].Title.Caption := poWeightSetConfig.faHuoCaption;
  dg.FieldColumns['收货单位'].Title.Caption := poWeightSetConfig.shouHuoCaption;
  dg.FieldColumns['货名'].Title.Caption := poWeightSetConfig.goodsCaption;
  dg.FieldColumns['规格'].Title.Caption := poWeightSetConfig.specCaption;
  dg.FieldColumns['毛重'].Title.Caption := poWeightSetConfig.grossCaption;
  dg.FieldColumns['皮重'].Title.Caption := poWeightSetConfig.tareCaption;
  dg.FieldColumns['净重'].Title.Caption := poWeightSetConfig.netCaption;
  dg.FieldColumns['扣重'].Title.Caption := poWeightSetConfig.bundleCaption;
  dg.FieldColumns['实重'].Title.Caption := poWeightSetConfig.realCaption;
  dg.FieldColumns['单价'].Title.Caption := poWeightSetConfig.priceCaption;
  dg.FieldColumns['金额'].Title.Caption := poWeightSetConfig.sumCaption;
  dg.FieldColumns['折方系数'].Title.Caption := poWeightSetConfig.scaleCaption;
  dg.FieldColumns['方量'].Title.Caption := poWeightSetConfig.quanterCaption;
  dg.FieldColumns['过磅费'].Title.Caption := poWeightSetConfig.costCaption;
  dg.FieldColumns['毛重司磅员'].Title.Caption := poWeightSetConfig.grossManCaption;
  dg.FieldColumns['皮重司磅员'].Title.Caption := poWeightSetConfig.tareManCaption;
  dg.FieldColumns['毛重磅号'].Title.Caption := poWeightSetConfig.grossAddrCaption;
  dg.FieldColumns['皮重磅号'].Title.Caption := poWeightSetConfig.tareAddrCaption;
  dg.FieldColumns['毛重时间'].Title.Caption := poWeightSetConfig.grossTimeCaption;
  dg.FieldColumns['皮重时间'].Title.Caption := poWeightSetConfig.tareTimeCaption;
  dg.FieldColumns['一次过磅时间'].Title.Caption := poWeightSetConfig.firstTimeCaption;
  dg.FieldColumns['二次过磅时间'].Title.Caption := poWeightSetConfig.secondTimeCaption;
  dg.FieldColumns['更新人'].Title.Caption := poWeightSetConfig.updateUserCaption;
  dg.FieldColumns['更新时间'].Title.Caption := poWeightSetConfig.updateTimeCaption;
  dg.FieldColumns['备注'].Title.Caption := poWeightSetConfig.memoCaption;
  dg.FieldColumns['打印次数'].Title.Caption := poWeightSetConfig.printCountCaption;
  dg.FieldColumns['上传否'].Title.Caption := poWeightSetConfig.uploadCaption;
  dg.FieldColumns['备用1'].Title.Caption := poWeightSetConfig.backup1Caption;
  dg.FieldColumns['备用2'].Title.Caption := poWeightSetConfig.backup2Caption;
  dg.FieldColumns['备用3'].Title.Caption := poWeightSetConfig.backup3Caption;
  dg.FieldColumns['备用4'].Title.Caption := poWeightSetConfig.backup4Caption;
  dg.FieldColumns['备用5'].Title.Caption := poWeightSetConfig.backup5Caption;
  dg.FieldColumns['备用6'].Title.Caption := poWeightSetConfig.backup6Caption;
  dg.FieldColumns['备用7'].Title.Caption := poWeightSetConfig.backup7Caption;
  dg.FieldColumns['备用8'].Title.Caption := poWeightSetConfig.backup8Caption;
  dg.FieldColumns['备用9'].Title.Caption := poWeightSetConfig.backup9Caption;
  dg.FieldColumns['备用10'].Title.Caption := poWeightSetConfig.backup10Caption;
  dg.FieldColumns['备用11'].Title.Caption := poWeightSetConfig.backup11Caption;
  dg.FieldColumns['备用12'].Title.Caption := poWeightSetConfig.backup12Caption;
  dg.FieldColumns['备用13'].Title.Caption := poWeightSetConfig.backup13Caption;
  dg.FieldColumns['备用14'].Title.Caption := poWeightSetConfig.backup14Caption;
  dg.FieldColumns['备用15'].Title.Caption := poWeightSetConfig.backup15Caption;
  dg.FieldColumns['备用16'].Title.Caption := poWeightSetConfig.backup16Caption;
  dg.FieldColumns['备用17'].Title.Caption := poWeightSetConfig.backup17Caption;
  dg.FieldColumns['备用18'].Title.Caption := poWeightSetConfig.backup18Caption;

  dg.FieldColumns['序号'].Index := poWeightSetConfig.noIndex;
  dg.FieldColumns['流水号'].Index := poWeightSetConfig.glideNoIndex;
  dg.FieldColumns['车号'].Index := poWeightSetConfig.carIndex;
  dg.FieldColumns['过磅类型'].Index := poWeightSetConfig.weightTypeIndex;
  dg.FieldColumns['发货单位'].Index := poWeightSetConfig.faHuoIndex;
  dg.FieldColumns['收货单位'].Index := poWeightSetConfig.shouHuoIndex;
  dg.FieldColumns['货名'].Index := poWeightSetConfig.goodsIndex;
  dg.FieldColumns['规格'].Index := poWeightSetConfig.specIndex;
  dg.FieldColumns['毛重'].Index := poWeightSetConfig.grossIndex;
  dg.FieldColumns['皮重'].Index := poWeightSetConfig.tareIndex;
  dg.FieldColumns['净重'].Index := poWeightSetConfig.netIndex;
  dg.FieldColumns['扣重'].Index := poWeightSetConfig.bundleIndex;
  dg.FieldColumns['实重'].Index := poWeightSetConfig.realIndex;
  dg.FieldColumns['单价'].Index := poWeightSetConfig.priceIndex;
  dg.FieldColumns['金额'].Index := poWeightSetConfig.sumIndex;
  dg.FieldColumns['折方系数'].Index := poWeightSetConfig.scaleIndex;
  dg.FieldColumns['方量'].Index := poWeightSetConfig.quanterIndex;
  dg.FieldColumns['过磅费'].Index := poWeightSetConfig.costIndex;
  dg.FieldColumns['毛重司磅员'].Index := poWeightSetConfig.grossManIndex;
  dg.FieldColumns['皮重司磅员'].Index := poWeightSetConfig.tareManIndex;
  dg.FieldColumns['毛重磅号'].Index := poWeightSetConfig.grossAddrIndex;
  dg.FieldColumns['皮重磅号'].Index := poWeightSetConfig.tareAddrIndex;
  dg.FieldColumns['毛重时间'].Index := poWeightSetConfig.grossTimeIndex;
  dg.FieldColumns['皮重时间'].Index := poWeightSetConfig.tareTimeIndex;
  dg.FieldColumns['一次过磅时间'].Index := poWeightSetConfig.firstTimeIndex;
  dg.FieldColumns['二次过磅时间'].Index := poWeightSetConfig.secondTimeIndex;
  dg.FieldColumns['更新人'].Index := poWeightSetConfig.updateUserIndex;
  dg.FieldColumns['更新时间'].Index := poWeightSetConfig.updateTimeIndex;
  dg.FieldColumns['备注'].Index := poWeightSetConfig.memoIndex;
  dg.FieldColumns['打印次数'].Index := poWeightSetConfig.printCountIndex;
  dg.FieldColumns['上传否'].Index := poWeightSetConfig.uploadIndex;
  dg.FieldColumns['备用1'].Index := poWeightSetConfig.backup1Index;
  dg.FieldColumns['备用2'].Index := poWeightSetConfig.backup2Index;
  dg.FieldColumns['备用3'].Index := poWeightSetConfig.backup3Index;
  dg.FieldColumns['备用4'].Index := poWeightSetConfig.backup4Index;
  dg.FieldColumns['备用5'].Index := poWeightSetConfig.backup5Index;
  dg.FieldColumns['备用6'].Index := poWeightSetConfig.backup6Index;
  dg.FieldColumns['备用7'].Index := poWeightSetConfig.backup7Index;
  dg.FieldColumns['备用8'].Index := poWeightSetConfig.backup8Index;
  dg.FieldColumns['备用9'].Index := poWeightSetConfig.backup9Index;
  dg.FieldColumns['备用10'].Index := poWeightSetConfig.backup10Index;
  dg.FieldColumns['备用11'].Index := poWeightSetConfig.backup11Index;
  dg.FieldColumns['备用12'].Index := poWeightSetConfig.backup12Index;
  dg.FieldColumns['备用13'].Index := poWeightSetConfig.backup13Index;
  dg.FieldColumns['备用14'].Index := poWeightSetConfig.backup14Index;
  dg.FieldColumns['备用15'].Index := poWeightSetConfig.backup15Index;
  dg.FieldColumns['备用16'].Index := poWeightSetConfig.backup16Index;
  dg.FieldColumns['备用17'].Index := poWeightSetConfig.backup17Index;
  dg.FieldColumns['备用18'].Index := poWeightSetConfig.backup18Index;

  dg.FieldColumns['序号'].Width := poWeightSetConfig.noWidth;
  dg.FieldColumns['流水号'].Width := poWeightSetConfig.glideNoWidth;
  dg.FieldColumns['车号'].Width := poWeightSetConfig.carWidth;
  dg.FieldColumns['过磅类型'].Width := poWeightSetConfig.weightTypeWidth;
  dg.FieldColumns['发货单位'].Width := poWeightSetConfig.faHuoWidth;
  dg.FieldColumns['收货单位'].Width := poWeightSetConfig.shouHuoWidth;
  dg.FieldColumns['货名'].Width := poWeightSetConfig.goodsWidth;
  dg.FieldColumns['规格'].Width := poWeightSetConfig.specWidth;
  dg.FieldColumns['毛重'].Width := poWeightSetConfig.grossWidth;
  dg.FieldColumns['皮重'].Width := poWeightSetConfig.tareWidth;
  dg.FieldColumns['净重'].Width := poWeightSetConfig.netWidth;
  dg.FieldColumns['扣重'].Width := poWeightSetConfig.bundleWidth;
  dg.FieldColumns['实重'].Width := poWeightSetConfig.realWidth;
  dg.FieldColumns['单价'].Width := poWeightSetConfig.priceWidth;
  dg.FieldColumns['金额'].Width := poWeightSetConfig.sumWidth;
  dg.FieldColumns['折方系数'].Width := poWeightSetConfig.scaleWidth;
  dg.FieldColumns['方量'].Width := poWeightSetConfig.quanterWidth;
  dg.FieldColumns['过磅费'].Width := poWeightSetConfig.costWidth;
  dg.FieldColumns['毛重司磅员'].Width := poWeightSetConfig.grossManWidth;
  dg.FieldColumns['皮重司磅员'].Width := poWeightSetConfig.tareManWidth;
  dg.FieldColumns['毛重磅号'].Width := poWeightSetConfig.grossAddrWidth;
  dg.FieldColumns['皮重磅号'].Width := poWeightSetConfig.tareAddrWidth;
  dg.FieldColumns['毛重时间'].Width := poWeightSetConfig.grossTimeWidth;
  dg.FieldColumns['皮重时间'].Width := poWeightSetConfig.tareTimeWidth;
  dg.FieldColumns['一次过磅时间'].Width := poWeightSetConfig.firstTimeWidth;
  dg.FieldColumns['二次过磅时间'].Width := poWeightSetConfig.secondTimeWidth;
  dg.FieldColumns['更新人'].Width := poWeightSetConfig.updateUserWidth;
  dg.FieldColumns['更新时间'].Width := poWeightSetConfig.updateTimeWidth;
  dg.FieldColumns['备注'].Width := poWeightSetConfig.memoWidth;
  dg.FieldColumns['打印次数'].Width := poWeightSetConfig.printCountWidth;
  dg.FieldColumns['上传否'].Width := poWeightSetConfig.uploadWidth;
  dg.FieldColumns['备用1'].Width := poWeightSetConfig.backup1Width;
  dg.FieldColumns['备用2'].Width := poWeightSetConfig.backup2Width;
  dg.FieldColumns['备用3'].Width := poWeightSetConfig.backup3Width;
  dg.FieldColumns['备用4'].Width := poWeightSetConfig.backup4Width;
  dg.FieldColumns['备用5'].Width := poWeightSetConfig.backup5Width;
  dg.FieldColumns['备用6'].Width := poWeightSetConfig.backup6Width;
  dg.FieldColumns['备用7'].Width := poWeightSetConfig.backup7Width;
  dg.FieldColumns['备用8'].Width := poWeightSetConfig.backup8Width;
  dg.FieldColumns['备用9'].Width := poWeightSetConfig.backup9Width;
  dg.FieldColumns['备用10'].Width := poWeightSetConfig.backup10Width;
  dg.FieldColumns['备用11'].Width := poWeightSetConfig.backup11Width;
  dg.FieldColumns['备用12'].Width := poWeightSetConfig.backup12Width;
  dg.FieldColumns['备用13'].Width := poWeightSetConfig.backup13Width;
  dg.FieldColumns['备用14'].Width := poWeightSetConfig.backup14Width;
  dg.FieldColumns['备用15'].Width := poWeightSetConfig.backup15Width;
  dg.FieldColumns['备用16'].Width := poWeightSetConfig.backup16Width;
  dg.FieldColumns['备用17'].Width := poWeightSetConfig.backup17Width;
  dg.FieldColumns['备用18'].Width := poWeightSetConfig.backup18Width;
end;

procedure TMainForm.saveDBGrid(dg: TDBGridEh);
var myini: TiniFile;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\design.ini');
  try
    myini.WriteBool('formDesign', 'no', dg.FieldColumns['序号'].Visible);
    myini.WriteBool('formDesign', 'glideNo', dg.FieldColumns['流水号'].Visible);
    myini.WriteBool('formDesign', 'car', dg.FieldColumns['车号'].Visible);
    myini.WriteBool('formDesign', 'weightType', dg.FieldColumns['过磅类型'].Visible);
    myini.WriteBool('formDesign', 'faHuo', dg.FieldColumns['发货单位'].Visible);
    myini.WriteBool('formDesign', 'shouHuo', dg.FieldColumns['收货单位'].Visible);
    myini.WriteBool('formDesign', 'goods', dg.FieldColumns['货名'].Visible);
    myini.WriteBool('formDesign', 'spec', dg.FieldColumns['规格'].Visible);
    myini.WriteBool('formDesign', 'gross', dg.FieldColumns['毛重'].Visible);
    myini.WriteBool('formDesign', 'tare', dg.FieldColumns['皮重'].Visible);
    myini.WriteBool('formDesign', 'net', dg.FieldColumns['净重'].Visible);
    myini.WriteBool('formDesign', 'bundle', dg.FieldColumns['扣重'].Visible);
    myini.WriteBool('formDesign', 'real', dg.FieldColumns['实重'].Visible);
    myini.WriteBool('formDesign', 'price', dg.FieldColumns['单价'].Visible);
    myini.WriteBool('formDesign', 'sum', dg.FieldColumns['金额'].Visible);
    myini.WriteBool('formDesign', 'scale', dg.FieldColumns['折方系数'].Visible);
    myini.WriteBool('formDesign', 'quanter', dg.FieldColumns['方量'].Visible);
    myini.WriteBool('formDesign', 'cost', dg.FieldColumns['过磅费'].Visible);
    myini.WriteBool('formDesign', 'grossMan', dg.FieldColumns['毛重司磅员'].Visible);
    myini.WriteBool('formDesign', 'tareMan', dg.FieldColumns['皮重司磅员'].Visible);
    myini.WriteBool('formDesign', 'grossAddr', dg.FieldColumns['毛重磅号'].Visible);
    myini.WriteBool('formDesign', 'tareAddr', dg.FieldColumns['皮重磅号'].Visible);
    myini.WriteBool('formDesign', 'grossTime', dg.FieldColumns['毛重时间'].Visible);
    myini.WriteBool('formDesign', 'tareTime', dg.FieldColumns['皮重时间'].Visible);
    myini.WriteBool('formDesign', 'firstTime', dg.FieldColumns['一次过磅时间'].Visible);
    myini.WriteBool('formDesign', 'secondTime', dg.FieldColumns['二次过磅时间'].Visible);
    myini.WriteBool('formDesign', 'updateUser', dg.FieldColumns['更新人'].Visible);
    myini.WriteBool('formDesign', 'updateTime', dg.FieldColumns['更新时间'].Visible);
    myini.WriteBool('formDesign', 'remark', dg.FieldColumns['备注'].Visible);
    myini.WriteBool('formDesign', 'printCount', dg.FieldColumns['打印次数'].Visible);
    myini.WriteBool('formDesign', 'upload', dg.FieldColumns['上传否'].Visible);
    myini.WriteBool('formDesign', 'backup1', dg.FieldColumns['备用1'].Visible);
    myini.WriteBool('formDesign', 'backup2', dg.FieldColumns['备用2'].Visible);
    myini.WriteBool('formDesign', 'backup3', dg.FieldColumns['备用3'].Visible);
    myini.WriteBool('formDesign', 'backup4', dg.FieldColumns['备用4'].Visible);
    myini.WriteBool('formDesign', 'backup5', dg.FieldColumns['备用5'].Visible);
    myini.WriteBool('formDesign', 'backup6', dg.FieldColumns['备用6'].Visible);
    myini.WriteBool('formDesign', 'backup7', dg.FieldColumns['备用7'].Visible);
    myini.WriteBool('formDesign', 'backup8', dg.FieldColumns['备用8'].Visible);
    myini.WriteBool('formDesign', 'backup9', dg.FieldColumns['备用9'].Visible);
    myini.WriteBool('formDesign', 'backup10', dg.FieldColumns['备用10'].Visible);
    myini.WriteBool('formDesign', 'backup11', dg.FieldColumns['备用11'].Visible);
    myini.WriteBool('formDesign', 'backup12', dg.FieldColumns['备用12'].Visible);
    myini.WriteBool('formDesign', 'backup13', dg.FieldColumns['备用13'].Visible);
    myini.WriteBool('formDesign', 'backup14', dg.FieldColumns['备用14'].Visible);
    myini.WriteBool('formDesign', 'backup15', dg.FieldColumns['备用15'].Visible);
    myini.WriteBool('formDesign', 'backup16', dg.FieldColumns['备用16'].Visible);
    myini.WriteBool('formDesign', 'backup17', dg.FieldColumns['备用17'].Visible);
    myini.WriteBool('formDesign', 'backup18', dg.FieldColumns['备用18'].Visible);

    myini.WriteString('formDesign', 'noCaption', dg.FieldColumns['序号'].Title.Caption);
    myini.WriteString('formDesign', 'glideNoCaption', dg.FieldColumns['流水号'].Title.Caption);
    myini.WriteString('formDesign', 'carCaption', dg.FieldColumns['车号'].Title.Caption);
    myini.WriteString('formDesign', 'weightTypeCaption', dg.FieldColumns['过磅类型'].Title.Caption);
    myini.WriteString('formDesign', 'faHuoCaption', dg.FieldColumns['发货单位'].Title.Caption);
    myini.WriteString('formDesign', 'shouHuoCaption', dg.FieldColumns['收货单位'].Title.Caption);
    myini.WriteString('formDesign', 'goodsCaption', dg.FieldColumns['货名'].Title.Caption);
    myini.WriteString('formDesign', 'specCaption', dg.FieldColumns['规格'].Title.Caption);
    myini.WriteString('formDesign', 'grossCaption', dg.FieldColumns['毛重'].Title.Caption);
    myini.WriteString('formDesign', 'tareCaption', dg.FieldColumns['皮重'].Title.Caption);
    myini.WriteString('formDesign', 'netCaption', dg.FieldColumns['净重'].Title.Caption);
    myini.WriteString('formDesign', 'bundleCaption', dg.FieldColumns['扣重'].Title.Caption);
    myini.WriteString('formDesign', 'realCaption', dg.FieldColumns['实重'].Title.Caption);
    myini.WriteString('formDesign', 'priceCaption', dg.FieldColumns['单价'].Title.Caption);
    myini.WriteString('formDesign', 'sumCaption', dg.FieldColumns['金额'].Title.Caption);
    myini.WriteString('formDesign', 'scaleCaption', dg.FieldColumns['折方系数'].Title.Caption);
    myini.WriteString('formDesign', 'quanterCaption', dg.FieldColumns['方量'].Title.Caption);
    myini.WriteString('formDesign', 'costCaption', dg.FieldColumns['过磅费'].Title.Caption);
    myini.WriteString('formDesign', 'grossManCaption', dg.FieldColumns['毛重司磅员'].Title.Caption);
    myini.WriteString('formDesign', 'tareManCaption', dg.FieldColumns['皮重司磅员'].Title.Caption);
    myini.WriteString('formDesign', 'grossAddrCaption', dg.FieldColumns['毛重磅号'].Title.Caption);
    myini.WriteString('formDesign', 'tareAddrCaption', dg.FieldColumns['皮重磅号'].Title.Caption);
    myini.WriteString('formDesign', 'grossTimeCaption', dg.FieldColumns['毛重时间'].Title.Caption);
    myini.WriteString('formDesign', 'tareTimeCaption', dg.FieldColumns['皮重时间'].Title.Caption);
    myini.WriteString('formDesign', 'firstTimeCaption', dg.FieldColumns['一次过磅时间'].Title.Caption);
    myini.WriteString('formDesign', 'secondTimeCaption', dg.FieldColumns['二次过磅时间'].Title.Caption);
    myini.WriteString('formDesign', 'updateUserCaption', dg.FieldColumns['更新人'].Title.Caption);
    myini.WriteString('formDesign', 'updateTimeCaption', dg.FieldColumns['更新时间'].Title.Caption);
    myini.WriteString('formDesign', 'remarkCaption', dg.FieldColumns['备注'].Title.Caption);
    myini.WriteString('formDesign', 'printCountCaption', dg.FieldColumns['打印次数'].Title.Caption);
    myini.WriteString('formDesign', 'uploadCaption', dg.FieldColumns['上传否'].Title.Caption);
    myini.WriteString('formDesign', 'backup1Caption', dg.FieldColumns['备用1'].Title.Caption);
    myini.WriteString('formDesign', 'backup2Caption', dg.FieldColumns['备用2'].Title.Caption);
    myini.WriteString('formDesign', 'backup3Caption', dg.FieldColumns['备用3'].Title.Caption);
    myini.WriteString('formDesign', 'backup4Caption', dg.FieldColumns['备用4'].Title.Caption);
    myini.WriteString('formDesign', 'backup5Caption', dg.FieldColumns['备用5'].Title.Caption);
    myini.WriteString('formDesign', 'backup6Caption', dg.FieldColumns['备用6'].Title.Caption);
    myini.WriteString('formDesign', 'backup7Caption', dg.FieldColumns['备用7'].Title.Caption);
    myini.WriteString('formDesign', 'backup8Caption', dg.FieldColumns['备用8'].Title.Caption);
    myini.WriteString('formDesign', 'backup9Caption', dg.FieldColumns['备用9'].Title.Caption);
    myini.WriteString('formDesign', 'backup10Caption', dg.FieldColumns['备用10'].Title.Caption);
    myini.WriteString('formDesign', 'backup11Caption', dg.FieldColumns['备用11'].Title.Caption);
    myini.WriteString('formDesign', 'backup12Caption', dg.FieldColumns['备用12'].Title.Caption);
    myini.WriteString('formDesign', 'backup13Caption', dg.FieldColumns['备用13'].Title.Caption);
    myini.WriteString('formDesign', 'backup14Caption', dg.FieldColumns['备用14'].Title.Caption);
    myini.WriteString('formDesign', 'backup15Caption', dg.FieldColumns['备用15'].Title.Caption);
    myini.WriteString('formDesign', 'backup16Caption', dg.FieldColumns['备用16'].Title.Caption);
    myini.WriteString('formDesign', 'backup17Caption', dg.FieldColumns['备用17'].Title.Caption);
    myini.WriteString('formDesign', 'backup18Caption', dg.FieldColumns['备用18'].Title.Caption);

    myini.WriteInteger('formDesign', 'noIndex', dg.FieldColumns['序号'].Index);
    myini.WriteInteger('formDesign', 'glideNoIndex', dg.FieldColumns['流水号'].Index);
    myini.WriteInteger('formDesign', 'carIndex', dg.FieldColumns['车号'].Index);
    myini.WriteInteger('formDesign', 'weightTypeIndex', dg.FieldColumns['过磅类型'].Index);
    myini.WriteInteger('formDesign', 'faHuoIndex', dg.FieldColumns['发货单位'].Index);
    myini.WriteInteger('formDesign', 'shouHuoIndex', dg.FieldColumns['收货单位'].Index);
    myini.WriteInteger('formDesign', 'goodsIndex', dg.FieldColumns['货名'].Index);
    myini.WriteInteger('formDesign', 'specIndex', dg.FieldColumns['规格'].Index);
    myini.WriteInteger('formDesign', 'grossIndex', dg.FieldColumns['毛重'].Index);
    myini.WriteInteger('formDesign', 'tareIndex', dg.FieldColumns['皮重'].Index);
    myini.WriteInteger('formDesign', 'netIndex', dg.FieldColumns['净重'].Index);
    myini.WriteInteger('formDesign', 'bundleIndex', dg.FieldColumns['扣重'].Index);
    myini.WriteInteger('formDesign', 'realIndex', dg.FieldColumns['实重'].Index);
    myini.WriteInteger('formDesign', 'priceIndex', dg.FieldColumns['单价'].Index);
    myini.WriteInteger('formDesign', 'sumIndex', dg.FieldColumns['金额'].Index);
    myini.WriteInteger('formDesign', 'scaleIndex', dg.FieldColumns['折方系数'].Index);
    myini.WriteInteger('formDesign', 'quanterIndex', dg.FieldColumns['方量'].Index);
    myini.WriteInteger('formDesign', 'costIndex', dg.FieldColumns['过磅费'].Index);
    myini.WriteInteger('formDesign', 'grossManIndex', dg.FieldColumns['毛重司磅员'].Index);
    myini.WriteInteger('formDesign', 'tareManIndex', dg.FieldColumns['皮重司磅员'].Index);
    myini.WriteInteger('formDesign', 'grossAddrIndex', dg.FieldColumns['毛重磅号'].Index);
    myini.WriteInteger('formDesign', 'tareAddrIndex', dg.FieldColumns['皮重磅号'].Index);
    myini.WriteInteger('formDesign', 'grossTimeIndex', dg.FieldColumns['毛重时间'].Index);
    myini.WriteInteger('formDesign', 'tareTimeIndex', dg.FieldColumns['皮重时间'].Index);
    myini.WriteInteger('formDesign', 'firstTimeIndex', dg.FieldColumns['一次过磅时间'].Index);
    myini.WriteInteger('formDesign', 'secondTimeIndex', dg.FieldColumns['二次过磅时间'].Index);
    myini.WriteInteger('formDesign', 'updateUserIndex', dg.FieldColumns['更新人'].Index);
    myini.WriteInteger('formDesign', 'updateTimeIndex', dg.FieldColumns['更新时间'].Index);
    myini.WriteInteger('formDesign', 'remarkIndex', dg.FieldColumns['备注'].Index);
    myini.WriteInteger('formDesign', 'printCountIndex', dg.FieldColumns['打印次数'].Index);
    myini.WriteInteger('formDesign', 'uploadIndex', dg.FieldColumns['上传否'].Index);
    myini.WriteInteger('formDesign', 'backup1Index', dg.FieldColumns['备用1'].Index);
    myini.WriteInteger('formDesign', 'backup2Index', dg.FieldColumns['备用2'].Index);
    myini.WriteInteger('formDesign', 'backup3Index', dg.FieldColumns['备用3'].Index);
    myini.WriteInteger('formDesign', 'backup4Index', dg.FieldColumns['备用4'].Index);
    myini.WriteInteger('formDesign', 'backup5Index', dg.FieldColumns['备用5'].Index);
    myini.WriteInteger('formDesign', 'backup6Index', dg.FieldColumns['备用6'].Index);
    myini.WriteInteger('formDesign', 'backup7Index', dg.FieldColumns['备用7'].Index);
    myini.WriteInteger('formDesign', 'backup8Index', dg.FieldColumns['备用8'].Index);
    myini.WriteInteger('formDesign', 'backup9Index', dg.FieldColumns['备用9'].Index);
    myini.WriteInteger('formDesign', 'backup10Index', dg.FieldColumns['备用10'].Index);
    myini.WriteInteger('formDesign', 'backup11Index', dg.FieldColumns['备用11'].Index);
    myini.WriteInteger('formDesign', 'backup12Index', dg.FieldColumns['备用12'].Index);
    myini.WriteInteger('formDesign', 'backup13Index', dg.FieldColumns['备用13'].Index);
    myini.WriteInteger('formDesign', 'backup14Index', dg.FieldColumns['备用14'].Index);
    myini.WriteInteger('formDesign', 'backup15Index', dg.FieldColumns['备用15'].Index);
    myini.WriteInteger('formDesign', 'backup16Index', dg.FieldColumns['备用16'].Index);
    myini.WriteInteger('formDesign', 'backup17Index', dg.FieldColumns['备用17'].Index);
    myini.WriteInteger('formDesign', 'backup18Index', dg.FieldColumns['备用18'].Index);

    myini.WriteInteger('formDesign', 'noWidth', dg.FieldColumns['序号'].Width);
    myini.WriteInteger('formDesign', 'glideNoWidth', dg.FieldColumns['流水号'].Width);
    myini.WriteInteger('formDesign', 'carWidth', dg.FieldColumns['车号'].Width);
    myini.WriteInteger('formDesign', 'weightTypeWidth', dg.FieldColumns['过磅类型'].Width);
    myini.WriteInteger('formDesign', 'faHuoWidth', dg.FieldColumns['发货单位'].Width);
    myini.WriteInteger('formDesign', 'shouHuoWidth', dg.FieldColumns['收货单位'].Width);
    myini.WriteInteger('formDesign', 'goodsWidth', dg.FieldColumns['货名'].Width);
    myini.WriteInteger('formDesign', 'specWidth', dg.FieldColumns['规格'].Width);
    myini.WriteInteger('formDesign', 'grossWidth', dg.FieldColumns['毛重'].Width);
    myini.WriteInteger('formDesign', 'tareWidth', dg.FieldColumns['皮重'].Width);
    myini.WriteInteger('formDesign', 'netWidth', dg.FieldColumns['净重'].Width);
    myini.WriteInteger('formDesign', 'bundleWidth', dg.FieldColumns['扣重'].Width);
    myini.WriteInteger('formDesign', 'realWidth', dg.FieldColumns['实重'].Width);
    myini.WriteInteger('formDesign', 'priceWidth', dg.FieldColumns['单价'].Width);
    myini.WriteInteger('formDesign', 'sumWidth', dg.FieldColumns['金额'].Width);
    myini.WriteInteger('formDesign', 'scaleWidth', dg.FieldColumns['折方系数'].Width);
    myini.WriteInteger('formDesign', 'quanterWidth', dg.FieldColumns['方量'].Width);
    myini.WriteInteger('formDesign', 'costWidth', dg.FieldColumns['过磅费'].Width);
    myini.WriteInteger('formDesign', 'grossManWidth', dg.FieldColumns['毛重司磅员'].Width);
    myini.WriteInteger('formDesign', 'tareManWidth', dg.FieldColumns['皮重司磅员'].Width);
    myini.WriteInteger('formDesign', 'grossAddrWidth', dg.FieldColumns['毛重磅号'].Width);
    myini.WriteInteger('formDesign', 'tareAddrWidth', dg.FieldColumns['皮重磅号'].Width);
    myini.WriteInteger('formDesign', 'grossTimeWidth', dg.FieldColumns['毛重时间'].Width);
    myini.WriteInteger('formDesign', 'tareTimeWidth', dg.FieldColumns['皮重时间'].Width);
    myini.WriteInteger('formDesign', 'firstTimeWidth', dg.FieldColumns['一次过磅时间'].Width);
    myini.WriteInteger('formDesign', 'secondTimeWidth', dg.FieldColumns['二次过磅时间'].Width);
    myini.WriteInteger('formDesign', 'updateUserWidth', dg.FieldColumns['更新人'].Width);
    myini.WriteInteger('formDesign', 'updateTimeWidth', dg.FieldColumns['更新时间'].Width);
    myini.WriteInteger('formDesign', 'remarkWidth', dg.FieldColumns['备注'].Width);
    myini.WriteInteger('formDesign', 'printCountWidth', dg.FieldColumns['打印次数'].Width);
    myini.WriteInteger('formDesign', 'uploadWidth', dg.FieldColumns['上传否'].Width);
    myini.WriteInteger('formDesign', 'backup1Width', dg.FieldColumns['备用1'].Width);
    myini.WriteInteger('formDesign', 'backup2Width', dg.FieldColumns['备用2'].Width);
    myini.WriteInteger('formDesign', 'backup3Width', dg.FieldColumns['备用3'].Width);
    myini.WriteInteger('formDesign', 'backup4Width', dg.FieldColumns['备用4'].Width);
    myini.WriteInteger('formDesign', 'backup5Width', dg.FieldColumns['备用5'].Width);
    myini.WriteInteger('formDesign', 'backup6Width', dg.FieldColumns['备用6'].Width);
    myini.WriteInteger('formDesign', 'backup7Width', dg.FieldColumns['备用7'].Width);
    myini.WriteInteger('formDesign', 'backup8Width', dg.FieldColumns['备用8'].Width);
    myini.WriteInteger('formDesign', 'backup9Width', dg.FieldColumns['备用9'].Width);
    myini.WriteInteger('formDesign', 'backup10Width', dg.FieldColumns['备用10'].Width);
    myini.WriteInteger('formDesign', 'backup11Width', dg.FieldColumns['备用11'].Width);
    myini.WriteInteger('formDesign', 'backup12Width', dg.FieldColumns['备用12'].Width);
    myini.WriteInteger('formDesign', 'backup13Width', dg.FieldColumns['备用13'].Width);
    myini.WriteInteger('formDesign', 'backup14Width', dg.FieldColumns['备用14'].Width);
    myini.WriteInteger('formDesign', 'backup15Width', dg.FieldColumns['备用15'].Width);
    myini.WriteInteger('formDesign', 'backup16Width', dg.FieldColumns['备用16'].Width);
    myini.WriteInteger('formDesign', 'backup17Width', dg.FieldColumns['备用17'].Width);
    myini.WriteInteger('formDesign', 'backup18Width', dg.FieldColumns['备用18'].Width);
  finally
    myini.Free;
  end;
end;

procedure TMainForm.setExportWeightCheat;
var cheat: Double;
begin
  if systemConfig.exportToWeight then
  begin
    if systemConfig.cweightFlag1 then cheat := systemConfig.cweight1
    else if systemConfig.cweightFlag2 then cheat := systemConfig.cweight2
    else if systemConfig.cweightFlag3 then cheat := systemConfig.cweight3
    else if systemConfig.cweightFlag4 then cheat := systemConfig.cweight4
    else if systemConfig.cweightFlag5 then cheat := systemConfig.cweight5
    else if systemConfig.cweightFlag6 then cheat := systemConfig.cweight6
    else if systemConfig.cweightFlag7 then cheat := systemConfig.cweight7
    else if systemConfig.cweightFlag8 then cheat := systemConfig.cweight8
    else cheat := 0;
    case systemConfig.exportItem of
      0: FrmWeight1.CBCar.Text := FloatToStr(cheat);
      1: FrmWeight1.CBFaHuo.Text := FloatToStr(cheat);
      2: FrmWeight1.CBShouHuo.Text := FloatToStr(cheat);
      3: FrmWeight1.CBGoods.Text := FloatToStr(cheat);
      4: FrmWeight1.CBSpec.Text := FloatToStr(cheat);
      5: FrmWeight1.EdtBundle.Text := FloatToStr(cheat);
      6: FrmWeight1.EdtPrice.Text := FloatToStr(cheat);
      7: FrmWeight1.EdtScale.Text := FloatToStr(cheat);
      8: FrmWeight1.CBBackup1.Text := FloatToStr(cheat);
      9: FrmWeight1.CBBackup2.Text := FloatToStr(cheat);
      10: FrmWeight1.CBBackup3.Text := FloatToStr(cheat);
      11: FrmWeight1.CBBackup4.Text := FloatToStr(cheat);
      12: FrmWeight1.CBBackup5.Text := FloatToStr(cheat);
      13: FrmWeight1.EdtBackup6.Text := FloatToStr(cheat);
      14: FrmWeight1.EdtBackup7.Text := FloatToStr(cheat);
      15: FrmWeight1.EdtBackup8.Text := FloatToStr(cheat);
      16: FrmWeight1.EdtBackup9.Text := FloatToStr(cheat);
      17: FrmWeight1.CBBackup10.Text := FloatToStr(cheat);
      18: FrmWeight1.CBBackup11.Text := FloatToStr(cheat);
      19: FrmWeight1.CBBackup12.Text := FloatToStr(cheat);
      20: FrmWeight1.CBBackup13.Text := FloatToStr(cheat);
      21: FrmWeight1.CBBackup14.Text := FloatToStr(cheat);
      22: FrmWeight1.EdtBackup15.Text := FloatToStr(cheat);
      23: FrmWeight1.EdtBackup16.Text := FloatToStr(cheat);
      24: FrmWeight1.EdtBackup17.Text := FloatToStr(cheat);
      25: FrmWeight1.EdtBackup18.Text := FloatToStr(cheat);
    end;
  end;
end;

procedure TMainForm.SMScanTicketClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    Application.CreateForm(TScanTicketForm, ScanTicketForm);
    try
      ScanTicketForm.ShowModal;
    finally
      ScanTicketForm.Free;
    end;
  end;
end;

procedure TMainForm.SMScanReportClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印报表') then
  begin
    Application.CreateForm(TScanReportForm, ScanReportForm);
    try
      ScanReportForm.ShowModal;
    finally
      ScanReportForm.Free;
    end;
  end;
end;

procedure TMainForm.ADefineExecute(Sender: TObject);
var s: string;
begin
  s := TCommonUtil.deBase64AndDecompress(TIniFile.Create('weightSysInfo.ini').ReadString('system_set', 'pass', 'eJwrLy/XS6tKLCnXS87PBQAk2QUt'));
  if s = InputBox('', '请输入密码      ', '') then
  begin
    Application.CreateForm(TLoginInfoForm, LoginInfoForm);
    try
      LoginInfoForm.ShowModal;
    finally
      LoginInfoForm.Free;
    end;
  end;
end;

procedure TMainForm.ShowJson1Click(Sender: TObject);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, w) then
    begin
      ShowMessage(w.toJsonString);
    end;
  finally
    w.Free;
  end;
end;

procedure TMainForm.N5Click(Sender: TObject);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(
      DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString, w) then
    begin
      ShowMessage(Utf8ToAnsi( w.toXmlString));
    end;
  finally
    w.Free;
  end;
end;

end.

