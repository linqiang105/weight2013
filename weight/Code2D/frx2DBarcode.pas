
{******************************************}
{                                          }
{             FastReport v4.0              }
{             2DBarcode object             }
{                                          }
{         Copyright (c) 2012               }
{         by LiKejian                      }
{         QQ 39839655                      }
{                                          }
{******************************************}

unit frx2DBarcode;

interface

{$I frx.inc}

uses
  uZintBarcode, uZintInterface,
  Windows, Messages, SysUtils, Classes, Graphics, frxClass,frxDsgnIntf
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TfrxZintBarcodeDataFormat = (dfANSI, dfUTF8);

Type
  TfrxBarcode2DEditor=class(TfrxComponentEditor)
  public
    //function  Edit:Boolean; override;
      function  Edit:Boolean; override;
      function  HasEditor:Boolean;override;
      function  Execute(Tag:Integer; Checked:Boolean):Boolean; override;
      procedure GetMenuItems; override;
  end;

type
  TfrxBarcode2DObject = class(TComponent);  // fake component

  TfrxBarcode2DView = class(TfrxView)
  private
    FBarcode : TZintBarcode;//生产条码类
    FBitmap : TBitmap;//图片类
    FAutoSize:Boolean;
    FZoom : Single;        
    FDataFormat: TfrxZintBarcodeDataFormat;//数据格式    
    ///////////////////
    FText: String;
    FExpression: String;
    
    function GetType: TZBType;
    procedure SetType(const Value: TZBType);
    
    function GetZoom: Single;
    procedure SetZoom(const Value: Single);
    
    function GetDataEncoded: Widestring;
    procedure SetDataFormat(const Value: TfrxZintBarcodeDataFormat);

    function GetExpression:String;
    procedure SetExpression(Const Value:String);
  protected
    procedure BarcodeChanged(Sender: TObject);
    
    //procedure SetHeight(Value: Extended); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Draw(Canvas: TCanvas; ScaleX, ScaleY, OffsetX, OffsetY: Extended); override;
    class function GetDescription: String; override;
    procedure GetData; override;
  published
    property AutoSize: Boolean read FAutoSize write FAutoSize;
    property AutoSizeZoom: Single read GetZoom write SetZoom;//
    property BarcodeType : TZBType read GetType write SetType;//条码类型
    property DataFormat: TfrxZintBarcodeDataFormat read FDataFormat write SetDataFormat;//数据格式    
    property DataField;
    property DataSet;
    property DataSetName;
    property Expression: String read GetExpression write SetExpression;
    property Frame;
    property Text: String read FText write FText;
  end;

Procedure InitializeFastReport;
Procedure FinalizeFastReport;


implementation
uses
  frx2DBarcodeRTTI, frxRes, frxUtils;

function  TfrxBarcode2DEditor.Edit:Boolean;
var
  s: String;
Begin
  Result := True;
  s:=TfrxBarcode2DView(Component).Expression;
  s := TfrxCustomDesigner(Designer).InsertExpression(s);  
  if s <> '' then
    TfrxBarcode2DView(Component).Expression:=s;  
End;

function  TfrxBarcode2DEditor.HasEditor:Boolean;
Begin
  Result:=True;
End;

function  TfrxBarcode2DEditor.Execute(Tag:Integer; Checked:Boolean):Boolean;
Begin
     Result := True;
End;

procedure TfrxBarcode2DEditor.GetMenuItems;
Begin
  AddItem('About', 1, False);
End;


function TfrxBarcode2DView.GetType: TZBType;
Begin
  Result:=FBarcode.BarcodeType;
End;

procedure TfrxBarcode2DView.SetType(const Value: TZBType);
Begin
  FBarcode.BarcodeType:=Value; 
End;

function TfrxBarcode2DView.GetZoom: Single;
Begin
  Result:=FZoom;
End;

procedure TfrxBarcode2DView.SetZoom(const Value: Single);
Begin
  FZoom:=Value;
  BarcodeChanged(self);
  Self.Width:=Round(FBitmap.Width);
  Self.Height:=Round(FBitmap.Height);
End;

function TfrxBarcode2DView.GetDataEncoded: Widestring;
Begin
  case FDataFormat of
    dfANSI: Result:=ansistring(FText);
    dfUTF8: Result:=UTF8Decode(FText);
  end;
End;

procedure TfrxBarcode2DView.SetDataFormat(const Value: TfrxZintBarcodeDataFormat);
var
  ws : WideString;
begin
  FDataFormat := Value;

  ws:=GetDataEncoded;
  if ws<>EmptyWideStr then
    FBarcode.Data:=ws;
End;

function TfrxBarcode2DView.GetExpression:String;
Begin
  Result:=FExpression;
End;

procedure TfrxBarcode2DView.SetExpression(Const Value:String);
Begin
  {$IFNDEF NO_EDITORS}
  FExpression:=Value;
  {$ENDIF}
End;
procedure TfrxBarcode2DView.BarcodeChanged(Sender: TObject);
Begin
  FBarcode.OnChanged:=nil;
  try   
    FBarcode.Height:=Round(Self.Height / FZoom / 2);
    FBarcode.GetBarcode(FBitmap);
  finally
    FBarcode.OnChanged:=Self.BarcodeChanged;
  end;
End;

constructor TfrxBarcode2DView.Create(AOwner: TComponent);
begin
  inherited;  
  FZoom:=1;
  FBitmap:=TBitmap.Create;
  FBarcode:=TZintBarcode.Create;
  FAutoSize:=True;
  BarcodeChanged(nil);
  FBarcode.OnChanged:=BarcodeChanged;
  FBarcode.BarcodeType:=tBARCODE_QRCODE;
  FDataFormat:=dfANSI;
  FText:=FBarcode.Data;
  
  Self.Width:=1*32;
  Self.Height:=1*32; 
end;

destructor TfrxBarcode2DView.Destroy;
Begin
  FreeAndNil(FBarcode);
  FreeAndNil(FBitmap);
  inherited;
End;

class function TfrxBarcode2DView.GetDescription: String;
begin
  Result := '2D 条形码对象';
end;

procedure TfrxBarcode2DView.Draw(Canvas: TCanvas; ScaleX, ScaleY, OffsetX,
  OffsetY: Extended);
var
  ws : WideString;
begin
  inherited;  
  ws:=GetDataEncoded;
  if ws<>EmptyWideStr then
    FBarcode.Data:=ws;      
    
  if FAutoSize then
  Begin//自动大小
    Canvas.StretchDraw(Rect(FX,
                            FY,
                            FX+Round(FBitmap.Width * ScaleX * FZoom),
                            FY+Round(FBitmap.Height * ScaleY * FZoom)),
                         FBitmap); 
    Self.Width:=Round(FBitmap.Width);
    Self.Height:=Round(FBitmap.Height);
  End Else Begin
    BeginDraw(Canvas, ScaleX, ScaleY, OffsetX, OffsetY);
    frxDrawGraphic(Canvas, Rect(FX, FY, FX1, FY1), FBitmap, IsPrinting); //, False, False, 0);
  End;
end;


procedure TfrxBarcode2DView.GetData;
begin
  inherited;  
  if FExpression <> '' then
    FText := VarToStr(Report.Calc(FExpression))
  Else if IsDataField then
    FText := VarToStr(DataSet.Value[DataField])
    
end;  

Procedure InitializeFastReport;
Begin
  frxObjects.RegisterObject1(TfrxBarcode2DView, nil, '', '', 0, 23);
  {$IFNDEF NO_EDITORS}
  frxComponentEditors.Register(TfrxBarcode2DView,TfrxBarcode2DEditor);
  {$ENDIF}
End;

Procedure FinalizeFastReport; 
Begin
  frxObjects.UnRegister(TfrxBarcode2DView);
  {$IFNDEF NO_EDITORS}
  frxComponentEditors.UnRegister(TfrxBarcode2DEditor);
  {$ENDIF}
End;

initialization
  InitializeFastReport;
  
finalization                             
  FinalizeFastReport
end.

