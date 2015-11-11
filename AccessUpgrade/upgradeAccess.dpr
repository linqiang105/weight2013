program upgradeAccess;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '单机数据库升级';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
