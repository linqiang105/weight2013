object CostSetForm: TCostSetForm
  Left = 310
  Top = 222
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #36807#30917#36153#37197#32622
  ClientHeight = 387
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PBack: TPanel
    Left = 0
    Top = 0
    Width = 723
    Height = 387
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object BitBtnOK: TBitBtn
      Left = 184
      Top = 283
      Width = 100
      Height = 78
      Caption = #30830#23450
      Default = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 1
      ParentFont = False
      TabOrder = 0
      OnClick = BitBtnOKClick
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
    object BitBtnCancel: TBitBtn
      Left = 296
      Top = 283
      Width = 100
      Height = 78
      Cancel = True
      Caption = #21462#28040
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ModalResult = 2
      ParentFont = False
      TabOrder = 1
      OnClick = BitBtnCancelClick
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
    object GBStandard: TGroupBox
      Left = 414
      Top = 2
      Width = 307
      Height = 383
      Align = alRight
      Caption = #25910#36153#26631#20934
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      object Label8: TLabel
        Left = 8
        Top = 16
        Width = 185
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = #21544#20301
      end
      object Label9: TLabel
        Left = 208
        Top = 16
        Width = 65
        Height = 18
        Alignment = taCenter
        AutoSize = False
        Caption = #25910#36153
      end
      object Label12: TLabel
        Left = 280
        Top = 43
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label10: TLabel
        Left = 280
        Top = 69
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label11: TLabel
        Left = 280
        Top = 95
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label13: TLabel
        Left = 280
        Top = 121
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label14: TLabel
        Left = 280
        Top = 147
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label15: TLabel
        Left = 280
        Top = 173
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label16: TLabel
        Left = 280
        Top = 199
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label17: TLabel
        Left = 280
        Top = 225
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label18: TLabel
        Left = 280
        Top = 251
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label19: TLabel
        Left = 280
        Top = 277
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label20: TLabel
        Left = 280
        Top = 303
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label21: TLabel
        Left = 280
        Top = 329
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object Label22: TLabel
        Left = 280
        Top = 355
        Width = 15
        Height = 18
        AutoSize = False
        Caption = #20803
      end
      object EdtGrade11: TEdit
        Left = 8
        Top = 40
        Width = 90
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object EdtGrade12: TEdit
        Left = 104
        Top = 40
        Width = 90
        Height = 21
        TabOrder = 1
        Text = '10000'
      end
      object EdtCost1: TEdit
        Left = 208
        Top = 40
        Width = 65
        Height = 21
        TabOrder = 2
        Text = '5'
      end
      object EdtGrade21: TEdit
        Left = 8
        Top = 66
        Width = 90
        Height = 21
        TabOrder = 3
        Text = '10000'
      end
      object EdtGrade22: TEdit
        Left = 104
        Top = 66
        Width = 90
        Height = 21
        TabOrder = 4
        Text = '23000'
      end
      object EdtCost2: TEdit
        Left = 208
        Top = 66
        Width = 65
        Height = 21
        TabOrder = 5
        Text = '15'
      end
      object EdtGrade31: TEdit
        Left = 8
        Top = 92
        Width = 90
        Height = 21
        TabOrder = 6
        Text = '23000'
      end
      object EdtGrade32: TEdit
        Left = 104
        Top = 92
        Width = 90
        Height = 21
        TabOrder = 7
        Text = '30000'
      end
      object EdtCost3: TEdit
        Left = 208
        Top = 92
        Width = 65
        Height = 21
        TabOrder = 8
        Text = '20'
      end
      object EdtGrade41: TEdit
        Left = 8
        Top = 118
        Width = 90
        Height = 21
        TabOrder = 9
        Text = '30000'
      end
      object EdtGrade42: TEdit
        Left = 104
        Top = 118
        Width = 90
        Height = 21
        TabOrder = 10
        Text = '40000'
      end
      object EdtCost4: TEdit
        Left = 208
        Top = 118
        Width = 65
        Height = 21
        TabOrder = 11
        Text = '25'
      end
      object EdtGrade51: TEdit
        Left = 8
        Top = 144
        Width = 90
        Height = 21
        TabOrder = 12
        Text = '40000'
      end
      object EdtGrade52: TEdit
        Left = 104
        Top = 144
        Width = 90
        Height = 21
        TabOrder = 13
        Text = '50000'
      end
      object EdtCost5: TEdit
        Left = 208
        Top = 144
        Width = 65
        Height = 21
        TabOrder = 14
        Text = '30'
      end
      object EdtGrade61: TEdit
        Left = 8
        Top = 170
        Width = 90
        Height = 21
        TabOrder = 15
        Text = '50000'
      end
      object EdtGrade62: TEdit
        Left = 104
        Top = 170
        Width = 90
        Height = 21
        TabOrder = 16
        Text = '60000'
      end
      object EdtCost6: TEdit
        Left = 208
        Top = 170
        Width = 65
        Height = 21
        TabOrder = 17
        Text = '35'
      end
      object EdtGrade71: TEdit
        Left = 8
        Top = 196
        Width = 90
        Height = 21
        TabOrder = 18
        Text = '60000'
      end
      object EdtGrade72: TEdit
        Left = 104
        Top = 196
        Width = 90
        Height = 21
        TabOrder = 19
        Text = '70000'
      end
      object EdtCost7: TEdit
        Left = 208
        Top = 196
        Width = 65
        Height = 21
        TabOrder = 20
        Text = '40'
      end
      object EdtGrade81: TEdit
        Left = 8
        Top = 222
        Width = 90
        Height = 21
        TabOrder = 21
        Text = '70000'
      end
      object EdtGrade82: TEdit
        Left = 104
        Top = 222
        Width = 90
        Height = 21
        TabOrder = 22
        Text = '80000'
      end
      object EdtCost8: TEdit
        Left = 208
        Top = 222
        Width = 65
        Height = 21
        TabOrder = 23
        Text = '45'
      end
      object EdtGrade91: TEdit
        Left = 8
        Top = 248
        Width = 90
        Height = 21
        TabOrder = 24
        Text = '80000'
      end
      object EdtGrade92: TEdit
        Left = 104
        Top = 248
        Width = 90
        Height = 21
        TabOrder = 25
        Text = '90000'
      end
      object EdtCost9: TEdit
        Left = 208
        Top = 248
        Width = 65
        Height = 21
        TabOrder = 26
        Text = '50'
      end
      object EdtGrade101: TEdit
        Left = 8
        Top = 274
        Width = 90
        Height = 21
        TabOrder = 27
        Text = '90000'
      end
      object EdtGrade102: TEdit
        Left = 104
        Top = 274
        Width = 90
        Height = 21
        TabOrder = 28
        Text = '100000'
      end
      object EdtCost10: TEdit
        Left = 208
        Top = 274
        Width = 65
        Height = 21
        TabOrder = 29
        Text = '55'
      end
      object EdtGrade111: TEdit
        Left = 8
        Top = 300
        Width = 90
        Height = 21
        TabOrder = 30
        Text = '100000'
      end
      object EdtGrade112: TEdit
        Left = 104
        Top = 300
        Width = 90
        Height = 21
        TabOrder = 31
        Text = '110000'
      end
      object EdtCost11: TEdit
        Left = 208
        Top = 300
        Width = 65
        Height = 21
        TabOrder = 32
        Text = '60'
      end
      object EdtGrade121: TEdit
        Left = 8
        Top = 326
        Width = 90
        Height = 21
        TabOrder = 33
        Text = '110000'
      end
      object EdtGrade122: TEdit
        Left = 104
        Top = 326
        Width = 90
        Height = 21
        TabOrder = 34
        Text = '120000'
      end
      object EdtCost12: TEdit
        Left = 208
        Top = 326
        Width = 65
        Height = 21
        TabOrder = 35
        Text = '65'
      end
      object EdtGrade131: TEdit
        Left = 8
        Top = 352
        Width = 90
        Height = 21
        TabOrder = 36
        Text = '120000'
      end
      object EdtGrade132: TEdit
        Left = 104
        Top = 352
        Width = 90
        Height = 21
        TabOrder = 37
        Text = '200000'
      end
      object EdtCost13: TEdit
        Left = 208
        Top = 352
        Width = 65
        Height = 21
        TabOrder = 38
        Text = '70'
      end
    end
    object RBChargeType2: TRadioButton
      Left = 307
      Top = 80
      Width = 100
      Height = 17
      Caption = #25353#20998#27573#25910#36153
      TabOrder = 3
    end
    object CBManualInput: TCheckBox
      Left = 28
      Top = 49
      Width = 245
      Height = 17
      Caption = #36807#30917#21592#33258#24049#36755#20837#36807#30917#36153
      TabOrder = 4
    end
    object LEPoint: TLabeledEdit
      Left = 112
      Top = 334
      Width = 57
      Height = 21
      EditLabel.Width = 79
      EditLabel.Height = 13
      EditLabel.Caption = #23567#25968#28857#20301#25968'  '
      LabelPosition = lpLeft
      TabOrder = 5
      Text = '0'
    end
    object CBUseCost: TCheckBox
      Left = 28
      Top = 20
      Width = 101
      Height = 17
      Caption = #26159#21542#25910#36153
      TabOrder = 6
    end
    object GBRange: TGroupBox
      Left = 13
      Top = 104
      Width = 396
      Height = 153
      Caption = #36215#22987#33539#22260
      TabOrder = 7
      object lblStart: TLabel
        Left = 16
        Top = 27
        Width = 65
        Height = 13
        Caption = #36215#22987#37325#37327#12288
      end
      object lblEnd: TLabel
        Left = 104
        Top = 27
        Width = 65
        Height = 13
        Caption = #19978#38480#37325#37327#12288
      end
      object Label1: TLabel
        Left = 192
        Top = 51
        Width = 52
        Height = 13
        Caption = #25910#36153#20026#12288
      end
      object Label2: TLabel
        Left = 192
        Top = 83
        Width = 52
        Height = 13
        Caption = #25910#36153#20026#12288
      end
      object Label3: TLabel
        Left = 192
        Top = 115
        Width = 52
        Height = 13
        Caption = #25910#36153#20026#12288
      end
      object EdtPound1: TEdit
        Left = 16
        Top = 47
        Width = 80
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object EdtPound2: TEdit
        Left = 102
        Top = 47
        Width = 80
        Height = 21
        TabOrder = 1
        Text = '10000'
      end
      object EdtPound3: TEdit
        Left = 16
        Top = 79
        Width = 80
        Height = 21
        TabOrder = 2
        Text = '10000'
      end
      object EdtPound4: TEdit
        Left = 102
        Top = 79
        Width = 80
        Height = 21
        TabOrder = 3
        Text = '100000'
      end
      object EdtPound5: TEdit
        Left = 16
        Top = 111
        Width = 80
        Height = 21
        TabOrder = 4
        Text = '100000'
      end
      object EdtPound6: TEdit
        Left = 102
        Top = 111
        Width = 80
        Height = 21
        TabOrder = 5
        Text = '120000'
      end
      object EdtInitial: TLabeledEdit
        Left = 243
        Top = 47
        Width = 80
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = #20803'  '
        LabelPosition = lpRight
        TabOrder = 8
        Text = '5'
      end
      object EdtUnit1: TLabeledEdit
        Left = 243
        Top = 79
        Width = 80
        Height = 21
        EditLabel.Width = 59
        EditLabel.Height = 13
        EditLabel.Caption = #20803'/'#21333#20301#12288
        LabelPosition = lpRight
        TabOrder = 6
        Text = '1'
      end
      object EdtUnit2: TLabeledEdit
        Left = 243
        Top = 111
        Width = 80
        Height = 21
        EditLabel.Width = 59
        EditLabel.Height = 13
        EditLabel.Caption = #20803'/'#21333#20301#12288
        LabelPosition = lpRight
        TabOrder = 7
        Text = '1.5'
      end
    end
    object CBCostType: TComboBox
      Left = 24
      Top = 301
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 8
      Text = #25353#27611#37325#25910#36153
      Items.Strings = (
        #25353#27611#37325#25910#36153
        #25353#20928#37325#25910#36153
        #25353#27611#37325'+'#30382#37325#25910#36153)
    end
    object RBChargeType1: TRadioButton
      Left = 27
      Top = 80
      Width = 100
      Height = 17
      Caption = #25353#37325#37327#25910#36153
      Checked = True
      TabOrder = 9
      TabStop = True
    end
    object CBLadder: TCheckBox
      Left = 27
      Top = 272
      Width = 145
      Height = 17
      TabStop = False
      Caption = #25353#37325#37327#20998#38454#25910#36153
      TabOrder = 10
    end
  end
end
