unit ReportSys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, RzTreeVw, frxClass, RzButton, StdCtrls,
  ExtCtrls, RzPanel, RzSplit, frxDBSet, frxDesgn, DB, ADODB,
  Menus, RzRadChk;

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
    procedure FormCreate(Sender: TObject);
    function frxReport3UserFunction(const MethodName: String;
      var Params: Variant): Variant;
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

function MoneyToCn(sourcemoney: Double): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  //thiswei为当前位的大写，thispos为当前位的人民币单位
  iwei, pospoint: Integer;
  //iwei为当前位置，pospoint为小数点的位置
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  //将浮点数转换成指定格式字符串
  if Length(strsourcemoney) > 15 then //超过千亿元
  begin
    ShowMessage('请输入正确的数字，不要超过千亿（15位整数）');
    Exit;
  end;
  pospoint := Pos('.', strsourcemoney); //小数点位置
  for iwei := Length(strsourcemoney) downto 1 do //例如：500.8 = 5 X=4
  begin
    case pospoint - iwei of //小数点位置 - 总长度 ＝ 最后一位单位
      -3: thispos := '厘';
      -2: thispos := '分';
      -1: thispos := '角';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //小数点位置大于零
          thispos := '元';
      2: thispos := '拾';
      3: thispos := '佰';
      4: thispos := '仟';
      5: thispos := '万';
      6: thispos := '拾';
      7: thispos := '佰';
      8: thispos := '仟';
      9: thispos := '亿';
      10: thispos := '十';
      11: thispos := '佰';
      12: thispos := '仟';
    end;
    case strsourcemoney[iwei] of //当前数字转换成人民币汉字
      '.': Continue;
      '1': thiswei := '壹';
      '2': thiswei := '贰';
      '3': thiswei := '叁';
      '4': thiswei := '肆';
      '5': thiswei := '伍';
      '6': thiswei := '陆';
      '7': thiswei := '柒';
      '8': thiswei := '捌';
      '9': thiswei := '玖';
      '0':
        begin
          thiswei := '';
          if iwei < Length(strsourcemoney) then //不是第一位的时候
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //当前一位数不是零，即5005 为五千零五。并且 前一位不是. ，即 5.05 为五元五分
              thiswei := '零';
          if (thispos <> '亿') and (thispos <> '万') and (thispos <> '元') then
            thispos := '' //单位是十，百、仟   的，为0，则不显示单位。
          else
            thiswei := ''; //若单位为亿、万、元，则前一位0，不显示'零'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //组合成大写金额
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '亿万', '亿'); //去掉'亿万'中的'万'
  if ansicontainsstr(strobjectmoney, '分') then
    Result := strobjectmoney
  else
  begin
    Result := strobjectmoney;
  end;
end;

function Num2CNum(dblArabic: double): string;
const
  _ChineseNumeric = '零壹贰叁肆伍陆柒捌玖';
var
  sArabic: string;
  sIntArabic: string;
  iPosOfDecimalPoint: integer;
  i: integer;
  iDigit: integer;
  iSection: integer;
  sSectionArabic: string;
  sSection: string;
  bInZero: boolean;
  bMinus: boolean;
  (* 将字串反向, 例如: 传入 '1234', 传回 '4321' *)
  function ConvertStr(const sBeConvert: string): string;
  var
    x: integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      Result := Result + sBeConvert[x];
  end;
  { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* 将数字转成阿拉伯数字字串 *)
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* 取得小数点的位置 *)

  (* 先处理整数的部分 *)
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  (* 从个位数起以每四位数为一小节 *)
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
      (* 以下的 i 控制: 个十百千位四个位数 *)
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := Ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
              (* 1. 避免 '零' 的重覆出现 *)
              (* 2. 个位数的 0 不必转成 '零' *)
        if (not bInZero) and (i <> 1) then sSection := '零' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2: sSection := '拾' + sSection;
          3: sSection := '佰' + sSection;
          4: sSection := '仟' + sSection;
        end;
        sSection := Copy(_ChineseNumeric, 2 * iDigit + 1, 2) +
          sSection;
        bInZero := False;
      end;
    end;

      (* 加上该小节的位数 *)
    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 2) <> '零') then
        Result := '零' + Result;
    end
    else
    begin
      case iSection of
        0: Result := sSection;
        1: Result := sSection + '万' + Result;
        2: Result := sSection + '亿' + Result;
        3: Result := sSection + '兆' + Result;
      end;
    end;
  end;

  (* 处理小数点右边的部分 *)
  if iPosOfDecimalPoint > 0 then
  begin
    Result := Result + '点';
    //AppendStr(Result, '点');
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;
  (* 其他例外状况的处理 *)
  if Length(Result) = 0 then Result := '零';
  if Copy(Result, 1, 4) = '一十' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '点' then Result := '零' + Result;

  (* 是否为负数 *)
  if bMinus then Result := '负' + Result;
end;

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

procedure TReportSysForm.FormCreate(Sender: TObject);
begin
  frxReport3.AddFunction('function MoneyToCn(ANumberic: Double): String;', 'Myfunction', '人民币大写金额转换函数');
  frxReport3.AddFunction('function Num2CNum(dblArabic: Double): String;', 'Myfunction', '阿拉伯大写金额转换函数');
end;

function TReportSysForm.frxReport3UserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin 
  if UpperCase(MethodName) = UpperCase('MoneyToCn') then
    Result := MoneyToCn(Params[0]);
  if UpperCase(MethodName) = UpperCase('Num2CNum') then
    Result := Num2CNum(Params[0]);
end;

end.

