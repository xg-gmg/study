object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 337
  Width = 412
  object MySQLUniProvider1: TMySQLUniProvider
    Left = 48
    Top = 24
  end
  object UniConnection1: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'xgblack'
    SpecificOptions.Strings = (
      'MySQL.UseUnicode=True')
    Username = 'xgblack'
    Server = '149.28.231.167'
    Connected = True
    Left = 48
    Top = 88
    EncryptedPassword = '9DFF87FF95FF9CFF98FFD1FFD1FFCEFFCDFFCCFFD1FFD1FF'
  end
  object UniQuery1: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      'SELECT  "startcityy","startcityx","arrivecityy","arrivecityx" '
      'FROM "hangban" where "takeoffpoint"=:takeoffpoint')
    Left = 88
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'takeoffpoint'
        Value = nil
      end>
  end
  object UniQuery2: TUniQuery
    Connection = UniConnection1
    SQL.Strings = (
      
        'select distinct "startcityy","startcityx","arrivecityy","arrivec' +
        'ityx" from hangban '
      'where ("startcity"=:startcity and "arrivecity"=:arrivecity)')
    Left = 168
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'startcity'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'arrivecity'
        Value = nil
      end>
  end
end
