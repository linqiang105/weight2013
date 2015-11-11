object AboutForm: TAboutForm
  Left = 420
  Top = 316
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #20851#20110
  ClientHeight = 165
  ClientWidth = 420
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
    Width = 420
    Height = 165
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Gauge1: TGauge
      Left = 23
      Top = 130
      Width = 370
      Height = 17
      ForeColor = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Progress = 0
    end
    object Label2: TLabel
      Left = 19
      Top = 108
      Width = 121
      Height = 13
      AutoSize = False
      Caption = #29616#22312#20869#23384#20351#29992#29575#65306
      Layout = tlCenter
    end
    object CnAAScrollText1: TCnAAScrollText
      Left = 16
      Top = 16
      Width = 385
      Height = 81
      ParentEffect.ParentColor = False
      Fonts = <
        item
          Name = 'Title1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -32
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Effect.Shadow.Enabled = True
        end
        item
          Name = 'Title2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -19
          Font.Name = #40657#20307
          Font.Style = [fsBold]
          Effect.Shadow.Enabled = True
          Effect.Shadow.OffsetX = 1
          Effect.Shadow.OffsetY = 1
        end
        item
          Name = 'Title3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Effect.Shadow.Enabled = True
        end
        item
          Name = 'Text1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Effect.Shadow.OffsetX = 1
          Effect.Shadow.OffsetY = 1
        end
        item
          Name = 'Text2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clTeal
          Font.Height = -11
          Font.Name = #26999#20307'_GB2312'
          Font.Style = []
          Effect.Shadow.Enabled = True
          Effect.Shadow.OffsetX = 1
          Effect.Shadow.OffsetY = 1
        end
        item
          Name = 'Title4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = #38582#20070
          Font.Style = [fsBold]
          Effect.Shadow.Enabled = True
          Effect.Gradual.Enabled = True
          Effect.Gradual.StartColor = 16720384
          Effect.Gradual.EndColor = 2232575
          Effect.Blur = 50
          Effect.Outline = True
        end
        item
          Name = 'Text3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = #38582#20070
          Font.Style = []
          Effect.Shadow.Enabled = True
          Effect.Shadow.OffsetX = 1
          Effect.Shadow.OffsetY = 1
          Effect.Gradual.Enabled = True
          Effect.Gradual.Style = gsTopToBottom
          Effect.Gradual.StartColor = 13382417
          Effect.Gradual.EndColor = 16720554
        end>
      Labels = <
        item
          Name = 'Left'
          Style = lsLeftJustify
        end
        item
          Name = 'Center'
          Style = lsCenter
        end
        item
          Name = 'Right'
          Style = lsRightJustify
        end
        item
          Name = 'Owner'
          Style = lsRegOwner
        end
        item
          Name = 'Organization'
          Style = lsRegOrganization
        end
        item
          Name = 'AppTitle'
          Style = lsAppTitle
        end
        item
          Name = 'Date'
          Style = lsDate
        end
        item
          Name = 'Time'
          Style = lsTime
        end>
      Text.Lines.Strings = (
        '<Title1>'#31216#37325#31649#29702#31995#32479
        '<Title2>V2.1'
        ''
        ''
        ''
        '<Title3> '#25105#21496#38534#37325#25512#20986#22823#20107#19994#36827#38144#23384#31995#32479
        '<Title3>'#27426#36814#21040' http://www.fzatw.com/down/class '#36827#34892#19979#36733)
      Text.Font.Charset = GB2312_CHARSET
      Text.Font.Color = clWindowText
      Text.Font.Height = -13
      Text.Font.Name = #23435#20307
      Text.Font.Style = []
    end
  end
  object Timer1: TTimer
    Interval = 100
    OnTimer = Timer1Timer
    Left = 248
    Top = 112
  end
end
