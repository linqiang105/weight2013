unit Log;

interface

uses
  Classes, Controls, Forms, SysUtils, Windows,
  Dialogs, StdCtrls, DBGridEh, ExtCtrls, PrnDbgeh,
  ComCtrls, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping;

type
  TLogForm = class(TForm)
    DBGrid1: TDBGridEh;
    Panel1: TPanel;
    BtnPrint: TButton;
    BtnExport: TButton;
    PrintDBGridEh1: TPrintDBGridEh;
    SaveDialog1: TSaveDialog;
    DTPStart: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure DTPStartChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogForm: TLogForm;

implementation

uses QueryDM, CommonUtil;

{$R *.dfm}

procedure TLogForm.FormShow(Sender: TObject);
begin
  DBGrid1.DataSource := QueryDataModule.DSLog;
  DTPStart.Date := Date;
  DTPEnd.Date := Date;
  with QueryDataModule.ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 日志 where 时间 between :start and :end order by 序号 desc');
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-mm-dd 00:00:00', DTPStart.Date);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-mm-dd 23:59:59', DTPEnd.Date);
    Open
  end
end;

procedure TLogForm.BtnPrintClick(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGrid1;
  PrintDBGridEh1.Preview;
end;

procedure TLogForm.BtnExportClick(Sender: TObject);
begin
  if TCommonUtil.exportExcel(DBGrid1) then
    Application.MessageBox('数据导出成功!', '警告', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TLogForm.DTPStartChange(Sender: TObject);
begin
  with QueryDataModule.ADOQLog do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 日志 where 时间 between :start and :end order by 序号 desc');
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-mm-dd 00:00:00', DTPStart.Date);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-mm-dd 23:59:59', DTPEnd.Date);
    Open
  end
end;

end.

