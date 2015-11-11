unit Pay;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEh, StdCtrls, GridsEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TPayForm = class(TForm)
    DBGridEhShouHuo: TDBGridEh;
    Panel1: TPanel;
    BtnOk: TButton;
    BtnCancel: TButton;
    LECode: TLabeledEdit;
    LEShouHuo: TLabeledEdit;
    LESum: TLabeledEdit;
    LECredit: TLabeledEdit;
    procedure FormShow(Sender: TObject);
    procedure DBGridEhShouHuoCellClick(Column: TColumnEh);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PayForm: TPayForm;

implementation

uses
  QueryDM, PayUtil;

{$R *.dfm}

procedure TPayForm.FormShow(Sender: TObject);
begin
  DBGridEhShouHuo.DataSource := QueryDataModule.DSPay;
  TPayUtil.showCompany;
end;

procedure TPayForm.DBGridEhShouHuoCellClick(Column: TColumnEh);
begin
  LECode.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('代码').AsString;
  LEShouHuo.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('收货单位').AsString;
  LESum.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('当前金额').AsString;
  LECredit.Text := DBGridEhShouHuo.DataSource.DataSet.FieldByName('信用额度').AsString;
end;

procedure TPayForm.BtnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TPayForm.BtnOkClick(Sender: TObject);
var p: string;
begin
  p := InputBox('提示', '请输入要充值的金额', '0');
  if TPayUtil.charge(LEShouHuo.Text, p) then
  begin
    Application.MessageBox(PChar(Format('充值成功！%s当前余额为%s，信用额度为%s！',
      [LEShouHuo.Text, FloatToStr(StrToFloatDef(LESum.Text, 0) + StrToFloatDef(p, 0)), FloatToStr(StrToFloatDef(LECredit.Text, 0))])), '提示', MB_OK + MB_ICONINFORMATION);
    TPayUtil.showCompany;
  end
  else
  begin
    Application.MessageBox('充值失败，请确认参数！', '提示', MB_OK +
      MB_ICONSTOP);
  end;
end;

end.

