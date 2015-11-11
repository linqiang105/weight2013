unit WeightFrm;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzPanel, RzCmboBx, RzLabel, Buttons,
  ExtCtrls, RzEdit, SysConfig, Math, DB, RzAnimtr, ImgList, Mask, CnAAFont,
  CnAACtrls, Menus;

type
  TFrmWeight = class(TFrame)
    PMain: TPanel;
    PInfo: TPanel;
    TReadWeight: TTimer;
    TSteady: TTimer;
    ImgList: TImageList;
    PMeter1: TPanel;
    lblTrans1: TLabel;
    lblSteady1: TLabel;
    lblUnit1: TLabel;
    PWeight1: TRzPanel;
    AniTrans1: TRzAnimator;
    AniSteady1: TRzAnimator;
    PMeter2: TPanel;
    PWeight2: TRzPanel;
    AniTrans2: TRzAnimator;
    lblTrans2: TLabel;
    AniSteady2: TRzAnimator;
    lblSteady2: TLabel;
    lblUnit2: TLabel;
    TAuto: TTimer;
    TWaitForZero: TTimer;
    TWaitForScreen: TTimer;
    procedure TSteadyTimer(Sender: TObject);
    procedure PWeight1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
    //判断稳定
    arrWeight1, arrWeight2: array[0..50] of string;
    cishu1, cishu2: Integer;
    weightField, maxGlideNo, updateRecNo, weightType: string;

    flagReverse: Boolean;
    grossTime: TDateTime;
    grossAddr, grossMan: string;

    //小台秤自动过磅流程
    autoStep: Integer;
    FlastGlideNo: string;
    function clearPosition(): Boolean; //隐藏所有控件
    procedure loadFormDesign(const pv: string; pWin: TPanel);
    function setPosition(): Boolean; //2.将控件摆到配置的位置上去
    procedure SetlastGlideNo(const Value: string);
  public
    { Public declarations }
    saved: Boolean;
    function setSysConfig(systemConfig: TSysConfig): Boolean;
    function setLastWeightInfo(ds: TDataSet): Boolean; //取上次的过磅信息显示到界面上
    function calcNet(): Boolean; //计算净重
    function calcSum(): Boolean;
    function clearInfo(clearAll: Boolean = False): Boolean; //点清空按钮时全清空
    function clearWeight(): Boolean;
    function grossFindTare(): Boolean; //过毛重找车辆皮重信息
    function tareFindGross(): Boolean; //过皮重找车辆毛重信息
    function createCost(): Boolean; //过磅费计算
    function updateCost(lastCost: Double): Boolean;
    function setExpressionValue(): Boolean; //自定义公式项目
    function simpleTareFindGross(): Boolean; //简单过磅
    function getWeight(): string; //取当前重量
    function getScaleNo(): Char; //A秤或B秤
    function getSteady(): Boolean; //是否稳定
    function getMust(): Boolean; //是否已经输入全部必填项
    function resizeFrame(): Boolean; //重排界面
    function resizeWidth(): Boolean; //3.刷新窗体,调整控件的长度
    function startSteady(start: Boolean = True): Boolean;
    function setSimpleBtnState(st: Boolean): Boolean;
    function setBtnState(st: Boolean): Boolean;
    procedure P00SetFocus(); //设置焦点
    function showMeter2(): Boolean;
    function weightAndSave(): Boolean; //自动过磅
    procedure addAutoDebug(s: string);
    property lastGlideNo: string read FlastGlideNo write SetlastGlideNo;
  end;

implementation

uses
  Main, QueryDM, MultiGross, Video, PrepareUtil, DogUtil,
  ExpressionUtil, WeightUtil, OtherUtil, PayUtil, ReportUtil,
  Car, CommonUtil, PrepareMaintain;

{$R *.dfm}

{ TFrmWeight }

function TFrmWeight.clearInfo(clearAll: Boolean): Boolean;
begin
  lastGlideNo := ''; 
end;

function TFrmWeight.grossFindTare: Boolean;
begin
 
end;

function TFrmWeight.tareFindGross: Boolean;
begin
end;

function TFrmWeight.createCost: Boolean;
begin

end;

function TFrmWeight.updateCost(lastCost: Double): Boolean;
begin

end;

function TFrmWeight.setExpressionValue: Boolean;
begin
  
end;

function TFrmWeight.simpleTareFindGross: Boolean;
begin

end;

procedure TFrmWeight.TSteadyTimer(Sender: TObject);
var i: Integer;
  flag1, flag2: Boolean;
begin
  AniTrans1.ImageIndex := 0;
  AniTrans2.ImageIndex := 0;

  //一号仪表判断稳定
  arrWeight1[cishu1] := PWeight1.Caption;
  inc(CiShu1);
  if CiShu1 > MainForm.systemConfig.steadyCount then
    CiShu1 := 0;
  for i := 0 to MainForm.systemConfig.steadyCount - 1 do
  begin
    flag1 := True;
    if Abs(StrToFloatDef(arrWeight1[i], 0) - StrToFloatDef(arrWeight1[i + 1], 0)) > MainForm.systemConfig.range then
    begin
      flag1 := False;
      break;
    end;
  end;
  if flag1 then
    AniSteady1.ImageIndex := 1
  else
    AniSteady1.ImageIndex := 0;

  //二号仪表判稳
  arrWeight2[cishu2] := PWeight2.Caption;
  inc(CiShu2);
  if CiShu2 > MainForm.systemConfig.steadyCount then
    CiShu2 := 0;
  for i := 0 to MainForm.systemConfig.steadyCount - 1 do
  begin
    flag2 := True;
    if Abs(StrToFloatDef(arrWeight2[i], 0) - StrToFloatDef(arrWeight2[i + 1], 0)) > MainForm.systemConfig.range then
    begin
      flag2 := False;
      break;
    end;
  end;
  if flag2 then
    AniSteady2.ImageIndex := 1
  else
    AniSteady2.ImageIndex := 0;
end;

function TFrmWeight.setSysConfig(systemConfig: TSysConfig): Boolean;
begin
  lblUnit1.Caption := systemConfig.metricUnit;
  lblUnit2.Caption := systemConfig.metricUnit;
end;

function TFrmWeight.clearWeight: Boolean;
begin 
end;

function TFrmWeight.getSteady: Boolean;
begin
  if MainForm.systemConfig.allowNotSteady then
    Result := True
  else
    Result := AniSteady1.ImageIndex = 1;
end;

function TFrmWeight.setLastWeightInfo(ds: TDataSet): Boolean;
begin
 
end;

function TFrmWeight.resizeFrame: Boolean;
begin
  //载入控件位置信息 ,从MainForm的weightSetConfig中读取
  //1.将所有控件放到主窗体中去
  clearPosition();
  //2.将控件摆到配置的位置上去
  setPosition();
  //3.刷新窗体,调整控件的长度
  resizeWidth;
end;

function TFrmWeight.clearPosition: Boolean;
begin
  
end;

function TFrmWeight.resizeWidth: Boolean;
begin
  
end;

function TFrmWeight.setPosition: Boolean;
begin

end;

procedure TFrmWeight.loadFormDesign(const pv: string; pWin: TPanel);
begin
end;

function TFrmWeight.startSteady(start: Boolean): Boolean;
begin
  TSteady.Enabled := start;
end;

function TFrmWeight.calcNet: Boolean;
begin

end;

function TFrmWeight.setSimpleBtnState(st: Boolean): Boolean;
begin

end;

function TFrmWeight.getMust: Boolean;
begin

end;

function TFrmWeight.setBtnState(st: Boolean): Boolean;
begin
 
end;

procedure TFrmWeight.P00SetFocus;
begin

end;

function TFrmWeight.getWeight: string;
begin

end;

function TFrmWeight.showMeter2(): Boolean;
begin
  PMeter2.Visible := not PMeter2.Visible;
  PWeight1.Color := clBlack;
  PWeight2.Color := clBlack;
end;

procedure TFrmWeight.PWeight1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  if TUserUtil.HasAuthority('管理员') then
    PWeight1.Caption := InputBox('', '', '0');
end;

function TFrmWeight.weightAndSave: Boolean;
begin

end;

procedure TFrmWeight.addAutoDebug(s: string);
begin
end;

procedure TFrmWeight.SetlastGlideNo(const Value: string);
begin
   
end;

function TFrmWeight.calcSum: Boolean;
begin
 
end;

function TFrmWeight.getScaleNo: Char;
begin
  if PWeight1.Color = clBlack then
    Result := 'A'
  else if PWeight2.Color = clBlack then
    Result := 'B'
  else
    Result := 'C';
end;

end.

