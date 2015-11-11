object SoftwareSetForm: TSoftwareSetForm
  Left = 554
  Top = 197
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #36719#20214#31995#32479#35774#32622
  ClientHeight = 386
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
    Width = 532
    Height = 386
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object PCMain: TPageControl
      Left = 12
      Top = 10
      Width = 509
      Height = 367
      ActivePage = TSWeightSetII
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
          Left = 256
          Top = 8
          Width = 209
          Height = 13
          AutoSize = False
          Caption = #30005#35805#21495#30721
        end
        object Label4: TLabel
          Left = 16
          Top = 50
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #20202#34920#35745#37327#21333#20301
        end
        object Label9: TLabel
          Left = 256
          Top = 50
          Width = 97
          Height = 13
          AutoSize = False
          Caption = #36719#20214#35745#37327#21333#20301
        end
        object Label12: TLabel
          Left = 19
          Top = 101
          Width = 75
          Height = 13
          Caption = #30917#21333#25171#21360#26426'     '
        end
        object Label19: TLabel
          Left = 19
          Top = 133
          Width = 75
          Height = 13
          Caption = #22270#24418#25171#21360#26426'     '
        end
        object EdtCompany: TEdit
          Left = 16
          Top = 24
          Width = 230
          Height = 21
          TabOrder = 0
        end
        object EdtTel: TEdit
          Left = 256
          Top = 24
          Width = 230
          Height = 21
          TabOrder = 1
          OnKeyPress = EdtTelKeyPress
        end
        object CBMeterUnit: TComboBox
          Left = 16
          Top = 67
          Width = 230
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 2
          Items.Strings = (
            #20844'  '#26020
            'KG'
            'kg'
            #21544
            'T'
            't')
        end
        object CBSoftUnit: TComboBox
          Left = 256
          Top = 67
          Width = 230
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            #20844'  '#26020
            'KG'
            'kg'
            #21544
            'T'
            't')
        end
        object LEAddr: TLabeledEdit
          Left = 97
          Top = 189
          Width = 148
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #30917#31449#21495#12288
          LabelPosition = lpLeft
          TabOrder = 4
          Text = 'A'
        end
        object CBPrinter1: TComboBox
          Left = 96
          Top = 97
          Width = 149
          Height = 21
          ItemHeight = 0
          TabOrder = 5
        end
        object GBTicketType: TGroupBox
          Left = 256
          Top = 97
          Width = 233
          Height = 48
          Caption = #30917#21333#31867#22411
          TabOrder = 6
          object RBFirstGeneration: TRadioButton
            Left = 24
            Top = 22
            Width = 80
            Height = 17
            Caption = #19968#20195#30917#21333
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RBSecondGeneration: TRadioButton
            Left = 128
            Top = 22
            Width = 80
            Height = 17
            Caption = #20108#20195#30917#21333
            TabOrder = 1
          end
        end
        object CBPrinter2: TComboBox
          Left = 96
          Top = 129
          Width = 149
          Height = 21
          ItemHeight = 0
          TabOrder = 7
        end
        object LEReportTitle: TLabeledEdit
          Left = 96
          Top = 160
          Width = 393
          Height = 21
          EditLabel.Width = 78
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#25253#34920#25260#22836'  '
          LabelPosition = lpLeft
          TabOrder = 8
          Text = #25968#25454#25253#34920
        end
      end
      object TSWeightSet: TTabSheet
        Caption = #31216#37325#35774#32622
        ImageIndex = 2
        object CBEnterAsTab: TCheckBox
          Left = 348
          Top = 16
          Width = 150
          Height = 17
          Caption = #22238#36710#38190#20195#26367'Tab'#38190
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CBAutoDropDown: TCheckBox
          Left = 8
          Top = 16
          Width = 150
          Height = 17
          Caption = #33258#21160#24377#24320#21015#34920#26694
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object CBDelHistory: TCheckBox
          Left = 178
          Top = 133
          Width = 150
          Height = 17
          Caption = #33258#21160#21024#38500#21382#21490#35760#24405
          TabOrder = 2
        end
        object CBShowPrepare: TCheckBox
          Left = 178
          Top = 45
          Width = 150
          Height = 17
          Caption = #19979#25289#26694#21452#20987#36873#25321
          TabOrder = 3
        end
        object CBAllowSecondTare: TCheckBox
          Left = 8
          Top = 74
          Width = 150
          Height = 17
          Caption = #20801#35768#20108#27425#36807#30382
          TabOrder = 4
        end
        object CBAllowSecondGross: TCheckBox
          Left = 178
          Top = 74
          Width = 150
          Height = 17
          Caption = #20801#35768#20108#27425#36807#27611
          TabOrder = 5
        end
        object CBWriteTare: TCheckBox
          Left = 178
          Top = 103
          Width = 150
          Height = 17
          Caption = #33258#21160#35760#24405#36710#30382
          TabOrder = 6
        end
        object CBUseCode: TCheckBox
          Left = 8
          Top = 45
          Width = 150
          Height = 17
          Caption = #20351#29992#20195#30721#36755#20837
          Checked = True
          State = cbChecked
          TabOrder = 7
        end
        object CBAutoComplete: TCheckBox
          Left = 178
          Top = 16
          Width = 150
          Height = 17
          Caption = #33258#21160#34917#20840#19979#25289#26694
          TabOrder = 8
        end
        object CBWaitForZero: TCheckBox
          Left = 348
          Top = 104
          Width = 150
          Height = 17
          Caption = #22238#38646#21518#20877#36807#30917
          TabOrder = 9
        end
        object CBVoice: TCheckBox
          Left = 348
          Top = 74
          Width = 150
          Height = 17
          Caption = #21551#29992#35821#38899#25253#25968
          TabOrder = 10
        end
        object CBUseBundleRate: TCheckBox
          Left = 348
          Top = 133
          Width = 150
          Height = 17
          Caption = #20351#29992#25187#29575#20195#26367#25187#37325
          TabOrder = 11
        end
        object CBAllowNotSteady: TCheckBox
          Left = 348
          Top = 162
          Width = 150
          Height = 17
          Caption = #19981#31283#23450#20063#20801#35768#36807#30917
          TabOrder = 12
        end
        object CBSelectTicketBeforePrint: TCheckBox
          Left = 178
          Top = 162
          Width = 150
          Height = 17
          Caption = #25171#21360#26102#36873#25321#30917#21333#26684#24335
          TabOrder = 13
        end
        object CBTareDiff: TCheckBox
          Left = 178
          Top = 191
          Width = 150
          Height = 17
          Caption = #21551#29992#30382#37325#36229#24046#25253#35686#12288#12288
          TabOrder = 14
        end
        object CBPay: TCheckBox
          Left = 8
          Top = 162
          Width = 150
          Height = 17
          Caption = #25353#25910#36135#21333#20301#25187#36153
          TabOrder = 15
        end
        object CBSavePicLocal: TCheckBox
          Left = 8
          Top = 191
          Width = 160
          Height = 17
          Caption = #36807#30917#22270#29255#23384#25918#26412#22320#30913#30424
          TabOrder = 16
        end
        object CBUseLastTare: TCheckBox
          Left = 8
          Top = 220
          Width = 150
          Height = 17
          Caption = #36873#25321#20351#29992#19978#27425#30382#37325
          TabOrder = 17
        end
        object CBSay: TCheckBox
          Left = 348
          Top = 45
          Width = 150
          Height = 17
          Caption = #25773#25253#25991#26412#26694
          TabOrder = 18
        end
        object CBBackRecord: TCheckBox
          Left = 8
          Top = 133
          Width = 150
          Height = 17
          Caption = #21551#29992#21518#21488#35760#24405
          TabOrder = 19
        end
        object CBAutoSavePrepare: TCheckBox
          Left = 348
          Top = 191
          Width = 150
          Height = 17
          Caption = #33258#21160#20445#23384#39044#32622#20449#24687
          TabOrder = 20
        end
        object CBUseWeightLine: TCheckBox
          Left = 8
          Top = 103
          Width = 150
          Height = 17
          Caption = #24320#21551#37325#37327#26354#32447
          TabOrder = 21
        end
        object CBAllowModifyPrice: TCheckBox
          Left = 8
          Top = 249
          Width = 169
          Height = 17
          Caption = #25163#24037#20462#25913#21333#20215#21450#31995#25968
          Checked = True
          State = cbChecked
          TabOrder = 22
        end
        object CBPrintNet: TCheckBox
          Left = 178
          Top = 220
          Width = 150
          Height = 17
          Caption = #21482#20801#35768#25171#21360#23436#25104#35760#24405
          TabOrder = 23
        end
        object CBReadLocal: TCheckBox
          Left = 348
          Top = 220
          Width = 150
          Height = 17
          Caption = #21482#20801#35768#26597#30475#26412#31449#25968#25454
          TabOrder = 24
        end
        object CBPrintAfterSave: TCheckBox
          Left = 348
          Top = 249
          Width = 151
          Height = 17
          Caption = #20445#23384#21518#33258#21160#25171#21360#30917#21333
          Checked = True
          State = cbChecked
          TabOrder = 25
        end
        object CBUseTimeOutLimit: TCheckBox
          Left = 178
          Top = 248
          Width = 167
          Height = 17
          Caption = #21551#29992#20108#27425#36807#30917#36229#26102#38480#21046
          TabOrder = 26
        end
      end
      object TSWeightSetII: TTabSheet
        Caption = #31216#37325#35774#32622'II'
        ImageIndex = 3
        object Label15: TLabel
          Left = 440
          Top = 112
          Width = 48
          Height = 13
          Caption = #20998#38047#12288#12288
        end
        object Label7: TLabel
          Left = 15
          Top = 20
          Width = 85
          Height = 13
          AutoSize = False
          Caption = #36755#20837#26694#34892#25968
        end
        object Label13: TLabel
          Left = 351
          Top = 19
          Width = 60
          Height = 13
          Caption = #31283#23450#27425#25968'    '
        end
        object Label3: TLabel
          Left = 160
          Top = 83
          Width = 8
          Height = 13
          Caption = '%'
        end
        object Label16: TLabel
          Left = 166
          Top = 174
          Width = 26
          Height = 13
          Caption = 'cm'#12288
        end
        object Label18: TLabel
          Left = 336
          Top = 212
          Width = 132
          Height = 13
          Caption = #25353#25910#36135#21333#20301#25187#36153#26041#24335'        '
        end
        object LETimeOut: TLabeledEdit
          Left = 400
          Top = 109
          Width = 33
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #36807#30917#38388#38548'    '
          LabelPosition = lpLeft
          TabOrder = 1
          Text = '30'
        end
        object LEBackRecord: TLabeledEdit
          Left = 103
          Top = 48
          Width = 66
          Height = 21
          EditLabel.Width = 87
          EditLabel.Height = 13
          EditLabel.Caption = #21518#21488#35760#24405#37325#37327'     '
          LabelPosition = lpLeft
          TabOrder = 2
          Text = '1000'
        end
        object LEReturnZero: TLabeledEdit
          Left = 261
          Top = 16
          Width = 50
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #22238#38646#37325#37327'    '
          LabelPosition = lpLeft
          TabOrder = 3
          Text = '10'
        end
        object SEDropDownCount: TSpinEdit
          Left = 104
          Top = 16
          Width = 65
          Height = 22
          DragMode = dmAutomatic
          MaxLength = 2
          MaxValue = 10
          MinValue = 1
          TabOrder = 4
          Value = 5
        end
        object LESumPoint: TLabeledEdit
          Left = 415
          Top = 48
          Width = 50
          Height = 21
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = #37329#39069#23567#25968#28857'   '
          LabelPosition = lpLeft
          TabOrder = 0
          Text = '2'
        end
        object SESteadyCount: TSpinEdit
          Left = 415
          Top = 16
          Width = 50
          Height = 22
          MaxValue = 40
          MinValue = 2
          TabOrder = 5
          Value = 2
        end
        object LETareDiff: TLabeledEdit
          Left = 102
          Top = 80
          Width = 50
          Height = 21
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = #30382#37325#36229#24046#33539#22260#12288
          LabelPosition = lpLeft
          TabOrder = 6
          Text = '5'
        end
        object GBGlideNoRule: TGroupBox
          Left = 16
          Top = 196
          Width = 305
          Height = 63
          Caption = #27969#27700#21495#35268#21017
          TabOrder = 7
          object Label10: TLabel
            Left = 16
            Top = 16
            Width = 105
            Height = 18
            AutoSize = False
            Caption = #21069#32512'1'
            Layout = tlCenter
          end
          object Label17: TLabel
            Left = 224
            Top = 16
            Width = 65
            Height = 19
            AutoSize = False
            Caption = #38271#24230#12288
            Layout = tlCenter
          end
          object Label20: TLabel
            Left = 136
            Top = 16
            Width = 73
            Height = 18
            AutoSize = False
            Caption = #21069#32512'2'
            Layout = tlCenter
          end
          object CBGlideCode1: TComboBox
            Left = 16
            Top = 36
            Width = 105
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = #19981#21551#29992
            Items.Strings = (
              #19981#21551#29992
              #36807#30917#22320#28857
              #36135#29289#32534#30721
              #25910#36135#21333#20301)
          end
          object EdtGlideLength: TEdit
            Left = 224
            Top = 36
            Width = 65
            Height = 21
            TabOrder = 1
            Text = '4'
          end
          object CBGlideCode2: TComboBox
            Left = 132
            Top = 36
            Width = 81
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 1
            TabOrder = 2
            Text = #24180#26376#26085
            Items.Strings = (
              #19981#21551#29992' '
              #24180#26376#26085
              #24180#26376)
          end
        end
        object LEMax: TLabeledEdit
          Left = 264
          Top = 79
          Width = 49
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #26368#22823#37327#31243#12288#12288
          LabelPosition = lpLeft
          TabOrder = 8
          Text = '150000'
        end
        object LEDatabaseAlarm: TLabeledEdit
          Left = 408
          Top = 170
          Width = 57
          Height = 21
          EditLabel.Width = 130
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#24211#25253#35686#19978#38480'(MB)'#12288#12288
          LabelPosition = lpLeft
          TabOrder = 9
          Text = '1024'
        end
        object LEPrinterBackRow: TLabeledEdit
          Left = 122
          Top = 171
          Width = 41
          Height = 21
          EditLabel.Width = 102
          EditLabel.Height = 13
          EditLabel.Caption = #25171#21360#21069#36864#32440#34892#25968#12288'  '
          LabelPosition = lpLeft
          TabOrder = 10
          Text = '1'
        end
        object BtnTestPrinter: TBitBtn
          Left = 194
          Top = 169
          Width = 57
          Height = 25
          Hint = #35813#21151#33021#21482#25903#25345#24182#21475#19978#30340'KX-P1121'
          Caption = #27979#35797
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          OnClick = BtnTestPrinterClick
        end
        object LERange: TLabeledEdit
          Left = 415
          Top = 79
          Width = 50
          Height = 21
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = #20801#35768#27874#21160#33539#22260'    '
          LabelPosition = lpLeft
          TabOrder = 12
          Text = '40'
        end
        object LECompleteHint: TLabeledEdit
          Left = 104
          Top = 140
          Width = 145
          Height = 21
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = #25968#25454#20445#23384#25552#31034'    '
          LabelPosition = lpLeft
          TabOrder = 13
        end
        object LEMeterShowMode: TLabeledEdit
          Left = 104
          Top = 111
          Width = 63
          Height = 21
          EditLabel.Width = 90
          EditLabel.Height = 13
          EditLabel.Caption = #20202#34920#26174#31034#26684#24335'      '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 14
          Text = '0.00'
        end
        object LECarOutHint: TLabeledEdit
          Left = 336
          Top = 140
          Width = 129
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #19979#31204#25552#31034'    '
          LabelPosition = lpLeft
          TabOrder = 15
        end
        object LESumDivide: TLabeledEdit
          Left = 263
          Top = 48
          Width = 50
          Height = 21
          EditLabel.Width = 69
          EditLabel.Height = 13
          EditLabel.Caption = #37329#39069#20998#24230#20540'   '
          LabelPosition = lpLeft
          TabOrder = 16
          Text = '1'
        end
        object LEPicCount: TLabeledEdit
          Left = 264
          Top = 108
          Width = 50
          Height = 21
          Hint = #21482#38480#20110#36807#30917#22270#29255#23384#25918#22312#25968#25454#24211#20013#30340#24773#20917#19979
          EditLabel.Width = 84
          EditLabel.Height = 13
          EditLabel.Caption = #22270#29255#25968#37327#38480#21046'    '
          LabelPosition = lpLeft
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          Text = '20000'
        end
        object CBPayType: TComboBox
          Left = 328
          Top = 232
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 18
        end
      end
      object TSCostSet: TTabSheet
        Caption = #36807#30917#36153#35774#32622
        ImageIndex = 4
        object CBManualInput: TCheckBox
          Left = 124
          Top = 20
          Width = 81
          Height = 17
          Caption = #25163#24037#36755#20837
          TabOrder = 0
        end
        object LEPoint: TLabeledEdit
          Left = 432
          Top = 190
          Width = 49
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #23567#25968#28857#20301#25968'    '
          LabelPosition = lpLeft
          TabOrder = 1
          Text = '0'
        end
        object CBUsePound: TCheckBox
          Left = 20
          Top = 20
          Width = 101
          Height = 17
          Caption = #26159#21542#25910#36153
          TabOrder = 2
        end
        object GBScale: TGroupBox
          Left = 13
          Top = 42
          Width = 476
          Height = 127
          Caption = #36215#22987#33539#22260
          TabOrder = 3
          object Label5: TLabel
            Left = 24
            Top = 19
            Width = 60
            Height = 13
            Caption = #36215#22987#37325#37327#12288
          end
          object Label6: TLabel
            Left = 152
            Top = 19
            Width = 60
            Height = 13
            Caption = #19978#38480#37325#37327#12288
          end
          object Label8: TLabel
            Left = 280
            Top = 43
            Width = 48
            Height = 13
            Caption = #25910#36153#20026#12288
          end
          object Label11: TLabel
            Left = 280
            Top = 67
            Width = 48
            Height = 13
            Caption = #25910#36153#20026#12288
          end
          object Label14: TLabel
            Left = 280
            Top = 91
            Width = 48
            Height = 13
            Caption = #25910#36153#20026#12288
          end
          object EdtPound1: TEdit
            Left = 16
            Top = 39
            Width = 120
            Height = 21
            TabOrder = 0
            Text = '500'
          end
          object EdtPound2: TEdit
            Left = 150
            Top = 39
            Width = 120
            Height = 21
            TabOrder = 1
            Text = '10000'
          end
          object EdtPound3: TEdit
            Left = 16
            Top = 63
            Width = 120
            Height = 21
            TabOrder = 2
            Text = '10000'
          end
          object EdtPound4: TEdit
            Left = 150
            Top = 63
            Width = 120
            Height = 21
            TabOrder = 3
            Text = '100000'
          end
          object EdtPound5: TEdit
            Left = 16
            Top = 87
            Width = 120
            Height = 21
            TabOrder = 4
            Text = '100000'
          end
          object EdtPound6: TEdit
            Left = 150
            Top = 87
            Width = 120
            Height = 21
            TabOrder = 5
            Text = '120000'
          end
          object EdtInitial: TLabeledEdit
            Left = 331
            Top = 39
            Width = 90
            Height = 21
            EditLabel.Width = 12
            EditLabel.Height = 13
            EditLabel.Caption = #20803
            LabelPosition = lpRight
            TabOrder = 8
            Text = '5'
          end
          object EdtUnit: TLabeledEdit
            Left = 331
            Top = 63
            Width = 90
            Height = 21
            EditLabel.Width = 41
            EditLabel.Height = 13
            EditLabel.Caption = #20803'/'#21544#12288
            LabelPosition = lpRight
            TabOrder = 6
            Text = '1'
          end
          object EdtUnit2: TLabeledEdit
            Left = 331
            Top = 87
            Width = 90
            Height = 21
            EditLabel.Width = 41
            EditLabel.Height = 13
            EditLabel.Caption = #20803'/'#21544#12288
            LabelPosition = lpRight
            TabOrder = 7
            Text = '1.5'
          end
        end
        object GBCostType: TGroupBox
          Left = 12
          Top = 179
          Width = 333
          Height = 86
          Caption = #25910#36153#35745#31639#26041#24335
          TabOrder = 4
          object RBTwo: TRadioButton
            Left = 176
            Top = 26
            Width = 150
            Height = 17
            Caption = #25353'"'#27611#37325'+'#30382#37325'"'#35745#31639
            TabOrder = 0
          end
          object RBGross: TRadioButton
            Left = 16
            Top = 27
            Width = 150
            Height = 17
            Caption = #25353'"'#27611#37325'"'#35745#31639#12288#12288
            Checked = True
            TabOrder = 1
            TabStop = True
          end
          object RBNet: TRadioButton
            Left = 16
            Top = 56
            Width = 150
            Height = 17
            Caption = #25353'"'#20928#37325'"'#35745#31639
            TabOrder = 2
          end
        end
      end
      object TSOther: TTabSheet
        Caption = #20854#23427#35774#32622
        ImageIndex = 4
        object lblVoice: TLabel
          Left = 341
          Top = 193
          Width = 96
          Height = 13
          Caption = #35821#38899#25773#25253#36895#24230#12288#12288
        end
        object CBXMLExport: TCheckBox
          Left = 18
          Top = 106
          Width = 190
          Height = 16
          Caption = #20851#38381#36719#20214#26102#23548#20986'XML'
          TabOrder = 0
        end
        object GBXMLType: TGroupBox
          Left = 15
          Top = 127
          Width = 210
          Height = 50
          Caption = 'XML'#31867#22411
          TabOrder = 1
          object RBAttr: TRadioButton
            Left = 24
            Top = 24
            Width = 81
            Height = 17
            Caption = #23646#24615#22411
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RBChild: TRadioButton
            Left = 112
            Top = 24
            Width = 81
            Height = 17
            Caption = #33410#28857#22411
            TabOrder = 1
          end
        end
        object CBAutoRun: TCheckBox
          Left = 17
          Top = 80
          Width = 192
          Height = 17
          Caption = #24320#26426#36816#34892
          TabOrder = 2
        end
        object CBAutoShutdown: TCheckBox
          Left = 17
          Top = 25
          Width = 76
          Height = 17
          Caption = #33258#21160#20851#26426
          TabOrder = 3
          OnClick = CBAutoShutdownClick
        end
        object DTPClose: TDateTimePicker
          Left = 105
          Top = 22
          Width = 120
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
          TabOrder = 4
        end
        object GBSaveType: TGroupBox
          Left = 248
          Top = 16
          Width = 241
          Height = 161
          Caption = #33258#21160#20445#23384#26041#24335
          TabOrder = 5
          object lblSaveByIntervalHint: TLabel
            Left = 24
            Top = 48
            Width = 204
            Height = 26
            Caption = #37197#21512#8220#31216#37325#35774#32622'II'#8221#20013#30340#31283#23450#27425#25968#21450#22238#38646#37325#37327#19968#21516#20351#29992
            WordWrap = True
          end
          object lblSaveByTimeHint: TLabel
            Left = 24
            Top = 112
            Width = 192
            Height = 26
            Caption = #20351#29992#26102#35831#21246#36873'<'#31216#37325#35774#32622'>'#20013#19981#31283#23450#20063#20801#35768#36807#30917#65292#35843#25972#22238#38646#37325#37327
            WordWrap = True
          end
          object lblSecond: TLabel
            Left = 208
            Top = 88
            Width = 18
            Height = 13
            Caption = #31186'  '
          end
          object RBSaveBySteady: TRadioButton
            Left = 24
            Top = 24
            Width = 193
            Height = 17
            Caption = #31283#23450#21518#33258#21160#20445#23384
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RBSaveByTime: TRadioButton
            Left = 24
            Top = 88
            Width = 113
            Height = 17
            Caption = #23450#26102#33258#21160#20445#23384
            TabOrder = 1
          end
          object SEInterval: TSpinEdit
            Left = 141
            Top = 86
            Width = 53
            Height = 22
            MaxValue = 3600
            MinValue = 5
            TabOrder = 2
            Value = 5
          end
        end
        object LETicketSelHeight: TLabeledEdit
          Left = 112
          Top = 51
          Width = 113
          Height = 21
          EditLabel.Width = 96
          EditLabel.Height = 13
          EditLabel.Caption = #30917#21333#36873#25321#26694#39640#24230'    '
          LabelPosition = lpLeft
          TabOrder = 6
          Text = '25'
        end
        object RGSumType: TRadioGroup
          Left = 16
          Top = 184
          Width = 313
          Height = 73
          Caption = #37329#39069#36827#20301#26041#24335
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            #21482#33293#19981#20837
            #22235#33293#20116#20837
            #21482#20837#19981#33293
            #22235#33293#20845#20837#20116#25104#21452)
          TabOrder = 7
        end
        object TBVoiceRate: TTrackBar
          Left = 333
          Top = 212
          Width = 150
          Height = 41
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
      Left = 112
      Top = 315
      Width = 100
      Height = 40
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
      Left = 336
      Top = 315
      Width = 100
      Height = 40
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
