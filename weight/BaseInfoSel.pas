unit BaseInfoSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TBaseInfoSelForm = class(TForm)
    LBBaseInfo: TListBox;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaseInfoSelForm: TBaseInfoSelForm;

implementation

{$R *.dfm}

end.
