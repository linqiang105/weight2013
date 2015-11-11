unit Print;

interface

uses
  Classes, Controls, Forms, StdCtrls, Buttons;

type
  TPreviewSetForm = class(TForm)
    EdtGlideNo: TEdit;
    BitBtnPreview: TBitBtn;
    BitBtnPrint: TBitBtn;
    BitBtnMod: TBitBtn;
    BitBtn4: TBitBtn;
    Label1: TLabel;
    procedure BitBtnPreviewClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtnModClick(Sender: TObject);
    procedure BitBtnPrintClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PreviewSetForm: TPreviewSetForm;

implementation

uses Main, ReportUtil;

{$R *.dfm}

procedure TPreviewSetForm.BitBtnPreviewClick(Sender: TObject);
begin
  TReportUtil.printTicket(EdtGlideNo.Text, True, MainForm.systemConfig.ticketType);
end;

procedure TPreviewSetForm.BitBtn4Click(Sender: TObject);
begin
  Close
end;

procedure TPreviewSetForm.BitBtnModClick(Sender: TObject);
begin
  if MainForm.systemConfig.ticketType = 1 then
    TReportUtil.designTicket(MainForm.systemConfig.ticketFormat, 1)
  else if MainForm.systemConfig.ticketType = 2 then
    TReportUtil.designTicket(MainForm.systemConfig.ticketFormat2, 2)
end;

procedure TPreviewSetForm.BitBtnPrintClick(Sender: TObject);
begin
  TReportUtil.printTicket(EdtGlideNo.Text, False, MainForm.systemConfig.ticketType);
end;

end.

