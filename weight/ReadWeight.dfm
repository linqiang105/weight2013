object ReadWeightForm: TReadWeightForm
  Left = 498
  Top = 320
  BorderStyle = bsDialog
  Caption = #35821#38899#25253#25968
  ClientHeight = 95
  ClientWidth = 261
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GBChange: TGroupBox
    Left = 0
    Top = 0
    Width = 261
    Height = 95
    Align = alClient
    Caption = #27979#35797
    TabOrder = 0
    object EdtSource: TEdit
      Left = 24
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
      Text = '1234.56'
      OnKeyDown = EdtSourceKeyDown
      OnKeyPress = EdtSourceKeyPress
    end
    object EdtAim: TEdit
      Left = 72
      Top = 56
      Width = 169
      Height = 21
      ReadOnly = True
      TabOrder = 1
      OnKeyDown = EdtAimKeyDown
    end
    object BtnRead: TButton
      Left = 160
      Top = 22
      Width = 75
      Height = 25
      Caption = #35821#38899#35835#25968
      TabOrder = 2
      OnClick = BtnReadClick
    end
    object BitBtnChange: TBitBtn
      Left = 16
      Top = 54
      Width = 49
      Height = 25
      Caption = '=>'
      TabOrder = 3
      TabStop = False
      OnClick = BitBtnChangeClick
    end
  end
end
