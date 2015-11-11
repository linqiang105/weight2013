unit SetPassword;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls;

type
  TSetPasForm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    BitBtn2: TBitBtn;
    LoginName: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure LoginNameEnter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SetPasForm: TSetPasForm;

implementation

uses DBDataModule;

{$R *.dfm}

procedure TSetPasForm.BitBtn1Click(Sender: TObject);
var oldpas, newpas: string;
begin
  if LabeledEdit1.Text = '' then
    oldpas := 'null'
  else
    oldpas := LabeledEdit1.Text;
  if LabeledEdit2.Text = '' then
    newpas := 'null'
  else
    newpas := #39 + LabeledEdit2.Text + #39;
  with DataModuleDB do
  begin
    ADOQueryAddDB.Close;
    ADOQueryAddDB.SQL.Clear;
    ADOQueryAddDB.SQL.Add('sp_password @old = ' + oldpas + ', @new =' + newpas + ', @loginame =' + LoginName.Text);
    try
      ADOQueryAddDB.ExecSQL;
      MessageBox(0, PChar('修改密码成功！'), '提示', MB_OK + MB_ICONINFORMATION);
      ADOQueryAddDB.Close;
      LabeledEdit1.Clear;
      LabeledEdit2.Clear;
      SetPasForm.Close;
    except
      on E: Exception do
      begin
        MessageBox(0, PChar(E.Message), '警告', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    end;
  end;
end;

procedure TSetPasForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TSetPasForm.LoginNameEnter(Sender: TObject);
begin
  LoginName.Items.Clear;
  with DataModuleDB.ADOQueryAddDB do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select name from sysxlogins');
    Open;
    First;
    while not Eof do
    begin
      LoginName.Items.Add(FieldByName('name').asString);
      Next;
    end;
  end;
end;

end.

