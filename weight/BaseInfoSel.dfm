object BaseInfoSelForm: TBaseInfoSelForm
  Left = 551
  Top = 205
  Width = 269
  Height = 415
  Caption = #35831#36873#25321
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object LBBaseInfo: TListBox
    Left = 0
    Top = 0
    Width = 261
    Height = 320
    Align = alClient
    ItemHeight = 20
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 320
    Width = 261
    Height = 68
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 24
      Top = 16
      Width = 105
      Height = 35
      Caption = #30830#23450
      TabOrder = 0
      Kind = bkOK
    end
    object BitBtn2: TBitBtn
      Left = 144
      Top = 16
      Width = 105
      Height = 35
      Caption = #21462#28040
      TabOrder = 1
      Kind = bkCancel
    end
  end
end
