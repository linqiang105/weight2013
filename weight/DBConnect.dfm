object DBConnectForm: TDBConnectForm
  Left = 482
  Top = 179
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #25968#25454#24211#36830#25509
  ClientHeight = 357
  ClientWidth = 331
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 89
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = #25968#25454#24211#22320#22336
    Transparent = False
    Layout = tlCenter
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 331
    Height = 41
    Align = alTop
    BevelInner = bvLowered
    BorderStyle = bsSingle
    Caption = #25968#25454#24211#35774#32622
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #23435#20307
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object PageControl: TPageControl
    Left = 0
    Top = 41
    Width = 331
    Height = 316
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      Caption = #21333#26426#25968#25454#24211
      object CBDefault: TCheckBox
        Left = 240
        Top = 16
        Width = 57
        Height = 17
        Caption = #40664#35748
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = CBDefaultClick
      end
      object RBAccess: TRadioButton
        Left = 24
        Top = 14
        Width = 113
        Height = 17
        Caption = #20351#29992
        Checked = True
        TabOrder = 8
        TabStop = True
        OnClick = RBAccessClick
      end
      object EdtDBPath: TMemo
        Left = 18
        Top = 39
        Width = 282
        Height = 58
        TabOrder = 1
      end
      object BtnFix: TBitBtn
        Left = 112
        Top = 198
        Width = 95
        Height = 75
        Caption = #20462#22797#25968#25454#24211
        TabOrder = 2
        OnClick = BtnFixClick
      end
      object BtnConn: TBitBtn
        Left = 10
        Top = 111
        Width = 95
        Height = 75
        Caption = #36830#25509#25968#25454#24211
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnConnClick
      end
      object BtnCompact: TBitBtn
        Left = 10
        Top = 198
        Width = 95
        Height = 75
        Caption = #21387#32553#25968#25454#24211
        TabOrder = 4
        OnClick = BtnCompactClick
      end
      object BtnCancel: TBitBtn
        Left = 214
        Top = 198
        Width = 95
        Height = 75
        Cancel = True
        Caption = #20851#38381
        TabOrder = 5
        OnClick = BtnCancelClick
      end
      object BitBtnTest: TBitBtn
        Left = 112
        Top = 111
        Width = 95
        Height = 75
        Caption = #27979#35797
        TabOrder = 6
        OnClick = BitBtnTestClick
      end
      object BitBtnSel: TBitBtn
        Left = 214
        Top = 111
        Width = 95
        Height = 75
        Caption = #36873#25321
        TabOrder = 7
        OnClick = BitBtnSelClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = #32593#32476#25968#25454#24211
      ImageIndex = 1
      OnShow = TabSheet2Show
      object lblIp: TLabel
        Left = 124
        Top = 2
        Width = 181
        Height = 21
        Alignment = taRightJustify
        AutoSize = False
        Caption = '127.0.0.1'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Transparent = True
        Layout = tlCenter
      end
      object RBSQL: TRadioButton
        Left = 22
        Top = 5
        Width = 86
        Height = 17
        Caption = #20351#29992
        TabOrder = 0
        OnClick = RBSQLClick
      end
      object BtnClose: TBitBtn
        Left = 232
        Top = 253
        Width = 75
        Height = 25
        Caption = #20851#38381
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 3
        OnClick = BtnCloseClick
      end
      object BtnCreate: TBitBtn
        Left = 16
        Top = 253
        Width = 80
        Height = 25
        Caption = #21019#24314#25968#25454#24211
        TabOrder = 2
        OnClick = BtnCreateClick
      end
      object GBFirst: TGroupBox
        Left = 16
        Top = 24
        Width = 289
        Height = 129
        Caption = #31532#19968#27493':'#35774#32622#25968#25454#24211#26381#21153#22120#21442#25968
        TabOrder = 4
        object Label2: TLabel
          Left = 8
          Top = 28
          Width = 129
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = #20027#26426#21517' '#25110' IP '#22320#22336
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 21
          Top = 49
          Width = 57
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = #29992#25143#21517
        end
        object Label5: TLabel
          Left = 139
          Top = 50
          Width = 57
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = #23494#30721
        end
        object EdtIp: TEdit
          Left = 139
          Top = 25
          Width = 134
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Text = '.'
        end
        object NTCheck: TCheckBox
          Left = 22
          Top = 98
          Width = 137
          Height = 21
          Caption = #38598#25104' Windows '#39564#35777
          TabOrder = 1
          OnClick = NTCheckClick
        end
        object EdtUser: TEdit
          Left = 22
          Top = 66
          Width = 120
          Height = 21
          TabOrder = 2
          Text = 'sa'
        end
        object EdtPass: TEdit
          Left = 150
          Top = 65
          Width = 120
          Height = 21
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          PasswordChar = '*'
          TabOrder = 3
        end
        object BtnConnect: TBitBtn
          Left = 193
          Top = 96
          Width = 80
          Height = 25
          Caption = #36830#25509#25968#25454#24211
          Default = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = #23435#20307
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnClick = BtnConnectClick
        end
      end
      object GBSecond: TGroupBox
        Left = 16
        Top = 156
        Width = 289
        Height = 92
        Caption = #31532#20108#27493':'#36873#25321#25968#25454#24211
        TabOrder = 5
        object Label3: TLabel
          Left = 10
          Top = 30
          Width = 63
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = #25968#25454#24211#21517
        end
        object CBDatabase: TComboBox
          Left = 72
          Top = 26
          Width = 201
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object BtnSave: TBitBtn
          Left = 193
          Top = 56
          Width = 80
          Height = 25
          Caption = #20445#23384#35774#32622
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnClick = BtnSaveClick
        end
      end
      object LocalBtn: TBitBtn
        Left = 104
        Top = 253
        Width = 120
        Height = 25
        Caption = #19968#38190#35774#32622#26412#22320#36830#25509
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = LocalBtnClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = #25968#25454#24211#25991#20214'|*.mdb'
    Left = 336
    Top = 8
  end
end
