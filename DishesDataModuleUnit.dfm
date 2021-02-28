object DishesDataModule: TDishesDataModule
  OldCreateOrder = False
  Height = 394
  Width = 569
  object DisplayQuery: TADOQuery
    Active = True
    Connection = MainDataModule.Connection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT '#1041#1083#1102#1076#1072'.'#1050#1086#1076', '#1041#1083#1102#1076#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077', CCur('#1041#1083#1102#1076#1072'.'#1062#1077#1085#1072') AS '#1062#1077#1085#1072
      'FROM '#1041#1083#1102#1076#1072
      'ORDER BY '#1041#1083#1102#1076#1072'.'#1053#1072#1079#1074#1072#1085#1080#1077)
    Left = 48
    Top = 16
  end
  object DisplayDataSource: TDataSource
    DataSet = DisplayQuery
    Left = 48
    Top = 64
  end
  object AddQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Price'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'INSERT INTO '#1041#1083#1102#1076#1072'('#1053#1072#1079#1074#1072#1085#1080#1077', '#1062#1077#1085#1072')'
      'VALUES (:Name, :Price)')
    Left = 216
    Top = 8
  end
  object UpdateQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'Name'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'Price'
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
      'UPDATE '#1041#1083#1102#1076#1072
      'SET '#1053#1072#1079#1074#1072#1085#1080#1077' = :Name,'
      '       '#1062#1077#1085#1072' = :Price'
      'WHERE '#1050#1086#1076' = :Id'
      '')
    Left = 216
    Top = 56
  end
  object DeleteQuery: TADOQuery
    Connection = MainDataModule.Connection
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
      'DELETE FROM '#1041#1083#1102#1076#1072
      'WHERE '#1050#1086#1076' = :Id')
    Left = 216
    Top = 104
  end
  object NameAvailabilityCheckQuery: TADOQuery
    Connection = MainDataModule.Connection
    Parameters = <
      item
        Name = 'Name'
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
      'SELECT Count(*) AS ['#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1083#1102#1076' '#1089' '#1090#1072#1082#1080#1084' '#1085#1072#1079#1074#1072#1085#1080#1077#1084']'
      'FROM '#1041#1083#1102#1076#1072
      'WHERE '#1053#1072#1079#1074#1072#1085#1080#1077' = :Name'
      '     AND '#1050#1086#1076' <> :ExceptionId')
    Left = 328
    Top = 8
  end
end
