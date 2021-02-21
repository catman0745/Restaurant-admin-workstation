object CreateCheckDataModule: TCreateCheckDataModule
  OldCreateOrder = False
  Height = 173
  Width = 727
  object OpenCheckQuery: TADOQuery
    Connection = MainDataModule.SellingsConnection
    Parameters = <>
    SQL.Strings = (
      'INSERT INTO '#1063#1077#1082#1080' (['#1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103' '#1086#1092#1086#1088#1084#1083#1077#1085#1080#1103'])'
      'VALUES (NOW())')
    Left = 48
    Top = 16
  end
  object DishInCheckQuery: TADOQuery
    Active = True
    Connection = MainDataModule.SellingsConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = #1050#1086#1076#1054#1090#1082#1088#1099#1090#1086#1075#1086#1063#1077#1082#1072
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT '#1053#1072#1079#1074#1072#1085#1080#1077', '#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      'FROM ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077']'
      'INNER JOIN '#1041#1083#1102#1076#1072' ON '#1041#1083#1102#1076#1072'.'#1050#1086#1076' = ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'].'#1041#1083#1102#1076#1086
      'WHERE '#1063#1077#1082' = :'#1050#1086#1076#1054#1090#1082#1088#1099#1090#1086#1075#1086#1063#1077#1082#1072)
    Left = 176
    Top = 16
    object DishInCheckQueryНазвание: TWideStringField
      FieldName = #1053#1072#1079#1074#1072#1085#1080#1077
      Size = 50
    end
    object DishInCheckQueryКоличество: TIntegerField
      FieldName = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
  end
  object DishInCheckDataSource: TDataSource
    DataSet = DishInCheckQuery
    Left = 176
    Top = 64
  end
  object OpenedCheckIdQuery: TADOQuery
    Connection = MainDataModule.SellingsConnection
    Parameters = <>
    SQL.Strings = (
      'SELECT @@IDENTITY AS '#1050#1086#1076
      'FROM '#1063#1077#1082#1080)
    Left = 48
    Top = 64
  end
  object DishInCheckTable: TADOTable
    Active = True
    Connection = MainDataModule.SellingsConnection
    CursorType = ctStatic
    TableName = #1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077
    Left = 312
    Top = 16
    object DishInCheckTableБлюдо: TIntegerField
      FieldName = #1041#1083#1102#1076#1086
    end
    object DishInCheckTableЧек: TIntegerField
      FieldName = #1063#1077#1082
    end
    object DishInCheckTableКоличество: TIntegerField
      FieldName = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
    end
  end
  object DishesTable: TADOTable
    Active = True
    Connection = MainDataModule.SellingsConnection
    CursorType = ctStatic
    TableName = #1041#1083#1102#1076#1072
    Left = 440
    Top = 16
  end
  object DishesDataSource: TDataSource
    DataSet = DishesTable
    Left = 440
    Top = 64
  end
  object DishInCheckDataSource2: TDataSource
    DataSet = DishInCheckTable
    Left = 312
    Top = 64
  end
  object CancelCheckQuery: TADOQuery
    Connection = MainDataModule.SellingsConnection
    Parameters = <
      item
        Name = #1050#1086#1076#1054#1090#1082#1088#1099#1090#1086#1075#1086#1063#1077#1082#1072
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'DELETE FROM '#1063#1077#1082#1080
      'WHERE '#1050#1086#1076' = :'#1050#1086#1076#1054#1090#1082#1088#1099#1090#1086#1075#1086#1063#1077#1082#1072)
    Left = 48
    Top = 120
  end
  object CheckSummaryQuery: TADOQuery
    Connection = MainDataModule.SellingsConnection
    Parameters = <
      item
        Name = 'CheckId'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT CCur(Sum(Round('#1062#1077#1085#1072'*'#1050#1086#1083#1080#1095#1077#1089#1090#1074#1086',2))) AS '#1057#1090#1086#1080#1084#1086#1089#1090#1100
      
        'FROM '#1041#1083#1102#1076#1072' INNER JOIN ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'] ON '#1041#1083#1102#1076#1072'.'#1050#1086#1076' = ['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082 +
        #1077'].'#1041#1083#1102#1076#1086
      'WHERE (((['#1041#1083#1102#1076#1086' '#1074' '#1095#1077#1082#1077'].['#1063#1077#1082'])=:CheckId));')
    Left = 552
    Top = 16
  end
end
