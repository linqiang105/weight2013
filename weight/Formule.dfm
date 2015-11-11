object FormuleForm: TFormuleForm
  Left = 449
  Top = 156
  BorderStyle = bsDialog
  Caption = #20844#24335#32534#36753
  ClientHeight = 373
  ClientWidth = 502
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblMin: TLabel
    Left = 362
    Top = 150
    Width = 55
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = #26368#23567#20540
    Layout = tlCenter
  end
  object lblPoint: TLabel
    Left = 362
    Top = 180
    Width = 55
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = #23567#25968#28857
    Layout = tlCenter
  end
  object lblDivide: TLabel
    Left = 362
    Top = 209
    Width = 55
    Height = 15
    Alignment = taCenter
    AutoSize = False
    Caption = #20998#24230
    Layout = tlCenter
  end
  object GBAvalid: TGroupBox
    Left = 8
    Top = 8
    Width = 345
    Height = 321
    Caption = #21487#29992#39033#30446
    TabOrder = 0
    object SBGross: TBitBtn
      Left = 10
      Top = 20
      Width = 65
      Height = 30
      Caption = '['#27611#37325']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = SBGrossClick
    end
    object SBTare: TBitBtn
      Left = 74
      Top = 20
      Width = 65
      Height = 30
      Caption = '['#30382#37325']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = SBGrossClick
    end
    object SBNet: TBitBtn
      Left = 138
      Top = 20
      Width = 65
      Height = 30
      Caption = '['#20928#37325']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = SBGrossClick
    end
    object SBBundle: TBitBtn
      Left = 202
      Top = 20
      Width = 65
      Height = 30
      Caption = '['#25187#37325']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = SBGrossClick
    end
    object SBReal: TBitBtn
      Left = 266
      Top = 20
      Width = 65
      Height = 30
      Caption = '['#23454#37325']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = SBGrossClick
    end
    object SBPrice: TBitBtn
      Left = 10
      Top = 49
      Width = 65
      Height = 30
      Caption = '['#21333#20215']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnClick = SBGrossClick
    end
    object SBSum: TBitBtn
      Left = 74
      Top = 49
      Width = 65
      Height = 30
      Caption = '['#37329#39069']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnClick = SBGrossClick
    end
    object SBCost: TBitBtn
      Left = 138
      Top = 49
      Width = 65
      Height = 30
      Caption = '['#36807#30917#36153']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnClick = SBGrossClick
    end
    object SBBackup1: TBitBtn
      Left = 10
      Top = 78
      Width = 65
      Height = 30
      Caption = '['#22791#29992'1]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = SBGrossClick
    end
    object SBBackup2: TBitBtn
      Left = 74
      Top = 78
      Width = 65
      Height = 30
      Caption = '['#22791#29992'2]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnClick = SBGrossClick
    end
    object SBBackup3: TBitBtn
      Left = 138
      Top = 78
      Width = 65
      Height = 30
      Caption = '['#22791#29992'3]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
      OnClick = SBGrossClick
    end
    object SBBackup6: TBitBtn
      Left = 10
      Top = 107
      Width = 65
      Height = 30
      Caption = '['#22791#29992'6]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = SBGrossClick
    end
    object SBBackup7: TBitBtn
      Left = 74
      Top = 107
      Width = 65
      Height = 30
      Caption = '['#22791#29992'7]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
      OnClick = SBGrossClick
    end
    object SBBackup8: TBitBtn
      Left = 138
      Top = 107
      Width = 65
      Height = 30
      Caption = '['#22791#29992'8]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
      OnClick = SBGrossClick
    end
    object SBBackup11: TBitBtn
      Left = 10
      Top = 136
      Width = 65
      Height = 30
      Caption = '['#22791#29992'11]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 18
      OnClick = SBGrossClick
    end
    object SBBackup12: TBitBtn
      Left = 74
      Top = 136
      Width = 65
      Height = 30
      Caption = '['#22791#29992'12]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 19
      OnClick = SBGrossClick
    end
    object SBBackup13: TBitBtn
      Left = 138
      Top = 136
      Width = 65
      Height = 30
      Caption = '['#22791#29992'13]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 20
      OnClick = SBGrossClick
    end
    object SBBackup16: TBitBtn
      Left = 10
      Top = 165
      Width = 65
      Height = 30
      Caption = '['#22791#29992'16]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 23
      OnClick = SBGrossClick
    end
    object SBBackup17: TBitBtn
      Left = 74
      Top = 165
      Width = 65
      Height = 30
      Caption = '['#22791#29992'17]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 24
      OnClick = SBGrossClick
    end
    object SBBackup18: TBitBtn
      Left = 138
      Top = 165
      Width = 65
      Height = 30
      Caption = '['#22791#29992'18]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 25
      OnClick = SBGrossClick
    end
    object SBMultiply: TBitBtn
      Left = 10
      Top = 194
      Width = 65
      Height = 30
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 28
      OnClick = SBGrossClick
    end
    object SBDivide: TBitBtn
      Left = 74
      Top = 194
      Width = 65
      Height = 30
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 29
      OnClick = SBGrossClick
    end
    object SB0: TBitBtn
      Left = 138
      Top = 194
      Width = 65
      Height = 30
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 30
      OnClick = SBGrossClick
    end
    object SB3: TBitBtn
      Left = 10
      Top = 223
      Width = 65
      Height = 30
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 33
      OnClick = SBGrossClick
    end
    object SB4: TBitBtn
      Left = 74
      Top = 223
      Width = 65
      Height = 30
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 34
      OnClick = SBGrossClick
    end
    object SB5: TBitBtn
      Left = 138
      Top = 223
      Width = 65
      Height = 30
      Caption = '5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 35
      OnClick = SBGrossClick
    end
    object SB8: TBitBtn
      Left = 10
      Top = 252
      Width = 65
      Height = 30
      Caption = '8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 38
      OnClick = SBGrossClick
    end
    object SB9: TBitBtn
      Left = 74
      Top = 252
      Width = 65
      Height = 30
      Caption = '9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 39
      OnClick = SBGrossClick
    end
    object SBDot: TBitBtn
      Left = 138
      Top = 252
      Width = 65
      Height = 30
      Caption = '.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 40
      OnClick = SBGrossClick
    end
    object SBBackSpace: TBitBtn
      Left = 10
      Top = 281
      Width = 65
      Height = 30
      Caption = #21024#38500
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 43
      OnClick = SBBackSpaceClick
    end
    object SBClear: TBitBtn
      Left = 74
      Top = 281
      Width = 65
      Height = 30
      Caption = #28165#31354
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 44
      OnClick = SBClearClick
    end
    object SBScale: TBitBtn
      Left = 202
      Top = 49
      Width = 65
      Height = 30
      Caption = '['#25240#26041#31995#25968']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 45
      OnClick = SBGrossClick
    end
    object SBQuanter: TBitBtn
      Left = 266
      Top = 49
      Width = 65
      Height = 30
      Caption = '['#26041#37327']'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 46
      OnClick = SBGrossClick
    end
    object SBBackup4: TBitBtn
      Left = 202
      Top = 78
      Width = 65
      Height = 30
      Caption = '['#22791#29992'4]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = SBGrossClick
    end
    object SBBackup9: TBitBtn
      Left = 202
      Top = 107
      Width = 65
      Height = 30
      Caption = '['#22791#29992'9]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
      OnClick = SBGrossClick
    end
    object SBBackup5: TBitBtn
      Left = 266
      Top = 78
      Width = 65
      Height = 30
      Caption = '['#22791#29992'5]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = SBGrossClick
    end
    object SBBackup10: TBitBtn
      Left = 266
      Top = 107
      Width = 65
      Height = 30
      Caption = '['#22791#29992'10]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 17
      OnClick = SBGrossClick
    end
    object SBBackup14: TBitBtn
      Left = 202
      Top = 136
      Width = 65
      Height = 30
      Caption = '['#22791#29992'14]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 21
      OnClick = SBGrossClick
    end
    object SBBackup15: TBitBtn
      Left = 266
      Top = 136
      Width = 65
      Height = 30
      Caption = '['#22791#29992'15]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 22
      OnClick = SBGrossClick
    end
    object SBPlus: TBitBtn
      Left = 202
      Top = 165
      Width = 65
      Height = 30
      Caption = '+'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 26
      OnClick = SBGrossClick
    end
    object SBMinus: TBitBtn
      Left = 266
      Top = 165
      Width = 65
      Height = 30
      Caption = '-'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 27
      OnClick = SBGrossClick
    end
    object SB1: TBitBtn
      Left = 202
      Top = 194
      Width = 65
      Height = 30
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 31
      OnClick = SBGrossClick
    end
    object SB2: TBitBtn
      Left = 266
      Top = 194
      Width = 65
      Height = 30
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 32
      OnClick = SBGrossClick
    end
    object SB6: TBitBtn
      Left = 202
      Top = 223
      Width = 65
      Height = 30
      Caption = '6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 36
      OnClick = SBGrossClick
    end
    object SB7: TBitBtn
      Left = 266
      Top = 223
      Width = 65
      Height = 30
      Caption = '7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 37
      OnClick = SBGrossClick
    end
    object SBFront: TBitBtn
      Left = 202
      Top = 252
      Width = 65
      Height = 30
      Caption = '('
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 41
      OnClick = SBGrossClick
    end
    object SBBack: TBitBtn
      Left = 266
      Top = 252
      Width = 65
      Height = 30
      Caption = ')'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 42
      OnClick = SBGrossClick
    end
  end
  object EdtFormula: TEdit
    Left = 11
    Top = 335
    Width = 342
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object RGSumType: TRadioGroup
    Left = 360
    Top = 8
    Width = 129
    Height = 129
    Caption = #36827#20301#26041#24335
    ItemIndex = 1
    Items.Strings = (
      #21482#33293#19981#20837
      #22235#33293#20116#20837
      #21482#20837#19981#33293
      #22235#33293#20845#20837#20116#25104#21452)
    TabOrder = 2
  end
  object SEPoint: TSpinEdit
    Left = 420
    Top = 177
    Width = 65
    Height = 22
    Hint = #23567#25968#28857#20301#25968
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Value = 0
  end
  object EdtMin: TEdit
    Left = 420
    Top = 147
    Width = 65
    Height = 21
    Hint = #20844#24335#35745#31639#21518#30340#26368#23567#20540#65292#24403#20302#20110#27492#20540#26102#65292#32467#26524#20026#27492#25991#26412#20540
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = '0'
  end
  object SEDivide: TSpinEdit
    Left = 420
    Top = 207
    Width = 65
    Height = 22
    Hint = #23567#25968#28857#20301#25968
    MaxValue = 0
    MinValue = 0
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Value = 1
  end
  object BtnOK: TBitBtn
    Left = 366
    Top = 247
    Width = 123
    Height = 50
    Caption = #30830#35748
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BtnOKClick
  end
  object BtnClose: TBitBtn
    Left = 366
    Top = 304
    Width = 123
    Height = 50
    Cancel = True
    Caption = #20851#38381
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BtnCloseClick
  end
end
