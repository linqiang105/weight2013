unit MeterUtil;

interface

uses
  SysUtils, Math, StrUtils, StdCtrls;

type
  TMeterUtil = class
  private
  public
    class function XK3190A9(s: string): string; //3190-A9+
    class function XK3190A12(s: string): string; //3190-A12E
    class function YB3198A(s: string): string; //3198A仪表
    class function YB3198B(s: string): string; //3198B仪表<3190-D2+>
    class function YB3198D(s: string): string; //3198D仪表
    class function YB3198BD9(s: string): string; //3198B(铝)仪表
    class function YB2002D(s: string): string; //2002D仪表<>
    class function YB2005D(s: string): string; //2005D仪表<DS822-D2>
    class function YBORMT2000(s: string): string; //ORMT2000仪表
    class function DNSCSA(s: string): string; //上海东南SCS-A仪表
    class function XK3188A(s: string): string; //XK3188A仪表
    class function YB8142Pro(s: string): string; //托力多8142表
    class function HT9800(s: string): string; //杭州衡天
    class function YBPT650D(s: string): string; //志美PT650D和金钟
    class function FT11D(s: string): string; //富林泰克FT-11D
    class function XK3196B(s: string; var SteadyFlag: boolean): string; //杭州四方XK3196B
    class function XK3102(s: string): string; //济南金钟
    class function XK315A6(s: string): string; //上海彩信XK315A6
    class function HBM2116(s: string): string; //HBM2116
    class function HT9800D7PF(s: string; var SteadyFlag: boolean): string; //杭州衡天HT9800-D7PF
    class function XK3101(s: string; var SteadyFlag: Boolean): string; //常州宏力XK3101
    class function XK319A(s: string): string; //北京能克319A
    class function D2008F_2(s: string): string; //柯力D2008F，TF=2
    class function D2008F_3(s: string): string; //柯力D2008F, TF=3
    class function VT300_D(s: string): string; //VT300-D
    class function JIK(s: string): string; //JIK6CSB通讯协议
    class function JWI586(s: string): string; //JWI586
    class function JWI700(s: string): string; //JWI700W
    class function XK3199B(s: string): string; //XK3199B
    class function XK3168(s: string): string; //XK3168B
    class function XK3196G(s: string): string; //杭州四方XK3196G
    //自定义仪表,s:输入字符串,startChar:开始字符;start:开始截取位;len:截取长度;
    //point:小数点位数;
    //quene:0:正序,1:反序;
    //strType:输入字符串类型,0:ASCII码;1:BCD码
    class function Personlize(s: string; startChar: string; start: Integer; len: Integer;
      point: Integer; queue: integer; strType: Integer): string;
    class function WTN81(s: string): string; //万泰吊钩秤
    class function GZJJ09P(s: string): string; //广州聚杰09P
    class function BST100(const s, addr: string): string; //长沙佳仪
    class function LC200(const s, addr: string): string; //山西力创
    class function EX200(const s: string): string; //上海英展EX2002
    class function SB520(const s: string): string; //上海英展SB520,530
    class function GM880301(const s: string): string; //深圳杰曼
    class function GM880302(const s: string): string; //深圳杰曼
    class function GM880303(const s: string): string; //深圳杰曼
    class function DINI3590E(const s: string): string; //DINI ARGED
    class function T2000A(const s: string): string; //台衡惠尔邦
    class function JCYJ_96W3Y(const s, addr: string): string; //JCYJ-96W3Y(S)电压表
    //增加仪表型号
    class procedure addMeterType(cb: TComboBox);
    class function getMeterNum(meterType: Integer; s: string; var sf: Boolean; addr: string;
      startChar: string; firstPos: Integer; dataLen: Integer; point: Integer; queue: Integer;
      charType: Integer): string;
  end;

implementation

uses CommonUtil;

class function TMeterUtil.YB3198A(s: string): string; //A表
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if ((s[i] = '-') or (s[i] = '+')) and (Length(Copy(s, i, 10)) > 9) then
    begin
      if Copy(s, i + 7, 1) = '0' then
        result := formatfloat('###0', StrToFloat(Copy(s, i, 7)))
      else if Copy(s, i + 7, 1) = '1' then
        result := formatfloat('###0.0', StrToFloat(Copy(s, i, 7)) / 10)
      else if Copy(s, i + 7, 1) = '2' then
        result := formatfloat('###0.00', StrToFloat(Copy(s, i, 7)) / 100)
      else if Copy(s, i + 7, 1) = '3' then
        result := formatfloat('###0.000', StrToFloat(Copy(s, i, 7)) / 1000)
      else if Copy(s, i + 7, 1) = '4' then
        result := formatfloat('###0.0000', StrToFloat(Copy(s, i, 7)) / 10000);
      break;
    end
  end;
end;

class function TMeterUtil.YB3198B(s: string): string; //B表
var
  i, j: Integer;
  f: string;
begin
  f := '';
  if (s = '') or (length(s) < 8) then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if s[i] = '=' then
    begin
      for j := i + 7 downto i + 1 do
        f := f + s[j];
      result := FloatToStr(StrToFloatDef(f, 0));
      break;
    end;
  end;
end;

class function TMeterUtil.YB3198D(s: string): string; //D9表
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if ((s[i] = '-') or (s[i] = '+')) and (Length(Copy(s, i, 10)) > 9) then
    begin
      if Copy(s, i + 7, 1) = '0' then
        result := formatfloat('###0', StrToFloat(Copy(s, i, 7)))
      else if Copy(s, i + 7, 1) = '1' then
        result := formatfloat('###0.0', StrToFloat(Copy(s, i, 7)) / 10)
      else if Copy(s, i + 7, 1) = '2' then
        result := formatfloat('###0.00', StrToFloat(Copy(s, i, 7)) / 100)
      else if Copy(s, i + 7, 1) = '3' then
        result := formatfloat('###0.000', StrToFloat(Copy(s, i, 7)) / 1000)
      else if Copy(s, i + 7, 1) = '4' then
        result := formatfloat('###0.0000', StrToFloat(Copy(s, i, 7)) / 10000);
      break;
    end;
  end;
end;

class function TMeterUtil.YB3198BD9(s: string): string; //D铝
var
  i, j: Integer;
  f, K: string;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = '=') and (Length(Copy(s, i, 8)) > 7) then
      f := Copy(s, i + 1, 6);
    Break;
  end;
  for j := Length(f) downto 1 do
    K := K + f[j];
  result := FloatToStr(StrToFloat(K))
end;

class function TMeterUtil.YB2002D(s: string): string; //2002D
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if ((s[i] = 'A') and (s[i + 1] = 'A')) and (Length(Copy(s, i, 11)) > 10) then
    begin
      if Copy(s, i + 9, 1) = '0' then
        result := formatfloat('###0', StrToFloat(Copy(s, i + 2, 7)))
      else if Copy(s, i + 9, 1) = '1' then
        result := formatfloat('###0.0', StrToFloat(Copy(s, i + 2, 7)) / 10)
      else if Copy(s, i + 9, 1) = '2' then
        result := formatfloat('###0.00', StrToFloat(Copy(s, i + 2, 7)) / 100)
      else if Copy(s, i + 9, 1) = '3' then
        result := formatfloat('###0.000', StrToFloat(Copy(s, i + 2, 7)) / 1000)
      else if Copy(s, i + 9, 1) = '4' then
        result := formatfloat('###0.0000', StrToFloat(Copy(s, i + 2, 7)) / 10000);
      break;
    end
  end;
end;

class function TMeterUtil.YB2005D(s: string): string; //2005D
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if ((s[i] = 'A') and (s[i + 1] = 'a')) and (Length(Copy(s, i, 11)) > 10) then
    begin
      if Copy(s, i + 9, 1) = '0' then
        result := formatfloat('###0', StrToFloat(Copy(s, i + 2, 7)))
      else if Copy(s, i + 9, 1) = '1' then
        result := formatfloat('###0.0', StrToFloat(Copy(s, i + 2, 7)) / 10)
      else if Copy(s, i + 9, 1) = '2' then
        result := formatfloat('###0.00', StrToFloat(Copy(s, i + 2, 7)) / 100)
      else if Copy(s, i + 9, 1) = '3' then
        result := formatfloat('###0.000', StrToFloat(Copy(s, i + 2, 7)) / 1000)
      else if Copy(s, i + 9, 1) = '4' then
        result := formatfloat('###0.0000', StrToFloat(Copy(s, i + 2, 7)) / 10000);
      break;
    end
  end;
end;

class function TMeterUtil.DNSCSA(s: string): string;
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (Ord(s[i]) = 2) and (Length(Copy(s, i, 10)) > 9) then
    begin
      result := Copy(s, i + 4, 6);
      Break;
    end;
  end;
end;

class function TMeterUtil.YBORMT2000(s: string): string; //ORMT
var
  i, j: Integer;
  f, K: string;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = '=') and (Length(Copy(s, i, 10)) > 9) then
    begin
      if s[i + 1] = '.' then
        f := Copy(s, i + 2, 6)
      else
        f := Copy(s, i + 1, 7);
      break;
    end;
  end;
  for j := Length(f) downto 1 do
    K := K + f[j];
  result := FloatToStr(StrToFloat(K))
end;

class function TMeterUtil.XK3188A(s: string): string;
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (Ord(s[i]) = 2) and (Length(Copy(s, i + 1, 8)) > 7) then
    begin
      if Copy(s, i + 8, 1) = '0' then
        result := formatfloat('###0', StrToFloat(Copy(s, i + 1, 7)))
      else if Copy(s, i + 8, 1) = '1' then
        result := formatfloat('###0.0', StrToFloat(Copy(s, i + 1, 7)) / 10)
      else if Copy(s, i + 8, 1) = '2' then
        result := formatfloat('###0.00', StrToFloat(Copy(s, i + 1, 7)) / 100)
      else if Copy(s, i + 8, 1) = '3' then
        result := formatfloat('###0.000', StrToFloat(Copy(s, i + 1, 7)) / 1000)
      else if Copy(s, i + 8, 1) = '4' then
        result := formatfloat('###0.0000', StrToFloat(Copy(s, i + 1, 7)) / 10000);
      break;
    end
  end;
end;

function IntToBin(Value: Cardinal): string;
var
  i: Integer;
begin
  SetLength(result, 32);
  for i := 1 to 32 do
  begin
    if ((Value shl (i - 1)) shr 31) = 0 then
      result[i] := '0' {do not localize}
    else
      result[i] := '1'; {do not localize}
  end;
end;

class function TMeterUtil.YB8142Pro(s: string): string; //  ,9
var
  i: Integer;
  n: string;
  M: Cardinal;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = #2) and (s[i + 16] = #13) then
    begin
      M := Ord(s[i + 2]);
      n := IntToBin(M);
      n := Copy(n, Length(n) - 1, 1);
      if n = '0' then
      begin
        M := Ord(s[i + 1]);
        n := IntToBin(M);
        n := Copy(n, Length(n) - 2, 3);
        if n = '100' then
          result := formatfloat('###0.00', StrToFloat(Copy(s, i + 4, 6)) / 100);
        if n = '011' then
          result := formatfloat('####0.0', StrToFloat(Copy(s, i + 4, 6)) / 10);
        if n = '010' then
          result := formatfloat('#####0', StrToFloat(Copy(s, i + 4, 6)))
      end
      else
      begin
        M := Ord(s[i + 1]);
        n := IntToBin(M);
        n := Copy(n, Length(n) - 2, 3);
        if n = '100' then
          result := formatfloat('-###0.00', StrToFloat(Copy(s, i + 4, 6)) / 100);
        if n = '011' then
          result := formatfloat('-####0.0', StrToFloat(Copy(s, i + 4, 6)) / 10);
        if n = '010' then
          result := formatfloat('-#####0', StrToFloat(Copy(s, i + 4, 6)))
      end
    end
  end;
end;

{function YB8142Pro(s: string): string; //  ,9//广东久泰用
var
  i: integer;
  n: string;
  M: cardinal;
begin
  if s = '' then
    Exit;
  for i := 1 to length(s) do
    if (s[i] = #2) and (s[i + 16] = #13) then
      result := formatfloat('#####0', StrToFloat(Copy(s, i + 4, 6)))
end; }

class function TMeterUtil.HT9800(s: string): string; //杭州衡天
var i, tmpInt, p: Integer;
  tmp1, tmp2, tmp3, tmpState: string;
begin
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = Chr(255)) and (Length(Copy(s, i, 5)) >= 5) then
    begin
      tmpInt := Ord(s[i + 2]);
      tmp1 := UpperCase(IntToHex(tmpInt, 2));
      tmpInt := Ord(s[i + 3]);
      tmp2 := UpperCase(IntToHex(tmpInt, 2));
      tmpInt := Ord(s[i + 4]);
      tmp3 := UpperCase(IntToHex(tmpInt, 2));

      p := Ord(s[i + 1]) and $07 - 1;
      //tmpState := RightStr(IntToBin(Ord(s[i + 1])), 8);
      if Ord(s[i + 1]) and $20 shr 5 = 0 then //0代表正
        Result := FloatToStr(StrToInt(tmp3 + tmp2 + tmp1) * Power(10, 0 - p))
      else
        Result := FloatToStr(0 - StrToInt(tmp3 + tmp2 + tmp1) * Power(10, 0 - p));
      Break;
    end;
  end;
end;

class function TMeterUtil.YBPT650D(s: string): string; //志美PT650D ,10
var i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (((s[i] = 'S') and (s[i + 1] = 'T')) or ((s[i] = 'U') and (s[i + 1] = 'S'))
      or ((s[i] = 'Z') and (s[i + 1] = 'R'))) and (s[i + 17] = #10) then
    begin //最前面状态为稳定/不稳定/零点
      if (s[i + 6] = '+') then
        result := FloatToStr(StrToFloat(Trim(Copy(s, i + 7, 7))))
      else
        result := FloatToStr(StrToFloat('-' + Trim(Copy(s, i + 7, 7))));
    end;
  end;
end;

function HexToBin(s: string): string; //十六进制转二进制
var temp: string;
  i: Integer;
begin
  temp := '';
  for i := 1 to 6 do
  begin
    if s[i] = '0' then
      temp := temp + '0000'
    else if s[i] = '1' then
      temp := temp + '0001'
    else if s[i] = '2' then
      temp := temp + '0010'
    else if s[i] = '3' then
      temp := temp + '0011'
    else if s[i] = '4' then
      temp := temp + '0100'
    else if s[i] = '5' then
      temp := temp + '0101'
    else if s[i] = '6' then
      temp := temp + '0110'
    else if s[i] = '7' then
      temp := temp + '0111'
    else if s[i] = '8' then
      temp := temp + '1000'
    else if s[i] = '9' then
      temp := temp + '1001'
    else if UpperCase(s[i]) = 'A' then
      temp := temp + '1010'
    else if UpperCase(s[i]) = 'B' then
      temp := temp + '1011'
    else if UpperCase(s[i]) = 'C' then
      temp := temp + '1100'
    else if UpperCase(s[i]) = 'D' then
      temp := temp + '1101'
    else if UpperCase(s[i]) = 'E' then
      temp := temp + '1110'
    else if UpperCase(s[i]) = 'F' then
      temp := temp + '1111'
  end;
  result := temp;
end;

function HexToInt(const str: string): Integer;
var i: Integer;
begin
  result := 0;
  for i := Length(str) downto 1 do
  begin
    result := result + Trunc(StrToInt(str[i]) * power(2, Length(str) - i))
  end;
end;

function BuMa(s: string): string; //取补码
var i, j: Integer;
begin
  for i := Length(s) downto 1 do
  begin
    if s[i] = '1' then
    begin
      for j := 1 to i - 1 do
        if s[j] = '0' then
          s[j] := '1'
        else if s[j] = '1' then
          s[j] := '0';
      break;
    end
  end;
  result := s;
end;

class function TMeterUtil.XK3196B(s: string; var SteadyFlag: boolean): string; //杭州四方XK3196B ，12
var i: Integer;
  s16, TP: string;
begin
  for i := 1 to Length(s) do
    s16 := s16 + IntToHex(Ord(s[i]), 2);
  TP := HexToBin(Trim(Copy(s16, 1, 6)));
  SteadyFlag := Copy(TP, 18, 1) = '1';
  if Copy(TP, 19, 1) = '0' then
    result := IntToStr(HexToInt(Copy(TP, 19, 6) + Copy(TP, 10, 7) + Copy(TP, 2, 7)))
  else if Copy(TP, 19, 1) = '1' then
    result := '-' + IntToStr(HexToInt(BuMa(Copy(TP, 20, 5) + Copy(TP, 10, 7) + Copy(TP, 2, 7))));
end;

class function TMeterUtil.XK3190A9(s: string): string;
var
  i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) do
  begin
    if (s[i] = chr(02)) and (s[i + 11] = chr(03)) then
    begin
      if Copy(s, i + 8, 1) = '0' then
        result := formatfloat('###0', StrToFloat(Copy(s, i + 1, 7)));
      if Copy(s, i + 8, 1) = '1' then
        result := formatfloat('###0.0', StrToFloat(Copy(s, i + 1, 7)) / 10);
      if Copy(s, i + 8, 1) = '2' then
        result := formatfloat('###0.00', StrToFloat(Copy(s, i + 1, 7)) / 100);
      if Copy(s, i + 8, 1) = '3' then
        result := formatfloat('###0.000', StrToFloat(Copy(s, i + 1, 7)) / 1000);
      if Copy(s, i + 8, 1) = '4' then
        result := formatfloat('###0.0000', StrToFloat(Copy(s, i + 1, 7)) / 10000);
      break;
    end;
  end;
end;


class function TMeterUtil.XK3190A12(s: string): string;
var
  i: Integer;
begin
  if s = '' then
    Exit;
  if Length(s) < 10 then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = 'w') and ((s[i + 1] = 'w') or (s[i + 1] = 'n') or (s[i + 1] = 't')) then
    begin
      Result := FloatToStr(StrToFloat(Copy(s, i + 2, 8)));
      Break;
    end;
  end;
end;

class function TMeterUtil.FT11D(s: string): string;
var
  i, M: integer;
  n, Temp: string;
  Value: Extended;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (ord(s[i]) = 2) then
    begin
      M := ord(s[i + 1]);
      n := IntToBin(M);
      n := Copy(n, Length(n) - 2, 3);
      if TryStrToFloat(Copy(s, i + 4, 11), Value) and (length(Copy(s, i + 4, 11)) > 10) then
      begin
        if n = '011' then
          Temp := formatfloat('####0.0', Value / 10)
        else if n = '100' then
          Temp := formatfloat('###0.00', Value / 100)
        else if n = '101' then
          Temp := formatfloat('##0.000', Value / 1000)
        else if n = '110' then
          Temp := formatfloat('#0.0000', Value / 10000)
        else if n = '111' then
          Temp := formatfloat('0.00000', Value / 100000)
            //  else if n = '001' then
         //     Temp := formatfloat('#####0', Value)
        else
          Temp := formatfloat('#####0', Value);
        if Temp = '' then Exit;
        if (ord(s[i + 2]) = 112) then
        begin
          result := Temp;
        end
        else if (ord(s[i + 2]) = 114) then
        begin
          result := '-' + Temp;
        end
      end;
    end;
    Break;
  end;
  if (result = '-0') then
  begin
    result := '0';
  end;
end;

class function TMeterUtil.XK3102(s: string): string;
var i: integer;
  startChar, endChar: string;
  tmpWeight: string;
begin
  try
    for i := 0 to Length(s) - 1 do
    begin
      startChar := s[i] + s[i + 1];
      endChar := s[i + 16] + s[i + 17];
      if (startChar = 'OL')
        or (startChar = 'ST')
        or (startChar = 'US')
        or (startChar = 'ZR')
        or (startChar = 'CH')
        or (startChar = 'Re')
        or (startChar = 'Co')
        or (startChar = 'Sv') then
      begin
        tmpWeight := Copy(s, i + 6, 8);
        if Length(Trim(tmpWeight)) < 8 then
        begin
          Result := '';
          Exit;
        end;
        if tmpWeight[2] = ' ' then //没有小数点
        begin
          result := FloatToStr(StrToFloat(Copy(tmpWeight, 3, 6)))
        end
        else
        begin
          result := FloatToStr(StrToFloat(Copy(tmpWeight, 2, 7)));
        end;

        if tmpWeight[1] = '-' then
          result := '-' + result;
      end;
    end;
  except
    result := '';
  end;
end;

class function TMeterUtil.XK315A6(s: string): string;
var StartChar, tmpWeight: string;
  i: Integer;
  pointState: string;
begin
  StartChar := ' ';
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = StartChar) and (i > 2) then //找到起始字符
    begin
      pointState := s[i - 2];
      tmpWeight := Copy(s, i + 1, 6);
      if Length(Trim(tmpWeight)) < 6 then
      begin
        result := '';
        Exit;
      end;
      if pointState = Chr($20) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 100)
      else if pointState = Chr($21) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 10)
      else if pointState = Chr($22) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 1)
      else if pointState = Chr($23) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 0.1)
      else if pointState = Chr($24) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 0.01)
      else if pointState = Chr($25) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 0.001)
      else if pointState = Chr($26) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 0.0001)
      else if pointState = Chr($27) then
        Result := FloatToStr(StrToFloat(tmpWeight) * 0.00001);
      break;
    end;
  end;
end;

class function TMeterUtil.HBM2116(s: string): string;
var i: integer;
begin
  Result := '';
  if S = '' then
    Exit;
  for i := 1 to Length(S) do
  begin
    if (S[i] = #45) or (S[i] = #32) then
    begin
      if (S[i + 14] = #13) and (S[i + 15] = #10) then
      begin
        Result := FloatToStr(StrToFloat(Copy(S, i, 9)));
        Break;
      end;
    end;
  end;
end;

class function TMeterUtil.HT9800D7PF(s: string;
  var SteadyFlag: boolean): string;
var i: integer;
  value: Double; //6位整数值
  point: integer; //小数点
  tmp: string;
begin
  for i := 0 to Length(s) - 1 do
  begin
    if s[i] = Chr($02) then
    begin
      if TryStrToFloat(Copy(s, i + 4, 6), Value) and (length(Copy(s, i + 4, 6)) > 5) then
      begin
        //取小数点位
        if s[i + 1] = Chr($20) then
          point := 0
        else if s[i + 1] = Chr($23) then
          point := 1
        else if s[i + 1] = Chr($24) then
          point := 2
        else if s[i + 1] = Chr($25) then
          point := 3
        else if s[i + 1] = Chr($26) then
          point := 4
        else
          point := 0;
        //取稳定状态及正负值
        tmp := IntToBin(Ord(s[i + 2]));
        SteadyFlag := tmp[29] = '0';
        if tmp[31] = '0' then
          Result := FloatToStr(value * Power(10, point))
        else if tmp[31] = '1' then
          Result := FloatToStr(0 - (value * Power(10, point)))
      end;
    end;
  end;
end;

class function TMeterUtil.XK3101(s: string; var SteadyFlag: Boolean): string;
var i: integer;
  value: Double; //6位整数值
  point: integer; //小数点
  tmp: string;
begin
  for i := 0 to Length(s) - 1 do
  begin
    if s[i] = Chr($02) then
    begin
      if TryStrToFloat(Copy(s, i + 4, 5), Value) and (length(Copy(s, i + 4, 5)) > 4) then
      begin
        //取小数点位
        tmp := RightStr(IntToHex(ord(s[i + 1]), 1), 1);
        if s[i + 1] = Chr($0A) then
          point := 0
        else if s[i + 1] = Chr($0B) then
          point := 1
        else if s[i + 1] = Chr($0C) then
          point := 2
        else if s[i + 1] = Chr($0D) then
          point := 3
        else if s[i + 1] = Chr($0E) then
          point := 4
        else
          point := 0;
        //取稳定状态及正负值
        tmp := IntToBin(Ord(s[i + 2]));
        SteadyFlag := tmp[29] = '0';
        if tmp[31] = '0' then
          Result := FloatToStr(value * Power(10, point))
        else if tmp[31] = '1' then
          Result := FloatToStr(0 - (value * Power(10, point)))
      end;
    end;
  end;
end;

class function TMeterUtil.XK319A(s: string): string;
var i: integer;
  value: Double; //6位整数值
  point: integer; //小数点
  tmp: string;
begin
  for i := 0 to Length(s) - 1 do
  begin
    if s[i] = Chr($02) then
    begin
      if TryStrToFloat(Copy(s, i + 4, 6), Value) and (length(Copy(s, i + 4, 6)) > 5) then
      begin
        //取小数点位
        tmp := RightStr(IntToHex(ord(s[i + 1]), 1), 1);
        if s[i + 1] = Chr($20) then
          point := 0
        else if s[i + 1] = Chr($23) then
          point := -1
        else if s[i + 1] = Chr($24) then
          point := -2
        else if s[i + 1] = Chr($25) then
          point := -3
        else if s[i + 1] = Chr($26) then
          point := -4
        else if s[i + 1] = Chr($27) then
          point := -5
        else
          point := 0;
        //取稳定状态及正负值
        tmp := IntToBin(Ord(s[i + 2]));
        //SteadyFlag := tmp[29] = '0';
        if tmp[31] = '0' then
          Result := FloatToStr(value * Power(10, point))
        else if tmp[31] = '1' then
          Result := FloatToStr(0 - (value * Power(10, point)))
      end;
    end;
  end;
end;

class function TMeterUtil.D2008F_2(s: string): string;
var i, j: integer;
  f: string;
begin
  f := '';
  for i := 0 to Length(s) do
  begin
    if s[i] = '=' then
    begin
      if Length(Copy(s, 1, i)) > 7 then
      begin
        if s[i - 7] = '.' then
        begin
          for j := i - 1 downto i - 6 do
            f := f + s[j];
        end
        else
        begin
          for j := i - 1 downto i - 7 do
            f := f + s[j];
        end;
        result := FloatToStr(StrToFloat(f));
        break;
      end;
    end;
  end;
end;

class function TMeterUtil.D2008F_3(s: string): string;
var i, j: integer;
  f: string;
begin
  f := '';
  for i := 0 to Length(s) do
  begin
    if s[i] = '=' then
    begin
      if Length(Copy(s, 1, i)) > 8 then
      begin
        if s[i - 8] = '.' then
        begin
          for j := i - 1 downto i - 7 do
            f := f + s[j];
        end
        else
        begin
          for j := i - 1 downto i - 8 do
            f := f + s[j];
        end;
        result := FloatToStr(StrToFloat(f));
        break;
      end;
    end;
  end;
end;

class function TMeterUtil.VT300_D(s: string): string;
var
  i: Integer;
begin
  if s = '' then
    Exit;
  if Length(s) < 10 then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if ((s[i] = '+') or (s[i] = '-')) and (s[i + 7] = Chr($0D)) then
    begin
      result := FloatToStr(StrToFloat(Copy(s, i, 7)));
      break;
    end;
  end;
end;

class function TMeterUtil.JIK(s: string): string;
var i: integer;
  sign, w: string;
begin
  for i := 0 to Length(s) do
  begin
    if ((s[i] = 'S') and (s[i + 1] = 'T'))
      or ((s[i] = 'U') and (s[i] = 'S')) then
    begin
      sign := Copy(s, i + 6, 1);
      w := Copy(s, i + 7, 8);
      Result := FloatToStr(StrToFloat(sign + Trim(w)));
    end;
  end;
end;

class function TMeterUtil.JWI586(s: string): string;
var i: integer;
  sign, w: string;
begin
  {
  N.W. : +  3.662 kg
  T.W. : +  0.000 kg
  G.W. : +  3.662 kg
  }
  for i := 0 to Length(s) do
  begin
    if ((s[i] = 'G') and (s[i + 1] = '.') and (s[i + 2] = 'W')) then
    begin
      sign := Copy(s, i + 8, 1);
      w := Copy(s, i + 9, 8);
      Result := FloatToStr(StrToFloat(sign + Trim(w)));
    end;
  end;
end;

class function TMeterUtil.JWI700(s: string): string;
var i: integer;
  sign, w: string;
begin
  {
  N.W.: +  3.662 kg
  T.W.: +  0.000 kg
  G.W.: +  3.662 kg
  }
  for i := 0 to Length(s) do
  begin
    if ((s[i] = 'G') and (s[i + 1] = '.') and (s[i + 2] = 'W')) then
    begin
      sign := Copy(s, i + 6, 1);
      w := Copy(s, i + 7, 8);
      Result := FloatToStr(StrToFloat(sign + Trim(w)));
    end;
  end;
end;

class function TMeterUtil.XK3168(s: string): string;
var i: integer;
begin
  for i := 0 to Length(s) do
  begin
    if s[i] = Chr($FF) then
    begin

    end;
  end;
end;

class function TMeterUtil.XK3199B(s: string): string;
var i: integer;
begin
  for i := 0 to Length(s) do
  begin
    if s[i] = Chr($FF) then
    begin

    end;
  end;
end;

class function TMeterUtil.Personlize(s, startChar: string; start, len,
  point, queue, strType: Integer): string;
var i, j, k: Integer;
  r, sTemp: string;
begin
  sTemp := '';
  for i := 0 to Length(s) do
  begin
    if s[i] in ['0'..'9','a'..'z','A'..'Z','.'] then
    begin
      sTemp := sTemp + s[i];
    end;
  end;
  s := sTemp;
  if (Length(startChar) > 1) and (Copy(startChar, 1, 1) = '#') then
    StartChar := Chr(StrToInt(Copy(startChar, 2, Length(startChar))));
  for i := 0 to Length(s) do
  begin
    if s[i] = startChar then
    begin
      if strType = 0 then
      begin
        r := Copy(s, i + start, len);
        if queue = 1 then
          r := ReverseString(r);

        sTemp := '';
        for k := 0 to Length(r) do
        begin
          if r[k] in ['0'..'9','a'..'z','A'..'Z','.'] then
          begin
            sTemp := sTemp + r[k];
          end;
        end;
        r := sTemp;
        
        Result := FloatToStr(StrToFloatDef(r, 0) * Power(10, 0 - point));
      end
      else if strType = 1 then
      begin
        r := '';
        for j := 1 to len do
        begin
          if queue = 0 then
          begin
            r := r + UpperCase(IntToHex(Ord(s[i + start + j - 1]), 2));
          end
          else
          begin
            r := r + UpperCase(IntToHex(Ord(s[i + start + len - j]), 2));
          end;
        end;
        Result := FloatToStr(StrToIntDef(r, 0) * Power(10, 0 - point));
      end
      else if strType = 2 then
      begin
        r := '';
        for j := 1 to len do
        begin
          if queue = 0 then
          begin
            r := r + UpperCase(IntToHex(Ord(s[i + start + j]), 2));
          end
          else
          begin
            r := r + UpperCase(IntToHex(Ord(s[i + start + len - j + 1]), 2));
          end;
        end;
        Result := FloatToStr(StrToIntDef('$' + r, 0) * Power(10, 0 - point));
      end;
      Break;
    end;
  end;
end;

class function TMeterUtil.XK3196G(s: string): string;
var i, j: Integer;
  tmp, r: string;
begin
  for i := 0 to Length(s) do
  begin
    if s[i] = Chr($CD) then
    begin
      tmp := Copy(s, i, 7);
      if Length(tmp) = 7 then
      begin
        r := '';
        for j := 3 to 7 do
        begin
          if tmp[j] <> Chr($0A) then
          begin
            if Ord(tmp[j]) > $80 then
            begin
              r := r + IntToHex(Ord(tmp[j]), 1) + '.'
            end
            else
            begin
              r := r + IntToHex(Ord(tmp[j]), 1);
            end;
          end;
        end;
        if tmp[3] = Chr($0B) then r := '-' + r;
      end;
      Break;
    end;
  end;
  result := r;
end;

class function TMeterUtil.WTN81(s: string): string;
var i, tmpInt, p: Integer;
  tmp1, tmp2, tmp3, tmpState: string;
begin
  for i := 0 to Length(s) - 1 do
  begin
    if s[i] = Chr($5A) then
    begin
      tmpInt := Ord(s[i + 1]) and $0F;
      tmp1 := UpperCase(IntToHex(tmpInt, 2));
      tmpInt := Ord(s[i + 2]);
      tmp2 := UpperCase(IntToHex(tmpInt, 2));
      tmpInt := Ord(s[i + 3]);
      tmp3 := UpperCase(IntToHex(tmpInt, 2));

      p := Ord(s[i + 1]) and $70;
      if Ord(s[i + 1]) and $80 shr 7 = 0 then //0代表正
        Result := FloatToStr(StrToInt(tmp1 + tmp2 + tmp3) * Power(10, 0 - p))
      else
        Result := FloatToStr(0 - StrToInt(tmp1 + tmp2 + tmp3) * Power(10, 0 - p));
    end;
  end;
end;

class function TMeterUtil.BST100(const s, addr: string): string;
var speed, flow, givenFloat: Double;
  i: Integer;
begin
  for i := 1 to Length(s) do
  begin
    if s[i] = ':' then
    begin
      speed := RoundTo(TCommonUtil.modbusFloatValue(Copy(s, i + 15, 8)), -3);
      flow := RoundTo(TCommonUtil.modbusFloatValue(Copy(s, i + 23, 8)), -3);
      givenFloat := RoundTo(TCommonUtil.modbusFloatValue(Copy(s, i + 31, 8)), -3);
      Result := IntToStr(StrToInt64('$' + Copy(s, i + 7, 8)));
      Break;
    end;
  end;
end;

class function TMeterUtil.GZJJ09P(s: string): string;
var i: integer;
  tmp: string;
begin
  for i := 1 to Length(s) do
  begin
    if (s[i] = Chr($FF)) and (s[i + 1] = Chr($AA))
      and (s[i + 2] = Chr($0D)) and (s[i + 3] = Chr($30))
      and (s[i + 7] = Chr($A6)) then
    begin
      tmp := IntToHex(Ord(s[i + 8]), 2) + IntToHex(Ord(s[i + 9]), 2)
        + IntToHex(Ord(s[i + 10]), 2) + IntToHex(Ord(s[i + 11]), 2);
      Result := FloatToStr(StrToIntDef('$' + tmp, 0) / 100 * Power(10, Ord(s[i + 12]) and $03));
      Break;
    end;
  end;
end;

class function TMeterUtil.LC200(const s, addr: string): string;
var i, j, len: Integer;
  tmp, tmp1: string;
begin
  for i := 1 to Length(s) do
  begin
    if (s[i] = Chr(StrToInt('$' + addr))) and (s[i + 1] = Chr($04)) then
    begin
      len := Ord(s[i + 2]);
      tmp := Copy(s, i + 3, len);
      tmp1 := '';
      for j := 1 to Length(tmp) do
      begin
        tmp1 := tmp1 + IntToHex(Ord(tmp[j]), 2);
      end;
      Result := FloatToStr(StrToInt64('$' + tmp1) * 0.001);
      Break;
    end;
  end;
end;

class procedure TMeterUtil.addMeterType(cb: TComboBox);
begin
  cb.Items.Clear;
  cb.Items.Add('1.上海耀华XK3190-A6');
  cb.Items.Add('2.上海耀华XK3190-A9');
  cb.Items.Add('3.上海耀华XK3190-A12E');
  cb.Items.Add('4.上海耀华XK3190-DS1');
  cb.Items.Add('5.上海耀华XK3190-DS3');
  cb.Items.Add('6.上海耀华XK3190-D2+');
  cb.Items.Add('7.上海耀华XK3190-D');
  cb.Items.Add('8.上海耀华XK3190-D9');
  cb.Items.Add('9.上海耀华XK3190-C8');
  cb.Items.Add('10.宁波柯力D2002');
  cb.Items.Add('11.宁波柯力D2008F(tf=0)');
  cb.Items.Add('12.宁波柯力D2008F(tf=2)');
  cb.Items.Add('13.宁波柯力D2008F(tf=3)');
  cb.Items.Add('14.杭州衡天HT9800');
  cb.Items.Add('15.杭州衡天HT9800D7');
  cb.Items.Add('16.聊城昌信XK3168');
  cb.Items.Add('17.杭州顶松DS822-D4+');
  cb.Items.Add('18.杭州四方XK3196-B');
  cb.Items.Add('19.托力多8142_07 pro+');
  cb.Items.Add('20.托力多8142_08 pro+');
  cb.Items.Add('21.珠海志美PT650D');
  cb.Items.Add('22.珠海志美CB900');
  cb.Items.Add('23.福州科杰ORMT-2000');
  cb.Items.Add('24.上海东南XK3188A');
  cb.Items.Add('25.托力多T800');
  cb.Items.Add('26.富林泰克FT-11D');
  cb.Items.Add('27.济南金钟XK3102D');
  cb.Items.Add('28.上海彩信XK315A6');
  cb.Items.Add('29.常州宏力XK3101');
  cb.Items.Add('30.北京能克XK319A');
  cb.Items.Add('31.HBM2116');
  cb.Items.Add('32.VT-300D');
  cb.Items.Add('33.厦门懿恒JIK系列');
  cb.Items.Add('34.厦门懿恒JWI586');
  cb.Items.Add('35.厦门懿恒JWI700W');
  cb.Items.Add('36.杭州四方XK3196G');
  cb.Items.Add('37.万泰吊钩秤XK3109');
  cb.Items.Add('38.广州聚杰09P');
  cb.Items.Add('39.长沙佳仪BST100');
  cb.Items.Add('40.山西力创LC200');
  cb.Items.Add('41.上海英展SB520/530');
  cb.Items.Add('42.上海英展EX2001/2');
  cb.Items.Add('43.深圳杰曼格式1');
  cb.Items.Add('44.深圳杰曼格式2');
  cb.Items.Add('45.深圳杰曼格式3');
  cb.Items.Add('46.朗科精工LP7510');
  cb.Items.Add('47.惠尔邦T2000A');
  cb.Items.Add('48.JCYJ-96W3Y(S)');
  cb.Items.Add('49.自定义');
end;

class function TMeterUtil.getMeterNum(meterType: Integer; s: string; var sf: Boolean;
  addr, startChar: string; firstPos, dataLen, point, queue,
  charType: Integer): string;
begin
  case meterType of
    0: Result := YB3198A(s);
    1: Result := XK3190A9(s);
    2: Result := XK3190A12(s);
    3: Result := XK3190A9(s);
    4: Result := XK3190A9(s);
    5: Result := YB3198B(s);
    6: Result := YB3198D(s);
    7: Result := YB3198BD9(s);
    8: Result := XK3190A9(s);
    9: Result := YBORMT2000(s);
    10: Result := XK3190A9(s);
    11: Result := D2008F_2(s);
    12: Result := D2008F_3(s);
    13: Result := HT9800(s);
    14: Result := HT9800D7PF(s, sf);
    15: Result := HT9800(s);
    16: Result := YB2005D(s);
    17: Result := XK3196B(s, sf);
    18: Result := YB8142Pro(s);
    19: Result := YB8142Pro(s);
    20: Result := YBPT650D(s);
    21: Result := YBPT650D(s);
    22: Result := YBORMT2000(s);
    23: Result := XK3188A(s);
    24: Result := DNSCSA(s);
    25: Result := FT11D(s);
    26: Result := XK3102(s);
    27: Result := XK315A6(s);
    28: Result := XK3101(s, sf);
    29: Result := XK319A(s);
    30: Result := HBM2116(s);
    31: Result := VT300_D(s);
    32: Result := JIK(s);
    33: Result := JWI586(s);
    34: Result := JWI700(s);
    35: Result := XK3196G(s);
    36: Result := WTN81(s);
    37: Result := GZJJ09P(s);
    38: Result := BST100(s, addr);
    39: Result := LC200(s, addr);
    40: Result := SB520(s);
    41: Result := EX200(s);
    42: Result := GM880301(s);
    43: Result := GM880302(s);
    44: Result := GM880303(s);
    45: Result := YBPT650D(s);
    46: Result := T2000A(s);
    47: Result := JCYJ_96W3Y(s, addr);
    48: Result := Personlize(s, startChar, firstPos, dataLen, point, queue, charType);
  else
    Result := '';
  end;
end;

class function TMeterUtil.EX200(const s: string): string;
var i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (((s[i] = 'S') and (s[i + 1] = 'T')) or ((s[i] = 'U') and (s[i + 1] = 'S')))
      and (s[i + 17] = #10) then
    begin //最前面状态为稳定/不稳定/零点
      if (s[i + 6] = '+') then
        result := FloatToStr(StrToFloat(Trim(Copy(s, i + 7, 7))))
      else
        result := FloatToStr(StrToFloat('-' + Trim(Copy(s, i + 7, 7))));
    end;
  end;
end;

class function TMeterUtil.SB520(const s: string): string;
var i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (((s[i] = 'S') and (s[i + 1] = 'T')) or ((s[i] = 'U') and (s[i + 1] = 'S')))
      and (s[i + 17] = #10) then
    begin //最前面状态为稳定/不稳定/零点
      if (s[i + 6] = '+') then
        result := FloatToStr(StrToFloat(Trim(Copy(s, i + 7, 7))))
      else
        result := FloatToStr(StrToFloat('-' + Trim(Copy(s, i + 7, 7))));
    end;
  end;
end;

class function TMeterUtil.GM880301(const s: string): string;
var i, tmpInt, p: Integer;
  tmp1, tmp2, tmp3, tmpState: string;
begin
  for i := 0 to Length(s) - 1 do
  begin
    if s[i] = Chr(255) then
    begin
      tmpInt := Ord(s[i + 2]);
      tmp1 := UpperCase(IntToHex(tmpInt, 2));
      tmpInt := Ord(s[i + 3]);
      tmp2 := UpperCase(IntToHex(tmpInt, 2));
      tmpInt := Ord(s[i + 4]);
      tmp3 := UpperCase(IntToHex(tmpInt, 2));

      p := Ord(s[i + 1]) and $07;

      if Ord(s[i + 1]) and $20 shr 5 = 0 then //0代表正
        Result := FloatToStr(StrToInt(tmp3 + tmp2 + tmp1) * Power(10, 0 - p))
      else
        Result := FloatToStr(0 - StrToInt(tmp3 + tmp2 + tmp1) * Power(10, 0 - p));
    end;
  end;
end;

class function TMeterUtil.GM880302(const s: string): string;
var
  i: Integer;
  p: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = #2) and (s[i + 16] = #13) then
    begin
      p := (Ord(s[i + 1]) and $07) - 2; //小数点
      if Ord(s[i + 2]) and $02 shr 1 = 0 then //0代表正
      begin
        Result := FloatToStr(StrToFloatDef(Copy(s, i + 4, 6), 0) * Power(10, 0 - p));
      end
      else
      begin
        Result := FloatToStr(0 - StrToFloatDef(Copy(s, i + 4, 6), 0) * Power(10, 0 - p));
      end;
    end;
  end;
end;

class function TMeterUtil.GM880303(const s: string): string;
var i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (((s[i] = 'S') and (s[i + 1] = 'T')) or ((s[i] = 'U') and (s[i + 1] = 'S'))
      or ((s[i] = 'O') and (s[i + 1] = 'L'))) and (s[i + 17] = #10) then
    begin //最前面状态为稳定/不稳定/零点
      if (s[i + 6] = '+') then
        result := FloatToStr(StrToFloat(Trim(Copy(s, i + 7, 7))))
      else
        result := FloatToStr(StrToFloat('-' + Trim(Copy(s, i + 7, 7))));
    end;
  end;
end;

class function TMeterUtil.DINI3590E(const s: string): string;
var i: Integer;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (((s[i] = 'S') and (s[i + 1] = 'T')) or ((s[i] = 'U') and (s[i + 1] = 'S'))
      or ((s[i] = 'O') and (s[i + 1] = 'L'))) and (s[i + 32] = #10) then
    begin
      //最前面状态为稳定/不稳定/零点;
      result := FloatToStr(StrToFloat(Trim(Copy(s, i + 5, 10))));
    end;
  end;
end;

class function TMeterUtil.T2000A(const s: string): string;
var
  i: Integer;
  p: Integer;
  r: Double;
begin
  if s = '' then
    Exit;
  for i := 0 to Length(s) - 1 do
  begin
    if (s[i] = #2) and (s[i + 18] = #3) then
    begin
      p := StrToIntDef(s[i + 14], 0); //小数点

      r := StrToFloatDef(Copy(s, i + 2, 6), 0) * Power(10, 0 - p);

      if s[i + 1] = '-' then
        r := 0 - r;

      Result := FloatToStr(r);
    end;
  end;
end;

class function TMeterUtil.JCYJ_96W3Y(const s, addr: string): string;
var i, j, len: Integer;
  tmp, tmp1: string;
begin
  for i := 1 to Length(s) do
  begin
    if (s[i] = Chr(StrToInt('$' + addr))) and (s[i + 1] = Chr($03)) then
    begin 
      tmp := Copy(s, i + 9, 2);
      tmp1 := '';
      for j := 1 to Length(tmp) do
      begin
        tmp1 := tmp1 + IntToHex(Ord(tmp[j]), 2);
      end;
      Result := FloatToStr(StrToInt64('$' + tmp1) * 0.1);
      Break;
    end;
  end;
end;

end.

