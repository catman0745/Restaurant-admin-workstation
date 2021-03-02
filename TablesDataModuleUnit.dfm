object TablesDataModule: TTablesDataModule
  OldCreateOrder = False
  Height = 173
  Width = 512
  object TablesDataSource: TDataSource
    DataSet = TablesQuery
    Left = 40
    Top = 56
  end
  object AddQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'TableNumber'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO '#1057#1090#1086#1083#1080#1082#1080'('#1053#1086#1084#1077#1088')'
      'VALUES(:TableNumber)')
    Left = 200
    Top = 8
  end
  object UpdateQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'TableNumber'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'TableId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'UPDATE '#1057#1090#1086#1083#1080#1082#1080
      'SET '#1053#1086#1084#1077#1088' = :TableNumber'
      'WHERE '#1050#1086#1076' = :TableId')
    Left = 200
    Top = 56
  end
  object DeleteQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'TableId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM '#1057#1090#1086#1083#1080#1082#1080
      'WHERE '#1050#1086#1076' = :TableId')
    Left = 200
    Top = 104
  end
  object TableNumberUniquenessCheckQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'TableNumber'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ExceptionId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Count(*) AS ['#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1090#1086#1083#1080#1082#1086#1074' '#1089' '#1090#1072#1082#1080#1084' '#1085#1086#1084#1077#1088#1086#1084']'
      'FROM '#1057#1090#1086#1083#1080#1082#1080
      'WHERE '#1053#1086#1084#1077#1088' = :TableNumber'
      '     AND '#1050#1086#1076' <> :ExceptionId')
    Left = 376
    Top = 48
  end
  object TablesQuery: TADOQuery
    Active = True
    Connection = MainDataModule.Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM '#1057#1090#1086#1083#1080#1082#1080
      'ORDER BY '#1053#1086#1084#1077#1088)
    Left = 40
    Top = 8
  end
end
