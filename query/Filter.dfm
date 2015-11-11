object FilterForm: TFilterForm
  Left = 357
  Top = 196
  BorderStyle = bsDialog
  Caption = #26597#35810#26465#20214
  ClientHeight = 276
  ClientWidth = 654
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DTPStartTime1: TDateTimePicker
    Left = 364
    Top = 112
    Width = 80
    Height = 21
    Date = 38762.000000000000000000
    Time = 38762.000000000000000000
    Kind = dtkTime
    TabOrder = 0
  end
  object DTPStartDate1: TDateTimePicker
    Left = 266
    Top = 112
    Width = 95
    Height = 21
    Date = 38762.224120370410000000
    Time = 38762.224120370410000000
    TabOrder = 1
  end
  object CBName1: TComboBox
    Left = 21
    Top = 11
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object CBOper1: TComboBox
    Left = 170
    Top = 11
    Width = 88
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object CBName2: TComboBox
    Left = 21
    Top = 36
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
  end
  object CBOper2: TComboBox
    Left = 170
    Top = 36
    Width = 88
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
  end
  object CBName3: TComboBox
    Left = 21
    Top = 61
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object CBOper3: TComboBox
    Left = 170
    Top = 61
    Width = 88
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
  end
  object CBName5: TComboBox
    Left = 21
    Top = 112
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 8
  end
  object CBOper5: TComboBox
    Left = 170
    Top = 112
    Width = 88
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
  end
  object CBName6: TComboBox
    Left = 21
    Top = 138
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
  end
  object CBOper6: TComboBox
    Left = 171
    Top = 138
    Width = 87
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
  end
  object DTPStartDate2: TDateTimePicker
    Left = 266
    Top = 138
    Width = 95
    Height = 21
    Date = 39060.877777037000000000
    Time = 39060.877777037000000000
    TabOrder = 12
  end
  object DTPStartTime2: TDateTimePicker
    Left = 364
    Top = 138
    Width = 80
    Height = 21
    Date = 39060.000000000000000000
    Time = 39060.000000000000000000
    Kind = dtkTime
    TabOrder = 13
  end
  object EdtValue1: TComboBox
    Left = 266
    Top = 11
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 14
  end
  object EdtValue2: TComboBox
    Left = 450
    Top = 11
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 15
  end
  object EdtValue3: TComboBox
    Left = 266
    Top = 36
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 16
  end
  object EdtValue4: TComboBox
    Left = 450
    Top = 36
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 17
  end
  object DTPEndDate1: TDateTimePicker
    Left = 450
    Top = 112
    Width = 95
    Height = 21
    Date = 38762.224120370410000000
    Time = 38762.224120370410000000
    TabOrder = 18
  end
  object DTPEndTime1: TDateTimePicker
    Left = 548
    Top = 112
    Width = 80
    Height = 21
    Date = 38762.999988425930000000
    Time = 38762.999988425930000000
    Kind = dtkTime
    TabOrder = 19
  end
  object DTPEndDate2: TDateTimePicker
    Left = 450
    Top = 138
    Width = 95
    Height = 21
    Date = 38762.224120370410000000
    Time = 38762.224120370410000000
    TabOrder = 20
  end
  object DTPEndTime2: TDateTimePicker
    Left = 548
    Top = 138
    Width = 80
    Height = 21
    Date = 38762.999988425930000000
    Time = 38762.999988425930000000
    Kind = dtkTime
    TabOrder = 21
  end
  object GBFinishType: TGroupBox
    Left = 20
    Top = 163
    Width = 245
    Height = 46
    Caption = #23436#25104#26465#20214
    TabOrder = 22
    object RBFinish: TRadioButton
      Left = 16
      Top = 19
      Width = 70
      Height = 17
      Caption = #24050#23436#25104
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RBNotFinish: TRadioButton
      Left = 92
      Top = 19
      Width = 70
      Height = 17
      Caption = #26410#23436#25104
      TabOrder = 1
    end
    object RBAll: TRadioButton
      Left = 168
      Top = 19
      Width = 70
      Height = 17
      Caption = #20840#37096
      TabOrder = 2
    end
  end
  object EdtValue5: TComboBox
    Left = 266
    Top = 61
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 23
  end
  object EdtValue6: TComboBox
    Left = 450
    Top = 61
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 24
  end
  object CBName4: TComboBox
    Left = 21
    Top = 86
    Width = 141
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 25
  end
  object CBOper4: TComboBox
    Left = 170
    Top = 86
    Width = 88
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 26
  end
  object EdtValue7: TComboBox
    Left = 266
    Top = 86
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 27
  end
  object EdtValue8: TComboBox
    Left = 450
    Top = 86
    Width = 180
    Height = 21
    ItemHeight = 13
    TabOrder = 28
  end
  object GBWeightType: TGroupBox
    Left = 269
    Top = 163
    Width = 360
    Height = 46
    Caption = #36807#30917#31867#22411
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 29
    object RBPurchase: TCheckBox
      Left = 8
      Top = 18
      Width = 80
      Height = 17
      TabStop = False
      Caption = #37319#36141#36807#30917
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
    end
    object RBSale: TCheckBox
      Left = 93
      Top = 18
      Width = 80
      Height = 17
      TabStop = False
      Caption = #38144#21806#36807#30917
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 1
    end
    object RBInner: TCheckBox
      Left = 179
      Top = 18
      Width = 80
      Height = 17
      TabStop = False
      Caption = #20869#37096#21608#36716
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 2
    end
    object RBOther: TCheckBox
      Left = 264
      Top = 18
      Width = 80
      Height = 17
      TabStop = False
      Caption = #20854#20182#36807#30917
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 3
    end
  end
  object BtnOK: TBitBtn
    Left = 272
    Top = 214
    Width = 170
    Height = 45
    Caption = #30830#23450
    Default = True
    TabOrder = 30
    OnClick = BtnOKClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BtnCancel: TBitBtn
    Left = 456
    Top = 214
    Width = 170
    Height = 45
    Cancel = True
    Caption = #21462#28040
    TabOrder = 31
    OnClick = BtnCancelClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object GBTime: TGroupBox
    Left = 20
    Top = 209
    Width = 245
    Height = 49
    Caption = #26102#38388
    TabOrder = 32
    object RBDay: TRadioButton
      Left = 12
      Top = 20
      Width = 75
      Height = 17
      Caption = #26412#26085#35760#24405
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RBDayClick
    end
    object RBMonth: TRadioButton
      Left = 89
      Top = 20
      Width = 75
      Height = 17
      Caption = #26412#26376#35760#24405
      TabOrder = 1
      OnClick = RBMonthClick
    end
    object RBYear: TRadioButton
      Left = 166
      Top = 20
      Width = 75
      Height = 17
      Caption = #26412#24180#35760#24405
      TabOrder = 2
      OnClick = RBYearClick
    end
  end
end
