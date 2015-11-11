object WeightSetForm: TWeightSetForm
  Left = 224
  Top = 212
  Width = 782
  Height = 439
  Caption = #31216#37325#30028#38754#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCWeightSet: TPageControl
    Left = 0
    Top = 0
    Width = 774
    Height = 412
    ActivePage = TSShow
    Align = alClient
    TabOrder = 2
    object TSShow: TTabSheet
      Caption = #26174#31034#21517#31216
      object GBShow: TGroupBox
        Left = 16
        Top = 10
        Width = 730
        Height = 320
        Caption = #26174#31034#21517#31216
        TabOrder = 0
        object EdtCar: TLabeledEdit
          Left = 72
          Top = 24
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #36710#21495#12288
          EditLabel.Color = clBtnFace
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentColor = False
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 0
          Text = #36710#21495
        end
        object EdtFaHuo: TLabeledEdit
          Left = 72
          Top = 56
          Width = 100
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #21457#36135#21333#20301#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 1
          Text = #21457#36135#21333#20301
        end
        object EdtShouHuo: TLabeledEdit
          Left = 72
          Top = 88
          Width = 100
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #25910#36135#21333#20301#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 2
          Text = #25910#36135#21333#20301
        end
        object EdtGoods: TLabeledEdit
          Left = 72
          Top = 120
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #36135#21517#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 3
          Text = #36135#21517
        end
        object EdtSpec: TLabeledEdit
          Left = 72
          Top = 152
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #35268#26684#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 4
          Text = #35268#26684
        end
        object EdtGross: TLabeledEdit
          Left = 617
          Top = 24
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #27611#37325#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 27
          Text = #27611#37325
        end
        object EdtTare: TLabeledEdit
          Left = 617
          Top = 56
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #30382#37325#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 28
          Text = #30382#37325
        end
        object EdtNet: TLabeledEdit
          Left = 617
          Top = 88
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #20928#37325#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 29
          Text = #20928#37325
        end
        object EdtBundle: TLabeledEdit
          Left = 72
          Top = 184
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #25187#37325#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 5
          Text = #25187#37325
        end
        object EdtReal: TLabeledEdit
          Left = 617
          Top = 120
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #23454#37325#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 30
          Text = #23454#37325
        end
        object EdtPrice: TLabeledEdit
          Left = 72
          Top = 216
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #21333#20215#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 6
          Text = #21333#20215
        end
        object EdtSum: TLabeledEdit
          Left = 617
          Top = 152
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #37329#39069#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 31
          Text = #37329#39069
        end
        object EdtCost: TLabeledEdit
          Left = 617
          Top = 184
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #36807#30917#36153#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 32
          Text = #36807#30917#36153
        end
        object EdtGrossTime: TLabeledEdit
          Left = 617
          Top = 248
          Width = 100
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #27611#37325#26102#38388#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 34
          Text = #27611#37325#26102#38388
        end
        object EdtTareTime: TLabeledEdit
          Left = 617
          Top = 280
          Width = 100
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #30382#37325#26102#38388#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 35
          Text = #30382#37325#26102#38388
        end
        object EdtMemo: TLabeledEdit
          Left = 72
          Top = 280
          Width = 100
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #22791#27880#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 8
          Text = #22791#27880
        end
        object EdtBackup1: TLabeledEdit
          Left = 256
          Top = 24
          Width = 100
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'1'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          LabelPosition = lpLeft
          ParentFont = False
          TabOrder = 9
          Text = #22791#29992'1'
        end
        object EdtBackup2: TLabeledEdit
          Left = 256
          Top = 56
          Width = 100
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'2'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 10
          Text = #22791#29992'2'
        end
        object EdtBackup3: TLabeledEdit
          Left = 256
          Top = 88
          Width = 100
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'3'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 11
          Text = #22791#29992'3'
        end
        object EdtBackup4: TLabeledEdit
          Left = 256
          Top = 120
          Width = 100
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'4'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 12
          Text = #22791#29992'4'
        end
        object EdtBackup10: TLabeledEdit
          Left = 441
          Top = 24
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'10'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 18
          Text = #22791#29992'10'
        end
        object EdtBackup11: TLabeledEdit
          Left = 441
          Top = 56
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'11'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 19
          Text = #22791#29992'11'
        end
        object EdtBackup12: TLabeledEdit
          Left = 441
          Top = 88
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'12'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 20
          Text = #22791#29992'12'
        end
        object EdtBackup13: TLabeledEdit
          Left = 441
          Top = 120
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'13'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 21
          Text = #22791#29992'13'
        end
        object EdtBackup14: TLabeledEdit
          Left = 441
          Top = 152
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'14'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 22
          Text = #22791#29992'14'
        end
        object EdtBackup5: TLabeledEdit
          Left = 256
          Top = 152
          Width = 100
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'5'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 13
          Text = #22791#29992'5'
        end
        object EdtBackup6: TLabeledEdit
          Left = 256
          Top = 184
          Width = 100
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'6'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 14
          Text = #22791#29992'6'
        end
        object EdtBackup7: TLabeledEdit
          Left = 256
          Top = 216
          Width = 100
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'7'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 15
          Text = #22791#29992'7'
        end
        object EdtBackup8: TLabeledEdit
          Left = 256
          Top = 248
          Width = 100
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'8'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 16
          Text = #22791#29992'8'
        end
        object EdtBackup9: TLabeledEdit
          Left = 256
          Top = 280
          Width = 100
          Height = 21
          EditLabel.Width = 66
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'9'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 17
          Text = #22791#29992'9'
        end
        object EdtBackup15: TLabeledEdit
          Left = 441
          Top = 184
          Width = 100
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'15'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 23
          Text = #22791#29992'15'
        end
        object EdtBackup16: TLabeledEdit
          Left = 441
          Top = 216
          Width = 100
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'16'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 24
          Text = #22791#29992'16'
        end
        object EdtBackup17: TLabeledEdit
          Left = 441
          Top = 248
          Width = 100
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'17'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 25
          Text = #22791#29992'17'
        end
        object EdtBackup18: TLabeledEdit
          Left = 441
          Top = 280
          Width = 100
          Height = 21
          EditLabel.Width = 72
          EditLabel.Height = 13
          EditLabel.Caption = #25968#20540#22791#29992'18'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 26
          Text = #22791#29992'18'
        end
        object EdtScale: TLabeledEdit
          Left = 72
          Top = 248
          Width = 100
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #25240#26041#31995#25968#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 7
          Text = #25240#26041#31995#25968
        end
        object EdtQuanter: TLabeledEdit
          Left = 617
          Top = 216
          Width = 100
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #25240#26041#37327#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          EditLabel.Transparent = True
          LabelPosition = lpLeft
          TabOrder = 33
          Text = #25240#26041#37327
        end
      end
    end
    object TSPosition: TTabSheet
      Caption = #30028#38754#37197#32622
      ImageIndex = 3
      OnShow = TSPositionShow
      object GBPosition: TGroupBox
        Left = 16
        Top = 10
        Width = 730
        Height = 320
        Caption = #30028#38754#37197#32622
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object cb00: TRzComboBox
          Left = 24
          Top = 24
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = cb00Change
        end
        object cb01: TRzComboBox
          Left = 24
          Top = 56
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 1
          OnChange = cb00Change
        end
        object cb02: TRzComboBox
          Left = 24
          Top = 88
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 2
          OnChange = cb00Change
        end
        object cb03: TRzComboBox
          Left = 24
          Top = 120
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 3
          OnChange = cb00Change
        end
        object cb04: TRzComboBox
          Left = 24
          Top = 152
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 4
          OnChange = cb00Change
        end
        object cb05: TRzComboBox
          Left = 24
          Top = 184
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 5
          OnChange = cb00Change
        end
        object cb06: TRzComboBox
          Left = 24
          Top = 216
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 6
          OnChange = cb00Change
        end
        object cb07: TRzComboBox
          Left = 24
          Top = 248
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 7
          OnChange = cb00Change
        end
        object cb08: TRzComboBox
          Left = 24
          Top = 280
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 8
          OnChange = cb00Change
        end
        object cb10: TRzComboBox
          Left = 200
          Top = 24
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 9
          OnChange = cb00Change
        end
        object cb11: TRzComboBox
          Left = 200
          Top = 56
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 10
          OnChange = cb00Change
        end
        object cb12: TRzComboBox
          Left = 200
          Top = 88
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 11
          OnChange = cb00Change
        end
        object cb13: TRzComboBox
          Left = 200
          Top = 120
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 12
          OnChange = cb00Change
        end
        object cb14: TRzComboBox
          Left = 200
          Top = 152
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 13
          OnChange = cb00Change
        end
        object cb15: TRzComboBox
          Left = 200
          Top = 184
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 14
          OnChange = cb00Change
        end
        object cb16: TRzComboBox
          Left = 200
          Top = 216
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 15
          OnChange = cb00Change
        end
        object cb17: TRzComboBox
          Left = 200
          Top = 248
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 16
          OnChange = cb00Change
        end
        object cb18: TRzComboBox
          Left = 200
          Top = 280
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 17
          OnChange = cb00Change
        end
        object cb20: TRzComboBox
          Left = 376
          Top = 24
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 18
          OnChange = cb00Change
        end
        object cb21: TRzComboBox
          Left = 376
          Top = 56
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 19
          OnChange = cb00Change
        end
        object cb22: TRzComboBox
          Left = 376
          Top = 88
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 20
          OnChange = cb00Change
        end
        object cb23: TRzComboBox
          Left = 376
          Top = 120
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 21
          OnChange = cb00Change
        end
        object cb24: TRzComboBox
          Left = 376
          Top = 152
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 22
          OnChange = cb00Change
        end
        object cb25: TRzComboBox
          Left = 376
          Top = 184
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 23
          OnChange = cb00Change
        end
        object cb26: TRzComboBox
          Left = 376
          Top = 216
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 24
          OnChange = cb00Change
        end
        object cb27: TRzComboBox
          Left = 376
          Top = 248
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 25
          OnChange = cb00Change
        end
        object cb28: TRzComboBox
          Left = 376
          Top = 280
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 26
          OnChange = cb00Change
        end
        object cb30: TRzComboBox
          Left = 552
          Top = 24
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 27
          OnChange = cb00Change
        end
        object cb31: TRzComboBox
          Left = 552
          Top = 56
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 28
          OnChange = cb00Change
        end
        object cb32: TRzComboBox
          Left = 552
          Top = 88
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 29
          OnChange = cb00Change
        end
        object cb33: TRzComboBox
          Left = 552
          Top = 120
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 30
          OnChange = cb00Change
        end
        object cb34: TRzComboBox
          Left = 552
          Top = 152
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 31
          OnChange = cb00Change
        end
        object cb35: TRzComboBox
          Left = 552
          Top = 184
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 32
          OnChange = cb00Change
        end
        object cb36: TRzComboBox
          Left = 552
          Top = 216
          Width = 160
          Height = 24
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 33
          OnChange = cb00Change
        end
      end
    end
    object TSDefault: TTabSheet
      Caption = #23383#27573#40664#35748#20540
      ImageIndex = 2
      object GBDefault: TGroupBox
        Left = 16
        Top = 10
        Width = 730
        Height = 320
        Caption = #23383#27573#40664#35748#20540
        TabOrder = 0
        object LECarDefault: TLabeledEdit
          Left = 80
          Top = 24
          Width = 150
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.BiDiMode = bdLeftToRight
          EditLabel.Caption = #36710#21495#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentBiDiMode = False
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 0
        end
        object LEShouHuoDefault: TLabeledEdit
          Left = 80
          Top = 88
          Width = 150
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #25910#36135#21333#20301#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 2
        end
        object LESpecDefault: TLabeledEdit
          Left = 80
          Top = 152
          Width = 150
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #35268#26684#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 4
        end
        object LEBundleDefault: TLabeledEdit
          Left = 80
          Top = 184
          Width = 150
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #25187#37325#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 5
          Text = '0'
        end
        object LEPriceDefault: TLabeledEdit
          Left = 80
          Top = 216
          Width = 150
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #21333#20215#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 6
          Text = '0'
        end
        object LEBackup1Default: TLabeledEdit
          Left = 319
          Top = 24
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'1'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 9
        end
        object LEBackup3Default: TLabeledEdit
          Left = 319
          Top = 88
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'3'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 11
        end
        object LEBackup5Default: TLabeledEdit
          Left = 319
          Top = 152
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'5'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 13
        end
        object LEFaHuoDefault: TLabeledEdit
          Left = 80
          Top = 56
          Width = 150
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #21457#36135#21333#20301#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 1
        end
        object LEGoodsDefault: TLabeledEdit
          Left = 80
          Top = 120
          Width = 150
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #36135#21517#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 3
        end
        object LEScaleDefault: TLabeledEdit
          Left = 80
          Top = 248
          Width = 150
          Height = 21
          EditLabel.Width = 60
          EditLabel.Height = 13
          EditLabel.Caption = #25240#26041#31995#25968#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 7
          Text = '1'
        end
        object LEMemoDefault: TLabeledEdit
          Left = 80
          Top = 280
          Width = 150
          Height = 21
          EditLabel.Width = 36
          EditLabel.Height = 13
          EditLabel.Caption = #22791#27880#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 8
        end
        object LEBackup2Default: TLabeledEdit
          Left = 319
          Top = 56
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'2'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 10
        end
        object LEBackup4Default: TLabeledEdit
          Left = 319
          Top = 120
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'4'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 12
        end
        object LEBackup10Default: TLabeledEdit
          Left = 557
          Top = 24
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'10'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 18
        end
        object LEBackup11Default: TLabeledEdit
          Left = 557
          Top = 56
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'11'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 19
        end
        object LEBackup12Default: TLabeledEdit
          Left = 557
          Top = 88
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'12'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 20
        end
        object LEBackup13Default: TLabeledEdit
          Left = 557
          Top = 120
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'13'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 21
        end
        object LEBackup14Default: TLabeledEdit
          Left = 557
          Top = 152
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'14'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 22
        end
        object LEBackup6Default: TLabeledEdit
          Left = 319
          Top = 184
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'6'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 14
          Text = '0'
        end
        object LEBackup8Default: TLabeledEdit
          Left = 319
          Top = 248
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'8'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 16
          Text = '0'
        end
        object LEBackup7Default: TLabeledEdit
          Left = 319
          Top = 216
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'7'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 15
          Text = '0'
        end
        object LEBackup9Default: TLabeledEdit
          Left = 319
          Top = 280
          Width = 150
          Height = 21
          EditLabel.Width = 42
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'9'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 17
          Text = '0'
        end
        object LEBackup15Default: TLabeledEdit
          Left = 557
          Top = 184
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'15'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 23
          Text = '0'
        end
        object LEBackup16Default: TLabeledEdit
          Left = 557
          Top = 216
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'16'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 24
          Text = '0'
        end
        object LEBackup17Default: TLabeledEdit
          Left = 557
          Top = 248
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'17'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 25
          Text = '0'
        end
        object LEBackup18Default: TLabeledEdit
          Left = 557
          Top = 280
          Width = 150
          Height = 21
          EditLabel.Width = 48
          EditLabel.Height = 13
          EditLabel.Caption = #22791#29992'18'#12288
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clBlue
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          TabOrder = 26
          Text = '0'
        end
      end
    end
    object TSAutoClear: TTabSheet
      Caption = #33258#21160#28165#31354#21450#24517#22635#36873#39033
      ImageIndex = 4
      object GBAutoClear: TGroupBox
        Left = 16
        Top = 10
        Width = 305
        Height = 320
        Caption = #33258#21160#28165#31354#36873#39033
        TabOrder = 0
        object CBClearCar: TCheckBox
          Left = 16
          Top = 24
          Width = 90
          Height = 17
          Caption = #36710#21495
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 0
        end
        object CBClearShouHuo: TCheckBox
          Left = 15
          Top = 90
          Width = 90
          Height = 17
          Caption = #25910#36135#21333#20301
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 2
        end
        object CBClearSpec: TCheckBox
          Left = 15
          Top = 156
          Width = 90
          Height = 17
          Caption = #35268#26684
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 4
        end
        object CBClearBundle: TCheckBox
          Left = 15
          Top = 189
          Width = 90
          Height = 17
          Caption = #25187#37325
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 5
        end
        object CBClearBackup1: TCheckBox
          Left = 108
          Top = 24
          Width = 90
          Height = 17
          Caption = #22791#29992'1'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 9
        end
        object CBClearBackup3: TCheckBox
          Left = 108
          Top = 90
          Width = 90
          Height = 17
          Caption = #22791#29992'3'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 11
        end
        object CBClearBackup5: TCheckBox
          Left = 108
          Top = 156
          Width = 90
          Height = 17
          Caption = #22791#29992'5'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 13
        end
        object CBClearFahuo: TCheckBox
          Left = 15
          Top = 57
          Width = 90
          Height = 17
          Caption = #21457#36135#21333#20301
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 1
        end
        object CBClearGoods: TCheckBox
          Left = 15
          Top = 123
          Width = 90
          Height = 17
          Caption = #36135#21517
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 3
        end
        object CBClearMemo: TCheckBox
          Left = 15
          Top = 288
          Width = 90
          Height = 17
          Caption = #22791#27880
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 8
        end
        object CBClearBackup2: TCheckBox
          Left = 108
          Top = 57
          Width = 90
          Height = 17
          Caption = #22791#29992'2'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 10
        end
        object CBClearBackup4: TCheckBox
          Left = 108
          Top = 123
          Width = 90
          Height = 17
          Caption = #22791#29992'4'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 12
        end
        object CBClearBackup10: TCheckBox
          Left = 202
          Top = 24
          Width = 90
          Height = 17
          Caption = #22791#29992'10'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 18
        end
        object CBClearBackup11: TCheckBox
          Left = 202
          Top = 57
          Width = 90
          Height = 17
          Caption = #22791#29992'11'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 19
        end
        object CBClearBackup12: TCheckBox
          Left = 202
          Top = 90
          Width = 90
          Height = 17
          Caption = #22791#29992'12'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 20
        end
        object CBClearBackup13: TCheckBox
          Left = 202
          Top = 123
          Width = 90
          Height = 17
          Caption = #22791#29992'13'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 21
        end
        object CBClearBackup14: TCheckBox
          Left = 202
          Top = 156
          Width = 90
          Height = 17
          Caption = #22791#29992'14'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 22
        end
        object CBClearBackup6: TCheckBox
          Left = 108
          Top = 189
          Width = 90
          Height = 17
          Caption = #22791#29992'6'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 14
        end
        object CBClearBackup7: TCheckBox
          Left = 108
          Top = 222
          Width = 90
          Height = 17
          Caption = #22791#29992'7'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 15
        end
        object CBClearBackup8: TCheckBox
          Left = 108
          Top = 255
          Width = 90
          Height = 17
          Caption = #22791#29992'8'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 16
        end
        object CBClearBackup9: TCheckBox
          Left = 108
          Top = 288
          Width = 90
          Height = 17
          Caption = #22791#29992'9'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 17
        end
        object CBClearBackup15: TCheckBox
          Left = 202
          Top = 189
          Width = 90
          Height = 17
          Caption = #22791#29992'15'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 23
        end
        object CBClearBackup16: TCheckBox
          Left = 202
          Top = 222
          Width = 90
          Height = 17
          Caption = #22791#29992'16'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 24
        end
        object CBClearBackup17: TCheckBox
          Left = 202
          Top = 255
          Width = 90
          Height = 17
          Caption = #22791#29992'17'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 25
        end
        object CBClearBackup18: TCheckBox
          Left = 202
          Top = 288
          Width = 90
          Height = 17
          Caption = #22791#29992'18'
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 26
        end
        object CBClearPrice: TCheckBox
          Left = 15
          Top = 222
          Width = 90
          Height = 17
          Caption = #21333#20215
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 6
        end
        object CBClearScale: TCheckBox
          Left = 15
          Top = 255
          Width = 90
          Height = 17
          Caption = #25240#26041#31995#25968
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 7
        end
      end
      object GBMust: TGroupBox
        Left = 328
        Top = 10
        Width = 425
        Height = 320
        Caption = #24517#22635#39033
        TabOrder = 1
        object CBMustCar: TCheckBox
          Left = 24
          Top = 24
          Width = 90
          Height = 17
          Caption = #36710#21495
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 0
        end
        object CBMustShouHuo: TCheckBox
          Left = 23
          Top = 90
          Width = 90
          Height = 17
          Caption = #25910#36135#21333#20301
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
        object CBMustSpec: TCheckBox
          Left = 23
          Top = 156
          Width = 90
          Height = 17
          Caption = #35268#26684
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
        end
        object CBMustBundle: TCheckBox
          Left = 23
          Top = 189
          Width = 90
          Height = 17
          Caption = #25187#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 5
        end
        object CBMustBackup1: TCheckBox
          Left = 116
          Top = 24
          Width = 90
          Height = 17
          Caption = #22791#29992'1'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 9
        end
        object CBMustBackup3: TCheckBox
          Left = 116
          Top = 90
          Width = 90
          Height = 17
          Caption = #22791#29992'3'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 11
        end
        object CBMustBackup5: TCheckBox
          Left = 116
          Top = 156
          Width = 90
          Height = 17
          Caption = #22791#29992'5'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 13
        end
        object CBMustFaHuo: TCheckBox
          Left = 23
          Top = 57
          Width = 90
          Height = 17
          Caption = #21457#36135#21333#20301
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
        object CBMustGoods: TCheckBox
          Left = 23
          Top = 123
          Width = 90
          Height = 17
          Caption = #36135#21517
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
        end
        object CBMustMemo: TCheckBox
          Left = 23
          Top = 288
          Width = 90
          Height = 17
          Caption = #22791#27880
          Color = clBtnFace
          ParentColor = False
          TabOrder = 8
        end
        object CBMustBackup2: TCheckBox
          Left = 116
          Top = 57
          Width = 90
          Height = 17
          Caption = #22791#29992'2'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 10
        end
        object CBMustBackup4: TCheckBox
          Left = 116
          Top = 123
          Width = 90
          Height = 17
          Caption = #22791#29992'4'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 12
        end
        object CBMustBackup10: TCheckBox
          Left = 218
          Top = 24
          Width = 90
          Height = 17
          Caption = #22791#29992'10'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 18
        end
        object CBMustBackup11: TCheckBox
          Left = 218
          Top = 57
          Width = 90
          Height = 17
          Caption = #22791#29992'11'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 19
        end
        object CBMustBackup12: TCheckBox
          Left = 218
          Top = 90
          Width = 90
          Height = 17
          Caption = #22791#29992'12'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 20
        end
        object CBMustBackup13: TCheckBox
          Left = 218
          Top = 123
          Width = 90
          Height = 17
          Caption = #22791#29992'13'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 21
        end
        object CBMustBackup14: TCheckBox
          Left = 218
          Top = 156
          Width = 90
          Height = 17
          Caption = #22791#29992'14'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 22
        end
        object CBMustBackup6: TCheckBox
          Left = 116
          Top = 189
          Width = 90
          Height = 17
          Caption = #22791#29992'6'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 14
        end
        object CBMustBackup7: TCheckBox
          Left = 116
          Top = 222
          Width = 90
          Height = 17
          Caption = #22791#29992'7'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 15
        end
        object CBMustBackup8: TCheckBox
          Left = 116
          Top = 255
          Width = 90
          Height = 17
          Caption = #22791#29992'8'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 16
        end
        object CBMustBackup9: TCheckBox
          Left = 116
          Top = 288
          Width = 90
          Height = 17
          Caption = #22791#29992'9'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 17
        end
        object CBMustBackup15: TCheckBox
          Left = 218
          Top = 189
          Width = 90
          Height = 17
          Caption = #22791#29992'15'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 23
        end
        object CBMustBackup16: TCheckBox
          Left = 218
          Top = 222
          Width = 90
          Height = 17
          Caption = #22791#29992'16'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 24
        end
        object CBMustBackup17: TCheckBox
          Left = 218
          Top = 255
          Width = 90
          Height = 17
          Caption = #22791#29992'17'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 25
        end
        object CBMustBackup18: TCheckBox
          Left = 218
          Top = 288
          Width = 90
          Height = 17
          Caption = #22791#29992'18'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 26
        end
        object CBMustPrice: TCheckBox
          Left = 23
          Top = 222
          Width = 90
          Height = 17
          Caption = #21333#20215
          Color = clBtnFace
          ParentColor = False
          TabOrder = 6
        end
        object CBMustScale: TCheckBox
          Left = 23
          Top = 255
          Width = 90
          Height = 17
          Caption = #25240#26041#31995#25968
          Color = clBtnFace
          ParentColor = False
          TabOrder = 7
        end
        object CBMustGross: TCheckBox
          Left = 314
          Top = 24
          Width = 90
          Height = 17
          Caption = #27611#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 27
        end
        object CBMustTare: TCheckBox
          Left = 314
          Top = 57
          Width = 90
          Height = 17
          Caption = #30382#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 28
        end
        object CBMustNet: TCheckBox
          Left = 314
          Top = 89
          Width = 90
          Height = 17
          Caption = #20928#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 29
        end
        object CBMustReal: TCheckBox
          Left = 314
          Top = 122
          Width = 90
          Height = 17
          Caption = #23454#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 30
        end
        object CBMustSum: TCheckBox
          Left = 314
          Top = 155
          Width = 90
          Height = 17
          Caption = #37329#39069
          Color = clBtnFace
          ParentColor = False
          TabOrder = 31
        end
        object CBMustCost: TCheckBox
          Left = 314
          Top = 187
          Width = 90
          Height = 17
          Caption = #36807#30917#36153
          Color = clBtnFace
          ParentColor = False
          TabOrder = 32
        end
        object CBMustQuanter: TCheckBox
          Left = 314
          Top = 220
          Width = 90
          Height = 17
          Caption = #25240#26041#37327
          Color = clBtnFace
          ParentColor = False
          TabOrder = 33
        end
      end
    end
    object TSUnique: TTabSheet
      Caption = #21807#19968#24615#21450#19981#21487#21464#26356#36873#39033
      ImageIndex = 5
      object GBUnique: TGroupBox
        Left = 16
        Top = 10
        Width = 360
        Height = 320
        Caption = #21807#19968#24615#36873#39033
        TabOrder = 0
        object CBUniqueCar: TCheckBox
          Left = 24
          Top = 24
          Width = 100
          Height = 17
          Caption = #36710#21495
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
        end
        object CBUniqueShouHuo: TCheckBox
          Left = 23
          Top = 90
          Width = 100
          Height = 17
          Caption = #25910#36135#21333#20301
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
        object CBUniqueSpec: TCheckBox
          Left = 23
          Top = 156
          Width = 100
          Height = 17
          Caption = #35268#26684
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
        end
        object CBUniqueBundle: TCheckBox
          Left = 23
          Top = 189
          Width = 100
          Height = 17
          Caption = #25187#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 5
        end
        object CBUniqueBackup1: TCheckBox
          Left = 137
          Top = 24
          Width = 100
          Height = 17
          Caption = #22791#29992'1'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 9
        end
        object CBUniqueBackup3: TCheckBox
          Left = 137
          Top = 90
          Width = 100
          Height = 17
          Caption = #22791#29992'3'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 11
        end
        object CBUniqueBackup5: TCheckBox
          Left = 137
          Top = 156
          Width = 100
          Height = 17
          Caption = #22791#29992'5'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 13
        end
        object CBUniqueFaHuo: TCheckBox
          Left = 23
          Top = 57
          Width = 100
          Height = 17
          Caption = #21457#36135#21333#20301
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
        object CBUniqueGoods: TCheckBox
          Left = 23
          Top = 123
          Width = 100
          Height = 17
          Caption = #36135#21517
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
        end
        object CBUniqueMemo: TCheckBox
          Left = 23
          Top = 288
          Width = 100
          Height = 17
          Caption = #22791#27880
          Color = clBtnFace
          ParentColor = False
          TabOrder = 8
        end
        object CBUniqueBackup2: TCheckBox
          Left = 137
          Top = 57
          Width = 100
          Height = 17
          Caption = #22791#29992'2'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 10
        end
        object CBUniqueBackup4: TCheckBox
          Left = 137
          Top = 123
          Width = 100
          Height = 17
          Caption = #22791#29992'4'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 12
        end
        object CBUniqueBackup10: TCheckBox
          Left = 250
          Top = 24
          Width = 100
          Height = 17
          Caption = #22791#29992'10'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 18
        end
        object CBUniqueBackup11: TCheckBox
          Left = 250
          Top = 57
          Width = 100
          Height = 17
          Caption = #22791#29992'11'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 19
        end
        object CBUniqueBackup12: TCheckBox
          Left = 250
          Top = 90
          Width = 100
          Height = 17
          Caption = #22791#29992'12'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 20
        end
        object CBUniqueBackup13: TCheckBox
          Left = 250
          Top = 123
          Width = 100
          Height = 17
          Caption = #22791#29992'13'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 21
        end
        object CBUniqueBackup14: TCheckBox
          Left = 250
          Top = 156
          Width = 100
          Height = 17
          Caption = #22791#29992'14'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 22
        end
        object CBUniqueBackup6: TCheckBox
          Left = 137
          Top = 189
          Width = 100
          Height = 17
          Caption = #22791#29992'6'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 14
        end
        object CBUniqueBackup7: TCheckBox
          Left = 137
          Top = 222
          Width = 100
          Height = 17
          Caption = #22791#29992'7'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 15
        end
        object CBUniqueBackup8: TCheckBox
          Left = 137
          Top = 255
          Width = 100
          Height = 17
          Caption = #22791#29992'8'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 16
        end
        object CBUniqueBackup9: TCheckBox
          Left = 137
          Top = 288
          Width = 100
          Height = 17
          Caption = #22791#29992'9'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 17
        end
        object CBUniqueBackup15: TCheckBox
          Left = 250
          Top = 189
          Width = 100
          Height = 17
          Caption = #22791#29992'15'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 23
        end
        object CBUniqueBackup16: TCheckBox
          Left = 250
          Top = 222
          Width = 100
          Height = 17
          Caption = #22791#29992'16'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 24
        end
        object CBUniqueBackup17: TCheckBox
          Left = 250
          Top = 255
          Width = 100
          Height = 17
          Caption = #22791#29992'17'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 25
        end
        object CBUniqueBackup18: TCheckBox
          Left = 250
          Top = 288
          Width = 100
          Height = 17
          Caption = #22791#29992'18'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 26
        end
        object CBUniquePrice: TCheckBox
          Left = 23
          Top = 222
          Width = 100
          Height = 17
          Caption = #21333#20215
          Color = clBtnFace
          ParentColor = False
          TabOrder = 6
        end
        object CBUniqueScale: TCheckBox
          Left = 23
          Top = 255
          Width = 100
          Height = 17
          Caption = #25240#26041#31995#25968
          Color = clBtnFace
          ParentColor = False
          TabOrder = 7
        end
      end
      object GBNotChange: TGroupBox
        Left = 392
        Top = 10
        Width = 360
        Height = 320
        Caption = #21462#37325#21518#19981#21487#21464#26356#39033#30446
        TabOrder = 1
        object CBNotChangeCar: TCheckBox
          Left = 24
          Top = 24
          Width = 100
          Height = 17
          Caption = #36710#21495
          Checked = True
          Color = clBtnFace
          ParentColor = False
          State = cbChecked
          TabOrder = 0
        end
        object CBNotChangeShouHuo: TCheckBox
          Left = 23
          Top = 90
          Width = 100
          Height = 17
          Caption = #25910#36135#21333#20301
          Color = clBtnFace
          ParentColor = False
          TabOrder = 2
        end
        object CBNotChangeSpec: TCheckBox
          Left = 23
          Top = 156
          Width = 100
          Height = 17
          Caption = #35268#26684
          Color = clBtnFace
          ParentColor = False
          TabOrder = 4
        end
        object CBNotChangeBundle: TCheckBox
          Left = 23
          Top = 189
          Width = 100
          Height = 17
          Caption = #25187#37325
          Color = clBtnFace
          ParentColor = False
          TabOrder = 5
        end
        object CBNotChangeBackup1: TCheckBox
          Left = 137
          Top = 24
          Width = 100
          Height = 17
          Caption = #22791#29992'1'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 9
        end
        object CBNotChangeBackup3: TCheckBox
          Left = 137
          Top = 90
          Width = 100
          Height = 17
          Caption = #22791#29992'3'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 11
        end
        object CBNotChangeBackup5: TCheckBox
          Left = 137
          Top = 156
          Width = 100
          Height = 17
          Caption = #22791#29992'5'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 13
        end
        object CBNotChangeFaHuo: TCheckBox
          Left = 23
          Top = 57
          Width = 100
          Height = 17
          Caption = #21457#36135#21333#20301
          Color = clBtnFace
          ParentColor = False
          TabOrder = 1
        end
        object CBNotChangeGoods: TCheckBox
          Left = 23
          Top = 123
          Width = 100
          Height = 17
          Caption = #36135#21517
          Color = clBtnFace
          ParentColor = False
          TabOrder = 3
        end
        object CBNotChangeMemo: TCheckBox
          Left = 23
          Top = 288
          Width = 100
          Height = 17
          Caption = #22791#27880
          Color = clBtnFace
          ParentColor = False
          TabOrder = 8
        end
        object CBNotChangeBackup2: TCheckBox
          Left = 137
          Top = 57
          Width = 100
          Height = 17
          Caption = #22791#29992'2'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 10
        end
        object CBNotChangeBackup4: TCheckBox
          Left = 137
          Top = 123
          Width = 100
          Height = 17
          Caption = #22791#29992'4'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 12
        end
        object CBNotChangeBackup10: TCheckBox
          Left = 250
          Top = 24
          Width = 100
          Height = 17
          Caption = #22791#29992'10'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 18
        end
        object CBNotChangeBackup11: TCheckBox
          Left = 250
          Top = 57
          Width = 100
          Height = 17
          Caption = #22791#29992'11'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 19
        end
        object CBNotChangeBackup12: TCheckBox
          Left = 250
          Top = 90
          Width = 100
          Height = 17
          Caption = #22791#29992'12'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 20
        end
        object CBNotChangeBackup13: TCheckBox
          Left = 250
          Top = 123
          Width = 100
          Height = 17
          Caption = #22791#29992'13'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 21
        end
        object CBNotChangeBackup14: TCheckBox
          Left = 250
          Top = 156
          Width = 100
          Height = 17
          Caption = #22791#29992'14'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 22
        end
        object CBNotChangeBackup6: TCheckBox
          Left = 137
          Top = 189
          Width = 100
          Height = 17
          Caption = #22791#29992'6'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 14
        end
        object CBNotChangeBackup7: TCheckBox
          Left = 137
          Top = 222
          Width = 100
          Height = 17
          Caption = #22791#29992'7'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 15
        end
        object CBNotChangeBackup8: TCheckBox
          Left = 137
          Top = 255
          Width = 100
          Height = 17
          Caption = #22791#29992'8'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 16
        end
        object CBNotChangeBackup9: TCheckBox
          Left = 137
          Top = 288
          Width = 100
          Height = 17
          Caption = #22791#29992'9'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 17
        end
        object CBNotChangeBackup15: TCheckBox
          Left = 250
          Top = 189
          Width = 100
          Height = 17
          Caption = #22791#29992'15'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 23
        end
        object CBNotChangeBackup16: TCheckBox
          Left = 250
          Top = 222
          Width = 100
          Height = 17
          Caption = #22791#29992'16'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 24
        end
        object CBNotChangeBackup17: TCheckBox
          Left = 250
          Top = 255
          Width = 100
          Height = 17
          Caption = #22791#29992'17'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 25
        end
        object CBNotChangeBackup18: TCheckBox
          Left = 250
          Top = 288
          Width = 100
          Height = 17
          Caption = #22791#29992'18'
          Color = clBtnFace
          ParentColor = False
          TabOrder = 26
        end
        object CBNotChangePrice: TCheckBox
          Left = 23
          Top = 222
          Width = 100
          Height = 17
          Caption = #21333#20215
          Color = clBtnFace
          ParentColor = False
          TabOrder = 6
        end
        object CBNotChangeScale: TCheckBox
          Left = 23
          Top = 255
          Width = 100
          Height = 17
          Caption = #25240#26041#31995#25968
          Color = clBtnFace
          ParentColor = False
          TabOrder = 7
        end
      end
    end
    object TSFormule: TTabSheet
      Caption = #20844#24335#32534#36753
      ImageIndex = 5
      object GBFormule: TGroupBox
        Left = 8
        Top = 2
        Width = 753
        Height = 330
        Caption = #20844#24335#32534#36753
        TabOrder = 0
        object lblBackup6: TLabel
          Left = 8
          Top = 19
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup7: TLabel
          Left = 8
          Top = 56
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'7'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup8: TLabel
          Left = 8
          Top = 94
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup9: TLabel
          Left = 8
          Top = 131
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'9'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup15: TLabel
          Left = 8
          Top = 168
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'15'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup16: TLabel
          Left = 8
          Top = 206
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'16'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup17: TLabel
          Left = 8
          Top = 243
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'17'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object lblBackup18: TLabel
          Left = 8
          Top = 280
          Width = 90
          Height = 13
          AutoSize = False
          Caption = #22791#29992'18'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object Label1: TLabel
          Left = 392
          Top = 12
          Width = 348
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = #32479#35745#36873#39033
          Layout = tlCenter
        end
        object BtnSetFormule18: TBitBtn
          Left = 301
          Top = 294
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 23
          OnClick = BtnSetFormule18Click
        end
        object CBUseExpression6: TCheckBox
          Left = 8
          Top = 36
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 0
          OnClick = CBUseExpression6Click
        end
        object CBUseExpression7: TCheckBox
          Left = 8
          Top = 73
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 3
          OnClick = CBUseExpression7Click
        end
        object CBUseExpression8: TCheckBox
          Left = 8
          Top = 110
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 6
          OnClick = CBUseExpression8Click
        end
        object EdtExpression6: TEdit
          Left = 89
          Top = 32
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Text = '['#27611#37325']*2'
        end
        object EdtExpression7: TEdit
          Left = 89
          Top = 70
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          Text = '['#30382#37325']*2'
        end
        object EdtExpression8: TEdit
          Left = 89
          Top = 107
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          Text = '['#20928#37325']*2'
        end
        object CBUseExpression9: TCheckBox
          Left = 8
          Top = 148
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 9
          OnClick = CBUseExpression9Click
        end
        object EdtExpression9: TEdit
          Left = 89
          Top = 145
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          Text = '['#37329#39069']*2'
        end
        object BtnSetFormule6: TBitBtn
          Left = 301
          Top = 29
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 2
          OnClick = BtnSetFormule6Click
        end
        object BtnSetFormule7: TBitBtn
          Left = 301
          Top = 67
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 5
          OnClick = BtnSetFormule7Click
        end
        object BtnSetFormule8: TBitBtn
          Left = 301
          Top = 105
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 8
          OnClick = BtnSetFormule8Click
        end
        object BtnSetFormule9: TBitBtn
          Left = 301
          Top = 143
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 11
          OnClick = BtnSetFormule9Click
        end
        object CBUseExpression15: TCheckBox
          Left = 8
          Top = 185
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 12
          OnClick = CBUseExpression15Click
        end
        object CBUseExpression16: TCheckBox
          Left = 8
          Top = 222
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 15
          OnClick = CBUseExpression16Click
        end
        object CBUseExpression17: TCheckBox
          Left = 8
          Top = 260
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 18
          OnClick = CBUseExpression17Click
        end
        object EdtExpression15: TEdit
          Left = 89
          Top = 183
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          Text = '['#27611#37325']*2'
        end
        object EdtExpression16: TEdit
          Left = 89
          Top = 221
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          Text = '['#30382#37325']*2'
        end
        object EdtExpression17: TEdit
          Left = 89
          Top = 258
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
          Text = '['#20928#37325']*2'
        end
        object CBUseExpression18: TCheckBox
          Left = 8
          Top = 297
          Width = 75
          Height = 17
          Caption = #21551#29992#20844#24335
          TabOrder = 21
          OnClick = CBUseExpression18Click
        end
        object EdtExpression18: TEdit
          Left = 89
          Top = 296
          Width = 200
          Height = 21
          Hint = #21487#36755#20837'['#27611#37325'],['#31354#37325'],['#20928#37325']'#31561#39033#30446#13#10#22914':['#27611#37325']*2+['#20928#37325']'#13#10#35831#20351#29992#33521#25991#29366#24577#19979#30340'"[","]","(",")"'
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 22
          Text = '['#37329#39069']*2'
        end
        object BtnSetFormule15: TBitBtn
          Left = 301
          Top = 180
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 14
          OnClick = BtnSetFormule15Click
        end
        object BtnSetFormule16: TBitBtn
          Left = 301
          Top = 218
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 17
          OnClick = BtnSetFormule16Click
        end
        object BtnSetFormule17: TBitBtn
          Left = 301
          Top = 256
          Width = 82
          Height = 25
          Caption = #20844#24335#35774#32622
          Enabled = False
          TabOrder = 20
          OnClick = BtnSetFormule17Click
        end
        object CBRule61: TComboBox
          Left = 393
          Top = 32
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 24
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup6: TComboBox
          Left = 643
          Top = 32
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 25
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule71: TComboBox
          Left = 393
          Top = 70
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 26
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup7: TComboBox
          Left = 643
          Top = 70
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 27
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule81: TComboBox
          Left = 393
          Top = 107
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 28
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup8: TComboBox
          Left = 643
          Top = 107
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 29
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule91: TComboBox
          Left = 393
          Top = 145
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 30
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup9: TComboBox
          Left = 643
          Top = 145
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 31
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule151: TComboBox
          Left = 393
          Top = 182
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 32
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup15: TComboBox
          Left = 643
          Top = 182
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 33
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule161: TComboBox
          Left = 393
          Top = 220
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 34
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup16: TComboBox
          Left = 643
          Top = 220
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 35
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule171: TComboBox
          Left = 393
          Top = 257
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 36
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup17: TComboBox
          Left = 643
          Top = 257
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 37
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule181: TComboBox
          Left = 393
          Top = 295
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 38
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBGroup18: TComboBox
          Left = 643
          Top = 295
          Width = 100
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 39
          Items.Strings = (
            ''
            #32479#35745#36710#27425
            #32479#35745#27611#37325
            #32479#35745#30382#37325
            #32479#35745#20928#37325
            #32479#35745#23454#37325
            #32479#35745#37329#39069
            #32479#35745#22791#29992'6'
            #32479#35745#22791#29992'7'
            #32479#35745#22791#29992'8'
            #32479#35745#22791#29992'9'
            #32479#35745#22791#29992'15'
            #32479#35745#22791#29992'16'
            #32479#35745#22791#29992'17'
            #32479#35745#22791#29992'18')
        end
        object CBRule62: TComboBox
          Left = 513
          Top = 32
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 40
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule72: TComboBox
          Left = 513
          Top = 70
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 41
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule82: TComboBox
          Left = 513
          Top = 107
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 42
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule92: TComboBox
          Left = 513
          Top = 145
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 43
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule152: TComboBox
          Left = 513
          Top = 182
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 44
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule162: TComboBox
          Left = 513
          Top = 220
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 45
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule172: TComboBox
          Left = 513
          Top = 257
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 46
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
        object CBRule182: TComboBox
          Left = 513
          Top = 295
          Width = 120
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 47
          Items.Strings = (
            ''
            #26681#25454#21457#36135#21333#20301
            #26681#25454#25910#36135#21333#20301
            #26681#25454#36135#21517
            #26681#25454#35268#26684
            #26681#25454#22791#29992'1'
            #26681#25454#22791#29992'2'
            #26681#25454#22791#29992'3'
            #26681#25454#22791#29992'4'
            #26681#25454#22791#29992'5'
            #26681#25454#22791#29992'10'
            #26681#25454#22791#29992'11'
            #26681#25454#22791#29992'12'
            #26681#25454#22791#29992'13'
            #26681#25454#22791#29992'14')
        end
      end
    end
  end
  object BtnCancel: TBitBtn
    Left = 640
    Top = 365
    Width = 100
    Height = 35
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 1
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
  object BtnOK: TBitBtn
    Left = 525
    Top = 365
    Width = 100
    Height = 35
    Caption = #24212#29992
    Default = True
    TabOrder = 0
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
  object BtnLoad: TBitBtn
    Left = 280
    Top = 365
    Width = 100
    Height = 35
    Caption = #36733#20837'...'
    TabOrder = 3
    OnClick = BtnLoadClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00344446333334
      44433333FFFF333333FFFF33000033AAA43333332A4333338833F33333883F33
      00003332A46333332A4333333383F33333383F3300003332A2433336A6633333
      33833F333383F33300003333AA463362A433333333383F333833F33300003333
      6AA4462A46333333333833FF833F33330000333332AA22246333333333338333
      33F3333300003333336AAA22646333333333383333F8FF33000033444466AA43
      6A43333338FFF8833F383F330000336AA246A2436A43333338833F833F383F33
      000033336A24AA442A433333333833F33FF83F330000333333A2AA2AA4333333
      333383333333F3330000333333322AAA4333333333333833333F333300003333
      333322A4333333333333338333F333330000333333344A433333333333333338
      3F333333000033333336A24333333333333333833F333333000033333336AA43
      33333333333333833F3333330000333333336663333333333333333888333333
      0000}
    NumGlyphs = 2
  end
  object BtnSaveAs: TBitBtn
    Left = 403
    Top = 365
    Width = 100
    Height = 35
    Caption = #20445#23384#20026'...'
    TabOrder = 4
    OnClick = BtnSaveAsClick
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
      33333333333F8888883F33330000324334222222443333388F3833333388F333
      000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
      F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
      223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
      3338888300003AAAAAAA33333333333888888833333333330000333333333333
      333333333333333333FFFFFF000033333333333344444433FFFF333333888888
      00003A444333333A22222438888F333338F3333800003A2243333333A2222438
      F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
      22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
      33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
      3333333333338888883333330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
end
