object PrepareMaintainForm: TPrepareMaintainForm
  Left = 347
  Top = 166
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #39044#32622#32500#25252
  ClientHeight = 470
  ClientWidth = 587
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
  object PCPrepare: TRzPageControl
    Left = 0
    Top = 0
    Width = 587
    Height = 470
    ActivePage = TSCar
    Align = alClient
    ParentColor = False
    ShowMenuButton = True
    TabIndex = 0
    TabOrder = 9
    FixedDimension = 19
    object TSCar: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSCar'
    end
    object TSFaHuo: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSFaHuo'
    end
    object TSShouHuo: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSShouHuo'
    end
    object TSGoods: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSGoods'
    end
    object TSSpec: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSSpec'
    end
    object TSBackup1: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup1'
    end
    object TSBackup2: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup2'
    end
    object TSBackup3: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup3'
    end
    object TSBackup4: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup4'
    end
    object TSBackup5: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup5'
    end
    object TSBackup10: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup10'
    end
    object TSBackup11: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup11'
    end
    object TSBackup12: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup12'
    end
    object TSBackup13: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup13'
    end
    object TSBackup14: TRzTabSheet
      OnShow = TabSheetShow
      Caption = 'TSBackup14'
    end
  end
  object AppendBtn: TBitBtn
    Left = 13
    Top = 428
    Width = 70
    Height = 30
    Action = DataSetInsert1
    Caption = '&'#25554#20837
    TabOrder = 0
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA514A514A514A514FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA5144A7D317E317EC664A514FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA514B57E087D0871B57EA514FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA514B57E087DE778B57EA514FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FA514C618C618C618B57E297D0879B57EC618A514A514
      A514FF7FFF7FFF7FC618187F187FB57E117E6B7D08790871087DB57EB57EB57E
      317EA514FF7FFF7FC6187B7F317EAD7D8C7D4A7D2975087108710879E7780871
      B57EA514FF7FFF7FC618BD7F527ECE7DAD7D4A7D297929750879297D087D087D
      B57EA514FF7FFF7FC6187B7FBD7F5A7FB57ECE7D4A7D4A7D6B7DB57EB57EB57E
      317EA514FF7FFF7FFF7FC618C618C618E71CB57EAD7D8C7D317EC618A514A514
      A514FF7FFF7FFF7FFF7FFF7FFF7FFF7FC6185A7FCE7DCE7DB57EC618FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FC618BD7F527E527E397FC618FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FC6189C7FBD7F9C7F397FC618FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FC618C618C618C618FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F}
  end
  object CancelBtn: TBitBtn
    Left = 222
    Top = 428
    Width = 70
    Height = 30
    Action = DataSetCancel1
    Caption = '&'#25764#28040
    TabOrder = 1
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F4A294A29FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F4A297203EF028410
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FE71CEF02F513EF02
      8410FF7FFF7FFF7F0000000000000000000000004A29FF7FFF7FE71C4C02F513
      4C024A29FF7FFF7FE71CEF02EF024C024C024A29FF7FFF7FFF7FFF7F4A297203
      72034A29FF7FFF7FE71CF837F137EF02AD35D65AFF7FFF7FFF7FFF7FEF3DEF02
      F5138410FF7FFF7FE71CFA47F547F7274C024A29FF7FFF7FFF7FFF7FEF3DEF02
      FA478410FF7FFF7FE71CFC5BB5567203F5134C024A29FF7FFF7FFF7F4A29EF02
      F5138410FF7FFF7F4A294A29D65A4A297203FA474C024A29E71CE71C4C027203
      72034A29FF7FFF7F4A29FF7FFF7FFF7F4A29EF02FA47EF02EF02EF02EF027203
      4C02EF3DFF7FFF7FFF7FFF7FFF7FFF7FFF7F4A29EF027203F513F513F513EF02
      4A29FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D4A294A294A294A29EF3D
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F}
  end
  object DeleteBtn: TBitBtn
    Left = 292
    Top = 428
    Width = 70
    Height = 30
    Action = DataSetDelete1
    Caption = '&'#21024#38500
    TabOrder = 2
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      0000FF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7F00000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F00000000000000000000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7F00000000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7F00000000
      FF7FFF7FFF7FFF7FFF7F0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F0000
      0000FF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F}
  end
  object EditBtn: TBitBtn
    Left = 83
    Top = 428
    Width = 70
    Height = 30
    Action = DataSetEdit1
    Caption = '&'#20462#25913
    TabOrder = 3
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F21042104210421042104FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F210429253967734E734E2104FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F2104FF7F9C731863406E406E2104FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F21049C731863406E8049A47E406E2104FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F2104D65A0D7FE05DA47E8049A47E406E2104FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F2104A07E517FE05DA47E8049A47E406E2104FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F2104A07E967FE05DA47E8049A47E406E2104FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A07E517FE05DA47E8049A47EC9012104
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A07E967FE05DA47E4C02C901C901
      2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A07E517FE7024C02E05DE05C
      E05C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104406E6903206DE05C2D7E
      2D7E206D2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F21044C02E05C2D7E005C
      407D206D2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104C97DB17E407D
      407DE05C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104206D407D
      E05C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F21042104
      2104FF7FFF7F}
  end
  object SaveBtn: TBitBtn
    Left = 152
    Top = 428
    Width = 70
    Height = 30
    Action = DataSetPost1
    Caption = '&'#20445#23384
    TabOrder = 4
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7F203920392039203920392039203920392039203920392039
      2039FF7FFF7F8049C618E05D396739673967396739677B6F7B6F7B6FDE7B967F
      C618C028FF7F8049E97EE05D1863396739673967396739677B6F7B6F7B6F967F
      E97EC028FF7F80490D7FE05DD65A18631863186339673967396739677B6F967F
      E97EC028FF7F80490D7FE05DD65AD65AD65A186339673967396739671863967F
      E97EC028FF7F80490D7FE05D524A9452D65AD65A1863396718631863D65A967F
      E97EC028FF7F80490D7FE05D524A524A94529452D65A18631863D65AD65A967F
      E97EC028FF7F8049517FE05DE05DE05DE05DE05DE05DE05DE05DE05DE05D517F
      E97EC028FF7F8049517F517F517F517F517F517F517F517F517F517F517F967F
      E97EC028FF7F8049517FE05DA07EE05DE05DE05DE05DE05DE05DE05DE97E517F
      E97EC028FF7F80490D7FE05DFF7F8049FF7FDE7BDE7BD65AD65ADE7BE05D517F
      0D7FC028FF7F8049517FE05DFF7F8049FF7F7B6F7B6F10421042DE7B8049517F
      0D7FC028FF7F8049E97EE05DFF7F8049FF7F7B6F7B6FAD35524A7B6F8049517F
      0D7FC028FF7F8049517FE05DFF7F8049FF7F9C737B6FC618C618DE7B8049517F
      0D7FC028FF7F8049967FE05D7B6FE05DFF7FFF7FFF7FFF7FFF7FFF7F8049967F
      2039FF7FFF7FFF7F104210421042104210421042104210421042104210421042
      FF7FFF7FFF7F}
  end
  object RefreshBitBtn: TBitBtn
    Left = 362
    Top = 428
    Width = 70
    Height = 30
    Action = DataSetRefresh1
    Caption = '&'#21047#26032
    TabOrder = 5
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FFFFFF000000
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      FF000000FF0000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF000000
      FF0000FF00000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF00FFFFFF00FFFFFF000000
      FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFF
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000FF000000FF000000FF000000FF000000
      FF000000FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 32
    Width = 553
    Height = 361
    AutoFitColWidths = True
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    TabOrder = 6
    OnDblClick = DBGridEh1DblClick
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object BitBtnExport: TBitBtn
    Left = 431
    Top = 428
    Width = 70
    Height = 30
    Hint = 'Refresh'
    Caption = #23548#20986
    TabOrder = 7
    OnClick = BitBtnExportClick
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
  object BitBtnImport: TBitBtn
    Left = 501
    Top = 428
    Width = 70
    Height = 30
    Hint = '|'#23548#20837#26684#24335#20026#19968#20010#25991#26412#25991#20214#13#10#19968#34892#19968#20010#36710#21495'/'#21457#36135#21333#20301'/'#25910#36135#21333#20301
    Caption = #23548#20837
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BitBtnImportClick
    Kind = bkHelp
  end
  object EdtSearch: TEdit
    Left = 16
    Top = 400
    Width = 553
    Height = 21
    Hint = #25903#25345#27169#31946#26597#25214
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnChange = EdtSearchChange
  end
  object ActionListPreMaintain: TActionList
    Left = 296
    Top = 240
    object DataSetInsert1: TDataSetInsert
      Category = 'Dataset'
      Caption = '&Insert'
      Hint = 'Insert'
      ImageIndex = 4
    end
    object DataSetDelete1: TDataSetDelete
      Category = 'Dataset'
      Caption = '&Delete'
      Hint = 'Delete'
      ImageIndex = 5
    end
    object DataSetEdit1: TDataSetEdit
      Category = 'Dataset'
      Caption = '&Edit'
      Hint = 'Edit'
      ImageIndex = 6
    end
    object DataSetPost1: TDataSetPost
      Category = 'Dataset'
      Caption = 'P&ost'
      Hint = 'Post'
      ImageIndex = 7
    end
    object DataSetCancel1: TDataSetCancel
      Category = 'Dataset'
      Caption = '&Cancel'
      Hint = 'Cancel'
      ImageIndex = 8
    end
    object DataSetRefresh1: TDataSetRefresh
      Category = 'Dataset'
      Caption = '&Refresh'
      Hint = 'Refresh'
      ImageIndex = 9
    end
  end
end
