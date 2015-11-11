object MailForm: TMailForm
  Left = 358
  Top = 220
  BorderStyle = bsDialog
  Caption = #37038#20214#21457#36865
  ClientHeight = 261
  ClientWidth = 597
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PBSend: TProgressBar
    Left = 0
    Top = 245
    Width = 597
    Height = 16
    Align = alBottom
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 597
    Height = 245
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object lblMemo: TLabel
      Left = 304
      Top = 43
      Width = 39
      Height = 13
      Caption = #27491#25991#12288
    end
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 83
      Height = 16
      AutoSize = False
      Caption = #37038#20214#26381#21153#22120'  '
    end
    object lblReportType: TLabel
      Left = 296
      Top = 163
      Width = 80
      Height = 13
      Caption = #25253#34920#31867#22411'    '
    end
    object BtnSend: TBitBtn
      Left = 448
      Top = 197
      Width = 115
      Height = 35
      Caption = #21457#36865
      TabOrder = 0
      OnClick = BtnSendClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object LEUser: TLabeledEdit
      Left = 112
      Top = 45
      Width = 169
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #29992#25143#21517#12288
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object LEPass: TLabeledEdit
      Left = 112
      Top = 74
      Width = 169
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #23494#30721#12288
      LabelPosition = lpLeft
      PasswordChar = '*'
      TabOrder = 2
    end
    object LEReceive: TLabeledEdit
      Left = 112
      Top = 102
      Width = 169
      Height = 21
      EditLabel.Width = 52
      EditLabel.Height = 13
      EditLabel.Caption = #25910#20214#20154#12288
      LabelPosition = lpLeft
      TabOrder = 3
    end
    object LETitle: TLabeledEdit
      Left = 352
      Top = 14
      Width = 225
      Height = 21
      EditLabel.Width = 39
      EditLabel.Height = 13
      EditLabel.Caption = #26631#39064#12288
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object MemoBody: TMemo
      Left = 352
      Top = 43
      Width = 225
      Height = 102
      ScrollBars = ssVertical
      TabOrder = 5
    end
    object BtnSave: TBitBtn
      Left = 312
      Top = 197
      Width = 115
      Height = 35
      Caption = #20445#23384#35774#32622
      TabOrder = 6
      OnClick = BtnSaveClick
      Glyph.Data = {
        F2010000424DF201000000000000760000002800000024000000130000000100
        0400000000007C01000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
        3333333333388F3333333333000033334224333333333333338338F333333333
        0000333422224333333333333833338F33333333000033422222243333333333
        83333338F3333333000034222A22224333333338F33F33338F33333300003222
        A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
        38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
        2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
        0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
        333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
        33333A2224A2233333333338F338F83300003333333333A2224A333333333333
        8F338F33000033333333333A222433333333333338F338F30000333333333333
        A224333333333333338F38F300003333333333333A223333333333333338F8F3
        000033333333333333A3333333333333333383330000}
      NumGlyphs = 2
    end
    object LEHost: TComboBox
      Left = 112
      Top = 12
      Width = 169
      Height = 21
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 7
      Text = 'smtp.qq.com'
      Items.Strings = (
        'smtp.qq.com'
        'smtp.163.com'
        'smtp.126.com'
        'smtp.sina.com.cn'
        'smtp.mail.yahoo.com'
        'smtp.sohu.com'
        '')
    end
    object GBSendOption: TGroupBox
      Left = 16
      Top = 136
      Width = 265
      Height = 97
      Caption = #23450#26102#21457#36865#36873#39033
      TabOrder = 8
      object RBEveryDay: TRadioButton
        Left = 16
        Top = 48
        Width = 137
        Height = 17
        Caption = #27599#22825#23450#26102#21457#36865
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object DTPSend: TDateTimePicker
        Left = 160
        Top = 43
        Width = 81
        Height = 21
        Date = 41366.000000000000000000
        Time = 41366.000000000000000000
        Kind = dtkTime
        TabOrder = 1
      end
      object RBEveryHour: TRadioButton
        Left = 16
        Top = 72
        Width = 233
        Height = 17
        Caption = #27599#23567#26102#33258#21160#21457#36865
        TabOrder = 2
        TabStop = True
      end
      object CBAutoSend: TCheckBox
        Left = 18
        Top = 24
        Width = 223
        Height = 17
        Caption = #33258#21160#21457#36865
        TabOrder = 3
      end
    end
    object CBReportType: TComboBox
      Left = 368
      Top = 160
      Width = 209
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 9
      Text = #26085#26126#32454#25253#34920
      Items.Strings = (
        #26085#26126#32454#25253#34920
        #21608#26126#32454#25253#34920
        #26376#26126#32454#25253#34920
        #24180#26126#32454#25253#34920)
    end
    object DBGridEhMail: TDBGridEh
      Left = 370
      Top = 58
      Width = 175
      Height = 71
      ColumnDefValues.Title.TitleButton = True
      DynProps = <>
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      FooterRowCount = 1
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      ParentShowHint = False
      RowSizingAllowed = True
      ShowHint = False
      SortLocal = True
      SumList.Active = True
      TabOrder = 10
      Visible = False
      Columns = <
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #24207#21495
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #27969#27700#21495
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtCount
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #36710#21495
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #36807#30917#31867#22411
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #21457#36135#21333#20301
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #25910#36135#21333#20301
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #36135#21517
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #35268#26684
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #27611#37325
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #30382#37325
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #20928#37325
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #25187#37325
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #23454#37325
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #21333#20215
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #37329#39069
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #25240#26041#31995#25968
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #26041#37327
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #36807#30917#36153
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #27611#37325#21496#30917#21592
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #30382#37325#21496#30917#21592
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #27611#37325#30917#21495
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #30382#37325#30917#21495
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #27611#37325#26102#38388
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #30382#37325#26102#38388
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #19968#27425#36807#30917#26102#38388
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #20108#27425#36807#30917#26102#38388
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #26356#26032#20154
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #26356#26032#26102#38388
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#27880
          Footers = <>
          Title.Alignment = taCenter
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #25171#21360#27425#25968
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #19978#20256#21542
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'1'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'2'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'3'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'4'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'5'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'6'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'7'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'8'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'9'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'10'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'11'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'12'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'13'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'14'
          Footers = <>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'15'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'16'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'17'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #22791#29992'18'
          Footers = <
            item
              Alignment = taCenter
              ValueType = fvtSum
            end>
          Title.Alignment = taCenter
          Visible = False
          Width = 80
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object TSend: TTimer
    Enabled = False
    OnTimer = TSendTimer
    Left = 320
    Top = 290
  end
  object TMail: TTimer
    OnTimer = TMailTimer
    Left = 272
    Top = 288
  end
end
