object StorageForm: TStorageForm
  Left = 307
  Top = 153
  Width = 782
  Height = 510
  Caption = #24211#23384#20449#24687
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
  object PFunc: TPanel
    Left = 0
    Top = 0
    Width = 774
    Height = 50
    Align = alTop
    TabOrder = 0
    object lblGoods: TLabel
      Left = 16
      Top = 17
      Width = 54
      Height = 13
      Caption = #36135#21517'    '
    end
    object lblTo: TLabel
      Left = 383
      Top = 17
      Width = 7
      Height = 13
      Caption = '~'
    end
    object CBGoods: TComboBox
      Left = 64
      Top = 13
      Width = 177
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object DTPStart: TDateTimePicker
      Left = 256
      Top = 13
      Width = 120
      Height = 21
      Date = 41382.735415370370000000
      Time = 41382.735415370370000000
      TabOrder = 1
    end
    object DTPEnd: TDateTimePicker
      Left = 397
      Top = 13
      Width = 120
      Height = 21
      Date = 41382.735470254630000000
      Time = 41382.735470254630000000
      TabOrder = 2
    end
    object BtnStat: TBitBtn
      Left = 528
      Top = 8
      Width = 75
      Height = 35
      Caption = #32479#35745
      TabOrder = 3
      OnClick = BtnStatClick
    end
    object BtnExport: TBitBtn
      Left = 608
      Top = 8
      Width = 75
      Height = 35
      Caption = #23548#20986
      TabOrder = 4
      OnClick = BtnExportClick
    end
  end
  object DBGridEhStorage: TDBGridEh
    Left = 0
    Top = 50
    Width = 774
    Height = 433
    Align = alClient
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 30
    RowSizingAllowed = True
    TabOrder = 1
    TitleParams.RowHeight = 30
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36135#21517
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20837#24211#27425#25968
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20837#24211#25968#37327
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20837#24211#37329#39069
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20986#24211#27425#25968
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20986#24211#25968#37327
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20986#24211#37329#39069
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #24211#23384#25968#37327
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #30408#21033
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
end
