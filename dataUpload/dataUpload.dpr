program dataUpload;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {MainForm},
  CommonUtil in 'CommonUtil.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '后台数据上传';
  Application.CreateForm(TUploadCloudForm, UploadCloudForm);
  Application.Run;
end.
