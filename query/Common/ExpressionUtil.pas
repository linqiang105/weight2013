unit ExpressionUtil;

interface

uses StrUtils, SysUtils, Math, Graphics, Windows, Forms, Controls, StdCtrls, Spin, Consts, Dialogs;

type
  TExpressionUtil = class
  private
  public
    //自定义公式用
    {class function CalcMultiplyDivide(InStr: string; var OutStr: string): Boolean;
    class function CalcPlusMinus(InStr: string): string;
    class function CalcText(InStr: string): string;  }
    class function CalcText(InStr: string): string;
    //自定义公式输入公式
    class function ExpressionInputBox(const ACaption: string;
      var ACheck: Boolean; var Value: string; var APoint: Integer): Boolean;

    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5: string): string; overload;
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6: string): string; overload;
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7: string): string; overload;
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7,
      backup8: string): string; overload;
   ////////////////////////////////////////////////////////////////////////////////
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14: string): string; overload;
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14,
      backup15: string): string; overload;
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14,
      backup15, backup16: string): string; overload;
    class function getExpression(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14,
      backup15, backup16, backup17: string): string; overload;
    /////////////////////////////////////////////////////////////
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5: string; point, divide, sumType: Integer): string; overload;
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6: string;
      point, divide, sumType: Integer): string; overload;
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7: string;
      point, divide, sumType: Integer): string; overload;
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8: string;
      point, divide, sumType: Integer): string; overload;
    ////////////////////////////////////////////////////////////////////////////////
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14: string;
      point, divide, sumType: Integer): string; overload;
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14, backup15: string;
      point, divide, sumType: Integer): string; overload;
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14, backup15, backup16: string;
      point, divide, sumType: Integer): string; overload;
    class function getExpressionValue(expression,
      gross, tare, net, bundle, real, price, sum, scale, quanter,
      backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8,
      backup9, backup10, backup11, backup12, backup13, backup14, backup15, backup16,
      backup17: string; point, divide, sumType: Integer): string; overload;
  end;

implementation

uses
  fs_iinterpreter, CommonUtil;

 { TExpressionUtil }

class function TExpressionUtil.ExpressionInputBox(const ACaption: string; var ACheck: Boolean;
  var Value: string; var APoint: Integer): Boolean;

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

var
  Form: TForm;
  Check: TCheckBox;
  Edit: TEdit;
  SpinEdit: TSpinEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
  try
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    BorderStyle := bsDialog;
    Caption := ACaption;
    ClientWidth := MulDiv(180, DialogUnits.X, 4);
    Position := poScreenCenter;

    Check := TCheckBox.Create(Form);
    with Check do
    begin
      Parent := Form;
      Caption := '启用公式';
      Left := MulDiv(8, DialogUnits.X, 4);
      Top := MulDiv(8, DialogUnits.Y, 4);
      Checked := ACheck;
    end;

    Edit := TEdit.Create(Form);
    with Edit do
    begin
      Parent := Form;
      Left := Check.Left;
      Top := Check.Top + Check.Height + 5;
      Width := MulDiv(164, DialogUnits.X, 4) - 60;
      MaxLength := 255;
      Text := Value;
      SelectAll;
    end;

    SpinEdit := TSpinEdit.Create(Form);
    with SpinEdit do
    begin
      Parent := Form;
      Left := Edit.Left + Edit.Width + 10;
      Top := Edit.Top;
      Width := 50;
      Value := APoint;
    end;

    ButtonTop := Edit.Top + Edit.Height + 15;
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := SMsgDlgOK;
      ModalResult := mrOk;
      Default := True;
      SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
        ButtonHeight);
    end;
    with TButton.Create(Form) do
    begin
      Parent := Form;
      Caption := SMsgDlgCancel;
      ModalResult := mrCancel;
      Cancel := True;
      SetBounds(MulDiv(92, DialogUnits.X, 4), Edit.Top + Edit.Height + 15,
        ButtonWidth, ButtonHeight);
      Form.ClientHeight := Top + Height + 13;
    end;

    Edit.TabOrder := 0;
    if ShowModal = mrOk then
    begin
      ACheck := Check.Checked;
      Value := Edit.Text;
      APoint := SpinEdit.Value;
      Result := True;
    end;
  finally
    Form.Free;
  end;
end;

{
class function TExpressionUtil.CalcMultiplyDivide(InStr: string;
  var OutStr: string): Boolean;
//乘除的符号运算
var
  i, intStart, intEnd, Code: integer;
  tmpStr: string;
  NumA, NumB, TextValue: Double;
begin
  Result := True;
  for i := 2 to Length(InStr) do
  begin
    tmpStr := Copy(InStr, i, 1);
    if (tmpStr = '*') or (tmpStr = '/') then
    begin
      Val(ReverseString(Copy(InStr, 1, i - 1)), NumA, intStart);
      if intStart <> 0 then intStart := i - intStart;
      Val(Copy(InStr, i + 1, Length(InStr) - i), NumB, intEnd);
      if intEnd <> 0 then intEnd := i + intEnd
      else intEnd := Length(InStr) + 1;
      Val(Copy(InStr, intStart + 1, i - intStart - 1), NumA, Code);
      if Code <> 0 then Break;
      Val(Copy(InStr, i + 1, intEnd - i - 1), NumB, Code);
      if Code <> 0 then Break;
      try
        if tmpStr = '*' then TextValue := NumA * NumB;
        if tmpStr = '/' then
        begin
          if NumB = 0 then
            TextValue := 0
          else
            TextValue := NumA / NumB;
        end;
        CalcMultiplyDivide(Copy(InStr, 1, intStart) + FloatToStr(TextValue)
          + Copy(InStr, intEnd, Length(InStr) - intEnd + 1), InStr);
      except
        on EZeroDivide do begin
//                    ShowMessage('被零除');
          Result := False;
          break;
        end;
      end;
    end;
  end;
  OutStr := InStr;
end;

class function TExpressionUtil.CalcPlusMinus(InStr: string): string;
//加减的符号运算
var
  i, intStart, intEnd, Code1, Code2: integer;
  tmpStr: string;
  NumA, NumB, TextValue: Double;
begin
  for i := 2 to Length(InStr) do
  begin
    tmpStr := Copy(InStr, i, 1);
    if (tmpStr = '+') or (tmpStr = '-') then
    begin
      Val(ReverseString(Copy(InStr, 1, i - 1)), NumA, intStart);
      if intStart <> 0 then intStart := i - intStart;
      if (InStr[intStart] = '-') then intStart := intStart - 1;
      Val(Copy(InStr, i + 1, Length(InStr) - i), NumB, intEnd);
      if intEnd <> 0 then intEnd := i + intEnd
      else intEnd := Length(InStr) + 1;

      Val(Copy(InStr, intStart + 1, i - intStart - 1), NumA, Code1);
      Val(Copy(InStr, i + 1, intEnd - i - 1), NumB, Code2);
      if (Code1 = 0) and (Code2 = 0) then begin
        if tmpStr = '+' then TextValue := NumA + NumB;
        if tmpStr = '-' then TextValue := NumA - NumB;
        InStr := CalcPlusMinus(Copy(InStr, 1, intStart) + FloatToStr(TextValue)
          + Copy(InStr, intEnd, Length(InStr) - intEnd + 1));
      end;
    end;
  end;
  Result := InStr;
end;

class function TExpressionUtil.CalcText(InStr: string): string;
//处理括号
var
  intStart, intEnd, Code: integer;
  tmpVal: Double;
  tmpStr: string;
begin
  while True do begin
    intStart := Length(InStr) - pos('(', ReverseString(InStr)) + 1;
    if intStart = Length(InStr) + 1 then
    begin
      if pos(')', InStr) > 0 then ShowMessage('括号不匹配！')
      else if CalcMultiplyDivide(InStr, InStr) then
        InStr := CalcPlusMinus(InStr);
      break;
    end;
    intEnd := Pos(')', Copy(InStr, intStart + 1, Length(InStr) - intStart));
    if intEnd > 1 then begin
      if CalcMultiplyDivide(Copy(InStr, intStart + 1, intEnd - 1), tmpStr) then
        tmpStr := CalcPlusMinus(tmpStr);
      Val(tmpStr, tmpVal, Code);
      if Code = 0 then
        InStr := Copy(InStr, 1, intStart - 1) + tmpStr
          + Copy(InStr, intStart + intEnd + 1, Length(InStr) - intStart - intEnd)
      else
        InStr := Copy(InStr, 1, intStart - 1) + #10 + tmpStr + #13
          + Copy(InStr, intStart + intEnd + 1, Length(InStr) - intStart - intEnd);
    end else begin
      ShowMessage('括号不匹配！');
      Break;
    end;
  end;
  Result := StringReplace(StringReplace(InStr, #13, ')', [rfReplaceAll]), #10, '(', [rfReplaceAll]);
end;
}

class function TExpressionUtil.getExpression(
  expression, gross, tare, net, bundle, real,
  price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
  backup6: string): string;
begin
  expression := getExpression(expression, gross, tare, net, bundle, real,
    price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5);
  if Pos('[备用6]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用6]', backup6);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpression(
  expression, gross, tare, net, bundle, real,
  price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5: string): string;
begin
  //如果有毛重,皮重,净重,扣重,实重,就先用实值替换,再将这个字符串计算出来
  if Pos('[毛重]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[毛重]', gross);
  end;
  if Pos('[皮重]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[皮重]', tare);
  end;
  if Pos('[净重]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[净重]', net);
  end;
  if Pos('[扣重]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[扣重]', bundle);
  end;
  if Pos('[实重]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[实重]', Real);
  end;
  if Pos('[单价]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[单价]', price);
  end;
  if Pos('[金额]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[金额]', sum);
  end;
  if Pos('[折方系数]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[折方系数]', scale);
  end;
  if Pos('[方量]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[方量]', quanter);
  end;
  if Pos('[备用1]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用1]', backup1);
  end;
  if Pos('[备用2]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用2]', backup2);
  end;
  if Pos('[备用3]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用3]', backup3);
  end;
  if Pos('[备用4]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用4]', backup4);
  end;
  if Pos('[备用5]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用5]', backup5);
  end;
  Result := expression;
end;

class function TExpressionUtil.getExpression(
  expression, gross, tare, net, bundle, real,
  price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5, backup6,
  backup7, backup8: string): string;
begin
  expression := getExpression(expression, gross, tare, net, bundle, real,
    price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5, backup6, backup7);
  if Pos('[备用8]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用8]', backup8);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpression(
  expression, gross, tare, net, bundle, real,
  price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5, backup6,
  backup7: string): string;
begin
  expression := getExpression(expression, gross, tare, net, bundle, real,
    price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5, backup6);
  if Pos('[备用7]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用7]', backup7);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6: string; point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2,
    backup3, backup4, backup5, backup6);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5: string; point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2,
    backup3, backup4, backup5);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6, backup7, backup8: string; point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
    backup5, backup6, backup7, backup8);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6, backup7: string; point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
    backup5, backup6, backup7);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpression(expression, gross, tare, net,
  bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
  backup6, backup7, backup8, backup9, backup10, backup11, backup12,
  backup13, backup14, backup15, backup16: string): string;
begin
  expression := getExpression(expression, gross, tare, net,
    bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
    backup6, backup7, backup8, backup9, backup10, backup11, backup12,
    backup13, backup14, backup15);
  if Pos('[备用16]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用16]', backup16);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpression(expression, gross, tare, net,
  bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
  backup6, backup7, backup8, backup9, backup10, backup11, backup12,
  backup13, backup14, backup15, backup16, backup17: string): string;
begin
  expression := getExpression(expression, gross, tare, net,
    bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
    backup6, backup7, backup8, backup9, backup10, backup11, backup12,
    backup13, backup14, backup15, backup16);
  if Pos('[备用17]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用17]', backup17);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpression(expression, gross, tare, net,
  bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
  backup6, backup7, backup8, backup9, backup10, backup11, backup12,
  backup13, backup14: string): string;
begin
  expression := getExpression(expression, gross, tare, net, bundle, real,
    price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5, backup6, backup7, backup8);
  if Pos('[备用9]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用9]', backup9);
  end;
  if Pos('[备用10]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用10]', backup10);
  end;
  if Pos('[备用11]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用11]', backup11);
  end;
  if Pos('[备用12]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用12]', backup12);
  end;
  if Pos('[备用13]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用13]', backup13);
  end;
  if Pos('[备用14]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用14]', backup14);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpression(expression, gross, tare, net,
  bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
  backup6, backup7, backup8, backup9, backup10, backup11, backup12,
  backup13, backup14, backup15: string): string;
begin
  expression := getExpression(expression, gross, tare, net,
    bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4, backup5,
    backup6, backup7, backup8, backup9, backup10, backup11, backup12,
    backup13, backup14);
  if Pos('[备用15]', expression) <> -1 then
  begin
    expression := AnsiReplaceStr(expression, '[备用15]', backup15);
  end;
  result := expression;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6, backup7, backup8, backup9, backup10, backup11,
  backup12, backup13, backup14, backup15, backup16: string;
  point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
    backup5, backup6, backup7, backup8, backup9, backup10, backup11,
    backup12, backup13, backup14, backup15, backup16);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6, backup7, backup8, backup9, backup10, backup11,
  backup12, backup13, backup14, backup15, backup16, backup17: string;
  point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
    backup5, backup6, backup7, backup8, backup9, backup10, backup11,
    backup12, backup13, backup14, backup15, backup16, backup17);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6, backup7, backup8, backup9, backup10, backup11,
  backup12, backup13, backup14: string; point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
    backup5, backup6, backup7, backup8, backup9, backup10, backup11,
    backup12, backup13, backup14);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.getExpressionValue(expression, gross, tare,
  net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
  backup5, backup6, backup7, backup8, backup9, backup10, backup11,
  backup12, backup13, backup14, backup15: string; point, divide, sumType: Integer): string;
begin
  expression := getExpression(expression, gross, tare,
    net, bundle, real, price, sum, scale, quanter, backup1, backup2, backup3, backup4,
    backup5, backup6, backup7, backup8, backup9, backup10, backup11,
    backup12, backup13, backup14, backup15);
  try
    Result := FloatToStr(TCommonUtil.RoundToEx(StrToFloat(CalcText(expression)),
      divide, 0 - point, sumType));
  except on e: Exception do
      Application.MessageBox(PChar('公式编辑错误!' + Chr(13) + Chr(10) + E.Message),
        '错误', MB_OK + MB_ICONSTOP + MB_TOPMOST);
  end;
end;

class function TExpressionUtil.CalcText(InStr: string): string;
var fs: TfsScript;
begin
  fs := TfsScript.Create(nil);
  try
    fs.Parent := fsGlobalUnit; // use standard classes and methods
    fs.SyntaxType := 'PascalScript';
    Result := fs.Evaluate(InStr);
  finally
    fs.Free;
  end;
end;

end.
d.

