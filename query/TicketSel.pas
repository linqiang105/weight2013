unit TicketSel;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls;

type
  TTicketSelForm = class(TForm)
    LBTicket: TListBox;
    procedure FormShow(Sender: TObject);
    procedure LBTicketDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listTicket();
  end;

var
  TicketSelForm: TTicketSelForm;

implementation

uses
  Main;

{$R *.dfm}

procedure TTicketSelForm.listTicket;
var
  sr: TSearchRec;
begin
  LBTicket.Items.Clear;
  if MainForm.systemConfig.ticketType = 1 then
  begin
    if FindFirst(ExtractFilePath(ParamStr(0)) + 'Ticket\*.fr3', faAnyFile, sr) = 0 then
    begin
      repeat
        if (sr.Attr and faDirectory) = 0 then
          LBTicket.Items.Add(Copy(sr.Name, 1, Length(sr.Name) - 4));
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    if FindFirst(ExtractFilePath(ParamStr(0)) + 'TicketII\*.rmf', faAnyFile, sr) = 0 then
    begin
      repeat
        if (sr.Attr and faDirectory) = 0 then
          LBTicket.Items.Add(Copy(sr.Name, 1, Length(sr.Name) - 4));
      until FindNext(sr) <> 0;
      FindClose(sr);
    end;
  end;
end;

procedure TTicketSelForm.FormShow(Sender: TObject);
begin
  LBTicket.ItemHeight := MainForm.systemConfig.ticketSelHeight;
  listTicket;
end;

procedure TTicketSelForm.LBTicketDblClick(Sender: TObject);
begin
  Close;
end;

end.

