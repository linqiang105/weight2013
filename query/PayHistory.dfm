object PayHistoryForm: TPayHistoryForm
  Left = 329
  Top = 177
  BorderStyle = bsDialog
  Caption = #20805#20540#21382#21490
  ClientHeight = 442
  ClientWidth = 624
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 624
    Height = 391
    Align = alClient
    AutoFitColWidths = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #24207#21495
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'shouHuo'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #25910#36135#21333#20301
        Width = 180
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'updateTime'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20805#20540#26102#38388
        Width = 193
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'price'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #20805#20540#37329#39069
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 391
    Width = 624
    Height = 51
    Align = alBottom
    TabOrder = 1
    object BtnPrint: TButton
      Left = 225
      Top = 13
      Width = 90
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 0
      OnClick = BtnPrintClick
    end
    object BtnExport: TButton
      Left = 319
      Top = 13
      Width = 90
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BtnExportClick
    end
    object DTPStart: TDateTimePicker
      Left = 16
      Top = 16
      Width = 100
      Height = 21
      Date = 41131.721909340270000000
      Time = 41131.721909340270000000
      TabOrder = 2
      OnChange = DTPStartChange
    end
    object DTPEnd: TDateTimePicker
      Left = 120
      Top = 16
      Width = 100
      Height = 21
      Date = 41131.721940798610000000
      Time = 41131.721940798610000000
      TabOrder = 3
      OnChange = DTPEndChange
    end
  end
  object PrintDBGridEh1: TPrintDBGridEh
    Options = []
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -11
    PageFooter.Font.Name = 'MS Sans Serif'
    PageFooter.Font.Style = []
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -11
    PageHeader.Font.Name = 'MS Sans Serif'
    PageHeader.Font.Style = []
    Units = MM
    Left = 248
    Top = 96
  end
end
