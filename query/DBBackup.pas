unit DBBackup;

interface

uses
  Windows, Classes, Controls, Forms, Dialogs, IniFiles,
  ExtCtrls, StdCtrls, Gauges, Comobj, SysUtils, jpeg;

type
  TDBBackupForm = class(TForm)
    TBackup: TTimer;
    ImgBack: TImage;
    Panel1: TPanel;
    lblAddrHint: TLabel;
    lblDbAddr: TLabel;
    lblBackupHint: TLabel;
    GaugeBackup: TGauge;
    procedure FormShow(Sender: TObject);
    procedure TBackupTimer(Sender: TObject);
  private
    { Private declarations }
    backupFlag: boolean;
  public
    { Public declarations }
  end;

var
  DBBackupForm: TDBBackupForm;

implementation

uses QueryDM;

{$R *.dfm}

function BackupDatabase(srcFileName, destFileName, dbPassWord: string; compactFlag: boolean): boolean; //压缩数据库,覆盖源文件
const
  SConnectionString = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;'
    + 'Jet OLEDB:Database Password=%s;';
var
  DB: OleVariant;
begin
  if compactFlag then
  try
    DB := CreateOleObject('JRO.JetEngine'); //建立OLE对象,函数结束OLE对象超过作用域自动释放
    OleCheck(DB.CompactDatabase(format(SConnectionString, [srcFileName, dbPassWord]), format(SConnectionString, [destFileName, dbPassWord]))); //压缩数据库
    result := True;
  except
    result := False; //压缩失败
  end
  else
    result := CopyFile(pchar(srcFileName), pchar(destFileName), False);
end;

function ExtractStr(str: string): string;
var
  start, tool, Num: Integer;
begin
  start := Pos('Data Source=', str) + 12;
  tool := Pos(';Mode=', str);
  Num := tool - start;
  result := Copy(str, start, Num);
end;

procedure TDBBackupForm.FormShow(Sender: TObject);
var myini: TIniFile;
  srcFileName: string;
  compactFlag: boolean;
begin
  myini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\setup.ini');
  try
    TBackup.Enabled := True;
    backupFlag := False;
    lblDbAddr.Caption := '';
    lblDbAddr.Font.Color := $000000;
    GaugeBackup.Progress := 1;
    if not DirectoryExists(myini.ReadString('db', 'backup_addr', 'D:\ATWBACKUP\')) then
      ForceDirectories(myini.ReadString('db', 'backup_addr', 'D:\ATWBACKUP\'));
    lblDbAddr.Caption := myini.ReadString('db', 'backup_addr', 'D:\ATWBACKUP\') + FormatDateTime('yyyy-MM-dd hh-mm-ss', Now) + '.mdb';
    srcFileName := ExtractStr(QueryDataModule.DBConnection.ConnectionString);
    compactFlag := myini.ReadBool('db', 'compact', True);
    if lblDbAddr.Caption <> '' then
    begin
      QueryDataModule.DBConnection.Close;
      backupFlag := BackupDatabase(srcFileName, lblDbAddr.Caption, QueryDM.DB_PASSWORD, compactFlag);
      QueryDataModule.DBConnection.Open;
    end
    else
    begin
      MessageDlg('数据库备份地址未设置，无法进行自动备份！', mtWarning, [mbOK], 0);
      Close;
    end;
  finally
    myini.Free;
  end;
end;

procedure TDBBackupForm.TBackupTimer(Sender: TObject);
begin
  GaugeBackup.Progress := GaugeBackup.Progress + 1;
  if (GaugeBackup.Progress = 100) and backupFlag then
  begin
    TBackup.Enabled := False;
    Close;
  end;
end;

end.

