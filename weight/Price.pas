unit Price;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, ExtCtrls, StdCtrls, Menus,
  ToolCtrlsEh, DBGridEhToolCtrls, DBAxisGridsEh, DBGridEhGrouping;

type
  TPriceForm = class(TForm)
    GBShouHuo: TGroupBox;
    GBPrice: TGroupBox;
    DBGridEhShouHuo: TDBGridEh;
    DBGridEhPrice: TDBGridEh;
    PMPrice: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure DBGridEhShouHuoCellClick(Column: TColumnEh);
    procedure DBGridEhPriceDblClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure GBShouHuoDblClick(Sender: TObject);
  private
    { Private declarations }
    shouHuoId: Integer; //15880071415
  public
    { Public declarations }
    procedure selGoods(Sender: TObject);
  end;

var
  PriceForm: TPriceForm;

implementation

uses
  QueryDM, OtherUtil, PrepareUtil;

{$R *.dfm}

procedure TPriceForm.FormShow(Sender: TObject);
begin
  DBGridEhShouHuo.DataSource := QueryDataModule.DSPriceShouHuo;
  DBGridEhPrice.DataSource := QueryDataModule.DSPrice;
  TPriceUtil.showShouHuo;
end;

procedure TPriceForm.DBGridEhShouHuoCellClick(Column: TColumnEh);
begin
  shouHuoId := DBGridEhShouHuo.DataSource.DataSet.FieldByName('序号').AsInteger;
  TPriceUtil.showPrice(shouHuoId);
end;

procedure TPriceForm.DBGridEhPriceDblClick(Sender: TObject);
begin
  if TPriceUtil.savePrice(DBGridEhPrice.DataSource.DataSet.FieldByName('shouHuo').AsInteger,
    DBGridEhPrice.DataSource.DataSet.FieldByName('goodsId').AsInteger,
    StrToFloatDef(InputBox('  ', '请输入新单价         ',
    DBGridEhPrice.DataSource.DataSet.FieldByName('price').AsString), 0)) then
    TPriceUtil.showPrice(shouHuoId);
end;

procedure TPriceForm.N2Click(Sender: TObject);
begin
  if TPriceUtil.deletePrice(shouHuoId,
    DBGridEhPrice.DataSource.DataSet.FieldByName('goodsId').AsInteger) then
    TPriceUtil.showPrice(shouHuoId);
end;

procedure TPriceForm.N1Click(Sender: TObject);
var goodsForm: TForm;
  goodsList: TListBox;
  goodsId: Integer;
begin
  goodsForm := TForm.Create(nil);
  goodsList := TListBox.Create(nil);
  try
    goodsForm.Width := 150;
    goodsForm.Height := 300;
    goodsForm.Position := poScreenCenter;

    goodsList.Parent := goodsForm;
    goodsList.Align := alClient;
    goodsList.Style := lbOwnerDrawFixed;
    goodsList.ItemHeight := 25;
    TPrepareUtil.addGoodsStrings(goodsList.Items);
    goodsList.ItemIndex := 0;
    goodsList.OnDblClick := selGoods;

    goodsForm.ShowModal;

    goodsId := TPrepareUtil.getGoodsId(goodsList.Items[goodsList.ItemIndex]);
    if goodsId > 0 then
    begin
      if TPriceUtil.savePrice(shouHuoId, goodsId,
        StrToFloatDef(InputBox('', '请输入单价      ', '0'), 0)) then
      begin
        TPriceUtil.showPrice(shouHuoId);
      end;
    end;
  finally
    goodsList.Free;
    goodsForm.Free;
  end;
end;

procedure TPriceForm.selGoods(Sender: TObject);
begin
  ((Sender as TListBox).Parent as TForm).Close;
end;

procedure TPriceForm.GBShouHuoDblClick(Sender: TObject);
begin
  if Application.MessageBox('即将重建价格表，将丢失当前价格，是否继续？',
    '提示', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2 + MB_TOPMOST) =
    IDNO then
  begin
    Exit;
  end;

  if TPriceUtil.resetPrice() then
  begin
    Application.MessageBox('价格表重建成功！', '提示', MB_OK +
      MB_ICONINFORMATION + MB_TOPMOST);
  end;
end;

end.

