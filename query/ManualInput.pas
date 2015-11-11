unit ManualInput;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, Mask, RzEdit, RzLabel, ExtCtrls,
  Buttons, ComCtrls;

type
  TManualInputForm = class(TForm)
    PInput: TPanel;
    lblTare: TRzLabel;
    lblSum: TRzLabel;
    lblSpec: TRzLabel;
    lblShouHuo: TRzLabel;
    lblScale: TRzLabel;
    lblMemo: TRzLabel;
    lblReal: TRzLabel;
    lblQuanter: TRzLabel;
    lblPrice: TRzLabel;
    lblNet: TRzLabel;
    lblGross: TRzLabel;
    lblGoods: TRzLabel;
    lblFaHuo: TRzLabel;
    lblCost: TRzLabel;
    lblCar: TRzLabel;
    lblBundle: TRzLabel;
    lblBackup9: TRzLabel;
    lblBackup8: TRzLabel;
    lblBackup7: TRzLabel;
    lblBackup6: TRzLabel;
    lblBackup5: TRzLabel;
    lblBackup4: TRzLabel;
    lblBackup3: TRzLabel;
    lblBackup2: TRzLabel;
    lblBackup18: TRzLabel;
    lblBackup17: TRzLabel;
    lblBackup16: TRzLabel;
    lblBackup15: TRzLabel;
    lblBackup14: TRzLabel;
    lblBackup13: TRzLabel;
    lblBackup12: TRzLabel;
    lblBackup11: TRzLabel;
    lblBackup10: TRzLabel;
    lblBackup1: TRzLabel;
    P0: TPanel;
    P00: TPanel;
    P01: TPanel;
    P02: TPanel;
    P03: TPanel;
    P04: TPanel;
    P05: TPanel;
    P06: TPanel;
    P07: TPanel;
    P08: TPanel;
    P1: TPanel;
    P10: TPanel;
    P11: TPanel;
    P12: TPanel;
    P13: TPanel;
    P14: TPanel;
    P15: TPanel;
    P16: TPanel;
    P17: TPanel;
    P18: TPanel;
    P2: TPanel;
    P20: TPanel;
    P21: TPanel;
    P22: TPanel;
    P23: TPanel;
    P24: TPanel;
    P25: TPanel;
    P26: TPanel;
    P27: TPanel;
    P28: TPanel;
    P3: TPanel;
    P30: TPanel;
    P31: TPanel;
    P32: TPanel;
    P33: TPanel;
    P34: TPanel;
    P35: TPanel;
    P36: TPanel;
    EdtTare: TRzEdit;
    EdtSum: TRzEdit;
    CBSpec: TRzComboBox;
    CBShouHuo: TRzComboBox;
    EdtScale: TRzEdit;
    EdtMemo: TRzEdit;
    EdtReal: TRzEdit;
    EdtQuanter: TRzEdit;
    EdtPrice: TRzEdit;
    EdtNet: TRzEdit;
    CBGoods: TRzComboBox;
    CBFaHuo: TRzComboBox;
    EdtCost: TRzEdit;
    CBCar: TRzComboBox;
    EdtBundle: TRzEdit;
    EdtBackup9: TRzEdit;
    EdtBackup8: TRzEdit;
    EdtBackup7: TRzEdit;
    EdtBackup6: TRzEdit;
    CBBackup5: TRzComboBox;
    CBBackup4: TRzComboBox;
    CBBackup3: TRzComboBox;
    CBBackup2: TRzComboBox;
    EdtBackup18: TRzEdit;
    EdtBackup17: TRzEdit;
    EdtBackup16: TRzEdit;
    EdtBackup15: TRzEdit;
    CBBackup14: TRzComboBox;
    CBBackup13: TRzComboBox;
    CBBackup12: TRzComboBox;
    CBBackup11: TRzComboBox;
    CBBackup10: TRzComboBox;
    CBBackup1: TRzComboBox;
    EdtGross: TRzEdit;
    lblGrossTime: TLabel;
    lblTareTime: TLabel;
    DTPGrossDate: TDateTimePicker;
    DTPGrossTime: TDateTimePicker;
    DTPTareDate: TDateTimePicker;
    DTPTareTime: TDateTimePicker;
    BtnSave: TBitBtn;
    BtnClose: TBitBtn;
    CBUseExpress: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure CBCarDblClick(Sender: TObject);
    procedure EdtGrossChange(Sender: TObject);
    procedure EdtTareChange(Sender: TObject);
    procedure EdtScaleChange(Sender: TObject);
    procedure EdtBundleChange(Sender: TObject);
    procedure EdtPriceChange(Sender: TObject);
  private
    { Private declarations }
    procedure loadFormDesign;
    procedure clearPosition();
    procedure setPosition();
    procedure resizeWidth();
    procedure P00SetFocus();
    procedure loadFormPosition(const pv: string; pWin: TPanel);
    procedure calcNet();
    procedure calcSum();
    function setExpressionValues: Boolean;
    procedure showRecord(glideNo: string);
    procedure saveRecord();
    procedure updateRecord();
    procedure loadColAuth(); //修改记录的时候，有些字段不允许修改
  public
    { Public declarations }
    insertOrUpdate: Boolean;
    glideNo: string;
  end;

var
  ManualInputForm: TManualInputForm;

implementation

uses
  Main, WeightRecord, PrepareUtil, Car, ReportUtil, OtherUtil, Math, WeightUtil,
  ExpressionUtil, CommonUtil, PayUtil;

{$R *.dfm}

procedure TManualInputForm.clearPosition;
begin
  lblCar.Visible := False;
  CBCar.Visible := False;
  lblFaHuo.Visible := False;
  CBFaHuo.Visible := False;
  lblShouHuo.Visible := False;
  CBShouHuo.Visible := False;
  lblGoods.Visible := False;
  CBGoods.Visible := False;
  lblSpec.Visible := False;
  CBSpec.Visible := False;
  lblScale.Visible := False;
  EdtScale.Visible := False;
  lblBundle.Visible := False;
  EdtBundle.Visible := False;
  lblPrice.Visible := False;
  EdtPrice.Visible := False;
  lblMemo.Visible := False;
  EdtMemo.Visible := False;
  lblBackup1.Visible := False;
  CBBackup1.Visible := False;
  lblBackup2.Visible := False;
  CBBackup2.Visible := False;
  lblBackup3.Visible := False;
  CBBackup3.Visible := False;
  lblBackup4.Visible := False;
  CBBackup4.Visible := False;
  lblBackup5.Visible := False;
  CBBackup5.Visible := False;
  lblBackup6.Visible := False;
  EdtBackup6.Visible := False;
  lblBackup7.Visible := False;
  EdtBackup7.Visible := False;
  lblBackup8.Visible := False;
  EdtBackup8.Visible := False;
  lblBackup9.Visible := False;
  EdtBackup9.Visible := False;
  lblBackup10.Visible := False;
  CBBackup10.Visible := False;
  lblBackup11.Visible := False;
  CBBackup11.Visible := False;
  lblBackup12.Visible := False;
  CBBackup12.Visible := False;
  lblBackup13.Visible := False;
  CBBackup13.Visible := False;
  lblBackup14.Visible := False;
  CBBackup14.Visible := False;
  lblBackup15.Visible := False;
  EdtBackup15.Visible := False;
  lblBackup16.Visible := False;
  EdtBackup16.Visible := False;
  lblBackup17.Visible := False;
  EdtBackup17.Visible := False;
  lblBackup18.Visible := False;
  EdtBackup18.Visible := False;
  lblGross.Visible := False;
  EdtGross.Visible := False;
  lblTare.Visible := False;
  EdtTare.Visible := False;
  lblNet.Visible := False;
  EdtNet.Visible := False;
  lblReal.Visible := False;
  EdtReal.Visible := False;
  lblSum.Visible := False;
  EdtSum.Visible := False;
  lblCost.Visible := False;
  EdtCost.Visible := False;
  lblQuanter.Visible := False;
  EdtQuanter.Visible := False;
end;

procedure TManualInputForm.FormShow(Sender: TObject);
begin
  EdtGross.ReadOnly := not TUserUtil.HasAuthority('修改毛重');
  EdtTare.ReadOnly := not TUserUtil.HasAuthority('修改皮重');
  EdtCost.Enabled := MainForm.systemConfig.manualInputPound;

  lblGrossTime.Caption := MainForm.weightSetConfig.grossTimeCaption;
  lblTareTime.Caption := MainForm.weightSetConfig.tareTimeCaption;

  DTPGrossDate.Date := Date;
  DTPGrossTime.Time := Time;
  DTPTareDate.Date := Date;
  DTPTareTime.Time := Time;

  TPrepareUtil.addCar(CBCar);
  TPrepareUtil.addFaHuo(CBFaHuo);
  TPrepareUtil.addShouHuo(CBShouHuo);
  TPrepareUtil.addGoods(CBGoods);
  TPrepareUtil.addSpec(CBSpec);
  TPrepareUtil.addBackup1(CBBackup1);
  TPrepareUtil.addBackup2(CBBackup2);
  TPrepareUtil.addBackup3(CBBackup3);
  TPrepareUtil.addBackup4(CBBackup4);
  TPrepareUtil.addBackup5(CBBackup5);
  TPrepareUtil.addBackup10(CBBackup10);
  TPrepareUtil.addBackup11(CBBackup11);
  TPrepareUtil.addBackup12(CBBackup12);
  TPrepareUtil.addBackup13(CBBackup13);
  TPrepareUtil.addBackup14(CBBackup14);
  loadFormDesign;
  //1.将所有控件放到主窗体中去
  clearPosition();
  //2.将控件摆到配置的位置上去
  setPosition();
  //3.刷新窗体,调整控件的长度
  resizeWidth;
  P00SetFocus;

  if not insertOrUpdate then
  begin
    showRecord(glideNo);
    loadColAuth();
  end;
end;

procedure TManualInputForm.loadFormDesign;
begin
  with MainForm do
  begin
    lblCar.Caption := weightSetConfig.carCaption;
    lblFaHuo.Caption := weightSetConfig.faHuoCaption;
    lblShouHuo.Caption := weightSetConfig.shouHuoCaption;
    lblGoods.Caption := weightSetConfig.goodsCaption;
    lblSpec.Caption := weightSetConfig.specCaption;
    lblGross.Caption := weightSetConfig.grossCaption;
    lblTare.Caption := weightSetConfig.tareCaption;
    lblNet.Caption := weightSetConfig.netCaption;
    lblBundle.Caption := weightSetConfig.bundleCaption;
    lblReal.Caption := weightSetConfig.realCaption;
    lblPrice.Caption := weightSetConfig.priceCaption;
    lblSum.Caption := weightSetConfig.sumCaption;
    lblScale.Caption := weightSetConfig.scaleCaption;
    lblQuanter.Caption := weightSetConfig.quanterCaption;
    lblCost.Caption := weightSetConfig.costCaption;
    lblMemo.Caption := weightSetConfig.memoCaption;
    lblbackup1.Caption := weightSetConfig.backup1Caption;
    lblbackup2.Caption := weightSetConfig.backup2Caption;
    lblbackup3.Caption := weightSetConfig.backup3Caption;
    lblbackup4.Caption := weightSetConfig.backup4Caption;
    lblbackup5.Caption := weightSetConfig.backup5Caption;
    lblbackup6.Caption := weightSetConfig.backup6Caption;
    lblbackup7.Caption := weightSetConfig.backup7Caption;
    lblbackup8.Caption := weightSetConfig.backup8Caption;
    lblbackup9.Caption := weightSetConfig.backup9Caption;
    lblbackup10.Caption := weightSetConfig.backup10Caption;
    lblbackup11.Caption := weightSetConfig.backup11Caption;
    lblbackup12.Caption := weightSetConfig.backup12Caption;
    lblbackup13.Caption := weightSetConfig.backup13Caption;
    lblbackup14.Caption := weightSetConfig.backup14Caption;
    lblbackup15.Caption := weightSetConfig.backup15Caption;
    lblbackup16.Caption := weightSetConfig.backup16Caption;
    lblbackup17.Caption := weightSetConfig.backup17Caption;
    lblbackup18.Caption := weightSetConfig.backup18Caption;
  end;
end;

procedure TManualInputForm.P00SetFocus;
var i: Integer;
begin
  for i := 0 to P00.ControlCount - 1 do
  begin
    if P00.Controls[i].Visible then
    begin
      if (P00.Controls[i] is TRzComboBox) then
      begin
        (P00.Controls[i] as TRzComboBox).SetFocus();
        Break;
      end;
      if (P00.Controls[i] is TRzEdit) then
      begin
        (P00.Controls[i] as TRzEdit).SetFocus;
        Break;
      end;
    end;
  end;
end;

procedure TManualInputForm.resizeWidth;
var i, wInput, wPanel: Integer;
begin
  P0.Visible := False;
  for i := 0 to P0.ControlCount - 1 do
  begin
    if P0.Controls[i].Visible then
      P0.Visible := True;
  end;

  P1.Visible := False;
  for i := 0 to P1.ControlCount - 1 do
  begin
    if P1.Controls[i].Visible then
      P1.Visible := True;
  end;

  P2.Visible := False;
  for i := 0 to P2.ControlCount - 1 do
  begin
    if P2.Controls[i].Visible then
      P2.Visible := True;
  end;

  P3.Visible := False;
  for i := 0 to P3.ControlCount - 1 do
  begin
    if P3.Controls[i].Visible then
      P3.Visible := True;
  end;

  wInput := PInput.Width - PInput.BorderWidth * 2;
  if P0.Visible then
  begin
    if P1.Visible then
    begin
      if P2.Visible then
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 4;
          P0.Width := wPanel;
          P1.Width := wPanel;
          P2.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 3;
          P0.Width := wPanel;
          P1.Width := wPanel;
          P2.Width := wPanel;
        end;
      end
      else
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 3;
          P0.Width := wPanel;
          P1.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 2;
          P0.Width := wPanel;
          P1.Width := wPanel;
        end;
      end;
    end
    else
    begin
      if P2.Visible then
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 3;
          P0.Width := wPanel;
          P2.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 2;
          P0.Width := wPanel;
          P2.Width := wPanel;
        end;
      end
      else
      begin
        if P3.Visible then
        begin
          wPanel := wInput div 2;
          P0.Width := wPanel;
          P3.Width := wPanel;
        end
        else
        begin
          wPanel := wInput div 1;
          P0.Width := wPanel;
        end;
      end;
    end;
  end;
  CBCar.Width := wPanel - 75;
  CBFaHuo.Width := wPanel - 75;
  CBShouHuo.Width := wPanel - 75;
  CBGoods.Width := wPanel - 75;
  CBSpec.Width := wPanel - 75;
  EdtBundle.Width := wPanel - 75;
  EdtPrice.Width := wPanel - 75;
  EdtScale.Width := wPanel - 75;
  EdtMemo.Width := wPanel - 75;
  CBBackup1.Width := wPanel - 75;
  CBBackup2.Width := wPanel - 75;
  CBBackup3.Width := wPanel - 75;
  CBBackup4.Width := wPanel - 75;
  CBBackup5.Width := wPanel - 75;
  EdtBackup6.Width := wPanel - 75;
  EdtBackup7.Width := wPanel - 75;
  EdtBackup8.Width := wPanel - 75;
  EdtBackup9.Width := wPanel - 75;
  CBBackup10.Width := wPanel - 75;
  CBBackup11.Width := wPanel - 75;
  CBBackup12.Width := wPanel - 75;
  CBBackup13.Width := wPanel - 75;
  CBBackup14.Width := wPanel - 75;
  EdtBackup15.Width := wPanel - 75;
  EdtBackup16.Width := wPanel - 75;
  EdtBackup17.Width := wPanel - 75;
  EdtBackup18.Width := wPanel - 75;
  EdtGross.Width := wPanel - 75;
  EdtTare.Width := wPanel - 75;
  EdtNet.Width := wPanel - 75;
  EdtReal.Width := wPanel - 75;
  EdtSum.Width := wPanel - 75;
  EdtCost.Width := wPanel - 75;
  EdtQuanter.Width := wPanel - 75;
end;

procedure TManualInputForm.setPosition;
begin
  loadFormPosition(MainForm.weightSetConfig.pv00, P00);
  loadFormPosition(MainForm.weightSetConfig.pv01, P01);
  loadFormPosition(MainForm.weightSetConfig.pv02, P02);
  loadFormPosition(MainForm.weightSetConfig.pv03, P03);
  loadFormPosition(MainForm.weightSetConfig.pv04, P04);
  loadFormPosition(MainForm.weightSetConfig.pv05, P05);
  loadFormPosition(MainForm.weightSetConfig.pv06, P06);
  loadFormPosition(MainForm.weightSetConfig.pv07, P07);
  loadFormPosition(MainForm.weightSetConfig.pv08, P08);

  loadFormPosition(MainForm.weightSetConfig.pv10, P10);
  loadFormPosition(MainForm.weightSetConfig.pv11, P11);
  loadFormPosition(MainForm.weightSetConfig.pv12, P12);
  loadFormPosition(MainForm.weightSetConfig.pv13, P13);
  loadFormPosition(MainForm.weightSetConfig.pv14, P14);
  loadFormPosition(MainForm.weightSetConfig.pv15, P15);
  loadFormPosition(MainForm.weightSetConfig.pv16, P16);
  loadFormPosition(MainForm.weightSetConfig.pv17, P17);
  loadFormPosition(MainForm.weightSetConfig.pv18, P18);

  loadFormPosition(MainForm.weightSetConfig.pv20, P20);
  loadFormPosition(MainForm.weightSetConfig.pv21, P21);
  loadFormPosition(MainForm.weightSetConfig.pv22, P22);
  loadFormPosition(MainForm.weightSetConfig.pv23, P23);
  loadFormPosition(MainForm.weightSetConfig.pv24, P24);
  loadFormPosition(MainForm.weightSetConfig.pv25, P25);
  loadFormPosition(MainForm.weightSetConfig.pv26, P26);
  loadFormPosition(MainForm.weightSetConfig.pv27, P27);
  loadFormPosition(MainForm.weightSetConfig.pv28, P28);

  loadFormPosition(MainForm.weightSetConfig.pv30, P30);
  loadFormPosition(MainForm.weightSetConfig.pv31, P31);
  loadFormPosition(MainForm.weightSetConfig.pv32, P32);
  loadFormPosition(MainForm.weightSetConfig.pv33, P33);
  loadFormPosition(MainForm.weightSetConfig.pv34, P34);
  loadFormPosition(MainForm.weightSetConfig.pv35, P35);
  loadFormPosition(MainForm.weightSetConfig.pv36, P36);
end;

procedure TManualInputForm.loadFormPosition(const pv: string; pWin: TPanel);
var lblWin: TRzLabel;
  cbWin: TWinControl;
begin
  pWin.Visible := True;
  if pv = '车号' then
  begin
    lblWin := lblCar;
    cbWin := CBCar;
  end
  else if pv = '发货单位' then
  begin
    lblWin := lblFaHuo;
    cbWin := CBFaHuo;
  end
  else if pv = '收货单位' then
  begin
    lblWin := lblShouHuo;
    cbWin := CBShouHuo;
  end
  else if pv = '货名' then
  begin
    lblWin := lblGoods;
    cbWin := CBGoods;
  end
  else if pv = '规格' then
  begin
    lblWin := lblSpec;
    cbWin := CBSpec;
  end
  else if pv = '折方系数' then
  begin
    lblWin := lblScale;
    cbWin := EdtScale;
  end
  else if pv = '扣重' then
  begin
    lblWin := lblBundle;
    cbWin := EdtBundle;
  end
  else if pv = '单价' then
  begin
    lblWin := lblPrice;
    cbWin := EdtPrice;
  end
  else if pv = '备注' then
  begin
    lblWin := lblMemo;
    cbWin := EdtMemo;
  end
  else if pv = '备用1' then
  begin
    lblWin := lblBackup1;
    cbWin := CBBackup1;
  end
  else if pv = '备用2' then
  begin
    lblWin := lblBackup2;
    cbWin := CBBackup2;
  end
  else if pv = '备用3' then
  begin
    lblWin := lblBackup3;
    cbWin := CBBackup3;
  end
  else if pv = '备用4' then
  begin
    lblWin := lblBackup4;
    cbWin := CBBackup4;
  end
  else if pv = '备用5' then
  begin
    lblWin := lblBackup5;
    cbWin := CBBackup5;
  end
  else if pv = '备用6' then
  begin
    lblWin := lblBackup6;
    cbWin := EdtBackup6;
  end
  else if pv = '备用7' then
  begin
    lblWin := lblBackup7;
    cbWin := EdtBackup7;
  end
  else if pv = '备用8' then
  begin
    lblWin := lblBackup8;
    cbWin := EdtBackup8;
  end
  else if pv = '备用9' then
  begin
    lblWin := lblBackup9;
    cbWin := EdtBackup9;
  end
  else if pv = '备用10' then
  begin
    lblWin := lblBackup10;
    cbWin := CBBackup10;
  end
  else if pv = '备用11' then
  begin
    lblWin := lblBackup11;
    cbWin := CBBackup11;
  end
  else if pv = '备用12' then
  begin
    lblWin := lblBackup12;
    cbWin := CBBackup12;
  end
  else if pv = '备用13' then
  begin
    lblWin := lblBackup13;
    cbWin := CBBackup13;
  end
  else if pv = '备用14' then
  begin
    lblWin := lblBackup14;
    cbWin := CBBackup14;
  end
  else if pv = '备用15' then
  begin
    lblWin := lblBackup15;
    cbWin := EdtBackup15;
  end
  else if pv = '备用16' then
  begin
    lblWin := lblBackup16;
    cbWin := EdtBackup16;
  end
  else if pv = '备用17' then
  begin
    lblWin := lblBackup17;
    cbWin := EdtBackup17;
  end
  else if pv = '备用18' then
  begin
    lblWin := lblBackup18;
    cbWin := EdtBackup18;
  end
  else if pv = '毛重' then
  begin
    lblWin := lblGross;
    cbWin := EdtGross;
  end
  else if pv = '皮重' then
  begin
    lblWin := lblTare;
    cbWin := EdtTare;
  end
  else if pv = '净重' then
  begin
    lblWin := lblNet;
    cbWin := EdtNet;
  end
  else if pv = '实重' then
  begin
    lblWin := lblReal;
    cbWin := EdtReal;
  end
  else if pv = '金额' then
  begin
    lblWin := lblSum;
    cbWin := EdtSum;
  end
  else if pv = '过磅费' then
  begin
    lblWin := lblCost;
    cbWin := EdtCost;
  end
  else if pv = '方量' then
  begin
    lblWin := lblQuanter;
    cbWin := EdtQuanter;
  end
  else
    pWin.Visible := False;

  if (pv <> '') and (pWin.Visible) then
  begin
    lblWin.Visible := True;
    lblWin.Parent := pWin;
    lblWin.Align := alLeft;
    cbWin.Visible := True;
    cbWin.Parent := pWin;
    cbWin.Top := 1;
    cbWin.Left := 72;
    pWin.Visible := True;
  end;
end;

procedure TManualInputForm.BtnSaveClick(Sender: TObject);
begin
  if insertOrUpdate then
    saveRecord
  else
    updateRecord;
end;

procedure TManualInputForm.CBCarDblClick(Sender: TObject);
begin
  CarForm.LECar.Text := CBCar.Text;
  CarForm.Show;
end;

procedure TManualInputForm.EdtGrossChange(Sender: TObject);
begin
  if (Sender as TRzEdit).Enabled then
  begin
    if (StrToFloatDef(EdtGross.Text, 0) <> 0) and (StrToFloatDef(EdtTare.Text, 0) <> 0) then
    begin
      calcNet;
    end;
  end;
end;

procedure TManualInputForm.EdtTareChange(Sender: TObject);
begin
  if (Sender as TRzEdit).Enabled then
  begin
    if (StrToFloatDef(EdtGross.Text, 0) <> 0) and (StrToFloatDef(EdtTare.Text, 0) <> 0) then
    begin
      calcNet;
    end;
  end;
end;

procedure TManualInputForm.EdtScaleChange(Sender: TObject);
begin
  calcSum;
end;

procedure TManualInputForm.EdtBundleChange(Sender: TObject);
begin
  calcSum;
end;

procedure TManualInputForm.EdtPriceChange(Sender: TObject);
begin
  calcSum;
end;

procedure TManualInputForm.calcNet;
begin
  EdtNet.Text := FloatToStr(StrToFloatDef(EdtGross.Text, 0) - StrToFloatDef(EdtTare.Text, 0));

  if MainForm.systemConfig.useBundleRate then
    EdtReal.Text := FloatToStr(StrToFloatDef(EdtNet.Text, 0)
      * (1 - StrToFloatDef(EdtBundle.Text, 0) / 100))
  else
    EdtReal.Text := FloatToStr(StrToFloatDef(EdtNet.Text, 0)
      - StrToFloatDef(EdtBundle.Text, 0));

  EdtSum.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
    * StrToFloatDef(EdtPrice.Text, 0), MainForm.systemConfig.sumDivide,
    0 - MainForm.systemConfig.sumPoint, MainForm.systemConfig.sumType));

  if (StrToFloatDef(EdtScale.Text, 1) <> 0) then
  begin
    EdtQuanter.Text := FloatToStr(RoundTo(StrToFloatDef(EdtReal.Text, 0)
      / StrToFloatDef(EdtScale.Text, 1), 0 - MainForm.systemConfig.sumPoint));
  end;
end;

function TManualInputForm.setExpressionValues: Boolean;
begin
  if MainForm.weightSetConfig.useExpression6 then
  begin
    if (MainForm.weightSetConfig.rule61 <> 0) and (MainForm.weightSetConfig.group6 <> 0) then
    begin
      EdtBackup6.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule61, MainForm.weightSetConfig.rule62,
        MainForm.weightSetConfig.group6,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup6.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression6,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, MainForm.weightSetConfig.point6,
        MainForm.weightSetConfig.divide6, MainForm.weightSetConfig.sumType6);
      if StrToFloatDef(EdtBackup6.Text, 0) < MainForm.weightSetConfig.min6 then
        EdtBackup6.Text := FloatToStr(MainForm.weightSetConfig.min6);
    end;
  end;
  if MainForm.weightSetConfig.useExpression7 then
  begin
    if (MainForm.weightSetConfig.rule71 <> 0) and (MainForm.weightSetConfig.group7 <> 0) then
    begin
      EdtBackup7.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule71, MainForm.weightSetConfig.rule72,
        MainForm.weightSetConfig.group7,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup7.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression7,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text,
        MainForm.weightSetConfig.point7,
        MainForm.weightSetConfig.divide7, MainForm.weightSetConfig.sumType7);
      if StrToFloatDef(EdtBackup7.Text, 0) < MainForm.weightSetConfig.min7 then
        EdtBackup7.Text := FloatToStr(MainForm.weightSetConfig.min7);
    end;
  end;
  if MainForm.weightSetConfig.useExpression8 then
  begin
    if (MainForm.weightSetConfig.rule81 <> 0) and (MainForm.weightSetConfig.group8 <> 0) then
    begin
      EdtBackup8.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule81, MainForm.weightSetConfig.rule82,
        MainForm.weightSetConfig.group8,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup8.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression8,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text,
        MainForm.weightSetConfig.point8,
        MainForm.weightSetConfig.divide8, MainForm.weightSetConfig.sumType8);
      if StrToFloatDef(EdtBackup8.Text, 0) < MainForm.weightSetConfig.min8 then
        EdtBackup8.Text := FloatToStr(MainForm.weightSetConfig.min8);
    end
  end;
  if MainForm.weightSetConfig.useExpression9 then
  begin
    if (MainForm.weightSetConfig.rule91 <> 0) and (MainForm.weightSetConfig.group9 <> 0) then
    begin
      EdtBackup9.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule91, MainForm.weightSetConfig.rule92,
        MainForm.weightSetConfig.group9,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup9.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression9,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        MainForm.weightSetConfig.point9,
        MainForm.weightSetConfig.divide9, MainForm.weightSetConfig.sumType9);
      if StrToFloatDef(EdtBackup9.Text, 0) < MainForm.weightSetConfig.min9 then
        EdtBackup9.Text := FloatToStr(MainForm.weightSetConfig.min9);
    end;
  end;
  if MainForm.weightSetConfig.useExpression15 then
  begin
    if (MainForm.weightSetConfig.rule151 <> 0) and (MainForm.weightSetConfig.group15 <> 0) then
    begin
      EdtBackup15.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule151, MainForm.weightSetConfig.rule152,
        MainForm.weightSetConfig.group15,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup15.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression15,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, MainForm.weightSetConfig.point15,
        MainForm.weightSetConfig.divide15, MainForm.weightSetConfig.sumType15);
      if StrToFloatDef(EdtBackup15.Text, 0) < MainForm.weightSetConfig.min15 then
        EdtBackup15.Text := FloatToStr(MainForm.weightSetConfig.min15);
    end;
  end;
  if MainForm.weightSetConfig.useExpression16 then
  begin
    if (MainForm.weightSetConfig.rule161 <> 0) and (MainForm.weightSetConfig.group16 <> 0) then
    begin
      EdtBackup16.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule161, MainForm.weightSetConfig.rule162,
        MainForm.weightSetConfig.group16,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup16.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression16,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, MainForm.weightSetConfig.point16,
        MainForm.weightSetConfig.divide16, MainForm.weightSetConfig.sumType16);
      if StrToFloatDef(EdtBackup16.Text, 0) < MainForm.weightSetConfig.min16 then
        EdtBackup16.Text := FloatToStr(MainForm.weightSetConfig.min16);
    end;
  end;
  if MainForm.weightSetConfig.useExpression17 then
  begin
    if (MainForm.weightSetConfig.rule171 <> 0) and (MainForm.weightSetConfig.group17 <> 0) then
    begin
      EdtBackup17.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule171, MainForm.weightSetConfig.rule172,
        MainForm.weightSetConfig.group17,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup17.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression17,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text,
        MainForm.weightSetConfig.point17,
        MainForm.weightSetConfig.divide17, MainForm.weightSetConfig.sumType17);
      if StrToFloatDef(EdtBackup17.Text, 0) < MainForm.weightSetConfig.min17 then
        EdtBackup17.Text := FloatToStr(MainForm.weightSetConfig.min17);
    end;
  end;
  if MainForm.weightSetConfig.useExpression18 then
  begin
    if (MainForm.weightSetConfig.rule181 <> 0) and (MainForm.weightSetConfig.group18 <> 0) then
    begin
      EdtBackup18.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.weightSetConfig.rule181, MainForm.weightSetConfig.rule182,
        MainForm.weightSetConfig.group18,
        CBCar.Text, CBFaHuo.Text, CBShouHuo.Text, CBGoods.Text, CBSpec.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text, CBBackup4.Text, CBBackup5.Text,
        CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtReal.Text, EdtSum.Text,
        EdtQuanter.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text));
    end
    else
    begin
      EdtBackup18.Text := TExpressionUtil.getExpressionValue(MainForm.weightSetConfig.expression18,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        MainForm.weightSetConfig.point18,
        MainForm.weightSetConfig.divide18, MainForm.weightSetConfig.sumType18);
      if StrToFloatDef(EdtBackup18.Text, 0) < MainForm.weightSetConfig.min18 then
        EdtBackup18.Text := FloatToStr(MainForm.weightSetConfig.min18);
    end;
  end;
end;

procedure TManualInputForm.saveRecord;
var w: TWeightRecord;
  dtFormat: TFormatSettings;
begin
  {
  if (StrToFloatDef(EdtGross.Text, 0) = 0) and (StrToFloatDef(EdtTare.Text, 0) = 0) then
  begin
    MainForm.ShowMsg('毛重及皮重不能同时为空');
    Exit;
  end;
  }
  if CBUseExpress.Checked then
    setExpressionValues();
  w := TWeightRecord.Create;
  try
    w.carNo := CBCar.Text;
      w.weightType := 'PO';
    w.faHuo := CBFaHuo.Text;
    w.shouHuo := CBShouHuo.Text;
    w.goods := CBGoods.Text;
    w.spec := CBSpec.Text;
    w.gross := StrToFloatDef(EdtGross.Text, 0);
    w.tare := StrToFloatDef(EdtTare.Text, 0);
    w.net := StrToFloatDef(EdtNet.Text, 0);
    w.bundle := StrToFloatDef(EdtBundle.Text, 0);
    w.real := StrToFloatDef(EdtReal.Text, 0);
    w.price := StrToFloatDef(EdtPrice.Text, 0);
    w.sum := StrToFloatDef(EdtSum.Text, 0);
    w.scale := StrToFloatDef(EdtScale.Text, 0);
    w.quanter := StrToFloatDef(EdtQuanter.Text, 0);
    w.cost := StrToFloatDef(EdtCost.Text, 0);
    w.grossMan := MainForm.CurrentUser;
    w.tareMan := MainForm.CurrentUser;
    w.grossAddr := MainForm.systemConfig.addr;
    w.tareAddr := MainForm.systemConfig.addr;

    GetLocaleFormatSettings(GetUserDefaultLCID, dtFormat);
    dtFormat.DateSeparator := '-';
    dtFormat.TimeSeparator := ':';
    dtFormat.ShortDateFormat := 'yyyy-mm-dd';
    dtFormat.ShortTimeFormat := 'hh:nn:ss';

    w.grossTime := StrToDateTime(FormatDateTime('yyyy-MM-dd', DTPGrossDate.Date)
      + ' ' + FormatDateTime('hh:mm:ss', DTPGrossTime.Time), dtFormat);
    w.tareTime := StrToDateTime(FormatDateTime('yyyy-MM-dd', DTPTareDate.Date)
      + ' ' + FormatDateTime('hh:mm:ss', DTPTareTime.Time), dtFormat);
    w.firstTime := Now;
    w.secondTime := Now;
    w.updateUser := MainForm.CurrentUser;
    w.updateTime := Now;
    w.memo := EdtMemo.Text;
    w.printCount := 0;
    w.upload := False;
    w.backup1 := CBBackup1.Text;
    w.backup2 := CBBackup2.Text;
    w.backup3 := CBBackup3.Text;
    w.backup4 := CBBackup4.Text;
    w.backup5 := CBBackup5.Text;
    w.backup6 := StrToFloatDef(EdtBackup6.Text, 0);
    w.backup7 := StrToFloatDef(EdtBackup7.Text, 0);
    w.backup8 := StrToFloatDef(EdtBackup8.Text, 0);
    w.backup9 := StrToFloatDef(EdtBackup9.Text, 0);
    w.backup10 := CBBackup10.Text;
    w.backup11 := CBBackup11.Text;
    w.backup12 := CBBackup12.Text;
    w.backup13 := CBBackup13.Text;
    w.backup14 := CBBackup14.Text;
    w.backup15 := StrToFloatDef(EdtBackup15.Text, 0);
    w.backup16 := StrToFloatDef(EdtBackup16.Text, 0);
    w.backup17 := StrToFloatDef(EdtBackup17.Text, 0);
    w.backup18 := StrToFloatDef(EdtBackup18.Text, 0);
    if TWeightRecordUtil.save(w) then
    begin
      TLogUtil.AddLog('新增记录:' + w.toString);
      if Application.MessageBox('是否打印?', '提示', MB_YESNO +
        MB_ICONQUESTION + MB_TOPMOST) = IDYES then
      begin
        TReportUtil.printTicket(w.glideNo, True);
      end
      else
      begin
        Application.MessageBox('新增单据成功!', '提示', MB_OK +
          MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
      end;
    end;
  finally
    w.Free;
  end;
end;

procedure TManualInputForm.showRecord(glideNo: string);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(glideNo, w) then
    begin
      CBCar.Text := w.carNo;
      CBFaHuo.Text := w.faHuo;
      CBShouHuo.Text := w.shouHuo;
      CBGoods.Text := w.goods;
      CBSpec.Text := w.spec;
      EdtGross.Text := FloatToStr(w.gross);
      EdtTare.Text := FloatToStr(w.tare);
      EdtNet.Text := FloatToStr(w.net);
      EdtBundle.Text := FloatToStr(w.bundle);
      EdtReal.Text := FloatToStr(w.real);
      EdtPrice.Text := FloatToStr(w.price);
      EdtSum.Text := FloatToStr(w.sum);
      EdtScale.Text := FloatToStr(w.scale);
      EdtQuanter.Text := FloatToStr(w.quanter);
      EdtCost.Text := FloatToStr(w.cost);
      EdtMemo.Text := w.memo;
      if w.grossTime <> 0 then
      begin
        DTPGrossDate.Date := w.grossTime;
        DTPGrossTime.Time := w.grossTime;
      end;
      if w.tareTime <> 0 then
      begin
        DTPTareDate.Date := w.tareTime;
        DTPTareDate.Time := w.tareTime;
      end;
      CBBackup1.Text := w.backup1;
      CBBackup2.Text := w.backup2;
      CBBackup3.Text := w.backup3;
      CBBackup4.Text := w.backup4;
      CBBackup5.Text := w.backup5;
      EdtBackup6.Text := FloatToStr(w.backup6);
      EdtBackup7.Text := FloatToStr(w.backup7);
      EdtBackup8.Text := FloatToStr(w.backup8);
      EdtBackup9.Text := FloatToStr(w.backup9);
      CBBackup10.Text := w.backup10;
      CBBackup11.Text := w.backup11;
      CBBackup12.Text := w.backup12;
      CBBackup13.Text := w.backup13;
      CBBackup14.Text := w.backup14;
      EdtBackup15.Text := FloatToStr(w.backup15);
      EdtBackup16.Text := FloatToStr(w.backup16);
      EdtBackup17.Text := FloatToStr(w.backup17);
      EdtBackup18.Text := FloatToStr(w.backup18);
    end;
  finally
    w.Free;
  end;
end;

procedure TManualInputForm.updateRecord;
var w: TWeightRecord;
  initWstring: string;
  dtFormat: TFormatSettings;
begin
  {
  if (StrToFloatDef(EdtGross.Text, 0) = 0) and (StrToFloatDef(EdtTare.Text, 0) = 0) then
  begin
    MainForm.ShowMsg('毛重及皮重不能同时为空');
    Exit;
  end;
  }
  if CBUseExpress.Checked then
    setExpressionValues();
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(glideNo, w) then
    begin

      initWstring := w.toString;

      //如果修改了收货单位，先把原来收货单位的钱先补上，修改后的单位再花掉这部分的钱
      if MainForm.systemConfig.usePay then
      begin
        case MainForm.systemConfig.payType of
          0: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.sum));
          1: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.real));
          2: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.quanter));
          3: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup6));
          4: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup7));
          5: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup8));
          6: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup9));
          7: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup15));
          8: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup16));
          9: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup17));
          10: TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.backup18));
        else
          TPayUtil.pay(w.shouHuo, FloatToStr(0 - w.sum));
        end;
      end;

      w.carNo := CBCar.Text;
      w.weightType := 'PO';
      w.faHuo := CBFaHuo.Text;
      w.shouHuo := CBShouHuo.Text;
      w.goods := CBGoods.Text;
      w.spec := CBSpec.Text;
      w.gross := StrToFloatDef(EdtGross.Text, 0);
      w.tare := StrToFloatDef(EdtTare.Text, 0);
      w.net := StrToFloatDef(EdtNet.Text, 0);
      w.bundle := StrToFloatDef(EdtBundle.Text, 0);
      w.real := StrToFloatDef(EdtReal.Text, 0);
      w.price := StrToFloatDef(EdtPrice.Text, 0);
      w.sum := StrToFloatDef(EdtSum.Text, 0);
      w.scale := StrToFloatDef(EdtScale.Text, 0);
      w.quanter := StrToFloatDef(EdtQuanter.Text, 0);
      w.cost := StrToFloatDef(EdtCost.Text, 0);
      if w.grossMan = '' then
      begin
        w.grossMan := MainForm.CurrentUser;
        w.grossAddr := MainForm.systemConfig.addr;
      end;
      if w.tareMan = '' then
      begin
        w.tareMan := MainForm.CurrentUser;
        w.tareAddr := MainForm.systemConfig.addr;
      end;
      GetLocaleFormatSettings(GetUserDefaultLCID, dtFormat);
      dtFormat.DateSeparator := '-';
      dtFormat.TimeSeparator := ':';
      dtFormat.ShortDateFormat := 'yyyy-mm-dd';
      dtFormat.ShortTimeFormat := 'hh:nn:ss';

      w.grossTime := StrToDateTime(FormatDateTime('yyyy-MM-dd', DTPGrossDate.Date)
        + ' ' + FormatDateTime('hh:mm:ss', DTPGrossTime.Time), dtFormat);
      w.tareTime := StrToDateTime(FormatDateTime('yyyy-MM-dd', DTPTareDate.Date)
        + ' ' + FormatDateTime('hh:mm:ss', DTPTareTime.Time), dtFormat);
      w.firstTime := Now;
      w.secondTime := Now;
      w.updateUser := MainForm.CurrentUser;
      w.updateTime := Now;
      w.memo := EdtMemo.Text;
      w.printCount := 0;
      w.upload := False;
      w.backup1 := CBBackup1.Text;
      w.backup2 := CBBackup2.Text;
      w.backup3 := CBBackup3.Text;
      w.backup4 := CBBackup4.Text;
      w.backup5 := CBBackup5.Text;
      w.backup6 := StrToFloatDef(EdtBackup6.Text, 0);
      w.backup7 := StrToFloatDef(EdtBackup7.Text, 0);
      w.backup8 := StrToFloatDef(EdtBackup8.Text, 0);
      w.backup9 := StrToFloatDef(EdtBackup9.Text, 0);
      w.backup10 := CBBackup10.Text;
      w.backup11 := CBBackup11.Text;
      w.backup12 := CBBackup12.Text;
      w.backup13 := CBBackup13.Text;
      w.backup14 := CBBackup14.Text;
      w.backup15 := StrToFloatDef(EdtBackup15.Text, 0);
      w.backup16 := StrToFloatDef(EdtBackup16.Text, 0);
      w.backup17 := StrToFloatDef(EdtBackup17.Text, 0);
      w.backup18 := StrToFloatDef(EdtBackup18.Text, 0);
      if TWeightRecordUtil.save(w) then
      begin

        TLogUtil.AddLog('更新记录.原记录:' + initWstring + '现记录:' + w.toString);

        if MainForm.systemConfig.usePay then
        begin
          case MainForm.systemConfig.payType of
            0: TPayUtil.pay(w.shouHuo, FloatToStr(w.sum));
            1: TPayUtil.pay(w.shouHuo, FloatToStr(w.real));
            2: TPayUtil.pay(w.shouHuo, FloatToStr(w.quanter));
            3: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup6));
            4: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup7));
            5: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup8));
            6: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup9));
            7: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup15));
            8: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup16));
            9: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup17));
            10: TPayUtil.pay(w.shouHuo, FloatToStr(w.backup18));
          else
            TPayUtil.pay(w.shouHuo, FloatToStr(w.sum));
          end;
        end;

        if Application.MessageBox('是否打印?', '提示', MB_YESNO +
          MB_ICONQUESTION + MB_TOPMOST) = IDYES then
        begin
          TReportUtil.printTicket(w.glideNo, True);
        end
        else
        begin
          Application.MessageBox('更新单据成功!', '提示', MB_OK +
            MB_ICONINFORMATION + MB_DEFBUTTON2 + MB_TOPMOST);
        end;
      end;
    end;
  finally
    w.Free;
  end;
end;

procedure TManualInputForm.loadColAuth;
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
  CBCar.ReadOnly := not mCar;
  CBFaHuo.ReadOnly := not mFaHuo;
  CBShouHuo.ReadOnly := not mShouHuo;
  CBGoods.ReadOnly := not mGoods;
  CBSpec.ReadOnly := not mSpec;
  EdtGross.ReadOnly := not mGross;
  EdtTare.ReadOnly := not mTare;
  EdtBundle.ReadOnly := not mBundle;
  EdtPrice.ReadOnly := not mPrice;
  EdtScale.ReadOnly := not mScale;
  EdtCost.ReadOnly := not mCost;
  CBBackup1.ReadOnly := not mBackup1;
  CBBackup2.ReadOnly := not mBackup2;
  CBBackup3.ReadOnly := not mBackup3;
  CBBackup4.ReadOnly := not mBackup4;
  CBBackup5.ReadOnly := not mBackup5;
  EdtBackup6.ReadOnly := not mBackup6;
  EdtBackup7.ReadOnly := not mBackup7;
  EdtBackup8.ReadOnly := not mBackup8;
  EdtBackup9.ReadOnly := not mBackup9;
  CBBackup10.ReadOnly := not mBackup10;
  CBBackup11.ReadOnly := not mBackup11;
  CBBackup12.ReadOnly := not mBackup12;
  CBBackup13.ReadOnly := not mBackup13;
  CBBackup14.ReadOnly := not mBackup14;
  EdtBackup15.ReadOnly := not mBackup15;
  EdtBackup16.ReadOnly := not mBackup16;
  EdtBackup17.ReadOnly := not mBackup17;
  EdtBackup18.ReadOnly := not mBackup18;
end;

procedure TManualInputForm.calcSum;
begin
  if StrToFloatDef(EdtNet.Text, 0) > 0 then
  begin
    if MainForm.systemConfig.useBundleRate then
      EdtReal.Text := FloatToStr(StrToFloatDef(EdtNet.Text, 0)
        * (1 - StrToFloatDef(EdtBundle.Text, 0) / 100))
    else
      EdtReal.Text := FloatToStr(StrToFloatDef(EdtNet.Text, 0)
        - StrToFloatDef(EdtBundle.Text, 0));
    EdtSum.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
      * StrToFloatDef(EdtPrice.Text, 0), MainForm.systemConfig.sumDivide,
      0 - MainForm.systemConfig.sumPoint, MainForm.systemConfig.sumType));

    if StrToFloatDef(EdtScale.Text, 1) <> 0 then
    begin
      EdtQuanter.Text := FloatToStr(RoundTo(StrToFloatDef(EdtReal.Text, 0)
        / StrToFloatDef(EdtScale.Text, 1), 0 - MainForm.systemConfig.sumPoint));
    end;
  end;
end;

end.

