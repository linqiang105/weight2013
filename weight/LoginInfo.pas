unit LoginInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TLoginInfoForm = class(TForm)
    lblLoginTitle: TLabel;
    lblLoginInfo: TLabel;
    lblMainTitle: TLabel;
    EdtLoginTitle: TEdit;
    EdtMainTitle: TEdit;
    MemoLoginInfo: TMemo;
    BitBtnOk: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnSetPass: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnSetPassClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LoginInfoForm: TLoginInfoForm;

implementation

uses
  IniFiles, CommonUtil;

{$R *.dfm}

procedure TLoginInfoForm.FormShow(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create('weightSysInfo.ini');
  try
    EdtLoginTitle.Text := myini.ReadString('system_set', 'login_title', '称重管理系统');
    MemoLoginInfo.Text := myini.ReadString('system_set', 'login_info', '');
    EdtMainTitle.Text := myini.ReadString('system_set', 'main_title', '称重管理系统');
  finally
    myini.Free;
  end;
end;

procedure TLoginInfoForm.BitBtnOkClick(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create('weightSysInfo.ini');
  try
    myini.WriteString('system_set', 'login_title', EdtLoginTitle.Text);
    myini.WriteString('system_set', 'login_info', MemoLoginInfo.Text);
    myini.WriteString('system_set', 'main_title', EdtMainTitle.Text);
    Close;
  finally
    myini.Free;
  end;
end;

procedure TLoginInfoForm.BitBtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TLoginInfoForm.BitBtnSetPassClick(Sender: TObject);
var s: string;
  myini: TIniFile;
begin
  s := InputBox('', '请输入新密码      ', '');
  if s <> '' then
  begin
    myini := TIniFile.Create('weightSysInfo.ini');
    try
      myini.WriteString('system_set', 'pass', TCommonUtil.compressAndBase64(s));
    finally
      myini.Free;
    end;
  end;
end;

end.

