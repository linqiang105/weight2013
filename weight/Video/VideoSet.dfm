object VideoSetForm: TVideoSetForm
  Left = 222
  Top = 165
  BorderStyle = bsDialog
  Caption = #35270#39057#35774#32622
  ClientHeight = 473
  ClientWidth = 909
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 15
    Width = 135
    Height = 13
    Caption = #35270#39057#21345#31867#22411'          '
    Layout = tlCenter
  end
  object Label2: TLabel
    Left = 316
    Top = 16
    Width = 108
    Height = 13
    Caption = #26174#31034#27169#24335'        '
    Layout = tlCenter
  end
  object SBRecordAddrSet: TSpeedButton
    Left = 864
    Top = 12
    Width = 25
    Height = 24
    Caption = '..'
    OnClick = SBRecordAddrSetClick
  end
  object BitBtnOK: TBitBtn
    Left = 720
    Top = 410
    Width = 80
    Height = 41
    Caption = #30830#23450
    Default = True
    TabOrder = 0
    OnClick = BitBtnOKClick
  end
  object BitBtnCancel: TBitBtn
    Left = 808
    Top = 410
    Width = 80
    Height = 41
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object CBVideoType: TComboBox
    Left = 112
    Top = 12
    Width = 193
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
    OnChange = CBVideoTypeChange
    Items.Strings = (
      '1'#20195#65293#65293'ATW104'
      '2'#20195#65293#65293'ATW4000'
      '3'#20195#65293#65293'ATW7800'
      '4'#20195#65293#65293'ATW3100'
      '5'#20195#65293#65293'IPC')
  end
  object GBRecorder: TGroupBox
    Left = 616
    Top = 48
    Width = 273
    Height = 161
    Caption = #24405#20687#26426#21442#25968
    TabOrder = 3
    object LEIp: TLabeledEdit
      Left = 88
      Top = 24
      Width = 169
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = 'IP'#22320#22336#12288#12288
      LabelPosition = lpLeft
      TabOrder = 0
      Text = '192.168.1.64'
    end
    object LEPort: TLabeledEdit
      Left = 88
      Top = 57
      Width = 169
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #31471#21475#12288#12288
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '8000'
    end
    object LEUser: TLabeledEdit
      Left = 88
      Top = 91
      Width = 169
      Height = 21
      EditLabel.Width = 65
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517#12288#12288
      LabelPosition = lpLeft
      TabOrder = 2
      Text = 'admin'
    end
    object LEPass: TLabeledEdit
      Left = 88
      Top = 124
      Width = 169
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721#12288#12288
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 3
      Text = '12345'
    end
  end
  object GBLogo: TGroupBox
    Left = 280
    Top = 48
    Width = 329
    Height = 161
    Caption = 'I'#20195#35270#39057#21345#25991#23383#21442#25968
    TabOrder = 4
    object CBShowDate: TCheckBox
      Left = 16
      Top = 27
      Width = 97
      Height = 17
      Caption = #26174#31034#26085#26399' '
      TabOrder = 0
    end
    object CBShowTime: TCheckBox
      Left = 16
      Top = 62
      Width = 97
      Height = 17
      Caption = #26174#31034#26102#38388
      TabOrder = 1
    end
    object CBShowLogo: TCheckBox
      Left = 16
      Top = 96
      Width = 97
      Height = 17
      Caption = #26174#31034'Logo'
      TabOrder = 2
    end
    object LEDateX: TLabeledEdit
      Left = 166
      Top = 23
      Width = 40
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #27178#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 3
      Text = '10'
    end
    object LEDateY: TLabeledEdit
      Left = 272
      Top = 23
      Width = 45
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #32437#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 4
      Text = '10'
    end
    object LETimeX: TLabeledEdit
      Left = 166
      Top = 58
      Width = 40
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #27178#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 5
      Text = '100'
    end
    object LETimeY: TLabeledEdit
      Left = 272
      Top = 58
      Width = 45
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #32437#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 6
      Text = '10'
    end
    object LELogoX: TLabeledEdit
      Left = 166
      Top = 92
      Width = 40
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #27178#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 7
      Text = '30'
    end
    object LELogoY: TLabeledEdit
      Left = 272
      Top = 92
      Width = 45
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #32437#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 8
      Text = '10'
    end
    object EdtLogo: TEdit
      Left = 15
      Top = 123
      Width = 301
      Height = 21
      TabOrder = 9
    end
  end
  object GBParam: TGroupBox
    Left = 16
    Top = 48
    Width = 257
    Height = 161
    Caption = #21442#25968
    TabOrder = 5
    object CBUse1: TCheckBox
      Left = 16
      Top = 24
      Width = 120
      Height = 17
      Caption = #21551#29992'1'#36335#35270#39057
      TabOrder = 0
    end
    object CBUse2: TCheckBox
      Left = 16
      Top = 59
      Width = 120
      Height = 17
      Caption = #21551#29992'2'#36335#35270#39057
      TabOrder = 1
    end
    object CBUse3: TCheckBox
      Left = 16
      Top = 93
      Width = 120
      Height = 17
      Caption = #21551#29992'3'#36335#35270#39057
      TabOrder = 2
    end
    object CBUse4: TCheckBox
      Left = 16
      Top = 128
      Width = 120
      Height = 17
      Caption = #21551#29992'4'#36335#35270#39057
      TabOrder = 3
    end
    object CBVideo1: TComboBox
      Left = 144
      Top = 22
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 4
      Text = '1#'#25509#21475
      Items.Strings = (
        '1#'#25509#21475
        '2#'#25509#21475
        '3#'#25509#21475
        '4#'#25509#21475
        '5#'#25509#21475
        '6#'#25509#21475
        '7#'#25509#21475
        '8#'#25509#21475)
    end
    object CBVideo2: TComboBox
      Left = 144
      Top = 57
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 1
      TabOrder = 5
      Text = '2#'#25509#21475
      Items.Strings = (
        '1#'#25509#21475
        '2#'#25509#21475
        '3#'#25509#21475
        '4#'#25509#21475
        '5#'#25509#21475
        '6#'#25509#21475
        '7#'#25509#21475
        '8#'#25509#21475)
    end
    object CBVideo3: TComboBox
      Left = 144
      Top = 91
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 2
      TabOrder = 6
      Text = '3#'#25509#21475
      Items.Strings = (
        '1#'#25509#21475
        '2#'#25509#21475
        '3#'#25509#21475
        '4#'#25509#21475
        '5#'#25509#21475
        '6#'#25509#21475
        '7#'#25509#21475
        '8#'#25509#21475)
    end
    object CBVideo4: TComboBox
      Left = 144
      Top = 126
      Width = 100
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 3
      TabOrder = 7
      Text = '4#'#25509#21475
      Items.Strings = (
        '1#'#25509#21475
        '2#'#25509#21475
        '3#'#25509#21475
        '4#'#25509#21475
        '5#'#25509#21475
        '6#'#25509#21475
        '7#'#25509#21475
        '8#'#25509#21475)
    end
  end
  object CBDisplayType: TComboBox
    Left = 392
    Top = 12
    Width = 129
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 3
    TabOrder = 6
    Text = 'OFFSCREEN'
    Items.Strings = (
      #38598#25104#26174#21345
      'AGP'#26174#21345
      'PCI-E'#26174#21345
      'OFFSCREEN')
  end
  object GBNV1: TGroupBox
    Left = 16
    Top = 216
    Width = 433
    Height = 89
    Caption = '1#'#32593#32476#25668#20687#22836
    TabOrder = 7
    object lblType1: TLabel
      Left = 16
      Top = 24
      Width = 103
      Height = 13
      Caption = 'IPC'#22411#21495'        '
    end
    object CBType1: TComboBox
      Left = 16
      Top = 50
      Width = 60
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #28023#24247
      OnChange = CBType1Change
      Items.Strings = (
        #28023#24247
        #22823#21326)
    end
    object LEIP1: TLabeledEdit
      Left = 147
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'IP'#22320#22336' '
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '192.168.1.100'
    end
    object LEPort1: TLabeledEdit
      Left = 323
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #31471#21475' '
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '8000'
    end
    object LEUser1: TLabeledEdit
      Left = 147
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517' '
      LabelPosition = lpLeft
      TabOrder = 3
      Text = 'admin'
    end
    object LEPass1: TLabeledEdit
      Left = 323
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721' '
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 4
      Text = '12345'
    end
  end
  object GBNV2: TGroupBox
    Left = 456
    Top = 216
    Width = 433
    Height = 89
    Caption = '2#'#32593#32476#25668#20687#22836
    TabOrder = 8
    object lblType2: TLabel
      Left = 16
      Top = 24
      Width = 103
      Height = 13
      Caption = 'IPC'#22411#21495'        '
    end
    object CBType2: TComboBox
      Left = 16
      Top = 50
      Width = 60
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #28023#24247
      OnChange = CBType2Change
      Items.Strings = (
        #28023#24247
        #22823#21326)
    end
    object LEIP2: TLabeledEdit
      Left = 147
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'IP'#22320#22336' '
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '192.168.1.101'
    end
    object LEPort2: TLabeledEdit
      Left = 323
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #31471#21475' '
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '8000'
    end
    object LEUser2: TLabeledEdit
      Left = 147
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517' '
      LabelPosition = lpLeft
      TabOrder = 3
      Text = 'admin'
    end
    object LEPass2: TLabeledEdit
      Left = 323
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721' '
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 4
      Text = '12345'
    end
  end
  object GBNV3: TGroupBox
    Left = 16
    Top = 312
    Width = 433
    Height = 89
    Caption = '3#'#32593#32476#25668#20687#22836
    TabOrder = 9
    object lblType3: TLabel
      Left = 16
      Top = 24
      Width = 103
      Height = 13
      Caption = 'IPC'#22411#21495'        '
    end
    object CBType3: TComboBox
      Left = 16
      Top = 50
      Width = 60
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #28023#24247
      OnChange = CBType3Change
      Items.Strings = (
        #28023#24247
        #22823#21326)
    end
    object LEIP3: TLabeledEdit
      Left = 147
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'IP'#22320#22336' '
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '192.168.1.102'
    end
    object LEPort3: TLabeledEdit
      Left = 323
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #31471#21475' '
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '8000'
    end
    object LEUser3: TLabeledEdit
      Left = 147
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517' '
      LabelPosition = lpLeft
      TabOrder = 3
      Text = 'admin'
    end
    object LEPass3: TLabeledEdit
      Left = 323
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721' '
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 4
      Text = '12345'
    end
  end
  object GBNV4: TGroupBox
    Left = 456
    Top = 312
    Width = 433
    Height = 89
    Caption = '4#'#32593#32476#25668#20687#22836
    TabOrder = 10
    object lblType4: TLabel
      Left = 16
      Top = 24
      Width = 103
      Height = 13
      Caption = 'IPC'#22411#21495'        '
    end
    object CBType4: TComboBox
      Left = 16
      Top = 50
      Width = 60
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = #28023#24247
      OnChange = CBType4Change
      Items.Strings = (
        #28023#24247
        #22823#21326)
    end
    object LEIP4: TLabeledEdit
      Left = 147
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 47
      EditLabel.Height = 13
      EditLabel.Caption = 'IP'#22320#22336' '
      LabelPosition = lpLeft
      TabOrder = 1
      Text = '192.168.1.103'
    end
    object LEPort4: TLabeledEdit
      Left = 323
      Top = 21
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #31471#21475' '
      LabelPosition = lpLeft
      TabOrder = 2
      Text = '8000'
    end
    object LEUser4: TLabeledEdit
      Left = 147
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 46
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517' '
      LabelPosition = lpLeft
      TabOrder = 3
      Text = 'admin'
    end
    object LEPass4: TLabeledEdit
      Left = 323
      Top = 53
      Width = 100
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721' '
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 4
      Text = '12345'
    end
  end
  object CBUseRecord: TCheckBox
    Left = 536
    Top = 12
    Width = 91
    Height = 24
    Caption = #21551#29992#24405#20687
    TabOrder = 11
  end
  object EdtRecordAddr: TEdit
    Left = 632
    Top = 12
    Width = 225
    Height = 21
    Hint = #24405#20687#25991#20214#23384#25918#22320#22336
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 12
    Text = 'D:\Record\'
  end
  object GBPicText: TGroupBox
    Left = 16
    Top = 408
    Width = 697
    Height = 41
    Caption = #22270#29255#21472#21152#25991#23383
    TabOrder = 13
    object CBUsePicText: TCheckBox
      Left = 8
      Top = 16
      Width = 80
      Height = 17
      Caption = #21551#29992
      TabOrder = 0
    end
    object CBShowCar: TCheckBox
      Left = 91
      Top = 16
      Width = 80
      Height = 17
      Caption = #36710#21495
      TabOrder = 1
    end
    object CBShowFaHuo: TCheckBox
      Left = 174
      Top = 16
      Width = 80
      Height = 17
      Caption = #21457#36135#21333#20301
      TabOrder = 2
    end
    object CBShowShouHuo: TCheckBox
      Left = 257
      Top = 16
      Width = 80
      Height = 17
      Caption = #25910#36135#21333#20301
      TabOrder = 3
    end
    object CBShowGoods: TCheckBox
      Left = 340
      Top = 16
      Width = 80
      Height = 17
      Caption = #36135#21517
      TabOrder = 4
    end
    object CBShowSpec: TCheckBox
      Left = 423
      Top = 16
      Width = 80
      Height = 17
      Caption = #35268#26684
      TabOrder = 5
    end
    object CBShowGross: TCheckBox
      Left = 506
      Top = 16
      Width = 60
      Height = 17
      Caption = #27611#37325
      TabOrder = 6
    end
    object CBShowTare: TCheckBox
      Left = 569
      Top = 16
      Width = 60
      Height = 17
      Caption = #30382#37325
      TabOrder = 7
    end
    object CBShowNet: TCheckBox
      Left = 632
      Top = 16
      Width = 60
      Height = 17
      Caption = #20928#37325
      TabOrder = 8
    end
  end
end
