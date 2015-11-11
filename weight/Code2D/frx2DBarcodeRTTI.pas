
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

unit frx2DBarcodeRTTI;

interface

{$I frx.inc}

implementation

uses
  Windows, Classes, SysUtils, Forms, fs_iinterpreter, frx2DBarcode, frxClassRTTI
{$IFDEF Delphi6}
, Variants
{$ENDIF};

type
  TFunctions = class(TfsRTTIModule)
  public
    constructor Create(AScript: TfsScript); override;
  end;

{ TFunctions }

constructor TFunctions.Create(AScript: TfsScript);
begin
  inherited Create(AScript);
  with AScript do
  begin
    AddClass(TfrxBarcode2DView, 'TfrxView');
  end;
end;

initialization
  fsRTTIModules.Add(TFunctions);
  
finalization
  if fsRTTIModules <> nil then
    fsRTTIModules.Remove(TFunctions);

end.
