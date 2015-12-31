program dataUploadCloud;

uses
  ExceptionLog,
  Forms,
  UploadCloud in 'UploadCloud.pas' {UploadCloudForm},
  CommonUtil in 'CommonUtil.pas',
  superobject in 'superobject.pas',
  superxmlparser in 'superxmlparser.pas',
  WeightRecord in 'WeightRecord.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TUploadCloudForm, UploadCloudForm);
  Application.Run;
end.
