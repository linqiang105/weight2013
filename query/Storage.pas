unit Storage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Buttons, ComCtrls,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TStorageForm = class(TForm)
    PFunc: TPanel;
    DBGridEhStorage: TDBGridEh;
    lblGoods: TLabel;
    CBGoods: TComboBox;
    DTPStart: TDateTimePicker;
    DTPEnd: TDateTimePicker;
    lblTo: TLabel;
    BtnStat: TBitBtn;
    BtnExport: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BtnStatClick(Sender: TObject);
    procedure BtnExportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  StorageForm: TStorageForm;

implementation

uses
  PrepareUtil, DateUtils, QueryDM, CommonUtil, Main;

{$R *.dfm}

procedure TStorageForm.FormShow(Sender: TObject);
begin
  TPrepareUtil.addGoods(CBGoods);
  DTPStart.Date := StartOfTheMonth(Date);
  DTPEnd.Date := EndOfTheMonth(Date);
  BtnStat.SetFocus;
end;

procedure TStorageForm.BtnStatClick(Sender: TObject);
var sqlStr: string;
begin

  if MainForm.systemConfig.databaseInUse then
  begin
    MainForm.ShowMsg('本功能暂时只支持联网模式下使用');
    Exit;
  end;

  DBGridEhStorage.DataSource := QueryDataModule.DSStorage;

  sqlStr := 'select t1.货名,t1.入库次数,t1.入库数量,t1.入库金额,'
    + 't2.出库次数,t2.出库数量,t2.出库金额,'
    + 't1.入库数量-t2.出库数量 as 库存数量,'
    + 't2.出库金额-t1.入库金额 as 盈利 from '
    + '(select 货名,count(流水号) as 入库次数,SUM(净重) as 入库数量,'
    + 'SUM(金额) as 入库金额 from 称重信息 where (过磅类型=''PO'')';
  if CBGoods.Text <> '' then
  begin
    sqlStr := sqlStr + ' and (货名=''' + CBGoods.Text + ''')';
  end;
  sqlStr := sqlStr + ' and (更新时间 between :start1 and :end1) group by 货名';

  sqlstr := sqlStr + ') as t1 join '
    + '(select 货名,count(流水号) as 出库次数,SUM(净重) as 出库数量,'
    + 'SUM(金额) as 出库金额 from 称重信息 where (过磅类型=''SO'')';
  if CBGoods.Text <> '' then
  begin
    sqlStr := sqlStr + ' and (货名=''' + CBGoods.Text + ''')';
  end;
  sqlStr := sqlStr + ' and (更新时间 between :start2 and :end2) group by 货名';

  sqlstr := sqlStr + ') as t2 on t1.货名=t2.货名';
 {
  sqlStr := 'select t1.货名,t1.入库次数,t1.入库数量,t1.入库金额,'
    + 't2.出库次数,t2.出库数量,t2.出库金额,'
    + 't1.入库数量-t2.出库数量 as 库存数量,'
    + 't2.出库金额-t1.入库金额 as 盈利 from '
    + '(select 货名,count(流水号) as 入库次数,SUM(净重) as 入库数量,'
    + 'SUM(金额) as 入库金额 from 称重信息 where (过磅类型=''PO'')';
  if CBGoods.Text <> '' then
    sqlStr := sqlStr + ' and (货名=:goods1)';
  sqlStr := sqlStr + ' and (更新时间 between :start1 and :end1) group by 货名';

  sqlstr := sqlStr + ') as t1 join '
    + '(select 货名,count(流水号) as 出库次数,SUM(净重) as 出库数量,'
    + 'SUM(金额) as 出库金额 from 称重信息 where (过磅类型=''SO'')';
  if CBGoods.Text <> '' then
    sqlStr := sqlStr + ' and (货名=:goods2)';
  sqlStr := sqlStr + ' and (更新时间 between :start2 and :end2) group by 货名';

  sqlstr := sqlStr + ') as t2 on t1.货名=t2.货名';
  }
  with QueryDataModule.ADOQStorage do
  begin
    Close;
    SQL.Text := sqlStr;
    {if CBGoods.Text <> '' then
    begin
      Parameters.ParamByName('goods1').Value := CBGoods.Text;
      Parameters.ParamByName('goods2').Value := CBGoods.Text;
    end;  }
    Parameters.ParamByName('start1').Value := StartOfTheDay(DTPStart.Date);
    Parameters.ParamByName('end1').Value := EndOfTheDay(DTPEnd.Date);
    Parameters.ParamByName('start2').Value := StartOfTheDay(DTPStart.Date);
    Parameters.ParamByName('end2').Value := EndOfTheDay(DTPEnd.Date);
    Open;
  end;
end;

procedure TStorageForm.BtnExportClick(Sender: TObject);
begin
  TCommonUtil.exportExcel(DBGridEhStorage);
end;

end.

