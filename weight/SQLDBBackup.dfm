object SQLDBBackupForm: TSQLDBBackupForm
  Left = 400
  Top = 289
  Width = 470
  Height = 206
  BorderIcons = [biSystemMenu]
  Caption = #25968#25454#22791#20221
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 462
    Height = 179
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 145
      Height = 13
      AutoSize = False
      Caption = #35831#36873#25321#22791#20221#25991#20214#22320#22336':'
    end
    object Label2: TLabel
      Left = 16
      Top = 61
      Width = 153
      Height = 13
      AutoSize = False
      Caption = #35831#36873#25321#24674#22797#25968#25454#24211#25991#20214':'
    end
    object EdtAddr: TEdit
      Left = 16
      Top = 35
      Width = 329
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object BtnSel1: TBitBtn
      Left = 352
      Top = 31
      Width = 80
      Height = 25
      Caption = #36873#25321
      TabOrder = 1
      OnClick = BtnSel1Click
    end
    object EdtRestore: TEdit
      Left = 16
      Top = 80
      Width = 329
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
    object BtnSel2: TBitBtn
      Left = 352
      Top = 78
      Width = 80
      Height = 25
      Caption = #36873#25321
      TabOrder = 3
      OnClick = BtnSel2Click
    end
    object BtnBackup: TBitBtn
      Left = 24
      Top = 120
      Width = 80
      Height = 30
      Caption = #22791#20221
      Default = True
      TabOrder = 4
      OnClick = BtnBackupClick
    end
    object BtnRestore: TBitBtn
      Left = 120
      Top = 120
      Width = 80
      Height = 30
      Caption = #24674#22797
      TabOrder = 5
      OnClick = BtnRestoreClick
    end
    object ClostBtn: TButton
      Left = 352
      Top = 120
      Width = 80
      Height = 30
      Caption = #20851#38381
      TabOrder = 6
      OnClick = ClostBtnClick
    end
    object BtnCompact: TButton
      Left = 216
      Top = 120
      Width = 80
      Height = 30
      Caption = #25910#32553
      TabOrder = 7
      OnClick = BtnCompactClick
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #25968#25454#24211#22791#20221#25991#20214'(*.BAK)|*.BAK|'#25152#26377#25991#20214'(*.*)|*.*'
    FilterIndex = 3
    Left = 312
    Top = 128
  end
end
