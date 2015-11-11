object BackRecordForm: TBackRecordForm
  Left = 300
  Top = 140
  BorderStyle = bsDialog
  Caption = #21518#21488#35760#24405
  ClientHeight = 459
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGridEh
    Left = 0
    Top = 0
    Width = 651
    Height = 404
    Align = alClient
    AutoFitColWidths = True
    ColumnDefValues.Title.TitleButton = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    PopupMenu = PopupMenu1
    ReadOnly = True
    SortLocal = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnTitleBtnClick = DBGrid1TitleBtnClick
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'id'
        Footers = <>
        Title.Caption = #24207#21495
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'weight'
        Footers = <>
        Title.Caption = #37325#37327
        Width = 200
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'weight_time'
        Footers = <>
        Title.Caption = #36807#30917#26102#38388
        Width = 250
      end
      item
        Alignment = taCenter
        Checkboxes = True
        DynProps = <>
        EditButtons = <>
        FieldName = 'flag'
        Footers = <>
        Title.Caption = #24050#36807#30917
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 404
    Width = 651
    Height = 55
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    object GBCondition: TGroupBox
      Left = 2
      Top = 2
      Width = 415
      Height = 51
      Align = alLeft
      Caption = #26597#35810#26465#20214
      TabOrder = 2
      object DTP: TDateTimePicker
        Left = 8
        Top = 18
        Width = 135
        Height = 21
        Date = 40545.423182094910000000
        Time = 40545.423182094910000000
        TabOrder = 0
        OnChange = DTPChange
      end
      object RBAll: TRadioButton
        Left = 152
        Top = 22
        Width = 80
        Height = 17
        Caption = #20840#37096
        Checked = True
        TabOrder = 1
        TabStop = True
        OnClick = RBAllClick
      end
      object RBNotWeight: TRadioButton
        Left = 236
        Top = 22
        Width = 80
        Height = 17
        Caption = #26410#36807#30917
        TabOrder = 2
        OnClick = RBAllClick
      end
      object RBWeight: TRadioButton
        Left = 320
        Top = 22
        Width = 80
        Height = 17
        Caption = #24050#36807#30917
        TabOrder = 3
        OnClick = RBAllClick
      end
    end
    object BtnPrint: TBitBtn
      Left = 424
      Top = 15
      Width = 85
      Height = 30
      Caption = #25171#21360#39044#35272
      TabOrder = 0
      OnClick = BtnPrintClick
    end
    object BtnExport: TBitBtn
      Left = 513
      Top = 15
      Width = 85
      Height = 30
      Caption = #23548#20986
      TabOrder = 1
      OnClick = BtnExportClick
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
    Left = 200
    Top = 96
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 104
    object N1: TMenuItem
      Caption = #21024#38500
      OnClick = N1Click
    end
  end
end
