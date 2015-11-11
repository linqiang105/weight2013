object MeterConnect2Form: TMeterConnect2Form
  Left = 530
  Top = 111
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '2#'#20202#34920#35774#32622
  ClientHeight = 442
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 60
    Align = alTop
    Caption = #20202'  '#34920'  '#35774'  '#32622
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #21326#25991#26032#39759
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object PSetting: TPanel
    Left = 0
    Top = 60
    Width = 624
    Height = 382
    Align = alClient
    TabOrder = 1
    object lblMeterType: TLabel
      Left = 19
      Top = 147
      Width = 65
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = #20202#34920#22411#21495
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object SBClear: TSpeedButton
      Left = 544
      Top = 241
      Width = 65
      Height = 29
      Caption = #28165#31354
      Flat = True
      OnClick = SBClearClick
    end
    object SBSend: TSpeedButton
      Left = 544
      Top = 278
      Width = 65
      Height = 49
      Caption = #21457#36865
      OnClick = SBSendClick
    end
    object BitBtnCancel: TBitBtn
      Left = 472
      Top = 335
      Width = 129
      Height = 35
      Cancel = True
      Caption = #20851#38381
      TabOrder = 0
      OnClick = BitBtnCancelClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00005B5BF5005555F100504FED004B4CEA00393ADF0000000000000000001313
        C5002827D300201FCD001B1BCB001313C50000000000FFFFFF00FFFFFF00FFFF
        FF00000000005B5BF500504FED005555F1004B4CEA001B1BCB0005059D00504F
        ED006B6BFF006B6BFF00201FCD0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000005B5BF500504FED005555F1004B4CEA001B1BCB00504F
        ED006B6BFF002D2DD60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343E5006464
        FA00393ADF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343
        E50000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005F5FF8004B4CEA00504FED004B4C
        EA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000006B6BFF003D3DE1005F5FF8004B4CEA005352
        EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000006B6BFF003434DB006B6BFF001B1BCB005F5FF8004B4C
        EA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000006B6BFF002827D3002D2DD6006B6BFF0005059D003D3DE1005F5F
        F8004B4CEA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF000000
        00006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF0000000000000000006B6B
        FF005F5FF8005B5BF500504FED004B4CEA0000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
    object PComParam: TPanel
      Left = 16
      Top = 35
      Width = 305
      Height = 101
      BevelInner = bvLowered
      TabOrder = 1
      object lblCom: TLabel
        Left = 8
        Top = 8
        Width = 49
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = #31471'  '#21475
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblBaut: TLabel
        Left = 152
        Top = 8
        Width = 49
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = #27874' '#29305' '#29575
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblDataBit: TLabel
        Left = 8
        Top = 40
        Width = 49
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = #25968' '#25454' '#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblStopBit: TLabel
        Left = 152
        Top = 40
        Width = 49
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = #20572' '#27490' '#20301
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblParity: TLabel
        Left = 8
        Top = 72
        Width = 49
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #22855#20598#26657#39564
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object lblPollingDelay: TLabel
        Left = 152
        Top = 72
        Width = 49
        Height = 21
        Alignment = taCenter
        AutoSize = False
        Caption = #26816#26597#38388#38548
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object ComPort: TComboBox
        Left = 64
        Top = 8
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBMeterTypeChange
      end
      object BaudRate: TComboBox
        Left = 208
        Top = 8
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBMeterTypeChange
      end
      object ByteSize: TComboBox
        Left = 64
        Top = 40
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBMeterTypeChange
      end
      object StopBits: TComboBox
        Left = 208
        Top = 40
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 3
        OnChange = CBMeterTypeChange
      end
      object Parity: TComboBox
        Left = 64
        Top = 72
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 4
        OnChange = CBMeterTypeChange
      end
      object PollingDelay: TDBNumberEditEh
        Left = 208
        Top = 72
        Width = 81
        Height = 21
        Alignment = taLeftJustify
        DynProps = <>
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <>
        Increment = 50.000000000000000000
        MaxValue = 9999.000000000000000000
        TabOrder = 5
        Value = 500.000000000000000000
        Visible = True
        OnChange = CBMeterTypeChange
        OnKeyPress = PollingDelayKeyPress
      end
    end
    object BitBtnApply: TBitBtn
      Left = 336
      Top = 335
      Width = 121
      Height = 35
      Caption = #24212#29992
      Default = True
      TabOrder = 2
      OnClick = BitBtnApplyClick
      Glyph.Data = {
        42020000424D4202000000000000420000002800000010000000100000000100
        1000030000000002000000000000000000000000000000000000007C0000E003
        00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F29252925292529252925292529252925FF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F4A299C73DE7BDE7BDE7BDE7BDE7B2925FF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F4A299C73FF7FFF7FFF7FFF7FDE7B292529252925292529252925
        29252925FF7F4A299C73FF7FFF7FFF7FFF7FDE7B292539673967396739673967
        39672925FF7F4A299C739C739C739C739C739C7329257B6F7B6F7B6F7B6F7B6F
        39672925FF7F4A29F701F701F701F701F701F70129257B6F7B6F7B6F7B6F7B6F
        39672925FF7F4A29FF26BF12BF125B025B02F70129257B6F7B6F7B6F7B6F7B6F
        39672925FF7F4A294A294A29292529252925292529257B6F7B6F7B6F7B6F7B6F
        39672925FF7FFF7FFF7F4A29B5567B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F
        39672925FF7FFF7FFF7F4A29B5567B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F7B6F
        39672925FF7FFF7FFF7F4A29B556B556B556B556B556B556B556B556B556B556
        D65A2925FF7FFF7FFF7F4A29F701F701F701F701F701F701F701F701F701F701
        F7012925FF7FFF7FFF7F4A29FF26FF26BF12BF125B025B025B025B02F701F701
        F7012925FF7FFF7FFF7F4A294A294A294A294A294A294A294A294A294A294A29
        4A294A29FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
        FF7FFF7FFF7F}
    end
    object CBMeterType: TComboBox
      Left = 83
      Top = 147
      Width = 233
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 3
      OnChange = CBMeterTypeChange
      Items.Strings = (
        'XK3190-A9'
        'XK3190-D2+'
        'XK3190-D'
        'XK3190-D9'
        'XK2002D'
        'XK2005D'
        'ORMT-2000'
        'XK3188A'
        'XK-SCS-A'
        'YB8142'
        'HT9800'
        'PT50D'
        'XK3196B'
        #33258#23450#20041)
    end
    object CBUseMeter: TCheckBox
      Left = 24
      Top = 11
      Width = 81
      Height = 17
      Caption = #21551#29992#20202#34920
      TabOrder = 4
    end
    object MemoLog: TMemo
      Left = 328
      Top = 35
      Width = 281
      Height = 193
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object GBChange: TGroupBox
      Left = 330
      Top = 234
      Width = 207
      Height = 47
      Caption = #25968#25454#26174#31034' '#36827#21046#36716#25442
      TabOrder = 6
      object RBTen: TRadioButton
        Left = 16
        Top = 21
        Width = 80
        Height = 17
        Caption = #21313#36827#21046
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object RBSixteen: TRadioButton
        Left = 112
        Top = 21
        Width = 80
        Height = 17
        Caption = #21313#20845#36827#21046
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object GBRemote: TGroupBox
      Left = 16
      Top = 278
      Width = 305
      Height = 89
      Caption = #36828#31243#20202#34920
      TabOrder = 7
      object CBUDP: TCheckBox
        Left = 153
        Top = 24
        Width = 97
        Height = 17
        Caption = #20174#36828#31243#35835#21462
        TabOrder = 0
        OnClick = CBUDPClick
      end
      object LEIP: TLabeledEdit
        Left = 64
        Top = 52
        Width = 113
        Height = 21
        EditLabel.Width = 46
        EditLabel.Height = 13
        EditLabel.Caption = 'IP'#22320#22336#12288
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '192.168.1.151'
      end
      object LEPort: TLabeledEdit
        Left = 240
        Top = 52
        Width = 49
        Height = 21
        EditLabel.Width = 48
        EditLabel.Height = 13
        EditLabel.Caption = #31471#21475#21495#12288
        LabelPosition = lpLeft
        TabOrder = 2
        Text = '8889'
      end
      object CBAllowRemote: TCheckBox
        Left = 16
        Top = 24
        Width = 118
        Height = 17
        Caption = #20801#35768#36828#31243#35835#21462
        TabOrder = 3
        OnClick = CBAllowRemoteClick
      end
    end
    object GBDefine: TGroupBox
      Left = 16
      Top = 176
      Width = 305
      Height = 93
      Caption = #33258#23450#20041#20202#34920#36873#39033
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 8
      object LEStart: TLabeledEdit
        Left = 145
        Top = 24
        Width = 33
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = #36215#22987#20301'  '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 0
        Text = '='
      end
      object LEGetFirst: TLabeledEdit
        Left = 261
        Top = 24
        Width = 29
        Height = 21
        EditLabel.Width = 66
        EditLabel.Height = 13
        EditLabel.Caption = #24320#22987#25130#21462#20301'  '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '1'
      end
      object CBQueue: TComboBox
        Left = 224
        Top = 58
        Width = 65
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = #27491#24207
        Items.Strings = (
          #27491#24207
          #21453#24207)
      end
      object LEDataLength: TLabeledEdit
        Left = 72
        Top = 58
        Width = 49
        Height = 21
        EditLabel.Width = 54
        EditLabel.Height = 13
        EditLabel.Caption = #25968#25454#38271#24230'  '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 3
        Text = '7'
      end
      object LEPoint: TLabeledEdit
        Left = 176
        Top = 58
        Width = 41
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = #23567#25968#28857'  '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 4
        Text = '0'
      end
      object CBType: TComboBox
        Left = 12
        Top = 26
        Width = 75
        Height = 21
        Style = csDropDownList
        Enabled = False
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 5
        Text = 'ASCII'#30721
        Items.Strings = (
          'ASCII'#30721
          'BCD'#30721
          'HEX'#30721)
      end
    end
    object CBAutoSend: TCheckBox
      Left = 456
      Top = 312
      Width = 81
      Height = 17
      Caption = #33258#21160#21457#36865
      TabOrder = 9
    end
    object EdtSend: TEdit
      Left = 330
      Top = 286
      Width = 209
      Height = 21
      Hint = #20165#25903#25345'16'#36827#21046#23383#31526#21457#36865
      ParentShowHint = False
      ShowHint = True
      TabOrder = 10
    end
  end
  object TSend: TTimer
    Enabled = False
    OnTimer = TSendTimer
    Left = 200
    Top = 8
  end
  object IdUDPC: TIdUDPClient
    Port = 0
    ReceiveTimeout = 0
    Left = 408
    Top = 16
  end
  object IdUDPS: TIdUDPServer
    Bindings = <>
    DefaultPort = 8889
    OnUDPRead = IdUDPSUDPRead
    Left = 480
    Top = 16
  end
  object IdAntiFreeze1: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 552
    Top = 16
  end
  object TUDPClient: TTimer
    Enabled = False
    OnTimer = TUDPClientTimer
    Left = 516
    Top = 137
  end
  object CommP: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM2'
    OnReceiveData = CommPReceiveData
    Left = 444
    Top = 137
  end
end
