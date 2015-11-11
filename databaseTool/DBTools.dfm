object DBToolForm: TDBToolForm
  Left = 487
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #25968#25454#24211#24037#20855' v1.21'
  ClientHeight = 284
  ClientWidth = 352
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
  object GroupBoxUser: TGroupBox
    Left = 0
    Top = 111
    Width = 352
    Height = 130
    Align = alClient
    Caption = #36830#25509
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LabelUser: TLabel
      Left = 38
      Top = 68
      Width = 70
      Height = 21
      AutoSize = False
      Caption = #30331#24405#21517'(&L)'#65306
      Color = clBtnFace
      Enabled = False
      FocusControl = EditUser
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      OnClick = LabelUserClick
    end
    object LabelPassword: TLabel
      Left = 38
      Top = 93
      Width = 70
      Height = 21
      AutoSize = False
      Caption = ' '#23494#30721'(&P)'#65306
      Color = clBtnFace
      Enabled = False
      FocusControl = EditPassword
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object EditUser: TEdit
      Left = 121
      Top = 68
      Width = 208
      Height = 21
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'sa'
    end
    object EditPassword: TEdit
      Left = 121
      Top = 93
      Width = 208
      Height = 21
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 1
    end
    object NTCheck: TRadioButton
      Left = 24
      Top = 24
      Width = 170
      Height = 17
      Caption = #20351#29992'Windows '#36523#20221#39564#35777'(&W)'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = True
      OnClick = NTCheckClick
    end
    object SQLCheck: TRadioButton
      Left = 24
      Top = 48
      Width = 170
      Height = 17
      Caption = #20351#29992'SQL '#36523#20221#39564#35777'(&Q)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = SQLCheckClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 352
    Height = 55
    Align = alTop
    Caption = #36830#25509#20449#24687
    TabOrder = 1
    object LabelIP: TLabel
      Left = 12
      Top = 20
      Width = 85
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = 'SQL '#26381#21153#22120#65306
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
    object BjBtn: TBitBtn
      Left = 281
      Top = 20
      Width = 60
      Height = 21
      Caption = #26412#26426
      TabOrder = 0
      OnClick = BjBtnClick
    end
    object LoginName: TComboBox
      Left = 104
      Top = 20
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 253
      Top = 20
      Width = 25
      Height = 21
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn3Click
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 241
    Width = 352
    Height = 43
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object ConnectionBtn: TBitBtn
      Left = 10
      Top = 8
      Width = 80
      Height = 25
      Caption = #36830#25509#25968#25454#24211
      TabOrder = 0
      OnClick = ConnectionBtnClick
    end
    object AttachBtn: TBitBtn
      Left = 92
      Top = 8
      Width = 80
      Height = 25
      Caption = #38468#21152#25968#25454#24211
      Default = True
      Enabled = False
      TabOrder = 1
      OnClick = AttachBtnClick
    end
    object DetchBtn: TBitBtn
      Left = 174
      Top = 8
      Width = 80
      Height = 25
      Caption = #21387#32553'/'#20998#31163#24211
      Enabled = False
      TabOrder = 2
      OnClick = DetchBtnClick
    end
    object SetPasBtn: TBitBtn
      Left = 256
      Top = 8
      Width = 80
      Height = 25
      Caption = #35774#32622#23494#30721
      Enabled = False
      TabOrder = 3
      OnClick = SetPasBtnClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 55
    Width = 352
    Height = 56
    Align = alTop
    Caption = #25968#25454#24211#23646#24615
    TabOrder = 3
    object Label1: TLabel
      Left = 12
      Top = 20
      Width = 85
      Height = 21
      Alignment = taCenter
      AutoSize = False
      Caption = #30331#24405#27169#24335#65306
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
    object LoginMode: TComboBox
      Left = 104
      Top = 20
      Width = 169
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Items.Strings = (
        '1 '#20165'Windows'#39564#35777#26041#24335
        '2 '#28151#21512#39564#35777#27169#24335)
    end
    object BitBtn1: TBitBtn
      Left = 281
      Top = 20
      Width = 60
      Height = 21
      Caption = #35774#32622
      TabOrder = 1
      OnClick = BitBtn1Click
    end
  end
end
