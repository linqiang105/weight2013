object ManualInputForm: TManualInputForm
  Left = 239
  Top = 214
  Width = 881
  Height = 415
  Caption = #31216#37325#35760#24405
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object lblGrossTime: TLabel
    Left = 8
    Top = 304
    Width = 75
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #27611#37325#26102#38388
    Layout = tlCenter
  end
  object lblTareTime: TLabel
    Left = 344
    Top = 304
    Width = 75
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Caption = #30382#37325#26102#38388
    Layout = tlCenter
  end
  object PInput: TPanel
    Left = 0
    Top = 0
    Width = 873
    Height = 289
    Align = alTop
    BevelOuter = bvNone
    BorderWidth = 5
    TabOrder = 0
    object lblTare: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #30382#12288#37325
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblSum: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #37329#12288#39069
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblSpec: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #35268'      '#26684
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblShouHuo: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #25910#36135#21333#20301
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblScale: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #25240#26041#31995#25968
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblMemo: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791'       '#27880
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblReal: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #23454#12288#37325
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblQuanter: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #25240#26041#37327
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblPrice: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #21333'      '#20215
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblNet: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #20928#12288#37325
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblGross: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #27611#12288#37325
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblGoods: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #36135'      '#21517
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblFaHuo: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #21457#36135#21333#20301
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblCost: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #36807#30917#36153
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblCar: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #36710'      '#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBundle: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #25187'      '#37325
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup9: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup8: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup7: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup6: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup5: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup4: TRzLabel
      Left = 0
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup3: TRzLabel
      Left = 128
      Top = 52
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup2: TRzLabel
      Left = 128
      Top = 24
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup18: TRzLabel
      Left = 272
      Top = 208
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'18'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup17: TRzLabel
      Left = 272
      Top = 184
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'17'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup16: TRzLabel
      Left = 264
      Top = 152
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'16'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup15: TRzLabel
      Left = 272
      Top = 128
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'15'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup14: TRzLabel
      Left = 272
      Top = 104
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'14'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup13: TRzLabel
      Left = 272
      Top = 80
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'13'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup12: TRzLabel
      Left = 272
      Top = 48
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'12'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup11: TRzLabel
      Left = 280
      Top = 24
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'11'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup10: TRzLabel
      Left = 280
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object lblBackup1: TRzLabel
      Left = 136
      Top = 0
      Width = 70
      Height = 30
      Alignment = taCenter
      AutoSize = False
      Caption = #22791#29992'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #24494#36719#38597#40657
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      Layout = tlCenter
      Visible = False
      ShadowDepth = 0
      TextStyle = tsShadow
    end
    object P0: TPanel
      Left = 5
      Top = 5
      Width = 180
      Height = 279
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object P00: TPanel
        Left = 0
        Top = 0
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object P01: TPanel
        Left = 0
        Top = 30
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object P02: TPanel
        Left = 0
        Top = 60
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
      object P03: TPanel
        Left = 0
        Top = 90
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
      object P04: TPanel
        Left = 0
        Top = 120
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object P05: TPanel
        Left = 0
        Top = 150
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
      end
      object P06: TPanel
        Left = 0
        Top = 180
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
      end
      object P07: TPanel
        Left = 0
        Top = 210
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
      end
      object P08: TPanel
        Left = 0
        Top = 240
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 8
      end
    end
    object P1: TPanel
      Left = 185
      Top = 5
      Width = 180
      Height = 279
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object P10: TPanel
        Left = 0
        Top = 0
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object P11: TPanel
        Left = 0
        Top = 30
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object P12: TPanel
        Left = 0
        Top = 60
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
      object P13: TPanel
        Left = 0
        Top = 90
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
      object P14: TPanel
        Left = 0
        Top = 120
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object P15: TPanel
        Left = 0
        Top = 150
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
      end
      object P16: TPanel
        Left = 0
        Top = 180
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
      end
      object P17: TPanel
        Left = 0
        Top = 210
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
      end
      object P18: TPanel
        Left = 0
        Top = 240
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 8
      end
    end
    object P2: TPanel
      Left = 365
      Top = 5
      Width = 180
      Height = 279
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object P20: TPanel
        Left = 0
        Top = 0
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object P21: TPanel
        Left = 0
        Top = 30
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object P22: TPanel
        Left = 0
        Top = 60
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
      object P23: TPanel
        Left = 0
        Top = 90
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
      object P24: TPanel
        Left = 0
        Top = 120
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object P25: TPanel
        Left = 0
        Top = 150
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
      end
      object P26: TPanel
        Left = 0
        Top = 180
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
      end
      object P27: TPanel
        Left = 0
        Top = 210
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 7
      end
      object P28: TPanel
        Left = 0
        Top = 240
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 8
      end
    end
    object P3: TPanel
      Left = 545
      Top = 5
      Width = 180
      Height = 279
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object P30: TPanel
        Left = 0
        Top = 0
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
      end
      object P31: TPanel
        Left = 0
        Top = 30
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object P32: TPanel
        Left = 0
        Top = 60
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
      end
      object P33: TPanel
        Left = 0
        Top = 90
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
      end
      object P34: TPanel
        Left = 0
        Top = 120
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
      end
      object P35: TPanel
        Left = 0
        Top = 150
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
      end
      object P36: TPanel
        Left = 0
        Top = 180
        Width = 180
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
      end
    end
    object EdtTare: TRzEdit
      Left = 464
      Top = 32
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FocusColor = clAqua
      ParentFont = False
      ReadOnly = True
      TabOnEnter = True
      TabOrder = 37
      Visible = False
      OnChange = EdtTareChange
    end
    object EdtSum: TRzEdit
      Left = 464
      Top = 160
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      ReadOnly = True
      TabOnEnter = True
      TabOrder = 36
      Visible = False
    end
    object CBSpec: TRzComboBox
      Left = 40
      Top = 128
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 35
      Visible = False
    end
    object CBShouHuo: TRzComboBox
      Left = 40
      Top = 64
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 34
      Visible = False
    end
    object EdtScale: TRzEdit
      Left = 40
      Top = 160
      Width = 100
      Height = 28
      Text = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 33
      Visible = False
      OnChange = EdtScaleChange
    end
    object EdtMemo: TRzEdit
      Left = 40
      Top = 256
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 32
      Visible = False
    end
    object EdtReal: TRzEdit
      Left = 464
      Top = 96
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      ReadOnly = True
      TabOnEnter = True
      TabOrder = 31
      Visible = False
    end
    object EdtQuanter: TRzEdit
      Left = 464
      Top = 192
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      ReadOnly = True
      TabOnEnter = True
      TabOrder = 30
      Visible = False
    end
    object EdtPrice: TRzEdit
      Left = 40
      Top = 224
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 29
      Visible = False
      OnChange = EdtPriceChange
    end
    object EdtNet: TRzEdit
      Left = 464
      Top = 64
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      ReadOnly = True
      TabOnEnter = True
      TabOrder = 28
      Visible = False
    end
    object CBGoods: TRzComboBox
      Left = 40
      Top = 96
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 26
      Visible = False
    end
    object CBFaHuo: TRzComboBox
      Left = 40
      Top = 32
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 25
      Visible = False
    end
    object EdtCost: TRzEdit
      Left = 464
      Top = 128
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 24
      Visible = False
    end
    object CBCar: TRzComboBox
      Left = 40
      Top = 0
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 23
      Visible = False
      OnDblClick = CBCarDblClick
    end
    object EdtBundle: TRzEdit
      Left = 40
      Top = 192
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 22
      Visible = False
      OnChange = EdtBundleChange
    end
    object EdtBackup9: TRzEdit
      Left = 184
      Top = 256
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 21
      Visible = False
    end
    object EdtBackup8: TRzEdit
      Left = 184
      Top = 224
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 20
      Visible = False
    end
    object EdtBackup7: TRzEdit
      Left = 184
      Top = 192
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 19
      Visible = False
    end
    object EdtBackup6: TRzEdit
      Left = 184
      Top = 160
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 18
      Visible = False
    end
    object CBBackup5: TRzComboBox
      Left = 184
      Top = 128
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 17
      Visible = False
    end
    object CBBackup4: TRzComboBox
      Left = 184
      Top = 96
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 16
      Visible = False
    end
    object CBBackup3: TRzComboBox
      Left = 184
      Top = 64
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 15
      Visible = False
    end
    object CBBackup2: TRzComboBox
      Left = 184
      Top = 32
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 14
      Visible = False
    end
    object EdtBackup18: TRzEdit
      Left = 320
      Top = 256
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 13
      Visible = False
    end
    object EdtBackup17: TRzEdit
      Left = 320
      Top = 224
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 12
      Visible = False
    end
    object EdtBackup16: TRzEdit
      Left = 320
      Top = 192
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 11
      Visible = False
    end
    object EdtBackup15: TRzEdit
      Left = 320
      Top = 160
      Width = 100
      Height = 28
      Text = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ParentFont = False
      TabOnEnter = True
      TabOrder = 10
      Visible = False
    end
    object CBBackup14: TRzComboBox
      Left = 320
      Top = 128
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 9
      Visible = False
    end
    object CBBackup13: TRzComboBox
      Left = 320
      Top = 96
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 8
      Visible = False
    end
    object CBBackup12: TRzComboBox
      Left = 320
      Top = 64
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 7
      Visible = False
    end
    object CBBackup11: TRzComboBox
      Left = 320
      Top = 32
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 6
      Visible = False
    end
    object CBBackup10: TRzComboBox
      Left = 320
      Top = 0
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 5
      Visible = False
    end
    object CBBackup1: TRzComboBox
      Left = 184
      Top = 0
      Width = 100
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FocusColor = clAqua
      ItemHeight = 20
      ParentFont = False
      TabOnEnter = True
      TabOrder = 4
      Visible = False
    end
    object EdtGross: TRzEdit
      Left = 464
      Top = 0
      Width = 100
      Height = 28
      Text = '0'
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FocusColor = clAqua
      ParentFont = False
      ReadOnly = True
      TabOnEnter = True
      TabOrder = 27
      Visible = False
      OnChange = EdtGrossChange
    end
  end
  object DTPGrossDate: TDateTimePicker
    Left = 88
    Top = 304
    Width = 120
    Height = 24
    Date = 41373.884181273150000000
    Time = 41373.884181273150000000
    TabOrder = 1
  end
  object DTPGrossTime: TDateTimePicker
    Left = 216
    Top = 304
    Width = 120
    Height = 24
    Date = 41373.884187986110000000
    Time = 41373.884187986110000000
    Kind = dtkTime
    TabOrder = 2
  end
  object DTPTareDate: TDateTimePicker
    Left = 424
    Top = 304
    Width = 120
    Height = 24
    Date = 41373.884200451390000000
    Time = 41373.884200451390000000
    TabOrder = 3
  end
  object DTPTareTime: TDateTimePicker
    Left = 544
    Top = 304
    Width = 120
    Height = 24
    Date = 41373.884209421300000000
    Time = 41373.884209421300000000
    Kind = dtkTime
    TabOrder = 4
  end
  object BtnSave: TBitBtn
    Left = 672
    Top = 304
    Width = 85
    Height = 65
    Caption = #20445#23384
    TabOrder = 5
    OnClick = BtnSaveClick
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
  object BtnClose: TBitBtn
    Left = 768
    Top = 304
    Width = 85
    Height = 65
    Caption = #21462#28040
    TabOrder = 6
    Kind = bkCancel
  end
  object CBUseExpress: TCheckBox
    Left = 552
    Top = 352
    Width = 113
    Height = 17
    Caption = #20351#29992#33258#23450#20041#20844#24335
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object EdtGlideNo: TEdit
    Left = 16
    Top = 346
    Width = 193
    Height = 24
    ReadOnly = True
    TabOrder = 8
  end
  object RGWeightType: TRadioGroup
    Left = 216
    Top = 336
    Width = 321
    Height = 41
    Caption = #36807#30917#31867#22411
    Columns = 4
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      #37319#36141#36807#30917
      #38144#21806#36807#30917
      #20869#37096#21608#36716
      #20854#20182#36807#30917)
    ParentFont = False
    TabOrder = 9
  end
end
