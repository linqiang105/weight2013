object UserPurviewForm: TUserPurviewForm
  Left = 271
  Top = 140
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #29992#25143#26435#38480#35774#32622
  ClientHeight = 422
  ClientWidth = 753
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
  object PTop: TPanel
    Left = 0
    Top = 0
    Width = 753
    Height = 422
    Align = alClient
    Caption = 'PTop'
    TabOrder = 0
    object PUser: TPanel
      Left = 1
      Top = 1
      Width = 120
      Height = 420
      Align = alLeft
      BevelInner = bvLowered
      Caption = 'PUser'
      TabOrder = 0
      object DBGridEhUser: TDBGridEh
        Left = 2
        Top = 2
        Width = 116
        Height = 416
        Align = alClient
        AutoFitColWidths = True
        DynProps = <>
        Flat = True
        FooterParams.Color = clWindow
        IndicatorOptions = [gioShowRowIndicatorEh]
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnCellClick = DBGridEhUserCellClick
        OnDblClick = DBGridEhUserDblClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = #29992#25143#21517
            Footers = <>
            Width = 85
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
    object PAttrib: TPanel
      Left = 121
      Top = 1
      Width = 631
      Height = 420
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object Label2: TLabel
        Left = 24
        Top = 20
        Width = 56
        Height = 13
        AutoSize = False
        Caption = #29992#25143#21517'  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object GBLegal: TGroupBox
        Left = 16
        Top = 48
        Width = 601
        Height = 361
        Caption = #26435#38480
        Enabled = False
        TabOrder = 1
        object GBWeightData: TGroupBox
          Left = 264
          Top = 16
          Width = 321
          Height = 329
          Caption = #31216#37325#25968#25454#32500#25252
          TabOrder = 4
          object GBModify: TGroupBox
            Left = 8
            Top = 48
            Width = 297
            Height = 271
            TabOrder = 4
            object CBCar: TCheckBox
              Left = 14
              Top = 24
              Width = 80
              Height = 17
              Caption = #36710#21495
              TabOrder = 0
            end
            object CBTare: TCheckBox
              Left = 14
              Top = 168
              Width = 80
              Height = 17
              Caption = #30382#37325
              TabOrder = 1
            end
            object CBFaHuo: TCheckBox
              Left = 14
              Top = 48
              Width = 80
              Height = 17
              Caption = #21457#36135#21333#20301
              TabOrder = 2
            end
            object CBBundle: TCheckBox
              Left = 14
              Top = 192
              Width = 80
              Height = 17
              Caption = #25187#37325
              TabOrder = 3
            end
            object CBShouHuo: TCheckBox
              Left = 14
              Top = 72
              Width = 80
              Height = 17
              Caption = #25910#36135#21333#20301
              TabOrder = 4
            end
            object CBPrice: TCheckBox
              Left = 14
              Top = 216
              Width = 80
              Height = 17
              Caption = #21333#20215
              TabOrder = 5
            end
            object CBGoods: TCheckBox
              Left = 14
              Top = 96
              Width = 80
              Height = 17
              Caption = #36135#21517
              TabOrder = 6
            end
            object CBScale: TCheckBox
              Left = 14
              Top = 240
              Width = 80
              Height = 17
              Caption = #25240#26041#31995#25968
              TabOrder = 7
            end
            object CBSpec: TCheckBox
              Left = 14
              Top = 120
              Width = 80
              Height = 17
              Caption = #35268#26684
              TabOrder = 8
            end
            object CBGross: TCheckBox
              Left = 14
              Top = 144
              Width = 80
              Height = 17
              Caption = #27611#37325
              TabOrder = 9
            end
            object CBCost: TCheckBox
              Left = 110
              Top = 24
              Width = 80
              Height = 17
              Caption = #36807#30917#36153
              TabOrder = 10
            end
            object CBBackup6: TCheckBox
              Left = 110
              Top = 168
              Width = 80
              Height = 17
              Caption = #22791#29992'6'
              TabOrder = 11
            end
            object CBBackup1: TCheckBox
              Left = 110
              Top = 48
              Width = 80
              Height = 17
              Caption = #22791#29992'1'
              TabOrder = 12
            end
            object CBBackup7: TCheckBox
              Left = 110
              Top = 192
              Width = 80
              Height = 17
              Caption = #22791#29992'7'
              TabOrder = 13
            end
            object CBBackup2: TCheckBox
              Left = 110
              Top = 72
              Width = 80
              Height = 17
              Caption = #22791#29992'2'
              TabOrder = 14
            end
            object CBBackup8: TCheckBox
              Left = 110
              Top = 216
              Width = 80
              Height = 17
              Caption = #22791#29992'8'
              TabOrder = 15
            end
            object CBBackup3: TCheckBox
              Left = 110
              Top = 96
              Width = 80
              Height = 17
              Caption = #22791#29992'3'
              TabOrder = 16
            end
            object CBBackup9: TCheckBox
              Left = 110
              Top = 240
              Width = 80
              Height = 17
              Caption = #22791#29992'9'
              TabOrder = 17
            end
            object CBBackup4: TCheckBox
              Left = 110
              Top = 120
              Width = 80
              Height = 17
              Caption = #22791#29992'4'
              TabOrder = 18
            end
            object CBBackup5: TCheckBox
              Left = 110
              Top = 144
              Width = 80
              Height = 17
              Caption = #22791#29992'5'
              TabOrder = 19
            end
            object CBBackup15: TCheckBox
              Left = 205
              Top = 144
              Width = 80
              Height = 17
              Caption = #22791#29992'15'
              TabOrder = 20
            end
            object CBBackup10: TCheckBox
              Left = 205
              Top = 24
              Width = 80
              Height = 17
              Caption = #22791#29992'10'
              TabOrder = 21
            end
            object CBBackup16: TCheckBox
              Left = 205
              Top = 168
              Width = 80
              Height = 17
              Caption = #22791#29992'16'
              TabOrder = 22
            end
            object CBBackup11: TCheckBox
              Left = 205
              Top = 48
              Width = 80
              Height = 17
              Caption = #22791#29992'11'
              TabOrder = 23
            end
            object CBBackup17: TCheckBox
              Left = 205
              Top = 192
              Width = 80
              Height = 17
              Caption = #22791#29992'17'
              TabOrder = 24
            end
            object CBBackup12: TCheckBox
              Left = 205
              Top = 72
              Width = 80
              Height = 17
              Caption = #22791#29992'12'
              TabOrder = 25
            end
            object CBBackup18: TCheckBox
              Left = 205
              Top = 216
              Width = 80
              Height = 17
              Caption = #22791#29992'18'
              TabOrder = 26
            end
            object CBBackup13: TCheckBox
              Left = 205
              Top = 96
              Width = 80
              Height = 17
              Caption = #22791#29992'13'
              TabOrder = 27
            end
            object CBBackup14: TCheckBox
              Left = 205
              Top = 120
              Width = 80
              Height = 17
              Caption = #22791#29992'14'
              TabOrder = 28
            end
          end
          object CBAddData: TCheckBox
            Left = 120
            Top = 24
            Width = 80
            Height = 17
            Caption = #28155#21152#35760#24405
            TabOrder = 1
          end
          object CBModData: TCheckBox
            Left = 22
            Top = 48
            Width = 80
            Height = 17
            Caption = #20462#25913#35760#24405
            TabOrder = 3
            OnClick = CBModDataClick
          end
          object CBDelData: TCheckBox
            Left = 224
            Top = 24
            Width = 80
            Height = 17
            Caption = #21024#38500#35760#24405
            TabOrder = 2
          end
          object CBDataQuery: TCheckBox
            Left = 22
            Top = 24
            Width = 80
            Height = 17
            Caption = #25968#25454#26597#35810
            TabOrder = 0
          end
        end
        object GBEqua: TGroupBox
          Left = 136
          Top = 184
          Width = 121
          Height = 160
          Caption = #35774#22791
          TabOrder = 3
          object CBMeterSet: TCheckBox
            Left = 10
            Top = 16
            Width = 100
            Height = 17
            Caption = #20202#34920#35774#32622
            TabOrder = 0
          end
          object CBVideoSet: TCheckBox
            Left = 10
            Top = 40
            Width = 100
            Height = 17
            Caption = #35270#39057#35774#32622
            TabOrder = 1
          end
          object CBReaderSet: TCheckBox
            Left = 10
            Top = 64
            Width = 100
            Height = 17
            Caption = #35835#21345#22120#35774#32622
            TabOrder = 2
          end
          object CBIOSet: TCheckBox
            Left = 10
            Top = 88
            Width = 100
            Height = 17
            Caption = 'IO'#27169#22359#35774#32622
            TabOrder = 3
          end
          object CBScreenSet: TCheckBox
            Left = 10
            Top = 112
            Width = 100
            Height = 17
            Caption = #22823#23631#24149#35774#32622
            TabOrder = 4
          end
          object CBVoiceSet: TCheckBox
            Left = 10
            Top = 136
            Width = 100
            Height = 17
            Caption = #35821#38899#36755#20986
            TabOrder = 5
          end
        end
        object GBDatabase: TGroupBox
          Left = 136
          Top = 16
          Width = 121
          Height = 160
          Caption = #25968#25454#24211
          TabOrder = 2
          object CBDataExport: TCheckBox
            Left = 10
            Top = 90
            Width = 100
            Height = 17
            Caption = #25968#25454#23548#20986
            TabOrder = 3
          end
          object CBDataBackup: TCheckBox
            Left = 10
            Top = 43
            Width = 100
            Height = 17
            Caption = #25968#25454#22791#20221
            TabOrder = 1
          end
          object CBDBSet: TCheckBox
            Left = 10
            Top = 20
            Width = 100
            Height = 17
            Caption = #25968#25454#24211#35774#32622
            TabOrder = 0
          end
          object CBDataClear: TCheckBox
            Left = 10
            Top = 114
            Width = 100
            Height = 17
            Caption = #25968#25454#28165#29702
            TabOrder = 4
          end
          object CBDataInit: TCheckBox
            Left = 10
            Top = 137
            Width = 100
            Height = 17
            Caption = #25968#25454#21021#22987#21270
            TabOrder = 5
          end
          object CBDataImport: TCheckBox
            Left = 10
            Top = 67
            Width = 100
            Height = 17
            Caption = #25968#25454#23548#20837
            TabOrder = 2
          end
        end
        object GBSystem: TGroupBox
          Left = 16
          Top = 224
          Width = 113
          Height = 121
          Caption = #31995#32479
          TabOrder = 1
          object CBUser: TCheckBox
            Left = 10
            Top = 24
            Width = 90
            Height = 17
            Caption = #29992#25143#31649#29702
            TabOrder = 0
          end
          object CBManualInput: TCheckBox
            Left = 10
            Top = 96
            Width = 90
            Height = 17
            Caption = #25163#24037#37325#37327
            TabOrder = 3
          end
          object CBSystemSet: TCheckBox
            Left = 10
            Top = 48
            Width = 90
            Height = 17
            Caption = #31995#32479#35774#32622
            TabOrder = 1
          end
          object CBFormSet: TCheckBox
            Left = 10
            Top = 72
            Width = 90
            Height = 17
            Caption = #30028#38754#37197#32622
            TabOrder = 2
          end
        end
        object GBData: TGroupBox
          Left = 16
          Top = 16
          Width = 113
          Height = 201
          Caption = #25968#25454
          TabOrder = 0
          object CBPrintReport: TCheckBox
            Left = 10
            Top = 176
            Width = 90
            Height = 17
            Caption = #25171#21360#25253#34920
            TabOrder = 6
          end
          object CBModifyTicket: TCheckBox
            Left = 10
            Top = 151
            Width = 90
            Height = 17
            Caption = #20462#25913#30917#21333
            TabOrder = 5
          end
          object CBPremaintain: TCheckBox
            Left = 10
            Top = 24
            Width = 90
            Height = 17
            Caption = #39044#32622#32500#25252
            TabOrder = 0
          end
          object CBPrintTicket: TCheckBox
            Left = 10
            Top = 125
            Width = 90
            Height = 17
            Caption = #25171#21360#30917#21333
            TabOrder = 4
          end
          object CBCard: TCheckBox
            Left = 10
            Top = 49
            Width = 90
            Height = 17
            Caption = #20316#24223#35760#24405
            TabOrder = 1
          end
          object CBLog: TCheckBox
            Left = 10
            Top = 75
            Width = 90
            Height = 17
            Caption = #31995#32479#26085#24535
            TabOrder = 2
          end
          object CBBackRecord: TCheckBox
            Left = 10
            Top = 100
            Width = 90
            Height = 17
            Caption = #21518#21488#35760#24405
            TabOrder = 3
          end
        end
      end
      object EdtUser: TEdit
        Left = 82
        Top = 18
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object BtnMod: TBitBtn
        Left = 282
        Top = 16
        Width = 60
        Height = 25
        Caption = #20462' '#25913
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtnModClick
      end
      object BtnAdd: TBitBtn
        Left = 215
        Top = 16
        Width = 60
        Height = 25
        Caption = #28155#21152
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnAddClick
      end
      object BtnCancel: TBitBtn
        Left = 417
        Top = 16
        Width = 60
        Height = 25
        Caption = #25764' '#28040
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = BtnCancelClick
      end
      object BtnDel: TBitBtn
        Left = 484
        Top = 16
        Width = 60
        Height = 25
        Caption = #21024' '#38500
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = BtnDelClick
      end
      object BtnRefresh: TBitBtn
        Left = 551
        Top = 16
        Width = 60
        Height = 25
        Caption = #21047' '#26032
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
        OnClick = BtnRefreshClick
      end
      object BtnSave: TBitBtn
        Left = 349
        Top = 16
        Width = 60
        Height = 25
        Caption = #20445' '#23384
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnClick = BtnSaveClick
      end
    end
  end
end
