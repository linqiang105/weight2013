object ApartDBfileForm: TApartDBfileForm
  Left = 371
  Top = 326
  BorderIcons = [biMinimize]
  BorderStyle = bsDialog
  Caption = #20998#31163'/'#21387#32553' '#25968#25454#24211
  ClientHeight = 92
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 313
    Height = 92
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object LabelDBName: TLabel
      Left = 14
      Top = 18
      Width = 120
      Height = 21
      AutoSize = False
      Caption = ' '#25968#25454#24211#21517#31216#65306
      Color = clSkyBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object EditDBName: TComboBox
      Left = 150
      Top = 18
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnEnter = EditDBNameEnter
    end
    object Button1: TButton
      Left = 112
      Top = 50
      Width = 75
      Height = 25
      Caption = #20998#31163
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 208
      Top = 50
      Width = 75
      Height = 25
      Caption = #21462#28040
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 24
      Top = 50
      Width = 75
      Height = 25
      Caption = #21387#32553
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Button3Click
    end
  end
end
