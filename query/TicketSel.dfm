object TicketSelForm: TTicketSelForm
  Left = 524
  Top = 209
  BorderStyle = bsNone
  Caption = #30917#21333#36873#25321
  ClientHeight = 373
  ClientWidth = 192
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object LBTicket: TListBox
    Left = 0
    Top = 0
    Width = 192
    Height = 373
    Hint = #21452#20987#36873#25321#30917#21333#26684#24335#20197#20851#38381#31383#21475
    Style = lbOwnerDrawFixed
    Align = alClient
    ItemHeight = 30
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDblClick = LBTicketDblClick
  end
end
