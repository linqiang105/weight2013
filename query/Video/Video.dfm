object VideoForm: TVideoForm
  Left = 492
  Top = 71
  Width = 370
  Height = 554
  BorderIcons = [biSystemMenu]
  BorderWidth = 1
  Caption = #35270#39057#31383#20307
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PMVideoType
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object VideoPanel4: TPanel
    Left = 176
    Top = 144
    Width = 160
    Height = 120
    Color = clBlack
    TabOrder = 3
    OnDblClick = VideoPanel4DblClick
    OnMouseDown = VideoPanel1MouseDown
  end
  object VideoPanel1: TPanel
    Left = 8
    Top = 8
    Width = 160
    Height = 120
    Color = clBlack
    TabOrder = 0
    OnDblClick = VideoPanel1DblClick
    OnMouseDown = VideoPanel1MouseDown
  end
  object VideoPanel2: TPanel
    Left = 176
    Top = 8
    Width = 160
    Height = 120
    Color = clBlack
    TabOrder = 1
    OnDblClick = VideoPanel2DblClick
    OnMouseDown = VideoPanel1MouseDown
  end
  object VideoPanel3: TPanel
    Left = 8
    Top = 144
    Width = 160
    Height = 120
    Color = clBlack
    TabOrder = 2
    OnDblClick = VideoPanel3DblClick
    OnMouseDown = VideoPanel1MouseDown
  end
  object PMVideoType: TPopupMenu
    Left = 192
    Top = 96
    object N11: TMenuItem
      Caption = '1*1'
      OnClick = N11Click
    end
    object N21: TMenuItem
      Caption = '1*2'
      OnClick = N21Click
    end
    object N31: TMenuItem
      Caption = '1*3'
      OnClick = N31Click
    end
    object N41: TMenuItem
      Caption = '1*4'
      OnClick = N41Click
    end
    object N211: TMenuItem
      Caption = '2*1'
      OnClick = N211Click
    end
    object N221: TMenuItem
      Caption = '2*2'
      OnClick = N221Click
    end
    object N311: TMenuItem
      Caption = '3*1'
      OnClick = N311Click
    end
    object N411: TMenuItem
      Caption = '4*1'
      OnClick = N411Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Caption = #25293#29031
      OnClick = N3Click
    end
  end
  object PropStorageEh1: TPropStorageEh
    StorageManager = IniPropStorageManEh1
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width')
    Left = 48
    Top = 48
  end
  object IniPropStorageManEh1: TIniPropStorageManEh
    Left = 48
    Top = 104
  end
  object TResize: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TResizeTimer
    Left = 256
    Top = 192
  end
end
