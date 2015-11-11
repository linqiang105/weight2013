unit PayHistory;

interface

uses
  SysUtils, Classes, Controls, Forms,
  ExtCtrls, DBGridEh, StdCtrls, PrnDbgeh, ComCtrls, GridsEh,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TPayHistoryForm = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    PrintDBGridEh1: TPrintDBGridEh;
    BtnPrint: TButton;
    BtnExport: TButton;
    DTPStart: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
    procedure DTPEndChange(Sender: TObject);
    procedure DTPStartChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PayHistoryForm: TPayHistoryForm;

implementation

uses
  CommonUtil, QueryDM, PayUtil;

{$R *.dfm}

procedure TPayHistoryForm.FormShow(Sender: TObject);
begin
  DTPStart.Date := Date;
  DTPEnd.Date := Date;
  DBGridEh1.DataSource := QueryDataModule.DSPayHistory;
  TPayUtil.showHistory(DTPStart.Date, DTPEnd.Date);
end;

procedure TPayHistoryForm.BtnPrintClick(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGridEh1;
  PrintDBGridEh1.Preview;
end;

procedure TPayHistoryForm.BtnExportClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEh1);
end;

procedure TPayHistoryForm.DTPEndChange(Sender: TObject);
begin
  TPayUtil.showHistory(DTPStart.Date, DTPEnd.Date);
end;

procedure TPayHistoryForm.DTPStartChange(Sender: TObject);
begin
  TPayUtil.showHistory(DTPStart.Date, DTPEnd.Date);
end;

end.

