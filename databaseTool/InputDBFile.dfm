object InputDBFileForm: TInputDBFileForm
  Left = 313
  Top = 272
  BorderIcons = [biMinimize]
  BorderStyle = bsDialog
  Caption = #38468#21152#25968#25454#24211
  ClientHeight = 210
  ClientWidth = 338
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 338
    Height = 210
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 13
      Width = 120
      Height = 21
      AutoSize = False
      Caption = #25968#25454#24211#25991#20214#65306
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 18
      Top = 64
      Width = 120
      Height = 21
      AutoSize = False
      Caption = #25968#25454#24211#26085#24535#25991#20214#65306
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 22
      Top = 120
      Width = 290
      Height = 13
      AutoSize = False
      Caption = #65288#27880#24847#65306#24517#39035#26159#36873#23450#25968#25454#24211#25991#20214#30340#26085#24535#25991#20214#65289
    end
    object LabelDBName: TLabel
      Left = 23
      Top = 138
      Width = 98
      Height = 21
      Alignment = taCenter
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
    object Edit1: TEdit
      Left = 15
      Top = 37
      Width = 260
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 15
      Top = 91
      Width = 260
      Height = 21
      TabOrder = 1
    end
    object BitBtn1: TBitBtn
      Left = 287
      Top = 37
      Width = 35
      Height = 25
      Caption = #36873#25321
      TabOrder = 2
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 287
      Top = 91
      Width = 35
      Height = 25
      Caption = #36873#25321
      TabOrder = 3
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 50
      Top = 171
      Width = 75
      Height = 25
      Caption = #38468#21152
      TabOrder = 4
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 210
      Top = 171
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 5
      OnClick = BitBtn4Click
    end
    object EditDBName: TEdit
      Left = 144
      Top = 138
      Width = 129
      Height = 21
      TabOrder = 6
    end
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = #38468#21152#25968#25454#24211
    Left = 288
    Top = 120
  end
end
