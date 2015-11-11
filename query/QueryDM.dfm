object QueryDataModule: TQueryDataModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 211
  Top = 105
  Height = 580
  Width = 850
  object DBConnection: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'SQLOLEDB.1'
    Left = 56
    Top = 16
  end
  object WeightMaintainDS: TDataSource
    DataSet = WeightMaintainQuery
    Left = 56
    Top = 128
  end
  object DSUser: TDataSource
    DataSet = ADOQUser
    Left = 144
    Top = 128
  end
  object ADOQUser: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    AfterEdit = ADOQUserAfterEdit
    BeforePost = ADOQUserBeforePost
    AfterPost = ADOQUserAfterPost
    BeforeDelete = ADOQUserBeforeDelete
    Parameters = <>
    SQL.Strings = (
      'select * from '#29992#25143#20449#24687)
    Left = 144
    Top = 72
  end
  object PrepareMaintainQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 240
    Top = 16
  end
  object PrepareMaintainDS: TDataSource
    DataSet = PrepareMaintainQuery
    Left = 240
    Top = 72
  end
  object ADOQExec: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 256
    Top = 200
  end
  object WeightMaintainQuery: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    BeforeEdit = WeightMaintainQueryBeforeEdit
    BeforePost = WeightMaintainQueryBeforePost
    AfterPost = WeightMaintainQueryAfterPost
    BeforeDelete = WeightMaintainQueryBeforeDelete
    Parameters = <>
    Left = 56
    Top = 72
  end
  object ADOQueryPrintTicket: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from '#31216#37325#20449#24687)
    Left = 56
    Top = 200
  end
  object StatisticsQuery: TADOQuery
    Connection = DBConnection
    Parameters = <>
    SQL.Strings = (
      'select * from temp')
    Left = 480
    Top = 16
  end
  object StatisticsDS: TDataSource
    DataSet = StatisticsQuery
    Left = 480
    Top = 72
  end
  object ADOQLog: TADOQuery
    Connection = DBConnection
    CursorType = ctStatic
    Parameters = <>
    Left = 336
    Top = 16
  end
  object ADOQMultiGross: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 568
    Top = 16
  end
  object DSMultiGross: TDataSource
    DataSet = ADOQMultiGross
    Left = 568
    Top = 72
  end
  object DSLog: TDataSource
    DataSet = ADOQLog
    Left = 336
    Top = 72
  end
  object ADOQBackRecord: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 664
    Top = 16
  end
  object DSBackRecord: TDataSource
    DataSet = ADOQBackRecord
    Left = 664
    Top = 72
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = ADOQueryPrintTicket
    Left = 56
    Top = 272
  end
  object frxReport1: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = True
    EngineOptions.MaxMemSize = 10000000
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.AllowEdit = False
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbTools, pbNavigator]
    PreviewOptions.ShowCaptions = True
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    PrintOptions.ShowDialog = False
    ReportOptions.CreateDate = 39987.674057071800000000
    ReportOptions.LastChange = 39987.689774664400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnUserFunction = frxReport1UserFunction
    Left = 56
    Top = 336
  end
  object frxDesigner1: TfrxDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10.000000000000000000
    DefaultRightMargin = 10.000000000000000000
    DefaultTopMargin = 10.000000000000000000
    DefaultBottomMargin = 10.000000000000000000
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    TemplatesExt = 'fr3'
    Restrictions = []
    RTLLanguage = False
    Left = 336
    Top = 272
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 592
    Top = 304
  end
  object frxDBDatasetReport: TfrxDBDataset
    UserName = 'frxDBDatasetReport'
    CloseDataSource = False
    DataSet = WeightMaintainQuery
    Left = 152
    Top = 272
  end
  object frxReportReport: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDatasetReport
    DataSetName = 'frxDBDatasetReport'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #40664#35748
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 38789.391820358800000000
    ReportOptions.LastChange = 40967.908289328700000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure frxReport1OnStopReport(Sender: TfrxComponent);'
      'begin'
      '  exit;'
      'end;'
      ''
      'procedure Page1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  exit;'
      'end;'
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  exit;'
      'end;'
      ''
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnStopReport = 'frxReport1OnStopReport'
    OnUserFunction = frxReportReportUserFunction
    Left = 152
    Top = 336
  end
  object ADOQCard: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 408
    Top = 16
  end
  object DSCard: TDataSource
    DataSet = ADOQCard
    Left = 408
    Top = 72
  end
  object DSTao: TDataSource
    DataSet = ADOQTao
    Left = 744
    Top = 72
  end
  object ADOQTao: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 744
    Top = 16
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 504
    Top = 336
  end
  object frxChartObject1: TfrxChartObject
    Left = 416
    Top = 272
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 336
    Top = 336
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 416
    Top = 336
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = StatisticsQuery
    Left = 248
    Top = 272
  end
  object frxReport2: TfrxReport
    Version = '4.6.8'
    DataSet = frxDBDataset2
    DataSetName = 'frxDBDataset2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    OldStyleProgress = True
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #39044#35774
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41094.463187986110000000
    ReportOptions.LastChange = 41094.463187986110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 248
    Top = 336
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object DSPayHistory: TDataSource
    DataSet = ADOQPayHistory
    Left = 432
    Top = 200
  end
  object ADOQPay: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 512
    Top = 144
  end
  object DSPay: TDataSource
    DataSet = ADOQPay
    Left = 512
    Top = 200
  end
  object ADOQPayHistory: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 432
    Top = 144
  end
  object ADOQStaticChart: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 168
    Top = 200
  end
  object RMGridReport1: TRMGridReport
    ThreadPrepareReport = True
    InitialZoom = pzDefault
    PreviewButtons = [rmpbZoom, rmpbLoad, rmpbSave, rmpbPrint, rmpbFind, rmpbPageSetup, rmpbExit, rmpbDesign, rmpbSaveToXLS, rmpbExport, rmpbNavigator]
    DefaultCollate = False
    SaveReportOptions.RegistryPath = 'Software\ReportMachine\ReportSettings\'
    PreviewOptions.RulerUnit = rmutScreenPixels
    PreviewOptions.RulerVisible = False
    PreviewOptions.DrawBorder = False
    PreviewOptions.BorderPen.Color = clGray
    PreviewOptions.BorderPen.Style = psDash
    Dataset = RMDBDataSet1
    ReportType = rmrtMultiple
    CompressLevel = rmzcFastest
    CompressThread = False
    LaterBuildEvents = True
    OnlyOwnerDataSet = False
    Left = 56
    Top = 400
    ReportData = {}
  end
  object RMDBDataSet1: TRMDBDataSet
    Visible = True
    DataSet = ADOQueryPrintTicket
    Left = 152
    Top = 400
  end
  object RMChineseMoneyObject1: TRMChineseMoneyObject
    Left = 192
    Top = 464
  end
  object RMAsBarCodeObject1: TRMAsBarCodeObject
    Left = 408
    Top = 464
  end
  object RMBarCodeObject1: TRMBarCodeObject
    Left = 336
    Top = 400
  end
  object RMCrossObject1: TRMCrossObject
    Left = 304
    Top = 464
  end
  object RMChartObject1: TRMChartObject
    Left = 440
    Top = 400
  end
  object RMDBChartObject1: TRMDBChartObject
    Left = 520
    Top = 464
  end
  object RMBMPExport1: TRMBMPExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 528
    Top = 400
  end
  object RMXLSExport1: TRMXLSExport
    ShowAfterExport = True
    ExportPrecision = 1
    PagesOfSheet = 1
    ExportImages = True
    ExportFrames = True
    ExportImageFormat = ifBMP
    JPEGQuality = 0
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    CompressFile = False
    Left = 240
    Top = 400
  end
  object RMJPEGExport1: TRMJPEGExport
    ScaleX = 1.000000000000000000
    ScaleY = 1.000000000000000000
    Left = 616
    Top = 464
  end
  object RMGridReportDesigner1: TRMGridReportDesigner
    Left = 56
    Top = 464
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    Left = 504
    Top = 272
  end
  object ADOQChart: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 344
    Top = 144
  end
  object DSChart: TDataSource
    DataSet = ADOQChart
    Left = 344
    Top = 192
  end
  object ADOQStorage: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 584
    Top = 144
  end
  object DSStorage: TDataSource
    DataSet = ADOQStorage
    Left = 584
    Top = 200
  end
  object ADOQExec2: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 664
    Top = 144
  end
  object ADOQExec3: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 728
    Top = 144
  end
  object ADOQPriceShouHuo: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 688
    Top = 224
  end
  object ADOQPrice: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 776
    Top = 224
  end
  object DSPriceShouHuo: TDataSource
    DataSet = ADOQPriceShouHuo
    Left = 688
    Top = 280
  end
  object DSPrice: TDataSource
    DataSet = ADOQPrice
    Left = 776
    Top = 280
  end
  object ADOQExceed: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 680
    Top = 352
  end
  object ADOQInvalid: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 760
    Top = 352
  end
  object DSExceed: TDataSource
    DataSet = ADOQExceed
    Left = 680
    Top = 408
  end
  object DSInvalid: TDataSource
    DataSet = ADOQInvalid
    Left = 760
    Top = 408
  end
  object ADOQExport: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 248
    Top = 136
  end
  object ADOQMail: TADOQuery
    Connection = DBConnection
    Parameters = <>
    Left = 704
    Top = 464
  end
  object DSMail: TDataSource
    DataSet = ADOQMail
    Left = 768
    Top = 464
  end
end
