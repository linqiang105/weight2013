object ScanReportForm: TScanReportForm
  Left = 251
  Top = 157
  Width = 870
  Height = 500
  Caption = #35831#20381#27425#25195#25551#30917#21333
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object DBGridEhScan: TDBGridEh
    Left = 0
    Top = 0
    Width = 640
    Height = 473
    Align = alClient
    ColumnDefValues.Title.TitleButton = True
    DataSource = QueryDataModule.WeightMaintainDS
    DynProps = <>
    Flat = True
    FooterRowCount = 1
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    RowSizingAllowed = True
    SortLocal = True
    SumList.Active = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #24207#21495
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #27969#27700#21495
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtCount
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36710#21495
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36807#30917#31867#22411
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #21457#36135#21333#20301
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #25910#36135#21333#20301
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36135#21517
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #35268#26684
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #27611#37325
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #30382#37325
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20928#37325
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #25187#37325
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #23454#37325
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #21333#20215
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #37329#39069
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #25240#26041#31995#25968
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #26041#37327
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #36807#30917#36153
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #27611#37325#21496#30917#21592
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #30382#37325#21496#30917#21592
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #27611#37325#30917#21495
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #30382#37325#30917#21495
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #27611#37325#26102#38388
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #30382#37325#26102#38388
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #19968#27425#36807#30917#26102#38388
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20108#27425#36807#30917#26102#38388
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #26356#26032#20154
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #26356#26032#26102#38388
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#27880
        Footers = <>
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #25171#21360#27425#25968
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #19978#20256#21542
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'1'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'2'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'3'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'4'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'5'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'6'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'7'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'8'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'9'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'10'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'11'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'12'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'13'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'14'
        Footers = <>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'15'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'16'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'17'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #22791#29992'18'
        Footers = <
          item
            Alignment = taCenter
            ValueType = fvtSum
          end>
        Visible = False
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object PTools: TPanel
    Left = 640
    Top = 0
    Width = 222
    Height = 473
    Align = alRight
    BevelInner = bvLowered
    TabOrder = 1
    object BtnPrint: TRzBitBtn
      Left = 2
      Top = 424
      Width = 218
      Height = 47
      Align = alBottom
      Caption = #25171#21360'(&F12)'
      TabOrder = 1
      OnClick = BtnPrintClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000A30E0000A30E00000001000000000000000000003300
        00006600000099000000CC000000FF0000000033000033330000663300009933
        0000CC330000FF33000000660000336600006666000099660000CC660000FF66
        000000990000339900006699000099990000CC990000FF99000000CC000033CC
        000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
        0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
        330000333300333333006633330099333300CC333300FF333300006633003366
        33006666330099663300CC663300FF6633000099330033993300669933009999
        3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
        330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
        66006600660099006600CC006600FF0066000033660033336600663366009933
        6600CC336600FF33660000666600336666006666660099666600CC666600FF66
        660000996600339966006699660099996600CC996600FF99660000CC660033CC
        660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
        6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
        990000339900333399006633990099339900CC339900FF339900006699003366
        99006666990099669900CC669900FF6699000099990033999900669999009999
        9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
        990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
        CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
        CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
        CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
        CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
        CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
        FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
        FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
        FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
        FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
        000000808000800000008000800080800000C0C0C00080808000191919004C4C
        4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
        6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E809E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8090909
        09090909090909E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
        E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8
        E8E8E8E809E8E8E8E8E8E8E8E8E8E8E8E8E8E8E881E8E8E8E8E8E8E8E8E8E8E8
        E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E5E5E
        5EE8E8A378787878787881818181818181E8E8818181818181815ED7D7D7D7D7
        5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D7D7D7D7
        5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D7D7D7D7
        5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D7D7D7D7
        5EE8E8A3D5D5D5D5D57881E8E8E8E8E881E8E881ACACACACAC815ED7D75E5E5E
        5EE8E8A3D5D5A3A3A3A381E8E881818181E8E881ACAC818181815ED7D75EE35E
        E8E8E8A3D5D5A3D678E881E8E881E381E8E8E881ACAC81AC81E85ED7D75E5EE8
        E8E8E8A3D5D5A378E8E881E8E88181E8E8E8E881ACAC8181E8E85E5E5E5EE8E8
        E8E8E8A3A3A3A3E8E8E881818181E8E8E8E8E881818181E8E8E8}
      NumGlyphs = 2
    end
    object LBGlideNos: TListBox
      Left = 2
      Top = 2
      Width = 218
      Height = 398
      Align = alClient
      ItemHeight = 16
      TabOrder = 0
      OnKeyDown = LBGlideNosKeyDown
    end
    object EdtGlideNo: TRzEdit
      Left = 2
      Top = 400
      Width = 218
      Height = 24
      Align = alBottom
      CharCase = ecUpperCase
      FocusColor = clAqua
      TabOrder = 2
      OnKeyDown = EdtGlideNoKeyDown
    end
  end
end
