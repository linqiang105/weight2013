object ReportSysForm: TReportSysForm
  Left = 477
  Top = 121
  Width = 320
  Height = 500
  Caption = #25253#34920
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object tvReport: TRzTreeView
    Left = 0
    Top = 0
    Width = 312
    Height = 465
    SelectionPen.Color = clBtnShadow
    Align = alClient
    BorderStyle = bsNone
    Indent = 19
    PopupMenu = PMReport
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    OnChange = tvReportChange
    OnDblClick = tvReportDblClick
  end
  object PTool: TRzSizePanel
    Left = 0
    Top = 465
    Width = 312
    Height = 8
    Align = alBottom
    HotSpotVisible = True
    SizeBarWidth = 7
    TabOrder = 1
    HotSpotClosed = True
    HotSpotPosition = 127
    object MemoSQL: TMemo
      Left = 0
      Top = 8
      Width = 249
      Height = 0
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
      WantReturns = False
    end
    object BtnSave: TRzBitBtn
      Left = 249
      Top = 8
      Width = 63
      Height = 0
      Align = alRight
      Caption = #26356#26032'SQL'#33050#26412
      TabOrder = 1
      OnClick = BtnSaveClick
    end
  end
  object ADOQReport: TADOQuery
    Parameters = <>
    Left = 72
    Top = 176
  end
  object frxReport3: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDataset3
    DataSetName = 'frxDBDataset3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41506.701335682870000000
    ReportOptions.LastChange = 41506.701335682870000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnUserFunction = frxReport3UserFunction
    Left = 224
    Top = 176
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    DataSet = ADOQReport
    Left = 152
    Top = 176
  end
  object PMReport: TPopupMenu
    Left = 72
    Top = 120
    object NModifyTicket: TMenuItem
      Caption = #20462#25913#26684#24335
      OnClick = NModifyTicketClick
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object NRename: TMenuItem
      Caption = #37325#21629#21517
      OnClick = NRenameClick
    end
    object NDelete: TMenuItem
      Caption = #21024#38500
      OnClick = NDeleteClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object NCopy: TMenuItem
      Caption = #22797#21046#20026#27169#26495
      OnClick = NCopyClick
    end
    object NRefresh: TMenuItem
      Caption = #21047#26032
      OnClick = NRefreshClick
    end
  end
end
