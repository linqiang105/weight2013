object SoftwareSetForm: TSoftwareSetForm
  Left = 280
  Top = 141
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #36719#20214#31995#32479#35774#32622
  ClientHeight = 433
  ClientWidth = 761
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 761
    Height = 433
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object PCMain: TPageControl
      Left = 2
      Top = 2
      Width = 757
      Height = 429
      ActivePage = TSWeightSet
      Align = alClient
      TabOrder = 0
      object TSBase: TTabSheet
        Caption = #22522#26412#36164#26009
        object Label1: TLabel
          Left = 16
          Top = 8
          Width = 225
          Height = 13
          AutoSize = False
          Caption = #36719#20214#20351#29992#21333#20301
        end
        object Label2: TLabel
          Left = 384
          Top = 8
          Width = 209
          Height = 13
          AutoSize = False
          Caption = #30005#35805#21495#30721
        end
        object Label12: TLabel
          Left = 27
          Top = 61
          Width = 100
          Height = 13
          Caption = #30917#21333#25171#21360#26426'     '
        end
        object Label19: TLabel
          Left = 27
          Top = 93
          Width = 100
          Height = 13
          Caption = #22270#24418#25171#21360#26426'     '
        end
        object EdtCompany: TEdit
          Left = 16
          Top = 24
          Width = 350
          Height = 21
          TabOrder = 0
        end
        object EdtTel: TEdit
          Left = 385
          Top = 24
          Width = 350
          Height = 21
          TabOrder = 1
          OnKeyPress = EdtTelKeyPress
        end
        object LEAddr: TLabeledEdit
          Left = 105
          Top = 149
          Width = 262
          Height = 21
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = #30917#31449#21495#12288
          LabelPosition = lpLeft
          TabOrder = 5
          Text = 'A'
        end
        object CBPrinter1: TComboBox
          Left = 104
          Top = 57
          Width = 263
          Height = 21
          ItemHeight = 13
          TabOrder = 2
        end
        object GBTicketType: TGroupBox
          Left = 385
          Top = 57
          Width = 352
          Height = 48
          Caption = #30917#21333#31867#22411
          TabOrder = 6
          object RBFirstGeneration: TRadioButton
            Left = 40
            Top = 22
            Width = 80
            Height = 17
            Caption = #19968#20195#30917#21333
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RBSecondGeneration: TRadioButton
            Left = 216
            Top = 22
            Width = 80
            Height = 17
            Caption = #20108#20195#30917#21333
            TabOrder = 1
          end
        end
        object CBPrinter2: TComboBox
          Left = 104
          Top = 89
          Width = 263
          Height = 21
          ItemHeight = 13
          TabOrder = 3
        end
        object LEReportTitle: TLabeledEdit
          Left = 104
          Top = 120
          Width = 262
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#25253#34920#25260#22836' '
          LabelPosition = lpLeft
          TabOrder = 4
          Text = #25968#25454#25253#34920
        end
        object GBWeightMode: TGroupBox
          Left = 385
          Top = 118
          Width = 352
          Height = 53
          Caption = #36807#30917#27169#24335#36873#39033
          TabOrder = 7
          object CBStandard: TCheckBox
            Left = 30
            Top = 24
            Width = 75
            Height = 17
            Caption = #26631#20934#36807#30917
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object CBSimple: TCheckBox
            Left = 139
            Top = 24
            Width = 75
            Height = 17
            Caption = #31616#21333#36807#30917
            TabOrder = 1
          end
          object CBOnce: TCheckBox
            Left = 248
            Top = 24
            Width = 75
            Height = 17
            Caption = #19968#27425#36807#30917
            TabOrder = 2
          end
        end
      end
      object TSWeightSet: TTabSheet
        Caption = #31216#37325#35774#32622
        ImageIndex = 2
        object GBList: TGroupBox
          Left = 192
          Top = 8
          Width = 180
          Height = 313
          Caption = #21015#34920
          TabOrder = 1
          object CBAutoDropDown: TCheckBox
            Left = 10
            Top = 40
            Width = 160
            Height = 17
            Caption = #33258#21160#24377#24320#21015#34920#26694
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object CBAutoComplete: TCheckBox
            Left = 10
            Top = 64
            Width = 160
            Height = 17
            Caption = #33258#21160#34917#20840#19979#25289#26694
            TabOrder = 2
          end
          object CBEnterAsTab: TCheckBox
            Left = 10
            Top = 89
            Width = 160
            Height = 17
            Caption = #22238#36710#38190#20195#26367'Tab'#38190
            Checked = True
            State = cbChecked
            TabOrder = 3
          end
          object CBUseCode: TCheckBox
            Left = 10
            Top = 114
            Width = 160
            Height = 17
            Caption = #20351#29992#20195#30721#36755#20837
            Checked = True
            State = cbChecked
            TabOrder = 4
          end
          object CBShowPrepare: TCheckBox
            Left = 10
            Top = 163
            Width = 160
            Height = 17
            Caption = #19979#25289#26694#21452#20987#36873#25321
            TabOrder = 6
          end
          object CBSay: TCheckBox
            Left = 10
            Top = 139
            Width = 160
            Height = 17
            Caption = #25773#25253#25991#26412#26694
            TabOrder = 5
          end
          object CBUseFilterForm: TCheckBox
            Left = 10
            Top = 15
            Width = 160
            Height = 17
            Caption = #21015#34920#36807#28388#26694
            TabOrder = 0
          end
          object CBUseLast100CarNo: TCheckBox
            Left = 10
            Top = 188
            Width = 160
            Height = 17
            Caption = #20351#29992#26368#36817#36710#21495
            TabOrder = 7
          end
          object CBOnlyShowNotFinishedRecord: TCheckBox
            Left = 10
            Top = 213
            Width = 160
            Height = 17
            Caption = #21452#20987#21482#24377#20986#26410#23436#25104#35760#24405
            TabOrder = 8
          end
          object CBGridOddEvenColor: TCheckBox
            Left = 10
            Top = 238
            Width = 160
            Height = 17
            Caption = #21015#34920#21333#21452#34892#39068#33394#21306#20998
            TabOrder = 9
          end
          object CBShowSumList: TCheckBox
            Left = 10
            Top = 287
            Width = 160
            Height = 17
            Caption = #26174#31034#21015#34920#21512#35745#34892
            TabOrder = 11
          end
          object CBShowTotal: TCheckBox
            Left = 10
            Top = 262
            Width = 160
            Height = 17
            Caption = #26174#31034#21512#35745#20449#24687
            Checked = True
            State = cbChecked
            TabOrder = 10
          end
        end
        object GBFunc: TGroupBox
          Left = 376
          Top = 8
          Width = 180
          Height = 205
          Caption = #21151#33021
          TabOrder = 2
          object CBUseWeightLine: TCheckBox
            Left = 10
            Top = 99
            Width = 160
            Height = 17
            Caption = #21551#29992#37325#37327#26354#32447
            TabOrder = 4
          end
          object CBVoice: TCheckBox
            Left = 10
            Top = 120
            Width = 160
            Height = 17
            Caption = #21551#29992#35821#38899#25253#25968
            TabOrder = 5
          end
          object CBBackRecord: TCheckBox
            Left = 10
            Top = 141
            Width = 160
            Height = 17
            Caption = #21551#29992#21518#21488#35760#24405
            TabOrder = 6
          end
          object CBAutoRefresh: TCheckBox
            Left = 10
            Top = 183
            Width = 160
            Height = 17
            Caption = #21551#29992#33258#21160#21047#26032
            TabOrder = 8
          end
          object CBUseLog: TCheckBox
            Left = 10
            Top = 162
            Width = 160
            Height = 17
            Caption = #21551#29992#31995#32479#26085#24535
            TabOrder = 7
          end
          object CBPay: TCheckBox
            Left = 10
            Top = 78
            Width = 160
            Height = 17
            Caption = #21551#29992#25910#36135#21333#20301#25187#36153
            TabOrder = 3
          end
          object CBUseSaveInterval: TCheckBox
            Left = 10
            Top = 57
            Width = 160
            Height = 17
            Caption = #21551#29992#37325#22797#36807#30917#26102#38388#38480#21046
            TabOrder = 2
          end
          object CBUseTimeOutLimit: TCheckBox
            Left = 10
            Top = 36
            Width = 160
            Height = 17
            Caption = #21551#29992#20108#27425#36807#30917#36229#26102#38480#21046
            TabOrder = 1
          end
          object CBTareDiff: TCheckBox
            Left = 10
            Top = 15
            Width = 160
            Height = 17
            Caption = #21551#29992#30382#37325#36229#24046#25253#35686#12288#12288
            TabOrder = 0
          end
        end
        object GBWeight: TGroupBox
          Left = 8
          Top = 8
          Width = 180
          Height = 313
          Caption = #31216#37325
          TabOrder = 0
          object CBAllowSecondTare: TCheckBox
            Left = 10
            Top = 15
            Width = 160
            Height = 17
            Caption = #20801#35768#20108#27425#36807#30382
            TabOrder = 0
          end
          object CBAllowSecondGross: TCheckBox
            Left = 10
            Top = 38
            Width = 160
            Height = 17
            Caption = #20801#35768#20108#27425#36807#27611
            TabOrder = 1
          end
          object CBWriteTare: TCheckBox
            Left = 10
            Top = 60
            Width = 160
            Height = 17
            Caption = #33258#21160#35760#24405#36710#30382
            TabOrder = 2
          end
          object CBSavePicLocal: TCheckBox
            Left = 10
            Top = 106
            Width = 160
            Height = 17
            Caption = #36807#30917#22270#29255#23384#25918#26412#22320#30913#30424
            TabOrder = 4
          end
          object CBAutoSavePrepare: TCheckBox
            Left = 10
            Top = 151
            Width = 160
            Height = 17
            Caption = #33258#21160#20445#23384#39044#32622#20449#24687
            TabOrder = 6
          end
          object CBUseLastTare: TCheckBox
            Left = 10
            Top = 128
            Width = 160
            Height = 17
            Caption = #36873#25321#20351#29992#19978#27425#30382#37325
            TabOrder = 5
          end
          object CBUseBundleRate: TCheckBox
            Left = 10
            Top = 83
            Width = 160
            Height = 17
            Caption = #20351#29992#25187#29575#20195#26367#25187#37325
            TabOrder = 3
          end
          object CBWeightOneClick: TCheckBox
            Left = 10
            Top = 174
            Width = 160
            Height = 17
            Caption = #31216#37325#21518#33258#21160#20445#23384
            TabOrder = 7
          end
          object CBPrintAfterSave: TCheckBox
            Left = 10
            Top = 196
            Width = 160
            Height = 17
            Caption = #20445#23384#21518#33258#21160#25171#21360#30917#21333
            Checked = True
            State = cbChecked
            TabOrder = 8
          end
          object CBWaitForZero: TCheckBox
            Left = 10
            Top = 219
            Width = 160
            Height = 17
            Caption = #22238#38646#21518#20877#36807#30917
            TabOrder = 9
          end
          object CBAllowNotSteady: TCheckBox
            Left = 10
            Top = 242
            Width = 160
            Height = 17
            Caption = #19981#31283#23450#20063#20801#35768#36807#30917
            TabOrder = 10
          end
          object CBAllowModifyPrice: TCheckBox
            Left = 10
            Top = 264
            Width = 160
            Height = 17
            Caption = #25163#24037#20462#25913#21333#20215#21450#31995#25968
            Checked = True
            State = cbChecked
            TabOrder = 11
          end
          object CBAutoUpdateExpression: TCheckBox
            Left = 10
            Top = 287
            Width = 160
            Height = 17
            Caption = #23454#26102#26356#26032#33258#23450#20041#20844#24335
            TabOrder = 12
          end
        end
        object GBOther: TGroupBox
          Left = 560
          Top = 136
          Width = 180
          Height = 185
          Caption = #20854#20182
          TabOrder = 5
          object CBRecordLeft: TCheckBox
            Left = 10
            Top = 78
            Width = 160
            Height = 17
            Caption = #35760#24405#21097#20313#37327'('#22791#29992'18)'
            TabOrder = 3
          end
          object CBUseOutGlideNo: TCheckBox
            Left = 10
            Top = 15
            Width = 160
            Height = 17
            Caption = #20351#29992#20986#21378#27969#27700#21495'('#22791#29992'1)'
            TabOrder = 0
          end
          object CBUseManualFlag: TCheckBox
            Left = 10
            Top = 36
            Width = 160
            Height = 17
            Caption = #20351#29992#34917#21333#26631#24535'('#22791#29992'14)'
            TabOrder = 1
          end
          object CBRecordCorrect: TCheckBox
            Left = 10
            Top = 57
            Width = 160
            Height = 17
            Caption = #35760#24405#20462#27491#37327#65288#22791#29992'17'#65289
            TabOrder = 2
          end
          object CBDisconnectToZero: TCheckBox
            Left = 10
            Top = 98
            Width = 160
            Height = 17
            Caption = #20202#34920#26029#32447#24402#38646
            TabOrder = 4
          end
          object CBDoubleAdd: TCheckBox
            Left = 10
            Top = 119
            Width = 160
            Height = 17
            Caption = #21452#20202#34920#32047#21152
            TabOrder = 5
          end
          object CBNotAllowTareExceed: TCheckBox
            Left = 10
            Top = 140
            Width = 160
            Height = 17
            Caption = #36807#30382#19981#20801#35768#36229#39044#32622#30382#37325
            TabOrder = 6
          end
          object CBCompareLast: TCheckBox
            Left = 10
            Top = 161
            Width = 160
            Height = 17
            Caption = #19982#26368#36817#19968#27425#25187#36153#25968#25454#23545#27604
            TabOrder = 7
          end
        end
        object GBRecord: TGroupBox
          Left = 376
          Top = 215
          Width = 180
          Height = 106
          Caption = #35760#24405
          TabOrder = 3
          object CBAllowModifyGlideNo: TCheckBox
            Left = 10
            Top = 15
            Width = 160
            Height = 17
            Caption = #20801#35768#20462#25913#27969#27700#21495
            TabOrder = 0
          end
          object CBOnlyAllowInvalidNotFinished: TCheckBox
            Left = 10
            Top = 38
            Width = 160
            Height = 17
            Caption = #21482#20801#35768#20316#24223#26410#23436#25104#35760#24405
            TabOrder = 1
          end
          object CBDelHistory: TCheckBox
            Left = 10
            Top = 60
            Width = 160
            Height = 17
            Caption = #33258#21160#21024#38500#21382#21490#35760#24405
            TabOrder = 2
          end
          object CBDoubleClickModifyRecord: TCheckBox
            Left = 10
            Top = 83
            Width = 160
            Height = 17
            Caption = #21452#20987#21015#34920#20462#25913#35760#24405
            TabOrder = 3
          end
        end
        object GBPrint: TGroupBox
          Left = 560
          Top = 8
          Width = 180
          Height = 121
          Caption = #25171#21360
          TabOrder = 4
          object CBPrintTwo: TCheckBox
            Left = 10
            Top = 15
            Width = 160
            Height = 17
            Caption = #21516#26102#20004#21488#25171#21360#26426#25171#21360
            TabOrder = 0
          end
          object CBShowPrintDialog: TCheckBox
            Left = 10
            Top = 35
            Width = 160
            Height = 17
            Caption = #25171#21360#26426#36873#25321#23545#35805#26694
            TabOrder = 1
          end
          object CBDefaultPrintPicTicket: TCheckBox
            Left = 10
            Top = 55
            Width = 160
            Height = 17
            Caption = #40664#35748#25171#21360#22270#24418#30917#21333
            TabOrder = 2
          end
          object CBSelectTicketBeforePrint: TCheckBox
            Left = 10
            Top = 75
            Width = 160
            Height = 17
            Caption = #25171#21360#26102#36873#25321#30917#21333#26684#24335
            TabOrder = 3
          end
          object CBPrintNet: TCheckBox
            Left = 10
            Top = 95
            Width = 160
            Height = 17
            Caption = #21482#20801#35768#25171#21360#23436#25104#35760#24405
            TabOrder = 4
          end
        end
      end
      object TSWeightSetII: TTabSheet
        Caption = #31216#37325#35774#32622'II'
        ImageIndex = 3
        object Label7: TLabel
          Left = 23
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = #36755#20837#26694#34892#25968
        end
        object Label13: TLabel
          Left = 403
          Top = 18
          Width = 80
          Height = 13
          Caption = #31283#23450#27425#25968'    '
        end
        object lblUpdateTime: TLabel
          Left = 201
          Top = 109
          Width = 171
          Height = 13
          Caption = #20108#27425#36807#30917#38388#38548#19978#19979#38480'('#20998#38047')  '
          Layout = tlCenter
        end
        object Label5: TLabel
          Left = 453
          Top = 112
          Width = 7
          Height = 13
          Caption = '~'
        end
        object Label18: TLabel
          Left = 290
          Top = 228
          Width = 73
          Height = 13
          Caption = #25187#36153#26041#24335'   '
          Layout = tlCenter
        end
        object lblColorSel: TLabel
          Left = 560
          Top = 229
          Width = 105
          Height = 13
          Caption = #21015#34920#21333#21452#34892#39068#33394'  '
        end
        object SpOddColor: TShape
          Left = 672
          Top = 224
          Width = 25
          Height = 25
          Brush.Color = clBtnFace
          OnMouseDown = SpOddColorMouseDown
        end
        object SpEvenColor: TShape
          Left = 704
          Top = 224
          Width = 25
          Height = 25
          Brush.Color = clBtnFace
          OnMouseDown = SpOddColorMouseDown
        end
        object lblDayStart: TLabel
          Left = 560
          Top = 168
          Width = 106
          Height = 13
          Caption = #27599#26085#36215#22987#26102#38388'    '
        end
        object LEBackRecord: TLabeledEdit
          Left = 654
          Top = 15
          Width = 80
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #21518#21488#35760#24405#37325#37327' '
          LabelPosition = lpLeft
          TabOrder = 3
          Text = '1000'
        end
        object LEReturnZero: TLabeledEdit
          Left = 284
          Top = 15
          Width = 80
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #22238#38646#37325#37327' '
          LabelPosition = lpLeft
          TabOrder = 1
          Text = '10'
        end
        object SEDropDownCount: TSpinEdit
          Left = 108
          Top = 15
          Width = 80
          Height = 22
          DragMode = dmAutomatic
          MaxLength = 2
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 5
        end
        object LESumPoint: TLabeledEdit
          Left = 284
          Top = 46
          Width = 80
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #37329#39069#23567#25968#28857' '
          LabelPosition = lpLeft
          TabOrder = 5
          Text = '2'
        end
        object SESteadyCount: TSpinEdit
          Left = 472
          Top = 15
          Width = 80
          Height = 22
          MaxValue = 40
          MinValue = 2
          TabOrder = 2
          Value = 2
        end
        object LETareDiff: TLabeledEdit
          Left = 472
          Top = 76
          Width = 81
          Height = 21
          EditLabel.Width = 99
          EditLabel.Height = 13
          EditLabel.Caption = #30382#37325#36229#24046#33539#22260'(%)'
          LabelPosition = lpLeft
          TabOrder = 10
          Text = '5'
        end
        object GBGlideNoRule: TGroupBox
          Left = 16
          Top = 257
          Width = 513
          Height = 55
          Caption = #27969#27700#21495#35268#21017
          TabOrder = 28
          object Label10: TLabel
            Left = 16
            Top = 20
            Width = 41
            Height = 21
            AutoSize = False
            Caption = #21069#32512'1'
            Layout = tlCenter
          end
          object Label17: TLabel
            Left = 396
            Top = 20
            Width = 37
            Height = 21
            AutoSize = False
            Caption = #38271#24230#12288
            Layout = tlCenter
          end
          object Label20: TLabel
            Left = 208
            Top = 20
            Width = 49
            Height = 21
            AutoSize = False
            Caption = #21069#32512'2'
            Layout = tlCenter
          end
          object CBGlideCode1: TComboBox
            Left = 64
            Top = 20
            Width = 125
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = #19981#21551#29992
            Items.Strings = (
              #19981#21551#29992
              #36807#30917#22320#28857
              #36807#30917#31867#22411
              #36135#29289#32534#30721
              #25910#36135#21333#20301)
          end
          object EdtGlideLength: TEdit
            Left = 437
            Top = 20
            Width = 60
            Height = 21
            TabOrder = 2
            Text = '4'
          end
          object CBGlideCode2: TComboBox
            Left = 260
            Top = 20
            Width = 125
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 1
            TabOrder = 1
            Text = #24180#26376#26085
            Items.Strings = (
              #19981#21551#29992' '
              #24180#26376#26085
              #24180#26376)
          end
        end
        object LEMax: TLabeledEdit
          Left = 472
          Top = 164
          Width = 80
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #26368#22823#37327#31243' '
          LabelPosition = lpLeft
          TabOrder = 21
          Text = '150000'
        end
        object LEDatabaseAlarm: TLabeledEdit
          Left = 294
          Top = 135
          Width = 80
          Height = 21
          EditLabel.Width = 93
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#24211#19978#38480'(MB)'
          LabelPosition = lpLeft
          TabOrder = 17
          Text = '1024'
        end
        object LEPrinterBackRow: TLabeledEdit
          Left = 140
          Top = 225
          Width = 61
          Height = 21
          EditLabel.Width = 126
          EditLabel.Height = 13
          EditLabel.Caption = #25171#21360#21069#36864#32440#34892#25968'(mm) '
          LabelPosition = lpLeft
          TabOrder = 25
          Text = '0'
        end
        object BtnTestPrinter: TBitBtn
          Left = 216
          Top = 222
          Width = 65
          Height = 25
          Hint = #35813#21151#33021#21482#25903#25345#24182#21475#19978#30340'KX-P1121'
          Caption = #27979#35797
          ParentShowHint = False
          ShowHint = True
          TabOrder = 26
          OnClick = BtnTestPrinterClick
        end
        object LERange: TLabeledEdit
          Left = 654
          Top = 75
          Width = 80
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #20801#35768#27874#21160#33539#22260' '
          LabelPosition = lpLeft
          TabOrder = 11
          Text = '40'
        end
        object LECompleteHint: TLabeledEdit
          Left = 108
          Top = 195
          Width = 275
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#20445#23384#25552#31034' '
          LabelPosition = lpLeft
          TabOrder = 23
        end
        object LECarOutHint: TLabeledEdit
          Left = 464
          Top = 195
          Width = 269
          Height = 21
          EditLabel.Width = 59
          EditLabel.Height = 13
          EditLabel.Caption = #19979#31204#25552#31034' '
          LabelPosition = lpLeft
          TabOrder = 24
        end
        object LESumDivide: TLabeledEdit
          Left = 108
          Top = 46
          Width = 80
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #37329#39069#20998#24230#20540' '
          LabelPosition = lpLeft
          TabOrder = 4
          Text = '1'
        end
        object LEPicCount: TLabeledEdit
          Left = 108
          Top = 135
          Width = 80
          Height = 21
          Hint = #21482#38480#20110#36807#30917#22270#29255#23384#25918#22312#25968#25454#24211#20013#30340#24773#20917#19979
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #22270#29255#25968#37327#38480#21046' '
          LabelPosition = lpLeft
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          Text = '20000'
        end
        object LEQuanterPoint: TLabeledEdit
          Left = 654
          Top = 45
          Width = 80
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #26041#37327#23567#25968#28857' '
          LabelPosition = lpLeft
          TabOrder = 7
          Text = '2'
        end
        object LEQuanterDivide: TLabeledEdit
          Left = 472
          Top = 46
          Width = 80
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #26041#37327#20998#24230#20540' '
          LabelPosition = lpLeft
          TabOrder = 6
          Text = '1'
        end
        object LEAutoRefreshInterval: TLabeledEdit
          Left = 286
          Top = 76
          Width = 80
          Height = 21
          EditLabel.Width = 86
          EditLabel.Height = 13
          EditLabel.Caption = #21047#26032#38388#38548'('#31186') '
          LabelPosition = lpLeft
          TabOrder = 9
          Text = '60'
        end
        object LEPicPath: TLabeledEdit
          Left = 108
          Top = 165
          Width = 245
          Height = 21
          Hint = #21452#20987#24674#22797#40664#35748#36335#24452
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #36807#30917#22270#29255#36335#24452' '
          LabelPosition = lpLeft
          ParentShowHint = False
          ShowHint = True
          TabOrder = 20
          OnDblClick = LEPicPathDblClick
        end
        object RGSimpleMode: TRadioGroup
          Left = 540
          Top = 257
          Width = 193
          Height = 54
          Caption = #31616#21333#36807#30917#31532#19968#27425
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #36807#27611#37325
            #36807#30382#37325)
          TabOrder = 29
        end
        object LETicketSelHeight: TLabeledEdit
          Left = 654
          Top = 135
          Width = 80
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #30917#21333#36873#26694#39640#24230' '
          LabelPosition = lpLeft
          TabOrder = 19
          Text = '25'
        end
        object LEDisconectCheckCount: TLabeledEdit
          Left = 654
          Top = 105
          Width = 80
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #26029#32447#26816#27979#27425#25968' '
          LabelPosition = lpLeft
          TabOrder = 12
          Text = '10'
        end
        object LEWeightSaveInterval: TLabeledEdit
          Left = 109
          Top = 106
          Width = 80
          Height = 21
          EditLabel.Width = 85
          EditLabel.Height = 13
          EditLabel.Caption = #37325#22797#36807#30917#38388#38548' '
          LabelPosition = lpLeft
          TabOrder = 13
          Text = '0'
        end
        object LENotVisibleWeight: TLabeledEdit
          Left = 472
          Top = 135
          Width = 80
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #19981#21487#35270#37325#37327' '
          LabelPosition = lpLeft
          TabOrder = 18
        end
        object EdtMinUpdateTime: TEdit
          Left = 368
          Top = 106
          Width = 80
          Height = 21
          TabOrder = 14
          Text = '0'
        end
        object EdtMaxUpdateTime: TEdit
          Left = 472
          Top = 106
          Width = 80
          Height = 21
          TabOrder = 15
          Text = '1200'
        end
        object CBPayType: TComboBox
          Left = 368
          Top = 225
          Width = 177
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 27
        end
        object MEDayStart: TMaskEdit
          Left = 654
          Top = 165
          Width = 80
          Height = 21
          EditMask = '!90:00:00;1;_'
          MaxLength = 8
          TabOrder = 22
          Text = '  :  :  '
        end
        object LERealPoint: TLabeledEdit
          Left = 108
          Top = 77
          Width = 80
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #23454#37325#23567#25968#28857' '
          LabelPosition = lpLeft
          TabOrder = 8
          Text = '2'
        end
      end
      object TSOther: TTabSheet
        Caption = #20854#23427#35774#32622
        ImageIndex = 4
        object lblVoice: TLabel
          Left = 20
          Top = 180
          Width = 104
          Height = 13
          Caption = #35821#38899#25773#25253#36895#24230#12288#12288
        end
        object PLogin: TPanel
          Left = 16
          Top = 129
          Width = 425
          Height = 40
          BevelInner = bvLowered
          TabOrder = 7
          object LELoginPass: TLabeledEdit
            Left = 312
            Top = 12
            Width = 100
            Height = 21
            EditLabel.Width = 33
            EditLabel.Height = 13
            EditLabel.Caption = #23494#30721' '
            LabelPosition = lpLeft
            PasswordChar = '*'
            TabOrder = 2
          end
          object LELoginName: TLabeledEdit
            Left = 144
            Top = 12
            Width = 100
            Height = 21
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = #30331#24405#21517' '
            LabelPosition = lpLeft
            TabOrder = 1
          end
          object CBAutoLogin: TCheckBox
            Left = 9
            Top = 13
            Width = 81
            Height = 17
            Caption = #33258#21160#30331#24405
            TabOrder = 0
          end
        end
        object CBXMLExport: TCheckBox
          Left = 281
          Top = 53
          Width = 152
          Height = 16
          Caption = #20851#38381#36719#20214#26102#23548#20986'XML'
          TabOrder = 5
        end
        object GBXMLType: TGroupBox
          Left = 271
          Top = 75
          Width = 169
          Height = 45
          Caption = 'XML'#31867#22411
          TabOrder = 6
          object RBAttr: TRadioButton
            Left = 16
            Top = 21
            Width = 81
            Height = 17
            Caption = #23646#24615#22411
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RBChild: TRadioButton
            Left = 91
            Top = 21
            Width = 73
            Height = 17
            Caption = #33410#28857#22411
            TabOrder = 1
          end
        end
        object CBAutoShutdown: TCheckBox
          Left = 17
          Top = 25
          Width = 96
          Height = 17
          Caption = #33258#21160#20851#26426
          TabOrder = 3
          OnClick = CBAutoShutdownClick
        end
        object DTPClose: TDateTimePicker
          Left = 121
          Top = 21
          Width = 144
          Height = 24
          Date = 39157.000000000000000000
          Time = 39157.000000000000000000
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Kind = dtkTime
          ParentFont = False
          TabOrder = 1
        end
        object CBAutoRun: TCheckBox
          Left = 281
          Top = 24
          Width = 157
          Height = 17
          Caption = #24320#26426#33258#21160#36816#34892
          TabOrder = 2
        end
        object GBSaveType: TGroupBox
          Left = 456
          Top = 8
          Width = 281
          Height = 273
          Caption = #33258#21160#20445#23384#26041#24335
          TabOrder = 0
          object lblSaveByIntervalHint: TLabel
            Left = 16
            Top = 48
            Width = 209
            Height = 26
            Caption = #37197#21512#8220#31216#37325#35774#32622'II'#8221#20013#30340#31283#23450#27425#25968#21450#22238#38646#37325#37327#19968#21516#20351#29992
            WordWrap = True
          end
          object lblSaveByTimeHint: TLabel
            Left = 16
            Top = 112
            Width = 209
            Height = 26
            Caption = #20351#29992#26102#35831#21246#36873'<'#31216#37325#35774#32622'>'#20013#19981#31283#23450#20063#20801#35768#36807#30917#65292#35843#25972#22238#38646#37325#37327
            WordWrap = True
          end
          object lblSecond: TLabel
            Left = 200
            Top = 88
            Width = 27
            Height = 13
            Caption = #31186'  '
          end
          object lblSaveByQuantityHint: TLabel
            Left = 16
            Top = 232
            Width = 209
            Height = 26
            Caption = #37197#21512#8220#31216#37325#35774#32622'II'#8221#20013#30340#31283#23450#27425#25968#21450#22238#38646#37325#37327#19968#21516#20351#29992
            WordWrap = True
          end
          object RBSaveBySteady: TRadioButton
            Left = 16
            Top = 24
            Width = 193
            Height = 17
            Caption = #31283#23450#21518#33258#21160#20445#23384
            TabOrder = 0
          end
          object RBSaveByTime: TRadioButton
            Left = 16
            Top = 88
            Width = 113
            Height = 17
            Caption = #23450#26102#33258#21160#20445#23384
            TabOrder = 2
          end
          object SEInterval: TSpinEdit
            Left = 133
            Top = 86
            Width = 53
            Height = 22
            MaxValue = 3600
            MinValue = 1
            TabOrder = 3
            Value = 5
          end
          object RBSaveByQuantity: TRadioButton
            Left = 16
            Top = 152
            Width = 113
            Height = 17
            Caption = #23450#37327#33258#21160#20445#23384
            Checked = True
            TabOrder = 4
            TabStop = True
          end
          object LEQuantity: TLabeledEdit
            Left = 72
            Top = 176
            Width = 161
            Height = 21
            EditLabel.Width = 46
            EditLabel.Height = 13
            EditLabel.Caption = #23450#37327#20540' '
            LabelPosition = lpLeft
            TabOrder = 5
            Text = '10000'
          end
          object CBSaveAfterReturnZero: TCheckBox
            Left = 147
            Top = 24
            Width = 94
            Height = 17
            Caption = #22238#38646#21518#20445#23384
            TabOrder = 1
          end
          object LEUpperLimit: TLabeledEdit
            Left = 72
            Top = 204
            Width = 49
            Height = 21
            EditLabel.Width = 52
            EditLabel.Height = 13
            EditLabel.Caption = #35823#24046#19978#38480
            LabelPosition = lpLeft
            TabOrder = 6
            Text = '10'
          end
          object LELowerLimit: TLabeledEdit
            Left = 184
            Top = 204
            Width = 49
            Height = 21
            EditLabel.Width = 52
            EditLabel.Height = 13
            EditLabel.Caption = #35823#24046#19979#38480
            LabelPosition = lpLeft
            TabOrder = 7
            Text = '10'
          end
        end
        object RGSumType: TRadioGroup
          Left = 16
          Top = 52
          Width = 249
          Height = 68
          Caption = #37329#39069#36827#20301#26041#24335
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #21482#33293#19981#20837
            #22235#33293#20116#20837
            #21482#20837#19981#33293
            #22235#33293#20845#20837#20116#25104#21452'    ')
          TabOrder = 4
        end
        object TBVoiceRate: TTrackBar
          Left = 16
          Top = 198
          Width = 425
          Height = 40
          Hint = #35821#36895'(-10~10)'
          Min = -10
          ParentShowHint = False
          PageSize = 1
          ShowHint = True
          TabOrder = 8
          TickMarks = tmBoth
        end
      end
    end
    object BitBtn1: TBitBtn
      Left = 168
      Top = 368
      Width = 100
      Height = 43
      Caption = #30830#23450
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 1
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000007DB90C0075AC0E0075AC0E000000
        0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000007AB40D007DB90C0084C50B007DB90C0075AC
        0E0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000007AB40D0071A6100084C50B0084C50B0087C90A0089CD
        090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000007AB40D0071A6100084C50B008CD207007AB40D007DB90C0080BF
        0B0089CD090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00007AB40D0071A6100092DB05008CD2070075AC0E000000000080BF0B0084C5
        0B0089CD090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00006EA1110098E6030075AC0E006EA1110000000000FFFFFF000000000084C5
        0B0089CD090089CD090000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        0000618D130075AC0E006592120000000000FFFFFF00FFFFFF000000000087C9
        0A008CD2070084C50B0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00008CD2070092DB050087C90A0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        000090D7060092DB050084C50B0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000096E3040098E6030087C90A0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF000000000096E304009AEA020084C50B0000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000009AEA020092DB050084C50B0000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF000000000092DB05007AB40D0092DB050000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
    object BitBtn2: TBitBtn
      Left = 472
      Top = 368
      Width = 100
      Height = 43
      Cancel = True
      Caption = #21462#28040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ModalResult = 2
      ParentFont = False
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00005B5BF5005555F100504FED004B4CEA00393ADF0000000000000000001313
        C5002827D300201FCD001B1BCB001313C50000000000FFFFFF00FFFFFF00FFFF
        FF00000000005B5BF500504FED005555F1004B4CEA001B1BCB0005059D00504F
        ED006B6BFF006B6BFF00201FCD0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000005B5BF500504FED005555F1004B4CEA001B1BCB00504F
        ED006B6BFF002D2DD60000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343E5006464
        FA00393ADF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005B5BF500504FED005555F1004343
        E50000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00000000005F5FF8004B4CEA00504FED004B4C
        EA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00000000006B6BFF003D3DE1005F5FF8004B4CEA005352
        EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00000000006B6BFF003434DB006B6BFF001B1BCB005F5FF8004B4C
        EA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00000000006B6BFF002827D3002D2DD6006B6BFF0005059D003D3DE1005F5F
        F8004B4CEA005352EF004B4CEA0000000000FFFFFF00FFFFFF00FFFFFF000000
        00006B6BFF006B6BFF006B6BFF006B6BFF006B6BFF0000000000000000006B6B
        FF005F5FF8005B5BF500504FED004B4CEA0000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF000000
        00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
  end
end
