object TaoForm: TTaoForm
  Left = 291
  Top = 93
  Width = 807
  Height = 633
  Caption = #22871#34920
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
  object DBGridEhTao: TDBGridEh
    Left = 0
    Top = 193
    Width = 799
    Height = 413
    Align = alClient
    AutoFitColWidths = True
    DynProps = <>
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = DBGridEhTaoDblClick
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36710#21495
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #21457#36135#21333#20301
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #25910#36135#21333#20301
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36135#21517
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #35268#26684
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'1'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'2'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'3'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'4'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'5'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'10'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'11'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'12'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'13'
        Footers = <>
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'14'
        Footers = <>
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 799
    Height = 193
    Align = alTop
    BevelOuter = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    object lblCar: TLabel
      Left = 16
      Top = 11
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #36710#21495#12288
      Layout = tlCenter
    end
    object lblFaHuo: TLabel
      Left = 146
      Top = 11
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #21457#36135#21333#20301#12288
      Layout = tlCenter
    end
    object lblShouHuo: TLabel
      Left = 275
      Top = 11
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #25910#36135#21333#20301#12288
      Layout = tlCenter
    end
    object lblGoods: TLabel
      Left = 401
      Top = 11
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #36135#21517#12288
      Layout = tlCenter
    end
    object lblSpec: TLabel
      Left = 529
      Top = 11
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #35268#26684#12288
      Layout = tlCenter
    end
    object lblBackup1: TLabel
      Left = 16
      Top = 59
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'1'#12288
      Layout = tlCenter
    end
    object lblBackup2: TLabel
      Left = 144
      Top = 59
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'2'#12288
      Layout = tlCenter
    end
    object lblBackup3: TLabel
      Left = 272
      Top = 59
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'3'#12288
      Layout = tlCenter
    end
    object lblBackup4: TLabel
      Left = 400
      Top = 59
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'4'#12288
      Layout = tlCenter
    end
    object lblBackup5: TLabel
      Left = 528
      Top = 59
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'5'#12288
      Layout = tlCenter
    end
    object lblBackup10: TLabel
      Left = 16
      Top = 107
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'10'
      Layout = tlCenter
    end
    object lblBackup11: TLabel
      Left = 144
      Top = 107
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'11'#12288
      Layout = tlCenter
    end
    object lblBackup12: TLabel
      Left = 272
      Top = 107
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'12'#12288
      Layout = tlCenter
    end
    object lblBackup13: TLabel
      Left = 400
      Top = 107
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'13'#12288
      Layout = tlCenter
    end
    object lblBackup14: TLabel
      Left = 528
      Top = 107
      Width = 120
      Height = 20
      AutoSize = False
      Caption = #22791#29992'14'#12288
      Layout = tlCenter
    end
    object CBCar: TComboBox
      Left = 16
      Top = 32
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 0
    end
    object CBFaHuo: TComboBox
      Left = 144
      Top = 32
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 1
    end
    object CBShouHuo: TComboBox
      Left = 272
      Top = 32
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 2
    end
    object CBGoods: TComboBox
      Left = 400
      Top = 32
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 3
    end
    object CBSpec: TComboBox
      Left = 528
      Top = 32
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 4
    end
    object CBBackup1: TComboBox
      Left = 16
      Top = 80
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 5
    end
    object CBBackup2: TComboBox
      Left = 144
      Top = 80
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 6
    end
    object CBBackup3: TComboBox
      Left = 272
      Top = 80
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 7
    end
    object CBBackup4: TComboBox
      Left = 400
      Top = 80
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 8
    end
    object CBBackup5: TComboBox
      Left = 528
      Top = 80
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 9
    end
    object BtnSave: TButton
      Left = 660
      Top = 80
      Width = 117
      Height = 57
      Caption = #20445#23384
      TabOrder = 10
      OnClick = BtnSaveClick
    end
    object CBBackup10: TComboBox
      Left = 16
      Top = 128
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 11
    end
    object CBBackup11: TComboBox
      Left = 144
      Top = 128
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 12
    end
    object CBBackup12: TComboBox
      Left = 272
      Top = 128
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 13
    end
    object CBBackup13: TComboBox
      Left = 400
      Top = 128
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 14
    end
    object CBBackup14: TComboBox
      Left = 528
      Top = 128
      Width = 120
      Height = 24
      ItemHeight = 16
      TabOrder = 15
    end
    object BtnAdd: TButton
      Left = 660
      Top = 16
      Width = 117
      Height = 57
      Caption = #28155#21152
      TabOrder = 16
      OnClick = BtnAddClick
    end
    object EdtSearch: TEdit
      Left = 16
      Top = 160
      Width = 633
      Height = 24
      TabOrder = 17
      OnChange = EdtSearchChange
    end
    object BitBtn1: TBitBtn
      Left = 664
      Top = 152
      Width = 113
      Height = 33
      Caption = #36873#20013
      TabOrder = 18
      OnClick = BitBtn1Click
      Kind = bkYes
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 312
    Top = 336
    object NModify: TMenuItem
      Caption = #20462#25913
      OnClick = NModifyClick
    end
    object NDelete: TMenuItem
      Caption = #21024#38500
      OnClick = NDeleteClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object NFresh: TMenuItem
      Caption = #21047#26032
      OnClick = NFreshClick
    end
  end
  object ApplicationEvents1: TApplicationEvents
    OnIdle = ApplicationEvents1Idle
    Left = 464
    Top = 296
  end
end
