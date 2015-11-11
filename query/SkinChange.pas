unit SkinChange;

interface

uses
  SysUtils, Classes, Controls, Forms,
  ExtCtrls, Buttons, StdCtrls;
type
  TSkinChangeForm = class(TForm)
    PBack: TPanel;
    CBSkin: TComboBox;
    BitBtnOK: TBitBtn;
    BitBtnCancel: TBitBtn;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtnOKClick(Sender: TObject);
    procedure BitBtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure loadSkinFile();
  end;

var
  SkinChangeForm: TSkinChangeForm;

implementation

uses
  Main, IniFiles;

{$R *.dfm}

{ TSkinChangeForm }

procedure TSkinChangeForm.loadSkinFile;
var
  sr: TSearchRec;
begin
  CBSkin.Items.Clear;
  if FindFirst(ExtractFilePath(ParamStr(0)) + 'Skin\*.skn', faAnyFile, sr) = 0 then
  begin
    repeat
      if (sr.Attr and faDirectory) = 0 then
        CBSkin.Items.Add(Copy(sr.Name, 1, Length(sr.Name) - 4));
    until FindNext(sr) <> 0;
    FindClose(sr);
  end;
end;

procedure TSkinChangeForm.FormShow(Sender: TObject);
var myini: TIniFile;
begin
  loadSkinFile;
  CBSkin.Items.Add('');

  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    CBSkin.ItemIndex := myini.ReadInteger('system_set', 'skin_index', 0);
  finally
    myini.Free;
  end;
end;

procedure TSkinChangeForm.BitBtnOKClick(Sender: TObject);
var myini: TIniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteString('system_set', 'skin_file', CBSkin.Text);
    myini.WriteInteger('system_set', 'skin_index', CBSkin.ItemIndex);
    MainForm.setSkin(CBSkin.Text);
  finally
    myini.Free;
  end;
end;

procedure TSkinChangeForm.BitBtnCancelClick(Sender: TObject);
begin
  Close;
end;

end.

