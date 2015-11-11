object LogForm: TLogForm
  Left = 426
  Top = 171
  BorderStyle = bsSingle
  Caption = #26085#24535
  ClientHeight = 446
  ClientWidth = 688
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
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 688
    Height = 405
    Align = alClient
    AutoFitColWidths = True
    DataSource = QueryDataModule.DSLog
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 17
    RowSizingAllowed = True
    TabOrder = 0
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #24207#21495
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #20462#25913#20154
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #26102#38388
        Footers = <>
        Title.Alignment = taCenter
        Width = 160
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = #26085#24535
        Footers = <>
        Title.Alignment = taCenter
        Width = 320
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 405
    Width = 688
    Height = 41
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object BtnPrint: TButton
      Left = 240
      Top = 8
      Width = 90
      Height = 25
      Caption = #25171#21360#39044#35272
      TabOrder = 0
      OnClick = BtnPrintClick
    end
    object BtnExport: TButton
      Left = 336
      Top = 8
      Width = 90
      Height = 25
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BtnExportClick
    end
    object DTPStart: TDateTimePicker
      Left = 16
      Top = 8
      Width = 100
      Height = 21
      Date = 41128.000000000000000000
      Time = 41128.000000000000000000
      TabOrder = 2
      OnChange = DTPStartChange
    end
    object DTPEnd: TDateTimePicker
      Left = 128
      Top = 8
      Width = 100
      Height = 21
      Date = 41128.999988425920000000
      Time = 41128.999988425920000000
      TabOrder = 3
      OnChange = DTPStartChange
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
  object SaveDialog1: TSaveDialog
    Left = 288
    Top = 96
  end
end
