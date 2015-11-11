program weight;

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
  About in 'About.pas' {AboutForm},
  Waiting in 'Waiting.pas' {WaitingForm},
  MeterUtil in 'Common\MeterUtil.pas',
  ReadWeight in 'ReadWeight.pas' {ReadWeightForm},
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
  ComOutput in 'ComOutput.pas' {ComOutputForm},
  SelectOrder in 'SelectOrder.pas' {SelectOrderForm},
  SysConfig in 'SysConfig.pas',
  WeightRecord in 'Common\WeightRecord.pas',
  Correct in 'Correct.pas' {CorrectForm},
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
  ManualInput in 'ManualInput.pas' {ManualInputForm},
  Storage in 'Storage.pas' {StorageForm},
  Price in 'Price.pas' {PriceForm},
  InvalidDataQuery in 'InvalidDataQuery.pas' {InvalidDataQueryForm},
  MediaTran in 'Video\MediaTran.pas',
  Autoshut in 'Autoshut.pas' {AutoShutForm},
  ReportSys in 'ReportSys.pas' {ReportSysForm},
  Filter in 'Filter.pas' {FilterForm},
  FT_RY1S_API in 'Common\FT_RY1S_API.pas',
  CostSet in 'CostSet.pas' {CostSetForm},
  dhnetsdk in 'Video\DHNetSDK.pas',
  BaseInfoSel in 'BaseInfoSel.pas' {BaseInfoSelForm},
  ScanReport in 'ScanReport.pas' {ScanReportForm},
  ScanTicket in 'ScanTicket.pas' {ScanTicketForm},
  MeterConnect2 in 'MeterConnect2.pas' {MeterConnect2Form},
  superobject in 'Common\superobject.pas',
  superxmlparser in 'Common\superxmlparser.pas',
  UploadCloud in 'UploadCloud.pas' {UploadCloudForm},
  frx2DBarcode in 'Code2D\frx2DBarcode.pas',
  frx2DBarcodeRTTI in 'Code2D\frx2DBarcodeRTTI.pas',
  uBitMapOverriden in 'Code2D\uBitMapOverriden.pas',
  ufrxZintBarcode in 'Code2D\ufrxZintBarcode.pas',
  uRegZintBarcode in 'Code2D\uRegZintBarcode.pas',
  uZintBarcode in 'Code2D\uZintBarcode.pas',
  uZintInterface in 'Code2D\uZintInterface.pas';

{$R *.res}
{$R UAC.res}

begin
  Application.Initialize;
  Application.CreateForm(TQueryDataModule, QueryDataModule);
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TVideoForm, VideoForm);
  Application.CreateForm(TVideoSetForm, VideoSetForm);
  Application.CreateForm(TDataQueryForm, DataQueryForm);
  Application.CreateForm(TComOutputForm, ComOutputForm);
  Application.CreateForm(TReadWeightForm, ReadWeightForm);
  Application.CreateForm(TMultiGrossForm, MultiGrossForm);
  Application.CreateForm(TPhotoForm, PhotoForm);
  Application.CreateForm(TCarForm, CarForm);
  Application.CreateForm(TMailForm, MailForm);
  Application.CreateForm(TBaseInfoSelForm, BaseInfoSelForm);
  Application.CreateForm(TUploadCloudForm, UploadCloudForm);
  Application.CreateForm(TMeterConnect1Form, MeterConnect1Form);
  Application.CreateForm(TMeterConnect2Form, MeterConnect2Form);
  Application.Run;
end.

