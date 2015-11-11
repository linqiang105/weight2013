object TicketSetForm: TTicketSetForm
  Left = 203
  Top = 111
  Width = 911
  Height = 580
  Caption = #30917#21333#35774#32622
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object frxPreview1: TfrxPreview
    Left = 206
    Top = 16
    Width = 712
    Height = 121
    OutlineVisible = True
    OutlineWidth = 121
    ThumbnailVisible = False
    UseReportHints = True
  end
  object LBTicket: TListBox
    Left = 0
    Top = 0
    Width = 200
    Height = 426
    Align = alLeft
    ItemHeight = 13
    TabOrder = 1
    OnClick = LBTicketClick
  end
  object PTool: TPanel
    Left = 0
    Top = 426
    Width = 921
    Height = 111
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 2
    object EdtPOTicket: TLabeledEdit
      Left = 88
      Top = 8
      Width = 800
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #37319#36141#36807#30917#21333' '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 0
    end
    object EdtSOTicket: TLabeledEdit
      Left = 88
      Top = 32
      Width = 800
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #38144#21806#36807#30917#21333' '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 1
    end
    object EdtIOTicket: TLabeledEdit
      Left = 88
      Top = 56
      Width = 800
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #20869#37096#36807#30917#21333' '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 2
    end
    object EdtOOTicket: TLabeledEdit
      Left = 88
      Top = 80
      Width = 800
      Height = 21
      EditLabel.Width = 72
      EditLabel.Height = 13
      EditLabel.Caption = #20854#23427#36807#30917#21333' '
      LabelPosition = lpLeft
      ReadOnly = True
      TabOrder = 3
    end
  end
  object RMPreview1: TRMPreview
    Left = 216
    Top = 168
    Width = 705
    Height = 209
    BevelOuter = bvLowered
    Caption = 'Insert After'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Options.RulerUnit = rmutScreenPixels
    Options.RulerVisible = False
    Options.DrawBorder = False
    Options.BorderPen.Color = clGray
    Options.BorderPen.Style = psDash
  end
  object PMModify: TPopupMenu
    Left = 40
    Top = 32
    object N1: TMenuItem
      Caption = #35774#32622#20026#37319#36141#36807#30917#21333
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #35774#32622#20026#38144#21806#36807#30917#21333
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #35774#32622#20026#20869#37096#36807#30917#21333
      OnClick = N3Click
    end
    object N6: TMenuItem
      Caption = #35774#32622#20026#20854#20182#36807#30917#21333
      OnClick = N6Click
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object NSetDefault: TMenuItem
      Caption = #35774#32622#20026#40664#35748#30917#21333
      OnClick = NSetDefaultClick
    end
    object NModifyTicket: TMenuItem
      Caption = #20462#25913#30917#21333
      OnClick = NModifyTicketClick
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object NOpenDir: TMenuItem
      Caption = #25171#24320#30917#21333#30446#24405
      OnClick = NOpenDirClick
    end
  end
end
