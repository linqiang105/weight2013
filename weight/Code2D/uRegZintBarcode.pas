unit uRegZintBarcode;

interface

uses
  Classes,
  uZintBarcode;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('System', [TZintBarcodeComponent]); 
end;

end.
