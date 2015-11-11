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
    N5: TMenuItem;
    RMPreview1: TRMPreview;
    EdtPOTicket: TLabeledEdit;
    EdtSOTicket: TLabeledEdit;
    EdtIOTicket: TLabeledEdit;
    EdtOOTicket: TLabeledEdit;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure LBTicketClick(Sender: TObject);
    procedure NModifyTicketClick(Sender: TObject);
    procedure NOpenDirClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure NSetDefaultClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure listTicket(ticketType: Integer = 1);
    procedure setPOTicket();
    procedure setSOTicket();
    procedure setIOTicket();
    procedure setOOTicket();
    procedure modifyTicket();
  end;

var
  TicketSetForm: TTicketSetForm;

implementation

uses
  QueryDM, Main, WeightUtil, ReportUtil, Dialogs;

{$R *.dfm}

procedure TTicketSetForm.FormShow(Sender: TObject);
var f: string;
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
    EdtPOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.poTicketFormat;
    EdtSOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.soTicketFormat;
    EdtIOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ioTicketFormat;
    EdtOOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ooTicketFormat;

    f := ExtractFileName(
      ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.poTicketFormat
      );
    LBTicket.ItemIndex := LBTicket.Items.IndexOf(Copy(f, 1, Length(f) - 4));

  end
  else if MainForm.systemConfig.ticketType = 2 then
  begin
    frxPreview1.Visible := False;
    RMPreview1.Align := alClient;
    EdtPOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.poTicketFormat2;
    EdtSOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.soTicketFormat2;
    EdtIOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ioTicketFormat2;
    EdtOOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ooTicketFormat2;

    f := ExtractFileName(
      ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.poTicketFormat
      );
    LBTicket.ItemIndex := LBTicket.Items.IndexOf(Copy(f, 1, Length(f) - 4));

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

procedure TTicketSetForm.setPOTicket;
var s: string;
  myini: TIniFile;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    if MainForm.systemConfig.ticketType = 1 then
    begin
      s := 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'poTicketFormat', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.poTicketFormat := s;
      EdtPOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.poTicketFormat;
    end
    else if MainForm.systemConfig.ticketType = 2 then
    begin
      s := 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'poTicketFormat2', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.poTicketFormat2 := s;
      EdtPOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.poTicketFormat2;
    end;
  end;
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

procedure TTicketSetForm.setIOTicket;
var s: string;
  myini: TIniFile;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    if MainForm.systemConfig.ticketType = 1 then
    begin
      s := 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'ioTicketFormat', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.ioTicketFormat := s;
      EdtIOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ioTicketFormat;
    end
    else if MainForm.systemConfig.ticketType = 2 then
    begin
      s := 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'ioTicketFormat2', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.ioTicketFormat2 := s;
      EdtIOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ioTicketFormat2;
    end;
  end;
end;

procedure TTicketSetForm.setOOTicket;
var s: string;
  myini: TIniFile;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    if MainForm.systemConfig.ticketType = 1 then
    begin
      s := 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'ooTicketFormat', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.ooTicketFormat := s;
      EdtOOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ooTicketFormat;
    end
    else if MainForm.systemConfig.ticketType = 2 then
    begin
      s := 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'ooTicketFormat2', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.ooTicketFormat2 := s;
      EdtOOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.ooTicketFormat2;
    end;
  end;
end;

procedure TTicketSetForm.setSOTicket;
var s: string;
  myini: TIniFile;
begin
  if LBTicket.ItemIndex <> -1 then
  begin
    if MainForm.systemConfig.ticketType = 1 then
    begin
      s := 'Ticket\' + LBTicket.Items[LBTicket.ItemIndex] + '.fr3';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'soTicketFormat', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.soTicketFormat := s;
      EdtSOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.soTicketFormat;
    end
    else if MainForm.systemConfig.ticketType = 2 then
    begin
      s := 'TicketII\' + LBTicket.Items[LBTicket.ItemIndex] + '.rmf';
      if myini = nil then myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
      try
        myini.WriteString('system_set', 'soTicketFormat2', s);
      finally
        myini.Free;
      end;
      MainForm.systemConfig.soTicketFormat2 := s;
      EdtSOTicket.Text := ExtractFilePath(ParamStr(0)) + MainForm.systemConfig.soTicketFormat2;
    end;
  end;
end;

procedure TTicketSetForm.N1Click(Sender: TObject);
begin
  setPOTicket;
end;

procedure TTicketSetForm.N2Click(Sender: TObject);
begin
  setSOTicket
end;

procedure TTicketSetForm.N3Click(Sender: TObject);
begin
  setIOTicket
end;

procedure TTicketSetForm.N6Click(Sender: TObject);
begin
  setOOTicket
end;

procedure TTicketSetForm.NSetDefaultClick(Sender: TObject);
begin
  setPOTicket;
  setSOTicket;
  setIOTicket;
  setOOTicket;
end;

end.

