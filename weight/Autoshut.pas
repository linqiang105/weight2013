unit Autoshut;

interface

uses
  Windows, Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TAutoShutForm = class(TForm)
    TClose: TTimer;
    BtnClose: TBitBtn;
    BtnCancel: TBitBtn;
    PBClose: TProgressBar;
    Label1: TLabel;
    procedure TCloseTimer(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AutoShutForm: TAutoShutForm;

implementation

uses Main, CommonUtil;

{$R *.dfm}

procedure TAutoShutForm.TCloseTimer(Sender: TObject);
begin
  if PBClose.Position = 100 then
    BtnClose.Click
  else
    PBClose.Position := PBClose.Position + 5
end;

procedure TAutoShutForm.BtnCloseClick(Sender: TObject);
begin
  TCommonUtil.ExitWin32Sys(EWX_POWEROFF)
end;

procedure TAutoShutForm.BtnCancelClick(Sender: TObject);
begin
  TClose.Enabled := False;
  MainForm.TAutoShut.Enabled := False;
end;

procedure TAutoShutForm.FormShow(Sender: TObject);
begin
  TClose.Enabled := True;
end;

end.

