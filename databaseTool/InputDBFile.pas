unit InputDBFile;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls, Dialogs;

type
  TInputDBFileForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    OpenDialog1: TOpenDialog;
    LabelDBName: TLabel;
    EditDBName: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  InputDBFileForm: TInputDBFileForm;

implementation
uses DBDataModule;
{$R *.dfm}

procedure TInputDBFileForm.BitBtn1Click(Sender: TObject);
var TempF: string;
begin
  OpenDialog1.Filter := 'SQL数据库文件(*.mdf)|*.mdf';
  OpenDialog1.DefaultExt := '*.mdf';
  if OpenDialog1.Execute then
  begin
    Edit1.Text := OpenDialog1.FileName; //数据库文件
    TempF := Edit1.Text;
    Delete(TempF, Length(TempF) - 3, 4);
    Edit2.Text := TempF + '.ldf'; //日志文件
    TempF := ExtractFileName(OpenDialog1.FileName); //得到文件名
    Delete(TempF, Length(TempF) - 3, 4);
    EditDBName.Text := TempF;
  end;
end;

procedure TInputDBFileForm.BitBtn2Click(Sender: TObject);
begin
  OpenDialog1.Filter := 'SQL数据库日志文件(*.ldf)|*.ldf';
  OpenDialog1.DefaultExt := '*.ldf';
  if OpenDialog1.Execute then
    Edit2.Text := OpenDialog1.FileName;
end;

procedure TInputDBFileForm.BitBtn4Click(Sender: TObject);
begin
  Close;
end;

procedure TInputDBFileForm.BitBtn3Click(Sender: TObject);
var
  DBFile: string;
  logFile: string;
  DBNameStr: string;
begin
  DBFile := Trim(Edit1.Text);
  logFile := Trim(Edit2.Text);
  if DBFile = '' then
  begin
    MessageBox(0, '数据库文件不能为空！', '警告', MB_OK + MB_ICONWARNING);
    Edit1.SetFocus;
    Exit;
  end;
  if logFile = '' then
  begin
    MessageBox(0, '数据库日志文件不能为空！', '警告', MB_OK + MB_ICONWARNING);
    Edit2.SetFocus;
    Exit;
  end;
  if LowerCase(Copy(DBFile, Length(DBFile) - 3, 4)) <> '.mdf' then //扩展名不是.MDF着加上.mdf
  begin
    DBFile := DBFile + '.mdf';
    Edit1.Text := DBFile;
  end;
  if not FileExists(DBFile) then //文件不存在
  begin
    MessageBox(0, '数据库文件不存在！', '警告', MB_OK + MB_ICONWARNING);
    Edit1.Clear;
    Edit1.SetFocus;
    Exit;
  end;
  if LowerCase(Copy(logFile, Length(logFile) - 3, 4)) <> '.ldf' then
  begin
    logFile := logFile + '.ldf';
    Edit2.Text := logFile;
  end;
  if not FileExists(logFile) then
  begin
    MessageBox(0, '数据库日志文件不存在！', '警告', MB_OK + MB_ICONWARNING);
    Edit2.Clear;
    Edit2.SetFocus;
    Exit;
  end;
  if Trim(EditDBName.Text) <> '' then
    DBNameStr := Trim(EditDBName.Text)
  else
  begin
    MessageBox(0, '附加生成的数据库名不能为空！请重新输入！', '警告', MB_OK + MB_ICONWARNING);
    EditDBName.SetFocus;
    Exit;
  end;
  with DataModuleDB do
  begin
    ADOQueryAddDB.Close;
    ADOQueryAddDB.SQL.Clear;
    ADOQueryAddDB.SQL.Add('EXEC sp_attach_db @dbname=N' + #39 + DBNameStr + #39);
    ADOQueryAddDB.SQL.Add(',@filename1=N' + #39 + DBFile + #39);
    ADOQueryAddDB.SQL.Add(',@filename2=N' + #39 + logFile + #39);
    try
      ADOQueryAddDB.ExecSQL;
      MessageBox(0, PChar('数据库附加成功！' + Char(13) + '附加生成数据库【' + Trim(EditDBName.Text) + '】！'), '提示', MB_OK + MB_ICONINFORMATION);
      ADOQueryAddDB.Close;
      Edit1.Clear;
      Edit2.Clear;
      EditDBName.Clear;
    except
      on E: Exception do
      begin
        MessageBox(0, PChar(E.Message), '警告', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
  end;
end;

end.

