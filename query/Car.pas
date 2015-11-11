unit Car;

interface

uses
  Classes, Controls, Forms, Types,
  Buttons, StdCtrls, ExtCtrls, ComCtrls;

type
  TCarForm = class(TForm)
    PCar: TPanel;
    LECar: TLabeledEdit;
    BitBtnOK: TBitBtn;
    PCCar: TPageControl;
    TSProvince: TTabSheet;
    TSLetter: TTabSheet;
    TSNum: TTabSheet;
    BtnProvince9: TButton;
    BtnProvince1: TButton;
    BtnProvince10: TButton;
    BtnProvince11: TButton;
    BtnProvince12: TButton;
    BtnProvince13: TButton;
    BtnProvince14: TButton;
    BtnProvince15: TButton;
    BtnProvince16: TButton;
    BtnProvince17: TButton;
    BtnProvince18: TButton;
    BtnProvince19: TButton;
    BtnProvince2: TButton;
    BtnProvince20: TButton;
    BtnProvince21: TButton;
    BtnProvince22: TButton;
    BtnProvince23: TButton;
    BtnProvince24: TButton;
    BtnProvince25: TButton;
    BtnProvince26: TButton;
    BtnProvince27: TButton;
    BtnProvince28: TButton;
    BtnProvince29: TButton;
    BtnProvince3: TButton;
    BtnProvince30: TButton;
    BtnProvince31: TButton;
    BtnProvince32: TButton;
    BtnProvince33: TButton;
    BtnProvince34: TButton;
    BtnProvince35: TButton;
    BtnProvince36: TButton;
    BtnProvince37: TButton;
    BtnProvince38: TButton;
    BtnProvince39: TButton;
    BtnProvince4: TButton;
    BtnProvince40: TButton;
    BtnProvince41: TButton;
    BtnProvince42: TButton;
    BtnProvince5: TButton;
    BtnProvince6: TButton;
    BtnProvince7: TButton;
    BtnProvince8: TButton;
    BtnLetter1: TButton;
    BtnLetter2: TButton;
    BtnLetter3: TButton;
    BtnLetter4: TButton;
    BtnLetter5: TButton;
    BtnLetter6: TButton;
    BtnLetter7: TButton;
    BtnLetter8: TButton;
    BtnLetter9: TButton;
    BtnLetter10: TButton;
    BtnLetter11: TButton;
    BtnLetter12: TButton;
    BtnLetter13: TButton;
    BtnLetter14: TButton;
    BtnLetter15: TButton;
    BtnLetter16: TButton;
    BtnLetter17: TButton;
    BtnLetter18: TButton;
    BtnLetter19: TButton;
    BtnLetter20: TButton;
    BtnLetter21: TButton;
    BtnLetter22: TButton;
    BtnLetter23: TButton;
    BtnLetter24: TButton;
    BtnLetter25: TButton;
    BtnLetter26: TButton;
    BtnLine: TButton;
    BtnNum1: TButton;
    BtnNum2: TButton;
    BtnNum3: TButton;
    BtnNum4: TButton;
    BtnNum5: TButton;
    BtnNum6: TButton;
    BtnNum7: TButton;
    BtnNum8: TButton;
    BtnNum9: TButton;
    BtnNum0: TButton;
    BtnBack: TButton;
    procedure BtnProvince1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnBackClick(Sender: TObject);
    procedure LECarChange(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BtnProvince9ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CarForm: TCarForm;

implementation

uses Main, RzCmboBx, Dialogs, IniFiles, SysUtils;

{$R *.dfm}

procedure TCarForm.BtnProvince1Click(Sender: TObject);
begin
  LECar.Text := LECar.Text + (Sender as TButton).Caption;
  LECar.SetFocus;
  LECar.SelStart := Length(LECar.Text);
end;

procedure TCarForm.FormShow(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'car.ini');
  try
































    BtnProvince1.Caption := myini.ReadString('key', 'province1', '¾©');
    BtnProvince2.Caption := myini.ReadString('key', 'province2', '½ò');
    BtnProvince3.Caption := myini.ReadString('key', 'province3', '¼½');
    BtnProvince4.Caption := myini.ReadString('key', 'province4', '½ú');
    BtnProvince5.Caption := myini.ReadString('key', 'province5', 'ÃÉ');
    BtnProvince6.Caption := myini.ReadString('key', 'province6', 'ÁÉ');
    BtnProvince7.Caption := myini.ReadString('key', 'province7', '¼ª');
    BtnProvince8.Caption := myini.ReadString('key', 'province8', 'ºÚ');
    BtnProvince9.Caption := myini.ReadString('key', 'province9', '»¦');
    BtnProvince10.Caption := myini.ReadString('key', 'province10', 'ËÕ');
    BtnProvince11.Caption := myini.ReadString('key', 'province11', 'Õã');
    BtnProvince12.Caption := myini.ReadString('key', 'province12', 'Íî');
    BtnProvince13.Caption := myini.ReadString('key', 'province13', 'Ãö');
    BtnProvince14.Caption := myini.ReadString('key', 'province14', '¸Ó');
    BtnProvince15.Caption := myini.ReadString('key', 'province15', 'Â³');
    BtnProvince16.Caption := myini.ReadString('key', 'province16', 'Ô¥');
    BtnProvince17.Caption := myini.ReadString('key', 'province17', '¶õ');
    BtnProvince18.Caption := myini.ReadString('key', 'province18', 'Ïæ');
    BtnProvince19.Caption := myini.ReadString('key', 'province19', 'ÔÁ');
    BtnProvince20.Caption := myini.ReadString('key', 'province20', '¹ð');
    BtnProvince21.Caption := myini.ReadString('key', 'province21', 'Çí');
    BtnProvince22.Caption := myini.ReadString('key', 'province22', 'Óå');
    BtnProvince23.Caption := myini.ReadString('key', 'province23', '´¨');
    BtnProvince24.Caption := myini.ReadString('key', 'province24', '¹ó');
    BtnProvince25.Caption := myini.ReadString('key', 'province25', 'ÔÆ');
    BtnProvince26.Caption := myini.ReadString('key', 'province26', '²Ø');
    BtnProvince27.Caption := myini.ReadString('key', 'province27', 'ÉÂ');
    BtnProvince28.Caption := myini.ReadString('key', 'province28', '¸Ê');
    BtnProvince29.Caption := myini.ReadString('key', 'province29', 'Çà');
    BtnProvince30.Caption := myini.ReadString('key', 'province30', 'Äþ');
    BtnProvince31.Caption := myini.ReadString('key', 'province31', 'ÐÂ');
    BtnProvince32.Caption := myini.ReadString('key', 'province32', '¼×');
    BtnProvince33.Caption := myini.ReadString('key', 'province33', 'ÒÒ');
    BtnProvince34.Caption := myini.ReadString('key', 'province34', '±û');
    BtnProvince35.Caption := myini.ReadString('key', 'province35', '¶¡');
    BtnProvince36.Caption := myini.ReadString('key', 'province36', 'Îì');
    BtnProvince37.Caption := myini.ReadString('key', 'province37', '¼º');
    BtnProvince38.Caption := myini.ReadString('key', 'province38', '¸ý');
    BtnProvince39.Caption := myini.ReadString('key', 'province39', 'ÐÁ');
    BtnProvince40.Caption := myini.ReadString('key', 'province40', 'ÈÉ');
    BtnProvince41.Caption := myini.ReadString('key', 'province41', '¹ï');
    BtnProvince42.Caption := myini.ReadString('key', 'province42', 'WJ');

    BtnLetter1.Caption := myini.ReadString('key', 'letter1', 'A');
    BtnLetter2.Caption := myini.ReadString('key', 'letter2', 'B');
    BtnLetter3.Caption := myini.ReadString('key', 'letter3', 'C');
    BtnLetter4.Caption := myini.ReadString('key', 'letter4', 'D');
    BtnLetter5.Caption := myini.ReadString('key', 'letter5', 'E');
    BtnLetter6.Caption := myini.ReadString('key', 'letter6', 'F');
    BtnLetter7.Caption := myini.ReadString('key', 'letter7', 'G');
    BtnLetter8.Caption := myini.ReadString('key', 'letter8', 'H');
    BtnLetter9.Caption := myini.ReadString('key', 'letter9', 'I');
    BtnLetter10.Caption := myini.ReadString('key', 'letter10', 'J');
    BtnLetter11.Caption := myini.ReadString('key', 'letter11', 'K');
    BtnLetter12.Caption := myini.ReadString('key', 'letter12', 'L');
    BtnLetter13.Caption := myini.ReadString('key', 'letter13', 'M');
    BtnLetter14.Caption := myini.ReadString('key', 'letter14', 'N');
    BtnLetter15.Caption := myini.ReadString('key', 'letter15', 'O');
    BtnLetter16.Caption := myini.ReadString('key', 'letter16', 'P');
    BtnLetter17.Caption := myini.ReadString('key', 'letter17', 'Q');
    BtnLetter18.Caption := myini.ReadString('key', 'letter18', 'R');
    BtnLetter19.Caption := myini.ReadString('key', 'letter19', 'S');
    BtnLetter20.Caption := myini.ReadString('key', 'letter20', 'T');
    BtnLetter21.Caption := myini.ReadString('key', 'letter21', 'U');
    BtnLetter22.Caption := myini.ReadString('key', 'letter22', 'V');
    BtnLetter23.Caption := myini.ReadString('key', 'letter23', 'W');
    BtnLetter24.Caption := myini.ReadString('key', 'letter24', 'X');
    BtnLetter25.Caption := myini.ReadString('key', 'letter25', 'Y');
    BtnLetter26.Caption := myini.ReadString('key', 'letter26', 'Z');

    BtnNum1.Caption := myini.ReadString('key', 'num1', '1');
    BtnNum2.Caption := myini.ReadString('key', 'num2', '2');
    BtnNum3.Caption := myini.ReadString('key', 'num3', '3');
    BtnNum4.Caption := myini.ReadString('key', 'num4', '4');
    BtnNum5.Caption := myini.ReadString('key', 'num5', '5');
    BtnNum6.Caption := myini.ReadString('key', 'num6', '6');
    BtnNum7.Caption := myini.ReadString('key', 'num7', '7');
    BtnNum8.Caption := myini.ReadString('key', 'num8', '8');
    BtnNum9.Caption := myini.ReadString('key', 'num9', '9');
    BtnNum0.Caption := myini.ReadString('key', 'num0', '10');

    BtnLine.Caption := myini.ReadString('key', 'line', '-');
  finally
    myini.Free;
  end;
  LECar.SetFocus;
  PCCar.ActivePageIndex := 0;
end;

procedure TCarForm.BtnBackClick(Sender: TObject);
begin
  LECar.Text := Copy(LECar.Text, 1, Length(LECar.Text) - 1);
end;

procedure TCarForm.LECarChange(Sender: TObject);
begin
  if (MainForm.ActiveControl is TRzComboBox) then
  begin
    if not (MainForm.ActiveControl as TRzComboBox).ReadOnly then
      (MainForm.ActiveControl as TRzComboBox).Text := LECar.Text;
  end
end;

procedure TCarForm.BitBtnOKClick(Sender: TObject);
begin
  Close;
end;

procedure TCarForm.BtnProvince9ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  (Sender as TButton).Caption := InputBox('ÇëÊäÈëÐÂÃû³Æ', '', (Sender as TButton).Caption);
end;

procedure TCarForm.FormClose(Sender: TObject; var Action: TCloseAction);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'car.ini');
  try
    myini.WriteString('key', 'province1', BtnProvince1.Caption);
    myini.WriteString('key', 'province2', BtnProvince2.Caption);
    myini.WriteString('key', 'province3', BtnProvince3.Caption);
    myini.WriteString('key', 'province4', BtnProvince4.Caption);
    myini.WriteString('key', 'province5', BtnProvince5.Caption);
    myini.WriteString('key', 'province6', BtnProvince6.Caption);
    myini.WriteString('key', 'province7', BtnProvince7.Caption);
    myini.WriteString('key', 'province8', BtnProvince8.Caption);
    myini.WriteString('key', 'province9', BtnProvince9.Caption);
    myini.WriteString('key', 'province10', BtnProvince10.Caption);
    myini.WriteString('key', 'province11', BtnProvince11.Caption);
    myini.WriteString('key', 'province12', BtnProvince12.Caption);
    myini.WriteString('key', 'province13', BtnProvince13.Caption);
    myini.WriteString('key', 'province14', BtnProvince14.Caption);
    myini.WriteString('key', 'province15', BtnProvince15.Caption);
    myini.WriteString('key', 'province16', BtnProvince16.Caption);
    myini.WriteString('key', 'province17', BtnProvince17.Caption);
    myini.WriteString('key', 'province18', BtnProvince18.Caption);
    myini.WriteString('key', 'province19', BtnProvince19.Caption);
    myini.WriteString('key', 'province20', BtnProvince20.Caption);
    myini.WriteString('key', 'province21', BtnProvince21.Caption);
    myini.WriteString('key', 'province22', BtnProvince22.Caption);
    myini.WriteString('key', 'province23', BtnProvince23.Caption);
    myini.WriteString('key', 'province24', BtnProvince24.Caption);
    myini.WriteString('key', 'province25', BtnProvince25.Caption);
    myini.WriteString('key', 'province26', BtnProvince26.Caption);
    myini.WriteString('key', 'province27', BtnProvince27.Caption);
    myini.WriteString('key', 'province28', BtnProvince28.Caption);
    myini.WriteString('key', 'province29', BtnProvince29.Caption);
    myini.WriteString('key', 'province30', BtnProvince30.Caption);
    myini.WriteString('key', 'province31', BtnProvince31.Caption);
    myini.WriteString('key', 'province32', BtnProvince32.Caption);
    myini.WriteString('key', 'province33', BtnProvince33.Caption);
    myini.WriteString('key', 'province34', BtnProvince34.Caption);
    myini.WriteString('key', 'province35', BtnProvince35.Caption);
    myini.WriteString('key', 'province36', BtnProvince36.Caption);
    myini.WriteString('key', 'province37', BtnProvince37.Caption);
    myini.WriteString('key', 'province38', BtnProvince38.Caption);
    myini.WriteString('key', 'province39', BtnProvince39.Caption);
    myini.WriteString('key', 'province40', BtnProvince40.Caption);
    myini.WriteString('key', 'province41', BtnProvince41.Caption);
    myini.WriteString('key', 'province42', BtnProvince42.Caption);

    myini.WriteString('key', 'letter1', BtnLetter1.Caption);
    myini.WriteString('key', 'letter2', BtnLetter2.Caption);
    myini.WriteString('key', 'letter3', BtnLetter3.Caption);
    myini.WriteString('key', 'letter4', BtnLetter4.Caption);
    myini.WriteString('key', 'letter5', BtnLetter5.Caption);
    myini.WriteString('key', 'letter6', BtnLetter6.Caption);
    myini.WriteString('key', 'letter7', BtnLetter7.Caption);
    myini.WriteString('key', 'letter8', BtnLetter8.Caption);
    myini.WriteString('key', 'letter9', BtnLetter9.Caption);
    myini.WriteString('key', 'letter10', BtnLetter10.Caption);
    myini.WriteString('key', 'letter11', BtnLetter11.Caption);
    myini.WriteString('key', 'letter12', BtnLetter12.Caption);
    myini.WriteString('key', 'letter13', BtnLetter13.Caption);
    myini.WriteString('key', 'letter14', BtnLetter14.Caption);
    myini.WriteString('key', 'letter15', BtnLetter15.Caption);
    myini.WriteString('key', 'letter16', BtnLetter16.Caption);
    myini.WriteString('key', 'letter17', BtnLetter17.Caption);
    myini.WriteString('key', 'letter18', BtnLetter18.Caption);
    myini.WriteString('key', 'letter19', BtnLetter19.Caption);
    myini.WriteString('key', 'letter20', BtnLetter20.Caption);
    myini.WriteString('key', 'letter21', BtnLetter21.Caption);
    myini.WriteString('key', 'letter22', BtnLetter22.Caption);
    myini.WriteString('key', 'letter23', BtnLetter23.Caption);
    myini.WriteString('key', 'letter24', BtnLetter24.Caption);
    myini.WriteString('key', 'letter25', BtnLetter25.Caption);
    myini.WriteString('key', 'letter26', BtnLetter26.Caption);

    myini.WriteString('key', 'num1', BtnNum1.Caption);
    myini.WriteString('key', 'num2', BtnNum2.Caption);
    myini.WriteString('key', 'num3', BtnNum3.Caption);
    myini.WriteString('key', 'num4', BtnNum4.Caption);
    myini.WriteString('key', 'num5', BtnNum5.Caption);
    myini.WriteString('key', 'num6', BtnNum6.Caption);
    myini.WriteString('key', 'num7', BtnNum7.Caption);
    myini.WriteString('key', 'num8', BtnNum8.Caption);
    myini.WriteString('key', 'num9', BtnNum9.Caption);
    myini.WriteString('key', 'num0', BtnNum0.Caption);

    myini.WriteString('key', 'line', BtnLine.Caption);
  finally
    myini.Free;
  end;
end;

end.

