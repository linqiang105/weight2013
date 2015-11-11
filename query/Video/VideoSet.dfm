object VideoSetForm: TVideoSetForm
  Left = 290
  Top = 212
  BorderStyle = bsDialog
  Caption = #35270#39057#35774#32622
  ClientHeight = 314
  ClientWidth = 531
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
  object Label1: TLabel
    Left = 16
    Top = 14
    Width = 89
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #35270#39057#21345#31867#22411
  end
  object Label2: TLabel
    Left = 300
    Top = 14
    Width = 61
    Height = 13
    AutoSize = False
    Caption = #26174#31034#27169#24335
  end
  object BitBtnOK: TBitBtn
    Left = 328
    Top = 256
    Width = 75
    Height = 33
    Caption = #30830#23450
    Default = True
    TabOrder = 0
    OnClick = BitBtnOKClick
  end
  object BitBtnCancel: TBitBtn
    Left = 424
    Top = 256
    Width = 75
    Height = 33
    Cancel = True
    Caption = #21462#28040
    TabOrder = 1
    OnClick = BitBtnCancelClick
  end
  object CBVideoType: TComboBox
    Left = 112
    Top = 10
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 2
    Text = 'III'#20195#35270#39057#27169#22359'-----ATW7800'
    Items.Strings = (
      'I'#20195#35270#39057#21345'----------ATW104'
      'II'#20195#35270#39057#21345'---------ATW4000'
      'III'#20195#35270#39057#27169#22359'-----ATW7800')
  end
  object GBRecorder: TGroupBox
    Left = 16
    Top = 171
    Width = 257
    Height = 118
    Caption = #24405#20687#26426#21442#25968
    TabOrder = 3
    object LEIp: TLabeledEdit
      Left = 16
      Top = 40
      Width = 100
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'IP'#22320#22336#12288#12288
      TabOrder = 0
    end
    object LEPort: TLabeledEdit
      Left = 16
      Top = 80
      Width = 100
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #31471#21475#12288#12288
      TabOrder = 1
    end
    object LEUser: TLabeledEdit
      Left = 136
      Top = 40
      Width = 100
      Height = 21
      EditLabel.Width = 60
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517#12288#12288
      TabOrder = 2
    end
    object LEPass: TLabeledEdit
      Left = 136
      Top = 80
      Width = 100
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721#12288#12288
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object GBLogo: TGroupBox
    Left = 280
    Top = 40
    Width = 233
    Height = 209
    Caption = #25991#23383
    TabOrder = 4
    object CBShowDate: TCheckBox
      Left = 16
      Top = 24
      Width = 97
      Height = 17
      Caption = #26174#31034#26085#26399' '
      TabOrder = 0
    end
    object CBShowTime: TCheckBox
      Left = 16
      Top = 75
      Width = 97
      Height = 17
      Caption = #26174#31034#26102#38388
      TabOrder = 1
    end
    object CBShowLogo: TCheckBox
      Left = 16
      Top = 125
      Width = 97
      Height = 17
      Caption = #26174#31034'Logo'
      TabOrder = 2
    end
    object LEDateX: TLabeledEdit
      Left = 72
      Top = 47
      Width = 40
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #27178#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 3
      Text = '10'
    end
    object LEDateY: TLabeledEdit
      Left = 176
      Top = 47
      Width = 40
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #32437#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 4
      Text = '10'
    end
    object LETimeX: TLabeledEdit
      Left = 72
      Top = 98
      Width = 40
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #27178#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 5
      Text = '100'
    end
    object LETimeY: TLabeledEdit
      Left = 176
      Top = 98
      Width = 40
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #32437#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 6
      Text = '10'
    end
    object LELogoX: TLabeledEdit
      Left = 72
      Top = 149
      Width = 40
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #27178#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 7
      Text = '30'
    end
    object LELogoY: TLabeledEdit
      Left = 176
      Top = 149
      Width = 40
      Height = 21
      EditLabel.Width = 48
      EditLabel.Height = 13
      EditLabel.Caption = #32437#22352#26631#12288
      LabelPosition = lpLeft
      TabOrder = 8
      Text = '10'
    end
    object EdtLogo: TEdit
      Left = 16
      Top = 176
      Width = 201
      Height = 21
      TabOrder = 9
    end
  end
  object GBParam: TGroupBox
    Left = 16
    Top = 40
    Width = 257
    Height = 129
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
      Top = 48
      Width = 120
      Height = 17
      Caption = #21551#29992'2'#36335#35270#39057
      TabOrder = 1
    end
    object CBUse3: TCheckBox
      Left = 16
      Top = 72
      Width = 120
      Height = 17
      Caption = #21551#29992'3'#36335#35270#39057
      TabOrder = 2
    end
    object CBUse4: TCheckBox
      Left = 16
      Top = 96
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
        '4#'#25509#21475)
    end
    object CBVideo2: TComboBox
      Left = 144
      Top = 46
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
        '4#'#25509#21475)
    end
    object CBVideo3: TComboBox
      Left = 144
      Top = 70
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
        '4#'#25509#21475)
    end
    object CBVideo4: TComboBox
      Left = 144
      Top = 94
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
        '4#'#25509#21475)
    end
  end
  object CBDisplayType: TComboBox
    Left = 368
    Top = 10
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 2
    TabOrder = 6
    Text = 'PCI-E'#26174#21345
    Items.Strings = (
      #38598#25104#26174#21345
      'AGP'#26174#21345
      'PCI-E'#26174#21345
      'OFFSCREEN')
  end
end
