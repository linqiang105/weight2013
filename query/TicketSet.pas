unit TicketSet;

interface

uses
  SysUtils, Classes, Controls, Forms, ShellAPI, IniFiles,
  ExtCtrls, frxClass, frxPreview, StdCtrls, Menus, RzButton,
  RM_Preview, RM_Common;

type
  TTicketSetForm = class(TForm)
    frxPreview1: TfrxPreview;
    LBTicket: TListBox;
    PMModify: TPopupMenu;
    NModifyTicket: TMenuItem;
    NSetDefault: TMenuItem;
    PTool: TPanel;
    NOpenDir: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtnSetDefault: TRzBitBtn;
    BitBtnModifyTicket: TRzBitBtn;
    lblTicket: TEdit;
    RMPreview1: TRMPreview;
    procedure FormShow(Sender: TObject);
    procedure LBTicketClick(Sender: TObject);
    procedure NModifyTicketClick(Sender: TObject);
    procedure NOpenDirClick(Sender: TObject);
    procedure BitBtnSetDefaultClick(Sender: TObject);
    procedure BitBtnModifyTicketClick(Sender: TObject);
    procedure NSetDefaultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listTicket(ticketType: Integer = 1);
    procedure setDefaultTicket();
    procedure modifyTicket();
  end;

var
  TicketSetForm: TTicketSetForm;

implementation

uses
  QueryDM, Main, WeightUtil, ReportUtil;

{$R *.dfm}

procedure TTicketSetForm.FormShow(Sender: TObject);
begin
  listTicket(MainForm.systemConfig.ticketType);

  QueryDataModule.frxReport1.Preview := frxPreview1;
  frxPreview1.PopupMenu := PMModify;
  QueryDataModule.RMGridReport1.Preview := RMPreview1;
  RMPreview1.PopupMenu := PMModify;

  if MainForm.systemConfig.ticketType = 1 then
  begin
    frxPreview1.Align := alClient;
    RMPreview1.Visible := False;
    lblTicket.Text := MainForm.systemConfig.ticketFormat;
  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    frxPreview1.Visible := False;
    RMPreview1.Align := alClient;
    lblTicket.Text := MainForm.systemConfig.ticketFormat2;
  end;

  LBTicket.PopupMenu := PMModify;
end;

procedure TTicketSetForm.listTicket(ticketType: Integer);
var
  sr: TSearchRec;
begin
  LBTicket.Items.Clear;
  if ticketType = 1 then
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
  else if ticketType = 2 then
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

procedure TTicketSetForm.LBTicketClick(Sender: TObject);
begin
  TWeightUtil.getFirstRecord();
  if MainForm.systemConfig.ticketType = 1 then
  begin
    QueryDataModule.frxReport1.LoadFromFile(ExtractFilePath(ParamStr(0))
      + 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3');
    QueryDataModule.frxReport1.PrepareReport();
  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    QueryDataModule.RMGridReport1.LoadFromFile(ExtractFilePath(ParamStr(0))
      + 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf');
    QueryDataModule.RMGridReport1.ShowReport(); ;
  end;
end;

procedure TTicketSetForm.NModifyTicketClick(Sender: TObject);
begin
  modifyTicket
end;

procedure TTicketSetForm.NOpenDirClick(Sender: TObject);
begin
  if MainForm.systemConfig.ticketType = 1 then
    ShellExecute(Handle, 'open', 'Explorer.exe',
      PChar(ExtractFilePath(ParamStr(0)) + 'Ticket\'), nil, 1)
  else if MainForm.systemConfig.ticketType = 2 then
    ShellExecute(Handle, 'open', 'Explorer.exe',
      PChar(ExtractFilePath(ParamStr(0)) + 'TicketII\'), nil, 1);
end;

procedure TTicketSetForm.BitBtnSetDefaultClick(Sender: TObject);
begin
  setDefaultTicket
end;

procedure TTicketSetForm.BitBtnModifyTicketClick(Sender: TObject);
begin
  modifyTicket
end;

procedure TTicketSetForm.setDefaultTicket;
var s: string;
  myini: TIniFile;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    if MainForm.systemConfig.ticketType = 1 then
    begin
      s := ExtractFilePath(ParamStr(0))
        + 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'ticketFormat', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.ticketFormat := s;
    end
    else if MainForm.systemConfig.ticketType = 2 then
    begin
      s := ExtractFilePath(ParamStr(0))
        + 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'ticketFormat2', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.ticketFormat2 := s;
    end;
    lblTicket.Text := s;
  end;
end;

procedure TTicketSetForm.NSetDefaultClick(Sender: TObject);
begin
  setDefaultTicket
end;

procedure TTicketSetForm.modifyTicket;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    if MainForm.systemConfig.ticketType = 1 then
      TReportUtil.designTicket(ExtractFilePath(ParamStr(0))
        + 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3', MainForm.systemConfig.ticketType)
    else if MainForm.systemConfig.ticketType = 2 then
      TReportUtil.designTicket(ExtractFilePath(ParamStr(0))
        + 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf', MainForm.systemConfig.ticketType);
  end;
end;

end.

