unit DataQuery;

interface

uses
  Classes, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, DB, Graphics,
  ComCtrls, SysUtils, Windows, GridsEh, DBGridEh, DateUtils,
  Menus, ADODB, RzButton, PrnDbgeh, Math, StrUtils, IniFiles,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, RzPrgres,
  RM_FormReport, RM_PEHGrid, Grids, DBGridEhGrouping, RM_Class, Buttons;

type

  TQueryDBGrid = class(TDBGridEh);

  TDataQueryForm = class(TForm)
    PQuery: TPanel;
    CBName1: TComboBox;
    CBOper1: TComboBox;
    CBName2: TComboBox;
    CBOper2: TComboBox;
    CBName3: TComboBox;
    CBOper3: TComboBox;
    CBName5: TComboBox;
    CBOper5: TComboBox;
    DTPStartDate1: TDateTimePicker;
    DTPStartTime1: TDateTimePicker;
    CBName6: TComboBox;
    CBOper6: TComboBox;
    DTPStartDate2: TDateTimePicker;
    DTPStartTime2: TDateTimePicker;
    EdtValue1: TComboBox;
    EdtValue2: TComboBox;
    EdtValue3: TComboBox;
    EdtValue4: TComboBox;
    DTPEndDate1: TDateTimePicker;
    DTPEndTime1: TDateTimePicker;
    DTPEndDate2: TDateTimePicker;
    DTPEndTime2: TDateTimePicker;
    CBReport: TComboBox;
    lblReportType: TLabel;
    Label1: TLabel;
    EdtOrderField: TEdit;
    Label2: TLabel;
    CBOrderType: TComboBox;
    PMDBGridEh: TPopupMenu;
    SPMPrint: TMenuItem;
    N4: TMenuItem;
    SPMSaveAs: TMenuItem;
    N1: TMenuItem;
    GBFinishType: TGroupBox;
    RBFinish: TRadioButton;
    RBNotFinish: TRadioButton;
    RBAll: TRadioButton;
    EdtValue5: TComboBox;
    EdtValue6: TComboBox;
    CBName4: TComboBox;
    CBOper4: TComboBox;
    EdtValue7: TComboBox;
    EdtValue8: TComboBox;
    Bevel1: TBevel;
    GBOption: TGroupBox;
    CBFirst: TComboBox;
    CBSecond: TComboBox;
    CBThird: TComboBox;
    CBFourth: TComboBox;
    LEReportTitle: TLabeledEdit;
    GBStatField: TGroupBox;
    CBCount: TCheckBox;
    CBGross: TCheckBox;
    CBTare: TCheckBox;
    CBNet: TCheckBox;
    CBBundle: TCheckBox;
    CBReal: TCheckBox;
    CBSum: TCheckBox;
    CBCost: TCheckBox;
    CBBackup6: TCheckBox;
    CBBackup7: TCheckBox;
    CBBackup8: TCheckBox;
    CBBackup9: TCheckBox;
    PMStatReport: TPopupMenu;
    FDDBGrid: TFontDialog;
    PrintDBGridEh1: TPrintDBGridEh;
    PData: TPanel;
    DBGridEhStat: TDBGridEh;
    DBGridEhWeight: TDBGridEh;
    CBBackup15: TCheckBox;
    CBBackup16: TCheckBox;
    CBBackup17: TCheckBox;
    CBBackup18: TCheckBox;
    CBQuanter: TCheckBox;
    PTop: TPanel;
    BitBtnQuery: TRzBitBtn;
    PhotoBtn: TRzBitBtn;
    BitBtnExportPhoto: TRzBitBtn;
    BtnImport: TRzBitBtn;
    BtnDel: TRzBitBtn;
    OutputBtn: TRzBitBtn;
    BitBtnModify: TRzBitBtn;
    BBtnQuery: TRzBitBtn;
    BBtnFont: TRzBitBtn;
    AppendBtn: TRzBitBtn;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    GBWeightType: TGroupBox;
    RBPurchase: TRadioButton;
    RBSale: TRadioButton;
    RBInner: TRadioButton;
    RBOther: TRadioButton;
    RBAllType: TRadioButton;
    PBImport: TRzProgressBar;
    GBTime: TGroupBox;
    RBDay: TRadioButton;
    RBMonth: TRadioButton;
    RBYear: TRadioButton;
    BitBtnPrint: TRzMenuButton;
    PMPrint: TPopupMenu;
    N3: TMenuItem;
    N6: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    BBtnPrint: TRzBitBtn;
    N2: TMenuItem;
    N5: TMenuItem;
    N12: TMenuItem;
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnQueryClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnDelClick(Sender: TObject);
    procedure BitBtnModifyClick(Sender: TObject);
    procedure EdtOrderFieldDblClick(Sender: TObject);
    procedure BitBtnExportPhotoClick(Sender: TObject);
    procedure OutputBtnClick(Sender: TObject);
    procedure DBGridEhWeightTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure PhotoBtnClick(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure SPMSaveAsClick(Sender: TObject);
    procedure EdtValue1Enter(Sender: TObject);
    procedure EdtValue3Enter(Sender: TObject);
    procedure EdtValue5Enter(Sender: TObject);
    procedure EdtValue7Enter(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BBtnFontClick(Sender: TObject);
    procedure BBtnQueryClick(Sender: TObject);
    procedure BtnImportClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure AppendBtnClick(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure DBGridEhWeightGetCellParams(Sender: TObject;
      Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure DBGridEhWeightKeyPress(Sender: TObject; var Key: Char);
    procedure SPMPrintClick(Sender: TObject);
    procedure DBGridEhWeightDblClick(Sender: TObject);
    procedure RBDayClick(Sender: TObject);
    procedure RBMonthClick(Sender: TObject);
    procedure RBYearClick(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure BBtnPrintClick(Sender: TObject);
    procedure DBGridEhWeightCellClick(Column: TColumnEh);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
  private
    { Private declarations }
    strShowName, strFieldName: TStrings; //查询字段及其显示
    dateShowName, dateFieldName: TStrings; //日期及其显示
    operShowName, operName: TStrings; //操作符及其显示
    statShowName, statFieldName: TStrings; //可统计字段及其显示
  public
    QueryFlag: boolean;
    QueryStr: string;
    orderField: string;
    { Public declarations }
    procedure loadReport(); //读取报表格式文件
    procedure loadField(); //显示中文操作符,以及显示的字段名
    procedure loadStatField; //读取可以统计的字段
    procedure loadSumField; //读取要合计的字段
    procedure getCondition(adoq: TADOQuery); //获取查询条件
    procedure loadGridColField(); //增加表格列下拉选择
    procedure loadGridColAuth(); //载入表格列的修改权限
  end;

var
  DataQueryForm: TDataQueryForm;

implementation

uses QueryDM, Main, CommonUtil, SelectOrder, PhotoUnit, PrepareUtil, OtherUtil,
  WeightUtil, ReportUtil, ManualInput, DataShowSetting;

{$R *.dfm}

procedure TDataQueryForm.BitBtnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TDataQueryForm.BitBtnQueryClick(Sender: TObject);
begin
  DBGridEhStat.Align := alNone;
  DBGridEhStat.Width := 0;
  DBGridEhWeight.Align := alClient;
  DBGridEhWeight.DataSource := QueryDataModule.WeightMaintainDS;

  with QueryDataModule.WeightMaintainQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from 称重信息 where ');
    getCondition(QueryDataModule.WeightMaintainQuery);
    SQL.Add(' order by ' + orderField);
    if CBOrderType.ItemIndex = 0 then
      SQL.Add(' Asc')
    else
      SQL.Add(' Desc');
    //ShowMessage(SQL.Text);
    Open;
  end;

  Self.QueryFlag := True;
  //Close
end;

procedure TDataQueryForm.FormShow(Sender: TObject);
begin

  MainForm.loadDBGrid(DBGridEhWeight); //截入主界面的DBGird配置
  DBGridEhWeight.SumList.Active := MainForm.systemConfig.showSumList;
  loadGridColField(); //增加表格列下拉选择
  loadGridColAuth(); //载入表格列的修改权限
  EdtValue1.SetFocus;
end;

procedure TDataQueryForm.BtnDelClick(Sender: TObject);
var i: integer;
begin
  if not QueryFlag then Exit;

  if not TUserUtil.HasAuthority('卡号管理') then Exit;

  if MessageDlg('你确定要作废这些记录吗?', mtConfirmation, [mbYes, mbNo],
    0) = mrYes then
  begin
    for i := 0 to DBGridEhWeight.DataSource.DataSet.RecordCount - 1 do
    begin
      if MainForm.systemConfig.onlyAllowInvalidNotFinished then
      begin
        if DBGridEhWeight.DataSource.DataSet.FieldByName('净重').AsFloat <> 0 then
        begin
          Break;
        end;
      end;
      if TWeightUtil.moveDeletedRecord(
        DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString) then
      begin
        DBGridEhWeight.DataSource.DataSet.Delete;
      end
      else
      begin
        if MessageBox(0, '作废该记录失败，是否直接删除？', '提示', MB_YESNO +
          MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
        begin
          if TUserUtil.HasAuthority('删除记录') then
          begin
            DBGridEhWeight.DataSource.DataSet.Delete;
            TWeightUtil.deletePhoto(DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString);
          end
          else
          begin
            MessageBox(0, '对不起，你无权删除数据！', '错误', MB_OK + MB_ICONSTOP
              + MB_DEFBUTTON2 + MB_TOPMOST);
          end;
        end;
      end;
    end;
  end;
end;

procedure TDataQueryForm.loadReport;
var
  sr: TSearchRec;
begin
  CBReport.Items.Clear;
  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Report\*.fr3', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Attr and faDirectory) = 0 then
        CBReport.Items.Add(Copy(sr.Name, 1, Length(sr.Name) - 4));
    until FindNext(sr) <> 0;
    SysUtils.FindClose(sr);
  end;
  CBReport.ItemIndex := 0;
end;

procedure TDataQueryForm.BitBtnModifyClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('修改磅单') then
    Exit;
  if CBReport.ItemIndex = -1 then
    Exit;
  TReportUtil.designReport(ExtractFilePath(ParamStr(0))
    + 'Report\' + CBReport.Items[CBReport.ItemIndex] + '.fr3');
end;

procedure TDataQueryForm.EdtOrderFieldDblClick(Sender: TObject);
begin
  Application.CreateForm(TSelectOrderForm, SelectOrderForm);
  try
    SelectOrderForm.ShowModal;
    orderField := SelectOrderForm.selCol.field;
    EdtOrderField.Text := SelectOrderForm.selCol.showField;
    if EdtOrderField.Text = '' then
    begin
      EdtOrderField.Text := '流水号';
      orderField := '流水号';
    end;
  finally
    SelectOrderForm.Free;
  end;
end;

procedure TDataQueryForm.BitBtnExportPhotoClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('数据导出') then
    Exit;
  BitBtnQuery.Click;
  if TWeightUtil.exportPhoto() then
    MessageBoxW(Handle, '称重图片导出成功!', '提示', MB_OK + MB_ICONINFORMATION
      + MB_DEFBUTTON2 + MB_TOPMOST);
end;

procedure TDataQueryForm.OutputBtnClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('数据导出') then
    Exit;
  if DBGridEhStat.Width = 0 then
  begin
    if TCommonUtil.exportExcel(DBGridEhWeight) then
    begin
      Application.MessageBox('数据导出成功!', '警告',
        MB_OK + MB_ICONINFORMATION + MB_TOPMOST);
    end;
  end
  else
  begin
    if TCommonUtil.exportExcel(DBGridEhStat) then
      Application.MessageBox('数据导出成功!', '警告', MB_OK + MB_ICONINFORMATION
        + MB_TOPMOST);
  end;
end;

procedure TDataQueryForm.DBGridEhWeightTitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  if QueryDataModule.WeightMaintainQuery.Sort <> (Column.FieldName + ' ASC') then
    //判断原排序方式
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' ASC'
  else
    QueryDataModule.WeightMaintainQuery.Sort := Column.FieldName + ' DESC'
end;

procedure TDataQueryForm.PhotoBtnClick(Sender: TObject);
begin
  TWeightUtil.showWeightPic(
    DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString);
  PhotoForm.Show;
end;

procedure TDataQueryForm.N4Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString, False, MainForm.systemConfig.ticketType);
  end
end;

procedure TDataQueryForm.SPMSaveAsClick(Sender: TObject);
begin
  if TCommonUtil.exportExcel(DBGridEhWeight) then
    Application.MessageBox('数据导出成功!', '警告', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TDataQueryForm.loadField;
begin
  if strShowName = nil then strShowName := TStringList.Create;
  if strFieldName = nil then strFieldName := TStringList.Create;
  if dateShowName = nil then dateShowName := TStringList.Create;
  if dateFieldName = nil then dateFieldName := TStringList.Create;
  if operShowName = nil then operShowName := TStringList.Create;
  if operName = nil then operName := TStringList.Create;

  operShowName.Add('等于');
  operShowName.Add('大于');
  operShowName.Add('大等于');
  operShowName.Add('小于');
  operShowName.Add('小等于');
  operShowName.Add('不等于');
  operShowName.Add('包含');
  operShowName.Add('不包含');
  operShowName.Add('两者之间');

  operName.Add('=');
  operName.Add('>');
  operName.Add('>=');
  operName.Add('<');
  operName.Add('<=');
  operName.Add('<>');
  operName.Add('like');
  operName.Add('not like');
  operName.Add('between');

  strShowName.Add('流水号'); strFieldName.Add('流水号');
  strShowName.Add(MainForm.poWeightSetConfig.carCaption); strFieldName.Add('车号');
  strShowName.Add(MainForm.poWeightSetConfig.faHuoCaption); strFieldName.Add('发货单位');
  strShowName.Add(MainForm.poWeightSetConfig.shouHuoCaption); strFieldName.Add('收货单位');
  strShowName.Add(MainForm.poWeightSetConfig.goodsCaption); strFieldName.Add('货名');
  strShowName.Add(MainForm.poWeightSetConfig.specCaption); strFieldName.Add('规格');
  strShowName.Add('毛重司磅员'); strFieldName.Add('毛重司磅员');
  strShowName.Add('皮重司磅员'); strFieldName.Add('皮重司磅员');
  strShowName.Add('毛重磅号'); strFieldName.Add('毛重磅号');
  strShowName.Add('皮重磅号'); strFieldName.Add('皮重磅号');
  strShowName.Add(MainForm.poWeightSetConfig.memoCaption); strFieldName.Add('备注');
  strShowName.Add(MainForm.poWeightSetConfig.backup1Caption); strFieldName.Add('备用1');
  strShowName.Add(MainForm.poWeightSetConfig.backup2Caption); strFieldName.Add('备用2');
  strShowName.Add(MainForm.poWeightSetConfig.backup3Caption); strFieldName.Add('备用3');
  strShowName.Add(MainForm.poWeightSetConfig.backup4Caption); strFieldName.Add('备用4');
  strShowName.Add(MainForm.poWeightSetConfig.backup5Caption); strFieldName.Add('备用5');
  strShowName.Add(MainForm.poWeightSetConfig.backup10Caption); strFieldName.Add('备用10');
  strShowName.Add(MainForm.poWeightSetConfig.backup11Caption); strFieldName.Add('备用11');
  strShowName.Add(MainForm.poWeightSetConfig.backup12Caption); strFieldName.Add('备用12');
  strShowName.Add(MainForm.poWeightSetConfig.backup13Caption); strFieldName.Add('备用13');
  strShowName.Add(MainForm.poWeightSetConfig.backup14Caption); strFieldName.Add('备用14');
  strShowName.Add(MainForm.poWeightSetConfig.grossCaption); strFieldName.Add('毛重');
  strShowName.Add(MainForm.poWeightSetConfig.tareCaption); strFieldName.Add('皮重');
  strShowName.Add(MainForm.poWeightSetConfig.netCaption); strFieldName.Add('扣重');
  strShowName.Add(MainForm.poWeightSetConfig.bundleCaption); strFieldName.Add('净重');
  strShowName.Add(MainForm.poWeightSetConfig.realCaption); strFieldName.Add('实重');
  strShowName.Add(MainForm.poWeightSetConfig.priceCaption); strFieldName.Add('单价');
  strShowName.Add(MainForm.poWeightSetConfig.sumCaption); strFieldName.Add('金额');
  strShowName.Add(MainForm.poWeightSetConfig.scaleCaption); strFieldName.Add('折方系数');
  strShowName.Add(MainForm.poWeightSetConfig.quanterCaption); strFieldName.Add('方量');
  strShowName.Add(MainForm.poWeightSetConfig.backup6Caption); strFieldName.Add('备用6');
  strShowName.Add(MainForm.poWeightSetConfig.backup7Caption); strFieldName.Add('备用7');
  strShowName.Add(MainForm.poWeightSetConfig.backup8Caption); strFieldName.Add('备用8');
  strShowName.Add(MainForm.poWeightSetConfig.backup9Caption); strFieldName.Add('备用9');
  strShowName.Add(MainForm.poWeightSetConfig.backup15Caption); strFieldName.Add('备用15');
  strShowName.Add(MainForm.poWeightSetConfig.backup16Caption); strFieldName.Add('备用16');
  strShowName.Add(MainForm.poWeightSetConfig.backup17Caption); strFieldName.Add('备用17');
  strShowName.Add(MainForm.poWeightSetConfig.backup18Caption); strFieldName.Add('备用18');

  dateShowName.Add('');
  dateShowName.Add(MainForm.poWeightSetConfig.grossTimeCaption);
  dateShowName.Add(MainForm.poWeightSetConfig.tareTimeCaption);
  dateShowName.Add('更新时间');

  dateFieldName.Add('');
  dateFieldName.Add('毛重时间');
  dateFieldName.Add('皮重时间');
  dateFieldName.Add('更新时间');

  CBName1.Items := strShowName;
  CBName2.Items := strShowName;
  CBName3.Items := strShowName;
  CBName4.Items := strShowName;
  CBName5.Items := dateShowName;
  CBName6.Items := dateShowName;

  CBName1.ItemIndex := 1;
  CBName2.ItemIndex := 3;
  CBName3.ItemIndex := 4;
  CBName4.ItemIndex := 5;
  CBName5.ItemIndex := 3;
  CBName6.ItemIndex := 0;

  CBOper1.Items := operShowName;
  CBOper2.Items := operShowName;
  CBOper3.Items := operShowName;
  CBOper4.Items := operShowName;
  CBOper5.Items := operShowName;
  CBOper6.Items := operShowName;

  CBOper1.ItemIndex := 0;
  CBOper2.ItemIndex := 0;
  CBOper3.ItemIndex := 0;
  CBOper4.ItemIndex := 0;
  CBOper5.ItemIndex := 8;
  CBOper6.ItemIndex := 8;
end;

procedure TDataQueryForm.EdtValue1Enter(Sender: TObject);
begin
  case CBName1.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    2: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    12: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    13: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    14: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    15: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
    16: begin
        TPrepareUtil.addBackup10((Sender as TComboBox));
      end;
    17: begin
        TPrepareUtil.addBackup11((Sender as TComboBox));
      end;
    18: begin
        TPrepareUtil.addBackup12((Sender as TComboBox));
      end;
    19: begin
        TPrepareUtil.addBackup13((Sender as TComboBox));
      end;
    20: begin
        TPrepareUtil.addBackup14((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.EdtValue3Enter(Sender: TObject);
begin
  case CBName2.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    2: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    12: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    13: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    14: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    15: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
    16: begin
        TPrepareUtil.addBackup10((Sender as TComboBox));
      end;
    17: begin
        TPrepareUtil.addBackup11((Sender as TComboBox));
      end;
    18: begin
        TPrepareUtil.addBackup12((Sender as TComboBox));
      end;
    19: begin
        TPrepareUtil.addBackup13((Sender as TComboBox));
      end;
    20: begin
        TPrepareUtil.addBackup14((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.EdtValue5Enter(Sender: TObject);
begin
  case CBName3.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    2: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    12: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    13: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    14: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    15: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
    16: begin
        TPrepareUtil.addBackup10((Sender as TComboBox));
      end;
    17: begin
        TPrepareUtil.addBackup11((Sender as TComboBox));
      end;
    18: begin
        TPrepareUtil.addBackup12((Sender as TComboBox));
      end;
    19: begin
        TPrepareUtil.addBackup13((Sender as TComboBox));
      end;
    20: begin
        TPrepareUtil.addBackup14((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.EdtValue7Enter(Sender: TObject);
begin
  case CBName4.ItemIndex of
    1: begin
        TPrepareUtil.addCar((Sender as TComboBox));
      end;
    2: begin
        TPrepareUtil.addFaHuo((Sender as TComboBox));
      end;
    3: begin
        TPrepareUtil.addShouHuo((Sender as TComboBox));
      end;
    4: begin
        TPrepareUtil.addGoods((Sender as TComboBox));
      end;
    5: begin
        TPrepareUtil.addSpec((Sender as TComboBox));
      end;
    11: begin
        TPrepareUtil.addBackup1((Sender as TComboBox));
      end;
    12: begin
        TPrepareUtil.addBackup2((Sender as TComboBox));
      end;
    13: begin
        TPrepareUtil.addBackup3((Sender as TComboBox));
      end;
    14: begin
        TPrepareUtil.addBackup4((Sender as TComboBox));
      end;
    15: begin
        TPrepareUtil.addBackup5((Sender as TComboBox));
      end;
    16: begin
        TPrepareUtil.addBackup10((Sender as TComboBox));
      end;
    17: begin
        TPrepareUtil.addBackup11((Sender as TComboBox));
      end;
    18: begin
        TPrepareUtil.addBackup12((Sender as TComboBox));
      end;
    19: begin
        TPrepareUtil.addBackup13((Sender as TComboBox));
      end;
    20: begin
        TPrepareUtil.addBackup14((Sender as TComboBox));
      end;
  else
    begin
      (Sender as TComboBox).Items.Clear;
    end;
  end;
end;

procedure TDataQueryForm.FormCreate(Sender: TObject);
var myini: TiniFile;
begin

  DBGridEhStat.Align := alNone;
  DBGridEhStat.Width := 0;
  DBGridEhWeight.Align := alClient;

  orderField := '流水号';
  DTPStartDate1.Date := IncSecond(StartOfTheDay(Now), MainForm.systemConfig.dayStartDiff);
  DTPStartTime1.Time := IncSecond(StartOfTheDay(Now), MainForm.systemConfig.dayStartDiff);
  DTPEndDate1.Date := IncSecond(EndOfTheDay(Now), MainForm.systemConfig.dayStartDiff);
  DTPEndTime1.Time := IncSecond(EndOfTheDay(Now), MainForm.systemConfig.dayStartDiff);

  DTPStartDate2.Date := IncSecond(StartOfTheDay(Now), MainForm.systemConfig.dayStartDiff);
  DTPStartTime2.Time := IncSecond(StartOfTheDay(Now), MainForm.systemConfig.dayStartDiff);
  DTPEndDate2.Date := IncSecond(EndOfTheDay(Now), MainForm.systemConfig.dayStartDiff);
  DTPEndTime2.Time := IncSecond(EndOfTheDay(Now), MainForm.systemConfig.dayStartDiff);

  DBGridEhWeight.PopupMenu := PMDBGridEh;
  /////////////////////////////////////////////////////////////////////////////
  DBGridEhStat.DataSource := QueryDataModule.StatisticsDs;

  loadField; //读取要查询的字段名
  loadStatField; //读取可以统计的字段
  loadSumField; //读取要合计的字段
  loadReport; //读取报表格式文件

  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    LEReportTitle.Text := myini.ReadString('system_set', 'staticReportTitle', '统计报表');
    CBReport.ItemIndex := myini.ReadInteger('system_set', 'report_index', 0);
  finally
    myini.Free;
  end;

  DBGridEhWeight.OddRowColor := MainForm.systemConfig.oddColor;
  DBGridEhWeight.EvenRowColor := MainForm.systemConfig.evenColor;
end;

procedure TDataQueryForm.FormPaint(Sender: TObject);
var i: integer;
begin
  for i := 0 to DBGridEhStat.Columns.count - 1 do
  begin
    DBGridEhStat.Columns[i].Title.Alignment := taCenter; //字段标题内容居中显示
    if not DBGridEhStat.Columns[i].Visible then
      Continue;
    if Assigned(DBGridEhStat.Columns[i].Field) then
      DBGridEhStat.Columns[i].Width := Max(DBGridEhStat.Columns[i].Field.Tag, DBGridEhStat.Canvas.TextWidth(DBGridEhStat.Columns[i].Title.Caption)) + 40
    else
      DBGridEhStat.Columns[i].Width := DBGridEhStat.Canvas.TextWidth(DBGridEhStat.Columns[i].Title.Caption) + 40;
  end;

  for i := 0 to DBGridEhStat.Columns.count - 1 do
  begin
    if (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.grossCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.tareCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.netCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.bundleCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.realCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.sumCaption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.costCaption)
      or (DBGridEhStat.Columns[i].FieldName = '车次')
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup6Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup7Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup8Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup9Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup15Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup16Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup17Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.backup18Caption)
      or (DBGridEhStat.Columns[i].FieldName = MainForm.poWeightSetConfig.quanterCaption) then
      DBGridEhStat.Columns[i].Footer.ValueType := fvtSum
    else if i = 0 then
    begin
      DBGridEhStat.Columns[i].Footer.ValueType := fvtStaticText;
      DBGridEhStat.Columns[i].Footer.Value := '合计'
    end;
  end;
end;

procedure TDataQueryForm.BBtnFontClick(Sender: TObject);
begin
  FDDBGrid.Font := DBGridEhStat.Font;
  if FDDBGrid.Execute then
  begin
    DBGridEhStat.Font := FDDBGrid.Font;
    DBGridEhStat.TitleFont := FDDBGrid.Font;
    DBGridEhStat.FooterFont := FDDBGrid.Font;
  end
end;

procedure TDataQueryForm.BBtnQueryClick(Sender: TObject);
var sqlstr: string;
begin
  DBGridEhWeight.Align := alNone;
  DBGridEhWeight.Width := 0;
  DBGridEhStat.Align := alClient;
  DBGridEhStat.DataSource := QueryDataModule.StatisticsDS;

  sqlstr := 'select ';

  if CBFirst.ItemIndex > 0 then
  begin
    if CBFirst.Text = '毛重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(毛重时间,''yyyy-mm-dd'') as 毛重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102) as 毛重日期,';
    end
    else if CBFirst.Text = '皮重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(皮重时间,''yyyy-mm-dd'') as 皮重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102) as 皮重日期,';
    end
    else
    begin
      sqlstr := sqlstr + statFieldName[CBFirst.ItemIndex] + ' as [' + statShowName[CBFirst.ItemIndex] + '],';
    end;
  end;
  if CBSecond.ItemIndex > 0 then
  begin
    if CBSecond.Text = '毛重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(毛重时间,''yyyy-mm-dd'') as 毛重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102) as 毛重日期,';
    end
    else if CBSecond.Text = '皮重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(皮重时间,''yyyy-mm-dd'') as 皮重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102) as 皮重日期,';
    end
    else
    begin
      sqlstr := sqlstr + statFieldName[CBSecond.ItemIndex] + ' as [' + statShowName[CBSecond.ItemIndex] + '],';
    end;
  end;
  if CBThird.ItemIndex > 0 then
  begin
    if CBThird.Text = '毛重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(毛重时间,''yyyy-mm-dd'') as 毛重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102) as 毛重日期,';
    end
    else if CBThird.Text = '皮重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(皮重时间,''yyyy-mm-dd'') as 皮重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102) as 皮重日期,';
    end
    else
    begin
      sqlstr := sqlstr + statFieldName[CBThird.ItemIndex] + ' as [' + statShowName[CBThird.ItemIndex] + '],';
    end;
  end;
  if CBFourth.ItemIndex > 0 then
  begin
    if CBFourth.Text = '毛重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(毛重时间,''yyyy-mm-dd'') as 毛重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102) as 毛重日期,';
    end
    else if CBFourth.Text = '皮重日期' then
    begin
      if mainform.systemConfig.databaseInUse then
        sqlstr := sqlstr + 'format(皮重时间,''yyyy-mm-dd'') as 皮重日期,'
      else
        sqlstr := sqlstr + 'convert(varchar(30),DATEADD(ss,-'
          + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102) as 皮重日期,';
    end
    else
    begin
      sqlstr := sqlstr + statFieldName[CBFourth.ItemIndex] + ' as [' + statShowName[CBFourth.ItemIndex] + '],';
    end;
  end;

  if CBCount.Checked then
    sqlstr := sqlstr + 'Count(流水号) As [' + CBCount.Caption + '],';
  if CBGross.Checked then
    sqlstr := sqlstr + 'Sum(毛重) As [' + MainForm.poWeightSetConfig.grossCaption + '],';
  if CBTare.Checked then
    sqlstr := sqlstr + 'Sum(皮重) As [' + MainForm.poWeightSetConfig.tareCaption + '],';
  if CBNet.Checked then
    sqlstr := sqlstr + 'Sum(净重) As [' + MainForm.poWeightSetConfig.netCaption + '],';
  if CBBundle.Checked then
    sqlstr := sqlstr + 'Sum(扣重) As [' + MainForm.poWeightSetConfig.bundleCaption + '],';
  if CBReal.Checked then
    sqlstr := sqlstr + 'Sum(实重) As [' + MainForm.poWeightSetConfig.realCaption + '],';
  if CBSum.Checked then
    sqlstr := sqlstr + 'Sum(金额) As [' + MainForm.poWeightSetConfig.sumCaption + '],';
  if CBQuanter.Checked then
    sqlstr := sqlstr + 'Sum(方量) As [' + MainForm.poWeightSetConfig.quanterCaption + '],';
  if CBCost.Checked then
    sqlstr := sqlstr + 'Sum(过磅费) As [' + MainForm.poWeightSetConfig.costCaption + '],';
  if CBBackup6.Checked then
    sqlstr := sqlstr + 'Sum(备用6) As [' + MainForm.poWeightSetConfig.backup6Caption + '],';
  if CBBackup7.Checked then
    sqlstr := sqlstr + 'Sum(备用7) As [' + MainForm.poWeightSetConfig.backup7Caption + '],';
  if CBBackup8.Checked then
    sqlstr := sqlstr + 'Sum(备用8) As [' + MainForm.poWeightSetConfig.backup8Caption + '],';
  if CBBackup9.Checked then
    sqlstr := sqlstr + 'Sum(备用9) As [' + MainForm.poWeightSetConfig.backup9Caption + '],';
  if CBBackup15.Checked then
    sqlstr := sqlstr + 'Sum(备用15) As [' + MainForm.poWeightSetConfig.backup15Caption + '],';
  if CBBackup16.Checked then
    sqlstr := sqlstr + 'Sum(备用16) As [' + MainForm.poWeightSetConfig.backup16Caption + '],';
  if CBBackup17.Checked then
    sqlstr := sqlstr + 'Sum(备用17) As [' + MainForm.poWeightSetConfig.backup17Caption + '],';
  if CBBackup18.Checked then
    sqlstr := sqlstr + 'Sum(备用18) As [' + MainForm.poWeightSetConfig.backup18Caption + '],';

  if RightStr(sqlstr, 1) = ',' then
    sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);

  sqlstr := sqlstr + ' from 称重信息 where ';

  with QueryDataModule.StatisticsQuery do
  begin
    Close;
    SQL.Text := sqlstr;
    getCondition(QueryDataModule.StatisticsQuery);

    SQL.Add(' group by ');
    if CBFirst.ItemIndex > 0 then
    begin
      if CBFirst.Text = '毛重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(毛重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102),');
      end
      else if CBFirst.Text = '皮重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(皮重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102),');
      end
      else
      begin
        SQL.Add(statFieldName[CBFirst.ItemIndex] + ',');
      end;
    end;
    if CBSecond.ItemIndex > 0 then
    begin
      if CBSecond.Text = '毛重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(毛重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102),');
      end
      else if CBSecond.Text = '皮重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(皮重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102),');
      end
      else
      begin
        SQL.Add(statFieldName[CBSecond.ItemIndex] + ',');
      end;
    end;
    if CBThird.ItemIndex > 0 then
    begin
      if CBThird.Text = '毛重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(毛重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102),');
      end
      else if CBThird.Text = '皮重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(皮重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102),');
      end
      else
      begin
        SQL.Add(statFieldName[CBThird.ItemIndex] + ',');
      end;
    end;
    if CBFourth.ItemIndex > 0 then
    begin
      if CBFourth.Text = '毛重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(毛重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',毛重时间,102),');
      end
      else if CBFourth.Text = '皮重日期' then
      begin
        if mainform.systemConfig.databaseInUse then
          SQL.Add('format(皮重时间,''yyyy-mm-dd''),')
        else
          SQL.Add('convert(varchar(30),DATEADD(ss,-'
            + IntToStr(MainForm.systemConfig.dayStartDiff) + ',皮重时间,102),');
      end
      else
      begin
        SQL.Add(statFieldName[CBFourth.ItemIndex] + ',');
      end;
    end;
    sqlstr := Trim(SQL.Text);
    if RightStr(sqlstr, 1) = ',' then
      sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);
    SQL.Text := sqlstr;

    SQL.Add(' order by ');
    if CBFirst.ItemIndex > 0 then
      SQL.Add(statFieldName[CBFirst.ItemIndex] + ',');
    if CBSecond.ItemIndex > 0 then
      SQL.Add(statFieldName[CBSecond.ItemIndex] + ',');
    if CBThird.ItemIndex > 0 then
      SQL.Add(statFieldName[CBThird.ItemIndex] + ',');
    if CBFourth.ItemIndex > 0 then
      SQL.Add(statFieldName[CBFourth.ItemIndex] + ',');
    sqlstr := Trim(SQL.Text);
    if RightStr(sqlstr, 1) = ',' then
      sqlstr := Copy(sqlstr, 0, Length(sqlstr) - 1);
    SQL.Text := sqlstr;

    //ShowMessage(sqlstr);
    Open;
  end;
  Repaint;
end;

procedure TDataQueryForm.loadStatField;
begin
  if statShowName = nil then statShowName := TStringList.Create;
  if statFieldName = nil then statFieldName := TStringList.Create;

  statShowName.Add('');
  statShowName.Add(MainForm.poWeightSetConfig.carCaption);
  statShowName.Add(MainForm.poWeightSetConfig.faHuoCaption);
  statShowName.Add(MainForm.poWeightSetConfig.shouHuoCaption);
  statShowName.Add(MainForm.poWeightSetConfig.goodsCaption);
  statShowName.Add(MainForm.poWeightSetConfig.specCaption);
  statShowName.Add(MainForm.poWeightSetConfig.backup1Caption);
  statShowName.Add(MainForm.poWeightSetConfig.backup2Caption);
  statShowName.Add(MainForm.poWeightSetConfig.backup3Caption);
  statShowName.Add(MainForm.poWeightSetConfig.backup4Caption);
  statShowName.Add(MainForm.poWeightSetConfig.backup5Caption);
  statShowName.Add('毛重日期');
  statShowName.Add('皮重日期');

  statFieldName.Add('');
  statFieldName.Add('车号');
  statFieldName.Add('发货单位');
  statFieldName.Add('收货单位');
  statFieldName.Add('货名');
  statFieldName.Add('规格');
  statFieldName.Add('备用1');
  statFieldName.Add('备用2');
  statFieldName.Add('备用3');
  statFieldName.Add('备用4');
  statFieldName.Add('备用5');
  statFieldName.Add('毛重日期');
  statFieldName.Add('皮重日期');

  CBFirst.Items := statShowName;
  CBSecond.Items := statShowName;
  CBThird.Items := statShowName;
  CBFourth.Items := statShowName;

  CBFirst.ItemIndex := 1;
  CBSecond.ItemIndex := 0;
  CBThird.ItemIndex := 0;
  CBFourth.ItemIndex := 0;
end;

procedure TDataQueryForm.loadSumField;
begin
  CBCount.Caption := '车次';
  CBGross.Caption := MainForm.poWeightSetConfig.grossCaption;
  CBTare.Caption := MainForm.poWeightSetConfig.tareCaption;
  CBNet.Caption := MainForm.poWeightSetConfig.netCaption;
  CBBundle.Caption := MainForm.poWeightSetConfig.bundleCaption;
  CBReal.Caption := MainForm.poWeightSetConfig.realCaption;
  CBSum.Caption := MainForm.poWeightSetConfig.sumCaption;
  CBQuanter.Caption := MainForm.poWeightSetConfig.quanterCaption;
  CBCost.Caption := MainForm.poWeightSetConfig.costCaption;
  CBBackup6.Caption := MainForm.poWeightSetConfig.backup6Caption;
  CBBackup7.Caption := MainForm.poWeightSetConfig.backup7Caption;
  CBBackup8.Caption := MainForm.poWeightSetConfig.backup8Caption;
  CBBackup9.Caption := MainForm.poWeightSetConfig.backup9Caption;
  CBBackup15.Caption := MainForm.poWeightSetConfig.backup15Caption;
  CBBackup16.Caption := MainForm.poWeightSetConfig.backup16Caption;
  CBBackup17.Caption := MainForm.poWeightSetConfig.backup17Caption;
  CBBackup18.Caption := MainForm.poWeightSetConfig.backup18Caption;
end;

procedure TDataQueryForm.getCondition(adoq: TADOQuery);
begin
  with adoq do
  begin
    SQL.Add(' (序号<>0)');

    if (CBName1.Text <> '') and (EdtValue1.Text <> '') then
    begin
      case CBOper1.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1)');
            Parameters.ParamByName('v1').Value := EdtValue1.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1)');
            Parameters.ParamByName('v1').Value := '%' + EdtValue1.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName1.ItemIndex] + ' '
              + operName.Strings[CBOper1.ItemIndex] + ' :v1 and :v2)');
            Parameters.ParamByName('v1').Value := EdtValue1.Text;
            Parameters.ParamByName('v2').Value := EdtValue2.Text;
          end;
      end;
    end;

    if (CBName2.Text <> '') and (EdtValue3.Text <> '') then
    begin
      case CBOper2.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and ( ' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3)');
            Parameters.ParamByName('v3').Value := EdtValue3.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3)');
            Parameters.ParamByName('v3').Value := '%' + EdtValue3.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName2.ItemIndex] + ' '
              + operName.Strings[CBOper2.ItemIndex] + ' :v3 and :v4)');
            Parameters.ParamByName('v3').Value := EdtValue3.Text;
            Parameters.ParamByName('v4').Value := EdtValue4.Text;
          end;
      end;
    end;

    if (CBName3.Text <> '') and (EdtValue5.Text <> '') then
    begin
      case CBOper3.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5)');
            Parameters.ParamByName('v5').Value := EdtValue5.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5)');
            Parameters.ParamByName('v5').Value := '%' + EdtValue5.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName3.ItemIndex] + ' '
              + operName.Strings[CBOper3.ItemIndex] + ' :v5 and :v6)');
            Parameters.ParamByName('v5').Value := EdtValue5.Text;
            Parameters.ParamByName('v6').Value := EdtValue6.Text;
          end;
      end;
    end;

    if (CBName4.Text <> '') and (EdtValue7.Text <> '') then
    begin
      case CBOper4.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7)');
            Parameters.ParamByName('v7').Value := EdtValue7.Text;
          end;
        6, 7: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7)');
            Parameters.ParamByName('v7').Value := '%' + EdtValue7.Text + '%';
          end;
        8: begin
            SQL.Add(' and (' + strFieldName.Strings[CBName4.ItemIndex] + ' '
              + operName.Strings[CBOper4.ItemIndex] + ' :v7 and :v8)');
            Parameters.ParamByName('v7').Value := EdtValue7.Text;
            Parameters.ParamByName('v8').Value := EdtValue8.Text;
          end;
      end;
    end;

    if (CBName5.Text <> '') then
    begin
      case CBOper5.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9)');
            Parameters.ParamByName('v9').Value :=
              FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
          end;
        6, 7: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9)');
            Parameters.ParamByName('v9').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
          end;
        8: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName5.ItemIndex] + ' '
              + operName.Strings[CBOper5.ItemIndex] + ' :v9 and :v10)');
            Parameters.ParamByName('v9').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime1.Time);
            Parameters.ParamByName('v10').Value := FormatDateTime('yyyy-MM-dd', DTPEndDate1.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPEndTime1.Time);
          end;
      end;
    end;

    if (CBName6.Text <> '') then
    begin
      case CBOper6.ItemIndex of
        0, 1, 2, 3, 4, 5: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11)');
            Parameters.ParamByName('v11').Value :=
              FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
          end;
        6, 7: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11)');
            Parameters.ParamByName('v11').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
          end;
        8: begin
            SQL.Add(' and (' + dateFieldName.Strings[CBName6.ItemIndex] + ' '
              + operName.Strings[CBOper6.ItemIndex] + ' :v11 and :v12)');
            Parameters.ParamByName('v11').Value := FormatDateTime('yyyy-MM-dd', DTPStartDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPStartTime2.Time);
            Parameters.ParamByName('v12').Value := FormatDateTime('yyyy-MM-dd', DTPEndDate2.Date) + ' '
              + FormatDateTime('HH:mm:ss', DTPEndTime2.Time);
          end;
      end;
    end;

    if RBFinish.Checked then
    begin
      SQL.Add(' and (净重<>0)');
    end
    else if RBNotFinish.Checked then
    begin
      SQL.Add(' and (净重=0)');
    end;

    if not RBAllType.Checked then
    begin
      SQL.Add(' and (过磅类型=:weightType)');
      if RBPurchase.Checked then
        Parameters.ParamByName('weightType').Value := 'PO'
      else if RBSale.Checked then
        Parameters.ParamByName('weightType').Value := 'SO'
      else if RBInner.Checked then
        Parameters.ParamByName('weightType').Value := 'IO'
      else if RBOther.Checked then
        Parameters.ParamByName('weightType').Value := 'OO';
    end;
  end;
end;

procedure TDataQueryForm.BtnImportClick(Sender: TObject);
var od: TOpenDialog;
begin
  if not TUserUtil.HasAuthority('数据导入') then
    Exit;
  od := TOpenDialog.Create(Application);
  try
    od.Filter := 'Excel文件(*.xls;xlsx)|*.xls;*.xlsx';
    od.DefaultExt := 'xls';
    if od.Execute then
    begin
      //PBImport.Visible := True;
      if TWeightUtil.importExcel(od.FileName, PBImport) then
        Application.MessageBox('数据导入成功!', '提示', MB_OK + MB_ICONINFORMATION
          + MB_TOPMOST);
      //PBImport.Visible := False;
    end;
  finally
    od.Free;
  end;
end;

procedure TDataQueryForm.FormDestroy(Sender: TObject);
var myini: TIniFile;
begin
  if strShowName <> nil then strShowName.Free;
  if strFieldName <> nil then strFieldName.Free;
  if dateShowName <> nil then dateShowName.Free;
  if dateFieldName <> nil then dateFieldName.Free;
  if operShowName <> nil then operShowName.Free;
  if operName <> nil then operName.Free;
  if statShowName <> nil then statShowName.Free;
  if statFieldName <> nil then statFieldName.Free;

  if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteString('system_set', 'staticReportTitle', LEReportTitle.Text);
    myini.WriteInteger('system_set', 'report_index', CBReport.ItemIndex);
  finally
    myini.Free;
  end;

end;

procedure TDataQueryForm.loadGridColAuth;
begin

  TPrepareUtil.addCarStrings(DBGridEhWeight.FieldColumns['车号'].PickList);
  TPrepareUtil.addFaHuoStrings(DBGridEhWeight.FieldColumns['发货单位'].PickList);
  TPrepareUtil.addShouHuoStrings(DBGridEhWeight.FieldColumns['收货单位'].PickList);
  TPrepareUtil.addGoodsStrings(DBGridEhWeight.FieldColumns['货名'].PickList);
  TPrepareUtil.addSpecStrings(DBGridEhWeight.FieldColumns['规格'].PickList);
  TPrepareUtil.addBackup1Strings(DBGridEhWeight.FieldColumns['备用1'].PickList);
  TPrepareUtil.addBackup2Strings(DBGridEhWeight.FieldColumns['备用2'].PickList);
  TPrepareUtil.addBackup3Strings(DBGridEhWeight.FieldColumns['备用3'].PickList);
  TPrepareUtil.addBackup4Strings(DBGridEhWeight.FieldColumns['备用4'].PickList);
  TPrepareUtil.addBackup5Strings(DBGridEhWeight.FieldColumns['备用5'].PickList);
  TPrepareUtil.addBackup10Strings(DBGridEhWeight.FieldColumns['备用10'].PickList);
  TPrepareUtil.addBackup11Strings(DBGridEhWeight.FieldColumns['备用11'].PickList);
  TPrepareUtil.addBackup12Strings(DBGridEhWeight.FieldColumns['备用12'].PickList);
  TPrepareUtil.addBackup13Strings(DBGridEhWeight.FieldColumns['备用13'].PickList);
  TPrepareUtil.addBackup14Strings(DBGridEhWeight.FieldColumns['备用14'].PickList);

end;

procedure TDataQueryForm.loadGridColField;
var mCar, mFaHuo, mShouHuo, mGoods, mSpec,
  mGross, mTare, mBundle, mPrice, mScale, mCost, mBackup1, mBackup2, mBackup3,
    mBackup4, mBackup5, mBackup6, mBackup7, mBackup8, mBackup9, mBackup10, mBackup11,
    mBackup12, mBackup13, mBackup14, mBackup15, mBackup16, mBackup17,
    mBackup18: Boolean;
begin
  TUserUtil.getModAuthority(MainForm.CurrentUser,
    mCar, mFaHuo, mShouHuo, mGoods, mSpec,
    mGross, mTare, mBundle, mPrice, mScale, mCost, mBackup1, mBackup2, mBackup3,
    mBackup4, mBackup5, mBackup6, mBackup7, mBackup8, mBackup9, mBackup10, mBackup11,
    mBackup12, mBackup13, mBackup14, mBackup15, mBackup16, mBackup17,
    mBackup18);
  DBGridEhWeight.FieldColumns['序号'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['流水号'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['车号'].ReadOnly := not mCar;
  DBGridEhWeight.FieldColumns['过磅类型'].ReadOnly := False;
  DBGridEhWeight.FieldColumns['发货单位'].ReadOnly := not mFaHuo;
  DBGridEhWeight.FieldColumns['收货单位'].ReadOnly := not mShouHuo;
  DBGridEhWeight.FieldColumns['货名'].ReadOnly := not mGoods;
  DBGridEhWeight.FieldColumns['规格'].ReadOnly := not mSpec;
  DBGridEhWeight.FieldColumns['毛重'].ReadOnly := not mGross;
  DBGridEhWeight.FieldColumns['皮重'].ReadOnly := not mTare;
  DBGridEhWeight.FieldColumns['净重'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['扣重'].ReadOnly := not mBundle;
  DBGridEhWeight.FieldColumns['实重'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['单价'].ReadOnly := not mPrice;
  DBGridEhWeight.FieldColumns['金额'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['折方系数'].ReadOnly := not mScale;
  DBGridEhWeight.FieldColumns['方量'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['过磅费'].ReadOnly := not mCost;
  DBGridEhWeight.FieldColumns['毛重司磅员'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['皮重司磅员'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['毛重磅号'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['皮重磅号'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['毛重时间'].ReadOnly := not (mGross and mTare);
  DBGridEhWeight.FieldColumns['皮重时间'].ReadOnly := not (mGross and mTare);
  DBGridEhWeight.FieldColumns['一次过磅时间'].ReadOnly := not (mGross and mTare);
  DBGridEhWeight.FieldColumns['二次过磅时间'].ReadOnly := not (mGross and mTare);
  DBGridEhWeight.FieldColumns['更新人'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['更新时间'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['备注'].ReadOnly := False;
  DBGridEhWeight.FieldColumns['打印次数'].ReadOnly := True;
  DBGridEhWeight.FieldColumns['上传否'].ReadOnly := False;
  DBGridEhWeight.FieldColumns['备用1'].ReadOnly := not mBackup1;
  DBGridEhWeight.FieldColumns['备用2'].ReadOnly := not mBackup2;
  DBGridEhWeight.FieldColumns['备用3'].ReadOnly := not mBackup3;
  DBGridEhWeight.FieldColumns['备用4'].ReadOnly := not mBackup4;
  DBGridEhWeight.FieldColumns['备用5'].ReadOnly := not mBackup5;
  DBGridEhWeight.FieldColumns['备用6'].ReadOnly := not mBackup6;
  DBGridEhWeight.FieldColumns['备用7'].ReadOnly := not mBackup7;
  DBGridEhWeight.FieldColumns['备用8'].ReadOnly := not mBackup8;
  DBGridEhWeight.FieldColumns['备用9'].ReadOnly := not mBackup9;
  DBGridEhWeight.FieldColumns['备用10'].ReadOnly := not mBackup10;
  DBGridEhWeight.FieldColumns['备用11'].ReadOnly := not mBackup11;
  DBGridEhWeight.FieldColumns['备用12'].ReadOnly := not mBackup12;
  DBGridEhWeight.FieldColumns['备用13'].ReadOnly := not mBackup13;
  DBGridEhWeight.FieldColumns['备用14'].ReadOnly := not mBackup14;
  DBGridEhWeight.FieldColumns['备用15'].ReadOnly := not mBackup15;
  DBGridEhWeight.FieldColumns['备用16'].ReadOnly := not mBackup16;
  DBGridEhWeight.FieldColumns['备用17'].ReadOnly := not mBackup17;
  DBGridEhWeight.FieldColumns['备用18'].ReadOnly := not mBackup18;
end;

procedure TDataQueryForm.AppendBtnClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('添加记录') then
  begin
    Application.CreateForm(TManualInputForm, ManualInputForm);
    try
      ManualInputForm.insertOrUpdate := True;
      ManualInputForm.ShowModal;
    finally
      ManualInputForm.Free;
    end;
  end
  else
  begin
    //ShowMsg('对不起您没有添加记录权限，无法添加记录！')
  end;
end;

procedure TDataQueryForm.N7Click(Sender: TObject);
begin
  if MainForm.systemConfig.onlyAllowInvalidNotFinished then
  begin
    if DBGridEhWeight.DataSource.DataSet.FieldByName('净重').AsFloat <> 0 then
    begin
      Exit;
    end;
  end;
  if TUserUtil.HasAuthority('卡号管理') then
  begin
    if MessageDlg('你确定要作废这条记录吗?', mtConfirmation, [mbYes, mbNo],
      0) = mrNo then
    begin
      Exit;
    end;
    if TWeightUtil.moveDeletedRecord(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString) then
    begin
      DBGridEhWeight.DataSource.DataSet.Delete;
      Application.MessageBox('该记录已经作废', '提示', MB_OK +
        MB_ICONINFORMATION + MB_TOPMOST);
    end
    else
    begin
      if MessageBox(0, '作废该记录失败，是否直接删除？', '提示', MB_YESNO +
        MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST) = IDYES then
      begin
        if TUserUtil.HasAuthority('删除记录') then
        begin
          DBGridEhWeight.DataSource.DataSet.Delete;
          TWeightUtil.deletePhoto(DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString);
        end
        else
        begin
          MessageBox(0, '对不起，你无权删除数据！', '错误', MB_OK + MB_ICONSTOP
            + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
      end;
    end;
  end;
end;

procedure TDataQueryForm.N8Click(Sender: TObject);
begin
  TWeightUtil.showWeightPic(
    DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString);
  PhotoForm.Show;
end;

procedure TDataQueryForm.DBGridEhWeightGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
var t: string;
begin
  if not MainForm.systemConfig.gridOddEvenColor then
  begin
    t := DBGridEhWeight.DataSource.DataSet.FieldByName('过磅类型').AsString;
    if t = 'PO' then
      Background := clWindow
    else if t = 'SO' then
      Background := clSkyBlue
    else if t = 'IO' then
      Background := clMoneyGreen
    else
      Background := clBtnFace;
  end;
end;

procedure TDataQueryForm.DBGridEhWeightKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    try
      QueryDataModule.WeightMaintainQuery.Post;
    except
    end;
  end;
end;

procedure TDataQueryForm.SPMPrintClick(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString, True, MainForm.systemConfig.ticketType);
  end
end;

procedure TDataQueryForm.DBGridEhWeightDblClick(Sender: TObject);
begin
  Application.CreateForm(TManualInputForm, ManualInputForm);
  try
    ManualInputForm.glideNo :=
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString;
    ManualInputForm.insertOrUpdate := False;
    ManualInputForm.ShowModal;
  finally
    ManualInputForm.Free;
    BitBtnQuery.Click;
  end;
end;

procedure TDataQueryForm.RBDayClick(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheDay(Now);
  DTPStartTime1.Time := StartOfTheDay(Now);
  DTPStartDate2.Date := StartOfTheDay(Now);
  DTPStartTime2.Time := StartOfTheDay(Now);

  DTPEndDate1.Date := EndOfTheDay(Now);
  DTPEndTime1.Time := EndOfTheDay(Now);
  DTPEndDate2.Date := EndOfTheDay(Now);
  DTPEndTime2.Time := EndOfTheDay(Now);
end;

procedure TDataQueryForm.RBMonthClick(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheMonth(Now);
  DTPStartTime1.Time := StartOfTheMonth(Now);
  DTPStartDate2.Date := StartOfTheMonth(Now);
  DTPStartTime2.Time := StartOfTheMonth(Now);

  DTPEndDate1.Date := EndOfTheMonth(Now);
  DTPEndTime1.Time := EndOfTheMonth(Now);
  DTPEndDate2.Date := EndOfTheMonth(Now);
  DTPEndTime2.Time := EndOfTheMonth(Now);
end;

procedure TDataQueryForm.RBYearClick(Sender: TObject);
begin
  DTPStartDate1.Date := StartOfTheYear(Now);
  DTPStartTime1.Time := StartOfTheYear(Now);
  DTPStartDate2.Date := StartOfTheYear(Now);
  DTPStartTime2.Time := StartOfTheYear(Now);

  DTPEndDate1.Date := EndOfTheYear(Now);
  DTPEndTime1.Time := EndOfTheYear(Now);
  DTPEndDate2.Date := EndOfTheYear(Now);
  DTPEndTime2.Time := EndOfTheYear(Now);
end;

procedure TDataQueryForm.N6Click(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('打印报表') then
    Exit;
  BitBtnQuery.Click;
  if CBReport.ItemIndex = -1 then
    Exit;
  QueryDataModule.frxReportReport.LoadFromFile(ExtractFilePath(ParamStr(0))
    + 'Report\' + CBReport.Items[CBReport.ItemIndex] + '.fr3');

  QueryDataModule.frxReportReport.Variables['startDate1'] := DTPStartDate1.Date;
  QueryDataModule.frxReportReport.Variables['startTime1'] := DTPStartTime1.Time;
  QueryDataModule.frxReportReport.Variables['endDate1'] := DTPEndDate1.Date;
  QueryDataModule.frxReportReport.Variables['endTime1'] := DTPEndTime1.Time;

  QueryDataModule.frxReportReport.Variables['startDate2'] := DTPStartDate1.Date;
  QueryDataModule.frxReportReport.Variables['startTime2'] := DTPStartTime1.Time;
  QueryDataModule.frxReportReport.Variables['endDate2'] := DTPEndDate1.Date;
  QueryDataModule.frxReportReport.Variables['endDate2'] := DTPEndTime1.Time;

  QueryDataModule.frxReportReport.ShowReport();
end;

procedure TDataQueryForm.N10Click(Sender: TObject);
begin
  Application.CreateForm(TDataShowSettingForm, DataShowSettingForm);
  try
    DataShowSettingForm.DBGridEh1 := DBGridEhWeight;
    DataShowSettingForm.ShowModal;
  finally
    DataShowSettingForm.Free
  end
end;

procedure TDataQueryForm.N3Click(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('打印报表') then
    Exit;

  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEhWeight;

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(MainForm.systemConfig.dataReportTitle);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('操作员：' + MainForm.CurrentUser);
    BeforeGridText.Add('打印时间: ' + DateTimeToStr(Now));
    BeforeGridText.Add('起止时间: '
      + FormatDateTime('yyyy-MM-dd', DTPStartDate1.DateTime)
      + ' ' + FormatDateTime('HH:mm:ss', DTPStartTime1.DateTime)
      + ' --- ' + FormatDateTime('yyyy-MM-dd', DTPEndDate1.DateTime)
      + ' ' + FormatDateTime('HH:mm:ss', DTPEndTime1.DateTime));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('第&[Page]页/共&[Pages]页');
    Preview
  end
end;

procedure TDataQueryForm.BBtnPrintClick(Sender: TObject);
begin
  if not TUserUtil.HasAuthority('打印报表') then
    Exit;

  with PrintDBGridEh1 do
  begin
    DBGridEh := DBGridEhStat;

    Options := Options - [pghOptimalColWidths];
    Options := Options + [pghFitingByColWidths];

    PageHeader.CenterText.Clear;
    PageHeader.CenterText.Add(LEReportTitle.Text);
    PageHeader.CenterText.Add('');

    BeforeGridText.Clear;
    BeforeGridText.Add('操作员：' + MainForm.CurrentUser);
    BeforeGridText.Add('打印时间: ' + DateTimeToStr(Now));
    BeforeGridText.Add('起止时间: '
      + FormatDateTime('yyyy-MM-dd', DTPStartDate1.DateTime)
      + ' ' + FormatDateTime('HH:mm:ss', DTPStartTime1.DateTime)
      + ' --- ' + FormatDateTime('yyyy-MM-dd', DTPEndDate1.DateTime)
      + ' ' + FormatDateTime('HH:mm:ss', DTPEndTime1.DateTime));
    PageFooter.CenterText.Clear;
    PageFooter.CenterText.Add('第&[Page]页/共&[Pages]页');
    Preview
  end
end;

procedure TDataQueryForm.DBGridEhWeightCellClick(Column: TColumnEh);
begin
  TWeightUtil.showWeightPic(
    DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString);
end;

procedure TDataQueryForm.N2Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printPicTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString, True,
      MainForm.systemConfig.ticketType);
  end
end;

procedure TDataQueryForm.N5Click(Sender: TObject);
begin
  if TUserUtil.HasAuthority('打印磅单') then
  begin
    TReportUtil.printPicTicket(
      DBGridEhWeight.DataSource.DataSet.FieldByName('流水号').AsString, False,
      MainForm.systemConfig.ticketType);
  end
end;

end.

