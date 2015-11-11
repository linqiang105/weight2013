unit CommonUtil;

interface

uses DBGridEh, DBGridEhImpExp, SysUtils, Dialogs, Windows, ShlObj,
  StrUtils, Controls, Forms, IdCoder, IdCoderMIME, IdHashMessageDigest,
  ZLibEx, WinSock, WinSvc, Classes, EncdDecd, jpeg;

type

  TCol = record
    field: string;
    showField: string;
  end;

  TCommonUtil = class
  private
  public
    class function exportExcel(DBGrid: TDBGridEh): boolean; //导出Excel
    class function exportExcelByModel(): Boolean;
    class function saveFile(dir: string = ''; desc: string = ''; ext: string = ''): string;
    class function SelectFolder(const h: THandle; const DlgTitle: string): string; //选择路径
    class procedure ExitWin32Sys(iFlags: Integer); //关机过程
    class function TransferGlideNo(source: integer; n: integer = 6): string; //将数字转为流水号
    //小写转成大写 --- 金额
    class function small2big(sourcemoney: currency): string;
    //只是阿拉伯数字转大写
    class function Num2CNum(dblArabic: double): string;
    class function HexStrToStr(const s: string): string;
    class function HexStrToBin(s: string): string;
    class function BinToHexStr(s: string): string;
    //封装打开文件,保存文件的对话框
    class function openFileDialog(ext, filter: string; initialDir: string = ''): string;
    class function saveFileDialog(ext, filter: string; initialDir: string = ''): string;
    //编码
    class function md5(s: string): string;

    class function base64(s: string): string; overload;
    class function deBase64(s: string): string; overload;
    class function compressAndBase64(s: string): string; overload;
    class function deBase64AndDecompress(s: string): string; overload;

    class function base64(ms: TMemoryStream): string; overload;
    class function compressAndBase64(ms: TMemoryStream): string; overload;
    class function streamToBase64(AStream: TStream): string;
    class function JPEGToString(pic: string): string;

    //取本地网络信息
    class function getLocalIp(): string;
    class function getLocateIp(InternetIp: Boolean = False): string;
    class function Set_WindowsXP_FireWall(Enable: boolean): Boolean;
    //MODBUS校验
    class function modbusRTUCheck(const s: string): string;
    class function modbusAsciiCheck(const s: string): string;
    class function modbusFloatValue(const s: string): Double;
    //Value:实际数值
    //Divide:分度值
    //Point:小数点
    //sumType:0：只舍不入，1：四舍五入，2：只入不舍，3：四舍六入五成双
    class function RoundToEx(Value: Double; Divide: Integer;
      Digit: Integer; sumType: Integer): Double;
    class function meterValue(Value: Double; Divide: Integer;
      cheatType: Boolean = True; cheat: Double = 0): Double;
    class function printerBack(step: Double): Boolean; overload;
    class function printerBack(defaultPrinter: string; mm: Integer): Boolean; overload;
    class function AddPaper(paperName: string; width, height: Double): Boolean;
    class function SendDataToPrinter(sDeviceName, sDocName, sData: string): Boolean;
    class function setTimeFormat():Boolean;
  end;

implementation

uses IniFiles, Math, WinSpool, Printers, ComObj, QueryDM, Graphics, Main, 
  Registry;

{ TCommon }

class function TCommonUtil.exportExcel(DBGrid: TDBGridEh): boolean;
var
  ExpClass: TDBGridEhExportClass;
  sd: TSaveDialog;
  Ext: string;
begin
  Result := False;
  sd := TSaveDialog.Create(Application);
  try
    sd.FileName := '';
    sd.Filter :=
      'Excel文件(*.xls)|*.xls|文本文件(*.txt)|*.txt|通讯录(*.csv)|*.csv|网页(*.htm)|*.htm|导入模板文件|*.xls';
    sd.Title := '保存到...';
    if sd.Execute then
    begin
      case sd.FilterIndex of
        1:
          begin
            ExpClass := TDBGridEhExportAsXLS;
            Ext := 'xls';
          end;
        2:
          begin
            ExpClass := TDBGridEhExportAsText;
            Ext := 'txt';
          end;
        3:
          begin
            ExpClass := TDBGridEhExportAsCSV;
            Ext := 'csv';
          end;
        4:
          begin
            ExpClass := TDBGridEhExportAsHTML;
            Ext := 'htm';
          end;
        5: begin

          end;
      else
        begin
          ExpClass := nil;
          Ext := '';
        end;
      end;

      if sd.FilterIndex = 5 then
      begin
        exportExcelByModel;
      end
      else
      begin
        if ExpClass <> nil then
        begin
          if UpperCase(Copy(sd.FileName, Length(sd.FileName) - 2, 3)) <>
            UpperCase(Ext) then
            sd.FileName := sd.FileName + '.' + Ext;
          SaveDBGridEhToExportFile(ExpClass, DBGrid, sd.FileName, True);
          result := True;
        end;
      end;
    end;
  finally
    sd.Free;
  end;
end;

function GetSysTypes(): boolean; //判定windows系统类型
var
  Ver: TOSVersionInfo;
begin
  result := False;
  Ver.dwOSVersionInfoSize := Sizeof(TOSVersionInfo);
  if GetVersionEx(Ver) then
    if Ver.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
      result := True
    else
      result := False
end;

function SetPrivilege(sPrivilegeName: AnsiString; bEnable: boolean): boolean; //设置权限
var
  TPPrev, TP: TTokenPrivileges;
  Token: THandle;
  dwRetLen: DWord;
begin
  result := False;
  OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or
    TOKEN_QUERY, Token);
  TP.PrivilegeCount := 1;
  if LookupPrivilegeValue(nil, PAnsiChar(sPrivilegeName), TP.Privileges[0].LUID) then
  begin
    if bEnable then
      TP.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED
    else
      TP.Privileges[0].Attributes := 0;
    dwRetLen := 0;
    result := AdjustTokenPrivileges(Token, False, TP, Sizeof(TPPrev), TPPrev, dwRetLen)
  end;
  CloseHandle(Token)
end;

class procedure TCommonUtil.ExitWin32Sys(iFlags: Integer); //关机过程
begin
  if GetSysTypes then
    ExitWindowsEx(iFlags, 0)
  else if SetPrivilege('SeShutdownPrivilege', True) then
    if not ExitWindowsEx(iFlags, 0) then
      SetPrivilege('SeShutdownPrivilege', False)
end;

class function TCommonUtil.SelectFolder(const h: THandle; const DlgTitle: string): string;
var
  bi: TBrowseInfo;
  PathIdList: PItemIdList;
  strPath: string;
begin
  strPath := stringOfChar(' ', 512);
  bi.hwndOwner := h;
  bi.pidlRoot := nil;
  bi.pszDisplayName := nil;
  bi.lpszTitle := pchar(DlgTitle);
  bi.ulFlags := BIF_ReturnOnlyFsDirs;
  bi.lpfn := nil;
  bi.lParam := 0;
  bi.iImage := 0;
  result := '';
  PathIdList := SHBrowseForFolder(bi);
  if PathIdList <> nil then
    if SHGetPathFromIdList(PathIdList, pchar(strPath)) then
      result := Trim(strPath)
end;

class function TCommonUtil.TransferGlideNo(source, n: integer): string;
var i: integer;
  temp: string;
begin
  temp := IntToStr(source);
  result := temp;
  for i := 1 to n - Length(temp) do
    result := '0' + result;
end;

class function TCommonUtil.small2big(sourcemoney: currency): string;
var
  strsourcemoney, strobjectmoney: string;
  thiswei, thispos: string[2];
  iwei, pospoint: Integer;
begin
  strsourcemoney := formatfloat('0.00', sourcemoney);
  if Length(strsourcemoney) > 15 then //超过千亿元
  begin
    ShowMessage('请输入正确的数字，不要超过千亿（15位整数）');
    Exit;
  end;
  pospoint := Pos('.', strsourcemoney); //小数点位置
  for iwei := Length(strsourcemoney) downto 1 do //例如：500.8 = 5 X=4
  begin
    case pospoint - iwei of //小数点位置 - 总长度 ＝ 最后一位单位
      -3: thispos := '厘';
      -2: thispos := '分';
      -1: thispos := '角';
      1: if (pospoint > 2) or (strsourcemoney[iwei] <> '0') then //小数点位置大于零
          thispos := '元';
      2: thispos := '拾';
      3: thispos := '佰';
      4: thispos := '千';
      5: thispos := '万';
      6: thispos := '拾';
      7: thispos := '佰';
      8: thispos := '千';
      9: thispos := '亿';
      10: thispos := '十';
      11: thispos := '佰';
      12: thispos := '千';
    end;
    case strsourcemoney[iwei] of //当前数字转换成人民币汉字
      '.': Continue;
      '1': thiswei := '壹';
      '2': thiswei := '贰';
      '3': thiswei := '叁';
      '4': thiswei := '肆';
      '5': thiswei := '伍';
      '6': thiswei := '陆';
      '7': thiswei := '柒';
      '8': thiswei := '捌';
      '9': thiswei := '玖';
      '0':
        begin
          thiswei := '';
          if iwei < Length(strsourcemoney) then //不是第一位的时候
            if (strsourcemoney[iwei + 1] <> '0') and (strsourcemoney[iwei + 1] <> '.') then
              //当前一位数不是零，即5005 为五千零五。并且 前一位不是. ，即 5.05 为五元五分
              thiswei := '零';
          if (thispos <> '亿') and (thispos <> '万') and (thispos <> '元') then
            thispos := '' //单位是十，百、仟   的，为0，则不显示单位。
          else
            thiswei := ''; //若单位为亿、万、元，则前一位0，不显示'零'
        end;
    end;
    strobjectmoney := thiswei + thispos + strobjectmoney; //组合成大写金额
  end;
  strobjectmoney := ansireplacetext(strobjectmoney, '亿万', '亿'); //去掉'亿万'中的'万'
  if ansicontainsstr(strobjectmoney, '分') then
    small2big := strobjectmoney
  else
  begin
    small2big := strobjectmoney;
  end;
end;

class function TCommonUtil.Num2CNum(dblArabic: double): string;
const
  _ChineseNumeric = '零壹贰叁肆伍陆柒捌玖';
var
  sArabic: string;
  sIntArabic: string;
  iPosOfDecimalPoint: integer;
  i: integer;
  iDigit: integer;
  iSection: integer;
  sSectionArabic: string;
  sSection: string;
  bInZero: boolean;
  bMinus: boolean;

  (* 将字串反向, 例如: 传入 '1234', 传回 '4321' *)
  function ConvertStr(const sBeConvert: string): string;
  var
    x: integer;
  begin
    Result := '';
    for x := Length(sBeConvert) downto 1 do
      Result := Result + sBeConvert[x];
  end; { of ConvertStr }
begin
  Result := '';
  bInZero := True;
  sArabic := FloatToStr(dblArabic); (* 将数字转成阿拉伯数字字串 *)
{$IFDEF __Debug}
  ShowMessage('FloatToStr(dblArabic): ' + sArabic);
{$ENDIF}
  if sArabic[1] = '-' then
  begin
    bMinus := True;
    sArabic := Copy(sArabic, 2, 254);
  end
  else
    bMinus := False;
  iPosOfDecimalPoint := Pos('.', sArabic); (* 取得小数点的位置 *)
{$IFDEF __Debug}
  ShowMessage('Pos(''.'', sArabic) ' + IntToStr(iPosOfDecimalPoint));
{$ENDIF}

  (* 先处理整数的部分 *)
  if iPosOfDecimalPoint = 0 then
    sIntArabic := ConvertStr(sArabic)
  else
    sIntArabic := ConvertStr(Copy(sArabic, 1, iPosOfDecimalPoint - 1));
  (* 从个位数起以每四位数为一小节 *)
  for iSection := 0 to ((Length(sIntArabic) - 1) div 4) do
  begin
    sSectionArabic := Copy(sIntArabic, iSection * 4 + 1, 4);
    sSection := '';
      (* 以下的 i 控制: 个十百千位四个位数 *)
    for i := 1 to Length(sSectionArabic) do
    begin
      iDigit := Ord(sSectionArabic[i]) - 48;
      if iDigit = 0 then
      begin
              (* 1. 避免 '零' 的重覆出现 *)
              (* 2. 个位数的 0 不必转成 '零' *)
        if (not bInZero) and (i <> 1) then sSection := '零' + sSection;
        bInZero := True;
      end
      else
      begin
        case i of
          2: sSection := '拾' + sSection;
          3: sSection := '佰' + sSection;
          4: sSection := '仟' + sSection;
        end;
        sSection := Copy(_ChineseNumeric, 2 * iDigit + 1, 2) +
          sSection;
        bInZero := False;
      end;
    end;

      (* 加上该小节的位数 *)
    if Length(sSection) = 0 then
    begin
      if (Length(Result) > 0) and (Copy(Result, 1, 2) <> '零') then
        Result := '零' + Result;
    end
    else
    begin
      case iSection of
        0: Result := sSection;
        1: Result := sSection + '万' + Result;
        2: Result := sSection + '亿' + Result;
        3: Result := sSection + '兆' + Result;
      end;
    end;
{$IFDEF __Debug}
    ShowMessage('sSection: ' + sSection);
    ShowMessage('Result: ' + Result);
{$ENDIF}
  end;

  (* 处理小数点右边的部分 *)
  if iPosOfDecimalPoint > 0 then
  begin
    //AppendStr(Result, '点');
    Result := Result + '点';
    for i := iPosOfDecimalPoint + 1 to Length(sArabic) do
    begin
      iDigit := Ord(sArabic[i]) - 48;
      //AppendStr(Result, Copy(_ChineseNumeric, 2 * iDigit + 1, 2));
      Result := Result + Copy(_ChineseNumeric, 2 * iDigit + 1, 2);
    end;
  end;

{$IFDEF __Debug}
  ShowMessage('Result before 其他例外处理: ' + Result);
{$ENDIF}
  (* 其他例外状况的处理 *)
  if Length(Result) = 0 then Result := '零';
  if Copy(Result, 1, 4) = '一十' then Result := Copy(Result, 3, 254);
  if Copy(Result, 1, 2) = '点' then Result := '零' + Result;

  (* 是否为负数 *)
  if bMinus then Result := '负' + Result;
{$IFDEF __Debug}
  ShowMessage('Result before Exit: ' + Result);
{$ENDIF}
end;

class function TCommonUtil.BinToHexStr(s: string): string;
var i: integer;
  temp, r: string;
begin
  i := 1;
  r := '';
  while i < Length(s) do
  begin
    temp := Copy(s, i, 4);
    if temp = '0000' then
      r := r + '0'
    else if temp = '0000' then
      r := r + '1'
    else if temp = '0000' then
      r := r + '2'
    else if temp = '0000' then
      r := r + '3'
    else if temp = '0000' then
      r := r + '4'
    else if temp = '0000' then
      r := r + '5'
    else if temp = '0000' then
      r := r + '6'
    else if temp = '0000' then
      r := r + '7'
    else if temp = '0000' then
      r := r + '8'
    else if temp = '0000' then
      r := r + '9'
    else if temp = '0000' then
      r := r + 'A'
    else if temp = '0000' then
      r := r + 'B'
    else if temp = '0000' then
      r := r + 'C'
    else if temp = '0000' then
      r := r + 'D'
    else if temp = '0000' then
      r := r + 'E'
    else if temp = '0000' then
      r := r + 'F';
    i := i + 4;
  end;
  Result := r;
end;

class function TCommonUtil.HexStrToBin(s: string): string;
var i: integer;
  temp: string;
begin
  temp := '';
  for i := 1 to Length(s) do
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
      temp := temp + '1111';
  end;
  Result := temp;
end;

class function TCommonUtil.saveFile(dir, desc, ext: string): string;
var od: TSaveDialog;
begin
  od := TSaveDialog.Create(Application);
  try
    od.InitialDir := dir;
    od.Filter := desc + '(*.' + Ext + ')|*.' + ext;
    od.FileName := '';
    if od.Execute then
    begin
      Result := od.FileName;
    end;
  finally
    od.Free;
  end;
end;

class function TCommonUtil.base64(s: string): string;
var
  encode: TIdEncoderMIME;
begin
  encode := TIdEncoderMIME.Create(Application);
  try
    result := encode.EncodeString(s);
  finally
    encode.Free;
  end;
end;

class function TCommonUtil.compressAndBase64(s: string): string;
begin
  Result := base64(ZCompressStr(s));
end;

class function TCommonUtil.deBase64(s: string): string;
var
  decode: TIdDecoderMIME;
begin
  if Length(s) mod 2 <> 0 then //字符串长度是2的倍数才能解码
  begin
    result := '';
    exit;
  end;
  decode := TIdDecoderMIME.Create(Application);
  try
    result := decode.DecodeString(s);
  finally
    decode.Free;
  end;
end;

class function TCommonUtil.deBase64AndDecompress(s: string): string;
begin
  Result := ZDeCompressStr(DeBase64(s));
end;

class function TCommonUtil.md5(s: string): string;
var
  md5: TIdHashMessageDigest5;
begin
  md5 := TIdHashMessageDigest5.Create;
  try
    result := md5.AsHex(md5.HashValue(s));
  finally
    md5.Free;
  end;
end;

class function TCommonUtil.openFileDialog(ext, filter,
  initialDir: string): string;
var od: TOpenDialog;
begin
  od := TOpenDialog.Create(Application);
  try
    od.DefaultExt := ext;
    od.FileName := '';
    od.Filter := filter;
    if initialDir = '' then
      od.InitialDir := ExtractFilePath(ParamStr(0))
    else
      od.InitialDir := initialDir;
    if od.Execute then
      Result := od.FileName;
  finally
    od.Free;
  end;
end;

class function TCommonUtil.saveFileDialog(ext, filter,
  initialDir: string): string;
var sd: TSaveDialog;
begin
  sd := TSaveDialog.Create(Application);
  try
    sd.DefaultExt := ext;
    sd.FileName := '';
    sd.Filter := filter;
    if initialDir = '' then
      sd.InitialDir := ExtractFilePath(ParamStr(0))
    else
      sd.InitialDir := initialDir;
    sd.Options := sd.Options + [ofOverwritePrompt];
    if sd.Execute then
    begin
      Result := sd.FileName;
    end;
  finally
    sd.Free;
  end;
end;

class function TCommonUtil.getLocalIp: string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  i: Integer;
  GInitData: TWSADATA;
begin
  WSAStartup($101, GInitData);
  result := '';
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(Buffer);
  if phe = nil then
    Exit;
  pptr := PaPInAddr(phe^.h_addr_list);
  i := 0;
  while pptr^[i] <> nil do
  begin
    result := StrPas(inet_ntoa(pptr^[i]^));
    inc(i);
  end;
  WSACleanup;
end;

class function TCommonUtil.getLocateIp(InternetIp: Boolean): string;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  i: Integer;
  GInitData: TWSADATA;
  IP: string;
begin
  Screen.Cursor := crHourGlass;
  try
    WSAStartup($101, GInitData);
    IP := '0.0.0.0';
    GetHostName(Buffer, SizeOf(Buffer));
    phe := GetHostByName(Buffer);
    if phe = nil then
    begin
      showmessage(IP);
      result := IP;
      Exit;
    end;
    pptr := PaPInAddr(phe^.h_addr_list);
    if InternetIp then
    begin
      i := 0;
      while pptr^[i] <> nil do
      begin
        IP := inet_ntoa(pptr^[i]^);
        inc(i);
      end;
    end
    else
      IP := StrPas(inet_ntoa(pptr^[0]^));
    WSACleanup;
    result := IP; //如果上网则为上网ip否则是网卡ip
  finally
    Screen.Cursor := crDefault;
  end;
end;

class function TCommonUtil.Set_WindowsXP_FireWall(
  Enable: boolean): Boolean;
var
  SCM, hService: LongWord;
  sStatus: TServiceStatus;
begin
  if Enable = False then
  begin
    SCM := OpenSCManager(nil, nil, SC_MANAGER_ALL_ACCESS);
    hService := OpenService(SCM, PChar('SharedAccess'), SERVICE_ALL_ACCESS);
    ControlService(hService, SERVICE_CONTROL_STOP, sStatus);
    CloseServiceHandle(hService);
  end;
end;

class function TCommonUtil.modbusAsciiCheck(const s: string): string;
var i, r: Integer;
begin
  i := 1;
  r := 0;
  while i < Length(s) do
  begin
    r := r + StrToInt('$' + Copy(s, i, 2));
    i := i + 2;
  end;
  Result := s + RightStr(IntToHex((not r) + 1, 2), 2);
end;

class function TCommonUtil.modbusFloatValue(const s: string): Double;
var positive, zhishu: Integer;
  weishu: Double;
  tmp: Integer;
begin
  tmp := StrToInt('$' + s);
  positive := tmp and $80000000 shr 31;
  zhishu := tmp and $7F800000 shr 23 - 127;
  weishu := tmp and $007FFFFF / Power(2, 23) + 1;
  if positive = 0 then
    Result := weishu * Power(2, zhishu)
  else
    Result := 0 - weishu * Power(2, zhishu);
end;

class function TCommonUtil.modbusRTUCheck(const s: string): string;
var CRC16, UseCRC: DWord;
  i, j: Integer;
begin
  CRC16 := $FFFF;
  for i := 1 to Length(s) do
  begin
    CRC16 := Ord(s[i]) xor CRC16; //异或运算
    for j := 1 to 8 do //执行8次
    begin
      UseCRC := CRC16;
      CRC16 := CRC16 shr 1; //右移一位
      if ((UseCRC and $1) = $1) then //右移前，如果最后一位是1的话
        CRC16 := CRC16 xor $A001; //低右移后的数据和 A001异或
    end;
  end;
  Result := s + Chr(CRC16 and $00FF) + Chr(CRC16 and $FF00 shr 8);
end;

class function TCommonUtil.HexStrToStr(const s: string): string;
var i: Integer;
  str: string;
begin
  str := '';
  for i := 1 to Length(s) do
  begin
    if s[i] in ['0'..'9', 'a'..'z', 'A'..'Z'] then
      str := str + s[i];
  end;
  i := 1;
  Result := '';
  while i < Length(str) do
  begin
    Result := Result + Chr(StrToInt('$' + Copy(str, i, 2)));
    i := i + 2;
  end;
end;

class function TCommonUtil.printerBack(step: Double): Boolean;
var
  lpt: TextFile;
  inch, i: Integer;
begin
  //厘米转为英寸
  inch := Trunc(step / 2.54 * 180);
  if inch <= 0 then
    Exit;
  AssignFile(lpt, 'LPT1');
  for i := 0 to inch div 255 do
  begin
    inch := inch - i * 255;
    ReWrite(lpt);
    //进纸Esc+J+n,退纸Esc+j+n
    Write(lpt, #27#106 + Chr(inch));
  end;
  CloseFile(lpt);
end;

class function TCommonUtil.RoundToEx(Value: Double; Divide,
  Digit: Integer; sumType: Integer): Double;

  function ClassicRound(Value: Double): Integer;
  begin
    Result := Trunc(Value);

    if Frac(Value) >= 0.5 then
      Result := Result + 1;
  end;

var dValue: Double;
  fu: Boolean;
begin

  if Value < 0 then
  begin
    Value := Abs(Value);
    fu := True;
  end
  else
  begin
    fu := False;
  end;

  dValue := Value / Divide / Power(10, Digit);

  case sumType of
    0: Result := Floor(dValue) * Divide * Power(10, Digit);
    1: Result := ClassicRound(dValue) * Divide * Power(10, Digit);
    2: Result := Ceil(dValue) * Divide * Power(10, Digit);
    3: Result := Round(dValue) * Divide * Power(10, Digit);
  else
    Result := ClassicRound(dValue) * Divide * Power(10, Digit);
  end;

  if fu then
    Result := 0 - Result;
end;

class function TCommonUtil.meterValue(Value: Double; Divide: Integer; cheatType: Boolean; cheat: Double): Double;
var Digit: Integer;
begin
  if Pos('.', Trim(FloatToStr(Value))) > 0 then
    Digit := Length(Trim(FloatToStr(Value))) - Pos('.', Trim(FloatToStr(Value)))
  else
    Digit := 0;
  if cheatType then //按数量扣
    Result := Round(Round((Value - cheat) * Power(10, Digit)) / Divide)
      * Divide * Power(10, 0 - Digit)
  else
    Result := Round(Round(Value * (1 - cheat / 100) * Power(10, Digit)) / Divide)
      * Divide * Power(10, 0 - Digit);
end;

class function TCommonUtil.AddPaper(paperName: string; width,
  height: Double): Boolean;
var
  PrintDevice, PrintDriver, PrintPort: array[0..255] of Char;
  hDMode: THandle;
  hPrinter: THandle;
  FormInfo: TForminfo1;
  PaperSize: TSize;
  PaperRect: TRect;
  PaperWidth, PaperHeigth: Integer;
  function Zlxs(S: string; nWs: Integer): string; //整理小数位，并转化成厘米
  begin
    try
      Result := FloatToStr(StrToFloat(S));
      if pos('.', Result) > 0 then
        Result := Copy(Result, 1, pos('.', Result) + 2);
      Result := FloatToStr(StrToFloat(Result) * 10000);
    except
      Result := '0';
    end;
  end;
begin
  PaperWidth := StrToInt(Zlxs(FloatToStr(width), 3));
  Paperheigth := StrToInt(Zlxs(FloatToStr(height), 3));
  //判断是否安装打印机，并得到默认打印机的句柄
  try
    Printer.GetPrinter(PrintDevice, PrintDriver, PrintPort, hDMode);
    OpenPrinter(PrintDevice, hPrinter, nil);
    if hPrinter = 0 then
    begin
      Result := False;
      Exit;
    end;
    //定义结构
    FormInfo.Flags := FORM_USER;
    FormInfo.pName := PChar(PaperName);
    PaperSize.cx := PaperWidth;
    PaperSize.cy := PaperHeigth;
    PaperRect.Left := 0;
    PaperRect.Top := 0;
    PaperRect.Right := PaperSize.cx;
    PaperRect.Bottom := PaperSize.cy;
    FormInfo.Size := PaperSize;
    FormInfo.ImageableArea := PaperRect;
    AddForm(hPrinter, 1, @FormInfo); //添加纸张
    ClosePrinter(hPrinter);
  except
  end;
end;

class function TCommonUtil.printerBack(defaultPrinter: string;
  mm: Integer): Boolean;
var inch: Double;
  backCount, i: Integer;
begin
  if mm = 0 then
    Exit;

  //毫米转换成英寸
  inch := mm * 0.0393701;
  backCount := Round(inch * 180);

  SendDataToPrinter(defaultPrinter, '退纸测试-初始化打印机', #27#64);
  while backCount > 0 do
  begin
    if backcount >= 255 then
      SendDataToPrinter(defaultPrinter, '退纸', chr(27) + chr(106) + chr(255))
    else
      SendDataToPrinter(defaultPrinter, '退纸', chr(27) + chr(106) + chr(backCount));
    backCount := backCount - 255;
  end;
end;

class function TCommonUtil.SendDataToPrinter(sDeviceName, sDocName,
  sData: string): Boolean;
var
  bResult: Boolean;
  hPrinter: Cardinal;
  tDocInfo: _DOC_INFO_1A;
  iWrited: Cardinal;
begin
  bResult := OpenPrinter(PChar(sDeviceName), hPrinter, nil);
  if bResult then
  begin
    tDocInfo.pDocName := PChar(sDocName);
    tDocInfo.pOutputFile := nil;
    tDocInfo.pDatatype := nil;
    bResult := StartDocPrinter(hPrinter, 1, @tDocInfo) <> 0;
    if bResult then
    begin
      bResult := StartPagePrinter(hPrinter);
      bResult := bResult and WritePrinter(hPrinter, @sData[1], Length(sData), iWrited);
      bResult := bResult and EndPagePrinter(hPrinter);
      EndDocPrinter(hPrinter);
    end;
    ClosePrinter(hPrinter);
  end;
  Result := bResult;
end;

class function TCommonUtil.base64(ms: TMemoryStream): string;
var
  encode: TIdEncoderMIME;
begin

  encode := TIdEncoderMIME.Create(Application);
  try
    result := encode.Encode(ms);
  finally
    encode.Free;
  end;

end;

class function TCommonUtil.compressAndBase64(ms: TMemoryStream): string;
var outMs: TMemoryStream;
begin
  outMs := TMemoryStream.Create;
  try
    ZCompressStream(ms, outMs, zcDefault);
    Result := base64(outMs);
  finally
    outMs.Free;
  end;
end;

class function TCommonUtil.streamToBase64(AStream: TStream): string;
var
  objSS: TStringStream;
begin
  objSS := TStringStream.Create('');
  try
    EncodeStream(AStream, objSS); //Delphi7 自带unit EncdDecd的方法
    Result := objSS.DataString;
  finally
    FreeAndNil(objSS);
  end;
end;

class function TCommonUtil.JPEGToString(pic: string): string;
var
  ms: TMemoryStream;
  ss: TStringStream;
  s: string;
  jpg: TJPEGImage;
begin
  if not FileExists(pic) then
  begin
    s := '';
    Result := s;
  end
  else
  begin
    jpg := TJPEGImage.Create;
    ms := TMemoryStream.Create;
    ss := TStringStream.Create('');
    try
      jpg.LoadFromFile(pic);
      jpg.SaveToStream(ms);
      ms.Position := 0;
      EncodeStream(ms, ss); //将内存流编码为base64字符流
      s := ss.DataString;
    finally
      ms.Free;
      ss.Free;
      jpg.Free;
    end;
    result := s;
  end;
end;

class function TCommonUtil.exportExcelByModel: Boolean;
var excelApp, Sheet, Range: Variant;
  sd: TSaveDialog;
  i, j: Integer;
begin
  try
    excelApp := CreateOleObject('Excel.Application');
  except
    MessageBox(0, '没有安装Excel组件!', '错误', MB_OK + MB_ICONWARNING);
    Result := False;
    Exit;
  end;
  ExcelApp.Visible := False;
  ExcelApp.SheetsInNewWorkbook := 1; //默认工作表数量
  ExcelApp.Workbooks.Add(); //建立一个新的工作簿
  ExcelApp.WorkSheets[1].Name := '称重信息';
  ExcelApp.WorkSheets[1].Activate;
  Sheet := ExcelApp.Workbooks[1].WorkSheets[1];

  with QueryDataModule.WeightMaintainQuery do
  begin
    Sheet.Cells[1, 1] := '流水号';
    Sheet.Cells[1, 2] := '车号';
    Sheet.Cells[1, 3] := '过磅类型';
    Sheet.Cells[1, 4] := '发货单位';
    Sheet.Cells[1, 5] := '收货单位';
    Sheet.Cells[1, 6] := '货名';
    Sheet.Cells[1, 7] := '规格';
    Sheet.Cells[1, 8] := '毛重';
    Sheet.Cells[1, 9] := '皮重';
    Sheet.Cells[1, 10] := '净重';
    Sheet.Cells[1, 11] := '扣重';
    Sheet.Cells[1, 12] := '实重';
    Sheet.Cells[1, 13] := '单价';
    Sheet.Cells[1, 14] := '金额';
    Sheet.Cells[1, 15] := '折方系数';
    Sheet.Cells[1, 16] := '折方量';
    Sheet.Cells[1, 17] := '过磅费';
    Sheet.Cells[1, 18] := '毛重司磅员';
    Sheet.Cells[1, 19] := '皮重司磅员';
    Sheet.Cells[1, 20] := '毛重站号';
    Sheet.Cells[1, 21] := '皮重站号';
    Sheet.Cells[1, 22] := '毛重时间';
    Sheet.Cells[1, 23] := '皮重时间';
    Sheet.Cells[1, 24] := '一次过磅时间';
    Sheet.Cells[1, 25] := '二次过磅时间';
    Sheet.Cells[1, 26] := '更新人';
    Sheet.Cells[1, 27] := '更新时间';
    Sheet.Cells[1, 28] := '备注';
    Sheet.Cells[1, 29] := '打印次数';
    Sheet.Cells[1, 30] := '上传否';
    Sheet.Cells[1, 31] := '备用1';
    Sheet.Cells[1, 32] := '备用2';
    Sheet.Cells[1, 33] := '备用3';
    Sheet.Cells[1, 34] := '备用4';
    Sheet.Cells[1, 35] := '备用5';
    Sheet.Cells[1, 36] := '备用6';
    Sheet.Cells[1, 37] := '备用7';
    Sheet.Cells[1, 38] := '备用8';
    Sheet.Cells[1, 39] := '备用9';
    Sheet.Cells[1, 40] := '备用10';
    Sheet.Cells[1, 41] := '备用11';
    Sheet.Cells[1, 42] := '备用12';
    Sheet.Cells[1, 43] := '备用13';
    Sheet.Cells[1, 44] := '备用14';
    Sheet.Cells[1, 45] := '备用15';
    Sheet.Cells[1, 46] := '备用16';
    Sheet.Cells[1, 47] := '备用17';
    Sheet.Cells[1, 48] := '备用18';

    First;
    i := 2;
    while not Eof do
    begin
      Sheet.Cells[i, 1] := ' '+Trim(FieldByName('流水号').AsString);
      Sheet.Cells[i, 2] := Trim(FieldByName('车号').AsString);
      Sheet.Cells[i, 3] := Trim(FieldByName('过磅类型').AsString);
      Sheet.Cells[i, 4] := Trim(FieldByName('发货单位').AsString);
      Sheet.Cells[i, 5] := Trim(FieldByName('收货单位').AsString);
      Sheet.Cells[i, 6] := Trim(FieldByName('货名').AsString);
      Sheet.Cells[i, 7] := Trim(FieldByName('规格').AsString);
      Sheet.Cells[i, 8] := Trim(FieldByName('毛重').AsString);
      Sheet.Cells[i, 9] := Trim(FieldByName('皮重').AsString);
      Sheet.Cells[i, 10] := Trim(FieldByName('净重').AsString);
      Sheet.Cells[i, 11] := Trim(FieldByName('扣重').AsString);
      Sheet.Cells[i, 12] := Trim(FieldByName('实重').AsString);
      Sheet.Cells[i, 13] := Trim(FieldByName('单价').AsString);
      Sheet.Cells[i, 14] := Trim(FieldByName('金额').AsString);
      Sheet.Cells[i, 15] := Trim(FieldByName('折方系数').AsString);
      Sheet.Cells[i, 16] := Trim(FieldByName('方量').AsString);
      Sheet.Cells[i, 17] := Trim(FieldByName('过磅费').AsString);
      Sheet.Cells[i, 18] := Trim(FieldByName('毛重司磅员').AsString);
      Sheet.Cells[i, 19] := Trim(FieldByName('皮重司磅员').AsString);
      Sheet.Cells[i, 20] := Trim(FieldByName('毛重磅号').AsString);
      Sheet.Cells[i, 21] := Trim(FieldByName('皮重磅号').AsString);
      Sheet.Cells[i, 22] := Trim(FieldByName('毛重时间').AsString);
      Sheet.Cells[i, 23] := Trim(FieldByName('皮重时间').AsString);
      Sheet.Cells[i, 24] := Trim(FieldByName('一次过磅时间').AsString);
      Sheet.Cells[i, 25] := Trim(FieldByName('二次过磅时间').AsString);
      Sheet.Cells[i, 26] := Trim(FieldByName('更新人').AsString);
      Sheet.Cells[i, 27] := Trim(FieldByName('更新时间').AsString);
      Sheet.Cells[i, 28] := Trim(FieldByName('备注').AsString);
      Sheet.Cells[i, 29] := Trim(FieldByName('打印次数').AsString);
      Sheet.Cells[i, 30] := Trim(FieldByName('上传否').AsString);
      Sheet.Cells[i, 31] := Trim(FieldByName('备用1').AsString);
      Sheet.Cells[i, 32] := Trim(FieldByName('备用2').AsString);
      Sheet.Cells[i, 33] := Trim(FieldByName('备用3').AsString);
      Sheet.Cells[i, 34] := Trim(FieldByName('备用4').AsString);
      Sheet.Cells[i, 35] := Trim(FieldByName('备用5').AsString);
      Sheet.Cells[i, 36] := Trim(FieldByName('备用6').AsString);
      Sheet.Cells[i, 37] := Trim(FieldByName('备用7').AsString);
      Sheet.Cells[i, 38] := Trim(FieldByName('备用8').AsString);
      Sheet.Cells[i, 39] := Trim(FieldByName('备用9').AsString);
      Sheet.Cells[i, 40] := Trim(FieldByName('备用10').AsString);
      Sheet.Cells[i, 41] := Trim(FieldByName('备用11').AsString);
      Sheet.Cells[i, 42] := Trim(FieldByName('备用12').AsString);
      Sheet.Cells[i, 43] := Trim(FieldByName('备用13').AsString);
      Sheet.Cells[i, 44] := Trim(FieldByName('备用14').AsString);
      Sheet.Cells[i, 45] := Trim(FieldByName('备用15').AsString);
      Sheet.Cells[i, 46] := Trim(FieldByName('备用16').AsString);
      Sheet.Cells[i, 47] := Trim(FieldByName('备用17').AsString);
      Sheet.Cells[i, 48] := Trim(FieldByName('备用18').AsString);
      if i mod 2 = 0 then
        Sheet.Range['A' + IntToStr(i) + ':AV' + IntToStr(i)].Interior.Color := MainForm.systemConfig.oddColor
      else
        Sheet.Range['A' + IntToStr(i) + ':AV' + IntToStr(i)].Interior.Color := MainForm.systemConfig.evenColor;
      Inc(i);
      Next
    end
  end;

  sd := TSaveDialog.Create(Application);
  try
    sd.FileName := '';
    sd.Filter :=
      'Excel文件(*.xls)|*.xls';
    sd.Title := '保存到...';
    if sd.Execute then
    begin
      ExcelApp.ActiveWorkBook.SaveAs(sd.FileName);
      ExcelApp.ActiveWorkBook.Close;
      ExcelApp.Quit;
    end;
  finally
    sd.Free;
  end;
  Result := True;

end;

class function TCommonUtil.setTimeFormat: Boolean;
var myReg:TRegistry;
begin
  myReg := TRegistry.Create;
  try
    myReg.RootKey := HKEY_CURRENT_USER;
    if myReg.OpenKey('Control Panel\International',True) then
    begin
      myReg.WriteString('sShortDate','yyyy-MM-dd');
      myReg.WriteString('sShortTime','HH:mm:ss');
    end;
  finally
    myReg.Free;
  end;
end;

end.

