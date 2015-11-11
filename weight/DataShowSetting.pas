unit DataShowSetting;

interface

uses
  Classes, Controls, Forms, StdCtrls, Buttons, ExtCtrls,
  DBGridEh, Spin;

type
  TDataShowSettingForm = class(TForm)
    PBack: TPanel;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    lblFix: TLabel;
    lblCol: TLabel;
    SEFrozenCol: TSpinEdit;
    SBHide: TSpeedButton;
    SBShow: TSpeedButton;
    PTool: TPanel;
    GBVisible: TGroupBox;
    LBVisibleCol: TListBox;
    GBValid: TGroupBox;
    LBValidCol: TListBox;
    procedure FormShow(Sender: TObject);
    procedure LBValidColDblClick(Sender: TObject);
    procedure LBVisibleColDblClick(Sender: TObject);
    procedure SBHideClick(Sender: TObject);
    procedure SBShowClick(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    visibleFieldString, visibleTitleString: TStringList;
    notVisibleFieldString, notVisibleTitleString: TStringList;
  public
    { Public declarations }
    DBGridEh1: TDBGridEh;
    procedure ShowCol;
    procedure HideCol;
  end;

var
  DataShowSettingForm: TDataShowSettingForm;

implementation

uses Main;

{$R *.dfm}

procedure TDataShowSettingForm.FormShow(Sender: TObject);
var i: Integer;
begin
  visibleFieldString.Clear;
  visibleTitleString.Clear;
  notVisibleFieldString.Clear;
  notVisibleTitleString.Clear;
  for i := 0 to MainForm.DBGridEh1.FieldCount - 1 do
  begin
    if DBGridEh1.Columns[i].Visible then
    begin
      visibleFieldString.Add(DBGridEh1.Columns[i].FieldName);
      visibleTitleString.Add(DBGridEh1.Columns[i].Title.Caption);
      LBVisibleCol.Items.Add(DBGridEh1.Columns[i].Title.Caption)
    end
    else
    begin
      notVisibleFieldString.Add(DBGridEh1.Columns[i].FieldName);
      notVisibleTitleString.Add(DBGridEh1.Columns[i].Title.Caption);
      LBValidCol.Items.Add(DBGridEh1.Columns[i].Title.Caption);
    end
  end;
end;

procedure TDataShowSettingForm.HideCol;
begin
  if LBVisibleCol.ItemIndex <> -1 then
  begin
    LBValidCol.Items.Add(LBVisibleCol.Items.Strings[LBVisibleCol.ItemIndex]);
    notVisibleFieldString.Add(visibleFieldString.Strings[LBVisibleCol.ItemIndex]);
    notVisibleTitleString.Add(visibleTitleString.Strings[LBVisibleCol.ItemIndex]);

    visibleFieldString.Delete(LBVisibleCol.ItemIndex);
    visibleTitleString.Delete(LBVisibleCol.ItemIndex);
    LBVisibleCol.Items.Delete(LBVisibleCol.ItemIndex);

  end;
end;

procedure TDataShowSettingForm.ShowCol;
begin
  if LBValidCol.ItemIndex <> -1 then
  begin
    LBVisibleCol.Items.Add(LBValidCol.Items.Strings[LBValidCol.ItemIndex]);
    visibleFieldString.Add(notVisibleFieldString.Strings[LBValidCol.ItemIndex]);
    visibleTitleString.Add(notVisibleTitleString.Strings[LBValidCol.ItemIndex]);

    notVisibleFieldString.Delete(LBValidCol.ItemIndex);
    notVisibleTitleString.Delete(LBValidCol.ItemIndex);
    LBValidCol.Items.Delete(LBValidCol.ItemIndex);
  end
end;

procedure TDataShowSettingForm.LBValidColDblClick(Sender: TObject);
begin
  ShowCol;
end;

procedure TDataShowSettingForm.LBVisibleColDblClick(Sender: TObject);
begin
  HideCol;
end;

procedure TDataShowSettingForm.SBHideClick(Sender: TObject);
begin
  HideCol;
end;

procedure TDataShowSettingForm.SBShowClick(Sender: TObject);
begin
  ShowCol;
end;

procedure TDataShowSettingForm.BitBtnOKClick(Sender: TObject);
var i: Integer;
begin
  for i := 0 to LBVisibleCol.Items.count - 1 do //在可见框内
  begin
    DBGridEh1.FieldColumns[visibleFieldString.Strings[i]].Visible := True;
  end;
  for i := 0 to LBValidCol.Items.count - 1 do //在可用框内
  begin
    DBGridEh1.FieldColumns[notVisibleFieldString.Strings[i]].Visible := False;
  end;
  try
    DBGridEh1.FrozenCols := SEFrozenCol.Value;
  except
    SEFrozenCol.Value := 0
  end;
end;

procedure TDataShowSettingForm.FormCreate(Sender: TObject);
begin
  visibleFieldString := TStringList.Create;
  visibleTitleString := TStringList.Create;
  notVisibleFieldString := TStringList.Create;
  notVisibleTitleString := TStringList.Create;
end;

procedure TDataShowSettingForm.FormDestroy(Sender: TObject);
begin
  visibleFieldString.Free;
  visibleTitleString.Free;
  notVisibleFieldString.Free;
  notVisibleTitleString.Free;
end;

end.
d.

