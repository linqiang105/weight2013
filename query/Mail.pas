unit Mail;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, IniFiles,
  IdSMTP, IdMessage, ComCtrls, ToolCtrlsEh,
  DBGridEhToolCtrls, GridsEh, DBAxisGridsEh, DBGridEh, DBGridEhGrouping;

type
  TMailForm = class(TForm)
    PBSend: TProgressBar;
    Panel1: TPanel;
    lblMemo: TLabel;
    BtnSend: TBitBtn;
    LEUser: TLabeledEdit;
    LEPass: TLabeledEdit;
    LEReceive: TLabeledEdit;
    LETitle: TLabeledEdit;
    MemoBody: TMemo;
    TSend: TTimer;
    BtnSave: TBitBtn;
    TMail: TTimer;
    Label1: TLabel;
    LEHost: TComboBox;
    GBSendOption: TGroupBox;
    RBEveryDay: TRadioButton;
    DTPSend: TDateTimePicker;
    RBEveryHour: TRadioButton;
    CBAutoSend: TCheckBox;
    CBReportType: TComboBox;
    lblReportType: TLabel;
    DBGridEhMail: TDBGridEh;
    procedure BtnSendClick(Sender: TObject);
    procedure TSendTimer(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure TMailTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure loadDBGrid();
  public
    { Public declarations }
    function sendMail(host, username, password, receiver, title, body, attachment: string): Boolean;
  end;

var
  MailForm: TMailForm;

implementation

uses
  CommonUtil, DBGridEhImpExp, OtherUtil, QueryDM, Main;

{$R *.dfm}

function TMailForm.sendMail(host, username, password, receiver, title,
  body, attachment: string): Boolean;
var smtp: TIdSMTP;
  msgsend: TIdMessage;
begin
  smtp := TIdSMTP.Create(nil);
  msgsend := TIdMessage.Create(nil);
  try
    smtp.AuthenticationType := atLogin;
    smtp.Host := host;
    smtp.Username := username; //用户名
    smtp.Password := password;

    msgsend.Recipients.EMailAddresses := receiver;
    //收 件人地址(多于一个的话用逗号隔开)
    msgsend.From.Text := username; //自己的邮箱地址
    msgsend.Subject := title;
    //邮件标题
    msgsend.Body.Text := body; //邮件内容
    //添加附件
    msgsend.MessageParts.Clear;

    if FileExists(attachment) then
      TIdAttachment.Create(msgsend.MessageParts, attachment);

    try
      smtp.Connect();
      try
        smtp.Authenticate;
        smtp.Send(msgsend);
        Result := True;
      except on E: Exception do
        begin
          ShowMessage(E.Message);
          Result := False;
        end;
      end;
    except
      Result := False;
    end;
  finally
    smtp.Disconnect;
    msgsend.Free;
    smtp.Free;
  end;
end;

procedure TMailForm.BtnSendClick(Sender: TObject);
var ret: Integer;
  attatchment: string;
  ExpClass: TDBGridEhExportClass;
begin
  TSend.Enabled := True;
  try
    case CBReportType.ItemIndex of
      0: TMailUtil.showTodayRecord();
      1: TMailUtil.showToWeekRecord();
      2: TMailUtil.showToMonthRecord();
      3: TMailUtil.showToYearRecord();
    end;
    attatchment := ExtractFilePath(ParamStr(0)) + 'dataReport.xls';
    ExpClass := TDBGridEhExportAsXLS;
    if ExpClass <> nil then
    begin
      SaveDBGridEhToExportFile(ExpClass, DBGridEhMail, attatchment, True);
    end;

    if sendMail(LEHost.Text, LEUser.Text, LEPass.Text, LEReceive.Text,
      LETitle.Text, MemoBody.Text, attatchment) then
      MessageBox(Handle, '邮件发送成功', '提示', MB_OK + MB_ICONINFORMATION
        + MB_DEFBUTTON2 + MB_TOPMOST)
    else
      MessageBox(Handle, '邮件发送失败,请检查用户名,密码及网络连接', '提示', MB_OK + MB_ICONSTOP +
        MB_DEFBUTTON2 + MB_TOPMOST);

    if FileExists(attatchment) then DeleteFile(attatchment);
  finally
    TSend.Enabled := False;
    PBSend.Position := 0;
  end;
end;

procedure TMailForm.TSendTimer(Sender: TObject);
begin
  PBSend.StepIt;
end;

procedure TMailForm.BtnSaveClick(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteString('mail', 'host', LEHost.Text);
    myini.WriteString('mail', 'username', LEUser.Text);
    myini.WriteString('mail', 'pass', TCommonUtil.Base64(LEPass.Text));
    myini.WriteString('mail', 'receiver', LEReceive.Text);
    myini.WriteString('mail', 'title', LETitle.Text);
    myini.WriteString('mail', 'body', MemoBody.Text);
    myini.WriteInteger('mail', 'report_type', CBReportType.ItemIndex);

    myini.WriteBool('mail', 'auto_send', CBAutoSend.Checked);
    myini.WriteBool('mail', 'everyday', RBEveryDay.Checked);
    myini.WriteTime('mail', 'sendTime', DTPSend.Time);
    myini.WriteBool('mail', 'everyhour', RBEveryHour.Checked);

    Application.MessageBox('参数保存成功', '提示', MB_OK + MB_ICONINFORMATION
      + MB_TOPMOST);

  finally
    myini.Free;
  end;
end;

procedure TMailForm.TMailTimer(Sender: TObject);
var
  ExpClass: TDBGridEhExportClass;
  fileName: string;
begin
  if RBEveryDay.Checked then
  begin
    if FormatDateTime('hhnnss', Time) = FormatDateTime('hhnnss', DTPSend.Time) then
    begin
      case CBReportType.ItemIndex of
        0: TMailUtil.showTodayRecord();
        1: TMailUtil.showToWeekRecord();
        2: TMailUtil.showToMonthRecord();
        3: TMailUtil.showToYearRecord();
      end;
      try
        fileName := ExtractFilePath(ParamStr(0)) + 'dataReport.xls';
        ExpClass := TDBGridEhExportAsXLS;
        if ExpClass <> nil then
        begin
          SaveDBGridEhToExportFile(ExpClass, DBGridEhMail, fileName, True);
        end;
        sendMail(LEHost.Text, LEUser.Text, LEPass.Text, LEReceive.Text,
          FormatDateTime('yyyy-mm-dd', Date) + LETitle.Text, MemoBody.Text, filename);
      finally
        if FileExists(fileName) then DeleteFile(fileName);
      end;
    end;
  end
  else
  begin
    if FormatDateTime('nnss', Now) = '0000' then
    begin
      case CBReportType.ItemIndex of
        0: TMailUtil.showTodayRecord();
        1: TMailUtil.showToWeekRecord();
        2: TMailUtil.showToMonthRecord();
        3: TMailUtil.showToYearRecord();
      end;
      try
        fileName := ExtractFilePath(ParamStr(0)) + 'dataReport.xls';
        ExpClass := TDBGridEhExportAsXLS;
        if ExpClass <> nil then
        begin
          SaveDBGridEhToExportFile(ExpClass, DBGridEhMail, fileName, True);
        end;
        sendMail(LEHost.Text, LEUser.Text, LEPass.Text, LEReceive.Text,
          FormatDateTime('yyyy-mm-dd', Date) + LETitle.Text, MemoBody.Text, filename);
      finally
        if FileExists(fileName) then DeleteFile(fileName);
      end;
    end;
  end;
end;

procedure TMailForm.FormCreate(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    LEHost.Text := myini.ReadString('mail', 'host', 'smtp.qq.com');
    LEUser.Text := myini.ReadString('mail', 'username', '');
    LEPass.Text := TCommonUtil.deBase64(myini.ReadString('mail', 'pass', ''));
    LEReceive.Text := myini.ReadString('mail', 'receiver', '');
    LETitle.Text := myini.ReadString('mail', 'title', '');
    MemoBody.Text := myini.ReadString('mail', 'body', '');
    CBReportType.ItemIndex := myini.ReadInteger('mail', 'report_type', 0);

    CBAutoSend.Checked := myini.ReadBool('mail', 'auto_send', False);
    RBEveryDay.Checked := myini.ReadBool('mail', 'everyday', True);
    DTPSend.Time := myini.ReadTime('mail', 'sendTime', StrToTime('00:00:00'));
    RBEveryHour.Checked := myini.ReadBool('mail', 'everyhour', False);

    TMail.Enabled := CBAutoSend.Checked;
  finally
    myini.Free;
  end;

  DBGridEhMail.DataSource := QueryDataModule.DSMail;
end;

procedure TMailForm.loadDBGrid;
var i: Integer;
  fn: string;
begin
  for i := 0 to MainForm.DBGridEh1.FieldCount - 1 do
  begin
    fn := MainForm.DBGridEh1.Fields[i].FieldName;
    DBGridEhMail.FieldColumns[fn].Title.Caption := MainForm.DBGridEh1.FieldColumns[fn].Title.Caption;
    DBGridEhMail.FieldColumns[fn].Visible := MainForm.DBGridEh1.FieldColumns[fn].Visible;
  end;
  for i := 0 to DBGridEhMail.Columns.Count - 1 do
  begin
    DBGridEhMail.Columns[i].Width := MainForm.DBGridEh1.Columns[i].Width;
  end;
end;

end.

