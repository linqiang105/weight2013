unit Correct;

interface

uses
  SysUtils, Classes, Controls, Forms,
  StdCtrls, ComCtrls, Buttons, IniFiles, ExtCtrls;

type
  TCorrectForm = class(TForm)
    HotKey1: THotKey;
    HotKey2: THotKey;
    HotKey3: THotKey;
    HotKey4: THotKey;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CBUseCorrect: TCheckBox;
    Label1: TLabel;
    RBByNum: TRadioButton;
    RBByScale: TRadioButton;
    LEStart: TLabeledEdit;
    HotKeyClose: THotKey;
    Label2: TLabel;
    EdtWeight1: TEdit;
    EdtWeight2: TEdit;
    EdtWeight3: TEdit;
    EdtWeight4: TEdit;
    CBUseFix: TCheckBox;
    EdtFix: TEdit;
    HotKey5: THotKey;
    HotKey6: THotKey;
    HotKey7: THotKey;
    HotKey8: THotKey;
    EdtWeight5: TEdit;
    EdtWeight6: TEdit;
    EdtWeight7: TEdit;
    EdtWeight8: TEdit;
    Bevel1: TBevel;
    CBCorrectOnce: TCheckBox;
    CBExportToWeight: TCheckBox;
    CBExportItem: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function hotKeyConflict(hotkey: TShortCut): Boolean;
  end;

var
  CorrectForm: TCorrectForm;

implementation

uses
  Main, Dialogs, Menus, Windows;

{$R *.dfm}

procedure TCorrectForm.BitBtn1Click(Sender: TObject);
var myini: TiniFile;
begin
  if hotKeyConflict(HotKey1.HotKey) then
  begin
    Application.MessageBox('1#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey1.HotKey := 0;
    HotKey1.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey2.HotKey) then
  begin
    Application.MessageBox('2#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey2.HotKey := 0;
    HotKey2.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey3.HotKey) then
  begin
    Application.MessageBox('3#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey3.HotKey := 0;
    HotKey3.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey4.HotKey) then
  begin
    Application.MessageBox('4#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey4.HotKey := 0;
    HotKey4.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey5.HotKey) then
  begin
    Application.MessageBox('5#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey5.HotKey := 0;
    HotKey5.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey6.HotKey) then
  begin
    Application.MessageBox('6#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey6.HotKey := 0;
    HotKey6.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey7.HotKey) then
  begin
    Application.MessageBox('7#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey7.HotKey := 0;
    HotKey7.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKey8.HotKey) then
  begin
    Application.MessageBox('8#øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKey8.HotKey := 0;
    HotKey8.SetFocus;
    Exit;
  end;
  if hotKeyConflict(HotKeyClose.HotKey) then
  begin
    Application.MessageBox('øÏΩ›º¸≥ÂÕª,«Î÷ÿ–¬…Ë÷√!', '¥ÌŒÛ', MB_OK +
      MB_ICONSTOP + MB_DEFBUTTON2 + MB_TOPMOST);
    HotKeyClose.HotKey := 0;
    HotKeyClose.SetFocus;
    Exit;
  end;

  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    myini.WriteBool('correct', 'use', CBUseCorrect.Checked);
    MainForm.systemConfig.useCorrect := CBUseCorrect.Checked;

    myini.WriteInteger('correct', 'weight1-key', HotKey1.HotKey);
    myini.WriteInteger('correct', 'weight2-key', HotKey2.HotKey);
    myini.WriteInteger('correct', 'weight3-key', HotKey3.HotKey);
    myini.WriteInteger('correct', 'weight4-key', HotKey4.HotKey);
    myini.WriteInteger('correct', 'weight5-key', HotKey5.HotKey);
    myini.WriteInteger('correct', 'weight6-key', HotKey6.HotKey);
    myini.WriteInteger('correct', 'weight7-key', HotKey7.HotKey);
    myini.WriteInteger('correct', 'weight8-key', HotKey8.HotKey);
    myini.WriteInteger('correct', 'weight-close', HotKeyClose.HotKey);

    MainForm.cheat1.ShortCut := HotKey1.HotKey;
    MainForm.cheat2.ShortCut := HotKey2.HotKey;
    MainForm.cheat3.ShortCut := HotKey3.HotKey;
    MainForm.cheat4.ShortCut := HotKey4.HotKey;
    MainForm.cheat5.ShortCut := HotKey5.HotKey;
    MainForm.cheat6.ShortCut := HotKey6.HotKey;
    MainForm.cheat7.ShortCut := HotKey7.HotKey;
    MainForm.cheat8.ShortCut := HotKey8.HotKey;
    MainForm.cheatClose.ShortCut := HotKeyClose.HotKey;

    myini.WriteFloat('correct', 'weight1', StrToFloatDef(EdtWeight1.Text, 0));
    myini.WriteFloat('correct', 'weight2', StrToFloatDef(EdtWeight2.Text, 0));
    myini.WriteFloat('correct', 'weight3', StrToFloatDef(EdtWeight3.Text, 0));
    myini.WriteFloat('correct', 'weight4', StrToFloatDef(EdtWeight4.Text, 0));
    myini.WriteFloat('correct', 'weight5', StrToFloatDef(EdtWeight5.Text, 0));
    myini.WriteFloat('correct', 'weight6', StrToFloatDef(EdtWeight6.Text, 0));
    myini.WriteFloat('correct', 'weight7', StrToFloatDef(EdtWeight7.Text, 0));
    myini.WriteFloat('correct', 'weight8', StrToFloatDef(EdtWeight8.Text, 0));

    MainForm.systemConfig.cweight1 := StrToFloatDef(EdtWeight1.Text, 0);
    MainForm.systemConfig.cweight2 := StrToFloatDef(EdtWeight2.Text, 0);
    MainForm.systemConfig.cweight3 := StrToFloatDef(EdtWeight3.Text, 0);
    MainForm.systemConfig.cweight4 := StrToFloatDef(EdtWeight4.Text, 0);
    MainForm.systemConfig.cweight5 := StrToFloatDef(EdtWeight5.Text, 0);
    MainForm.systemConfig.cweight6 := StrToFloatDef(EdtWeight6.Text, 0);
    MainForm.systemConfig.cweight7 := StrToFloatDef(EdtWeight7.Text, 0);
    MainForm.systemConfig.cweight8 := StrToFloatDef(EdtWeight8.Text, 0);

    myini.WriteBool('correct', 'correctType', RBByNum.Checked);
    MainForm.systemConfig.cheatType := RBByNum.Checked;

    myini.WriteFloat('correct', 'startCheat', StrToFloatDef(LEStart.Text, 10000));
    MainForm.systemConfig.startCheat := StrToFloatDef(LEStart.Text, 10000);

    myini.WriteBool('correct', 'use_fix', CBUseFix.Checked);
    MainForm.systemConfig.useFix := CBUseFix.Checked;
    myini.WriteFloat('correct', 'fix', StrToFloatDef(EdtFix.Text, 0));
    MainForm.systemConfig.fix := StrToFloatDef(EdtFix.Text, 0);

    myini.WriteBool('correct', 'correct_once', CBCorrectOnce.Checked);
    MainForm.systemConfig.correctOnce := CBCorrectOnce.Checked;

    myini.WriteBool('correct', 'export_to_weight', CBExportToWeight.Checked);
    MainForm.systemConfig.exportToWeight := CBExportToWeight.Checked;

    myini.WriteInteger('correct', 'export_item', CBExportItem.ItemIndex);
    MainForm.systemConfig.exportItem := CBExportItem.ItemIndex;

    Close;
  finally
    myini.Free;
  end;
end;

procedure TCorrectForm.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TCorrectForm.FormShow(Sender: TObject);
var myini: TiniFile;
begin
  myini := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'setup.ini');
  try
    CBUseCorrect.Checked := myini.ReadBool('correct', 'use', False);

    HotKey1.HotKey := myini.ReadInteger('correct', 'weight1-key', VK_F1);
    HotKey2.HotKey := myini.ReadInteger('correct', 'weight2-key', VK_F2);
    HotKey3.HotKey := myini.ReadInteger('correct', 'weight3-key', VK_F3);
    HotKey4.HotKey := myini.ReadInteger('correct', 'weight4-key', VK_F4);
    HotKey5.HotKey := myini.ReadInteger('correct', 'weight5-key', VK_F5);
    HotKey6.HotKey := myini.ReadInteger('correct', 'weight6-key', VK_F6);
    HotKey7.HotKey := myini.ReadInteger('correct', 'weight7-key', VK_F7);
    HotKey8.HotKey := myini.ReadInteger('correct', 'weight8-key', VK_F9);
    HotKeyClose.HotKey := myini.ReadInteger('correct', 'weight-close', VK_F12);

    EdtWeight1.Text := myini.ReadString('correct', 'weight1', '500');
    EdtWeight2.Text := myini.ReadString('correct', 'weight2', '1000');
    EdtWeight3.Text := myini.ReadString('correct', 'weight3', '1500');
    EdtWeight4.Text := myini.ReadString('correct', 'weight4', '2000');
    EdtWeight5.Text := myini.ReadString('correct', 'weight5', '-500');
    EdtWeight6.Text := myini.ReadString('correct', 'weight6', '-1000');
    EdtWeight7.Text := myini.ReadString('correct', 'weight7', '-1500');
    EdtWeight8.Text := myini.ReadString('correct', 'weight8', '-2000');

    RBByNum.Checked := myini.ReadBool('correct', 'correctType', True);
    RBByScale.Checked := not RBByNum.Checked;

    LEStart.Text := myini.ReadString('correct', 'startCheat', '10000');

    CBUseFix.Checked := myini.ReadBool('correct', 'use_fix', False);
    EdtFix.Text := myini.ReadString('correct', 'fix', '0');
    CBCorrectOnce.Checked := myini.ReadBool('correct', 'correct_once', True);

    CBExportToWeight.Checked := myini.ReadBool('correct', 'export_to_weight', False);
    CBExportItem.ItemIndex := myini.ReadInteger('correct', 'export_item', -1);

  finally
    myini.Free;
  end;
end;

function TCorrectForm.hotKeyConflict(hotkey: TShortCut): Boolean;
var s: string;
begin
  s := ShortCutToText(hotkey);

  Result := (s = 'Shift+Ctrl+F5') or (s = 'Ctrl+Z') or (s = 'F8');

end;

procedure TCorrectForm.FormCreate(Sender: TObject);
begin
  CBExportItem.Items.Clear;
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.carCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.faHuoCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.shouHuoCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.goodsCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.specCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.bundleCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.priceCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.scaleCaption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup1Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup2Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup3Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup4Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup5Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup6Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup7Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup8Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup9Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup10Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup11Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup12Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup13Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup14Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup15Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup16Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup17Caption);
  CBExportItem.Items.Add(MainForm.poWeightSetConfig.backup18Caption);
end;

end.
