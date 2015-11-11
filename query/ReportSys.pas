unit ReportSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzTreeVw, frxClass, RzButton, StdCtrls,
  ExtCtrls, RzPanel, RzSplit, frxDBSet, frxDesgn, DB, ADODB,
  Menus;

type
  TReportSysForm = class(TForm)
    tvReport: TRzTreeView;
    PTool: TRzSizePanel;
    MemoSQL: TMemo;
    BtnSave: TRzBitBtn;
    ADOQReport: TADOQuery;
    frxReport3: TfrxReport;
    frxDBDataset3: TfrxDBDataset;
    PMReport: TPopupMenu;
    NModifyTicket: TMenuItem;
    NRename: TMenuItem;
    NDelete: TMenuItem;
    N4: TMenuItem;
    NCopy: TMenuItem;
    N6: TMenuItem;
    NRefresh: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure tvReportDblClick(Sender: TObject);
    procedure NModifyTicketClick(Sender: TObject);
    procedure NRenameClick(Sender: TObject);
    procedure tvReportChange(Sender: TObject; Node: TTreeNode);
    procedure NDeleteClick(Sender: TObject);
    procedure NCopyClick(Sender: TObject);
    procedure NRefreshClick(Sender: TObject);
  private
    { Private declarations }
    currentNode: string;
  public
    { Public declarations }
    procedure refreshTree;
    procedure GetDirectories(Tree: TRzTreeView; Directory: string;
      Item: TTreeNode; IncludeFiles: Boolean);
    function reportFileExists(filename: string): Boolean;
    function renameReportFile(filename, newFilename: string): Boolean;
    function readReportSQL(filename: string): string;
    procedure updateReportSQL(filename: string; sql: string);
    procedure DeleteReportFile(filename: string);
    procedure CopyReportFile(filename, newFilename: string);
  end;

var
  ReportSysForm: TReportSysForm;

implementation

uses
  StrUtils, QueryDM, Filter;

{$R *.dfm}

procedure TReportSysForm.GetDirectories(Tree: TRzTreeView; Directory: string;
  Item: TTreeNode; IncludeFiles: Boolean);
var
  SearchRec: TSearchRec;
  ItemTemp: TTreeNode;
begin
  Tree.Items.BeginUpdate;
  if Directory[Length(Directory)] <> '\' then
    Directory := Directory + '\';
  if FindFirst(Directory + '*.*', faDirectory, SearchRec) = 0 then
  begin
    repeat
      if (SearchRec.Attr and faDirectory = faDirectory) and (SearchRec.Name[1] <> '.') then
      begin
        if (SearchRec.Attr and faDirectory > 0) then
          Item := Tree.Items.AddChild(Item, SearchRec.Name);
        ItemTemp := Item.Parent;
        GetDirectories(Tree, Directory + SearchRec.Name, Item, IncludeFiles);
        Item := ItemTemp;
      end
      else
      begin
        if IncludeFiles then
        begin
          if (SearchRec.Name[1] <> '.') and (RightStr(SearchRec.Name, 3) = 'fr3') then
          begin
            Tree.Items.AddChild(Item, SearchRec.Name);
          end;
        end;
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
    Tree.Items.EndUpdate;
  end;
end;


procedure TReportSysForm.FormShow(Sender: TObject);
begin
  ADOQReport.Connection := QueryDataModule.DBConnection;
  RefreshTree();
end;

procedure TReportSysForm.BtnSaveClick(Sender: TObject);
begin
  if currentNode = '' then
    Exit;
  try
    updateReportSQL(currentNode, MemoSQL.Text);
    Application.MessageBox('脚本更新成功！', '提示', MB_OK + MB_ICONINFORMATION
      + MB_DEFBUTTON2 + MB_TOPMOST);
  except
  end;
end;

procedure TReportSysForm.tvReportDblClick(Sender: TObject);
var s: string;
  n: TTreeNode;
begin
  MemoSQL.Clear;
  if RightStr(tvReport.Selected.Text, 3) = 'fr3' then
  begin
    n := tvReport.Selected;
    while n.Parent <> nil do
    begin
      s := n.Parent.Text + '\' + s;
      n := n.Parent;
    end;
    currentNode := s + tvReport.Selected.Text;
    if ReportFileExists(currentNode) then
    begin
      MemoSQL.Text := readReportSQL(currentNode);
      Application.CreateForm(TFilterForm, FilterForm);
      try

        with ADOQReport do
        begin
          Close;
          SQL.Clear;
          FilterForm.adoqReport := ADOQReport;
          FilterForm.ShowModal;
          if FilterForm.ret = '' then
            Exit;
          SQL.Text := Format(MemoSQL.Text, [FilterForm.ret]);
          Open;

          if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
          begin
            frxReport3.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode);

            frxReport3.Variables['startDate1'] := FilterForm.DTPStartDate1.Date;
            frxReport3.Variables['startTime1'] := FilterForm.DTPStartTime1.Time;
            frxReport3.Variables['endDate1'] := FilterForm.DTPEndDate1.Date;
            frxReport3.Variables['endTime1'] := FilterForm.DTPEndTime1.Time;
            frxReport3.Variables['startDate2'] := FilterForm.DTPStartDate2.Date;
            frxReport3.Variables['startTime2'] := FilterForm.DTPStartTime2.Time;
            frxReport3.Variables['endDate2'] := FilterForm.DTPEndDate2.Date;
            frxReport3.Variables['endDate2'] := FilterForm.DTPEndTime2.Time;

            frxReport3.ShowReport();
          end;

        end;

      finally
        FilterForm.Free;
      end;
    end;
  end;
end;

procedure TReportSysForm.NModifyTicketClick(Sender: TObject);
begin
  if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
  begin
    frxReport3.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode);
    frxReport3.DesignReport();
  end;
end;

procedure TReportSysForm.NRenameClick(Sender: TObject);
var newNode: string;
begin
  //重命名:文件重命名+INI文件Section改名
  if currentNode <> '' then
  begin
    newNode := InputBox('请输入新名称      ', '', currentNode);
    renameReportFile(currentNode, newNode);
    if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
    begin
      RenameFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode,
        ExtractFilePath(ParamStr(0)) + 'ReportII\' + newNode);
    end;
    RefreshTree();
  end;
end;

procedure TReportSysForm.tvReportChange(Sender: TObject; Node: TTreeNode);
var s: string;
  n: TTreeNode;
begin
  MemoSQL.Clear;
  if RightStr(tvReport.Selected.Text, 3) = 'fr3' then
  begin
    n := tvReport.Selected;
    while n.Parent <> nil do
    begin
      s := n.Parent.Text + '\' + s;
      n := n.Parent;
    end;
    currentNode := s + tvReport.Selected.Text;
    MemoSQL.Text := readReportSQL(currentNode);
  end;
end;

procedure TReportSysForm.NDeleteClick(Sender: TObject);
begin
  if Application.MessageBox('你确定要删除这张报表吗?', '警告', MB_YESNO +
    MB_ICONWARNING + MB_DEFBUTTON2 + MB_TOPMOST) = IDNO then
  begin
    Exit;
  end;

  if currentNode <> '' then
  begin
    DeleteReportFile(currentNode);
    if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
    begin
      DeleteFile(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode);
    end;
    RefreshTree();
  end;
end;

procedure TReportSysForm.NCopyClick(Sender: TObject);
var newNode: string;
begin
  //重命名:文件重命名+INI文件Section改名
  if currentNode <> '' then
  begin
    newNode := InputBox('请输入新名称      ', '', currentNode);
    CopyReportFile(currentNode, newNode);
    if FileExists(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode) then
    begin
      CopyFile(PAnsiChar(ExtractFilePath(ParamStr(0)) + 'ReportII\' + currentNode),
        PAnsiChar(ExtractFilePath(ParamStr(0)) + 'ReportII\' + newNode), False);
    end;
    RefreshTree();
  end;
end;

procedure TReportSysForm.NRefreshClick(Sender: TObject);
begin
  RefreshTree();
end;

procedure TReportSysForm.refreshTree;
begin
  tvReport.Items.Clear;
  GetDirectories(tvReport, ExtractFilePath(ParamStr(0)) + 'ReportII', nil, True);
end;

procedure TReportSysForm.updateReportSQL(filename, sql: string);
var sl: TStringList;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  sl := TStringList.Create;
  try
    if FileExists(filename) then
      sl.LoadFromFile(filename);
    sl.Text := AnsiToUtf8(sql);
    sl.SaveToFile(filename);
  finally
    sl.Free;
  end;
end;

function TReportSysForm.readReportSQL(filename: string): string;
var sl: TStringList;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  sl := TStringList.Create;
  try
    if FileExists(filename) then
      sl.LoadFromFile(filename);
    Result := Utf8ToAnsi(sl.Text);
  finally
    sl.Free;
  end;
end;

function TReportSysForm.reportFileExists(filename: string): Boolean;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  Result := FileExists(filename);
end;

function TReportSysForm.renameReportFile(filename,
  newFilename: string): Boolean;
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';

  newFilename := Copy(newFilename, 1, Length(newFilename) - 4);
  newFilename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + newFilename + '.sql';

  CopyFile(PAnsiChar(filename), PAnsiChar(newFilename), False);

  if FileExists(filename) then
  begin
    DeleteFile(filename);
  end;
end;

procedure TReportSysForm.DeleteReportFile(filename: string);
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';
  if FileExists(filename) then
  begin
    DeleteFile(filename);
  end;
end;

procedure TReportSysForm.CopyReportFile(filename, newFilename: string);
begin
  filename := Copy(filename, 1, Length(filename) - 4);
  filename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + filename + '.sql';

  newFilename := Copy(newFilename, 1, Length(newFilename) - 4);
  newFilename := ExtractFilePath(ParamStr(0)) + 'ReportII\'
    + newFilename + '.sql';

  CopyFile(PAnsiChar(filename), PAnsiChar(newFilename), False);
end;

end.

