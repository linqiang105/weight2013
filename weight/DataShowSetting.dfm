object DataShowSettingForm: TDataShowSettingForm
  Left = 411
  Top = 196
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #26174#31034#23383#27573#35774#32622
  ClientHeight = 392
  ClientWidth = 327
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PBack: TPanel
    Left = 0
    Top = 0
    Width = 327
    Height = 392
    Align = alClient
    BevelInner = bvLowered
    BorderStyle = bsSingle
    TabOrder = 0
    object SBHide: TSpeedButton
      Left = 150
      Top = 120
      Width = 23
      Height = 22
      Caption = '=>'
      Flat = True
      OnClick = SBHideClick
    end
    object SBShow: TSpeedButton
      Left = 150
      Top = 176
      Width = 23
      Height = 22
      Caption = '<='
      Flat = True
      OnClick = SBShowClick
    end
    object PTool: TPanel
      Left = 2
      Top = 344
      Width = 319
      Height = 42
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 0
      object lblFix: TLabel
        Left = 8
        Top = 16
        Width = 57
        Height = 14
        AutoSize = False
        Caption = #24038#36793#22266#23450
      end
      object lblCol: TLabel
        Left = 109
        Top = 17
        Width = 25
        Height = 13
        AutoSize = False
        Caption = #21015
      end
      object BitBtnOK: TBitBtn
        Left = 152
        Top = 9
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = BitBtnOKClick
        Kind = bkOK
      end
      object BitBtnCancel: TBitBtn
        Left = 240
        Top = 9
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        Kind = bkCancel
      end
      object SEFrozenCol: TSpinEdit
        Left = 64
        Top = 11
        Width = 41
        Height = 22
        MaxLength = 10
        MaxValue = 10
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
    end
    object GBVisible: TGroupBox
      Left = 2
      Top = 2
      Width = 143
      Height = 342
      Align = alLeft
      Caption = #21487#35265#39033
      TabOrder = 1
      object LBVisibleCol: TListBox
        Left = 2
        Top = 15
        Width = 139
        Height = 325
        Align = alClient
        DragMode = dmAutomatic
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = LBVisibleColDblClick
      end
    end
    object GBValid: TGroupBox
      Left = 176
      Top = 2
      Width = 145
      Height = 342
      Align = alRight
      Caption = #21487#29992#39033
      TabOrder = 2
      object LBValidCol: TListBox
        Left = 2
        Top = 15
        Width = 141
        Height = 325
        Align = alClient
        DragMode = dmAutomatic
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = LBValidColDblClick
      end
    end
  end
end
