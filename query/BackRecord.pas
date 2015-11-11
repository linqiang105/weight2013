unit BackRecord;

interface

uses
  SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PrnDbgeh, DBGridEh, DBGridEhImpExp,
  ComCtrls, GridsEh, Buttons, Menus, ToolCtrlsEh,
  DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TBackRecordForm = class(TForm)
    DBGrid1: TDBGridEh;
    PrintDBGridEh1: TPrintDBGridEh;
    Panel1: TPanel;
    GBCondition: TGroupBox;
    DTP: TDateTimePicker;
    RBAll: TRadioButton;
    RBNotWeight: TRadioButton;
    RBWeight: TRadioButton;
    BtnPrint: TBitBtn;
    BtnExport: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure BtnPrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure BtnExportClick(Sender: TObject);
    procedure DTPChange(Sender: TObject);
    procedure RBAllClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure showBackRecord();
  end;

var
  BackRecordForm: TBackRecordForm;

implementation

uses QueryDM, CommonUtil, OtherUtil;

{$R *.dfm}

procedure TBackRecordForm.BtnPrintClick(Sender: TObject);
begin
  PrintDBGridEh1.DBGridEh := DBGrid1;
  PrintDBGridEh1.Preview;
end;

procedure TBackRecordForm.FormShow(Sender: TObject);
begin
  DTP.DateTime := Date;
  DBGrid1.DataSource := QueryDataModule.DSBackRecord;
  N1.Enabled := TUserUtil.HasAuthority('É¾³ý¼ÇÂ¼');
  showBackRecord;
end;

procedure TBackRecordForm.DBGrid1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if QueryDataModule.ADOQBackRecord.Sort <> (Column.FieldName + ' ASC') then
    //ÅÐ¶ÏÔ­ÅÅÐò·½Ê½
    QueryDataModule.ADOQBackRecord.Sort := Column.FieldName + ' ASC'
  else
    QueryDataModule.ADOQBackRecord.Sort := Column.FieldName + ' DESC'
end;

procedure TBackRecordForm.BtnExportClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGrid1);
end;

procedure TBackRecordForm.showBackRecord;
begin
  with QueryDataModule.ADOQExec do
  begin
    Close;
    SQL.Text := 'select top 1 flag from tbl_back_record';
    try
      Open;
    except
      SQL.Text := 'alter table tbl_back_record add [flag] bit default 0';
      ExecSQL;
    end;
  end;
  with QueryDataModule.ADOQBackRecord do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from tbl_back_record where (weight_time between :start and :end)');
    if not RBAll.Checked then
      SQL.Add(' and (flag=:flag)');
    SQL.Add(' order by id desc');
    Parameters.ParamByName('start').Value := FormatDateTime('yyyy-mm-dd 00:00:00', DTP.Date);
    Parameters.ParamByName('end').Value := FormatDateTime('yyyy-mm-dd 23:59:59', DTP.Date);
    if RBNotWeight.Checked then
      Parameters.ParamByName('flag').Value := False
    else if RBWeight.Checked then
      Parameters.ParamByName('flag').Value := True;
    Open
  end
end;

procedure TBackRecordForm.DTPChange(Sender: TObject);
begin
  showBackRecord;
end;

procedure TBackRecordForm.RBAllClick(Sender: TObject);
begin
  showBackRecord;
end;

procedure TBackRecordForm.N1Click(Sender: TObject);
begin
  try
    DBGrid1.DataSource.DataSet.Delete;
  except
  end;
end;

end.

