unit Main;

interface

uses
  Windows, Graphics, SysUtils, Classes, Controls, Forms,
  Dialogs, Menus, DB, ADODB, ExtCtrls, StdCtrls, inifiles,
  Buttons, DBGridEh, SysConfig, WinSkinData, PropStorageEh, StdActns,
  DBActns, ActnList, PrnDbgeh, RzPanel, RzButton, GridsEh, Registry,
  RzStatus, ExceptionLog, WeightFrm,
  ExtDlgs, SpeechLib_TLB, PropFilerEh, OleServer, CnAAFont,
  MSNPopUp, RzSplit, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping;

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
    SMDatabase: TMenuItem;
    SMDBBack: TMenuItem;
    SMPreMaintain: TMenuItem;
    SMMeter1: TMenuItem;
    SMSoftSet: TMenuItem;
    SMPrintCombine: TMenuItem;
    SMComputer: TMenuItem;
    SMModify: TMenuItem;
    SMAbout: TMenuItem;
    N38: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N44: TMenuItem;
    PanelMain: TPanel;
    SMDataback: TMenuItem;
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
    SPMDelete: TMenuItem;
    SPMSaveAs: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    TSimulate: TTimer;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    IniPropStorageManEh1: TIniPropStorageManEh;
    PropStorageEh1: TPropStorageEh;
    NVideo: TMenuItem;
    N7: TMenuItem;
    cheat1: TAction;
    N10: TMenuItem;
    SMTicketSet: TMenuItem;
    PData: TPanel;
    DBGridEh1: TDBGridEh;
    N17: TMenuItem;
    SMMeter2: TMenuItem;
    N18: TMenuItem;
    N11: TMenuItem;
    cheat2: TAction;
    cheat3: TAction;
    cheat4: TAction;
    ASetCheat: TAction;
    NDesign: TMenuItem;
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
    N9: TMenuItem;
    N14: TMenuItem;
    EurekaLog1: TEurekaLog;
    N15: TMenuItem;
    AVideo: TAction;
    N19: TMenuItem;
    SkinData1: TSkinData;
    ImgBack: TImage;
    FrmWeight1: TFrmWeight;
    TLine: TTimer;
    N8: TMenuItem;
    N21: TMenuItem;
    TBackRecord: TTimer;
    N22: TMenuItem;
    N23: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    SpVoice1: TSpVoice;
    TBExit: TRzBitBtn;
    TBChange: TRzBitBtn;
    TBWeight: TRzBitBtn;
    TBQuery: TRzBitBtn;
    TBTicket: TRzBitBtn;
    TBVideo: TRzBitBtn;
    TBCalc: TRzBitBtn;
    TBVoice: TRzMenuButton;
    BtnDouble: TRzBitBtn;
    N12: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    BtnNet: TRzBitBtn;
    N25: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    MSNPopUp1: TMSNPopUp;
    AZero: TAction;
    N32: TMenuItem;
    N34: TMenuItem;
    N33: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    cbjt1: TMenuItem;
    N37: TMenuItem;
    N39: TMenuItem;
    AExceed: TAction;
    TAutoShut: TTimer;
    N43: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    SPTool: TRzSizePanel;
    CBRecordType: TComboBox;
    CBRecordTime: TComboBox;
    PhotoBtn: TSpeedButton;
    ListBtn: TBitBtn;
    OutputBtn: TRzBitBtn;
    PrintBtn: TBitBtn;
    cheatClose: TAction;
    SPCheat: TRzStatusPane;
    NWeightSet: TMenuItem;
    N48: TMenuItem;
    PWeightFrm: TRzSizePanel;
    N20: TMenuItem;
    N24: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure SMMeter1Click(Sender: TObject);
    procedure SMCloseClick(Sender: TObject);
    procedure SMSoftSetClick(Sender: TObject);
    procedure SMChangeClick(Sender: TObject);
    procedure SMPasswordClick(Sender: TObject);
    procedure SMWeightClick(Sender: TObject);
    procedure SMUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SMDatabaseClick(Sender: TObject);
    procedure SMDBBackClick(Sender: TObject);
    procedure SMPreMaintainClick(Sender: TObject);
    procedure SMDatabackClick(Sender: TObject);
    procedure TAutoBackupTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure SMDataQueryClick(Sender: TObject);
    procedure SMAboutClick(Sender: TObject);
    procedure SMComputerClick(Sender: TObject);
    procedure SMTerminateClick(Sender: TObject);
    procedure SMSimulateClick(Sender: TObject);
    procedure SPMPrintClick(Sender: TObject);
    procedure SPMDeleteClick(Sender: TObject);
    procedure SPMSaveAsClick(Sender: TObject);
    procedure TSimulateTimer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure SMTicketSetClick(Sender: TObject);
    procedure SMModifyClick(Sender: TObject);
    procedure SMMeter2Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure CBRecordTypeChange(Sender: TObject);
    procedure cheat1Execute(Sender: TObject);
    procedure cheat2Execute(Sender: TObject);
    procedure cheat3Execute(Sender: TObject);
    procedure cheat4Execute(Sender: TObject);
    procedure SMPrintCombineClick(Sender: TObject);
    procedure NDesignClick(Sender: TObject);
    procedure TBExitClick(Sender: TObject);
    procedure TBChangeClick(Sender: TObject);
    procedure TBWeightClick(Sender: TObject);
    procedure TBQueryClick(Sender: TObject);
    procedure TBCalcClick(Sender: TObject);
    procedure TBTicketClick(Sender: TObject);
    procedure TBVideoClick(Sender: TObject);
    procedure NVideoClick(Sender: TObject);
    procedure CBRecordTimeChange(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure RzToolbar1DblClick(Sender: TObject);
    procedure AVideoExecute(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TLineTimer(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure TBackRecordTimer(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure BtnDoubleClick(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure BtnNetClick(Sender: TObject);
    procedure TBVoiceContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure ImgBackDblClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure AZeroExecute(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
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
    procedure N20Click(Sender: TObject);
  private
    { Private declarations }
    myini: TiniFile;
    canAutoSave: Boolean; //后台自动保存
    arrPicFile: TStringList;
    arrDesignMenu: array of TMenuItem;
    picStep: Integer; //用来切换图片使用
    FCurrentUser: string;
    testStep: Boolean;
    procedure SetCurrentUser(const Value: string);
    function getBgFile(): Boolean; //获取背景图片文件名存入数组
    procedure selWeightForm(Sender: TObject); //选择称重界面
  public
    { Public declarations }
    systemConfig: TSysConfig; //系统参数
    weightSetConfig: TWeightSetConfig; //界面参数
    procedure ShowMsg(Msg: string); //显示信息
    procedure GetStaticInfo(); //计算称重界面右上角的统计信息
    procedure setAutoBackup(t: boolean); //设置自动备份数据库
    procedure CheckRegistry; //输入注册码
    function GetRegistryCode: string; //取系统注册码
    procedure loadFormDesign(); //载入窗体配置
    procedure loadVoiceList(); //读取语音播放列表
    procedure loadDisplayFormat(); //设置毛,皮,净显示格式
    function showGridRecord(): string; //显示表格的记录,根据条件
    procedure loadSysConfig(); //读取系统配置
    procedure pmVoiceClick(Sender: TObject); //语音播报列表
    function setSkin(skinFile: string): Boolean; //设置系统皮肤
    function setBackGround(s: string): Boolean; //设置背景文件
    function setVoiceRate(r: Integer): Boolean; //设置播报速度
    function resizeMain(): Boolean; //重置窗体
    procedure setCompanyInfo();
    procedure loadFormDesignFile();
    procedure speak(str: string);
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
  DBMaintain, DBClear, DBBackup, About, Log,
  PhotoUnit, SQLDBBackup, BackRecord, TicketSet, CommonUtil,
  RegCode, Reg, DogUtil, Tao,
  TareChart, WeightSet, InitializeOption, Video,
  Voice, Pay, PayHistory, VideoSet, DataShowSetting,
  SkinChange, DrawLine1, DrawLine2, DataMigrate, StaticChart, MeterConnect1,
  MeterConnect2, Mail, OtherUtil, WeightUtil, ReportUtil, ShellAPI,
  ManualInput, Storage, Price, InvalidDataQuery, Autoshut, DateUtils,
  ReportSys;

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
      loadDisplayFormat;
      SoftwareSetForm.Free;
    end
  end
  else
    ShowMsg('对不起您没有系统设置权限，无法进行软件设置！')
end;

procedure TMainForm.SMChangeClick(Sender: TObject);
begin
  PanelMain.Visible := False;
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
  PanelMain.Visible := True;
  //更新称重界面 , 启动画线及稳定判断
  FrmWeight1.Align := alClient;
  FrmWeight1.resizeFrame;
  FrmWeight1.startSteady();
  FrmWeight1.setSysConfig(systemConfig);
  FrmWeight1.P00SetFocus;
  FrmWeight1.PWeight1.Color := clBlack;
  FrmWeight1.PWeight2.Color := clBlack;

  TLine.Enabled := True;
  //计算称重界面右上角的统计信息
  GetStaticInfo();
  showGridRecord;
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
    MessageBoxW(0, '请插入加密狗！', '提示', MB_OK + MB_ICONWARNING +
      MB_TOPMOST);

  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  IniPropStorageManEh1.IniFileName := ExtractFilePath(ParamStr(0)) +
    '\form.ini';
  systemConfig := TSysConfig.Create;
  weightSetConfig := TWeightSetConfig.Create;
  arrPicFile := TStringList.Create;

  //读取系统参数配置
  loadSysConfig();
  loadFormDesign();
  loadDisplayFormat();
  //载入声音文件
  loadVoiceList();

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

  //当数据库过大时,提示用户清理,仅限于单机模式
  if TWeightUtil.getDatabaseSpace(systemConfig.databaseInUse) >= systemConfig.databaseAlarm then
  begin
    MessageBox(0, '您的数据库文件已经过大了,请及时清理数据', '警告', MB_OK +
      MB_ICONWARNING + MB_DEFBUTTON1 + MB_TOPMOST);
  end;
  if (CurrentUser = '') then
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
end;

procedure TMainForm.SMDatabaseClick(Sender: TObject);
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

procedure TMainForm.SMDBBackClick(Sender: TObject);
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
      PrepareMaintainForm.Free
    end
  end
  else
    ShowMsg('对不起您没有预置维护权限，无法进行预置维护！')
end;

procedure TMainForm.SMDatabackClick(Sender: TObject);
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
  //记录当前显示的是本月,未完成记录等
  myini.WriteInteger('system_set', 'record_time', CBRecordTime.ItemIndex);
  myini.WriteInteger('system_set', 'record_type', CBRecordType.ItemIndex);
  myini.WriteBool('system_set', 'show_meter2', FrmWeight1.PMeter2.Visible);

  FrmWeight1.TReadWeight.Enabled := False;
  FrmWeight1.TSteady.Enabled := False;
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
  if weightSetConfig <> nil then weightSetConfig.Free;
  if arrPicFile <> nil then arrPicFile.Free;
end;

procedure TMainForm.DBGridEh1CellClick(Column: TColumnEh);
var
  SelNo: string;
begin
  SelNo := DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString;
  if SelNo <> '' then
  begin
    TWeightUtil.showPhotoEx(SelNo, systemConfig.savePicLocal);
    with DBGridEh1.DataSource.DataSet do
    begin
      PhotoForm.setWeightInfo(FieldByName('流水号').AsString,
        FieldByName('车号').AsString, FieldByName('发货单位').AsString,
        FieldByName('收货单位').AsString, FieldByName('货名').AsString,
        FieldByName('规格').AsString, FieldByName('毛重').AsString,
        FieldByName('皮重').AsString, FieldByName('净重').AsString
        );
    end;
  end;
end;

procedure TMainForm.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  {with TMyDBGrid(Sender) do
  begin
    if DataLink.ActiveRecord = Row - 1 then
    begin
      Canvas.Font.Color := clRed;
      Canvas.Brush.Color := clSkyBlue
    end
    else
    begin
      Canvas.Brush.Color := Color;
      Canvas.Font.Color := Font.Color
    end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State)
  end;
  if gdSelected in State then
    Exit; }
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
    if not SMSimulate.Checked then
    begin
      SMSimulate.Checked := True;
      Randomize;
      FrmWeight1.PWeight1.Caption := FloatToStr(Random(10000) * 10);
      TSimulate.Enabled := True
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

procedure TMainForm.SPMDeleteClick(Sender: TObject);
var i: string;
begin
  if TUserUtil.HasAuthority('删除记录') then
  begin
    if MessageDlg('确实要删除这条记录吗?', mtConfirmation, [mbOK, mbCancel], 0) =
      mrOk then
    begin
      try
        if DBGridEh1.SelectedIndex <> -1 then
          i := DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString;
        DBGridEh1.DataSource.DataSet.Delete;
        TWeightUtil.deletePhoto(i);
      except
      end;
    end;
  end;
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
  Randomize;
  FrmWeight1.PWeight1.Caption := FloatToStr(Random(10000) * 10);
  if FrmWeight1.PMeter2.Visible then
    FrmWeight1.PWeight2.Caption := FloatToStr(Random(10000) * 10);
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

procedure TMainForm.N6Click(Sender: TObject);
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

procedure TMainForm.N10Click(Sender: TObject);
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
      TReportUtil.designTicket(systemConfig.ticketFormat, 1)
    else if systemConfig.ticketType = 2 then
      TReportUtil.designTicket(systemConfig.ticketFormat2, 2);
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

procedure TMainForm.loadFormDesign;
begin

end;

procedure TMainForm.SMMeter2Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('仪表设置') then
    MeterConnect2Form.ShowModal
  else
    ShowMsg('对不起您没有仪表设置权限，无法进行仪表设置！')
end;

procedure TMainForm.N18Click(Sender: TObject);
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
  TSysConfigUtil.loadConfig(systemConfig, weightSetConfig);

  setAutoBackup(systemConfig.backupType = 2);
  if FileExists(ExtractFilePath(ParamStr(0)) + 'bg.jpg') then
    ImgBack.Picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'bg.jpg');

  TBackRecord.Enabled := systemConfig.useBackRecord;
  canAutoSave := True;

  FrmWeight1.saved := False;
  //记录当前显示的是本月,未完成记录等
  CBRecordTime.ItemIndex := systemConfig.recordTime;
  CBRecordType.ItemIndex := systemConfig.recordType;
  if systemConfig.showMeter2 then FrmWeight1.showMeter2();
  if systemConfig.deleteHistory then TWeightUtil.DelHistory();
  TWeightUtil.checkPicCount(systemConfig.picCount);

  Application.Title := '称重数据集中管理终端';
  Caption := '称重数据集中管理终端';
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
  cheatClose.ShortCut := systemConfig.cheatCloseShortCut;

  setSkin(systemConfig.skinFile);
  setVoiceRate(systemConfig.voiceRate);

end;

procedure TMainForm.cheat1Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := not systemConfig.cweightFlag1;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
end;

procedure TMainForm.cheat2Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := not systemConfig.cweightFlag2;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := False;
end;

procedure TMainForm.cheat3Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := not systemConfig.cweightFlag3;
  systemConfig.cweightFlag4 := False;
end;

procedure TMainForm.cheat4Execute(Sender: TObject);
begin
  systemConfig.cweightFlag1 := False;
  systemConfig.cweightFlag2 := False;
  systemConfig.cweightFlag3 := False;
  systemConfig.cweightFlag4 := not systemConfig.cweightFlag4;
end;

procedure TMainForm.SMPrintCombineClick(Sender: TObject);
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

procedure TMainForm.NDesignClick(Sender: TObject);
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
  PanelMain.Visible := False;
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

procedure TMainForm.NVideoClick(Sender: TObject);
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
  SpVoice1.Speak('', SVSFPurgeBeforeSpeak);
  SpVoice1.Speak((Sender as TMenuItem).Caption, SVSFlagsAsync);
end;

procedure TMainForm.CBRecordTimeChange(Sender: TObject);
begin
  showGridRecord;
end;

procedure TMainForm.N9Click(Sender: TObject);
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

procedure TMainForm.N14Click(Sender: TObject);
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

procedure TMainForm.N15Click(Sender: TObject);
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

procedure TMainForm.N19Click(Sender: TObject);
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
  FrmWeight1.Width := PWeightFrm.Width;
  FrmWeight1.resizeWidth;
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

procedure TMainForm.N21Click(Sender: TObject);
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
  if canAutoSave then
  begin
    if (StrToFloatDef(FrmWeight1.PWeight1.Caption, 1000) > systemConfig.backRecordWeight)
      and (FrmWeight1.getSteady) then
    begin
      TWeightUtil.saveBackRecord(FrmWeight1.PWeight1.Caption);
      canAutoSave := False;
    end;
  end
  else
  begin
    if StrToFloatDef(FrmWeight1.PWeight1.Caption, 1000) < systemConfig.ReturnZero then
      canAutoSave := True;
  end;
end;

procedure TMainForm.N22Click(Sender: TObject);
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

procedure TMainForm.N26Click(Sender: TObject);
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
    SpVoice1.Rate := r;
  end;
end;

procedure TMainForm.BtnDoubleClick(Sender: TObject);
begin
  FrmWeight1.showMeter2();
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('数据导出') then
  begin
    MailForm.ShowModal();
  end;
end;

procedure TMainForm.BtnNetClick(Sender: TObject);
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
  inc(picStep);
  if picStep > arrPicFile.Count - 1 then
    picStep := 0;
  if FileExists(arrPicFile[picStep]) then
    setBackGround(arrPicFile[picStep]);
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PAnsiChar(ExtractFilePath(Application.ExeName) + '\help.chm'), '', '', SW_SHOW);
end;

procedure TMainForm.N25Click(Sender: TObject);
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

procedure TMainForm.AZeroExecute(Sender: TObject);
begin
  FrmWeight1.PWeight1.Caption := '0';
end;

procedure TMainForm.setCompanyInfo();
begin
  SpInfo.Caption := Format('%s 使用单位:%s 电话号码:%s',
    [Application.Title, systemConfig.company, systemConfig.tel]);
end;

procedure TMainForm.N32Click(Sender: TObject);
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

procedure TMainForm.N33Click(Sender: TObject);
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
  //只能作废今天之前的记录
  {
  if DBGridEh1.DataSource.DataSet.FieldByName('更新时间').AsDateTime >
    StartOfTheDay(Date) then
  begin
    Application.MessageBox('只能作废今天之前的记录！', '警告', MB_OK +
      MB_ICONWARNING + MB_TOPMOST);
    Exit;
  end;
  }
  if TWeightUtil.moveDeletedRecord(
    DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString) then
  begin
    DBGridEh1.DataSource.DataSet.Delete;
    Application.MessageBox('该记录已经作废', '提示', MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  end;
end;

procedure TMainForm.N36Click(Sender: TObject);
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

procedure TMainForm.loadDisplayFormat;
begin
{  DBGridEh1.FieldColumns['毛重'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['皮重'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['净重'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['扣重'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['实重'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['单价'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['金额'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['折方系数'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['方量'].DisplayFormat := systemConfig.meterShowMode;
  DBGridEh1.FieldColumns['过磅费'].DisplayFormat := systemConfig.meterShowMode;  }
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
var SelNo: string;
begin
  SelNo := DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString;
  if SelNo <> '' then
    TWeightUtil.showPhotoEx(selno, systemConfig.savePicLocal);
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
var SelNo: string;
begin
  SelNo := DBGridEh1.DataSource.DataSet.FieldByName('流水号').AsString;
  if SelNo <> '' then
    TWeightUtil.showPhotoEx(selno, systemConfig.savePicLocal);
  PhotoForm.Show;
end;

procedure TMainForm.ListBtnClick(Sender: TObject);
begin
  Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
  try
    DataShowSettingForm.DBGridEh1 := DBGridEh1;
    DataShowSettingForm.ShowModal;
  finally
    DataShowSettingForm.Free
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
    NWeightSet.Add(arrDesignMenu);
  finally
    slDesign.Free;
  end;
end;

procedure TMainForm.selWeightForm(Sender: TObject);
var f: string;
begin
  f := ExtractFilePath(ParamStr(0)) + 'Design\' + (Sender as TMenuItem).Caption + '.wfc';

  if FileExists(f) then
  begin
    CopyFile(PChar(f), PChar(ExtractFilePath(ParamStr(0)) + 'design.ini'), False);
    TSysConfigUtil.loadFormConfig(MainForm.weightSetConfig);

    if MainForm.PanelMain.Visible then
    begin
      MainForm.loadFormDesign;
      MainForm.SMWeight.Click;
    end;
  end;
end;

procedure TMainForm.speak(str: string);
begin
  SpVoice1.Speak('', SVSFPurgeBeforeSpeak);
  SpVoice1.Speak(str, SVSFlagsAsync);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if not QueryDataModule.ConnectFlag then
  begin
    Application.MessageBox('无法连接数据库,系统即将退出', '错误', MB_OK +
      MB_ICONSTOP + MB_TOPMOST);
    Application.Terminate;
  end;
end;

procedure TMainForm.N20Click(Sender: TObject);
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

end.

