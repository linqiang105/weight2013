object DataModuleDB: TDataModuleDB
  OldCreateOrder = False
  Left = 523
  Top = 350
  Height = 183
  Width = 215
  object ADOConnectionDB: TADOConnection
    Left = 80
    Top = 8
  end
  object ADOQueryAddDB: TADOQuery
    Connection = ADOConnectionDB
    Parameters = <>
    Left = 80
    Top = 64
  end
end
