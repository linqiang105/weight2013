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
    EdtGlideNo: TEdit;
    RGWeightType: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure CBCarDblClick(Sender: TObject);
    procedure EdtGrossChange(Sender: TObject);
    procedure EdtTareChange(Sender: TObject);
    procedure EdtScaleChange(Sender: TObject);
    procedure EdtBundleChange(Sender: TObject);
    procedure EdtPriceChange(Sender: TObject);
    procedure CBShouHuoExit(Sender: TObject);
    procedure CBGoodsExit(Sender: TObject);
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
    procedure clearInfo();
  public
    { Public declarations }
    insertOrUpdate: Boolean;
    glideNo: string;
    function getWeightType: string;
    procedure setCostValue();
    function getCost(Value: Double): Double;
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
  EdtGlideNo.ReadOnly := not MainForm.systemConfig.allowModifyGlideNo;

  lblGrossTime.Caption := MainForm.poWeightSetConfig.grossTimeCaption;
  lblTareTime.Caption := MainForm.poWeightSetConfig.tareTimeCaption;

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
    lblCar.Caption := poWeightSetConfig.carCaption;
    lblFaHuo.Caption := poWeightSetConfig.faHuoCaption;
    lblShouHuo.Caption := poWeightSetConfig.shouHuoCaption;
    lblGoods.Caption := poWeightSetConfig.goodsCaption;
    lblSpec.Caption := poWeightSetConfig.specCaption;
    lblGross.Caption := poWeightSetConfig.grossCaption;
    lblTare.Caption := poWeightSetConfig.tareCaption;
    lblNet.Caption := poWeightSetConfig.netCaption;
    lblBundle.Caption := poWeightSetConfig.bundleCaption;
    lblReal.Caption := poWeightSetConfig.realCaption;
    lblPrice.Caption := poWeightSetConfig.priceCaption;
    lblSum.Caption := poWeightSetConfig.sumCaption;
    lblScale.Caption := poWeightSetConfig.scaleCaption;
    lblQuanter.Caption := poWeightSetConfig.quanterCaption;
    lblCost.Caption := poWeightSetConfig.costCaption;
    lblMemo.Caption := poWeightSetConfig.memoCaption;
    lblbackup1.Caption := poWeightSetConfig.backup1Caption;
    lblbackup2.Caption := poWeightSetConfig.backup2Caption;
    lblbackup3.Caption := poWeightSetConfig.backup3Caption;
    lblbackup4.Caption := poWeightSetConfig.backup4Caption;
    lblbackup5.Caption := poWeightSetConfig.backup5Caption;
    lblbackup6.Caption := poWeightSetConfig.backup6Caption;
    lblbackup7.Caption := poWeightSetConfig.backup7Caption;
    lblbackup8.Caption := poWeightSetConfig.backup8Caption;
    lblbackup9.Caption := poWeightSetConfig.backup9Caption;
    lblbackup10.Caption := poWeightSetConfig.backup10Caption;
    lblbackup11.Caption := poWeightSetConfig.backup11Caption;
    lblbackup12.Caption := poWeightSetConfig.backup12Caption;
    lblbackup13.Caption := poWeightSetConfig.backup13Caption;
    lblbackup14.Caption := poWeightSetConfig.backup14Caption;
    lblbackup15.Caption := poWeightSetConfig.backup15Caption;
    lblbackup16.Caption := poWeightSetConfig.backup16Caption;
    lblbackup17.Caption := poWeightSetConfig.backup17Caption;
    lblbackup18.Caption := poWeightSetConfig.backup18Caption;
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
  loadFormPosition(MainForm.poWeightSetConfig.pv00, P00);
  loadFormPosition(MainForm.poWeightSetConfig.pv01, P01);
  loadFormPosition(MainForm.poWeightSetConfig.pv02, P02);
  loadFormPosition(MainForm.poWeightSetConfig.pv03, P03);
  loadFormPosition(MainForm.poWeightSetConfig.pv04, P04);
  loadFormPosition(MainForm.poWeightSetConfig.pv05, P05);
  loadFormPosition(MainForm.poWeightSetConfig.pv06, P06);
  loadFormPosition(MainForm.poWeightSetConfig.pv07, P07);
  loadFormPosition(MainForm.poWeightSetConfig.pv08, P08);

  loadFormPosition(MainForm.poWeightSetConfig.pv10, P10);
  loadFormPosition(MainForm.poWeightSetConfig.pv11, P11);
  loadFormPosition(MainForm.poWeightSetConfig.pv12, P12);
  loadFormPosition(MainForm.poWeightSetConfig.pv13, P13);
  loadFormPosition(MainForm.poWeightSetConfig.pv14, P14);
  loadFormPosition(MainForm.poWeightSetConfig.pv15, P15);
  loadFormPosition(MainForm.poWeightSetConfig.pv16, P16);
  loadFormPosition(MainForm.poWeightSetConfig.pv17, P17);
  loadFormPosition(MainForm.poWeightSetConfig.pv18, P18);

  loadFormPosition(MainForm.poWeightSetConfig.pv20, P20);
  loadFormPosition(MainForm.poWeightSetConfig.pv21, P21);
  loadFormPosition(MainForm.poWeightSetConfig.pv22, P22);
  loadFormPosition(MainForm.poWeightSetConfig.pv23, P23);
  loadFormPosition(MainForm.poWeightSetConfig.pv24, P24);
  loadFormPosition(MainForm.poWeightSetConfig.pv25, P25);
  loadFormPosition(MainForm.poWeightSetConfig.pv26, P26);
  loadFormPosition(MainForm.poWeightSetConfig.pv27, P27);
  loadFormPosition(MainForm.poWeightSetConfig.pv28, P28);

  loadFormPosition(MainForm.poWeightSetConfig.pv30, P30);
  loadFormPosition(MainForm.poWeightSetConfig.pv31, P31);
  loadFormPosition(MainForm.poWeightSetConfig.pv32, P32);
  loadFormPosition(MainForm.poWeightSetConfig.pv33, P33);
  loadFormPosition(MainForm.poWeightSetConfig.pv34, P34);
  loadFormPosition(MainForm.poWeightSetConfig.pv35, P35);
  loadFormPosition(MainForm.poWeightSetConfig.pv36, P36);
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
  CarForm.CBCar.Text := CBCar.Text;
  try
    CarForm.ShowModal;
  finally
    CBCar.Text := CarForm.CBCar.Text;
  end;
end;

procedure TManualInputForm.EdtGrossChange(Sender: TObject);
begin
  if (Sender as TRzEdit).Enabled then
  begin
    if ((StrToFloatDef(EdtGross.Text, 0) <> 0) and (StrToFloatDef(EdtTare.Text, 0) <> 0))
      or MainForm.FrmWeight1.RBOnce.Checked then
    begin
      calcNet;
    end;
  end;
end;

procedure TManualInputForm.EdtTareChange(Sender: TObject);
begin
  if (Sender as TRzEdit).Enabled then
  begin
    if ((StrToFloatDef(EdtGross.Text, 0) <> 0) and (StrToFloatDef(EdtTare.Text, 0) <> 0))
      or MainForm.FrmWeight1.RBOnce.Checked then
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
    EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
      * (1 - StrToFloatDef(EdtBundle.Text, 0) / 100), 1,
      0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType))
  else
    EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
      - StrToFloatDef(EdtBundle.Text, 0), 1,
      0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType));

  EdtSum.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
    * StrToFloatDef(EdtPrice.Text, 0), MainForm.systemConfig.sumDivide,
    0 - MainForm.systemConfig.sumPoint, MainForm.systemConfig.sumType));

  if (StrToFloatDef(EdtScale.Text, 1) <> 0) then
  begin
    EdtQuanter.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
      / StrToFloatDef(EdtScale.Text, 1), MainForm.systemConfig.quanterDivide,
      0 - MainForm.systemConfig.quanterPoint, MainForm.systemConfig.sumType));
  end;
end;

function TManualInputForm.setExpressionValues: Boolean;
begin
  if MainForm.poWeightSetConfig.useExpression6 then
  begin
    if (MainForm.poWeightSetConfig.rule61 <> 0) and (MainForm.poWeightSetConfig.group6 <> 0) then
    begin
      EdtBackup6.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule61, MainForm.poWeightSetConfig.rule62,
        MainForm.poWeightSetConfig.group6,
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
      EdtBackup6.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression6,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point6,
        MainForm.poWeightSetConfig.divide6, MainForm.poWeightSetConfig.sumType6);
      if StrToFloatDef(EdtBackup6.Text, 0) < MainForm.poWeightSetConfig.min6 then
        EdtBackup6.Text := FloatToStr(MainForm.poWeightSetConfig.min6);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression7 then
  begin
    if (MainForm.poWeightSetConfig.rule71 <> 0) and (MainForm.poWeightSetConfig.group7 <> 0) then
    begin
      EdtBackup7.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule71, MainForm.poWeightSetConfig.rule72,
        MainForm.poWeightSetConfig.group7,
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
      EdtBackup7.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression7,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point7,
        MainForm.poWeightSetConfig.divide7, MainForm.poWeightSetConfig.sumType7);
      if StrToFloatDef(EdtBackup7.Text, 0) < MainForm.poWeightSetConfig.min7 then
        EdtBackup7.Text := FloatToStr(MainForm.poWeightSetConfig.min7);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression8 then
  begin
    if (MainForm.poWeightSetConfig.rule81 <> 0) and (MainForm.poWeightSetConfig.group8 <> 0) then
    begin
      EdtBackup8.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule81, MainForm.poWeightSetConfig.rule82,
        MainForm.poWeightSetConfig.group8,
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
      EdtBackup8.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression8,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point8,
        MainForm.poWeightSetConfig.divide8, MainForm.poWeightSetConfig.sumType8);
      if StrToFloatDef(EdtBackup8.Text, 0) < MainForm.poWeightSetConfig.min8 then
        EdtBackup8.Text := FloatToStr(MainForm.poWeightSetConfig.min8);
    end
  end;
  if MainForm.poWeightSetConfig.useExpression9 then
  begin
    if (MainForm.poWeightSetConfig.rule91 <> 0) and (MainForm.poWeightSetConfig.group9 <> 0) then
    begin
      EdtBackup9.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule91, MainForm.poWeightSetConfig.rule92,
        MainForm.poWeightSetConfig.group9,
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
      EdtBackup9.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression9,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point9,
        MainForm.poWeightSetConfig.divide9, MainForm.poWeightSetConfig.sumType9);
      if StrToFloatDef(EdtBackup9.Text, 0) < MainForm.poWeightSetConfig.min9 then
        EdtBackup9.Text := FloatToStr(MainForm.poWeightSetConfig.min9);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression15 then
  begin
    if (MainForm.poWeightSetConfig.rule151 <> 0) and (MainForm.poWeightSetConfig.group15 <> 0) then
    begin
      EdtBackup15.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule151, MainForm.poWeightSetConfig.rule152,
        MainForm.poWeightSetConfig.group15,
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
      EdtBackup15.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression15,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point15,
        MainForm.poWeightSetConfig.divide15, MainForm.poWeightSetConfig.sumType15);
      if StrToFloatDef(EdtBackup15.Text, 0) < MainForm.poWeightSetConfig.min15 then
        EdtBackup15.Text := FloatToStr(MainForm.poWeightSetConfig.min15);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression16 then
  begin
    if (MainForm.poWeightSetConfig.rule161 <> 0) and (MainForm.poWeightSetConfig.group16 <> 0) then
    begin
      EdtBackup16.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule161, MainForm.poWeightSetConfig.rule162,
        MainForm.poWeightSetConfig.group16,
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
      EdtBackup16.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression16,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point16,
        MainForm.poWeightSetConfig.divide16, MainForm.poWeightSetConfig.sumType16);
      if StrToFloatDef(EdtBackup16.Text, 0) < MainForm.poWeightSetConfig.min16 then
        EdtBackup16.Text := FloatToStr(MainForm.poWeightSetConfig.min16);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression17 then
  begin
    if (MainForm.poWeightSetConfig.rule171 <> 0) and (MainForm.poWeightSetConfig.group17 <> 0) then
    begin
      EdtBackup17.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule171, MainForm.poWeightSetConfig.rule172,
        MainForm.poWeightSetConfig.group17,
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
      EdtBackup17.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression17,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point17,
        MainForm.poWeightSetConfig.divide17, MainForm.poWeightSetConfig.sumType17);
      if StrToFloatDef(EdtBackup17.Text, 0) < MainForm.poWeightSetConfig.min17 then
        EdtBackup17.Text := FloatToStr(MainForm.poWeightSetConfig.min17);
    end;
  end;
  if MainForm.poWeightSetConfig.useExpression18 then
  begin
    if (MainForm.poWeightSetConfig.rule181 <> 0) and (MainForm.poWeightSetConfig.group18 <> 0) then
    begin
      EdtBackup18.Text := FloatToStr(TWeightUtil.getStaticValue(
        MainForm.poWeightSetConfig.rule181, MainForm.poWeightSetConfig.rule182,
        MainForm.poWeightSetConfig.group18,
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
      EdtBackup18.Text := TExpressionUtil.getExpressionValue(MainForm.poWeightSetConfig.expression18,
        EdtGross.Text, EdtTare.Text, EdtNet.Text, EdtBundle.Text, EdtReal.Text,
        EdtPrice.Text, EdtSum.Text, EdtScale.Text, EdtQuanter.Text, EdtCost.Text,
        CBBackup1.Text, CBBackup2.Text, CBBackup3.Text,
        CBBackup4.Text, CBBackup5.Text, EdtBackup6.Text, EdtBackup7.Text, EdtBackup8.Text,
        EdtBackup9.Text, CBBackup10.Text, CBBackup11.Text, CBBackup12.Text, CBBackup13.Text,
        CBBackup14.Text, EdtBackup15.Text, EdtBackup16.Text, EdtBackup17.Text,
        EdtBackup18.Text, MainForm.poWeightSetConfig.point18,
        MainForm.poWeightSetConfig.divide18, MainForm.poWeightSetConfig.sumType18);
      if StrToFloatDef(EdtBackup18.Text, 0) < MainForm.poWeightSetConfig.min18 then
        EdtBackup18.Text := FloatToStr(MainForm.poWeightSetConfig.min18);
    end;
  end;
end;

procedure TManualInputForm.saveRecord;
var w: TWeightRecord;
  dtFormat: TFormatSettings;
  lowCredit: Boolean;
begin
  {
  if (StrToFloatDef(EdtGross.Text, 0) = 0) and (StrToFloatDef(EdtTare.Text, 0) = 0) then
  begin
    MainForm.ShowMsg('毛重及皮重不能同时为空');
    Exit;
  end;
  }
  setCostValue;

  if CBUseExpress.Checked then
    setExpressionValues();

  //如果有收费功能，信用额度过低就不允许过磅
  if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
  begin
    case MainForm.systemConfig.payType of
      0: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
      1: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtReal.Text, 0));
      2: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtQuanter.Text, 0));
      3: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup6.Text, 0));
      4: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup7.Text, 0));
      5: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup8.Text, 0));
      6: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup9.Text, 0));
      7: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup15.Text, 0));
      8: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup16.Text, 0));
      9: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup17.Text, 0));
      10: lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtBackup18.Text, 0));
    else
      lowCredit := TPayUtil.lowCredit(CBShouHuo.Text, StrToFloatDef(EdtSum.Text, 0));
    end;
    if lowCredit then
    begin
      Application.MessageBox('该单位当前金额不足，请先续费', '提示', MB_OK +
        MB_ICONSTOP);
      Exit;
    end
    else
    begin
      if MainForm.systemConfig.recordLeft then
      begin
        EdtBackup18.Text := FloatToStr(TPayUtil.getLeft(CBShouHuo.Text) - StrToFloatDef(EdtSum.Text, 0));
      end;
    end;
  end;
  //如果用出厂流水号，就用备用1
  if MainForm.systemConfig.useOutGlideNo then
  begin
    if StrToFloatDef(EdtReal.Text, 0) > 0 then
      CBBackup1.Text := TWeightUtil.getMaxOutGlideNo(getWeightType, CBGoods.Text, CBShouHuo.Text);
  end;

  w := TWeightRecord.Create;
  try
    w.glideNo := EdtGlideNo.Text;
    w.carNo := CBCar.Text;
    w.weightType := getWeightType;
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
    w.firstTime := w.grossTime;
    w.secondTime := w.tareTime;
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
    if MainForm.systemConfig.useManualFlag then
      w.backup14 := '手工补单';
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
        clearInfo();
        CBCar.SetFocus;
      end;
    end;
  finally
    w.Free;
  end;

  //按收货单位扣费
  if MainForm.systemConfig.usePay and (StrToFloatDef(EdtReal.Text, 0) > 0) then
  begin
    case MainForm.systemConfig.payType of
      0: TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
      1: TPayUtil.pay(CBShouHuo.Text, EdtReal.Text);
      2: TPayUtil.pay(CBShouHuo.Text, EdtQuanter.Text);
      3: TPayUtil.pay(CBShouHuo.Text, EdtBackup6.Text);
      4: TPayUtil.pay(CBShouHuo.Text, EdtBackup7.Text);
      5: TPayUtil.pay(CBShouHuo.Text, EdtBackup8.Text);
      6: TPayUtil.pay(CBShouHuo.Text, EdtBackup9.Text);
      7: TPayUtil.pay(CBShouHuo.Text, EdtBackup15.Text);
      8: TPayUtil.pay(CBShouHuo.Text, EdtBackup16.Text);
      9: TPayUtil.pay(CBShouHuo.Text, EdtBackup17.Text);
      10: TPayUtil.pay(CBShouHuo.Text, EdtBackup18.Text);
    else
      TPayUtil.pay(CBShouHuo.Text, EdtSum.Text);
    end;
  end;
end;

procedure TManualInputForm.showRecord(glideNo: string);
var w: TWeightRecord;
begin
  w := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(glideNo, w) then
    begin
      EdtGlideNo.Text := w.glideNo;
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
var w, initW: TWeightRecord;
  strLog: string;
  dtFormat: TFormatSettings;
begin
  {
  if (StrToFloatDef(EdtGross.Text, 0) = 0) and (StrToFloatDef(EdtTare.Text, 0) = 0) then
  begin
    MainForm.ShowMsg('毛重及皮重不能同时为空');
    Exit;
  end;
  }
  setCostValue;

  if CBUseExpress.Checked then
    setExpressionValues();
  w := TWeightRecord.Create;
  initW := TWeightRecord.Create;
  try
    if TWeightRecordUtil.get(glideNo, w) then
    begin
      TWeightRecordUtil.get(glideNo, initW);
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

      w.glideNo := EdtGlideNo.Text;
      w.carNo := CBCar.Text;
      if MainForm.FrmWeight1.RBPurchase.Checked then
        w.weightType := 'PO'
      else if MainForm.FrmWeight1.RBSale.Checked then
        w.weightType := 'SO'
      else if MainForm.FrmWeight1.RBInner.Checked then
        w.weightType := 'IO'
      else
        w.weightType := 'OO';
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
      if MainForm.systemConfig.useManualFlag then
        w.backup14 := '手工补单';
      w.backup15 := StrToFloatDef(EdtBackup15.Text, 0);
      w.backup16 := StrToFloatDef(EdtBackup16.Text, 0);
      w.backup17 := StrToFloatDef(EdtBackup17.Text, 0);
      w.backup18 := StrToFloatDef(EdtBackup18.Text, 0);
      if TWeightRecordUtil.save(w) then
      begin
        strLog := '过磅单：' + initW.glideNo + ' ';
        if initW.carNo <> w.carNo then strLog := strLog + MainForm.poWeightSetConfig.carCaption + ' 由 ' + initW.carNo + ' 修改为 ' + w.carNo + ',';
        if initW.faHuo <> w.faHuo then strLog := strLog + MainForm.poWeightSetConfig.faHuoCaption + ' 由 ' + initW.FaHuo + ' 修改为 ' + w.faHuo + ',';
        if initW.shouHuo <> w.shouHuo then strLog := strLog + MainForm.poWeightSetConfig.shouHuoCaption + ' 由 ' + initW.shouHuo + ' 修改为 ' + w.shouHuo + ',';
        if initW.goods <> w.goods then strLog := strLog + MainForm.poWeightSetConfig.goodsCaption + ' 由 ' + initW.goods + ' 修改为 ' + w.goods + ',';
        if initW.spec <> w.spec then strLog := strLog + MainForm.poWeightSetConfig.specCaption + ' 由 ' + initW.spec + ' 修改为 ' + w.spec + ',';
        if initW.gross <> w.gross then strLog := strLog + MainForm.poWeightSetConfig.grossCaption + ' 由 ' + FloatToStr(initW.gross) + ' 修改为 ' + FloatToStr(w.gross) + ',';
        if initW.tare <> w.tare then strLog := strLog + MainForm.poWeightSetConfig.tareCaption + ' 由 ' + FloatToStr(initW.tare) + ' 修改为 ' + FloatToStr(w.tare) + ',';
        if initW.net <> w.net then strLog := strLog + MainForm.poWeightSetConfig.netCaption + ' 由 ' + FloatToStr(initW.net) + ' 修改为 ' + FloatToStr(w.net) + ',';
        if initW.bundle <> w.bundle then strLog := strLog + MainForm.poWeightSetConfig.bundleCaption + ' 由 ' + FloatToStr(initW.bundle) + ' 修改为 ' + FloatToStr(w.bundle) + ',';
        if initW.real <> w.real then strLog := strLog + MainForm.poWeightSetConfig.realCaption + ' 由 ' + FloatToStr(initW.real) + ' 修改为 ' + FloatToStr(w.real) + ',';
        if initW.price <> w.price then strLog := strLog + MainForm.poWeightSetConfig.priceCaption + ' 由 ' + FloatToStr(initW.price) + ' 修改为 ' + FloatToStr(w.price) + ',';
        if initW.sum <> w.sum then strLog := strLog + MainForm.poWeightSetConfig.sumCaption + ' 由 ' + FloatToStr(initW.sum) + ' 修改为 ' + FloatToStr(w.sum) + ',';
        if initW.scale <> w.scale then strLog := strLog + MainForm.poWeightSetConfig.scaleCaption + ' 由 ' + FloatToStr(initW.scale) + ' 修改为 ' + FloatToStr(w.scale) + ',';
        if initW.quanter <> w.quanter then strLog := strLog + MainForm.poWeightSetConfig.quanterCaption + ' 由 ' + FloatToStr(initW.quanter) + ' 修改为 ' + FloatToStr(w.quanter) + ',';
        if initW.cost <> w.cost then strLog := strLog + MainForm.poWeightSetConfig.costCaption + ' 由 ' + FloatToStr(initW.cost) + ' 修改为 ' + FloatToStr(w.cost) + ',';
        if initW.memo <> w.memo then strLog := strLog + MainForm.poWeightSetConfig.memoCaption + ' 由 ' + initW.memo + ' 修改为 ' + w.memo + ',';
        if initW.backup1 <> w.backup1 then strLog := strLog + MainForm.poWeightSetConfig.backup1Caption + ' 由 ' + initW.backup1 + ' 修改为 ' + w.backup1 + ',';
        if initW.backup2 <> w.backup2 then strLog := strLog + MainForm.poWeightSetConfig.backup2Caption + ' 由 ' + initW.backup2 + ' 修改为 ' + w.backup2 + ',';
        if initW.backup3 <> w.backup3 then strLog := strLog + MainForm.poWeightSetConfig.backup3Caption + ' 由 ' + initW.backup3 + ' 修改为 ' + w.backup3 + ',';
        if initW.backup4 <> w.backup4 then strLog := strLog + MainForm.poWeightSetConfig.backup4Caption + ' 由 ' + initW.backup4 + ' 修改为 ' + w.backup4 + ',';
        if initW.backup5 <> w.backup5 then strLog := strLog + MainForm.poWeightSetConfig.backup5Caption + ' 由 ' + initW.backup5 + ' 修改为 ' + w.backup5 + ',';
        if initW.backup6 <> w.backup6 then strLog := strLog + MainForm.poWeightSetConfig.backup6Caption + ' 由 ' + FloatToStr(initW.backup6) + ' 修改为 ' + FloatToStr(w.backup6) + ',';
        if initW.backup7 <> w.backup7 then strLog := strLog + MainForm.poWeightSetConfig.backup7Caption + ' 由 ' + FloatToStr(initW.backup7) + ' 修改为 ' + FloatToStr(w.backup7) + ',';
        if initW.backup8 <> w.backup8 then strLog := strLog + MainForm.poWeightSetConfig.backup8Caption + ' 由 ' + FloatToStr(initW.backup8) + ' 修改为 ' + FloatToStr(w.backup8) + ',';
        if initW.backup9 <> w.backup9 then strLog := strLog + MainForm.poWeightSetConfig.backup9Caption + ' 由 ' + FloatToStr(initW.backup9) + ' 修改为 ' + FloatToStr(w.backup9) + ',';
        if initW.backup10 <> w.backup10 then strLog := strLog + MainForm.poWeightSetConfig.backup10Caption + ' 由 ' + initW.backup10 + ' 修改为 ' + w.backup10 + ',';
        if initW.backup11 <> w.backup11 then strLog := strLog + MainForm.poWeightSetConfig.backup11Caption + ' 由 ' + initW.backup11 + ' 修改为 ' + w.backup11 + ',';
        if initW.backup12 <> w.backup12 then strLog := strLog + MainForm.poWeightSetConfig.backup12Caption + ' 由 ' + initW.backup12 + ' 修改为 ' + w.backup12 + ',';
        if initW.backup13 <> w.backup13 then strLog := strLog + MainForm.poWeightSetConfig.backup13Caption + ' 由 ' + initW.backup13 + ' 修改为 ' + w.backup13 + ',';
        if initW.backup14 <> w.backup14 then strLog := strLog + MainForm.poWeightSetConfig.backup14Caption + ' 由 ' + initW.backup14 + ' 修改为 ' + w.backup14 + ',';
        if initW.backup15 <> w.backup15 then strLog := strLog + MainForm.poWeightSetConfig.backup15Caption + ' 由 ' + FloatToStr(initW.backup15) + ' 修改为 ' + FloatToStr(w.backup15) + ',';
        if initW.backup16 <> w.backup16 then strLog := strLog + MainForm.poWeightSetConfig.backup16Caption + ' 由 ' + FloatToStr(initW.backup16) + ' 修改为 ' + FloatToStr(w.backup16) + ',';
        if initW.backup17 <> w.backup17 then strLog := strLog + MainForm.poWeightSetConfig.backup17Caption + ' 由 ' + FloatToStr(initW.backup17) + ' 修改为 ' + FloatToStr(w.backup17) + ',';
        if initW.backup18 <> w.backup18 then strLog := strLog + MainForm.poWeightSetConfig.backup18Caption + ' 由 ' + FloatToStr(initW.backup18) + ' 修改为 ' + FloatToStr(w.backup18) + ',';

        TLogUtil.AddLog(strLog);

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
        ModalResult := mrOK;
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
      EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
        * (1 - StrToFloatDef(EdtBundle.Text, 0) / 100), 1,
        0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType))
    else
      EdtReal.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtNet.Text, 0)
        - StrToFloatDef(EdtBundle.Text, 0), 1,
        0 - MainForm.systemConfig.realPoint, MainForm.systemConfig.sumType));

    EdtSum.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
      * StrToFloatDef(EdtPrice.Text, 0), MainForm.systemConfig.sumDivide,
      0 - MainForm.systemConfig.sumPoint, MainForm.systemConfig.sumType));

    if (StrToFloatDef(EdtScale.Text, 1) <> 0) then
    begin
      EdtQuanter.Text := FloatToStr(TCommonUtil.RoundToEx(StrToFloatDef(EdtReal.Text, 0)
        / StrToFloatDef(EdtScale.Text, 1), MainForm.systemConfig.quanterDivide,
        0 - MainForm.systemConfig.quanterPoint, MainForm.systemConfig.sumType));
    end;
  end;
end;

procedure TManualInputForm.clearInfo;
begin
  CBCar.Text := MainForm.poWeightSetConfig.carDefault;
  CBFaHuo.Text := MainForm.poWeightSetConfig.faHuoDefault;
  CBShouHuo.Text := MainForm.poWeightSetConfig.shouHuoDefault;
  CBGoods.Text := MainForm.poWeightSetConfig.goodsDefault;
  CBSpec.Text := MainForm.poWeightSetConfig.specDefault;
  EdtBundle.Text := MainForm.poWeightSetConfig.bundleDefault;
  EdtPrice.Text := MainForm.poWeightSetConfig.priceDefault;
  EdtScale.Text := MainForm.poWeightSetConfig.scaleDefault;
  EdtMemo.Text := MainForm.poWeightSetConfig.memoDefault;
  CBBackup1.Text := MainForm.poWeightSetConfig.backup1Default;
  CBBackup2.Text := MainForm.poWeightSetConfig.backup2Default;
  CBBackup3.Text := MainForm.poWeightSetConfig.backup3Default;
  CBBackup4.Text := MainForm.poWeightSetConfig.backup4Default;
  CBBackup5.Text := MainForm.poWeightSetConfig.backup5Default;
  EdtBackup6.Text := MainForm.poWeightSetConfig.backup6Default;
  EdtBackup7.Text := MainForm.poWeightSetConfig.backup7Default;
  EdtBackup8.Text := MainForm.poWeightSetConfig.backup8Default;
  EdtBackup9.Text := MainForm.poWeightSetConfig.backup9Default;
  CBBackup10.Text := MainForm.poWeightSetConfig.backup10Default;
  CBBackup11.Text := MainForm.poWeightSetConfig.backup11Default;
  CBBackup12.Text := MainForm.poWeightSetConfig.backup12Default;
  CBBackup13.Text := MainForm.poWeightSetConfig.backup13Default;
  CBBackup14.Text := MainForm.poWeightSetConfig.backup14Default;
  EdtBackup15.Text := MainForm.poWeightSetConfig.backup15Default;
  EdtBackup16.Text := MainForm.poWeightSetConfig.backup16Default;
  EdtBackup17.Text := MainForm.poWeightSetConfig.backup17Default;
  EdtBackup18.Text := MainForm.poWeightSetConfig.backup18Default;
end;

function TManualInputForm.getWeightType: string;
begin
  case RGWeightType.ItemIndex of
    0: Result := 'PO';
    1: Result := 'SO';
    2: Result := 'IO';
    3: Result := 'OO';
  end;
end;

procedure TManualInputForm.setCostValue;
var w, unitPound: Double;
begin
  if not MainForm.systemConfig.useCost then
    Exit;
  if MainForm.systemConfig.ManualInputPound then
    Exit;
  case MainForm.systemConfig.costType of
    0: EdtCost.Text := FloatToStr(getCost(StrToFloatDef(EdtGross.Text, 0)));
    1: EdtCost.Text := FloatToStr(getCost(StrToFloatDef(EdtNet.Text, 0)));
    2: EdtCost.Text := FloatToStr(getCost(StrToFloatDef(EdtGross.Text, 0))
        + getCost(StrToFloatDef(EdtTare.Text, 0)));
  end;
end;

function TManualInputForm.getCost(Value: Double): Double;
begin
  with MainForm do
  begin
    if systemConfig.chargeType = 0 then
    begin
      if systemConfig.ladder then
      begin
        if (Value > systemConfig.poundGrade1)
          and (Value <= systemConfig.poundGrade2) then
        begin
          Result := systemConfig.BasicPound;
        end
        else if (Value > systemConfig.poundGrade3)
          and (Value <= systemConfig.poundGrade4) then
        begin
          Result := RoundTo(systemConfig.UnitPound1 *
            (Value - systemConfig.poundGrade2) + systemConfig.BasicPound,
            0 - systemConfig.scalePoint);
        end
        else if (Value > systemConfig.poundGrade5)
          and (Value <= systemConfig.poundGrade6) then
          Result := RoundTo(systemConfig.UnitPound2 *
            (Value - systemConfig.poundGrade4)
            + systemConfig.UnitPound1 * (systemConfig.poundGrade4 - systemConfig.poundGrade3)
            + systemConfig.BasicPound,
            0 - systemConfig.scalePoint);
      end
      else
      begin
        if (Value > systemConfig.poundGrade1)
          and (Value <= systemConfig.poundGrade2) then
        begin
          Result := systemConfig.BasicPound;
        end
        else if (Value > systemConfig.poundGrade3)
          and (Value <= systemConfig.poundGrade4) then
        begin
          Result := RoundTo(systemConfig.UnitPound1 * Value,
            0 - systemConfig.scalePoint);
        end
        else if (Value > systemConfig.poundGrade5)
          and (Value <= systemConfig.poundGrade6) then
          Result := RoundTo(systemConfig.UnitPound2 * Value,
            0 - systemConfig.scalePoint);
      end;
      if Result < systemConfig.basicPound then
        Result := systemConfig.BasicPound;
    end
    else
    begin
      if (Value >= systemConfig.grade11) and (Value < systemConfig.grade12) then
      begin
        Result := systemConfig.cost1;
      end
      else if (Value >= systemConfig.grade21) and (Value < systemConfig.grade22) then
      begin
        Result := systemConfig.cost2;
      end
      else if (Value >= systemConfig.grade31) and (Value < systemConfig.grade32) then
      begin
        Result := systemConfig.cost3;
      end
      else if (Value >= systemConfig.grade41) and (Value < systemConfig.grade42) then
      begin
        Result := systemConfig.cost4;
      end
      else if (Value >= systemConfig.grade51) and (Value < systemConfig.grade52) then
      begin
        Result := systemConfig.cost5;
      end
      else if (Value >= systemConfig.grade61) and (Value < systemConfig.grade62) then
      begin
        Result := systemConfig.cost6;
      end
      else if (Value >= systemConfig.grade71) and (Value < systemConfig.grade72) then
      begin
        Result := systemConfig.cost7;
      end
      else if (Value >= systemConfig.grade81) and (Value < systemConfig.grade82) then
      begin
        Result := systemConfig.cost8;
      end
      else if (Value >= systemConfig.grade91) and (Value < systemConfig.grade92) then
      begin
        Result := systemConfig.cost9;
      end
      else if (Value >= systemConfig.grade101) and (Value < systemConfig.grade102) then
      begin
        Result := systemConfig.cost10;
      end
      else if (Value >= systemConfig.grade111) and (Value < systemConfig.grade112) then
      begin
        Result := systemConfig.cost11;
      end
      else if (Value >= systemConfig.grade121) and (Value < systemConfig.grade122) then
      begin
        Result := systemConfig.cost12;
      end
      else if (Value >= systemConfig.grade131) and (Value < systemConfig.grade132) then
      begin
        Result := systemConfig.cost13;
      end
      else
      begin
        Result := systemConfig.cost1;
      end
    end;
  end;
end;

procedure TManualInputForm.CBShouHuoExit(Sender: TObject);
begin
  EdtPrice.Text := FloatToStr(TPriceUtil.getPrice(CBShouHuo.Text, CBGoods.Text));

end;

procedure TManualInputForm.CBGoodsExit(Sender: TObject);
var price, scale: Double;
begin
  TPrepareUtil.getGoodsInfo(CBGoods.Text, price, scale);
  //EdtPrice.Text := FloatToStr(price);
  EdtScale.Text := FloatToStr(scale);

  EdtPrice.Text := FloatToStr(TPriceUtil.getPrice(CBShouHuo.Text, CBGoods.Text));

end;

end.

