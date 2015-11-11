object CarForm: TCarForm
  Left = 424
  Top = 126
  BorderStyle = bsDialog
  Caption = #35831#36755#20837#36710#21495
  ClientHeight = 413
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCar: TPanel
    Left = 0
    Top = 0
    Width = 456
    Height = 413
    Align = alClient
    BevelInner = bvLowered
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object LECar: TLabeledEdit
      Left = 96
      Top = 16
      Width = 257
      Height = 28
      EditLabel.Width = 72
      EditLabel.Height = 20
      EditLabel.Caption = #36710#29260#21495'      '
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = LECarChange
    end
    object BitBtnOK: TBitBtn
      Left = 360
      Top = 16
      Width = 75
      Height = 30
      Caption = #30830#23450
      TabOrder = 1
      OnClick = BitBtnOKClick
      Kind = bkOK
    end
    object PCCar: TPageControl
      Left = 16
      Top = 56
      Width = 419
      Height = 337
      ActivePage = TSProvince
      TabOrder = 2
      object TSProvince: TTabSheet
        Caption = #30465#20221
        object BtnProvince9: TButton
          Left = 65
          Top = 56
          Width = 55
          Height = 45
          Caption = #27818
          TabOrder = 0
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince1: TButton
          Left = 8
          Top = 8
          Width = 55
          Height = 45
          Caption = #20140
          TabOrder = 1
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince10: TButton
          Left = 121
          Top = 56
          Width = 55
          Height = 45
          Caption = #40065
          TabOrder = 2
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince11: TButton
          Left = 177
          Top = 56
          Width = 55
          Height = 45
          Caption = #33487
          TabOrder = 3
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince12: TButton
          Left = 234
          Top = 56
          Width = 55
          Height = 45
          Caption = #30358
          TabOrder = 4
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince13: TButton
          Left = 291
          Top = 56
          Width = 55
          Height = 45
          Caption = #27993
          TabOrder = 5
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince14: TButton
          Left = 347
          Top = 56
          Width = 55
          Height = 45
          Caption = #36195
          TabOrder = 6
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince15: TButton
          Left = 8
          Top = 104
          Width = 55
          Height = 45
          Caption = #38397
          TabOrder = 7
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince16: TButton
          Left = 65
          Top = 104
          Width = 55
          Height = 45
          Caption = #35947
          TabOrder = 8
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince17: TButton
          Left = 121
          Top = 104
          Width = 55
          Height = 45
          Caption = #37122
          TabOrder = 9
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince18: TButton
          Left = 177
          Top = 104
          Width = 55
          Height = 45
          Caption = #28248
          TabOrder = 10
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince19: TButton
          Left = 234
          Top = 104
          Width = 55
          Height = 45
          Caption = #31908
          TabOrder = 11
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince2: TButton
          Left = 65
          Top = 8
          Width = 55
          Height = 45
          Caption = #27941
          TabOrder = 12
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince20: TButton
          Left = 291
          Top = 104
          Width = 55
          Height = 45
          Caption = #26690
          TabOrder = 13
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince21: TButton
          Left = 347
          Top = 104
          Width = 55
          Height = 45
          Caption = #24029
          TabOrder = 14
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince22: TButton
          Left = 8
          Top = 152
          Width = 55
          Height = 45
          Caption = #36149
          TabOrder = 15
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince23: TButton
          Left = 65
          Top = 152
          Width = 55
          Height = 45
          Caption = #20113
          TabOrder = 16
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince24: TButton
          Left = 121
          Top = 152
          Width = 55
          Height = 45
          Caption = #34255
          TabOrder = 17
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince25: TButton
          Left = 177
          Top = 152
          Width = 55
          Height = 45
          Caption = #38485
          TabOrder = 18
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince26: TButton
          Left = 234
          Top = 152
          Width = 55
          Height = 45
          Caption = #23425
          TabOrder = 19
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince27: TButton
          Left = 291
          Top = 152
          Width = 55
          Height = 45
          Caption = #29976
          TabOrder = 20
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince28: TButton
          Left = 347
          Top = 152
          Width = 55
          Height = 45
          Caption = #38738
          TabOrder = 21
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince29: TButton
          Left = 8
          Top = 200
          Width = 55
          Height = 45
          Caption = #26032
          TabOrder = 22
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince3: TButton
          Left = 121
          Top = 8
          Width = 55
          Height = 45
          Caption = #20864
          TabOrder = 23
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince30: TButton
          Left = 65
          Top = 200
          Width = 55
          Height = 45
          Caption = #29756
          TabOrder = 24
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince31: TButton
          Left = 121
          Top = 200
          Width = 55
          Height = 45
          Caption = #28189
          TabOrder = 25
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince32: TButton
          Left = 178
          Top = 200
          Width = 55
          Height = 45
          Caption = #30002
          TabOrder = 26
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince33: TButton
          Left = 235
          Top = 200
          Width = 55
          Height = 45
          Caption = #20057
          TabOrder = 27
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince34: TButton
          Left = 291
          Top = 200
          Width = 55
          Height = 45
          Caption = #19993
          TabOrder = 28
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince35: TButton
          Left = 348
          Top = 200
          Width = 55
          Height = 45
          Caption = #19969
          TabOrder = 29
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince36: TButton
          Left = 8
          Top = 248
          Width = 55
          Height = 45
          Caption = #25098
          TabOrder = 30
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince37: TButton
          Left = 65
          Top = 248
          Width = 55
          Height = 45
          Caption = #24050
          TabOrder = 31
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince38: TButton
          Left = 121
          Top = 248
          Width = 55
          Height = 45
          Caption = #24218
          TabOrder = 32
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince39: TButton
          Left = 178
          Top = 248
          Width = 55
          Height = 45
          Caption = #36763
          TabOrder = 33
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince4: TButton
          Left = 177
          Top = 8
          Width = 55
          Height = 45
          Caption = #26187
          TabOrder = 34
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince40: TButton
          Left = 235
          Top = 248
          Width = 55
          Height = 45
          Caption = #22764
          TabOrder = 35
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince41: TButton
          Left = 291
          Top = 248
          Width = 55
          Height = 45
          Caption = #30328
          TabOrder = 36
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince42: TButton
          Left = 348
          Top = 248
          Width = 55
          Height = 45
          Caption = 'WJ'
          TabOrder = 37
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince5: TButton
          Left = 234
          Top = 8
          Width = 55
          Height = 45
          Caption = #33945
          TabOrder = 38
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince6: TButton
          Left = 291
          Top = 8
          Width = 55
          Height = 45
          Caption = #40657
          TabOrder = 39
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince7: TButton
          Left = 347
          Top = 8
          Width = 55
          Height = 45
          Caption = #21513
          TabOrder = 40
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnProvince8: TButton
          Left = 8
          Top = 56
          Width = 55
          Height = 45
          Caption = #36797
          TabOrder = 41
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
      end
      object TSLetter: TTabSheet
        Caption = #23383#27597
        ImageIndex = 1
        object BtnLetter1: TButton
          Left = 8
          Top = 16
          Width = 55
          Height = 55
          Caption = 'A'
          TabOrder = 0
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter2: TButton
          Left = 64
          Top = 16
          Width = 55
          Height = 55
          Caption = 'B'
          TabOrder = 1
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter3: TButton
          Left = 121
          Top = 16
          Width = 55
          Height = 55
          Caption = 'C'
          TabOrder = 2
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter4: TButton
          Left = 177
          Top = 16
          Width = 55
          Height = 55
          Caption = 'D'
          TabOrder = 3
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter5: TButton
          Left = 234
          Top = 16
          Width = 55
          Height = 55
          Caption = 'E'
          TabOrder = 4
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter6: TButton
          Left = 290
          Top = 16
          Width = 55
          Height = 55
          Caption = 'F'
          TabOrder = 5
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter7: TButton
          Left = 347
          Top = 16
          Width = 55
          Height = 55
          Caption = 'G'
          TabOrder = 6
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter8: TButton
          Left = 8
          Top = 88
          Width = 55
          Height = 55
          Caption = 'H'
          TabOrder = 7
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter9: TButton
          Left = 65
          Top = 88
          Width = 55
          Height = 55
          Caption = 'I'
          TabOrder = 8
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter10: TButton
          Left = 121
          Top = 88
          Width = 55
          Height = 55
          Caption = 'J'
          TabOrder = 9
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter11: TButton
          Left = 178
          Top = 88
          Width = 55
          Height = 55
          Caption = 'K'
          TabOrder = 10
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter12: TButton
          Left = 234
          Top = 88
          Width = 55
          Height = 55
          Caption = 'L'
          TabOrder = 11
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter13: TButton
          Left = 291
          Top = 88
          Width = 55
          Height = 55
          Caption = 'M'
          TabOrder = 12
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter14: TButton
          Left = 348
          Top = 88
          Width = 55
          Height = 55
          Caption = 'N'
          TabOrder = 13
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter15: TButton
          Left = 8
          Top = 160
          Width = 55
          Height = 55
          Caption = 'O'
          TabOrder = 14
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter16: TButton
          Left = 64
          Top = 160
          Width = 55
          Height = 55
          Caption = 'P'
          TabOrder = 15
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter17: TButton
          Left = 121
          Top = 160
          Width = 55
          Height = 55
          Caption = 'Q'
          TabOrder = 16
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter18: TButton
          Left = 233
          Top = 160
          Width = 55
          Height = 55
          Caption = 'R'
          TabOrder = 17
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter19: TButton
          Left = 290
          Top = 160
          Width = 55
          Height = 55
          Caption = 'S'
          TabOrder = 18
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter20: TButton
          Left = 347
          Top = 160
          Width = 55
          Height = 55
          Caption = 'T'
          TabOrder = 19
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter21: TButton
          Left = 7
          Top = 232
          Width = 55
          Height = 55
          Caption = 'U'
          TabOrder = 20
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter22: TButton
          Left = 63
          Top = 232
          Width = 55
          Height = 55
          Caption = 'V'
          TabOrder = 21
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter23: TButton
          Left = 119
          Top = 232
          Width = 55
          Height = 55
          Caption = 'W'
          TabOrder = 22
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter24: TButton
          Left = 232
          Top = 232
          Width = 55
          Height = 55
          Caption = 'X'
          TabOrder = 23
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter25: TButton
          Left = 289
          Top = 232
          Width = 55
          Height = 55
          Caption = 'Y'
          TabOrder = 24
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnLetter26: TButton
          Left = 347
          Top = 232
          Width = 55
          Height = 55
          Caption = 'Z'
          TabOrder = 25
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
      end
      object TSNum: TTabSheet
        Caption = #25968#23383
        ImageIndex = 2
        object BtnLine: TButton
          Left = 65
          Top = 219
          Width = 95
          Height = 65
          Caption = '-'
          TabOrder = 0
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum1: TButton
          Left = 65
          Top = 24
          Width = 95
          Height = 65
          Caption = '1'
          TabOrder = 1
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum2: TButton
          Left = 161
          Top = 24
          Width = 95
          Height = 65
          Caption = '2'
          TabOrder = 2
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum3: TButton
          Left = 257
          Top = 24
          Width = 95
          Height = 65
          Caption = '3'
          TabOrder = 3
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum4: TButton
          Left = 65
          Top = 89
          Width = 95
          Height = 65
          Caption = '4'
          TabOrder = 4
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum5: TButton
          Left = 161
          Top = 89
          Width = 95
          Height = 65
          Caption = '5'
          TabOrder = 5
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum6: TButton
          Left = 257
          Top = 89
          Width = 95
          Height = 65
          Caption = '6'
          TabOrder = 6
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum7: TButton
          Left = 65
          Top = 154
          Width = 95
          Height = 65
          Caption = '7'
          TabOrder = 7
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum8: TButton
          Left = 161
          Top = 154
          Width = 95
          Height = 65
          Caption = '8'
          TabOrder = 8
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum9: TButton
          Left = 257
          Top = 154
          Width = 95
          Height = 65
          Caption = '9'
          TabOrder = 9
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnNum0: TButton
          Left = 161
          Top = 219
          Width = 95
          Height = 65
          Caption = '0'
          TabOrder = 10
          OnClick = BtnProvince1Click
          OnContextPopup = BtnProvince9ContextPopup
        end
        object BtnBack: TButton
          Left = 257
          Top = 219
          Width = 95
          Height = 65
          Caption = '<-'
          TabOrder = 11
          OnClick = BtnBackClick
        end
      end
    end
  end
end
