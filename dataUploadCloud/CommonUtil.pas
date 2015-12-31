unit CommonUtil;

interface

uses 
  
  IdCoder, IdCoderMIME, IdHashMessageDigest, 
  ZLibEx;

type

  TCommonUtil = class
  private
  public
    //编码
    class function md5(s: string): string;
    class function base64(s: string): string;
    class function deBase64(s: string): string;
    class function compressAndBase64(s: string): string;
    class function deBase64AndDecompress(s: string): string;
  end;

implementation

class function TCommonUtil.base64(s: string): string;
var
  encode: TIdEncoderMIME;
begin
  encode := TIdEncoderMIME.Create(nil);
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
  decode := TIdDecoderMIME.Create(nil);
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

end.

