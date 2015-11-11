object CorrectForm: TCorrectForm
  Left = 418
  Top = 197
  BorderStyle = bsDialog
  Caption = #37325#37327#20462#27491
  ClientHeight = 299
  ClientWidth = 440
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 304
    Top = 16
    Width = 129
    Height = 13
    AutoSize = False
    Caption = #35831#20808#25351#23450#24555#25463#38190
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 13
    Top = 200
    Width = 48
    Height = 22
    AutoSize = False
    Caption = #24635#20851'    '
    Layout = tlCenter
  end
  object Bevel1: TBevel
    Left = 8
    Top = 104
    Width = 420
    Height = 2
  end
  object HotKey1: THotKey
    Left = 16
    Top = 48
    Width = 90
    Height = 19
    Modifiers = []
    TabOrder = 0
  end
  object HotKey2: THotKey
    Left = 121
    Top = 48
    Width = 90
    Height = 19
    HotKey = 83
    Modifiers = []
    TabOrder = 1
  end
  object HotKey3: THotKey
    Left = 225
    Top = 48
    Width = 90
    Height = 19
    HotKey = 68
    Modifiers = []
    TabOrder = 2
  end
  object HotKey4: THotKey
    Left = 330
    Top = 48
    Width = 90
    Height = 19
    HotKey = 70
    Modifiers = []
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 200
    Top = 240
    Width = 100
    Height = 41
    Caption = #30830#23450
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 320
    Top = 240
    Width = 100
    Height = 41
    Caption = #21462#28040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object CBUseCorrect: TCheckBox
    Left = 16
    Top = 16
    Width = 145
    Height = 17
    Caption = #21551#29992#37325#37327#20462#27491
    TabOrder = 10
  end
  object RBByNum: TRadioButton
    Left = 16
    Top = 176
    Width = 100
    Height = 17
    Caption = #25353#25968#20540#20462#27491
    Checked = True
    TabOrder = 11
    TabStop = True
  end
  object RBByScale: TRadioButton
    Left = 120
    Top = 176
    Width = 100
    Height = 17
    Caption = #25353#27604#20363#20462#27491
    TabOrder = 12
  end
  object LEStart: TLabeledEdit
    Left = 224
    Top = 200
    Width = 57
    Height = 21
    EditLabel.Width = 53
    EditLabel.Height = 13
    EditLabel.Caption = #21551#21160#37327'  '
    LabelPosition = lpLeft
    TabOrder = 13
    Text = '10000'
  end
  object HotKeyClose: THotKey
    Left = 64
    Top = 202
    Width = 90
    Height = 19
    HotKey = 32833
    TabOrder = 14
  end
  object EdtWeight1: TEdit
    Left = 16
    Top = 72
    Width = 90
    Height = 21
    TabOrder = 4
    Text = '500'
  end
  object EdtWeight2: TEdit
    Left = 121
    Top = 72
    Width = 90
    Height = 21
    TabOrder = 5
    Text = '1000'
  end
  object EdtWeight3: TEdit
    Left = 225
    Top = 72
    Width = 90
    Height = 21
    TabOrder = 6
    Text = '1500'
  end
  object EdtWeight4: TEdit
    Left = 330
    Top = 72
    Width = 90
    Height = 21
    TabOrder = 7
    Text = '2000'
  end
  object CBUseFix: TCheckBox
    Left = 225
    Top = 176
    Width = 120
    Height = 17
    Caption = #20351#29992#22266#23450#20462#27491#37327
    TabOrder = 15
  end
  object EdtFix: TEdit
    Left = 352
    Top = 173
    Width = 65
    Height = 21
    TabOrder = 16
    Text = '0'
  end
  object HotKey5: THotKey
    Left = 16
    Top = 120
    Width = 90
    Height = 19
    HotKey = 71
    Modifiers = []
    TabOrder = 17
  end
  object HotKey6: THotKey
    Left = 121
    Top = 120
    Width = 90
    Height = 19
    HotKey = 72
    Modifiers = []
    TabOrder = 18
  end
  object HotKey7: THotKey
    Left = 225
    Top = 120
    Width = 90
    Height = 19
    HotKey = 74
    Modifiers = []
    TabOrder = 19
  end
  object HotKey8: THotKey
    Left = 330
    Top = 120
    Width = 90
    Height = 19
    HotKey = 75
    Modifiers = []
    TabOrder = 20
  end
  object EdtWeight5: TEdit
    Left = 16
    Top = 144
    Width = 90
    Height = 21
    TabOrder = 21
    Text = '-500'
  end
  object EdtWeight6: TEdit
    Left = 121
    Top = 144
    Width = 90
    Height = 21
    TabOrder = 22
    Text = '-1000'
  end
  object EdtWeight7: TEdit
    Left = 225
    Top = 144
    Width = 90
    Height = 21
    TabOrder = 23
    Text = '-1500'
  end
  object EdtWeight8: TEdit
    Left = 330
    Top = 144
    Width = 90
    Height = 21
    TabOrder = 24
    Text = '-2000'
  end
  object CBCorrectOnce: TCheckBox
    Left = 296
    Top = 202
    Width = 121
    Height = 17
    Caption = #20462#27491#20165#19968#27425#26377#25928
    Checked = True
    State = cbChecked
    TabOrder = 25
  end
  object CBExportToWeight: TCheckBox
    Left = 16
    Top = 234
    Width = 137
    Height = 17
    Caption = #36755#20986#21040#31216#37325#30028#38754
    TabOrder = 26
  end
  object CBExportItem: TComboBox
    Left = 16
    Top = 256
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 27
  end
end
