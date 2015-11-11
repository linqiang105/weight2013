unit ScanTicket;

interface

uses
  Classes, Controls, Forms, StdCtrls, Buttons;

type
  TScanTicketForm = class(TForm)
    EdtGlideNo: TEdit;
    BitBtnPreview: TBitBtn;
    BitBtnCancel: TBitBtn;
    procedure BitBtnPreviewClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ScanTicketForm: TScanTicketForm;

implementation

uses Main, ReportUtil;

{$R *.dfm}

procedure TScanTicketForm.BitBtnPreviewClick(Sender: TObject);
begin
  TReportUtil.printTicket(EdtGlideNo.Text, True, MainForm.systemConfig.ticketType);
  
  EdtGlideNo.Clear;
end;

procedure TScanTicketForm.BitBtnCancelClick(Sender: TObject);
begin
  Close
end;

procedure TScanTicketForm.FormShow(Sender: TObject);
begin
  EdtGlideNo.Clear;
  EdtGlideNo.SetFocus;
end;

end.

