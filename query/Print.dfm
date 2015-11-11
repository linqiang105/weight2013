object PreviewSetForm: TPreviewSetForm
  Left = 390
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #25171#21360#30917#21333
  ClientHeight = 83
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 14
    Top = 16
    Width = 121
    Height = 17
    AutoSize = False
    Caption = #35831#36755#20837#30917#21333#27969#27700#21495':'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object EdtGlideNo: TEdit
    Left = 137
    Top = 13
    Width = 120
    Height = 21
    TabOrder = 0
  end
  object BitBtnPreview: TBitBtn
    Left = 8
    Top = 48
    Width = 57
    Height = 25
    Caption = #39044#35272
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = BitBtnPreviewClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF003232320032323200323232003232320032323200323232003232
      3200323232003232320032323200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF003232320086868600B6B6B600DADADA00DADADA00DADADA00DADADA00DADA
      DA00DADADA00CECECE003232320000325000007AB900FFFFFF00FFFFFF003232
      3200F2F2F2004A4A4A00B6B6B600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E6009E9E9E0000325000007AB90000629600007AB900323232008686
      86004A4A4A0062626200E6E6E600E6E6E600F2F2F200F2F2F200F2F2F200F2F2
      F2009E9E9E0000325000007AB90048B8FF0000629600FFFFFF0032323200E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600F2F2F200F2F2F2009E9E
      9E0000325000007AB90048B8FF0000629600FFFFFF00FFFFFF0032323200E6E6
      E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E6009E9E9E000032
      5000007AB90048B8FF0000629600FFFFFF00FFFFFF00FFFFFF0032323200E6E6
      E600E6E6E600B1B1FF008E8EFF00CECECE00E6E6E6009E9E9E0000325000007A
      B90048B8FF000062960032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
      E600E6E6E6008E8EFF008E8EFF008E8EFF009E9E9E0000325000007AB90048B8
      FF0000629600CECECE0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
      E6008E8EFF008E8EFF008E8EFF006E6E6E00004A7300007AB90048B8FF000062
      9600E6E6E6008EABFF0032323200FFFFFF00FFFFFF00FFFFFF0032323200B1B1
      FF008E8EFF00DADADA00B1B1FF006E6E6E00D4F0FF0048B8FF0000629600CECE
      CE00CECECE00B1B1FF0032323200FFFFFF00FFFFFF00FFFFFF0032323200B1B1
      FF00DADADA00DADADA00B1B1FF006E6E6E000E0E0E00D4F0FF008E8EFF008E8E
      FF00B1B1FF008EABFF0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
      E600DADADA00DADADA008E8EFF008E8EFF006E6E6E008EABFF00C0C0C0008E8E
      FF008E8EFF00AB8EFF0032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
      E600DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00B1B1FF008E8E
      FF008E8EFF00C2C2C20032323200FFFFFF00FFFFFF00FFFFFF0032323200E6E6
      E600DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00DADADA00B1B1
      FF00B1B1FF00E6E6E60032323200FFFFFF00FFFFFF00FFFFFF0032323200F2F2
      F200E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6E600E6E6
      E600E6E6E600E6E6E60032323200FFFFFF00FFFFFF00FFFFFF00323232003232
      3200323232003232320032323200323232003232320032323200323232003232
      3200323232003232320032323200FFFFFF00FFFFFF00FFFFFF00}
  end
  object BitBtnPrint: TBitBtn
    Left = 72
    Top = 48
    Width = 57
    Height = 25
    Caption = #25171#21360
    ModalResult = 8
    TabOrder = 2
    OnClick = BitBtnPrintClick
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF001A1A1A001A1A1A001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0032323200323232001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFFFF001A1A
      1A001A1A1A008686860086868600565656001A1A1A001A1A1A00FFFFFF003232
      320092929200C2C2C200C2C2C2001A1A1A001A1A1A00FFFFFF001A1A1A008686
      8600868686007A7A7A00868686005656560092929200929292001A1A1A009292
      9200B6B6B600B6B6B600B6B6B600C2C2C200C2C2C2001A1A1A001A1A1A007A7A
      7A007A7A7A007A7A7A0086868600565656009292920092929200323232007A7A
      7A00B6B6B600B6B6B600B6B6B600B6B6B60092929200323232001A1A1A007A7A
      7A00868686008686860062626200B6B6B6009E9E9E009E9E9E003E3E3E003E3E
      3E007A7A7A007A7A7A00B6B6B6009292920032323200FFFFFF001A1A1A007A7A
      7A006E6E6E006E6E6E009292920092929200C2C2C200B6B6B6009E9E9E009E9E
      9E003E3E3E003E3E3E007A7A7A00323232001A1A1A001A1A1A00FFFFFF001A1A
      1A008686860092929200929292001A1A1A001A1A1A0086868600C2C2C200B6B6
      B6009E9E9E009E9E9E003E3E3E0092929200929292001A1A1A00FFFFFF00FFFF
      FF001A1A1A001A1A1A008686860032323200B6B6B6001A1A1A001A1A1A008686
      8600C2C2C200B6B6B6009E9E9E009E9E9E00929292001A1A1A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0032323200DADADA00DADADA00B6B6B600B6B6B6001A1A
      1A001A1A1A0092929200C2C2C200B6B6B6009E9E9E001A1A1A00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0032323200F2F2F200F2F2F200DADADA00DADADA00B6B6
      B600323232009292920000B90000929292001A1A1A00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0032323200F2F2F200F2F2F200F2F2F200F2F2F200DADADA003232
      3200868686004848FF001A1A1A001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0032323200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F2003232
      32001A1A1A001A1A1A00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0032323200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F20032323200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0032323200F2F2F200F2F2F200F2F2F200F2F2F200F2F2F20032323200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF003232320032323200F2F2F200F2F2F20032323200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00323232003232320032323200FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
  end
  object BitBtnMod: TBitBtn
    Left = 136
    Top = 48
    Width = 57
    Height = 25
    Caption = #20462#25913
    ModalResult = 5
    TabOrder = 3
    OnClick = BitBtnModClick
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F21042104210421042104FF7FFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F210429253967734E734E2104FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F2104FF7F9C731863406E406E2104FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F21049C731863406E8049A47E406E2104FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F2104D65A0D7FE05DA47E8049A47E406E2104FF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F2104A07E517FE05DA47E8049A47E406E2104FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7F2104A07E967FE05DA47E8049A47E406E2104FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A07E517FE05DA47E8049A47EC9012104
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A07E967FE05DA47E4C02C901C901
      2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104A07E517FE7024C02E05DE05C
      E05C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104406E6903206DE05C2D7E
      2D7E206D2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F21044C02E05C2D7E005C
      407D206D2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104C97DB17E407D
      407DE05C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F2104206D407D
      E05C2104FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F21042104
      2104FF7FFF7F}
  end
  object BitBtn4: TBitBtn
    Left = 200
    Top = 48
    Width = 57
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 4
    OnClick = BitBtn4Click
    Glyph.Data = {
      42020000424D4202000000000000420000002800000010000000100000000100
      1000030000000002000000000000000000000000000000000000007C0000E003
      00001F000000FF7FFF7F000000000000FF7FFF7FFF7FFF7F00000000FF7FFF7F
      FF7FFF7FFF7FFF7F00006364015C015C0000FF7FFF7F0000005C005C0000FF7F
      FF7FFF7FFF7FFF7F0000E76C6B7D29750000FF7F000042608D7DAD7D85680000
      FF7FFF7FFF7FFF7F00002A758C7DAD7D0871000042606B79AD7DAD7DE76C0000
      FF7FFF7FFF7FFF7F0000E76C6B796B798D7D08716B798C7D8D7D6B7D64640000
      FF7FFF7FFF7FFF7FFF7F0000E76C4A754A796C7D8C7D4A798C7D297564640000
      FF7FFF7FFF7FFF7FFF7FFF7F0000E76C2A754A754A798C7D297564640000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00002975087129752975297564640000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00000871E76C08710871297508710000FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7F00002A75A568E66CE76C0871087163640000
      FF7FFF7FFF7FFF7FFF7FFF7F0000C66CC66CA568C66CC66CC66CE77008714260
      0000FF7FFF7FFF7FFF7FFF7F0000C66CC66C846485682A750871C66CE66CE66C
      42600000FF7FFF7FFF7F00004A75E76C6364C66CE7700000A568E770C66C0871
      42600000FF7FFF7FFF7F00002A75087108710871C66C000000008464E76CE770
      A5680000FF7FFF7FFF7FFF7F00002A75297529750000FF7FFF7F000000000000
      0000FF7FFF7FFF7FFF7FFF7FFF7F000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F}
  end
end