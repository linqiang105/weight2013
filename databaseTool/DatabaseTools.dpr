program DatabaseTools;

uses
  ExceptionLog,
  Forms,
  InputDBFile in 'InputDBFile.pas' {InputDBFileForm},
  DBDataModule in 'DBDataModule.pas' {DataModuleDB: TDataModule},
  DBTools in 'DBTools.pas' {DBToolForm},
  ApartDBfile in 'ApartDBfile.pas' {ApartDBfileForm},
  SetPassword in 'SetPassword.pas' {SetPasForm},
  SelectServer in 'SelectServer.pas' {SelectServerForm};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '数据库工具';
  Application.CreateForm(TDataModuleDB, DataModuleDB);
  Application.CreateForm(TDBToolForm, DBToolForm);
  Application.Run;
end.
