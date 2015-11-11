object PayForm: TPayForm
  Left = 305
  Top = 168
  BorderStyle = bsDialog
  Caption = #20805#20540
  ClientHeight = 441
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEhShouHuo: TDBGridEh
    Left = 0
    Top = 0
    Width = 568
    Height = 441
    Align = alClient
    DynProps = <>
    Flat = True
    FooterParams.Color = clWindow
    IndicatorOptions = [gioShowRowIndicatorEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    OnCellClick = DBGridEhShouHuoCellClick
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20195#30721
        Footers = <>
        Title.Alignment = taCenter
        Width = 77
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #25910#36135#21333#20301
        Footers = <>
        Title.Alignment = taCenter
        Width = 296
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #24403#21069#37329#39069
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = #20449#29992#39069#24230
        Footers = <>
        Title.Alignment = taCenter
        Width = 80
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object Panel1: TPanel
    Left = 568
    Top = 0
    Width = 153
    Height = 441
    Align = alRight
    TabOrder = 1
    object BtnOk: TButton
      Left = 40
      Top = 216
      Width = 75
      Height = 25
      Caption = #20805#20540
      TabOrder = 0
      OnClick = BtnOkClick
    end
    object BtnCancel: TButton
      Left = 40
      Top = 256
      Width = 75
      Height = 25
      Caption = #21462#28040
      TabOrder = 1
      OnClick = BtnCancelClick
    end
    object LECode: TLabeledEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = #20195#30721'       '
      ReadOnly = True
      TabOrder = 2
    end
    object LEShouHuo: TLabeledEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = #25910#36135#21333#20301'      '
      ReadOnly = True
      TabOrder = 3
    end
    object LESum: TLabeledEdit
      Left = 16
      Top = 120
      Width = 121
      Height = 21
      EditLabel.Width = 42
      EditLabel.Height = 13
      EditLabel.Caption = #20313#39069'      '
      ReadOnly = True
      TabOrder = 4
    end
    object LECredit: TLabeledEdit
      Left = 16
      Top = 168
      Width = 121
      Height = 21
      EditLabel.Width = 66
      EditLabel.Height = 13
      EditLabel.Caption = #20449#29992#39069#24230'      '
      ReadOnly = True
      TabOrder = 5
    end
  end
end
