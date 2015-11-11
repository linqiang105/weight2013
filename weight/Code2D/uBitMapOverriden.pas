unit uBitMapOverriden;

interface

uses Graphics;

type
  TBitmap = class(graphics.TBitmap)
    procedure SetSize(W,H: Integer);
  end;

implementation

{ TBitmap }

procedure TBitmap.SetSize;
begin
  Self.Width := W;
  Self.Height:= H;
end;

end.
