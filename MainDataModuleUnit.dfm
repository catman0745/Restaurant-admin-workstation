object MainDataModule: TMainDataModule
  OldCreateOrder = False
  Height = 425
  Width = 812
  object Connection: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source='#1056#1077#1089#1090#1086#1088#1072#1085'.mdb;Persis' +
      't Security Info=False'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 48
    Top = 24
  end
  object DisplayTablesQuery: TADOQuery
    Active = True
    Connection = Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT'
      '        '#1050#1086#1076','
      '        '#1057#1090#1086#1083#1080#1082#1080'.'#1053#1086#1084#1077#1088','
      '        Iif('
      '                ['#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072'] <> NULL,'
      
        '                '#39#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072' '#39' & Format(['#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072 +
        '], '#39'hh:MM'#39'),'
      '                Iif('#1047#1072#1085#1103#1090', '#39#1047#1072#1085#1103#1090#39', '#39#1057#1074#1086#1073#1086#1076#1077#1085#39')'
      '        ) AS '#1057#1090#1072#1090#1091#1089
      'FROM '#1057#1090#1086#1083#1080#1082#1080
      'ORDER BY '#1057#1090#1086#1083#1080#1082#1080'.'#1053#1086#1084#1077#1088)
    Left = 168
    Top = 24
  end
  object DisplayTablesDataSource: TDataSource
    DataSet = DisplayTablesQuery
    Left = 168
    Top = 72
  end
  object ReserveTableQuery: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'Time'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE '#1057#1090#1086#1083#1080#1082#1080
      'SET ['#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072'] = :Time,'
      '       '#1047#1072#1085#1103#1090' = False'
      'WHERE '#1050#1086#1076' = :Id')
    Left = 344
    Top = 16
  end
  object OccupyTableQuery: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE '#1057#1090#1086#1083#1080#1082#1080
      'SET ['#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072'] = Null,'
      '       '#1047#1072#1085#1103#1090' = True'
      'WHERE '#1050#1086#1076' = :Id'
      '')
    Left = 344
    Top = 64
  end
  object EmptyTableQuery: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE '#1057#1090#1086#1083#1080#1082#1080
      'SET ['#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072'] = Null,'
      '       '#1047#1072#1085#1103#1090' = False'
      'WHERE '#1050#1086#1076' = :Id'
      '')
    Left = 344
    Top = 112
  end
  object TableStatusQuery: TADOQuery
    Connection = Connection
    Parameters = <
      item
        Name = 'Id'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Iif(['#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085' '#1085#1072'] <> NULL, '#39#1047#1072#1088#1077#1079#1077#1088#1074#1080#1088#1086#1074#1072#1085#39', Iif('#1047#1072 +
        #1085#1103#1090', '#39#1047#1072#1085#1103#1090#39', '#39#1057#1074#1086#1073#1086#1076#1077#1085#39')) AS '#1057#1090#1072#1090#1091#1089
      'FROM '#1057#1090#1086#1083#1080#1082#1080
      'WHERE '#1050#1086#1076' = :Id'
      '')
    Left = 344
    Top = 160
  end
end
