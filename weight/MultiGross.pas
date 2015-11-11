unit MultiGross;

interface

uses
  Classes, Controls, Forms, Windows,
  DBGridEh, GridsEh, ToolCtrlsEh, DBGridEhToolCtrls,
  DBAxisGridsEh, DBGridEhGrouping;

type
  TMultiGrossForm = class(TForm)
    DBGridEhMulti: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure DBGridEhMultiDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    UpdateRecNo: string;
  end;

var
  MultiGrossForm: TMultiGrossForm;

implementation

uses QueryDM, Main;

{$R *.dfm}

procedure TMultiGrossForm.FormShow(Sender: TObject);
var i: Integer;
  fn: string;
begin
  for i := 0 to MainForm.DBGridEh1.FieldCount - 1 do
  begin
    fn := MainForm.DBGridEh1.Fields[i].FieldName;
    DBGridEhMulti.FieldColumns[fn].Title.Caption := MainForm.DBGridEh1.FieldColumns[fn].Title.Caption;
    DBGridEhMulti.FieldColumns[fn].Visible := MainForm.DBGridEh1.FieldColumns[fn].Visible;
  end;
  for i := 0 to DBGridEhMulti.Columns.Count - 1 do
  begin
    DBGridEhMulti.Columns[i].Width := MainForm.DBGridEh1.Columns[i].Width;
  end;
  DBGridEhMulti.DataSource := QueryDataModule.DSMultiGross;
  updateRecNo := '';
end;

procedure TMultiGrossForm.FormCloseQuery(Sender: TObject;
  var CanClose: boolean);
begin
  if UpdateRecNo = '' then
  begin
    MessageBox(0, '请双击选择一条记录以补全当前信息!', '提示', MB_OK +
      MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
    CanClose := false;
  end;
end;

procedure TMultiGrossForm.DBGridEhMultiDblClick(Sender: TObject);
begin
  UpdateRecNo := DBGridEhMulti.DataSource.DataSet.FieldByName('流水号').AsString;
  Close;
end;

end.

