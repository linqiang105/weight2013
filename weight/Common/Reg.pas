unit Reg;

interface

uses Windows, SysUtils, IdHashMessageDigest, IdHash, StrUtils;

function GetNewEncodeKey: string;
function RegisterCode(str: string): string;

implementation

type
  TKeyByte = array[0..5] of Byte;
  TDesMode = (dmEncry, dmDecry);

var
  subKey: array[0..15] of TKeyByte;

const
  BitIP: array[0..63] of Byte = //初始值置IP
  (57, 49, 41, 33, 25, 17, 9, 1,
    59, 51, 43, 35, 27, 19, 11, 3,
    61, 53, 45, 37, 29, 21, 13, 5,
    63, 55, 47, 39, 31, 23, 15, 7,
    56, 48, 40, 32, 24, 16, 8, 0,
    58, 50, 42, 34, 26, 18, 10, 2,
    60, 52, 44, 36, 28, 20, 12, 4,
    62, 54, 46, 38, 30, 22, 14, 6);

  BitCP: array[0..63] of Byte = //逆初始置IP-1
  (39, 7, 47, 15, 55, 23, 63, 31,
    38, 6, 46, 14, 54, 22, 62, 30,
    37, 5, 45, 13, 53, 21, 61, 29,
    36, 4, 44, 12, 52, 20, 60, 28,
    35, 3, 43, 11, 51, 19, 59, 27,
    34, 2, 42, 10, 50, 18, 58, 26,
    33, 1, 41, 9, 49, 17, 57, 25,
    32, 0, 40, 8, 48, 16, 56, 24);

  BitExp: array[0..47] of Integer = // 位选择函数E
  (31, 0, 1, 2, 3, 4, 3, 4, 5, 6, 7, 8, 7, 8, 9, 10,
    11, 12, 11, 12, 13, 14, 15, 16, 15, 16, 17, 18, 19, 20, 19, 20,
    21, 22, 23, 24, 23, 24, 25, 26, 27, 28, 27, 28, 29, 30, 31, 0);

  BitPM: array[0..31] of Byte = //置换函数P
  (15, 6, 19, 20, 28, 11, 27, 16, 0, 14, 22, 25, 4, 17, 30, 9,
    1, 7, 23, 13, 31, 26, 2, 8, 18, 12, 29, 5, 21, 10, 3, 24);

  sBox: array[0..7] of array[0..63] of Byte = //S盒
  ((14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7,
    0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8,
    4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0,
    15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13),

    (15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10,
    3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5,
    0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15,
    13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9),

    (10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8,
    13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1,
    13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7,
    1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12),

    (7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 12, 4, 15,
    13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9,
    10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4,
    3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14),

    (2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9,
    14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6,
    4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14,
    11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3),

    (12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11,
    10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8,
    9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6,
    4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13),

    (4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1,
    13, 0, 11, 7, 4, 9, 1, 10, 14, 3, 5, 12, 2, 15, 8, 6,
    1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2,
    6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12),

    (13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7,
    1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2,
    7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8,
    2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11));

  BitPMC1: array[0..55] of Byte = //选择置换PC-1
  (56, 48, 40, 32, 24, 16, 8,
    0, 57, 49, 41, 33, 25, 17,
    9, 1, 58, 50, 42, 34, 26,
    18, 10, 2, 59, 51, 43, 35,
    62, 54, 46, 38, 30, 22, 14,
    6, 61, 53, 45, 37, 29, 21,
    13, 5, 60, 52, 44, 36, 28,
    20, 12, 4, 27, 19, 11, 3);

  BitPMC2: array[0..47] of Byte = //选择置换PC-2
  (13, 16, 10, 23, 0, 4,
    2, 27, 14, 5, 20, 9,
    22, 18, 11, 3, 25, 7,
    15, 6, 26, 19, 12, 1,
    40, 51, 30, 36, 46, 54,
    29, 39, 50, 44, 32, 47,
    43, 48, 38, 55, 33, 52,
    45, 41, 49, 35, 28, 31);

  key: array[0..15, 0..15] of byte = (($60, $90, $1F, $A7, $50, $C0, $AE,
    $0A, $EB, $B4, $36, $A8, $B6, $C4, $6E, $E2), ($1E, $D0, $F0, $FE, $B3, $09,
    $FB, $FC, $35, $0B, $99, $C3, $37, $B5, $89, $A5),
    ($F1, $61, $1D, $08, $F3, $51, $34, $BE, $C1, $5D, $EC, $0C, $88, $6D, $38,
    $6F), ($A0, $07, $AD, $F4, $1C, $7A, $97, $5E, $40, $CF, $49, $FA, $5B, $0D,
    $70, $8A), ($B2, $E7, $BD, $06, $D1, $33, $1B, $79, $A6, $98, $5C, $87, $9A,
    $39, $5A, $0E), ($20, $C7, $62, $7B, $52, $05, $5F, $41, $1A, $48, $C2, $4A,
    $6C, $0F, $8B, $71), ($9F, $7C, $21, $96, $32, $FD, $53, $04, $78, $86, $19,
    $9B, $3A, $4B, $59, $E1), ($BC, $AC, $F2, $63, $22, $84, $42, $85, $47, $03,
    $3B, $6B, $18, $ED, $72, $8C), ($7D, $D2, $C5, $83, $43, $31, $23, $54, $3C,
    $F5, $25, $02, $73, $8D, $17, $A4), ($B1, $C6, $44, $95, $64, $4C, $3D, $77,
    $24, $55, $6A, $74, $16, $01, $F8, $B7), ($9E, $7E, $82, $FF, $3E, $D9, $30,
    $46, $CE, $EF, $15, $26, $8E, $58, $92, $00), ($E6, $2F, $3F, $B0, $45, $65,
    $94, $76, $14, $69, $56, $E3, $BF, $27, $CD, $AF),
    ($7F, $81, $4D, $2E, $E8, $E5, $13, $EE, $93, $4F, $75, $8F, $57, $B8, $F7,
    $28), ($A1, $D4, $AA, $C8, $12, $2D, $66, $BA, $68, $CB, $E4, $DC, $CC, $29,
    $DE, $E0), ($80, $D3, $11, $BB, $9C, $D6, $DA, $2C, $E9, $DB, $B9, $2A, $F6,
    $CA, $F9, $A3), ($10, $D5, $9D, $D8, $D7, $AB, $4E, $67, $C9, $2B, $A2, $EA,
    $A9, $DD, $DF, $91));

procedure initPermutation(var inData: array of Byte);
var
  newData: array[0..7] of Byte;
  i: Integer;
begin
  FillChar(newData, 8, 0);
  for i := 0 to 63 do
    if (inData[BitIP[i] shr 3] and (1 shl (7 - (BitIP[i] and $07)))) <> 0 then
      newData[i shr 3] := newData[i shr 3] or (1 shl (7 - (i and $07)));
  for i := 0 to 7 do
    inData[i] := newData[i];
end;

procedure conversePermutation(var inData: array of Byte);
var
  newData: array[0..7] of Byte;
  i: Integer;
begin
  FillChar(newData, 8, 0);
  for i := 0 to 63 do
    if (inData[BitCP[i] shr 3] and (1 shl (7 - (BitCP[i] and $07)))) <> 0 then
      newData[i shr 3] := newData[i shr 3] or (1 shl (7 - (i and $07)));
  for i := 0 to 7 do
    inData[i] := newData[i];
end;

procedure expand(inData: array of Byte; var outData: array of Byte);
var
  i: Integer;
begin
  FillChar(outData, 6, 0);
  for i := 0 to 47 do
    if (inData[BitExp[i] shr 3] and (1 shl (7 - (BitExp[i] and $07)))) <> 0 then
      outData[i shr 3] := outData[i shr 3] or (1 shl (7 - (i and $07)));
end;

procedure permutation(var inData: array of Byte);
var
  newData: array[0..3] of Byte;
  i: Integer;
begin
  FillChar(newData, 4, 0);
  for i := 0 to 31 do
    if (inData[BitPM[i] shr 3] and (1 shl (7 - (BitPM[i] and $07)))) <> 0 then
      newData[i shr 3] := newData[i shr 3] or (1 shl (7 - (i and $07)));
  for i := 0 to 3 do
    inData[i] := newData[i];
end;

function si(s, inByte: Byte): Byte;
var
  c: Byte;
begin
  c := (inByte and $20) or ((inByte and $1E) shr 1) or
    ((inByte and $01) shl 4);
  Result := (sBox[s][c] and $0F);
end;

procedure permutationChoose1(inData: array of Byte;
  var outData: array of Byte);
var
  i: Integer;
begin
  FillChar(outData, 7, 0);
  for i := 0 to 55 do
    if (inData[BitPMC1[i] shr 3] and (1 shl (7 - (BitPMC1[i] and $07)))) <> 0 then
      outData[i shr 3] := outData[i shr 3] or (1 shl (7 - (i and $07)));
end;

procedure permutationChoose2(inData: array of Byte;
  var outData: array of Byte);
var
  i: Integer;
begin
  FillChar(outData, 6, 0);
  for i := 0 to 47 do
    if (inData[BitPMC2[i] shr 3] and (1 shl (7 - (BitPMC2[i] and $07)))) <> 0 then
      outData[i shr 3] := outData[i shr 3] or (1 shl (7 - (i and $07)));
end;

procedure cycleMove(var inData: array of Byte; bitMove: Byte);
var
  i: Integer;
begin
  for i := 0 to bitMove - 1 do
  begin
    inData[0] := (inData[0] shl 1) or (inData[1] shr 7);
    inData[1] := (inData[1] shl 1) or (inData[2] shr 7);
    inData[2] := (inData[2] shl 1) or (inData[3] shr 7);
    inData[3] := (inData[3] shl 1) or ((inData[0] and $10) shr 4);
    inData[0] := (inData[0] and $0F);
  end;
end;

procedure makeKey(inKey: array of Byte; var outKey: array of TKeyByte);
const
  bitDisplace: array[0..15] of Byte =
  (1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1);
var
  outData56: array[0..6] of Byte;
  key28l: array[0..3] of Byte;
  key28r: array[0..3] of Byte;
  key56o: array[0..6] of Byte;
  i: Integer;
begin
  permutationChoose1(inKey, outData56);

  key28l[0] := outData56[0] shr 4;
  key28l[1] := (outData56[0] shl 4) or (outData56[1] shr 4);
  key28l[2] := (outData56[1] shl 4) or (outData56[2] shr 4);
  key28l[3] := (outData56[2] shl 4) or (outData56[3] shr 4);
  key28r[0] := outData56[3] and $0F;
  key28r[1] := outData56[4];
  key28r[2] := outData56[5];
  key28r[3] := outData56[6];

  for i := 0 to 15 do
  begin
    cycleMove(key28l, bitDisplace[i]);
    cycleMove(key28r, bitDisplace[i]);
    key56o[0] := (key28l[0] shl 4) or (key28l[1] shr 4);
    key56o[1] := (key28l[1] shl 4) or (key28l[2] shr 4);
    key56o[2] := (key28l[2] shl 4) or (key28l[3] shr 4);
    key56o[3] := (key28l[3] shl 4) or (key28r[0]);
    key56o[4] := key28r[1];
    key56o[5] := key28r[2];
    key56o[6] := key28r[3];
    permutationChoose2(key56o, outKey[i]);
  end;
end;

procedure encry(inData, subKey: array of Byte;
  var outData: array of Byte);
var
  outBuf: array[0..5] of Byte;
  buf: array[0..7] of Byte;
  i: Integer;
begin
  expand(inData, outBuf);
  for i := 0 to 5 do
    outBuf[i] := outBuf[i] xor subKey[i];
  buf[0] := outBuf[0] shr 2;
  buf[1] := ((outBuf[0] and $03) shl 4) or (outBuf[1] shr 4);
  buf[2] := ((outBuf[1] and $0F) shl 2) or (outBuf[2] shr 6);
  buf[3] := outBuf[2] and $3F;
  buf[4] := outBuf[3] shr 2;
  buf[5] := ((outBuf[3] and $03) shl 4) or (outBuf[4] shr 4);
  buf[6] := ((outBuf[4] and $0F) shl 2) or (outBuf[5] shr 6);
  buf[7] := outBuf[5] and $3F;
  for i := 0 to 7 do
    buf[i] := si(i, buf[i]);
  for i := 0 to 3 do
    outBuf[i] := (buf[i * 2] shl 4) or buf[i * 2 + 1];
  permutation(outBuf);
  for i := 0 to 3 do
    outData[i] := outBuf[i];
end;

procedure desData(desMode: TDesMode;
  inData: array of Byte; var outData: array of Byte);
// inData, outData 都为8Bytes，否则出错
var
  i, j: Integer;
  temp, buf: array[0..3] of Byte;
begin
  for i := 0 to 7 do
    outData[i] := inData[i];
  initPermutation(outData);
  if desMode = dmEncry then
  begin
    for i := 0 to 15 do
    begin
      for j := 0 to 3 do
        temp[j] := outData[j]; //temp = Ln
      for j := 0 to 3 do
        outData[j] := outData[j + 4]; //Ln+1 = Rn
      encry(outData, subKey[i], buf); //Rn ==Kn==> buf
      for j := 0 to 3 do
        outData[j + 4] := temp[j] xor buf[j]; //Rn+1 = Ln^buf
    end;

    for j := 0 to 3 do
      temp[j] := outData[j + 4];
    for j := 0 to 3 do
      outData[j + 4] := outData[j];
    for j := 0 to 3 do
      outData[j] := temp[j];
  end
  else if desMode = dmDecry then
  begin
    for i := 15 downto 0 do
    begin
      for j := 0 to 3 do
        temp[j] := outData[j];
      for j := 0 to 3 do
        outData[j] := outData[j + 4];
      encry(outData, subKey[i], buf);
      for j := 0 to 3 do
        outData[j + 4] := temp[j] xor buf[j];
    end;
    for j := 0 to 3 do
      temp[j] := outData[j + 4];
    for j := 0 to 3 do
      outData[j + 4] := outData[j];
    for j := 0 to 3 do
      outData[j] := temp[j];
  end;
  conversePermutation(outData);
end;

//////////////////////////////////////////////////////////////

function EncryStr(Str, Key: string): string;
var
  StrByte, OutByte, KeyByte: array[0..7] of Byte;
  StrResult: string;
  i, j: Integer;
begin
  if (Length(Str) > 0) and (Ord(Str[Length(Str)]) = 0) then
    raise Exception.Create('Error: the last char is NULL char.');
  if Length(Key) < 8 then
    while Length(Key) < 8 do
      Key := Key + Chr(0);
  while Length(Str) mod 8 <> 0 do
    Str := Str + Chr(0);

  for j := 0 to 7 do
    KeyByte[j] := Ord(Key[j + 1]);
  makeKey(KeyByte, subKey);

  StrResult := '';

  for i := 0 to Length(Str) div 8 - 1 do
  begin
    for j := 0 to 7 do
      StrByte[j] := Ord(Str[i * 8 + j + 1]);
    desData(dmEncry, StrByte, OutByte);
    for j := 0 to 7 do
      StrResult := StrResult + Chr(OutByte[j]);
  end;

  Result := StrResult;
end;

function DecryStr(Str, Key: string): string;
var
  StrByte, OutByte, KeyByte: array[0..7] of Byte;
  StrResult: string;
  i, j: Integer;
begin
  if Length(Key) < 8 then
    while Length(Key) < 8 do
      Key := Key + Chr(0);

  for j := 0 to 7 do
    KeyByte[j] := Ord(Key[j + 1]);
  makeKey(KeyByte, subKey);

  StrResult := '';

  for i := 0 to Length(Str) div 8 - 1 do
  begin
    for j := 0 to 7 do
      StrByte[j] := Ord(Str[i * 8 + j + 1]);
    desData(dmDecry, StrByte, OutByte);
    for j := 0 to 7 do
      StrResult := StrResult + Chr(OutByte[j]);
  end;
  while (Length(StrResult) > 0) and
    (Ord(StrResult[Length(StrResult)]) = 0) do
    Delete(StrResult, Length(StrResult), 1);
  Result := StrResult;
end;

///////////////////////////////////////////////////////////

function EncryStrHex(Str, Key: string): string;
var
  StrResult, TempResult, temp: string;
  i: Integer;
begin
  TempResult := EncryStr(Str, Key);
  StrResult := '';
  for i := 0 to Length(TempResult) - 1 do
  begin
    temp := Format('%x', [Ord(TempResult[i + 1])]);
    if Length(temp) = 1 then
      temp := '0' + temp;
    StrResult := StrResult + temp;
  end;
  Result := StrResult;
end;

function DecryStrHex(StrHex, Key: string): string;
  function HexToInt(Hex: string): Integer;
  var
    i, Res: Integer;
    ch: Char;
  begin
    Res := 0;
    for i := 0 to Length(Hex) - 1 do
    begin
      ch := Hex[i + 1];
      if (ch >= '0') and (ch <= '9') then
        Res := Res * 16 + Ord(ch) - Ord('0')
      else if (ch >= 'A') and (ch <= 'F') then
        Res := Res * 16 + Ord(ch) - Ord('A') + 10
      else if (ch >= 'a') and (ch <= 'f') then
        Res := Res * 16 + Ord(ch) - Ord('a') + 10
      else
        raise Exception.Create('Error: not a Hex String');
    end;
    Result := Res;
  end;

var
  Str, temp: string;
  i: Integer;
begin
  Str := '';
  for i := 0 to Length(StrHex) div 2 - 1 do
  begin
    temp := Copy(StrHex, i * 2 + 1, 2);
    Str := Str + Chr(HexToInt(temp));
  end;
  Result := DecryStr(Str, Key);
end;

function MD5(str: string): string;
var
  md5: TIdHashMessageDigest5;
  longWordRec: T4x4LongWordRecord;
begin
  md5 := TIdHashMessageDigest5.Create;
  longWordRec := md5.HashValue(str);
  Result := md5.AsHex(longWordRec);
end;

function GetCPUInfo(InfoID: Byte): string; //获取CPU信息
var
  _eax, _ebx, _ecx, _edx: Longword;
  i: Integer;
  b: Byte;
  s, s1, s2, s3, s_all: string;
begin
  case InfoID of //获取CPU序列号
    1:
      begin
        asm
    mov eax,1
    db $0F,$A2
    mov _eax,eax
    mov _ebx,ebx
    mov _ecx,ecx
    mov _edx,edx
        end;
        s := IntToHex(_eax, 8);
        s1 := IntToHex(_edx, 8);
        s2 := IntToHex(_ecx, 8);
        Insert('-', s, 5);
        Insert('-', s1, 5);
        Insert('-', s2, 5);
        Result := s + '-' + s1 + '-' + s2;
      end;
    2: //获取 CPU 频率
      begin
        asm     //execute the extended CPUID inst.
    mov eax,$80000000   //sub. func call
    db $0F,$A2
    mov _eax,eax
        end;
        if _eax > $80000000 then //any other sub. funct avail. ?
        begin
          asm     //get brand ID
      mov eax,$80000002
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
          end;
          s := '';
          s1 := '';
          s2 := '';
          s3 := '';
          for i := 0 to 3 do
          begin
            b := lo(_eax);
            s3 := s3 + chr(b);
            b := lo(_ebx);
            s := s + chr(b);
            b := lo(_ecx);
            s1 := s1 + chr(b);
            b := lo(_edx);
            s2 := s2 + chr(b);
            _eax := _eax shr 8;
            _ebx := _ebx shr 8;
            _ecx := _ecx shr 8;
            _edx := _edx shr 8;
          end;
          s_all := trim(s3 + s + s1 + s2);
          asm
      mov eax,$80000003
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
    mov _edx,edx
          end;
          s := '';
          s1 := '';
          s2 := '';
          s3 := '';
          for i := 0 to 3 do
          begin
            b := lo(_eax);
            s3 := s3 + chr(b);
            b := lo(_ebx);
            s := s + chr(b);
            b := lo(_ecx);
            s1 := s1 + chr(b);
            b := lo(_edx);
            s2 := s2 + chr(b);
            _eax := _eax shr 8;
            _ebx := _ebx shr 8;
            _ecx := _ecx shr 8;
            _edx := _edx shr 8;
          end;
          s_all := s_all + s3 + s + s1 + s2;
          asm
      mov eax,$80000004
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
          end;
          s := '';
          s1 := '';
          s2 := '';
          s3 := '';
          for i := 0 to 3 do
          begin
            b := lo(_eax);
            s3 := s3 + chr(b);
            b := lo(_ebx);
            s := s + chr(b);
            b := lo(_ecx);
            s1 := s1 + chr(b);
            b := lo(_edx);
            s2 := s2 + chr(b);
            _eax := _eax shr 8;
            _ebx := _ebx shr 8;
            _ecx := _ecx shr 8;
            _edx := _edx shr 8;
          end;
          if s2[length(s2)] = #0 then
            setlength(s2, length(s2) - 1);
          Result := s_all + s3 + s + s1 + s2;
        end
        else
          Result := '';
      end;
  end;
end;

function GetVolumeSerialNo(pDriveLetter: char): string; //获取磁盘序列号
var
  dw: Dword;
  mc, fl: Dword;
begin
  result := '';
  if trim(pDriveLetter) = '' then
    Exit;
  pDriveLetter := UpCase(pDriveLetter);
  GetVolumeInformation(pchar(pDriveLetter + ':\'), nil, 0, @dw, mc, fl, nil, 0);
  result := IntToHex(dw, 8);
end;

// MODBUS校验

function ModBusCheck(s: string): string;
var
  CRC16, UseCRC: DWord;
  i, j: Integer;
  Data: array[0..200] of Integer;
//  TempCRC: string;
begin
  CRC16 := $FFFF;
  for i := 0 to Length(s) div 2 - 1 do
  begin
    Data[i] := StrToInt('$' + Copy(s, i * 2 + 1, 2));
    CRC16 := Data[i] xor CRC16; // 异或运算
    for j := 1 to 8 do // 执行8次
    begin
      UseCRC := CRC16;
      CRC16 := CRC16 shr 1; // 右移一位
      if ((UseCRC and $1) = $1) then // 右移前，如果最后一位是1的话
        CRC16 := CRC16 xor $A001; // 低右移后的数据和 A001异或
    end;
  end;
  result := Copy(IntToHex(CRC16, 4), 3, 2) + Copy(IntToHex(CRC16, 4), 1, 2);
end;

function GetNewEncodeKey: string;
var s: string;
begin
  //利用CPU ID加上C盘的序列号，和成的号码用DES加密后，再用MD5加密，取前16位
  s := LeftStr(MD5(EncryStrHex(GetCPUInfo(1) + '-' + GetVolumeSerialNo('C'), 'kjhq')), 16);
  s := s + ModBusCheck(s);
  Result := Copy(s, 1, 4) + '-' + Copy(s, 5, 4) + '-' + Copy(s, 9, 4) + '-' + Copy(s, 13, 4)
    + '-' + Copy(s, 17, 4);
  //Result := '0B5B-4530-9540-DD84-D0C7';
end;

function RegisterCode(str: string): string;
var
  code, code2, companyCode, cc, ccPre, ccLast: string;
  i: Integer;
  keyNum: array of Integer;
begin
  code := str;
  code2 := '';
  // 先去空格
  for i := 1 to Length(code) do
  begin
    if code[i] in ['0'..'9', 'A'..'F'] then
      code2 := code2 + code[i];
  end;
  code2 := LeftStr(code2, 16);
  //厂商编码
  companyCode := '0000';
  cc := '';
  // 先去空格
  for i := 1 to Length(companyCode) do
  begin
    if companyCode[i] in ['0'..'9', 'A'..'F'] then
      cc := cc + companyCode[i];
  end;
  // 最前与最后的两位与厂商编码异或
  ccPre := IntToHex(StrToInt('$' + code2[1] + code2[2])
    xor StrToInt('$' + cc[1] + cc[2]), 2);
  ccLast := IntToHex(StrToInt('$' + code2[Length(code2) - 1] +
    code2[Length(code2)]) xor StrToInt('$' + cc[3] + cc[4]), 2);
  code2 := ccPre + Copy(code2, 3, Length(code2) - 4) + ccLast;
  // 交换顺序
  code := '';
  i := 1;
  while i < Length(code2) div 2 do
  begin
    code := code + code2[i] + code2[i + 8];
    inc(i, 2);
  end;
  i := 2;
  while i <= Length(code2) div 2 do
  begin
    code := code + code2[i] + code2[i + 8];
    inc(i, 2);
  end;
  // 查找密码表
  setLength(keyNum, Length(code));
  for i := 1 to Length(code) do
  begin
    keyNum[i - 1] := StrToInt('$' + code[i]);
  end;
  i := 0;
  code := '';
  while i < Length(keyNum) do
  begin
    code := code + IntToHex(key[keyNum[i]][keyNum[i + 1]], 2);
    inc(i, 2);
  end;
  code := code + ModBusCheck(code);
  Result := Copy(code, 1, 4) + '-' + Copy(code, 5, 4) + '-' + Copy(code, 9, 4) + '-'
    + Copy(code, 13, 4) + '-' + Copy(code, 17, 4);
end;

end.

