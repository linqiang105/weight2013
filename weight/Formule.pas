unit Formule;

interface

uses
  Messages, Classes, Controls, Forms,
  StdCtrls, Buttons, Spin, ExtCtrls;

type
  TFormuleForm = class(TForm)
    GBAvalid: TGroupBox;
    EdtFormula: TEdit;
    SBGross: TBitBtn;
    SBTare: TBitBtn;
    SBNet: TBitBtn;
    SBBundle: TBitBtn;
    SBReal: TBitBtn;
    SBPrice: TBitBtn;
    SBSum: TBitBtn;
    SBCost: TBitBtn;
    SBBackup1: TBitBtn;
    SBBackup2: TBitBtn;
    SBBackup3: TBitBtn;
    SBBackup4: TBitBtn;
    SBBackup5: TBitBtn;
    SBBackup6: TBitBtn;
    SBBackup7: TBitBtn;
    SBBackup8: TBitBtn;
    SBPlus: TBitBtn;
    SBMinus: TBitBtn;
    SBMultiply: TBitBtn;
    SBDivide: TBitBtn;
    SB0: TBitBtn;
    SB1: TBitBtn;
    SB2: TBitBtn;
    SB3: TBitBtn;
    SB4: TBitBtn;
    SB5: TBitBtn;
    SB6: TBitBtn;
    SB7: TBitBtn;
    SB8: TBitBtn;
    SB9: TBitBtn;
    SBDot: TBitBtn;
    SBFront: TBitBtn;
    SBBack: TBitBtn;
    SBBackSpace: TBitBtn;
    SBClear: TBitBtn;
    SBBackup9: TBitBtn;
    SBBackup10: TBitBtn;
    SBBackup11: TBitBtn;
    SBBackup12: TBitBtn;
    SBBackup13: TBitBtn;
    SBBackup14: TBitBtn;
    SBBackup15: TBitBtn;
    SBBackup16: TBitBtn;
    SBBackup17: TBitBtn;
    SBBackup18: TBitBtn;
    SBScale: TBitBtn;
    SBQuanter: TBitBtn;
    RGSumType: TRadioGroup;
    lblMin: TLabel;
    lblPoint: TLabel;
    SEPoint: TSpinEdit;
    EdtMin: TEdit;
    lblDivide: TLabel;
    SEDivide: TSpinEdit;
    BtnOK: TBitBtn;
    BtnClose: TBitBtn;
    procedure SBGrossClick(Sender: TObject);
    procedure SBClearClick(Sender: TObject);
    procedure BtnCloseClick(Sender: TObject);
    procedure BtnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBBackSpaceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    returnValue: string;
    sumType: Integer;
    minValue: Double;
    sumDivide, sumPoint: Integer;
  end;

var
  FormuleForm: TFormuleForm;

implementation

uses
  SysUtils;

{$R *.dfm}

procedure TFormuleForm.SBGrossClick(Sender: TObject);
begin
  EdtFormula.Text := EdtFormula.Text + (Sender as TBitBtn).Caption;
  EdtFormula.SelStart := Length(EdtFormula.Text);
end;

procedure TFormuleForm.SBClearClick(Sender: TObject);
begin
  EdtFormula.Text := '';
end;

procedure TFormuleForm.BtnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFormuleForm.BtnOKClick(Sender: TObject);
begin
  returnValue := EdtFormula.Text;
  sumType := RGSumType.ItemIndex;
  minValue := StrToFloatDef(EdtMin.Text, 0);
  sumDivide := SEDivide.Value;
  sumPoint := SEPoint.Value;
  Close;
end;

procedure TFormuleForm.FormShow(Sender: TObject);
begin
  EdtFormula.Text := returnValue;
  RGSumType.ItemIndex := sumType;
  EdtMin.Text := FloatToStr(minValue);
  SEDivide.Value := sumDivide;
  SEPoint.Value := sumPoint;
end;

procedure TFormuleForm.SBBackSpaceClick(Sender: TObject);
begin
  EdtFormula.SetFocus;
  EdtFormula.SelStart := Length(EdtFormula.Text);
  EdtFormula.Perform(WM_CHAR, 8, 0);
end;

end.

