unit PrepareMaintain;

interface

uses
  Classes, Controls, Forms, Dialogs, Windows,
  DBGridEh, Buttons, DBActns, ActnList, GridsEh, StdCtrls,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, RzTabs, DBGridEhGrouping;

type
  TPrepareMaintainForm = class(TForm)
    AppendBtn: TBitBtn;
    DeleteBtn: TBitBtn;
    SaveBtn: TBitBtn;
    EditBtn: TBitBtn;
    CancelBtn: TBitBtn;
    RefreshBitBtn: TBitBtn;
    DBGridEh1: TDBGridEh;
    ActionListPreMaintain: TActionList;
    DataSetInsert1: TDataSetInsert;
    DataSetDelete1: TDataSetDelete;
    DataSetEdit1: TDataSetEdit;
    DataSetPost1: TDataSetPost;
    DataSetCancel1: TDataSetCancel;
    DataSetRefresh1: TDataSetRefresh;
    BitBtnExport: TBitBtn;
    BitBtnImport: TBitBtn;
    PCPrepare: TRzPageControl;
    TSCar: TRzTabSheet;
    TSFaHuo: TRzTabSheet;
    TSShouHuo: TRzTabSheet;
    TSGoods: TRzTabSheet;
    TSSpec: TRzTabSheet;
    TSBackup1: TRzTabSheet;
    TSBackup2: TRzTabSheet;
    TSBackup3: TRzTabSheet;
    TSBackup4: TRzTabSheet;
    TSBackup5: TRzTabSheet;
    TSBackup10: TRzTabSheet;
    TSBackup11: TRzTabSheet;
    TSBackup12: TRzTabSheet;
    TSBackup13: TRzTabSheet;
    TSBackup14: TRzTabSheet;
    EdtSearch: TEdit;
    procedure FormShow(Sender: TObject);
    procedure TabSheetShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtnImportClick(Sender: TObject);
    procedure BitBtnExportClick(Sender: TObject);
    procedure EdtSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    toMainForm: Boolean;
  end;

var
  PrepareMaintainForm: TPrepareMaintainForm;

implementation

uses QueryDM, Main, PrepareUtil, CommonUtil;

{$R *.dfm}

procedure TPrepareMaintainForm.TabSheetShow(Sender: TObject);
begin
  with QueryDataModule.PrepareMaintainQuery do
  begin
    Close;
    case (Sender as TRzTabSheet).PageIndex of
      0: SQL.Text := 'select 车号 as [' + MainForm.poWeightSetConfig.carCaption + '],皮重,备注 from 车号 order by 车号';
      1: SQL.Text := 'select 代码,发货单位 as [' + MainForm.poWeightSetConfig.faHuoCaption + '] from 发货单位 order by 代码';
      2: SQL.Text := 'select 代码,收货单位 as [' + MainForm.poWeightSetConfig.shouHuoCaption + '],当前金额,信用额度 from 收货单位 order by 代码';
      3: SQL.Text := 'select 代码,货名 as [' + MainForm.poWeightSetConfig.goodsCaption + '],单价 as ['
        + MainForm.poWeightSetConfig.priceCaption + '],折方系数 as ['
          + MainForm.poWeightSetConfig.scaleCaption + '] from 货名 order by 代码';
      4: SQL.Text := 'select 代码,规格 as [' + MainForm.poWeightSetConfig.specCaption + '] from 规格 order by 代码';
      5: SQL.Text := 'select 代码,备用1 as [' + MainForm.poWeightSetConfig.backup1Caption + '] from 备用1 order by 代码';
      6: SQL.Text := 'select 代码,备用2 as [' + MainForm.poWeightSetConfig.backup2Caption + '] from 备用2 order by 代码';
      7: SQL.Text := 'select 代码,备用3 as [' + MainForm.poWeightSetConfig.backup3Caption + '] from 备用3 order by 代码';
      8: SQL.Text := 'select 代码,备用4 as [' + MainForm.poWeightSetConfig.backup4Caption + '] from 备用4 order by 代码';
      9: SQL.Text := 'select 代码,备用5 as [' + MainForm.poWeightSetConfig.backup5Caption + '] from 备用5 order by 代码';
      10: SQL.Text := 'select 代码,备用10 as [' + MainForm.poWeightSetConfig.backup10Caption + '] from 备用10 order by 代码';
      11: SQL.Text := 'select 代码,备用11 as [' + MainForm.poWeightSetConfig.backup11Caption + '] from 备用11 order by 代码';
      12: SQL.Text := 'select 代码,备用12 as [' + MainForm.poWeightSetConfig.backup12Caption + '] from 备用12 order by 代码';
      13: SQL.Text := 'select 代码,备用13 as [' + MainForm.poWeightSetConfig.backup13Caption + '] from 备用13 order by 代码';
      14: SQL.Text := 'select 代码,备用14 as [' + MainForm.poWeightSetConfig.backup14Caption + '] from 备用14 order by 代码';
    end;
    Open;
  end;
  Repaint;
end;

procedure TPrepareMaintainForm.FormShow(Sender: TObject);
begin
  DBGridEh1.DataSource := QueryDataModule.PrepareMaintainDS;

  TSCar.Caption := MainForm.poWeightSetConfig.carCaption;
  TSFaHuo.Caption := MainForm.poWeightSetConfig.faHuoCaption;
  TSShouHuo.Caption := MainForm.poWeightSetConfig.shouHuoCaption;
  TSGoods.Caption := MainForm.poWeightSetConfig.goodsCaption;
  TSSpec.Caption := MainForm.poWeightSetConfig.specCaption;
  TSBackup1.Caption := MainForm.poWeightSetConfig.backup1Caption;
  TSBackup2.Caption := MainForm.poWeightSetConfig.backup2Caption;
  TSBackup3.Caption := MainForm.poWeightSetConfig.backup3Caption;
  TSBackup4.Caption := MainForm.poWeightSetConfig.backup4Caption;
  TSBackup5.Caption := MainForm.poWeightSetConfig.backup5Caption;
  TSBackup10.Caption := MainForm.poWeightSetConfig.backup10Caption;
  TSBackup11.Caption := MainForm.poWeightSetConfig.backup11Caption;
  TSBackup12.Caption := MainForm.poWeightSetConfig.backup12Caption;
  TSBackup13.Caption := MainForm.poWeightSetConfig.backup13Caption;
  TSBackup14.Caption := MainForm.poWeightSetConfig.backup14Caption;

  EdtSearch.SetFocus;
end;

procedure TPrepareMaintainForm.DBGridEh1DblClick(Sender: TObject);
begin
  if toMainForm then
  begin
    case PCPrepare.ActivePageIndex of
      0: MainForm.FrmWeight1.CBCar.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.carCaption).AsString;
      1: MainForm.FrmWeight1.CBFaHuo.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.faHuoCaption).AsString;
      2: MainForm.FrmWeight1.CBShouHuo.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.shouHuoCaption).AsString;
      3: MainForm.FrmWeight1.CBGoods.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.GoodsCaption).AsString;
      4: MainForm.FrmWeight1.CBSpec.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.specCaption).AsString;
      5: MainForm.FrmWeight1.CBBackup1.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup1Caption).AsString;
      6: MainForm.FrmWeight1.CBBackup2.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup2Caption).AsString;
      7: MainForm.FrmWeight1.CBBackup3.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup3Caption).AsString;
      8: MainForm.FrmWeight1.CBBackup4.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup4Caption).AsString;
      9: MainForm.FrmWeight1.CBBackup5.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup5Caption).AsString;
      10: MainForm.FrmWeight1.CBBackup10.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup10Caption).AsString;
      11: MainForm.FrmWeight1.CBBackup11.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup11Caption).AsString;
      12: MainForm.FrmWeight1.CBBackup12.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup12Caption).AsString;
      13: MainForm.FrmWeight1.CBBackup13.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup13Caption).AsString;
      14: MainForm.FrmWeight1.CBBackup14.Text := DBGridEh1.DataSource.DataSet.FieldByName(MainForm.poWeightSetConfig.backup14Caption).AsString;
    end;
    Close;
  end;
end;

procedure TPrepareMaintainForm.BitBtnImportClick(Sender: TObject);
var od: TOpenDialog;
  sl: TStrings;
  i: integer;
begin
  od := TOpenDialog.Create(Application);
  try
    od.Filter := '文本文件(*.txt)|*.txt';
    od.FileName := '';
    if od.Execute then
    begin
      sl := TStringList.Create;
      try
        sl.LoadFromFile(od.FileName);
        for i := 0 to sl.Count - 1 do
        begin
          case PCPrepare.ActivePageIndex of
            0: TPrepareUtil.importCar(sl.Strings[i]);
            1: TPrepareUtil.importFaHuo(sl.Strings[i]);
            2: TPrepareUtil.importShouHuo(sl.Strings[i]);
            3: TPrepareUtil.importGoods(sl.Strings[i]);
            4: TPrepareUtil.importSpec(sl.Strings[i]);
            5: TPrepareUtil.importBackup1(sl.Strings[i]);
            6: TPrepareUtil.importBackup2(sl.Strings[i]);
            7: TPrepareUtil.importBackup3(sl.Strings[i]);
            8: TPrepareUtil.importBackup4(sl.Strings[i]);
            9: TPrepareUtil.importBackup5(sl.Strings[i]);
            10: TPrepareUtil.importBackup10(sl.Strings[i]);
            11: TPrepareUtil.importBackup11(sl.Strings[i]);
            12: TPrepareUtil.importBackup12(sl.Strings[i]);
            13: TPrepareUtil.importBackup13(sl.Strings[i]);
            14: TPrepareUtil.importBackup14(sl.Strings[i]);
          end;
        end;
        Application.MessageBox('导入数据成功!', '提示', MB_OK +
          MB_ICONINFORMATION + MB_TOPMOST);
      finally
        sl.Free;
      end;
    end;
  finally
    od.Free;
  end;
end;

procedure TPrepareMaintainForm.BitBtnExportClick(Sender: TObject);
begin
  if TCommonUtil.exportExcel(DBGridEh1) then
    Application.MessageBox('数据导出成功!', '警告', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);
end;

procedure TPrepareMaintainForm.EdtSearchChange(Sender: TObject);
begin
  case PCPrepare.ActivePageIndex of
    0: TPrepareUtil.searchCarNo(EdtSearch.Text);
    1: TPrepareUtil.searchFaHuo(EdtSearch.Text);
    2: TPrepareUtil.searchShouHuo(EdtSearch.Text);
    3: TPrepareUtil.searchGoods(EdtSearch.Text);
    4: TPrepareUtil.searchSpec(EdtSearch.Text);
    5: TPrepareUtil.searchBackup1(EdtSearch.Text);
    6: TPrepareUtil.searchBackup2(EdtSearch.Text);
    7: TPrepareUtil.searchBackup3(EdtSearch.Text);
    8: TPrepareUtil.searchBackup4(EdtSearch.Text);
    9: TPrepareUtil.searchBackup5(EdtSearch.Text);
    10: TPrepareUtil.searchBackup10(EdtSearch.Text);
    11: TPrepareUtil.searchBackup11(EdtSearch.Text);
    12: TPrepareUtil.searchBackup12(EdtSearch.Text);
    13: TPrepareUtil.searchBackup13(EdtSearch.Text);
    14: TPrepareUtil.searchBackup14(EdtSearch.Text);
  end;
end;

end.
