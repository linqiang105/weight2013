object LoginInfoForm: TLoginInfoForm
  Left = 246
  Top = 149
  BorderStyle = bsDialog
  Caption = #20010#20154#20449#24687#35746#21046
  ClientHeight = 390
  ClientWidth = 632
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 20
  object lblLoginTitle: TLabel
    Left = 16
    Top = 13
    Width = 120
    Height = 20
    AutoSize = False
    Caption = #30331#38470#26631#39064
  end
  object lblLoginInfo: TLabel
    Left = 16
    Top = 52
    Width = 120
    Height = 20
    AutoSize = False
    Caption = #30331#38470#20449#24687
  end
  object lblMainTitle: TLabel
    Left = 16
    Top = 275
    Width = 120
    Height = 20
    AutoSize = False
    Caption = #20027#31383#20307#26631#39064
  end
  object EdtLoginTitle: TEdit
    Left = 136
    Top = 8
    Width = 481
    Height = 28
    TabOrder = 0
  end
  object EdtMainTitle: TEdit
    Left = 136
    Top = 272
    Width = 481
    Height = 28
    TabOrder = 1
  end
  object MemoLoginInfo: TMemo
    Left = 136
    Top = 48
    Width = 481
    Height = 209
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object BitBtnOk: TBitBtn
    Left = 416
    Top = 320
    Width = 95
    Height = 45
    Caption = #30830#23450
    Default = True
    TabOrder = 3
    OnClick = BitBtnOkClick
  end
  object BitBtnCancel: TBitBtn
    Left = 520
    Top = 320
    Width = 95
    Height = 45
    Cancel = True
    Caption = #21462#28040
    TabOrder = 4
    OnClick = BitBtnCancelClick
  end
  object BitBtnSetPass: TBitBtn
    Left = 312
    Top = 320
    Width = 95
    Height = 45
    Caption = #35774#32622#23494#30721
    TabOrder = 5
    OnClick = BitBtnSetPassClick
  end
end
