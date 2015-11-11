unit RegCode;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Registry, DateUtils;

type
  TRegCodeForm = class(TForm)
    btnReg: TBitBtn;
    edtRegCode: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    edtIDE: TEdit;
    BtnUnReg: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnUnRegClick(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure WriteRegistryCode(); //写入注册码到注册表中
    function useDateExist(): Boolean; //是否已经使用过软件
    procedure writeUseDate(te: integer = 0); //写入第一次使用时间 ,参数为0时写入当前时间，否则写入当前时间前30天
    function getUseDate(): TDateTime; //读取第一次使用时间
  end;

var
  RegCodeForm: TRegCodeForm;

implementation

uses Reg, Main;

{$R *.DFM}

procedure TRegCodeForm.FormShow(Sender: TObject);
begin
  EdtIDE.Text := GetNewEncodeKey();
end;

procedure TRegCodeForm.BtnUnRegClick(Sender: TObject);
begin
  Close;
end;

procedure TRegCodeForm.btnRegClick(Sender: TObject);
begin
  MainForm.N2.Visible := not (EdtRegCode.Text = RegisterCode(EdtIDE.Text));
  WriteRegistryCode();
  Close;
end;

procedure TRegCodeForm.WriteRegistryCode;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      reg.WriteString('RegistryCode', edtRegCode.Text);
    end;
  finally
    reg.Free;
  end;
end;

procedure TRegCodeForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var useDate: TDateTime;
begin
  //如果没有记录第一次使用时间，就写入第一次使用时间
  //否则比较第一次使用时间和当前时间，如果超过一个月，就要求输入注册码
  if not useDateExist then
  begin
    writeUseDate;
  end
  else
  begin
    try
      useDate := getUseDate();
    except
      useDate := Now - 60;
      writeUseDate(1);
    end;
    if DaysBetween(Now, useDate) < 30 then
      CanClose := True
    else if EdtRegCode.Text <> RegisterCode(GetNewEncodeKey) then
    begin
      MessageDlg('请输入正确的注册码', mtInformation, [mbOK], 0);
      CanClose := False;
    end
  end
end;

function TRegCodeForm.useDateExist: Boolean;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      result := Reg.ValueExists('useDate');
    end;
  finally
    reg.Free;
  end;
end;

procedure TRegCodeForm.writeUseDate(te: integer);
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      if te = 0 then
        reg.WriteDateTime('useDate', now)
      else
        reg.WriteDateTime('useDate', now - 30)
    end;
  finally
    reg.Free;
  end;
end;

function TRegCodeForm.getUseDate: TDateTime;
var Reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\Weight', True) then
    begin
      result := reg.ReadDateTime('useDate');
    end;
  finally
    reg.Free;
  end;
end;

end.

