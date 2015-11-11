object PriceForm: TPriceForm
  Left = 359
  Top = 189
  Width = 593
  Height = 421
  Caption = #23458#25143#20215#26684#32500#25252
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GBShouHuo: TGroupBox
    Left = 0
    Top = 0
    Width = 177
    Height = 394
    Align = alLeft
    Caption = #23458#25143#20449#24687
    TabOrder = 0
    OnDblClick = GBShouHuoDblClick
    object DBGridEhShouHuo: TDBGridEh
      Left = 2
      Top = 15
      Width = 173
      Height = 377
      Align = alClient
      AutoFitColWidths = True
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      RowHeight = 20
      TabOrder = 0
      TitleParams.RowHeight = 20
      OnCellClick = DBGridEhShouHuoCellClick
      Columns = <
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = #25910#36135#21333#20301
          Footers = <>
          Title.Alignment = taCenter
          Width = 128
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object GBPrice: TGroupBox
    Left = 177
    Top = 0
    Width = 408
    Height = 394
    Align = alClient
    Caption = #36135#29289#21333#20215#20449#24687
    TabOrder = 1
    object DBGridEhPrice: TDBGridEh
      Left = 2
      Top = 15
      Width = 404
      Height = 377
      Align = alClient
      AutoFitColWidths = True
      DynProps = <>
      Flat = True
      FooterParams.Color = clWindow
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = PMPrice
      RowHeight = 20
      TabOrder = 0
      TitleParams.RowHeight = 20
      OnDblClick = DBGridEhPriceDblClick
      Columns = <
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = 'goods'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #36135#21517
          Width = 159
        end
        item
          Alignment = taCenter
          DynProps = <>
          EditButtons = <>
          FieldName = 'price'
          Footers = <>
          Title.Alignment = taCenter
          Title.Caption = #21333#20215
          Width = 185
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object PMPrice: TPopupMenu
    Left = 225
    Top = 88
    object N1: TMenuItem
      Caption = #28155#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #21024#38500
      OnClick = N2Click
    end
  end
end
