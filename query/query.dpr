program query;

uses
  ExceptionLog,
  Windows,
  Forms,
  Main in 'Main.pas' {MainForm},
  SoftwareSet in 'SoftwareSet.pas' {SoftwareSetForm},
  UserPurview in 'UserPurview.pas' {UserPurviewForm},
  QueryDM in 'QueryDM.pas' {QueryDataModule: TDataModule},
  ModifyPassword in 'ModifyPassword.pas' {ModifyPasswordForm},
  Login in 'Login.pas' {LoginForm},
  PrepareMaintain in 'PrepareMaintain.pas' {PrepareMaintainForm},
  DBBackup in 'DBBackup.pas' {DBBackupForm},
  DBClear in 'DBClear.pas' {DBClearForm},
  DBConnect in 'DBConnect.pas' {DBConnectForm},
  DBMaintain in 'DBMaintain.pas' {DBMaintainForm},
  Print in 'Print.pas' {PreviewSetForm},
  About in 'About.pas' {AboutForm},
  Waiting in 'Waiting.pas' {WaitingForm},
  MeterUtil in 'Common\MeterUtil.pas',
  MultiGross in 'MultiGross.pas' {MultiGrossForm},
  Log in 'Log.pas' {LogForm},
  PhotoUnit in 'PhotoUnit.pas' {PhotoForm},
  Video in 'Video\Video.pas' {VideoForm},
  VideoSet in 'Video\VideoSet.pas' {VideoSetForm},
  SQLDBBackup in 'SQLDBBackup.pas' {SQLDBBackupForm},
  BackRecord in 'BackRecord.pas' {BackRecordForm},
  TicketSet in 'TicketSet.pas' {TicketSetForm},
  CommonUtil in 'Common\CommonUtil.pas',
  Car in 'Car.pas' {CarForm},
  Reg in 'Common\Reg.pas',
  RegCode in 'RegCode.pas' {RegCodeForm},
  helpRy3 in 'Common\helpRy3.pas',
  DataQuery in 'DataQuery.pas' {DataQueryForm},
  SelectOrder in 'SelectOrder.pas' {SelectOrderForm},
  SysConfig in 'SysConfig.pas',
  WeightRecord in 'Common\WeightRecord.pas',
  DogUtil in 'Common\DogUtil.pas',
  ET_API in 'Common\et_api.pas',
  Tao in 'Tao.pas' {TaoForm},
  TareChart in 'TareChart.pas' {TareChartForm},
  Formule in 'Formule.pas' {FormuleForm},
  WeightSet in 'WeightSet.pas' {WeightSetForm},
  TicketSel in 'TicketSel.pas' {TicketSelForm},
  PrepareUtil in 'Common\PrepareUtil.pas',
  InitializeOption in 'InitializeOption.pas' {InitializeOptionForm},
  DS104 in 'Video\DS104.pas',
  VC404 in 'Video\VC404.pas',
  DataType in 'Video\DataType.pas',
  DecodeCardSdk in 'Video\DecodeCardSdk.pas',
  HCNETSDK in 'Video\HCNetSDK.pas',
  PlayMpeg4 in 'Video\PlayMpeg4.pas',
  Voice in 'Voice.pas' {VoiceForm},
  Pay in 'Pay.pas' {PayForm},
  PayHistory in 'PayHistory.pas' {PayHistoryForm},
  DataShowSetting in 'DataShowSetting.pas' {DataShowSettingForm},
  ExpressionUtil in 'Common\ExpressionUtil.pas',
  SkinChange in 'SkinChange.pas' {SkinChangeForm},
  WeightFrm in 'WeightFrm.pas' {FrmWeight: TFrame},
  DrawLine1 in 'Common\DrawLine1.pas',
  DrawLine2 in 'Common\DrawLine2.pas',
  DataMigrate in 'DataMigrate.pas' {DataMigrateForm},
  StaticChart in 'StaticChart.pas' {StaticChartForm},
  Mail in 'Mail.pas' {MailForm},
  WeightUtil in 'Common\WeightUtil.pas',
  ReportUtil in 'Common\ReportUtil.pas',
  PayUtil in 'Common\PayUtil.pas',
  OtherUtil in 'Common\OtherUtil.pas',
  MeterConnect1 in 'MeterConnect1.pas' {MeterConnect1Form},
  MeterConnect2 in 'MeterConnect2.pas' {MeterConnect2Form},
  ManualInput in 'ManualInput.pas' {ManualInputForm},
  Storage in 'Storage.pas' {StorageForm},
  Price in 'Price.pas' {PriceForm},
  InvalidDataQuery in 'InvalidDataQuery.pas' {InvalidDataQueryForm},
  MediaTran in 'Video\MediaTran.pas',
  Autoshut in 'Autoshut.pas' {AutoShutForm},
  ReportSys in 'ReportSys.pas' {ReportSysForm},
  Filter in 'Filter.pas' {FilterForm},
  FT_RY1S_API in 'Common\FT_RY1S_API.pas';

{$R *.res}
{$R UAC.res}

begin
  Application.Initialize;
  Application.CreateForm(TQueryDataModule, QueryDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TMeterConnect1Form, MeterConnect1Form);
  Application.CreateForm(TMeterConnect2Form, MeterConnect2Form);
  Application.CreateForm(TVideoForm, VideoForm);
  Application.CreateForm(TVideoSetForm, VideoSetForm);
  Application.CreateForm(TDataQueryForm, DataQueryForm);
  Application.CreateForm(TMultiGrossForm, MultiGrossForm);
  Application.CreateForm(TPhotoForm, PhotoForm);
  Application.CreateForm(TCarForm, CarForm);
  Application.CreateForm(TMailForm, MailForm);
  Application.Run;
end.

