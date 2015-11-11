unit ScanReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh,
  DBAxisGridsEh, DBGridEh, ExtCtrls, RzButton, StdCtrls, Mask, RzEdit;

type
  TScanReportForm = class(TForm)
    DBGridEhScan: TDBGridEh;
    PTools: TPanel;
    BtnPrint: TRzBitBtn;
    LBGlideNos: TListBox;
    EdtGlideNo: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure EdtGlideNoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LBGlideNosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScanReportForm: TScanReportForm;

implementation

uses
  ReportUtil, QueryDM, Main, DataQuery, OtherUtil;

{$R *.dfm}

procedure TScanReportForm.FormShow(Sender: TObject);
var i: Integer;
  fn: string;
begin
  TReportUtil.showScanRecord(LBGlideNos.Items);
  DBGridEhScan.DataSource := QueryDataModule.WeightMaintainDS;
  DBGridEhScan.SumList.Active := MainForm.systemConfig.showSumList;
  for i := 0 to MainForm.DBGridEh1.FieldCount - 1 do
  begin
    fn := MainForm.DBGridEh1.Fields[i].FieldName;
    DBGridEhScan.FieldColumns[fn].Title.Caption := MainForm.DBGridEh1.FieldColumns[fn].Title.Caption;
    DBGridEhScan.FieldColumns[fn].Visible := MainForm.DBGridEh1.FieldColumns[fn].Visible;
  end;
  for i := 0 to DBGridEhScan.Columns.Count - 1 do
  begin
    DBGridEhScan.Columns[i].Width := MainForm.DBGridEh1.Columns[i].Width;
  end;

  EdtGlideNo.SetFocus;
end;

procedure TScanReportForm.BtnPrintClick(Sender: TObject);
begin

  if not TUserUtil.HasAuthority('打印报表') then
    Exit;

  if MessageBox(0, '将打印这些记录，是否继续？', '提示', MB_YESNO +
    MB_ICONQUESTION + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
  begin

    if DataQueryForm.CBReport.ItemIndex = -1 then
      Exit; 

    QueryDataModule.frxReportReport.LoadFromFile(ExtractFilePath(ParamStr(0))
      + 'Report\' + DataQueryForm.CBReport.Items[DataQueryForm.CBReport.ItemIndex] + '.fr3');
    QueryDataModule.frxReportReport.Variables['startDate1'] := DataQueryForm.DTPStartDate1.Date;
    QueryDataModule.frxReportReport.Variables['startTime1'] := DataQueryForm.DTPStartTime1.Time;
    QueryDataModule.frxReportReport.Variables['endDate1'] := DataQueryForm.DTPEndDate1.Date;
    QueryDataModule.frxReportReport.Variables['endTime1'] := DataQueryForm.DTPEndTime1.Time;

    QueryDataModule.frxReportReport.Variables['startDate2'] := DataQueryForm.DTPStartDate1.Date;
    QueryDataModule.frxReportReport.Variables['startTime2'] := DataQueryForm.DTPStartTime1.Time;
    QueryDataModule.frxReportReport.Variables['endDate2'] := DataQueryForm.DTPEndDate1.Date;
    QueryDataModule.frxReportReport.Variables['endDate2'] := DataQueryForm.DTPEndTime1.Time;

    QueryDataModule.frxReportReport.ShowReport();
  end;
end;

procedure TScanReportForm.EdtGlideNoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    LBGlideNos.Items.Add(EdtGlideNo.Text);
    TReportUtil.showScanRecord(LBGlideNos.Items);
    EdtGlideNo.Clear;
    EdtGlideNo.SetFocus;
  end
  else if key = VK_F12 then
  begin
    BtnPrint.Click;
  end;
end;

procedure TScanReportForm.LBGlideNosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    LBGlideNos.Items.Delete(LBGlideNos.ItemIndex);
    TReportUtil.showScanRecord(LBGlideNos.Items);
  end;
end;

procedure TScanReportForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    EdtGlideNo.SetFocus;
  end;
end;

end.

