object DBMaintainForm: TDBMaintainForm
  Left = 462
  Top = 215
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #25968#25454#24211#22791#20221
  ClientHeight = 270
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 417
    Height = 229
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object Label5: TLabel
      Left = 18
      Top = 118
      Width = 106
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #24674#22797#25968#25454#24211#22320#22336
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 18
      Top = 73
      Width = 106
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#20221#25968#25454#24211#22320#22336
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object Label3: TLabel
      Left = 25
      Top = 93
      Width = 264
      Height = 21
      AutoSize = False
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object GroupBox1: TGroupBox
      Left = 22
      Top = 8
      Width = 369
      Height = 57
      Caption = #22791#20221#36873#39033
      TabOrder = 0
      object RBManual: TRadioButton
        Left = 24
        Top = 24
        Width = 73
        Height = 17
        Caption = #25163#21160#22791#20221
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object RBEveryEnd: TRadioButton
        Left = 136
        Top = 24
        Width = 97
        Height = 17
        Caption = #27599#27425#32467#26463#22791#20221
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object RBEveryHour: TRadioButton
        Left = 264
        Top = 24
        Width = 89
        Height = 17
        Caption = #27599#23567#26102#22791#20221
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object Edit2: TEdit
      Left = 25
      Top = 144
      Width = 264
      Height = 21
      BorderStyle = bsNone
      Color = clWhite
      TabOrder = 3
    end
    object BtnRestore: TBitBtn
      Left = 170
      Top = 180
      Width = 80
      Height = 25
      Caption = #24674#22797#25968#25454#24211
      TabOrder = 6
      OnClick = BtnRestoreClick
      Layout = blGlyphBottom
    end
    object BtnBack: TBitBtn
      Left = 32
      Top = 180
      Width = 80
      Height = 25
      Caption = #22791#20221#25968#25454#24211
      Default = True
      TabOrder = 5
      OnClick = BtnBackClick
      Layout = blGlyphBottom
    end
    object BitBtn5: TBitBtn
      Left = 308
      Top = 142
      Width = 80
      Height = 26
      Caption = #36873#25321#36335#24452
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn5Click
    end
    object CheckBox2: TCheckBox
      Left = 272
      Top = 70
      Width = 121
      Height = 17
      Caption = #22791#20221#26102#21387#32553#25968#25454#24211
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 308
      Top = 91
      Width = 80
      Height = 25
      Caption = #36873#25321#36335#24452
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object BtnClose: TBitBtn
      Left = 304
      Top = 180
      Width = 75
      Height = 25
      Cancel = True
      Caption = #20851#38381
      TabOrder = 7
      OnClick = BtnCloseClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Caption = #25968#25454#24211#22791#20221
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #21326#25991#26032#39759
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object OpenDialog1: TOpenDialog
    OnShow = OpenDialog1Show
    Filter = #25968#25454#24211#25991#20214'|*.mdb'
    Left = 376
    Top = 24
  end
end
