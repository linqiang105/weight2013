unit SelectServer;

interface

uses
  Variants, Classes, Controls, Forms,
  ExtCtrls, StdCtrls, Buttons, Comobj, Graphics;

type
  TSelectServerForm = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Bevel1: TBevel;
    ListBox1: TListBox;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SelectServerForm: TSelectServerForm;

implementation

uses DBTools;

{$R *.dfm}

procedure TSelectServerForm.FormShow(Sender: TObject);
var
  SQLServer: Variant;
  ServerList: Variant;
  i, nServers: integer;
begin
  SQLServer := CreateOleObject('SQLDMO.Application');
  ServerList := SQLServer.ListAvailableSQLServers;
  nServers := ServerList.Count;
  for i := 1 to nServers do
    ListBox1.Items.Add(ServerList.Item(i));
  SQLServer := NULL;
  ServerList := NULL;

end;

procedure TSelectServerForm.ListBox1DblClick(Sender: TObject);
begin
  OkBtn.Click;
end;

procedure TSelectServerForm.OkBtnClick(Sender: TObject);
begin
  DBToolForm.LoginName.text := ListBox1.Items[ListBox1.ItemIndex];
  close;
end;

procedure TSelectServerForm.CancelBtnClick(Sender: TObject);
begin
  close;
end;

end.

