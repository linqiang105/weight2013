object ComOutputForm: TComOutputForm
  Left = 386
  Top = 257
  BorderStyle = bsDialog
  Caption = #20018#21475#36755#20986
  ClientHeight = 161
  ClientWidth = 531
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCom1: TPanel
    Left = 0
    Top = 0
    Width = 265
    Height = 161
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 0
    object GBCom1Set: TGroupBox
      Left = 12
      Top = 10
      Width = 237
      Height = 63
      Caption = '1# '#36755#20986#20018#21475#35774#32622
      TabOrder = 0
      object Label21: TLabel
        Left = 7
        Top = 16
        Width = 66
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #20018#21475#21495
        Layout = tlCenter
      end
      object Label22: TLabel
        Left = 80
        Top = 16
        Width = 65
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #27874#29305#29575
        Layout = tlCenter
      end
      object Label1: TLabel
        Left = 155
        Top = 16
        Width = 65
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #20256#36755#39057#29575
        Layout = tlCenter
      end
      object ComOpen1: TCheckBox
        Left = 178
        Top = 0
        Width = 49
        Height = 16
        Caption = #25171#24320
        TabOrder = 0
        OnClick = ComOpen1Click
      end
      object DPBaudRate1: TComboBox
        Left = 80
        Top = 36
        Width = 65
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '1200'
        Items.Strings = (
          '1200'
          '2400'
          '4800'
          '9600'
          '19200'
          '38400')
      end
      object DPPortName1: TComboBox
        Left = 7
        Top = 36
        Width = 65
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
      object SpeedSpin1: TSpinEdit
        Left = 155
        Top = 35
        Width = 65
        Height = 22
        Increment = 10
        MaxValue = 1000
        MinValue = 50
        TabOrder = 3
        Value = 500
      end
    end
    object GBDevice1: TGroupBox
      Left = 12
      Top = 75
      Width = 237
      Height = 68
      Caption = '1# '#36755#20986#35774#22791#36873#25321
      TabOrder = 1
      object Label5: TLabel
        Left = 8
        Top = 18
        Width = 57
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #36755#20986#27425#25968
        Layout = tlCenter
      end
      object Label6: TLabel
        Left = 80
        Top = 18
        Width = 145
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #35774#22791#21517#31216
        Layout = tlCenter
      end
      object OutEquipment1: TComboBox
        Left = 80
        Top = 35
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '1'#12289#32768#21326#22823#23631#24149
          '2'#12289#25176#21147#22810'8142'#26684#24335
          '3'#12289#22266#23450'8142'#26684#24335
          '4'#12289#24425#20449#22823#23631#24149)
      end
      object OutSpin1: TSpinEdit
        Left = 8
        Top = 35
        Width = 65
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
    end
  end
  object Panel2: TPanel
    Left = 265
    Top = 0
    Width = 266
    Height = 161
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object GBCom2Set: TGroupBox
      Left = 12
      Top = 10
      Width = 237
      Height = 63
      Caption = '2# '#36755#20986#20018#21475#35774#32622
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 16
        Width = 66
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #20018#21475#21495
        Layout = tlCenter
      end
      object Label3: TLabel
        Left = 80
        Top = 16
        Width = 65
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #27874#29305#29575
        Layout = tlCenter
      end
      object Label4: TLabel
        Left = 155
        Top = 16
        Width = 65
        Height = 17
        Alignment = taCenter
        AutoSize = False
        Caption = #20256#36755#39057#29575
        Layout = tlCenter
      end
      object ComOpen2: TCheckBox
        Left = 178
        Top = 0
        Width = 49
        Height = 16
        Caption = #25171#24320
        TabOrder = 0
        OnClick = ComOpen2Click
      end
      object DPBaudRate2: TComboBox
        Left = 80
        Top = 36
        Width = 65
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = '1200'
        Items.Strings = (
          '1200'
          '2400'
          '4800'
          '9600'
          '19200'
          '38400')
      end
      object DPPortName2: TComboBox
        Left = 7
        Top = 36
        Width = 65
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
      object SpeedSpin2: TSpinEdit
        Left = 155
        Top = 35
        Width = 65
        Height = 22
        Increment = 10
        MaxValue = 1000
        MinValue = 50
        TabOrder = 3
        Value = 500
      end
    end
    object GBDevice2: TGroupBox
      Left = 12
      Top = 75
      Width = 237
      Height = 65
      Caption = '2# '#36755#20986#35774#22791#36873#25321
      TabOrder = 1
      object Label7: TLabel
        Left = 80
        Top = 18
        Width = 145
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #35774#22791#21517#31216
        Layout = tlCenter
      end
      object Label8: TLabel
        Left = 8
        Top = 18
        Width = 57
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = #36755#20986#27425#25968
        Layout = tlCenter
      end
      object OutEquipment2: TComboBox
        Left = 80
        Top = 35
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '1'#12289#32768#21326#22823#23631#24149
          '2'#12289#25176#21147#22810'8142'#26684#24335
          '3'#12289#22266#23450'8142'#26684#24335
          '4'#12289#24425#20449#22823#23631#24149)
      end
      object OutSpin2: TSpinEdit
        Left = 8
        Top = 35
        Width = 65
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
    end
  end
  object XK3190Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = XK3190Timer1Timer
    Left = 112
    Top = 192
  end
  object CPDOut1: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM2'
    BaudRate = brCustom
    OutBufSize = 8192
    PollingDelay = 200
    Left = 16
    Top = 168
  end
  object T8142ProTimer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = T8142ProTimer1Timer
    Left = 200
    Top = 192
  end
  object XK3190Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = XK3190Timer2Timer
    Left = 400
    Top = 192
  end
  object CPDOut2: TCommPortDriver
    Port = pnCustom
    PortName = '\\.\COM2'
    BaudRate = brCustom
    PollingDelay = 100
    Left = 304
    Top = 176
  end
  object T8142Pro_addTimer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = T8142Pro_addTimer1Timer
    Left = 112
    Top = 272
  end
  object XK315ATimer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = XK315ATimer1Timer
    Left = 216
    Top = 272
  end
end
