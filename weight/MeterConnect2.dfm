object MeterConnect2Form: TMeterConnect2Form
  Left = 284
  Top = 155
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = '2#'#20202#34920#35774#32622
  ClientHeight = 447
  ClientWidth = 752
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object PTitle: TPanel
    Left = 0
    Top = 0
    Width = 752
    Height = 60
    Align = alTop
    Caption = #20202'  '#34920'  '#35774'  '#32622
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object PSetting: TPanel
    Left = 0
    Top = 60
    Width = 744
    Height = 387
    Align = alClient
    Locked = True
    TabOrder = 1
    object lblMeterType: TLabel
      Left = 19
      Top = 138
      Width = 65
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #20202#34920#22411#21495
      Layout = tlCenter
    end
    object SBClear: TSpeedButton
      Left = 669
      Top = 323
      Width = 56
      Height = 40
      Caption = #28165#31354
      Flat = True
      OnClick = SBClearClick
    end
    object Label4: TLabel
      Left = 11
      Top = 167
      Width = 110
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #20202#34920#35745#37327#21333#20301
      Layout = tlCenter
    end
    object Label9: TLabel
      Left = 197
      Top = 167
      Width = 110
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #36719#20214#35745#37327#21333#20301
      Layout = tlCenter
    end
    object Label5: TLabel
      Left = 11
      Top = 193
      Width = 110
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #20202#34920#26174#31034#26684#24335
      Layout = tlCenter
    end
    object Label6: TLabel
      Left = 197
      Top = 194
      Width = 110
      Height = 24
      Alignment = taCenter
      AutoSize = False
      Caption = #20202#34920#20998#24230#20540
      Layout = tlCenter
    end
    object BitBtnCancel: TBitBtn
      Left = 216
      Top = 327
      Width = 137
      Height = 40
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
      Width = 385
      Height = 94
      BevelInner = bvLowered
      TabOrder = 1
      object lblCom: TLabel
        Left = 8
        Top = 8
        Width = 75
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = #31471'  '#21475
        Layout = tlCenter
      end
      object lblBaut: TLabel
        Left = 192
        Top = 8
        Width = 75
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = #27874' '#29305' '#29575
        Layout = tlCenter
      end
      object lblDataBit: TLabel
        Left = 8
        Top = 36
        Width = 75
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = #25968' '#25454' '#20301
        Layout = tlCenter
      end
      object lblStopBit: TLabel
        Left = 192
        Top = 36
        Width = 75
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = #20572' '#27490' '#20301
        Layout = tlCenter
      end
      object lblParity: TLabel
        Left = 8
        Top = 64
        Width = 75
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = #22855#20598#26657#39564
        Layout = tlCenter
      end
      object lblPollingDelay: TLabel
        Left = 192
        Top = 64
        Width = 75
        Height = 24
        Alignment = taCenter
        AutoSize = False
        Caption = #26816#26597#38388#38548
        Layout = tlCenter
      end
      object ComPort: TComboBox
        Left = 88
        Top = 8
        Width = 100
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 0
        OnChange = CBMeterTypeChange
      end
      object BaudRate: TComboBox
        Left = 272
        Top = 8
        Width = 100
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 1
        OnChange = CBMeterTypeChange
      end
      object ByteSize: TComboBox
        Left = 88
        Top = 36
        Width = 100
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 2
        OnChange = CBMeterTypeChange
      end
      object StopBits: TComboBox
        Left = 272
        Top = 36
        Width = 100
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 3
        OnChange = CBMeterTypeChange
      end
      object Parity: TComboBox
        Left = 88
        Top = 64
        Width = 100
        Height = 24
        Style = csDropDownList
        ItemHeight = 16
        TabOrder = 4
        OnChange = CBMeterTypeChange
      end
      object PollingDelay: TDBNumberEditEh
        Left = 272
        Top = 64
        Width = 100
        Height = 24
        Alignment = taLeftJustify
        DynProps = <>
        EditButton.Style = ebsUpDownEh
        EditButton.Visible = True
        EditButtons = <>
        Increment = 50.000000000000000000
        MaxValue = 9999.000000000000000000
        TabOrder = 5
        Value = 300.000000000000000000
        Visible = True
        OnChange = CBMeterTypeChange
        OnKeyPress = PollingDelayKeyPress
      end
    end
    object BitBtnApply: TBitBtn
      Left = 48
      Top = 327
      Width = 137
      Height = 40
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
      Left = 99
      Top = 138
      Width = 294
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
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
      Width = 97
      Height = 17
      Caption = #21551#29992#20202#34920
      TabOrder = 4
    end
    object MemoLog: TMemo
      Left = 408
      Top = 11
      Width = 321
      Height = 302
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object GBChange: TGroupBox
      Left = 408
      Top = 318
      Width = 249
      Height = 47
      Caption = #25968#25454#26174#31034#36827#21046
      TabOrder = 6
      object RBTen: TRadioButton
        Left = 32
        Top = 21
        Width = 80
        Height = 17
        Caption = #21313#36827#21046
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object RBSixteen: TRadioButton
        Left = 136
        Top = 21
        Width = 90
        Height = 17
        Caption = #21313#20845#36827#21046
        TabOrder = 1
      end
    end
    object CBMeterUnit: TComboBox
      Left = 124
      Top = 167
      Width = 70
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 7
      Items.Strings = (
        #20844#26020
        'KG'
        'kg'
        #21544
        'T'
        't')
    end
    object CBSoftUnit: TComboBox
      Left = 324
      Top = 167
      Width = 70
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 8
      OnChange = CBSoftUnitChange
      Items.Strings = (
        #20844'  '#26020
        'KG'
        'kg'
        #21544
        'T'
        't')
    end
    object LEMeterShowMode: TComboBox
      Left = 124
      Top = 194
      Width = 70
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 3
      ParentFont = False
      TabOrder = 9
      Text = '0.000'
      Items.Strings = (
        '0'
        '0.0'
        '0.00'
        '0.000')
    end
    object CBMeterDivide: TComboBox
      Left = 324
      Top = 194
      Width = 70
      Height = 24
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #23435#20307
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 10
      Text = '10'
      Items.Strings = (
        '1'
        '2'
        '5'
        '10'
        '20')
    end
    object CBScreen: TCheckBox
      Left = 136
      Top = 11
      Width = 161
      Height = 17
      Caption = #21516#26102#36755#20986#21040#22823#23631#24149
      TabOrder = 11
      OnClick = CBScreenClick
    end
    object GBDefine: TGroupBox
      Left = 19
      Top = 222
      Width = 374
      Height = 91
      Caption = #33258#23450#20041#20202#34920#36873#39033
      Color = clBtnFace
      ParentBackground = False
      ParentColor = False
      TabOrder = 12
      object LEStart: TLabeledEdit
        Left = 184
        Top = 25
        Width = 50
        Height = 24
        EditLabel.Width = 56
        EditLabel.Height = 16
        EditLabel.Caption = #36215#22987#20301' '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 0
        Text = '='
      end
      object LEGetFirst: TLabeledEdit
        Left = 312
        Top = 25
        Width = 50
        Height = 24
        EditLabel.Width = 56
        EditLabel.Height = 16
        EditLabel.Caption = #25130#21462#20301' '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 1
        Text = '1'
      end
      object CBQueue: TComboBox
        Left = 288
        Top = 55
        Width = 75
        Height = 24
        Style = csDropDownList
        Enabled = False
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 2
        Text = #27491#24207
        Items.Strings = (
          #27491#24207
          #21453#24207)
      end
      object LEDataLength: TLabeledEdit
        Left = 88
        Top = 55
        Width = 50
        Height = 24
        EditLabel.Width = 72
        EditLabel.Height = 16
        EditLabel.Caption = #25968#25454#38271#24230' '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 3
        Text = '7'
      end
      object LEPoint: TLabeledEdit
        Left = 216
        Top = 55
        Width = 50
        Height = 24
        EditLabel.Width = 56
        EditLabel.Height = 16
        EditLabel.Caption = #23567#25968#28857' '
        EditLabel.Transparent = True
        Enabled = False
        LabelPosition = lpLeft
        TabOrder = 4
        Text = '0'
      end
      object CBType: TComboBox
        Left = 21
        Top = 25
        Width = 92
        Height = 24
        Style = csDropDownList
        Enabled = False
        ItemHeight = 16
        ItemIndex = 0
        TabOrder = 5
        Text = 'ASCII'#30721
        Items.Strings = (
          'ASCII'#30721
          'BCD'#30721
          'HEX'#30721)
      end
    end
  end
  object SPAdvance: TRzSizePanel
    Left = 744
    Top = 60
    Width = 8
    Height = 387
    Align = alRight
    HotSpotVisible = True
    RealTimeDrag = True
    SizeBarWidth = 7
    TabOrder = 2
    HotSpotClosed = True
    HotSpotPosition = 343
    object SBSend: TSpeedButton
      Left = 269
      Top = 219
      Width = 60
      Height = 33
      Caption = #21457#36865
      OnClick = SBSendClick
    end
    object GBRemote: TGroupBox
      Left = 168
      Top = 16
      Width = 161
      Height = 193
      Caption = #36828#31243#20202#34920
      TabOrder = 0
      object CBUDP: TCheckBox
        Left = 17
        Top = 56
        Width = 131
        Height = 17
        Caption = #20174#36828#31243#35835#21462
        TabOrder = 0
        OnClick = CBUDPClick
      end
      object LEIP: TLabeledEdit
        Left = 16
        Top = 95
        Width = 129
        Height = 24
        EditLabel.Width = 64
        EditLabel.Height = 16
        EditLabel.Caption = 'IP'#22320#22336#12288
        TabOrder = 1
        Text = '192.168.1.151'
      end
      object LEPort: TLabeledEdit
        Left = 16
        Top = 143
        Width = 129
        Height = 24
        EditLabel.Width = 64
        EditLabel.Height = 16
        EditLabel.Caption = #31471#21475#21495#12288
        TabOrder = 2
        Text = '8888'
      end
      object CBAllowRemote: TCheckBox
        Left = 16
        Top = 32
        Width = 132
        Height = 17
        Caption = #20801#35768#36828#31243#35835#21462
        TabOrder = 3
        OnClick = CBAllowRemoteClick
      end
    end
    object CBAutoSend: TCheckBox
      Left = 171
      Top = 232
      Width = 86
      Height = 17
      Caption = #33258#21160#21457#36865
      TabOrder = 2
    end
    object RBAlways: TRadioButton
      Left = 16
      Top = 51
      Width = 89
      Height = 17
      Caption = #25345#32493#36755#20986
      Checked = True
      TabOrder = 3
      TabStop = True
    end
    object RBAfterSave: TRadioButton
      Left = 16
      Top = 75
      Width = 106
      Height = 17
      Caption = #20445#23384#21518#36755#20986
      TabOrder = 4
    end
    object CBScreenType: TComboBox
      Left = 16
      Top = 16
      Width = 129
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      ItemIndex = 0
      TabOrder = 5
      Text = #36755#20986#24403#21069#37325#37327
      Items.Strings = (
        #36755#20986#24403#21069#37325#37327
        #36755#20986#27611#37325
        #36755#20986#30382#37325
        #36755#20986#20928#37325
        #36755#20986#25187#37325
        #36755#20986#23454#37325
        #36755#20986#22791#29992'1'
        #36755#20986#22791#29992'2'
        #36755#20986#22791#29992'3'
        #36755#20986#22791#29992'4'
        #36755#20986#22791#29992'5'
        #36755#20986#22791#29992'6'
        #36755#20986#22791#29992'7'
        #36755#20986#22791#29992'8'
        #36755#20986#22791#29992'9'
        #36755#20986#22791#29992'10'
        #36755#20986#22791#29992'11'
        #36755#20986#22791#29992'12'
        #36755#20986#22791#29992'13'
        #36755#20986#22791#29992'14'
        #36755#20986#22791#29992'15'
        #36755#20986#22791#29992'16'
        #36755#20986#22791#29992'17'
        #36755#20986#22791#29992'18')
    end
    object EdtSend: TMemo
      Left = 15
      Top = 97
      Width = 141
      Height = 152
      Hint = #20165#25903#25345'16'#36827#21046#23383#31526#21457#36865
      ParentShowHint = False
      ScrollBars = ssVertical
      ShowHint = True
      TabOrder = 1
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
    DefaultPort = 8888
    OnUDPRead = IdUDPSUDPRead
    Left = 480
    Top = 16
  end
  object IdAntiFreeze1: TIdAntiFreeze
    OnlyWhenIdle = False
    Left = 552
    Top = 16
  end
  object TScreen: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TScreenTimer
    Left = 456
    Top = 136
  end
  object TUDPClient: TTimer
    Enabled = False
    OnTimer = TUDPClientTimer
    Left = 492
    Top = 185
  end
  object CommP: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM2'
    OnReceiveData = CommPReceiveData
    Left = 420
    Top = 185
  end
  object TTest: TTimer
    Enabled = False
    OnTimer = TTestTimer
    Left = 424
    Top = 236
  end
end
