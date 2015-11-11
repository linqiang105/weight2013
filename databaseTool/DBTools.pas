unit DBTools;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  StdCtrls, Buttons, ExtCtrls, Graphics, Registry;

type
  TDBToolForm = class(TForm)
    LabelUser: TLabel;
    EditUser: TEdit;
    EditPassword: TEdit;
    GroupBoxUser: TGroupBox;
    LabelPassword: TLabel;
    GroupBox1: TGroupBox;
    LabelIP: TLabel;
    Panel1: TPanel;
    ConnectionBtn: TBitBtn;
    AttachBtn: TBitBtn;
    DetchBtn: TBitBtn;
    BjBtn: TBitBtn;                               
    LoginName: TComboBox;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    LoginMode: TComboBox;
    BitBtn1: TBitBtn;
    NTCheck: TRadioButton;
    SQLCheck: TRadioButton;
    SetPasBtn: TBitBtn;
    BitBtn3: TBitBtn;
    procedure AttachBtnClick(Sender: TObject);
    procedure ConnectionBtnClick(Sender: TObject);
    procedure BjBtnClick(Sender: TObject);
    procedure DetchBtnClick(Sender: TObject);
    procedure NTCheckClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SQLCheckClick(Sender: TObject);
    procedure LabelUserClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SetPasBtnClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DBToolForm: TDBToolForm;


implementation

uses InputDBFile, DBDataModule, ApartDBfile, SetPassword, SelectServer;

{$R *.dfm}

procedure TDBToolForm.ConnectionBtnClick(Sender: TObject);
var connStr: string; //数据库字段
begin
  connStr := 'Provider=SQLOLEDB.1;'; //OLE DB连接程序
  if NTCheck.Checked then //验证方式
    connStr := connStr + 'Integrated Security=SSPI;'
  else
  begin
    if EditPassword.text = '' then
    begin
      connStr := connStr + 'User ID=' + Trim(EditUser.text) + ';';
    end
    else
    begin
      connStr := connStr + 'User ID=' + Trim(EditUser.text) + ';Password='
        + Trim(EditPassword.text) + ';';
    end;
  end;
  connStr := connStr + 'Persist Security Info=True;Initial Catalog=master;Data Source='
    + Trim(LoginName.text);
  with DataModuleDB do
  try
    ADOConnectionDB.close;
    ADOConnectionDB.ConnectionString := connStr;
    ADOConnectionDB.Open;
    MessageBox(0, '连接服务器成功！', '提示', MB_OK + MB_ICONINFORMATION);
    AttachBtn.Enabled := true;
    DetchBtn.Enabled := true;
    SetPasBtn.Enabled := true;
  except on E: Exception do
    begin
      MessageBox(0, pchar(E.Message), '警告', MB_OK + MB_ICONWARNING);
    end;
  end;
end;

procedure TDBToolForm.BjBtnClick(Sender: TObject);
var ComputerName: array[0..16] of char;
  Size: Cardinal;
begin
  Size := 16;
  GetComputerName(ComputerName, Size);
  LoginName.text := ComputerName;
end;

procedure TDBToolForm.AttachBtnClick(Sender: TObject);
begin
  try
    Application.CreateForm(TInputDBFileForm, InputDBFileForm);
    InputDBFileForm.ShowModal;
  finally
    InputDBFileForm.Free;
  end;
end;

procedure TDBToolForm.DetchBtnClick(Sender: TObject);
begin
  try
    Application.CreateForm(TApartDBfileForm, ApartDBfileForm);
    ApartDBfileForm.ShowModal;
  finally
    ApartDBfileForm.Free;
  end;
end;

procedure TDBToolForm.NTCheckClick(Sender: TObject);
begin
  if NTCheck.Checked then
  begin
    LabelUser.Enabled := false;
    LabelPassword.Enabled := false;
    EditUser.text := '';
    EditUser.Enabled := false;
    EditUser.Color := clBtnFace;
    EditPassword.text := '';
    EditPassword.Enabled := false;
    EditPassword.Color := clBtnFace;
  end;
end;

procedure TDBToolForm.FormShow(Sender: TObject);
var MyReg: TRegistry;
begin
  MyReg := TRegistry.Create;
  try
    MyReg.RootKey := HKEY_LOCAL_MACHINE;
    MyReg.OpenKey('Software\Microsoft\MSSqlserver\MSSqlServer\', false);
    if not MyReg.KeyExists('LoginMode') then
    begin
       LoginMode.ItemIndex := 0;
       Exit;
    end;
    if MyReg.ReadInteger('LoginMode') = 2 then
    begin
      LoginMode.ItemIndex := 1
    end
    else
      LoginMode.ItemIndex := 0;
  finally
    MyReg.Free;
  end;
end;

procedure TDBToolForm.SQLCheckClick(Sender: TObject);
begin
  if SQLCheck.Checked then
  begin
    LabelUser.Enabled := true;
    EditUser.Enabled := true;
    EditUser.Color := clWindow;
    LabelPassword.Enabled := true;
    EditPassword.Enabled := true;
    EditPassword.Color := clWindow;
  end;
end;

procedure TDBToolForm.LabelUserClick(Sender: TObject);
begin
  EditUser.SetFocus;
end;

procedure TDBToolForm.BitBtn1Click(Sender: TObject);
var MyReg: TRegistry;
begin
  MyReg := TRegistry.Create;
  try
    MyReg.RootKey := HKEY_LOCAL_MACHINE;
    MyReg.OpenKey('Software\Microsoft\MSSqlserver\MSSqlServer\', false);
    if LoginMode.ItemIndex = 1 then
      MyReg.WriteInteger('LoginMode', 2)
    else if LoginMode.ItemIndex = 0 then
      MyReg.WriteInteger('LoginMode', 1);
  finally
    MyReg.Free;
  end;
end;

procedure TDBToolForm.SetPasBtnClick(Sender: TObject);
begin
  try
    Application.CreateForm(TSetPasForm, SetPasForm);
    SetPasForm.ShowModal;
  finally
    SetPasForm.Free;
  end;
end;

procedure TDBToolForm.BitBtn3Click(Sender: TObject);
begin
  try
    Application.CreateForm(TSelectServerForm, SelectServerForm);
    SelectServerForm.ShowModal;
  finally
    SelectServerForm.Free;
  end;
end;

end.

