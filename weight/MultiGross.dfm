object MultiGrossForm: TMultiGrossForm
  Left = 267
  Top = 286
  Width = 700
  Height = 225
  Caption = #35831#21452#20987#36873#25321
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEhMulti: TDBGridEh
    Left = 0
    Top = 0
    Width = 692
    Height = 198
    Align = alClient
    ColumnDefValues.Title.TitleButton = True
    DataSource = QueryDataModule.WeightMaintainDS
    DynProps = <>
    Flat = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    RowSizingAllowed = True
    ShowHint = False
    SortLocal = True
    TabOrder = 0
    TitleParams.MultiTitle = True
    OnDblClick = DBGridEhMultiDblClick
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
end
